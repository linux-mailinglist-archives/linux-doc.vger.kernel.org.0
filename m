Return-Path: <linux-doc+bounces-32987-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFF09F443F
	for <lists+linux-doc@lfdr.de>; Tue, 17 Dec 2024 07:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 997F1188FA7A
	for <lists+linux-doc@lfdr.de>; Tue, 17 Dec 2024 06:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1B71F37DE;
	Tue, 17 Dec 2024 06:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="oZXAa4xJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FDD1F2C5A
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 06:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734417602; cv=none; b=K/apInRSN8lhQZfFgz/97f5VDnqNxWERoZ3qdlUesQhKkUt0z4BQYaIlNemCX7wTQuLf9UsNItVsS5foA/o8QAty0WXmi1OLHRqegD0gsd1bLn0N4Hhl8WNciVY2cDBTe2tjKPDfrL80W4xpUb1P7ShgRAa/e50+wAVHP7xFXV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734417602; c=relaxed/simple;
	bh=OBRNC6/oLLpxUu9MeNUI/oRW1qvUh9B48fVUa1jZ/ZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vx47IAtdcWZ32Tqg4A+ed8g2g47etKmck/a5rx5NpLc3qTaoZ1p3EG1FiA7Fs3ipe+HF2T+T2XJbdldcGkFXE+pr+6m2ZW+T2dfiUXkrXtQeJBd9oeDCziUSoweVe8LpJfJxC1Eu97M+G7XPrQMvgpE6esGa/Loyb4KGwqA5dDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=oZXAa4xJ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so3617411a91.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 22:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734417599; x=1735022399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2phOucwGPBnxQscu/81oXh5LgnSAZwHR9O1qY5EYwA=;
        b=oZXAa4xJff/oFtwXgu9vW9i8UxbYbrJHVpepZ5u804gmQBsDGaQ4y1mjt0GsVPdVW9
         fFaEv/h8hCp0YxyLy2zvKLEAfEA7J90YCCpEslkh/lXkmLMpGuk0ZlHYQzz6/PaZQiOi
         On/cVfhKA6PMidZgXOvDWD9X/Rl1JXvqXlroMcatYdsmWYNE8QDEJMmT4Og9HLJDqA+Y
         LZCxSYZ39KvE6qIesYOkTPlTRnUpQjUZJMGb4aq41JgjtoiSBqoSpffTl5HfRGlTpUAq
         Vryfxvfokyj7FYHBbJH7JiS27Dxo+rio6R9j6B7wvSQ03dUsZgtIdwxwjfTpKBivmTRH
         PHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734417599; x=1735022399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2phOucwGPBnxQscu/81oXh5LgnSAZwHR9O1qY5EYwA=;
        b=OOc48Ylv3Y+rxgj9lJHR5ls4fViL6hlxfp6CBV9cCL6smuTeBwaHZi8OG2AwhGWjyV
         n5g1mG8NwPjwKHqy9UdJqgJnk4czc0TTQw5UFv9M3a6mSe/cG5iiw6h1ovsHqNdK92CC
         93XpDEF6ZoZPULpLGJpZ3gC1MQUYyQrE56cW53+k1o/nacxI3UC3hynKX1CPuGLEp1N2
         G1H9rjKUSE+l/o9Rk+4fUMyYBywZmLnC8r+S1tE76OGjWHQp+nhzE28lGaYisZKHg+DQ
         PEzvjppY5QOnYBXby1+OEjp71l5feKuzoiFc83g8ogvfDnMgQVRvOYwQP9UwxHVuOJDb
         Qamw==
X-Forwarded-Encrypted: i=1; AJvYcCWAelpB0km4dljPnnxnPg/liLjDAJpZ+oupKfXc3E9lKMRcfL8TBgnBOl77ttwgvgtFbjcT6AWATaU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Lb5KVZ/yKT5HEdI2v6HOI2UkZh3d0MK169Wxz+hZ6eddiV/7
	aOIFMLNlQHa2FTisevrzZv4aMT65jNC2hgj2PdBUECVyGk3txwi3tFign9vjEBk=
X-Gm-Gg: ASbGncuGSKmFu3qWcPeOFlBCLVf15X9omPIbbhVPCM618Q2FmD/okhniCtu5EHxftYQ
	Dm7gmkMDwnGiQxbnZiM0lUu9SYOXzU+xZwhHJBEhvtaQPjqVCqqcrdFz86owoq+fqP94mGrG+s1
	ErOb6vhSwO689hNXrgQ6cU+IGvLSd+hY1VkUAFINP7dm5Itj2Dcaq5laNZ+R3OGnoeRXIUy0ahn
	vfd8qD3nKotUDg6Jb57rD7mhqVEM7zB6xCwp9T9DKxhbzsKxnqUCMTAbNhq013IGOplsc05
X-Google-Smtp-Source: AGHT+IG3UOBHSNWzesedeqCBnPruxlq5hWLMIhSxyWspnkqzno35HJXMyFnHKz17o7bDlRIvBHe0rA==
X-Received: by 2002:a17:90b:1a88:b0:2ea:61c4:a443 with SMTP id 98e67ed59e1d1-2f2d8798991mr3252163a91.4.1734417599613;
        Mon, 16 Dec 2024 22:39:59 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142d90d6bsm9179551a91.2.2024.12.16.22.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 22:39:58 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 16 Dec 2024 22:33:00 -0800
Subject: [PATCH v3 15/16] perf tools: s390: Use generic syscall table
 scripts
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-perf_syscalltbl-v3-15-239f032481d5@rivosinc.com>
References: <20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com>
In-Reply-To: <20241216-perf_syscalltbl-v3-0-239f032481d5@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Leo Yan <leo.yan@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6102; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=OBRNC6/oLLpxUu9MeNUI/oRW1qvUh9B48fVUa1jZ/ZI=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qizMSbi/Q+C62ovjMptzjYcF+26asziU/+XuntSWzUe
 +HJVuraUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwET2vmBkuHhQWNbw7NROxtqt
 ghLJR67YzpSVsjTUvlm5YO/fnZ3yGYwM3Yc1I6/Z3X9z1VtlBUvhvKq5dZV6nzurZSWuia5t5vn
 ACQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Use the generic scripts to generate headers from the syscall table
instead of the custom ones for s390.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                         |  6 +---
 tools/perf/Makefile.perf                           |  2 +-
 tools/perf/arch/s390/Makefile                      | 21 --------------
 tools/perf/arch/s390/entry/syscalls/Kbuild         |  2 ++
 .../arch/s390/entry/syscalls/Makefile.syscalls     |  5 ++++
 tools/perf/arch/s390/entry/syscalls/mksyscalltbl   | 32 ----------------------
 tools/perf/arch/s390/include/syscall_table.h       |  2 ++
 tools/perf/util/syscalltbl.c                       |  6 +---
 8 files changed, 12 insertions(+), 64 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index de7cd12a885f60dc182bfb39493672f884adbacb..3f82ba907381049213c055ab10c3fe14d9572073 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -31,10 +31,6 @@ $(call detected_var,SRCARCH)
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
-  ifeq ($(SRCARCH),s390)
-    NO_SYSCALL_TABLE := 0
-  endif
-
   # architectures that use the generic syscall table scripts
   ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
     NO_SYSCALL_TABLE := 0
@@ -78,7 +74,7 @@ ifeq ($(SRCARCH),loongarch)
 endif
 
 ifeq ($(ARCH),s390)
-  CFLAGS += -fPIC -I$(OUTPUT)arch/s390/include/generated
+  CFLAGS += -fPIC
 endif
 
 ifeq ($(ARCH),mips)
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index f76b23d96fc91aa56807fc581bf820a117c2bda0..2c6a509c800d3037933c9b49e5a7dafbf78fda0c 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips powerpc
+generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips powerpc s390
 ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
diff --git a/tools/perf/arch/s390/Makefile b/tools/perf/arch/s390/Makefile
index c431c21b11ef824535c1b9fb6ca4246d666fc97b..0033698a65ce5d5d7ebcc280399957561dd9d2c6 100644
--- a/tools/perf/arch/s390/Makefile
+++ b/tools/perf/arch/s390/Makefile
@@ -1,24 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 HAVE_KVM_STAT_SUPPORT := 1
 PERF_HAVE_JITDUMP := 1
-
-#
-# Syscall table generation for perf
-#
-
-out    := $(OUTPUT)arch/s390/include/generated/asm
-header := $(out)/syscalls_64.c
-sysprf := $(srctree)/tools/perf/arch/s390/entry/syscalls
-sysdef := $(sysprf)/syscall.tbl
-systbl := $(sysprf)/mksyscalltbl
-
-# Create output directory if not already present
-$(shell [ -d '$(out)' ] || mkdir -p '$(out)')
-
-$(header): $(sysdef) $(systbl)
-	$(Q)$(SHELL) '$(systbl)' $(sysdef) > $@
-
-clean::
-	$(call QUIET_CLEAN, s390) $(RM) $(header)
-
-archheaders: $(header)
diff --git a/tools/perf/arch/s390/entry/syscalls/Kbuild b/tools/perf/arch/s390/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..9a41e3572c3afd4f202321fd9e492714540e8fd3
--- /dev/null
+++ b/tools/perf/arch/s390/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/s390/entry/syscalls/Makefile.syscalls b/tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..9762d7abf17c3f79a6213e7306a5f7b56e833a78
--- /dev/null
+++ b/tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_64 += renameat rlimit memfd_secret
+
+syscalltbl = $(srctree)/tools/perf/arch/s390/entry/syscalls/syscall.tbl
diff --git a/tools/perf/arch/s390/entry/syscalls/mksyscalltbl b/tools/perf/arch/s390/entry/syscalls/mksyscalltbl
deleted file mode 100755
index 52eb88a77c94727aeb8c15427cdd43dfe5f9f2bd..0000000000000000000000000000000000000000
--- a/tools/perf/arch/s390/entry/syscalls/mksyscalltbl
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-#
-# Generate system call table for perf
-#
-# Copyright IBM Corp. 2017, 2018
-# Author(s):  Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
-#
-
-SYSCALL_TBL=$1
-
-if ! test -r $SYSCALL_TBL; then
-	echo "Could not read input file" >&2
-	exit 1
-fi
-
-create_table()
-{
-	local max_nr nr abi sc discard
-
-	echo 'static const char *const syscalltbl_s390_64[] = {'
-	while read nr abi sc discard; do
-		printf '\t[%d] = "%s",\n' $nr $sc
-		max_nr=$nr
-	done
-	echo '};'
-	echo "#define SYSCALLTBL_S390_64_MAX_ID $max_nr"
-}
-
-grep -E "^[[:digit:]]+[[:space:]]+(common|64)" $SYSCALL_TBL	\
-	|sort -k1 -n					\
-	|create_table
diff --git a/tools/perf/arch/s390/include/syscall_table.h b/tools/perf/arch/s390/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..b53e31c15805319a01719c22d489c4037378b02b
--- /dev/null
+++ b/tools/perf/arch/s390/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_64.h>
diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index 8869fed1a58946c590484816354d8c74aff52ee3..210f61b0a7a264a427ebb602185d3a9da2f426f4 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -14,11 +14,7 @@
 #include <string.h>
 #include "string2.h"
 
-#if defined(__s390x__)
-#include <asm/syscalls_64.c>
-const int syscalltbl_native_max_id = SYSCALLTBL_S390_64_MAX_ID;
-static const char *const *syscalltbl_native = syscalltbl_s390_64;
-#elif defined(GENERIC_SYSCALL_TABLE)
+#if defined(GENERIC_SYSCALL_TABLE)
 #include <syscall_table.h>
 const int syscalltbl_native_max_id = SYSCALLTBL_MAX_ID;
 static const char *const *syscalltbl_native = syscalltbl;

-- 
2.34.1


