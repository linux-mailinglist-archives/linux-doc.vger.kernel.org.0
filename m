Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 795D510DA1C
	for <lists+linux-doc@lfdr.de>; Fri, 29 Nov 2019 20:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfK2T3Q (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 29 Nov 2019 14:29:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58013 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726926AbfK2T3Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Nov 2019 14:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575055755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=A1Y9WHtaAY4UzSoPOoSv2m/ifwl+YEceF+RKR3CTCTk=;
        b=NsNuYhzTwVrLZGhNE92K/yThH8xyDn4F0g0etJql25ITsUHIulxGVpy4EB+Yt+osFYn3KD
        aqCUy1uio9gvNOu4N+0nk+VFCbF1aZkWVPXjTYvoOQm7dLe6yuMg91D9LkPZut//1P9WW9
        c26hybJFl8zFXPC52oFbkbyqNiOnqQw=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-3XpLE9GhPGO4hO6kzEwsRw-1; Fri, 29 Nov 2019 14:29:13 -0500
Received: by mail-pl1-f197.google.com with SMTP id a11so13194811plp.21
        for <linux-doc@vger.kernel.org>; Fri, 29 Nov 2019 11:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+RGhDPWZi/m+uC+dFG9W5dCj6ubdgxgz1OjCUZFmMIs=;
        b=eaMoHBOPusfM3gbi1Tf+tmvF59iTp/CEjsUVX9cFEbcAhqMCUr4tAJMj9TR9kpLi0O
         Q2njdzvTTU4QQtOZuAHJRGRL1PM9CCs+8bdUjAuJtli2Zbs1cye0fB9yE28VowN1IyqX
         F515TnIliNke4yQK0hdX4omihkd7LIwNB+JUj8zslxmvse3fzKzxQ0NEa6Lq3nB2HI2p
         DjAs99h26QnMYfH2DxfahAdfBSSyjIwP8R9kwYGKygYx0o6k8AxHThXL/gmEtA8q55c/
         fUcnnOkKWF/lsOHKIJeAefrd5UOfngkp/+IWvAZN3nNS7XQVFgjBFsrHuGq7nnF7ENhY
         AJwQ==
X-Gm-Message-State: APjAAAWpXdlBrajyqLDFRamH56DAGjgXH/Olmn0WCA2I1pIscue6w5QY
        8Gm7yqQfH93y7xOJNOa2ER9jxyc3BkiNfQhdOSF1OzbGeeJoIdhizgLb4G8oTlx6F7A5UoVdG1H
        eh4Zz7nzXJ+f7p4rDJw3J
X-Received: by 2002:a17:90a:b38c:: with SMTP id e12mr20373955pjr.89.1575055752561;
        Fri, 29 Nov 2019 11:29:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqxbsJq68B0VFjsjCP+XCq0F6XFF9siQwhdXf0KacvnZ7i830WNBU2oxnas4e3iBnGfWl5c1rw==
X-Received: by 2002:a17:90a:b38c:: with SMTP id e12mr20373930pjr.89.1575055752286;
        Fri, 29 Nov 2019 11:29:12 -0800 (PST)
Received: from localhost ([122.177.85.74])
        by smtp.gmail.com with ESMTPSA id k10sm14560656pjs.31.2019.11.29.11.29.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Nov 2019 11:29:11 -0800 (PST)
From:   Bhupesh Sharma <bhsharma@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     bhsharma@redhat.com, bhupesh.linux@gmail.com, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org, Boris Petkov <bp@alien8.de>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morse <james.morse@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>,
        Steve Capper <steve.capper@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Dave Anderson <anderson@redhat.com>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Subject: [RESEND PATCH v5 0/5] Append new variables to vmcoreinfo (TCR_EL1.T1SZ for arm64 and MAX_PHYSMEM_BITS for all archs)
Date:   Sat, 30 Nov 2019 00:58:41 +0530
Message-Id: <1575055726-23464-1-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
X-MC-Unique: 3XpLE9GhPGO4hO6kzEwsRw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Resending the v5 version as Will Deacon reported that the patchset was
  split into two seperate threads while sending out. It was an issue
  with my 'msmtp' settings which is now fixed.

Changes since v4:
----------------
- v4 can be seen here:
  http://lists.infradead.org/pipermail/kexec/2019-November/023961.html
- Addressed comments from Dave and added patches for documenting
  new variables appended to vmcoreinfo documentation.
- Added testing report shared by Akashi for PATCH 2/5.

Changes since v3:
----------------
- v3 can be seen here:
  http://lists.infradead.org/pipermail/kexec/2019-March/022590.html
- Addressed comments from James and exported TCR_EL1.T1SZ in vmcoreinfo
  instead of PTRS_PER_PGD.
- Added a new patch (via [PATCH 3/3]), which fixes a simple typo in
  'Documentation/arm64/memory.rst'

Changes since v2:
----------------
- v2 can be seen here:
  http://lists.infradead.org/pipermail/kexec/2019-March/022531.html
- Protected 'MAX_PHYSMEM_BITS' vmcoreinfo variable under CONFIG_SPARSEMEM
  ifdef sections, as suggested by Kazu.
- Updated vmcoreinfo documentation to add description about
  'MAX_PHYSMEM_BITS' variable (via [PATCH 3/3]).

Changes since v1:
----------------
- v1 was sent out as a single patch which can be seen here:
  http://lists.infradead.org/pipermail/kexec/2019-February/022411.html

- v2 breaks the single patch into two independent patches:
  [PATCH 1/2] appends 'PTRS_PER_PGD' to vmcoreinfo for arm64 arch, whereas
  [PATCH 2/2] appends 'MAX_PHYSMEM_BITS' to vmcoreinfo in core kernel code =
(all archs)

This patchset primarily fixes the regression reported in user-space
utilities like 'makedumpfile' and 'crash-utility' on arm64 architecture
with the availability of 52-bit address space feature in underlying
kernel. These regressions have been reported both on CPUs which don't
support ARMv8.2 extensions (i.e. LVA, LPA) and are running newer kernels
and also on prototype platforms (like ARMv8 FVP simulator model) which
support ARMv8.2 extensions and are running newer kernels.

The reason for these regressions is that right now user-space tools
have no direct access to these values (since these are not exported
from the kernel) and hence need to rely on a best-guess method of
determining value of 'vabits_actual' and 'MAX_PHYSMEM_BITS' supported
by underlying kernel.

Exporting these values via vmcoreinfo will help user-land in such cases.
In addition, as per suggestion from makedumpfile maintainer (Kazu),
it makes more sense to append 'MAX_PHYSMEM_BITS' to
vmcoreinfo in the core code itself rather than in arm64 arch-specific
code, so that the user-space code for other archs can also benefit from
this addition to the vmcoreinfo and use it as a standard way of
determining 'SECTIONS_SHIFT' value in user-land.

Cc: Boris Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: James Morse <james.morse@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Dave Anderson <anderson@redhat.com>
Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Cc: x86@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: kexec@lists.infradead.org

Bhupesh Sharma (5):
  crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
  arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
  Documentation/arm64: Fix a simple typo in memory.rst
  Documentation/vmcoreinfo: Add documentation for 'MAX_PHYSMEM_BITS'
  Documentation/vmcoreinfo: Add documentation for 'TCR_EL1.T1SZ'

 Documentation/admin-guide/kdump/vmcoreinfo.rst | 11 +++++++++++
 Documentation/arm64/memory.rst                 |  2 +-
 arch/arm64/include/asm/pgtable-hwdef.h         |  1 +
 arch/arm64/kernel/crash_core.c                 |  9 +++++++++
 kernel/crash_core.c                            |  1 +
 5 files changed, 23 insertions(+), 1 deletion(-)

--=20
2.7.4

