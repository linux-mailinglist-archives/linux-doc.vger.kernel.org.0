Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8814823AF8A
	for <lists+linux-doc@lfdr.de>; Mon,  3 Aug 2020 23:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729217AbgHCVO7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Aug 2020 17:14:59 -0400
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:22592 "EHLO
        smtp-fw-33001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbgHCVOz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Aug 2020 17:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1596489294; x=1628025294;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=A9YeFP9lUcJ4Il7shxNgntYRt+kEhRaIhYpWYV0cPJ0=;
  b=J1+kXVUQLiFhSSstL55tYHEXdYCwW/MRwYZ8PeIIF6YuRK3/9+T7zR8e
   ZpUchcIeeKJTWXkS8NHWdrx70G0Kqx+qpbv/T+B9qP/+xpEls9nwgPLlL
   QMKj0Ls0Tu/gdiF4nwL5T/yJzJrFjXhoQgkZG2loSgvjPDT5x1ExCBtmr
   4=;
IronPort-SDR: 0MUbpDfmLkGtC4er2il2s+Yd9ppFbgY98rd66QIbjUNRSq7kxydYQmSdoltQzGDv9cogKeNmHx
 sWyiZB3kMncg==
X-IronPort-AV: E=Sophos;i="5.75,431,1589241600"; 
   d="scan'208";a="63982103"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP; 03 Aug 2020 21:14:39 +0000
Received: from EX13MTAUWC001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
        by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS id 20832A1E72;
        Mon,  3 Aug 2020 21:14:34 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 3 Aug 2020 21:14:34 +0000
Received: from u79c5a0a55de558.ant.amazon.com (10.43.161.145) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 3 Aug 2020 21:14:31 +0000
From:   Alexander Graf <graf@amazon.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
CC:     Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        "Joerg Roedel" <joro@8bytes.org>,
        KarimAllah Raslan <karahmed@amazon.de>,
        Aaron Lewis <aaronlewis@google.com>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/3] Allow user space to restrict and augment MSR emulation
Date:   Mon, 3 Aug 2020 23:14:20 +0200
Message-ID: <20200803211423.29398-1-graf@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.145]
X-ClientProxiedBy: EX13D36UWB001.ant.amazon.com (10.43.161.84) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While tying to add support for the MSR_CORE_THREAD_COUNT MSR in KVM,
I realized that we were still in a world where user space has no control
over what happens with MSR emulation in KVM.

That is bad for multiple reasons. In my case, I wanted to emulate the
MSR in user space, because it's a CPU specific register that does not
exist on older CPUs and that really only contains informational data that
is on the package level, so it's a natural fit for user space to provide
it.

However, it is also bad on a platform compatibility level. Currrently,
KVM has no way to expose different MSRs based on the selected target CPU
type.

This patch set introduces a way for user space to indicate to KVM which
MSRs should be handled in kernel space. With that, we can solve part of
the platform compatibility story. Or at least we can not handle AMD specific
MSRs on an Intel platform and vice versa.

In addition, it introduces a way for user space to get into the loop
when an MSR access would generate a #GP fault, such as when KVM finds an
MSR that is not handled by the in-kernel MSR emulation or when the guest
is trying to access reserved registers.

In combination with the allow list, the user space trapping allows us
to emulate arbitrary MSRs in user space, paving the way for target CPU
specific MSR implementations from user space.

v1 -> v2:

  - s/ETRAP_TO_USER_SPACE/ENOENT/g
  - deflect all #GP injection events to user space, not just unknown MSRs.
    That was we can also deflect allowlist errors later
  - fix emulator case
  - new patch: KVM: x86: Introduce allow list for MSR emulation
  - new patch: KVM: selftests: Add test for user space MSR handling

v2 -> v3:

  - return r if r == X86EMUL_IO_NEEDED
  - s/KVM_EXIT_RDMSR/KVM_EXIT_X86_RDMSR/g
  - s/KVM_EXIT_WRMSR/KVM_EXIT_X86_WRMSR/g
  - Use complete_userspace_io logic instead of reply field
  - Simplify trapping code
  - document flags for KVM_X86_ADD_MSR_ALLOWLIST
  - generalize exit path, always unlock when returning
  - s/KVM_CAP_ADD_MSR_ALLOWLIST/KVM_CAP_X86_MSR_ALLOWLIST/g
  - Add KVM_X86_CLEAR_MSR_ALLOWLIST
  - Add test to clear whitelist
  - Adjust to reply-less API
  - Fix asserts
  - Actually trap on MSR_IA32_POWER_CTL writes

v3 -> v4:

  - Mention exit reasons in re-enter mandatory section of API documentation
  - Clear padding bytes
  - Generalize get/set deflect functions
  - Remove redundant pending_user_msr field
  - lock allow check and clearing
  - free bitmaps on clear

Alexander Graf (3):
  KVM: x86: Deflect unknown MSR accesses to user space
  KVM: x86: Introduce allow list for MSR emulation
  KVM: selftests: Add test for user space MSR handling

 Documentation/virt/kvm/api.rst                | 157 ++++++++++-
 arch/x86/include/asm/kvm_host.h               |  13 +
 arch/x86/include/uapi/asm/kvm.h               |  15 +
 arch/x86/kvm/emulate.c                        |  18 +-
 arch/x86/kvm/x86.c                            | 259 +++++++++++++++++-
 include/trace/events/kvm.h                    |   2 +-
 include/uapi/linux/kvm.h                      |  15 +
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/x86_64/user_msr_test.c      | 221 +++++++++++++++
 9 files changed, 692 insertions(+), 9 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86_64/user_msr_test.c

-- 
2.17.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



