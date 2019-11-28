Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF4710CF25
	for <lists+linux-doc@lfdr.de>; Thu, 28 Nov 2019 21:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfK1UYC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 28 Nov 2019 15:24:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47926 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726565AbfK1UYC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Nov 2019 15:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574972640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=XqTwc5ebz6tenvnG6zkONwdSyh0ZcAJ7/GPADSmX7as=;
        b=daj/EdjYZyauOID1QtsTH6Bw5IeoGciF4aqx6kxqUUi+1fyUlrX/ZSyUOAbs5BOVkN/24T
        +u4PeeZYCPhA8rgl0LCAYGQigo8Pyj96oPiYgoc5Khmbl4Fx00UqaB8jxjc2tnTcwZmOX/
        ug1agBcZRNtQNttTHz4vwLWEcTecZBA=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-oL4xZPWLMcmaf1YiqI8T9w-1; Thu, 28 Nov 2019 15:23:57 -0500
Received: by mail-pg1-f198.google.com with SMTP id k7so15222112pgq.10
        for <linux-doc@vger.kernel.org>; Thu, 28 Nov 2019 12:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GPEyz/IHgt6mAW0R3tmNHtqBX2Y5bDBhF2H/Q45W8jA=;
        b=l2PqhEuCbjY45SVDfHEhVe55+x8i2PvxarUk7hLxlAGdFeCmQg9s5XD9olvGtSLnmg
         9ZGDjWch4aLiiYV5Ow2hKgWUvVtY14CBcku5qWQ/57Cdh8Ra8OP0Yy9txA2fLmAx2dFU
         0mAOY29/h9RFOPZ79JTcbSOidmeXn4Kac+soIOPXBRLHZQXunCWYljTeXSdxew1imiKD
         c9lVsM58KFg9m6BkI/Dvin0U/odp/UXZUsMZQO3aIpmE4Ar2Ql4PJjkB9+DrhKVz1gcZ
         Ad/3vuf5aUSkdgUcky705ZWn/ACDRkFahu5GH+6UKY0fBZXOlMKe7z9UQl4HDIEi9QgI
         Q9ug==
X-Gm-Message-State: APjAAAV8r8GVfC8nWUVqzTHGOGx33xRpdAzJ6C3dLZtRyL68FgB0Gqlc
        jEIUjlOrgi+T+hJPde9xdhQmBn2Sjn7xqcgU4GVNgPp1vGXKddiyijdYqGYZnhFXP/LyKEtwIJ2
        QkBcvA2n392RCJXvjpYec
X-Received: by 2002:a17:90b:3109:: with SMTP id gc9mr9966529pjb.30.1574972636141;
        Thu, 28 Nov 2019 12:23:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwLgmQBIVDgB8JTDBBuFEwN/117Vx9qIR4Jgevr8C1kD585Wc5/+quQsfVlRjSD579x56aJyQ==
X-Received: by 2002:a17:90b:3109:: with SMTP id gc9mr9966493pjb.30.1574972635767;
        Thu, 28 Nov 2019 12:23:55 -0800 (PST)
Received: from localhost ([122.177.85.74])
        by smtp.gmail.com with ESMTPSA id a15sm2778299pfh.169.2019.11.28.12.23.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Nov 2019 12:23:54 -0800 (PST)
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
Subject: [PATCH v5 0/5] Append new variables to vmcoreinfo (TCR_EL1.T1SZ for arm64 and MAX_PHYSMEM_BITS for all archs)
Date:   Fri, 29 Nov 2019 01:53:36 +0530
Message-Id: <1574972621-25750-1-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
X-MC-Unique: oL4xZPWLMcmaf1YiqI8T9w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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

