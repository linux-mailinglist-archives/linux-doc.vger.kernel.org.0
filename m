Return-Path: <linux-doc+bounces-33131-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DEB9F61AE
	for <lists+linux-doc@lfdr.de>; Wed, 18 Dec 2024 10:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3720B16F168
	for <lists+linux-doc@lfdr.de>; Wed, 18 Dec 2024 09:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483C51BEF8F;
	Wed, 18 Dec 2024 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2j7FGnMf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC751B423C
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734513909; cv=none; b=mq7qN3cEAnmUARAdP7o93mvYPoCx8StTtgdHXLoMGWj3YOYNVqk90fRzbZAvfGOH8atCmxiwMPUWtpIEnZJ/zxPB+TVahCCHYTH9lm+xL+uLgrvVEw+zOn+a5CNs/+9KbGgdSwpE1c/846mU9pKY8y1tBtOjKPa76eN5+iAteNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734513909; c=relaxed/simple;
	bh=Xs8/OCRHaThmnGTloYD6BuiZxAXMMDrRVok4B3GhSuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RON7CUuHsqo2QbW9VX+Nml1tLQdsWdbaIt4GLkPb7v5OjrlfnksPFPwBSG0bRtBvCVaUWnbBzH5/dpspqCJnFnz1vvB+P5O0zTboc5xUF4EOYjjuHtKw9j4OF7p0xupHZJhrh4VduPlYzlMWNvYBCElFwn++uMfCfBZgr9ab7DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=2j7FGnMf; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21619108a6bso47525015ad.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 01:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734513902; x=1735118702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpB0w9ruWZ9SB1Z/oNB+riFactYhWVOiHklRjLiS9dw=;
        b=2j7FGnMftRBr09uxH+OVFBXbYIPRrmTxKJbvDqSFomKCqFpsvyY84lbjq84+vcdjz3
         I7yQuiGzSNBVDqBH1gVIudPQLY1JCdhggVkS9ighVkVWT9WSjv05wATkBA+Bg76Om94U
         gKTZRy7qm3WBjZLIx6xcRM0R1zD/dtJpKDI207/9aL68xZmHmE0MYquoePg//nNoVOCr
         xcbp9aPseul/3yA6CCNp7V0yeo/GRG9uBRomGzZzDHYqe3+OtLeixmidgzf6L2dMuyfl
         Etf+eph8/Ua/+lbLwFteW6Fgz8Ayt726VLwZL1kgR+qWcmJf6Fq9J+cYl70/jF2hxjf8
         A2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734513902; x=1735118702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpB0w9ruWZ9SB1Z/oNB+riFactYhWVOiHklRjLiS9dw=;
        b=dZLh6y35AfUtVR2d+l6t4Quw40R1EzPCMsMiVuwRu3VpGXvf6c7H5YHitHAzAeSNsR
         WMLGRZQhqvY2AhAU/spzVD98P8ZJdyudHmSyDiyqiPJaVFxIm3xtJtb+RExXB6OqA5cL
         QP7ADY7VquMORIVd+e8q3+sm3Mg/CKmcM57KigI39kzA6FRdxDU9nf6u/90qmygscEgm
         jdXwIK1aABpgf+6LLzq+3Wl32765lp3pRtxe95sDxT+x0CQuEhDfIsxkm9zknDYdI2go
         GuI9AbCcJdiZ71S2Kr46HgcgnM8aKBf6kAv+wdVuRtYqPtGK210C1W8lEYkkAr/04k50
         cvIg==
X-Forwarded-Encrypted: i=1; AJvYcCUK/6HIbNR6TeqshlQ9LddKn+6p4SvpqfhHBevfqtUzk9Z89B8Cdt9XUUew4B+5Dnhj5tByn0RNqTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKtAcI1Rl5owbh2FLeMqqC380aJ+gZnYFK86aviSJEcEf/yWi3
	b4Fy/u4wjhTvM1tsL6BQ3M27ndPKYsHhsJqMqK/x+Kuay4GKN5SLIJOD3GJQGZo=
X-Gm-Gg: ASbGncuZsjPt58gHVDEvdbCtDY1tWHJL15f1Fj0E3730U+rmK9sohfbsi3xwtWmztD9
	67Y4ynIGLPDz1rog1ElNW8IPahCMb84b6f3WE9Q85mhCPs5ll36wrymVBQ/7rxXcLKZb+hhmaXh
	HC2NEJKNerAFmYFTMaohD8K9M+h1ddWqnqO5wT7PiJJd2karWsrjMdkite32HdSzPunkUxezYnX
	XDSdKFICNCVroKryydmXaxPv8ZZSaQ9li6hN8eLrDa4yj1ll6qW7cORvKJ9TEYjyuGfhnf8
X-Google-Smtp-Source: AGHT+IGKe+8ij/HO8AmXo0RPPksyUi5lXeicjPos2lbsx7I5HkIPFWr92YNR3oTNDVvC+EepAJA4Bg==
X-Received: by 2002:a17:902:e889:b0:216:2dc5:2330 with SMTP id d9443c01a7336-218d724958bmr36900625ad.36.1734513902511;
        Wed, 18 Dec 2024 01:25:02 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e64f90sm72119995ad.241.2024.12.18.01.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:25:01 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 18 Dec 2024 01:24:12 -0800
Subject: [PATCH v4 14/16] perf tools: powerpc: Use generic syscall table
 scripts
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-perf_syscalltbl-v4-14-bc8caef2ca8e@rivosinc.com>
References: <20241218-perf_syscalltbl-v4-0-bc8caef2ca8e@rivosinc.com>
In-Reply-To: <20241218-perf_syscalltbl-v4-0-bc8caef2ca8e@rivosinc.com>
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
 Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6924; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=Xs8/OCRHaThmnGTloYD6BuiZxAXMMDrRVok4B3GhSuw=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rSlOMhLe6PvAWyAy/O43hgPX3hy8UvFuzgEi1b2O9h8
 GvKwm95HaUsDGIcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEwkUIyRYbHqmexTZ+xjhFn3
 sBVLinMdvTdFTkljR/fb2cc8Gq54v2T4w7NCqTB5/rUzb9QL2UTVWddtWa0wY6lNf1VHgqJ1s44
 JIwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Use the generic scripts to generate headers from the syscall table
instead of the custom ones for powerpc.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                         |  3 +-
 tools/perf/Makefile.perf                           |  2 +-
 tools/perf/arch/powerpc/Makefile                   | 25 --------------
 tools/perf/arch/powerpc/entry/syscalls/Kbuild      |  3 ++
 .../arch/powerpc/entry/syscalls/Makefile.syscalls  |  6 ++++
 .../perf/arch/powerpc/entry/syscalls/mksyscalltbl  | 39 ----------------------
 tools/perf/arch/powerpc/include/syscall_table.h    |  8 +++++
 tools/perf/util/syscalltbl.c                       |  8 -----
 8 files changed, 19 insertions(+), 75 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 972af3a363c7bbbf5f5226377fea9bd0d306fa38..478045f29b04e2f848e76cf86bc8bc457e37b07a 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -31,7 +31,7 @@ $(call detected_var,SRCARCH)
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc s390))
+  ifeq ($(SRCARCH),s390)
     NO_SYSCALL_TABLE := 0
   endif
 
@@ -49,7 +49,6 @@ endif
 
 # Additional ARCH settings for ppc
 ifeq ($(SRCARCH),powerpc)
-  CFLAGS += -I$(OUTPUT)arch/powerpc/include/generated
   ifndef NO_LIBUNWIND
     LIBUNWIND_LIBS := -lunwind -lunwind-ppc64
   endif
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 74c1097f790cba5abfd1f2fbdaf4e7540c553482..f76b23d96fc91aa56807fc581bf820a117c2bda0 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips
+generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips powerpc
 ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
diff --git a/tools/perf/arch/powerpc/Makefile b/tools/perf/arch/powerpc/Makefile
index dc8f4fb8e324ab6679d78b5fee3636ba7d2ff7c0..a295a80ea078199547e816d18531820bfdba7961 100644
--- a/tools/perf/arch/powerpc/Makefile
+++ b/tools/perf/arch/powerpc/Makefile
@@ -1,28 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 HAVE_KVM_STAT_SUPPORT := 1
 PERF_HAVE_JITDUMP := 1
-
-#
-# Syscall table generation for perf
-#
-
-out    := $(OUTPUT)arch/powerpc/include/generated/asm
-header32 := $(out)/syscalls_32.c
-header64 := $(out)/syscalls_64.c
-sysprf := $(srctree)/tools/perf/arch/powerpc/entry/syscalls
-sysdef := $(sysprf)/syscall.tbl
-systbl := $(sysprf)/mksyscalltbl
-
-# Create output directory if not already present
-$(shell [ -d '$(out)' ] || mkdir -p '$(out)')
-
-$(header64): $(sysdef) $(systbl)
-	$(Q)$(SHELL) '$(systbl)' '64' $(sysdef) > $@
-
-$(header32): $(sysdef) $(systbl)
-	$(Q)$(SHELL) '$(systbl)' '32' $(sysdef) > $@
-
-clean::
-	$(call QUIET_CLEAN, powerpc) $(RM) $(header32) $(header64)
-
-archheaders: $(header32) $(header64)
diff --git a/tools/perf/arch/powerpc/entry/syscalls/Kbuild b/tools/perf/arch/powerpc/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..84c6599b4ea6a160217a3496449b205f2263f0fb
--- /dev/null
+++ b/tools/perf/arch/powerpc/entry/syscalls/Kbuild
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
+syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls b/tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..f7e87a61401c14a1d3a8a04fe2c8ecc8bedcc1b0
--- /dev/null
+++ b/tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += spu nospu
+syscall_abis_64 += spu nospu
+
+syscalltbl = $(srctree)/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
diff --git a/tools/perf/arch/powerpc/entry/syscalls/mksyscalltbl b/tools/perf/arch/powerpc/entry/syscalls/mksyscalltbl
deleted file mode 100755
index 0eb316fe6dd1175a86035f76f9f3cf7501c376bd..0000000000000000000000000000000000000000
--- a/tools/perf/arch/powerpc/entry/syscalls/mksyscalltbl
+++ /dev/null
@@ -1,39 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-#
-# Generate system call table for perf. Derived from
-# s390 script.
-#
-# Copyright IBM Corp. 2017
-# Author(s):  Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
-# Changed by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
-
-wordsize=$1
-SYSCALL_TBL=$2
-
-if ! test -r $SYSCALL_TBL; then
-	echo "Could not read input file" >&2
-	exit 1
-fi
-
-create_table()
-{
-	local wordsize=$1
-	local max_nr nr abi sc discard
-	max_nr=-1
-	nr=0
-
-	echo "static const char *const syscalltbl_powerpc_${wordsize}[] = {"
-	while read nr abi sc discard; do
-		if [ "$max_nr" -lt "$nr" ]; then
-			printf '\t[%d] = "%s",\n' $nr $sc
-			max_nr=$nr
-		fi
-	done
-	echo '};'
-	echo "#define SYSCALLTBL_POWERPC_${wordsize}_MAX_ID $max_nr"
-}
-
-grep -E "^[[:digit:]]+[[:space:]]+(common|spu|nospu|${wordsize})" $SYSCALL_TBL \
-	|sort -k1 -n                                                           \
-	|create_table ${wordsize}
diff --git a/tools/perf/arch/powerpc/include/syscall_table.h b/tools/perf/arch/powerpc/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..7ff51b783000d727ec48be960730b81ecdb05575
--- /dev/null
+++ b/tools/perf/arch/powerpc/include/syscall_table.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/bitsperlong.h>
+
+#if __BITS_PER_LONG == 64
+#include <asm/syscalls_64.h>
+#else
+#include <asm/syscalls_32.h>
+#endif
diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index 675702d686d0d1b53dd3ee2017cc9695686b9c63..8869fed1a58946c590484816354d8c74aff52ee3 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -18,14 +18,6 @@
 #include <asm/syscalls_64.c>
 const int syscalltbl_native_max_id = SYSCALLTBL_S390_64_MAX_ID;
 static const char *const *syscalltbl_native = syscalltbl_s390_64;
-#elif defined(__powerpc64__)
-#include <asm/syscalls_64.c>
-const int syscalltbl_native_max_id = SYSCALLTBL_POWERPC_64_MAX_ID;
-static const char *const *syscalltbl_native = syscalltbl_powerpc_64;
-#elif defined(__powerpc__)
-#include <asm/syscalls_32.c>
-const int syscalltbl_native_max_id = SYSCALLTBL_POWERPC_32_MAX_ID;
-static const char *const *syscalltbl_native = syscalltbl_powerpc_32;
 #elif defined(GENERIC_SYSCALL_TABLE)
 #include <syscall_table.h>
 const int syscalltbl_native_max_id = SYSCALLTBL_MAX_ID;

-- 
2.34.1


