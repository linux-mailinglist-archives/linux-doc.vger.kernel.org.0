Return-Path: <linux-doc+bounces-32988-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A77109F4447
	for <lists+linux-doc@lfdr.de>; Tue, 17 Dec 2024 07:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4037D188FA3D
	for <lists+linux-doc@lfdr.de>; Tue, 17 Dec 2024 06:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDC21F4266;
	Tue, 17 Dec 2024 06:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="xsjW7SYu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B381F12E7
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 06:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734417605; cv=none; b=kIxNPWI5elOVoW2ZN+U9A6XDZvf5dqjh/2F3HZBbtHHiUlKVc+3HWnni0oPZ/b/GHzpw9uAbIp8Iqyj4dmkN5x2V0LnVZ5gnK4UJT79iiWO+Fk3MOZQewr+x55F5D+HFD+yB1Hb5254ntaQ+LJV4gKuXbD9FF3MATj2OQvUHuF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734417605; c=relaxed/simple;
	bh=l1Ser96/ogvT5kdgPhN2YrOSJRGf4Opsq+T7mgeD0Bc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQLUybIqZbc8MfYt89EXUs6uavPYfFjzhs0mYzvNJXHrMqi3+vQ7a/zlJEZiEOmqfkIf8t8HFhxaTWohrN69pWTJ8OjWb9KM4OcEfHZTToGtCFncOOs4WvP7Rm1na7Nb42rNs9ni2IzqDcU+Hg+l4WFMunmRmg2mroLUEw+czNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=xsjW7SYu; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fc8f0598cdso4640883a12.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 22:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734417603; x=1735022403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G59fhJUSyOt3cdDcrYeMXQ/KlBe6RYsVLyS5ah9slEc=;
        b=xsjW7SYuxAMk3qPSm5f9k+L5LMcUp0ah9geEmrId/YYnYOqCdAAviwGV3eo5wLyAWZ
         z6zz8f5X1KrYPpw9XDL1YH/oZMFDrFGhdzn+bixBjwBn2kyoenRoTlWhIORxGNUyWlcF
         YNWl9D2m0siGnvWWqDgFzcJ3nXLT/SkfL9VJN1MtmMNULD2byCN4jWJaP4AoVhYkVMWE
         7z4k0bwfoRoap9H2Z+bAZXypLifJ/ZRnJ8wzBoOTUDTEwxmn6715QUchaYULOFjqK3wD
         TEQ7UcJl+E8bia3netTm3YcrIQ6m3SZfCuYp5DDk8Kms6aSAruUiCtve/8uEMjzcO21p
         HjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734417603; x=1735022403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G59fhJUSyOt3cdDcrYeMXQ/KlBe6RYsVLyS5ah9slEc=;
        b=vo5l7mSUF9MDs3sDBXA5SwgvufKF2zFurzaR57kivCZCpYIAMgVh/7YCjiG2dfbJQu
         FVv946bL+LiwnjWaf6Jk7avpXMblxqB2H+cVlP60IHT5hpTmqp25Mbpzohu4PCLh4EWN
         AUG5+QhTtc6acbCWYbVYJCRaccOVp419JTOfsK93Of0PdSYH81nK+vNfvzAeJ2dtRmAI
         gkM2VaT8qScnvGtreQ5Nxb7xfh7rj7UaArgF2gaDek9dp2wgMHc8L8YTeOBEmAfLBBKA
         SqAPYr+AL939hNUbdWNNg5vHysn9H1W76Lnwf+yx9iU9DlKirMQgkz/UZ5xJyxrJEgSB
         eUeg==
X-Forwarded-Encrypted: i=1; AJvYcCXGvdLUnKcVipFuGvMCzJ5sHYXT17KyyYrKDL1gu8nZxrYICgNFixZJFHtUJzjV+y7qtDM2FucZGsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwITqyYnXtJ/v5Hj47fUl/NndTtwizeFfcCNWtQFG7lXTkU3b18
	UDDKb537exEtMnozeWakm1PUCkEnsSPWbzG+DO9Ppc5jGxn22hP2UJoKZJhmF1Y=
X-Gm-Gg: ASbGncvTpqDXpk1RNymjwMS+kmFkbRKVSfK830Oi7fVnI/s+zjuzjWpROjpSCMURnK5
	dO5nrpFNm/7k6hxC8Rn4j2RetfrInX/vR4sOSq1TOSp/M2oqEVPN4/04inACNP/HCdJiLfKe9h/
	fDuETGIQbeQyPpnZw2uytcX1zk+CGAevuLTiwDohtYEi3lLsoj72vv9+hGBcS9Bb6QdIiEdSVj5
	1soAWnImxNGFK+NLbr9O9+fcw+17gUzA3kY+zfDOOEJb2a6psPI6sIKayX2FpdjkmVklE3F
X-Google-Smtp-Source: AGHT+IEe2Tqa+z0Q2uyrA2Pwy1HuUYf4jnWYYEnzqRX7eoFc4Vxc7/cfLZKhBqIqyMM+5XmjGo544A==
X-Received: by 2002:a17:90b:1c84:b0:2ee:d9d4:64a8 with SMTP id 98e67ed59e1d1-2f2d8654b36mr3466202a91.0.1734417602575;
        Mon, 16 Dec 2024 22:40:02 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142d90d6bsm9179551a91.2.2024.12.16.22.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 22:40:01 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 16 Dec 2024 22:33:01 -0800
Subject: [PATCH v3 16/16] perf tools: Remove dependency on libaudit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-perf_syscalltbl-v3-16-239f032481d5@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=17722; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=l1Ser96/ogvT5kdgPhN2YrOSJRGf4Opsq+T7mgeD0Bc=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qizETXxYeVrulxSZzRUU81ltk4u0Am8O0TBylR4/mml
 nfdp2zqKGVhEONgkBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCI2Lgz/bLbNc1zUyRazOOee
 ruNOvf1yume87rNwG9VMWajhFDavguF/xvbrl9+y97w9FDpF+JPonSfF0+Nk756a3T1Tnn1ny8z
 9vAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

All architectures now support HAVE_SYSCALL_TABLE_SUPPORT, so the flag is
no longer needed. With the removal of the flag, the related
GENERIC_SYSCALL_TABLE can also be removed. libaudit was only used as a
fallback for when HAVE_SYSCALL_TABLE_SUPPORT was not defined, so
libaudit is also no longer needed for any architecture.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/admin-guide/workload-tracing.rst |  2 +-
 tools/build/feature/Makefile                   |  4 --
 tools/build/feature/test-libaudit.c            | 11 ------
 tools/perf/Documentation/perf-check.txt        |  1 -
 tools/perf/Makefile.config                     | 31 +--------------
 tools/perf/Makefile.perf                       | 15 --------
 tools/perf/builtin-check.c                     |  1 -
 tools/perf/builtin-help.c                      |  2 -
 tools/perf/builtin-trace.c                     | 30 ---------------
 tools/perf/perf.c                              |  6 +--
 tools/perf/tests/make                          |  7 +---
 tools/perf/util/env.c                          |  4 +-
 tools/perf/util/generate-cmdlist.sh            |  4 +-
 tools/perf/util/syscalltbl.c                   | 52 --------------------------
 14 files changed, 10 insertions(+), 160 deletions(-)

diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
index b2e254ec8ee846afe78eede74a825b51c6ab119b..6be38c1b9c5bb4be899fd261c6d2911abcf959dc 100644
--- a/Documentation/admin-guide/workload-tracing.rst
+++ b/Documentation/admin-guide/workload-tracing.rst
@@ -83,7 +83,7 @@ scripts/ver_linux is a good way to check if your system already has
 the necessary tools::
 
   sudo apt-get build-essentials flex bison yacc
-  sudo apt install libelf-dev systemtap-sdt-dev libaudit-dev libslang2-dev libperl-dev libdw-dev
+  sudo apt install libelf-dev systemtap-sdt-dev libslang2-dev libperl-dev libdw-dev
 
 cscope is a good tool to browse kernel sources. Let's install it now::
 
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 043dfd00fce72d8f651ccd9b3265a0183f500e5c..e0b63e9d0251abe6d5eafc6d2f26b940918b16ee 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -13,7 +13,6 @@ FILES=                                          \
          test-gtk2.bin                          \
          test-gtk2-infobar.bin                  \
          test-hello.bin                         \
-         test-libaudit.bin                      \
          test-libbfd.bin                        \
          test-libbfd-buildid.bin		\
          test-disassembler-four-args.bin        \
@@ -228,9 +227,6 @@ $(OUTPUT)test-libunwind-debug-frame-arm.bin:
 $(OUTPUT)test-libunwind-debug-frame-aarch64.bin:
 	$(BUILD) -lelf -llzma -lunwind-aarch64
 
-$(OUTPUT)test-libaudit.bin:
-	$(BUILD) -laudit
-
 $(OUTPUT)test-libslang.bin:
 	$(BUILD) -lslang
 
diff --git a/tools/build/feature/test-libaudit.c b/tools/build/feature/test-libaudit.c
deleted file mode 100644
index f5b0863fa1ec240795339428d8deed98a946d405..0000000000000000000000000000000000000000
--- a/tools/build/feature/test-libaudit.c
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <libaudit.h>
-
-extern int printf(const char *format, ...);
-
-int main(void)
-{
-	printf("error message: %s\n", audit_errno_to_name(0));
-
-	return audit_open();
-}
diff --git a/tools/perf/Documentation/perf-check.txt b/tools/perf/Documentation/perf-check.txt
index 31741499e7867c9b712227f31a2958fd641d474a..e6d2ceeb2ca7de850f41b1baa0375b6f984bb08f 100644
--- a/tools/perf/Documentation/perf-check.txt
+++ b/tools/perf/Documentation/perf-check.txt
@@ -51,7 +51,6 @@ feature::
                 dwarf_getlocations      /  HAVE_LIBDW_SUPPORT
                 dwarf-unwind            /  HAVE_DWARF_UNWIND_SUPPORT
                 auxtrace                /  HAVE_AUXTRACE_SUPPORT
-                libaudit                /  HAVE_LIBAUDIT_SUPPORT
                 libbfd                  /  HAVE_LIBBFD_SUPPORT
                 libcapstone             /  HAVE_LIBCAPSTONE_SUPPORT
                 libcrypto               /  HAVE_LIBCRYPTO_SUPPORT
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 3f82ba907381049213c055ab10c3fe14d9572073..a57b2364578f57e31476f5041a06a0cd22d8b27e 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -28,20 +28,7 @@ include $(srctree)/tools/scripts/Makefile.arch
 
 $(call detected_var,SRCARCH)
 
-ifneq ($(NO_SYSCALL_TABLE),1)
-  NO_SYSCALL_TABLE := 1
-
-  # architectures that use the generic syscall table scripts
-  ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
-    NO_SYSCALL_TABLE := 0
-    CFLAGS += -DGENERIC_SYSCALL_TABLE
-    CFLAGS += -I$(OUTPUT)tools/perf/arch/$(SRCARCH)/include/generated
-  endif
-
-  ifneq ($(NO_SYSCALL_TABLE),1)
-    CFLAGS += -DHAVE_SYSCALL_TABLE_SUPPORT
-  endif
-endif
+CFLAGS += -I$(OUTPUT)tools/perf/arch/$(SRCARCH)/include/generated
 
 # Additional ARCH settings for ppc
 ifeq ($(SRCARCH),powerpc)
@@ -755,21 +742,7 @@ ifndef NO_LIBUNWIND
 endif
 
 ifneq ($(NO_LIBTRACEEVENT),1)
-  ifeq ($(NO_SYSCALL_TABLE),0)
-    $(call detected,CONFIG_TRACE)
-  else
-    ifndef NO_LIBAUDIT
-      $(call feature_check,libaudit)
-      ifneq ($(feature-libaudit), 1)
-        $(warning No libaudit.h found, disables 'trace' tool, please install audit-libs-devel or libaudit-dev)
-        NO_LIBAUDIT := 1
-      else
-        CFLAGS += -DHAVE_LIBAUDIT_SUPPORT
-        EXTLIBS += -laudit
-        $(call detected,CONFIG_TRACE)
-      endif
-    endif
-  endif
+  $(call detected,CONFIG_TRACE)
 endif
 
 ifndef NO_LIBCRYPTO
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 2c6a509c800d3037933c9b49e5a7dafbf78fda0c..ab2d075ff3a23350a5eea12508cf0376f1d9f4e8 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -59,8 +59,6 @@ include ../scripts/utilities.mak
 #
 # Define NO_LIBNUMA if you do not want numa perf benchmark
 #
-# Define NO_LIBAUDIT if you do not want libaudit support
-#
 # Define NO_LIBBIONIC if you do not want bionic support
 #
 # Define NO_LIBCRYPTO if you do not want libcrypto (openssl) support
@@ -119,10 +117,6 @@ include ../scripts/utilities.mak
 #
 # Define LIBBPF_DYNAMIC to enable libbpf dynamic linking.
 #
-# Define NO_SYSCALL_TABLE=1 to disable the use of syscall id to/from name tables
-# generated from the kernel .tbl or unistd.h files and use, if available, libaudit
-# for doing the conversions to/from strings/id.
-#
 # Define NO_LIBPFM4 to disable libpfm4 events extension.
 #
 # Define NO_LIBDEBUGINFOD if you do not want support debuginfod
@@ -310,11 +304,7 @@ ifeq ($(filter feature-dump,$(MAKECMDGOALS)),feature-dump)
 FEATURE_TESTS := all
 endif
 endif
-# architectures that use the generic syscall table
-generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips powerpc s390
-ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
-endif
 include Makefile.config
 endif
 
@@ -1099,11 +1089,6 @@ endif
 		$(INSTALL) $(OUTPUT)perf-archive -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)'
 	$(call QUIET_INSTALL, perf-iostat) \
 		$(INSTALL) $(OUTPUT)perf-iostat -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)'
-ifndef NO_LIBAUDIT
-	$(call QUIET_INSTALL, strace/groups) \
-		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(STRACE_GROUPS_INSTDIR_SQ)'; \
-		$(INSTALL) trace/strace/groups/* -m 644 -t '$(DESTDIR_SQ)$(STRACE_GROUPS_INSTDIR_SQ)'
-endif
 ifndef NO_LIBPERL
 	$(call QUIET_INSTALL, perl-scripts) \
 		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/scripts/perl/Perf-Trace-Util/lib/Perf/Trace'; \
diff --git a/tools/perf/builtin-check.c b/tools/perf/builtin-check.c
index 2346536a5ee14f91ecd10bd130a64676e871e1b2..7aed7b9f4f5270527ee1d36327eb6a01f196a46a 100644
--- a/tools/perf/builtin-check.c
+++ b/tools/perf/builtin-check.c
@@ -31,7 +31,6 @@ struct feature_status supported_features[] = {
 	FEATURE_STATUS("dwarf_getlocations", HAVE_LIBDW_SUPPORT),
 	FEATURE_STATUS("dwarf-unwind", HAVE_DWARF_UNWIND_SUPPORT),
 	FEATURE_STATUS("auxtrace", HAVE_AUXTRACE_SUPPORT),
-	FEATURE_STATUS("libaudit", HAVE_LIBAUDIT_SUPPORT),
 	FEATURE_STATUS("libbfd", HAVE_LIBBFD_SUPPORT),
 	FEATURE_STATUS("libcapstone", HAVE_LIBCAPSTONE_SUPPORT),
 	FEATURE_STATUS("libcrypto", HAVE_LIBCRYPTO_SUPPORT),
diff --git a/tools/perf/builtin-help.c b/tools/perf/builtin-help.c
index 0854d3cd9f6a304cd9cb50ad430d5706d91df0e9..7be6fb6df595923c15ae51747d5bf17d867ae785 100644
--- a/tools/perf/builtin-help.c
+++ b/tools/perf/builtin-help.c
@@ -447,9 +447,7 @@ int cmd_help(int argc, const char **argv)
 #ifdef HAVE_LIBELF_SUPPORT
 		"probe",
 #endif
-#if defined(HAVE_LIBAUDIT_SUPPORT) || defined(HAVE_SYSCALL_TABLE_SUPPORT)
 		"trace",
-#endif
 	NULL };
 	const char *builtin_help_usage[] = {
 		"perf help [--all] [--man|--web|--info] [command]",
diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index 6a1a128fe645014d0347ad4ec3e0c9e77ec59aee..0fddf34458db4fe4896d25f427f2ae29cb3aa15f 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -2069,30 +2069,11 @@ static int trace__read_syscall_info(struct trace *trace, int id)
 	const char *name = syscalltbl__name(trace->sctbl, id);
 	int err;
 
-#ifdef HAVE_SYSCALL_TABLE_SUPPORT
 	if (trace->syscalls.table == NULL) {
 		trace->syscalls.table = calloc(trace->sctbl->syscalls.max_id + 1, sizeof(*sc));
 		if (trace->syscalls.table == NULL)
 			return -ENOMEM;
 	}
-#else
-	if (id > trace->sctbl->syscalls.max_id || (id == 0 && trace->syscalls.table == NULL)) {
-		// When using libaudit we don't know beforehand what is the max syscall id
-		struct syscall *table = realloc(trace->syscalls.table, (id + 1) * sizeof(*sc));
-
-		if (table == NULL)
-			return -ENOMEM;
-
-		// Need to memset from offset 0 and +1 members if brand new
-		if (trace->syscalls.table == NULL)
-			memset(table, 0, (id + 1) * sizeof(*sc));
-		else
-			memset(table + trace->sctbl->syscalls.max_id + 1, 0, (id - trace->sctbl->syscalls.max_id) * sizeof(*sc));
-
-		trace->syscalls.table	      = table;
-		trace->sctbl->syscalls.max_id = id;
-	}
-#endif
 	sc = trace->syscalls.table + id;
 	if (sc->nonexistent)
 		return -EEXIST;
@@ -2439,18 +2420,7 @@ static struct syscall *trace__syscall_info(struct trace *trace,
 
 	err = -EINVAL;
 
-#ifdef HAVE_SYSCALL_TABLE_SUPPORT
 	if (id > trace->sctbl->syscalls.max_id) {
-#else
-	if (id >= trace->sctbl->syscalls.max_id) {
-		/*
-		 * With libaudit we don't know beforehand what is the max_id,
-		 * so we let trace__read_syscall_info() figure that out as we
-		 * go on reading syscalls.
-		 */
-		err = trace__read_syscall_info(trace, id);
-		if (err)
-#endif
 		goto out_cant_read;
 	}
 
diff --git a/tools/perf/perf.c b/tools/perf/perf.c
index a2987f2cfe1a3958f53239ed1a4eec3f87d7466a..f0617cc41f5fe638986e5d8316a6b3056c2c4bc5 100644
--- a/tools/perf/perf.c
+++ b/tools/perf/perf.c
@@ -84,7 +84,7 @@ static struct cmd_struct commands[] = {
 #endif
 	{ "kvm",	cmd_kvm,	0 },
 	{ "test",	cmd_test,	0 },
-#if defined(HAVE_LIBTRACEEVENT) && (defined(HAVE_LIBAUDIT_SUPPORT) || defined(HAVE_SYSCALL_TABLE_SUPPORT))
+#if defined(HAVE_LIBTRACEEVENT)
 	{ "trace",	cmd_trace,	0 },
 #endif
 	{ "inject",	cmd_inject,	0 },
@@ -514,10 +514,6 @@ int main(int argc, const char **argv)
 		fprintf(stderr,
 			"trace command not available: missing libtraceevent devel package at build time.\n");
 		goto out;
-#elif !defined(HAVE_LIBAUDIT_SUPPORT) && !defined(HAVE_SYSCALL_TABLE_SUPPORT)
-		fprintf(stderr,
-			"trace command not available: missing audit-libs devel package at build time.\n");
-		goto out;
 #else
 		setup_path();
 		argv[0] = "trace";
diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index a7fcbd589752a90459815bd21075528c6dfa4d94..0ee94caf9ec19820a94a87dd46a7ccf1cefb844a 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -86,7 +86,6 @@ make_no_libdw_dwarf_unwind := NO_LIBDW_DWARF_UNWIND=1
 make_no_backtrace   := NO_BACKTRACE=1
 make_no_libcapstone := NO_CAPSTONE=1
 make_no_libnuma     := NO_LIBNUMA=1
-make_no_libaudit    := NO_LIBAUDIT=1
 make_no_libbionic   := NO_LIBBIONIC=1
 make_no_auxtrace    := NO_AUXTRACE=1
 make_no_libbpf	    := NO_LIBBPF=1
@@ -97,7 +96,6 @@ make_no_libllvm     := NO_LIBLLVM=1
 make_with_babeltrace:= LIBBABELTRACE=1
 make_with_coresight := CORESIGHT=1
 make_no_sdt	    := NO_SDT=1
-make_no_syscall_tbl := NO_SYSCALL_TABLE=1
 make_no_libpfm4     := NO_LIBPFM4=1
 make_with_gtk2      := GTK2=1
 make_refcnt_check   := EXTRA_CFLAGS="-DREFCNT_CHECKING=1"
@@ -122,10 +120,10 @@ make_static         := LDFLAGS=-static NO_PERF_READ_VDSO32=1 NO_PERF_READ_VDSOX3
 # all the NO_* variable combined
 make_minimal        := NO_LIBPERL=1 NO_LIBPYTHON=1 NO_GTK2=1
 make_minimal        += NO_DEMANGLE=1 NO_LIBELF=1 NO_BACKTRACE=1
-make_minimal        += NO_LIBNUMA=1 NO_LIBAUDIT=1 NO_LIBBIONIC=1
+make_minimal        += NO_LIBNUMA=1 NO_LIBBIONIC=1
 make_minimal        += NO_LIBDW_DWARF_UNWIND=1 NO_AUXTRACE=1 NO_LIBBPF=1
 make_minimal        += NO_LIBCRYPTO=1 NO_SDT=1 NO_JVMTI=1 NO_LIBZSTD=1
-make_minimal        += NO_LIBCAP=1 NO_SYSCALL_TABLE=1 NO_CAPSTONE=1
+make_minimal        += NO_LIBCAP=1 NO_CAPSTONE=1
 
 # $(run) contains all available tests
 run := make_pure
@@ -158,7 +156,6 @@ run += make_no_libdw_dwarf_unwind
 run += make_no_backtrace
 run += make_no_libcapstone
 run += make_no_libnuma
-run += make_no_libaudit
 run += make_no_libbionic
 run += make_no_auxtrace
 run += make_no_libbpf
diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
index e2843ca2edd92ea5fa1c020ae92b183c496e975e..e9a694350671910d537de599071dbe7fcc18ced4 100644
--- a/tools/perf/util/env.c
+++ b/tools/perf/util/env.c
@@ -474,13 +474,13 @@ const char *perf_env__arch(struct perf_env *env)
 
 const char *perf_env__arch_strerrno(struct perf_env *env __maybe_unused, int err __maybe_unused)
 {
-#if defined(HAVE_SYSCALL_TABLE_SUPPORT) && defined(HAVE_LIBTRACEEVENT)
+#if defined(HAVE_LIBTRACEEVENT)
 	if (env->arch_strerrno == NULL)
 		env->arch_strerrno = arch_syscalls__strerrno_function(perf_env__arch(env));
 
 	return env->arch_strerrno ? env->arch_strerrno(err) : "no arch specific strerrno function";
 #else
-	return "!(HAVE_SYSCALL_TABLE_SUPPORT && HAVE_LIBTRACEEVENT)";
+	return "!HAVE_LIBTRACEEVENT";
 #endif
 }
 
diff --git a/tools/perf/util/generate-cmdlist.sh b/tools/perf/util/generate-cmdlist.sh
index 1b5140e5ce9975fac87b2674dc694f9d4e439a5f..6a73c903d69050df69267a8aeaeeac1ed170efe1 100755
--- a/tools/perf/util/generate-cmdlist.sh
+++ b/tools/perf/util/generate-cmdlist.sh
@@ -38,7 +38,7 @@ do
 done
 echo "#endif /* HAVE_LIBELF_SUPPORT */"
 
-echo "#if defined(HAVE_LIBTRACEEVENT) && (defined(HAVE_LIBAUDIT_SUPPORT) || defined(HAVE_SYSCALL_TABLE_SUPPORT))"
+echo "#if defined(HAVE_LIBTRACEEVENT)"
 sed -n -e 's/^perf-\([^ 	]*\)[ 	].* audit*/\1/p' command-list.txt |
 sort |
 while read cmd
@@ -51,7 +51,7 @@ do
 	    p
      }' "Documentation/perf-$cmd.txt"
 done
-echo "#endif /* HAVE_LIBTRACEEVENT && (HAVE_LIBAUDIT_SUPPORT || HAVE_SYSCALL_TABLE_SUPPORT) */"
+echo "#endif /* HAVE_LIBTRACEEVENT */"
 
 echo "#ifdef HAVE_LIBTRACEEVENT"
 sed -n -e 's/^perf-\([^ 	]*\)[ 	].* traceevent.*/\1/p' command-list.txt |
diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index 210f61b0a7a264a427ebb602185d3a9da2f426f4..928aca4cd6e9f2f26c5c4fd825b4538c064a4cc3 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -10,20 +10,12 @@
 #include <linux/compiler.h>
 #include <linux/zalloc.h>
 
-#ifdef HAVE_SYSCALL_TABLE_SUPPORT
 #include <string.h>
 #include "string2.h"
 
-#if defined(GENERIC_SYSCALL_TABLE)
 #include <syscall_table.h>
 const int syscalltbl_native_max_id = SYSCALLTBL_MAX_ID;
 static const char *const *syscalltbl_native = syscalltbl;
-#else
-const int syscalltbl_native_max_id = 0;
-static const char *const syscalltbl_native[] = {
-	[0] = "unknown",
-};
-#endif
 
 struct syscall {
 	int id;
@@ -131,47 +123,3 @@ int syscalltbl__strglobmatch_first(struct syscalltbl *tbl, const char *syscall_g
 	*idx = -1;
 	return syscalltbl__strglobmatch_next(tbl, syscall_glob, idx);
 }
-
-#else /* HAVE_SYSCALL_TABLE_SUPPORT */
-
-#include <libaudit.h>
-
-struct syscalltbl *syscalltbl__new(void)
-{
-	struct syscalltbl *tbl = zalloc(sizeof(*tbl));
-	if (tbl)
-		tbl->audit_machine = audit_detect_machine();
-	return tbl;
-}
-
-void syscalltbl__delete(struct syscalltbl *tbl)
-{
-	free(tbl);
-}
-
-const char *syscalltbl__name(const struct syscalltbl *tbl, int id)
-{
-	return audit_syscall_to_name(id, tbl->audit_machine);
-}
-
-int syscalltbl__id(struct syscalltbl *tbl, const char *name)
-{
-	return audit_name_to_syscall(name, tbl->audit_machine);
-}
-
-int syscalltbl__id_at_idx(struct syscalltbl *tbl __maybe_unused, int idx)
-{
-	return idx;
-}
-
-int syscalltbl__strglobmatch_next(struct syscalltbl *tbl __maybe_unused,
-				  const char *syscall_glob __maybe_unused, int *idx __maybe_unused)
-{
-	return -1;
-}
-
-int syscalltbl__strglobmatch_first(struct syscalltbl *tbl, const char *syscall_glob, int *idx)
-{
-	return syscalltbl__strglobmatch_next(tbl, syscall_glob, idx);
-}
-#endif /* HAVE_SYSCALL_TABLE_SUPPORT */

-- 
2.34.1


