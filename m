Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56D1310CF2C
	for <lists+linux-doc@lfdr.de>; Thu, 28 Nov 2019 21:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbfK1UZe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 28 Nov 2019 15:25:34 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56327 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726565AbfK1UZe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Nov 2019 15:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574972732;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=wgbAkKrJxLS1NEOR+82/qBcYhhrIFUtkNwc9k9kwPFE=;
        b=NH9o+PeIGKzZokpvd+R3AsXhTkePCmIcylpQPtfxBq4rHibMzRf15DxUapMY9EHxrZHxt+
        Dpu6DK5CK0DSfPSxrz3GgpF/l9ghmb8qzDbdG35y0sjqOFmcUXQT3RR7hV+ZeYN6CIGgtp
        8wgdAa4pVS8HmQPZdqIC4DKTG8yx/44=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-tiLZzPoxMVmPuvvRvpp2tA-1; Thu, 28 Nov 2019 15:25:31 -0500
Received: by mail-pj1-f69.google.com with SMTP id m12so13402008pjs.0
        for <linux-doc@vger.kernel.org>; Thu, 28 Nov 2019 12:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iJyjrUFfcmHAhH3JG4K3fZfDXNCj7aMMhMdC/cxhP5Q=;
        b=Vnr/SRjFGu4Cy10Nh4H5ltkXNnEn8Sw3ZCUMwqk17y3ciwARi+F/Kf+KBzZQ1vRR3D
         1NPMeTEEKZDdvA+b2eXaALYCE+krnltYQ5gfhYM7qldG0Z3qtqDJ+buE60gxQU814oyT
         7eJBFr3dgFUBaYCPpYOca6qWE2IjN73I46kfdLUmuz3SCTJHRK0A1mFIuDyWMK0RNXru
         Z43FfTgs3wivmz/Xz6F2gjZcTPkkBbDOjc1sIoslR+Qk/7SqOCEiCvofEDOcQ8A3cqCT
         VUeRTjfBkv2DmbLypNYZpvIy0wWNeM0mXTEZ3xBIPBB4soDJuw8+aO3dX640C1+9IqKm
         B2iw==
X-Gm-Message-State: APjAAAUkOaHx6Uxe1KxO1E8LMVgvZewR6CUYbE5CNgr5BO6bTwjnuWfl
        Wb27IJOkRsQ0CG8PyvdEAPzFfQ5BrTKGiTSqMnD4CvJxRhh1gKLAMhPI+VaVOo63JALfzxUAg0U
        0HQFCE6MGefGgPsihWGRw
X-Received: by 2002:a62:e708:: with SMTP id s8mr55037352pfh.80.1574972730285;
        Thu, 28 Nov 2019 12:25:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8inKnmjJQ3jsyvDZArqOTWo5QGvdHM+KGH3wVsC6Qega0Cnv/bnbln+swwqa3RoTSLPhAdw==
X-Received: by 2002:a62:e708:: with SMTP id s8mr55037330pfh.80.1574972730046;
        Thu, 28 Nov 2019 12:25:30 -0800 (PST)
Received: from localhost ([122.177.85.74])
        by smtp.gmail.com with ESMTPSA id v14sm21402742pfe.94.2019.11.28.12.25.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Nov 2019 12:25:29 -0800 (PST)
From:   Bhupesh Sharma <bhsharma@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     bhsharma@redhat.com, bhupesh.linux@gmail.com, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org, James Morse <james.morse@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>,
        Steve Capper <steve.capper@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Dave Anderson <anderson@redhat.com>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Subject: [PATCH v5 2/5] arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
Date:   Fri, 29 Nov 2019 01:55:13 +0530
Message-Id: <1574972716-25858-1-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
X-MC-Unique: tiLZzPoxMVmPuvvRvpp2tA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

vabits_actual variable on arm64 indicates the actual VA space size,
and allows a single binary to support both 48-bit and 52-bit VA
spaces.

If the ARMv8.2-LVA optional feature is present, and we are running
with a 64KB page size; then it is possible to use 52-bits of address
space for both userspace and kernel addresses. However, any kernel
binary that supports 52-bit must also be able to fall back to 48-bit
at early boot time if the hardware feature is not present.

Since TCR_EL1.T1SZ indicates the size offset of the memory region
addressed by TTBR1_EL1 (and hence can be used for determining the
vabits_actual value) it makes more sense to export the same in
vmcoreinfo rather than vabits_actual variable, as the name of the
variable can change in future kernel versions, but the architectural
constructs like TCR_EL1.T1SZ can be used better to indicate intended
specific fields to user-space.

User-space utilities like makedumpfile and crash-utility, need to
read/write this value from/to vmcoreinfo for determining if a virtual
address lies in the linear map range.

The user-space computation for determining whether an address lies in
the linear map range is the same as we have in kernel-space:

  #define __is_lm_address(addr)=09(!(((u64)addr) & BIT(vabits_actual - 1)))

I have sent out user-space patches for makedumpfile and crash-utility
to add features for obtaining vabits_actual value from TCR_EL1.T1SZ (see
[0] and [1]).

Akashi reported that he was able to use this patchset and the user-space
changes to get user-space working fine with the 52-bit kernel VA
changes (see [2]).

[0]. http://lists.infradead.org/pipermail/kexec/2019-November/023966.html
[1]. http://lists.infradead.org/pipermail/kexec/2019-November/024006.html
[2]. http://lists.infradead.org/pipermail/kexec/2019-November/023992.html

Cc: James Morse <james.morse@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Dave Anderson <anderson@redhat.com>
Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org
Signed-off-by: Bhupesh Sharma <bhsharma@redhat.com>
---
 arch/arm64/include/asm/pgtable-hwdef.h | 1 +
 arch/arm64/kernel/crash_core.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/as=
m/pgtable-hwdef.h
index d9fbd433cc17..d2e7aff5821e 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -215,6 +215,7 @@
 #define TCR_TxSZ(x)=09=09(TCR_T0SZ(x) | TCR_T1SZ(x))
 #define TCR_TxSZ_WIDTH=09=096
 #define TCR_T0SZ_MASK=09=09(((UL(1) << TCR_TxSZ_WIDTH) - 1) << TCR_T0SZ_OF=
FSET)
+#define TCR_T1SZ_MASK=09=09(((UL(1) << TCR_TxSZ_WIDTH) - 1) << TCR_T1SZ_OF=
FSET)
=20
 #define TCR_EPD0_SHIFT=09=097
 #define TCR_EPD0_MASK=09=09(UL(1) << TCR_EPD0_SHIFT)
diff --git a/arch/arm64/kernel/crash_core.c b/arch/arm64/kernel/crash_core.=
c
index ca4c3e12d8c5..f78310ba65ea 100644
--- a/arch/arm64/kernel/crash_core.c
+++ b/arch/arm64/kernel/crash_core.c
@@ -7,6 +7,13 @@
 #include <linux/crash_core.h>
 #include <asm/memory.h>
=20
+static inline u64 get_tcr_el1_t1sz(void);
+
+static inline u64 get_tcr_el1_t1sz(void)
+{
+=09return (read_sysreg(tcr_el1) & TCR_T1SZ_MASK) >> TCR_T1SZ_OFFSET;
+}
+
 void arch_crash_save_vmcoreinfo(void)
 {
 =09VMCOREINFO_NUMBER(VA_BITS);
@@ -15,5 +22,7 @@ void arch_crash_save_vmcoreinfo(void)
 =09=09=09=09=09=09kimage_voffset);
 =09vmcoreinfo_append_str("NUMBER(PHYS_OFFSET)=3D0x%llx\n",
 =09=09=09=09=09=09PHYS_OFFSET);
+=09vmcoreinfo_append_str("NUMBER(tcr_el1_t1sz)=3D0x%llx\n",
+=09=09=09=09=09=09get_tcr_el1_t1sz());
 =09vmcoreinfo_append_str("KERNELOFFSET=3D%lx\n", kaslr_offset());
 }
--=20
2.7.4

