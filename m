Return-Path: <linux-doc+bounces-34486-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2782A06B83
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 03:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A509188783F
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 02:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E836200B9B;
	Thu,  9 Jan 2025 02:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="OHxQoX0C"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31E11B041E
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736390236; cv=none; b=T6b+8QE0jsdqq77Kdf0deB8c9/e0u72XyFOnU74t/ZXBAJBQERXLQQJrkDck5mfay9toV4blz7iI5o7XT4dCaWTIh1Voo8vJbri12VJ5Iwu/GlheQ5mM8BAIyV2PHSNCRSp6Khmu4myBoVeqr8E5SciX5ST0BZCV+V42v3DcpRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736390236; c=relaxed/simple;
	bh=WUFZcwWRoAiXUoWOaiOcPbkuOTuGd1/b8k7miYOj5aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z30S3WyKVhFBsuu92id0EZ4DCMZ9gKRMJ38/5pb4S7CABtpYxWo+ouhizEhXrFRtRYv9PC+uW5bymFZgUpZAxgLx6XeDDma6o7wkAI0IyPEn3mDLcIGyTRATcY/xJkm+qhph7lZonE9FXjCyAlRxXAhPc8NecfJbTswFMEb495k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=OHxQoX0C; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166651f752so7575205ad.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736390234; x=1736995034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vr1AmSpAXQaPMTqNcGDOgGl9O+bLngonO0DcMs8xKEA=;
        b=OHxQoX0CP6MVBFmD1rc9YiNer1m4UmGdSgWK/GaUrQq79jLPOqiGuvtFEuvpg7SJIa
         ei3dO4aLqaqUO0VLTUjyYrqN9m/pkBoYaaJ6eQ0CKeCpSEcU7Vb9XjewM2ysZGyutujl
         iQmBK29aZ/7jDk1SS9hZl9jLK4TQ2+O3DaIDanvnU4IMmMexrac8v+b30i8dkMFJnZ6Y
         rczHxcWtX3AkPnBCCjWm4m6yzdUaktmYN/XCh2GpQQVBRLPSQ/6ITDHccz9ydbmjlDBa
         skF4xCDmkYL3YI2hjYCBUu1qIxgWL6qhVSO9rxnpjDD7iSHW2Mwx9WjjTjoXhfT/eMNV
         Gi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736390234; x=1736995034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vr1AmSpAXQaPMTqNcGDOgGl9O+bLngonO0DcMs8xKEA=;
        b=UTz/27Hy9CEZOPQ/lLWCTOL6kEPo9ajc8b9uhjdbnaMMKYtst31z7QR5AuALXgmYJc
         JvDjZFveAO/RWCNHxl4c+RutAFkSSao/R1GrV1WPuxAylTJ/Zx9A/ETBt1igO3c9FLBr
         wLivCJSXdDLf75bJbx65J1wKjCo4cT/NuU6jgZxokpHu68MgKzyl/jjP5sJCwecJBBUO
         UMc1PKzZcBYGOPMMOEO8pUngS1Bcx7jkUeRCbetzliyt8lWO+7ykj1loGvst998lA+un
         9bJCiBbH3iVMdc4FmFJF8xZSBLCWHIgdgAf90bIsj+zWhvEGllh7fi0Qv8d0y7sgGMgh
         UM2A==
X-Forwarded-Encrypted: i=1; AJvYcCUR2ZUyQMGI0iMRvQBElI2RbPju+VJmd+VhFak69k8wKQ0mguigVy/RbQYcrwPNtjEVT2kaVa/ZCmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLo7L7Lf9dhcSJYJfpao2ufyT/xUEEy7ohTqAU7SfWEvlx3PsB
	3cXmztCTvVmLEG+I2sMYAObNqhC9+jkss+kuIlFvOZoqwfP3uX5/vLEaxb/C/JQ=
X-Gm-Gg: ASbGncsSOeeCWMjTTj4ljpqECFqhMCDfx9yngCdMeUHmNq9XgWxJe785HsjITjFdbZO
	eblNAHlh2S5SJRACTXW1blpGwul2Fq85n9ptDufJLvhBmhmJBP3SkLDMBvBEVHPnCetmUceWmh7
	g0cJLnbeA6blxXG+yIGd+WhTcy86epONbH5rY0PaVEqMf0A3UuiYJLbMUyGCIOgyQvkspFs98uc
	c/b4PvOqpSGvgy8Q6jCex3Jo85az+lWSijBW/wtSZ8hUQrTh8s4uDWMei86JnaJ2iSx1RJj
X-Google-Smtp-Source: AGHT+IFz+rK9PR+JzC1FWypELvWH1cEgCo1/H/4+lhIOHW9EGZFvsyY6ABvYR7ydQVwOeMLVFuh4vg==
X-Received: by 2002:a17:902:d4cd:b0:216:3c2b:a5e5 with SMTP id d9443c01a7336-21a83f71115mr60403015ad.27.1736390234363;
        Wed, 08 Jan 2025 18:37:14 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9176bed6sm1434365ad.12.2025.01.08.18.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 18:37:13 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 08 Jan 2025 18:36:30 -0800
Subject: [PATCH v6 15/16] perf tools: s390: Use generic syscall table
 scripts
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-perf_syscalltbl-v6-15-7543b5293098@rivosinc.com>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
In-Reply-To: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
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
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6102; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=WUFZcwWRoAiXUoWOaiOcPbkuOTuGd1/b8k7miYOj5aI=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3q9mf5e1eXqbXJv61NV3h9jeCp2N/6Wx/6L05h0PF3qT
 CZ9i93VUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwEQ2NzD8Zu+0PnT4+jKbzMYp
 4d757N3JCgf63ZoDL22dHs0rWJvexcjwSO5zzQrN1+c3N6hfSbKUDl0wuTLmXqjl4qzSs9nLD9b
 xAgA=
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
index 7213f6d806e5497309524cacb16bd8313e9bc5cb..feb61be7c4f93d7ebe0530839aebcd03ab8ec425 100644
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
@@ -90,7 +86,7 @@ ifeq ($(SRCARCH),loongarch)
 endif
 
 ifeq ($(ARCH),s390)
-  CFLAGS += -fPIC -I$(OUTPUT)arch/s390/include/generated
+  CFLAGS += -fPIC
 endif
 
 ifeq ($(ARCH),mips)
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 0e30da3b781b5a51ea179ab15993391ff7055635..8081adf0e02354b9662a4e3c8493d6b1cec9fe25 100644
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


