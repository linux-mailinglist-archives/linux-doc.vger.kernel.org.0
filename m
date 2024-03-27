Return-Path: <linux-doc+bounces-12888-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E986688EFAB
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 21:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 232D12A41CF
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 20:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691F71534E6;
	Wed, 27 Mar 2024 20:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SutroOOg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2509A152535
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 20:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569724; cv=none; b=Bf+RFHbWxRJcgQuY9hI5Es/NNKhfWtZ9yrqlFYyuzUJTijXbWvsLjyLLK3nnet1I9LlALkqMwegOEYveo+ytAlsCCZ6dAUnptowEIuTE7syVPg+9xrltxxomNs4B/mXmV1xdh/NncUIOoIlXszAmxPtc+K0+gmQxEEX9dckUidc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569724; c=relaxed/simple;
	bh=QLBKpB2PdEIlr9xigaUhM4g6brQYbruPNgjVNrPpBbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tC8F81FWQ0Z6OJfMtNCqROBmd5U4tGvi6nt8JG1l3u5ZY+hJnoobs9SQb/uHHKLF8DHxVOX9HzR1E46jbNkW2/ha/9gKA7wxIHJBaEPtQdnNy4FGZWLb7p4Nldv50jMgmDXENOmUDU7Bzd98Qv9qZ5Wp+qL0nm05Tyt+v/onU14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=SutroOOg; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dee27acf7aso1597785ad.2
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 13:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569720; x=1712174520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypWDQztlaUl0OBgzt8wXnA3vBiMMRAqmq7IofZwnoZI=;
        b=SutroOOgsWUjLRWtW+s1mpI8bDaUmvBGvBLrC6uYtK2I3RGCdfjB7KHSTJNHqMEOdw
         84ZJ0S+XCA7EbWglhGjG0xmQxaWCvdYuXc+CNOI8w2e2btS5kZPGC5J5x1HA3qOcJMdj
         jftXmsvnpmzuQwQ/lrzBLOxBkhagYjVUScxosVKeEM8AuduUs2ayZaUjowEzrVDInu5Z
         ti/fgQSC37rxrxRnjFEU5HgR4AC9p8Qi4XMg3kvtptUsMh9WBfi0kdmyh2NnLFfyO6ei
         Xdbp5rFQhQefWjsCxR/Xlup6Bg5k6k74y/pZTWMSIn7B0x5IjP0BI2eOTA+bUtYFxU4d
         1Bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569720; x=1712174520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypWDQztlaUl0OBgzt8wXnA3vBiMMRAqmq7IofZwnoZI=;
        b=iVz+2HbRhsYEVnWdeI9ooROu50CZ5FBvaCiqCaohdmyCa3smrpkOMGRspsI23SBUrI
         xQnW8CNPgCjcSQXw0cr8V9l8cy6L3I6hrsZNP4zhdMR+EWfgmVlD9UK5Rlb6WiKhHfFb
         AIii7WzG2xCP+bCMCTNjSnwp0B17pgK8AYMiXwLfu8I7/buC70Vyc8/Jar1X1E7kIK5A
         AdSkwbmoyhDgVjk+jlcfFXSf2jesjtxFwMaX7M/tnN1pmxqkLC3vfLogZrcZ5qGmVmP4
         ca6oSk5Gl2IDuXC3vA4GzuhsC9epM3+yr2o1RhMdonOMFY0hYi5fPK5x2V1Zm1z0gu53
         vpUA==
X-Forwarded-Encrypted: i=1; AJvYcCUEf2mHiRdIZOwNxPCQ0wIUvwGmKNQ3TeuX5ylkH7U462UQ/uqBLqXzxZt+bIj+zFXZU6PslwkdRuPgOdG2C6jbyx0zvzWTYY/j
X-Gm-Message-State: AOJu0YxYS3kMUbu7gavdBldmvyhaqERgP0hGlaciD8AZKjXgnV4PZwbE
	QMtASykSp6i/QmbLpIQDBD721PEv3B4NECYHdYO6qbJ5Cc3UMQgUWQgTJWUW0ek=
X-Google-Smtp-Source: AGHT+IG/guZZUh1z8VBs2UBKbikNm/ct62HN1I/AjguyoIM/V4kgoDEmkJWsd5kFsvUg8c6UkAoepg==
X-Received: by 2002:a17:903:1251:b0:1e0:f366:13e5 with SMTP id u17-20020a170903125100b001e0f36613e5mr876644plh.61.1711569720448;
        Wed, 27 Mar 2024 13:02:00 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:00 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v3 01/14] arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:32 -0700
Message-ID: <20240327200157.1097089-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several architectures provide an API to enable the FPU and run
floating-point SIMD code in kernel space. However, the function names,
header locations, and semantics are inconsistent across architectures,
and FPU support may be gated behind other Kconfig options.

Provide a standard way for architectures to declare that kernel space
FPU support is available. Architectures selecting this option must
implement what is currently the most common API (kernel_fpu_begin() and
kernel_fpu_end(), plus a new function kernel_fpu_available()) and
provide the appropriate CFLAGS for compiling floating-point C code.

Suggested-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Add documentation explaining the built-time and runtime APIs
 - Add a linux/fpu.h header for generic isolation enforcement

 Documentation/core-api/floating-point.rst | 78 +++++++++++++++++++++++
 Documentation/core-api/index.rst          |  1 +
 Makefile                                  |  5 ++
 arch/Kconfig                              |  6 ++
 include/linux/fpu.h                       | 12 ++++
 5 files changed, 102 insertions(+)
 create mode 100644 Documentation/core-api/floating-point.rst
 create mode 100644 include/linux/fpu.h

diff --git a/Documentation/core-api/floating-point.rst b/Documentation/core-api/floating-point.rst
new file mode 100644
index 000000000000..a8d0d4b05052
--- /dev/null
+++ b/Documentation/core-api/floating-point.rst
@@ -0,0 +1,78 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Floating-point API
+==================
+
+Kernel code is normally prohibited from using floating-point (FP) registers or
+instructions, including the C float and double data types. This rule reduces
+system call overhead, because the kernel does not need to save and restore the
+userspace floating-point register state.
+
+However, occasionally drivers or library functions may need to include FP code.
+This is supported by isolating the functions containing FP code to a separate
+translation unit (a separate source file), and saving/restoring the FP register
+state around calls to those functions. This creates "critical sections" of
+floating-point usage.
+
+The reason for this isolation is to prevent the compiler from generating code
+touching the FP registers outside these critical sections. Compilers sometimes
+use FP registers to optimize inlined ``memcpy`` or variable assignment, as
+floating-point registers may be wider than general-purpose registers.
+
+Usability of floating-point code within the kernel is architecture-specific.
+Additionally, because a single kernel may be configured to support platforms
+both with and without a floating-point unit, FPU availability must be checked
+both at build time and at run time.
+
+Several architectures implement the generic kernel floating-point API from
+``linux/fpu.h``, as described below. Some other architectures implement their
+own unique APIs, which are documented separately.
+
+Build-time API
+--------------
+
+Floating-point code may be built if the option ``ARCH_HAS_KERNEL_FPU_SUPPORT``
+is enabled. For C code, such code must be placed in a separate file, and that
+file must have its compilation flags adjusted using the following pattern::
+
+    CFLAGS_foo.o += $(CC_FLAGS_FPU)
+    CFLAGS_REMOVE_foo.o += $(CC_FLAGS_NO_FPU)
+
+Architectures are expected to define one or both of these variables in their
+top-level Makefile as needed. For example::
+
+    CC_FLAGS_FPU := -mhard-float
+
+or::
+
+    CC_FLAGS_NO_FPU := -msoft-float
+
+Normal kernel code is assumed to use the equivalent of ``CC_FLAGS_NO_FPU``.
+
+Runtime API
+-----------
+
+The runtime API is provided in ``linux/fpu.h``. This header cannot be included
+from files implementing FP code (those with their compilation flags adjusted as
+above). Instead, it must be included when defining the FP critical sections.
+
+.. c:function:: bool kernel_fpu_available( void )
+
+        This function reports if floating-point code can be used on this CPU or
+        platform. The value returned by this function is not expected to change
+        at runtime, so it only needs to be called once, not before every
+        critical section.
+
+.. c:function:: void kernel_fpu_begin( void )
+                void kernel_fpu_end( void )
+
+        These functions create a floating-point critical section. It is only
+        valid to call ``kernel_fpu_begin()`` after a previous call to
+        ``kernel_fpu_available()`` returned ``true``. These functions are only
+        guaranteed to be callable from (preemptible or non-preemptible) process
+        context.
+
+        Preemption may be disabled inside critical sections, so their size
+        should be minimized. They are *not* required to be reentrant. If the
+        caller expects to nest critical sections, it must implement its own
+        reference counting.
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 7a3a08d81f11..974beccd671f 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -48,6 +48,7 @@ Library functionality that is used throughout the kernel.
    errseq
    wrappers/atomic_t
    wrappers/atomic_bitops
+   floating-point
 
 Low level entry and exit
 ========================
diff --git a/Makefile b/Makefile
index 763b6792d3d5..710f65e4249d 100644
--- a/Makefile
+++ b/Makefile
@@ -964,6 +964,11 @@ KBUILD_CFLAGS	+= $(CC_FLAGS_CFI)
 export CC_FLAGS_CFI
 endif
 
+# Architectures can define flags to add/remove for floating-point support
+CC_FLAGS_FPU	+= -D_LINUX_FPU_COMPILATION_UNIT
+export CC_FLAGS_FPU
+export CC_FLAGS_NO_FPU
+
 ifneq ($(CONFIG_FUNCTION_ALIGNMENT),0)
 # Set the minimal function alignment. Use the newer GCC option
 # -fmin-function-alignment if it is available, or fall back to -falign-funtions.
diff --git a/arch/Kconfig b/arch/Kconfig
index 9f066785bb71..8e34b3acf73d 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1569,6 +1569,12 @@ config ARCH_HAS_NONLEAF_PMD_YOUNG
 	  address translations. Page table walkers that clear the accessed bit
 	  may use this capability to reduce their search space.
 
+config ARCH_HAS_KERNEL_FPU_SUPPORT
+	bool
+	help
+	  Architectures that select this option can run floating-point code in
+	  the kernel, as described in Documentation/core-api/floating-point.rst.
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/include/linux/fpu.h b/include/linux/fpu.h
new file mode 100644
index 000000000000..2fb63e22913b
--- /dev/null
+++ b/include/linux/fpu.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_FPU_H
+#define _LINUX_FPU_H
+
+#ifdef _LINUX_FPU_COMPILATION_UNIT
+#error FP code must be compiled separately. See Documentation/core-api/floating-point.rst.
+#endif
+
+#include <asm/fpu.h>
+
+#endif
-- 
2.43.1


