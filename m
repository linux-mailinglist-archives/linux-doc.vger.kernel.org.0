Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7123695BCB
	for <lists+linux-doc@lfdr.de>; Tue, 14 Feb 2023 09:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbjBNICi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 Feb 2023 03:02:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231816AbjBNICW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Feb 2023 03:02:22 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB48222D8
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 00:02:20 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id n13so10357860wmr.4
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 00:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHW49K+JXovgrHDB/sHf8iD4ZzCoi5+3r8HKHXzfaII=;
        b=AJLIVkJ8eUjmM1vtOmpYnjiU3h4AqQ2iNs0R4kbWM6WQQBljBu+oDtbGizUYYcUVOQ
         g/q10txiMYyuUgSFDhdFRz20C7yvHsYZv7U09fCLweF6OmlYHiwF3264IXpZij6NQAVh
         9sEmGjYiByQtkKwJYsm9vFUQd02dcXS2T5i9pn4QQ82YMBwRiQFsvPVYGBbRG+K9haZ5
         6dxTJN2iB15zg9MtIJCdQ/La/TuAsDRmVhdRAO0U8pAy7I469OhlQKKXnMXZLIl3WZ8Y
         F1XmlhyIQUCOJJKGmefLr8unKu71GSQSW4lYKCts61iRmMC2lvTg2Elq4G7tHFgsKCmI
         VCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHW49K+JXovgrHDB/sHf8iD4ZzCoi5+3r8HKHXzfaII=;
        b=eq8CfovzAXgHT3EjMmhW6JbpFuvf5vM3dzbX6CpVatsufNzgqaHImpELzWsHCPWmpM
         mBFy9bOjKtveE6ANLRFlfn4FyYd/SmyBL+zlkbDZPrpYZyXyZ1I4UXrPGv5HsQ3bSs6d
         Tj3rLHuflEUFGuXE2mKdQ5hj2y/0VXmyyJ+LVoOP8KuaPDOczSoU9R17NIC65SuXrIcg
         F5sReC9pIUsJV8HmxDrcBsawVMZc6KqaN342eHxn4eCRl88BbWHSLCLUXzU7vRvcazRZ
         wn5sRsRBLAtERZvLriz3qvoF7Ge+ElMt9NyPtTrKVbivUXWxI3Bmgn3yNLVsCy/AcHrK
         M1ng==
X-Gm-Message-State: AO0yUKWkOlm7JDvxepCKn+CUPR1GtlYgo79z4ETfgkDKYw4F+L1ttDg6
        GdZFKjsmNkU7ct4ebOcDOTAbuw==
X-Google-Smtp-Source: AK7set/lP4t2l54QM1whCNz2M9ULCfjrcCF8+kGbXDHkFI1+2d2arY1Vl6o/PMv55QSU4AnM8pBqCw==
X-Received: by 2002:a05:600c:13c3:b0:3dc:557f:6126 with SMTP id e3-20020a05600c13c300b003dc557f6126mr1207828wmg.4.1676361738767;
        Tue, 14 Feb 2023 00:02:18 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id z6-20020a1c4c06000000b003d1d5a83b2esm18920663wmf.35.2023.02.14.00.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:02:18 -0800 (PST)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org
Cc:     Palmer Dabbelt <palmerdabbelt@google.com>,
        Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 12/24] asm-generic: Remove COMMAND_LINE_SIZE from uapi
Date:   Tue, 14 Feb 2023 08:49:13 +0100
Message-Id: <20230214074925.228106-13-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.  Since <uapi/asm-generic/setup.h> only
contains COMMAND_LINE_SIZE we can just move it out of uapi to hide the
definition and fix up the only direct use in Loongarch.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Link: https://lore.kernel.org/r/20210423025545.313965-1-palmer@dabbelt.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/admin-guide/kernel-parameters.rst | 2 +-
 arch/loongarch/include/asm/setup.h              | 2 +-
 arch/sh/include/asm/setup.h                     | 2 +-
 include/asm-generic/Kbuild                      | 1 +
 include/{uapi => }/asm-generic/setup.h          | 0
 include/uapi/asm-generic/Kbuild                 | 1 -
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename include/{uapi => }/asm-generic/setup.h (100%)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 19600c50277b..2b94d5a42bd6 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -207,7 +207,7 @@ The number of kernel parameters is not limited, but the length of the
 complete command line (parameters including spaces etc.) is limited to
 a fixed number of characters. This limit depends on the architecture
 and is between 256 and 4096 characters. It is defined in the file
-./include/uapi/asm-generic/setup.h as COMMAND_LINE_SIZE.
+./include/asm-generic/setup.h as COMMAND_LINE_SIZE.
 
 Finally, the [KMG] suffix is commonly described after a number of kernel
 parameter values. These 'K', 'M', and 'G' letters represent the _binary_
diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
index 72ead58039f3..86c99b183ea0 100644
--- a/arch/loongarch/include/asm/setup.h
+++ b/arch/loongarch/include/asm/setup.h
@@ -7,7 +7,7 @@
 #define _LOONGARCH_SETUP_H
 
 #include <linux/types.h>
-#include <uapi/asm/setup.h>
+#include <asm-generic/setup.h>
 
 #define VECSIZE 0x200
 
diff --git a/arch/sh/include/asm/setup.h b/arch/sh/include/asm/setup.h
index fc807011187f..ae09b1c29fd1 100644
--- a/arch/sh/include/asm/setup.h
+++ b/arch/sh/include/asm/setup.h
@@ -2,7 +2,7 @@
 #ifndef _SH_SETUP_H
 #define _SH_SETUP_H
 
-#include <uapi/asm/setup.h>
+#include <asm-generic/setup.h>
 
 /*
  * This is set up by the setup-routine at boot-time
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 941be574bbe0..0fb55a119f54 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -49,6 +49,7 @@ mandatory-y += preempt.h
 mandatory-y += rwonce.h
 mandatory-y += sections.h
 mandatory-y += serial.h
+mandatory-y += setup.h
 mandatory-y += shmparam.h
 mandatory-y += simd.h
 mandatory-y += softirq_stack.h
diff --git a/include/uapi/asm-generic/setup.h b/include/asm-generic/setup.h
similarity index 100%
rename from include/uapi/asm-generic/setup.h
rename to include/asm-generic/setup.h
diff --git a/include/uapi/asm-generic/Kbuild b/include/uapi/asm-generic/Kbuild
index ebb180aac74e..0e7122339ee9 100644
--- a/include/uapi/asm-generic/Kbuild
+++ b/include/uapi/asm-generic/Kbuild
@@ -20,7 +20,6 @@ mandatory-y += posix_types.h
 mandatory-y += ptrace.h
 mandatory-y += resource.h
 mandatory-y += sembuf.h
-mandatory-y += setup.h
 mandatory-y += shmbuf.h
 mandatory-y += sigcontext.h
 mandatory-y += siginfo.h
-- 
2.37.2

