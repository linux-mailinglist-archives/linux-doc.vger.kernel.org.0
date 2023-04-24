Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71FE16DB6F4
	for <lists+linux-doc@lfdr.de>; Sat,  8 Apr 2023 01:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjDGXLg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Apr 2023 19:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjDGXLd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Apr 2023 19:11:33 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DEE2E1AE
        for <linux-doc@vger.kernel.org>; Fri,  7 Apr 2023 16:11:23 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id kx12so2228957plb.12
        for <linux-doc@vger.kernel.org>; Fri, 07 Apr 2023 16:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680909083; x=1683501083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDOPItMBcGDGaCyHwWBFXtRG6cRjR6r59AeA2F6gyE8=;
        b=2Ks4nw+MRX/xp8YSNC3vpM/HBh/Y6nlfkySNQnCASuSKBGME8sLEdkjroFi0vQgplk
         0CRBSKjMH/xFGPxRrx3x1TIH4WXe4aY9dGLXMOwc/5JdJ0WKxNb6UDpZmvLXp2WmjQJw
         pCoPBgCl/UHZznbKT1SbvPvF94QMbpqDutjwB5ES5U3rfaKooCC1lI492jT3TVYQtOPs
         +Uj2CQGNttb44t+cWGGvH1T6L+Gw0Y89ghV0LM2H2H/bbKMb8THIGvBHyR6fMnOAgLxj
         hBargAVuyOyrg41tKR7ltfPGKTpVcKYGemDm6erfCqNfnXCuftd2cgLvbQmTGwmJXnLx
         tkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909083; x=1683501083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDOPItMBcGDGaCyHwWBFXtRG6cRjR6r59AeA2F6gyE8=;
        b=Cgvbjps6hMfJOqbQjheZ7Xj2HOm2HDhKBJFAAKyf5kiuW02RapVoWZ8ajzCAxEify8
         S+1se4y3ZsEjshKCG+EJIDNQsFRSS4D+5I+8No0DPWWmoPxisFc22QBIFVxNuIbluq9Z
         CXWAEixBtqgFt2IX9k6jg8MyEBnO3YW2xnHGvHhHF4NluX6Z/66BQgbMFW5f/n2ZI8pf
         HbHaG0GZYaNJnyASEB877rQeRbNQBZ2gFoamnEk8hswV7sh3dftcIYqE8d1hqa2kfUb/
         FgvgbGGk5W0QEY1CDJOtWuQZYBcDZP7lL7fHYy2JCQMts9JwMNC6lJ3bWvGDL67hZkam
         +tkA==
X-Gm-Message-State: AAQBX9fZmlwIIr7GHvjs7hke701I7GZupAe4OHzAuYLAnNqi/ojcrScA
        LqfCp/uHZ8FnRcvLnPuGniOndw==
X-Google-Smtp-Source: AKy350baMH2Uf4j5jY2xKKPbUiOb+o5CU818Fvc5qPHDFQj1Gw3vvDZIk+bPqRnQ+p/7T+JqQRm0Kg==
X-Received: by 2002:a17:903:2452:b0:19e:748c:ee29 with SMTP id l18-20020a170903245200b0019e748cee29mr4773667pls.55.1680909082768;
        Fri, 07 Apr 2023 16:11:22 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id r5-20020a170902be0500b001a076568da9sm3361526pls.216.2023.04.07.16.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 16:11:22 -0700 (PDT)
From:   Evan Green <evan@rivosinc.com>
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     slewis@rivosinc.com, heiko@sntech.de,
        Conor Dooley <conor@kernel.org>, vineetg@rivosinc.com,
        Evan Green <evan@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Guo Ren <guoren@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v6 3/6] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
Date:   Fri,  7 Apr 2023 16:11:00 -0700
Message-Id: <20230407231103.2622178-4-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407231103.2622178-1-evan@rivosinc.com>
References: <20230407231103.2622178-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We have an implicit set of base behaviors that userspace depends on,
which are mostly defined in various ISA specifications.

Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---

(no changes since v5)

Changes in v5:
 - Fixed misuse of ISA_EXT_c as bitmap, changed to use
   riscv_isa_extension_available() (Heiko, Conor)

Changes in v4:
 - More newlines in BASE_BEHAVIOR_IMA documentation (Conor)

Changes in v3:
 - Refactored base ISA behavior probe to allow kernel probing as well,
   in prep for vDSO data initialization.
 - Fixed doc warnings in IMA text list, use :c:macro:.

 Documentation/riscv/hwprobe.rst       | 24 ++++++++++++++++++++++++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  5 +++++
 arch/riscv/kernel/sys_riscv.c         | 20 ++++++++++++++++++++
 4 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 211828f706e3..945d44683c40 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -39,3 +39,27 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
   defined by the RISC-V privileged architecture specification.
+
+* :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
+  user-visible behavior that this kernel supports.  The following base user ABIs
+  are defined:
+
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: Support for rv32ima or
+    rv64ima, as defined by version 2.2 of the user ISA and version 1.10 of the
+    privileged ISA, with the following known exceptions (more exceptions may be
+    added, but only if it can be demonstrated that the user ABI is not broken):
+
+    * The :fence.i: instruction cannot be directly executed by userspace
+      programs (it may still be executed in userspace via a
+      kernel-controlled mechanism such as the vDSO).
+
+* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing the extensions
+  that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
+  base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_IMA_FD`: The F and D extensions are supported, as
+    defined by commit cd20cee ("FMIN/FMAX now implement
+    minimumNumber/maximumNumber, not minNum/maxNum") of the RISC-V ISA manual.
+
+  * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
+    by version 2.2 of the RISC-V ISA manual.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 6184bbc77256..d717c80a64ff 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,6 +8,6 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 2
+#define RISCV_HWPROBE_MAX_KEY 4
 
 #endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index b79be00920db..398e08f7e083 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -20,6 +20,11 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MVENDORID	0
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
+#define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define RISCV_HWPROBE_KEY_IMA_EXT_0	4
+#define		RISCV_HWPROBE_IMA_FD		(1 << 0)
+#define		RISCV_HWPROBE_IMA_C		(1 << 1)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 #endif
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index fe8e833ecb2e..5ca567cef142 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -9,6 +9,7 @@
 #include <asm/cacheflush.h>
 #include <asm/hwprobe.h>
 #include <asm/sbi.h>
+#include <asm/switch_to.h>
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm-generic/mman-common.h>
@@ -125,6 +126,25 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
+	/*
+	 * The kernel already assumes that the base single-letter ISA
+	 * extensions are supported on all harts, and only supports the
+	 * IMA base, so just cheat a bit here and tell that to
+	 * userspace.
+	 */
+	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
+		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		break;
+
+	case RISCV_HWPROBE_KEY_IMA_EXT_0:
+		pair->value = 0;
+		if (has_fpu())
+			pair->value |= RISCV_HWPROBE_IMA_FD;
+
+		if (riscv_isa_extension_available(NULL, c))
+			pair->value |= RISCV_HWPROBE_IMA_C;
+
+		break;
 
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
-- 
2.25.1

