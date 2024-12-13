Return-Path: <linux-doc+bounces-32641-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9A9F00F5
	for <lists+linux-doc@lfdr.de>; Fri, 13 Dec 2024 01:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D8C3285EE6
	for <lists+linux-doc@lfdr.de>; Fri, 13 Dec 2024 00:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0487A15F41F;
	Fri, 13 Dec 2024 00:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="AZ0QwbaV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363321514CC
	for <linux-doc@vger.kernel.org>; Fri, 13 Dec 2024 00:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734050010; cv=none; b=kll/OODYmwGF/dj9hhOVADMVJln3qkRUZbZfDL8KNRWAX58N3MZNFlwOLmi5y6R9AqJRgsZWK8n0ds7dBPe4+3IWdu5uxfKz5X6FxlKPo+N8zT3S8UJnSo8mnjKbwHj11RiNCz2rix9qUBQ35Lz+Yty8Pggo7TitWia+dMH5abg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734050010; c=relaxed/simple;
	bh=+ANuxQtpXOkmYhVa/IicI6rEqDLhvVcELktLu8Heytk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYbBCJsnFhbsYavpP1KQNElKHbO60NjVhrdiqHdvHthBTNhYTojdccydSQx7PNHcNMoKR7FBWChRbJ8N/rmvKs20XFUa0oUyrUUyQULcBBTVmGqZUWODiZapoghApHFVv9cnCU7b774rQEgrTg9LwEaL77Q6oW4VylV8X+a/BwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=AZ0QwbaV; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2efa856e4a4so870382a91.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2024 16:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734050006; x=1734654806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yktWQsS3VyGMkSE7oM25NtivsCw2LCE7DYhxNwduxeU=;
        b=AZ0QwbaV8NX0MffGmuzVK0U7bLaSqWdrn7j8mUwJxfqFykV8qt47UGo1q6TGsKeS9w
         ZCpJo5pUfCnUpog2o/8ebsh9fOHUC8IOh1ArfpufacNxAKFF3JFuc2Swe/+GcK54DwJU
         dnenX3O20fQmsNayK8tgKK1QOaK0qJy0RhYgpD6exeUiMk7fThQ+bkfv1a4RPk1GFYvK
         ylTag/26yGGaSQPPqDhVluqJgNJlwz9YbrUP4EHeF8VBXvuRLP3ZRXIBWABitddJS+KL
         thjhYRTBgEmnYaa/3qv3hvYACRvn/s1insHOXLvrSDNzMubJ3eIHH+4A9MmZqDK18SOX
         h/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734050006; x=1734654806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yktWQsS3VyGMkSE7oM25NtivsCw2LCE7DYhxNwduxeU=;
        b=Q9yJP+CrIQiwMU6PR24WZt8Wtfki+7rZ+R/7fIumbwmLsYpU09mhxE5jiwAjYn01yX
         3PXuBz070WA0qWtKP3Bsm26NWBtaTeFHsbharHtgXnWg9QLHfwU4zzm018iliLD8tJzw
         bTr8defOFEkSFX6GTN0TlxffYERyRvgzHTYzkFh2QMDP7awqBk/vEHG58vOvCBxu+I67
         fgcZMJwcXEv0cA2r4AyDBFfs/+cS4aSTnEVCinHwZXh5EjVnZp8sxNOcxxYwD1axpNId
         lFS/i8mJ14gfebWsnCKIqZiXCSCd2Lp2TDD1gCT1BVeYN5g/jU6tGTu0ESzE9vSSRicA
         3jHw==
X-Forwarded-Encrypted: i=1; AJvYcCU2F/eZn/sLN9UvEiqPr2MblNFdzTsAQNt4DqKpiQBi2VV7kN3pnBIJT19cuuwrRtb5m1OLMXZbvYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7NKKtCvTfsbNjCHpexCIIrzrRSk/PVtYo571sl9PIC4EJH/kD
	W+DYAXORvOzcJuuNEbjicLJtqAb5hWVCUyZEi2bjbgLkdnb1zRza2lIkrorXlVg=
X-Gm-Gg: ASbGnctYoXSYP/9v/xRQtXQqz/BXaPbaTQRZrM+cEzAesTnr/A0M8niiUFtZosT2Ij+
	wJC+Bu8nBJpEzp/qu2Vlyaii4QFPzUkrtciJgna0mTRHOoVk/e3AXK1uknQwRBIarioPQT9P67W
	fLirmNzIPjHuShL34rA+Ll6Dk2PN91V67Ql6ohb1UDTQVzW6zld6RMAq7CV1+XKFC04sHFdWq10
	RW9Ma35sQ3FLTquTBCzIjaqFt2izkRi3QsLz6oq38mwx9zYXykC+XQL5dxEPjUkiEObBBDg
X-Google-Smtp-Source: AGHT+IFrm8sS1hWmCXxEkC7U+dAs2T0sT/L2wrXqLG3+IZ91vhNkk1Oq4eKvs+OppHYN7tC4Gu+7xQ==
X-Received: by 2002:a17:90b:2b45:b0:2ee:c457:bf83 with SMTP id 98e67ed59e1d1-2f28fd6f852mr1082614a91.19.1734050006317;
        Thu, 12 Dec 2024 16:33:26 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142e0ce50sm1934462a91.39.2024.12.12.16.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:33:25 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 12 Dec 2024 16:32:57 -0800
Subject: [PATCH v2 07/16] perf tools: xtensa: Support syscall header
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-perf_syscalltbl-v2-7-f8ca984ffe40@rivosinc.com>
References: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
In-Reply-To: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=21454; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=+ANuxQtpXOkmYhVa/IicI6rEqDLhvVcELktLu8Heytk=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3p0w75NR3exLZsu9/h2+r4X2761sLqaKrF2LhE/tlg32
 /74suM2HaUsDGIcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEzEcxnD/+KyfF650om65650
 T8stlag6Wx0t2GrwRJDxxM67ExsL5zIybHdMTXx8rtnqwrUqiblCeQv+/tP60eZ99WTQV8F3cxJ
 l+QE=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

xtensa uses a syscall table, use that in perf instead of requiring
libaudit.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                         |   2 +-
 tools/perf/Makefile.perf                           |   2 +-
 tools/perf/arch/xtensa/entry/syscalls/Kbuild       |   2 +
 .../arch/xtensa/entry/syscalls/Makefile.syscalls   |   4 +
 tools/perf/arch/xtensa/entry/syscalls/syscall.tbl  | 439 +++++++++++++++++++++
 tools/perf/arch/xtensa/include/syscall_table.h     |   2 +
 tools/perf/check-headers.sh                        |   1 +
 7 files changed, 450 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index ee67e39be17215847a2cc85e141938a77bac1b97..9348c1e72bf00f43faf1c9aadab171236e6c3621 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -36,7 +36,7 @@ ifneq ($(NO_SYSCALL_TABLE),1)
   endif
 
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa))
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)/tools/perf/arch/$(SRCARCH)/include/generated
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 773f9d1913b02abf526054bcabbec9197fd86c28..c7e1c6b7f8d97dddf07eab122a169b379ec43a19 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc))
+ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa))
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
 include Makefile.config
diff --git a/tools/perf/arch/xtensa/entry/syscalls/Kbuild b/tools/perf/arch/xtensa/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..11707c481a24ecf4e220e51eb1aca890fe929a13
--- /dev/null
+++ b/tools/perf/arch/xtensa/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls b/tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..d4aa2358460c13945a8299b6513c93d35a5c5ea4
--- /dev/null
+++ b/tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32  +=
+syscalltbl = $(srctree)/tools/perf/arch/xtensa/entry/syscalls/syscall.tbl
diff --git a/tools/perf/arch/xtensa/entry/syscalls/syscall.tbl b/tools/perf/arch/xtensa/entry/syscalls/syscall.tbl
new file mode 100644
index 0000000000000000000000000000000000000000..37effc1b134eea061f2c350c1d68b4436b65a4dd
--- /dev/null
+++ b/tools/perf/arch/xtensa/entry/syscalls/syscall.tbl
@@ -0,0 +1,439 @@
+# SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+#
+# system call numbers and entry vectors for xtensa
+#
+# The format is:
+# <number> <abi> <name> <entry point>
+#
+# The <abi> is always "common" for this file
+#
+0	common	spill				sys_ni_syscall
+1	common	xtensa				sys_ni_syscall
+2	common	available4			sys_ni_syscall
+3	common	available5			sys_ni_syscall
+4	common	available6			sys_ni_syscall
+5	common	available7			sys_ni_syscall
+6	common	available8			sys_ni_syscall
+7	common	available9			sys_ni_syscall
+# File Operations
+8	common	open				sys_open
+9	common	close				sys_close
+10	common	dup				sys_dup
+11	common	dup2				sys_dup2
+12	common	read				sys_read
+13	common	write				sys_write
+14	common	select				sys_select
+15	common	lseek				sys_lseek
+16	common	poll				sys_poll
+17	common	_llseek				sys_llseek
+18	common	epoll_wait			sys_epoll_wait
+19	common	epoll_ctl			sys_epoll_ctl
+20	common	epoll_create			sys_epoll_create
+21	common	creat				sys_creat
+22	common	truncate			sys_truncate
+23	common	ftruncate			sys_ftruncate
+24	common	readv				sys_readv
+25	common	writev				sys_writev
+26	common	fsync				sys_fsync
+27	common	fdatasync			sys_fdatasync
+28	common	truncate64			sys_truncate64
+29	common	ftruncate64			sys_ftruncate64
+30	common	pread64				sys_pread64
+31	common	pwrite64			sys_pwrite64
+32	common	link				sys_link
+33	common	rename				sys_rename
+34	common	symlink				sys_symlink
+35	common	readlink			sys_readlink
+36	common	mknod				sys_mknod
+37	common	pipe				sys_pipe
+38	common	unlink				sys_unlink
+39	common	rmdir				sys_rmdir
+40	common	mkdir				sys_mkdir
+41	common	chdir				sys_chdir
+42	common	fchdir				sys_fchdir
+43	common	getcwd				sys_getcwd
+44	common	chmod				sys_chmod
+45	common	chown				sys_chown
+46	common	stat				sys_newstat
+47	common	stat64				sys_stat64
+48	common	lchown				sys_lchown
+49	common	lstat				sys_newlstat
+50	common	lstat64				sys_lstat64
+51	common	available51			sys_ni_syscall
+52	common	fchmod				sys_fchmod
+53	common	fchown				sys_fchown
+54	common	fstat				sys_newfstat
+55	common	fstat64				sys_fstat64
+56	common	flock				sys_flock
+57	common	access				sys_access
+58	common	umask				sys_umask
+59	common	getdents			sys_getdents
+60	common	getdents64			sys_getdents64
+61	common	fcntl64				sys_fcntl64
+62	common	fallocate			sys_fallocate
+63	common	fadvise64_64			xtensa_fadvise64_64
+64	common	utime				sys_utime32
+65	common	utimes				sys_utimes_time32
+66	common	ioctl				sys_ioctl
+67	common	fcntl				sys_fcntl
+68	common	setxattr			sys_setxattr
+69	common	getxattr			sys_getxattr
+70	common	listxattr			sys_listxattr
+71	common	removexattr			sys_removexattr
+72	common	lsetxattr			sys_lsetxattr
+73	common	lgetxattr			sys_lgetxattr
+74	common	llistxattr			sys_llistxattr
+75	common	lremovexattr			sys_lremovexattr
+76	common	fsetxattr			sys_fsetxattr
+77	common	fgetxattr			sys_fgetxattr
+78	common	flistxattr			sys_flistxattr
+79	common	fremovexattr			sys_fremovexattr
+# File Map / Shared Memory Operations
+80	common	mmap2				sys_mmap_pgoff
+81	common	munmap				sys_munmap
+82	common	mprotect			sys_mprotect
+83	common	brk				sys_brk
+84	common	mlock				sys_mlock
+85	common	munlock				sys_munlock
+86	common	mlockall			sys_mlockall
+87	common	munlockall			sys_munlockall
+88	common	mremap				sys_mremap
+89	common	msync				sys_msync
+90	common	mincore				sys_mincore
+91	common	madvise				sys_madvise
+92	common	shmget				sys_shmget
+93	common	shmat				xtensa_shmat
+94	common	shmctl				sys_old_shmctl
+95	common	shmdt				sys_shmdt
+# Socket Operations
+96	common	socket				sys_socket
+97	common	setsockopt			sys_setsockopt
+98	common	getsockopt			sys_getsockopt
+99	common	shutdown			sys_shutdown
+100	common	bind				sys_bind
+101	common	connect				sys_connect
+102	common	listen				sys_listen
+103	common	accept				sys_accept
+104	common	getsockname			sys_getsockname
+105	common	getpeername			sys_getpeername
+106	common	sendmsg				sys_sendmsg
+107	common	recvmsg				sys_recvmsg
+108	common	send				sys_send
+109	common	recv				sys_recv
+110	common	sendto				sys_sendto
+111	common	recvfrom			sys_recvfrom
+112	common	socketpair			sys_socketpair
+113	common	sendfile			sys_sendfile
+114	common	sendfile64			sys_sendfile64
+115	common	sendmmsg			sys_sendmmsg
+# Process Operations
+116	common	clone				sys_clone
+117	common	execve				sys_execve
+118	common	exit				sys_exit
+119	common	exit_group			sys_exit_group
+120	common	getpid				sys_getpid
+121	common	wait4				sys_wait4
+122	common	waitid				sys_waitid
+123	common	kill				sys_kill
+124	common	tkill				sys_tkill
+125	common	tgkill				sys_tgkill
+126	common	set_tid_address			sys_set_tid_address
+127	common	gettid				sys_gettid
+128	common	setsid				sys_setsid
+129	common	getsid				sys_getsid
+130	common	prctl				sys_prctl
+131	common	personality			sys_personality
+132	common	getpriority			sys_getpriority
+133	common	setpriority			sys_setpriority
+134	common	setitimer			sys_setitimer
+135	common	getitimer			sys_getitimer
+136	common	setuid				sys_setuid
+137	common	getuid				sys_getuid
+138	common	setgid				sys_setgid
+139	common	getgid				sys_getgid
+140	common	geteuid				sys_geteuid
+141	common	getegid				sys_getegid
+142	common	setreuid			sys_setreuid
+143	common	setregid			sys_setregid
+144	common	setresuid			sys_setresuid
+145	common	getresuid			sys_getresuid
+146	common	setresgid			sys_setresgid
+147	common	getresgid			sys_getresgid
+148	common	setpgid				sys_setpgid
+149	common	getpgid				sys_getpgid
+150	common	getppid				sys_getppid
+151	common	getpgrp				sys_getpgrp
+# 152 was set_thread_area
+152	common	reserved152			sys_ni_syscall
+# 153 was get_thread_area
+153	common	reserved153			sys_ni_syscall
+154	common	times				sys_times
+155	common	acct				sys_acct
+156	common	sched_setaffinity		sys_sched_setaffinity
+157	common	sched_getaffinity		sys_sched_getaffinity
+158	common	capget				sys_capget
+159	common	capset				sys_capset
+160	common	ptrace				sys_ptrace
+161	common	semtimedop			sys_semtimedop_time32
+162	common	semget				sys_semget
+163	common	semop				sys_semop
+164	common	semctl				sys_old_semctl
+165	common	available165			sys_ni_syscall
+166	common	msgget				sys_msgget
+167	common	msgsnd				sys_msgsnd
+168	common	msgrcv				sys_msgrcv
+169	common	msgctl				sys_old_msgctl
+170	common	available170			sys_ni_syscall
+# File System
+171	common	umount2				sys_umount
+172	common	mount				sys_mount
+173	common	swapon				sys_swapon
+174	common	chroot				sys_chroot
+175	common	pivot_root			sys_pivot_root
+176	common	umount				sys_oldumount
+177	common	swapoff				sys_swapoff
+178	common	sync				sys_sync
+179	common	syncfs				sys_syncfs
+180	common	setfsuid			sys_setfsuid
+181	common	setfsgid			sys_setfsgid
+182	common	sysfs				sys_sysfs
+183	common	ustat				sys_ustat
+184	common	statfs				sys_statfs
+185	common	fstatfs				sys_fstatfs
+186	common	statfs64			sys_statfs64
+187	common	fstatfs64			sys_fstatfs64
+# System
+188	common	setrlimit			sys_setrlimit
+189	common	getrlimit			sys_getrlimit
+190	common	getrusage			sys_getrusage
+191	common	futex				sys_futex_time32
+192	common	gettimeofday			sys_gettimeofday
+193	common	settimeofday			sys_settimeofday
+194	common	adjtimex			sys_adjtimex_time32
+195	common	nanosleep			sys_nanosleep_time32
+196	common	getgroups			sys_getgroups
+197	common	setgroups			sys_setgroups
+198	common	sethostname			sys_sethostname
+199	common	setdomainname			sys_setdomainname
+200	common	syslog				sys_syslog
+201	common	vhangup				sys_vhangup
+202	common	uselib				sys_uselib
+203	common	reboot				sys_reboot
+204	common	quotactl			sys_quotactl
+# 205 was old nfsservctl
+205	common	nfsservctl			sys_ni_syscall
+206	common	_sysctl				sys_ni_syscall
+207	common	bdflush				sys_ni_syscall
+208	common	uname				sys_newuname
+209	common	sysinfo				sys_sysinfo
+210	common	init_module			sys_init_module
+211	common	delete_module			sys_delete_module
+212	common	sched_setparam			sys_sched_setparam
+213	common	sched_getparam			sys_sched_getparam
+214	common	sched_setscheduler		sys_sched_setscheduler
+215	common	sched_getscheduler		sys_sched_getscheduler
+216	common	sched_get_priority_max		sys_sched_get_priority_max
+217	common	sched_get_priority_min		sys_sched_get_priority_min
+218	common	sched_rr_get_interval		sys_sched_rr_get_interval_time32
+219	common	sched_yield			sys_sched_yield
+222	common	available222			sys_ni_syscall
+# Signal Handling
+223	common	restart_syscall			sys_restart_syscall
+224	common	sigaltstack			sys_sigaltstack
+225	common	rt_sigreturn			xtensa_rt_sigreturn
+226	common	rt_sigaction			sys_rt_sigaction
+227	common	rt_sigprocmask			sys_rt_sigprocmask
+228	common	rt_sigpending			sys_rt_sigpending
+229	common	rt_sigtimedwait			sys_rt_sigtimedwait_time32
+230	common	rt_sigqueueinfo			sys_rt_sigqueueinfo
+231	common	rt_sigsuspend			sys_rt_sigsuspend
+# Message
+232	common	mq_open				sys_mq_open
+233	common	mq_unlink			sys_mq_unlink
+234	common	mq_timedsend			sys_mq_timedsend_time32
+235	common	mq_timedreceive			sys_mq_timedreceive_time32
+236	common	mq_notify			sys_mq_notify
+237	common	mq_getsetattr			sys_mq_getsetattr
+238	common	available238			sys_ni_syscall
+239	common	io_setup			sys_io_setup
+# IO
+240	common	io_destroy			sys_io_destroy
+241	common	io_submit			sys_io_submit
+242	common	io_getevents			sys_io_getevents_time32
+243	common	io_cancel			sys_io_cancel
+244	common	clock_settime			sys_clock_settime32
+245	common	clock_gettime			sys_clock_gettime32
+246	common	clock_getres			sys_clock_getres_time32
+247	common	clock_nanosleep			sys_clock_nanosleep_time32
+# Timer
+248	common	timer_create			sys_timer_create
+249	common	timer_delete			sys_timer_delete
+250	common	timer_settime			sys_timer_settime32
+251	common	timer_gettime			sys_timer_gettime32
+252	common	timer_getoverrun		sys_timer_getoverrun
+# System
+253	common	reserved253			sys_ni_syscall
+254	common	lookup_dcookie			sys_ni_syscall
+255	common	available255			sys_ni_syscall
+256	common	add_key				sys_add_key
+257	common	request_key			sys_request_key
+258	common	keyctl				sys_keyctl
+259	common	available259			sys_ni_syscall
+260	common	readahead			sys_readahead
+261	common	remap_file_pages		sys_remap_file_pages
+262	common	migrate_pages			sys_migrate_pages
+263	common	mbind				sys_mbind
+264	common	get_mempolicy			sys_get_mempolicy
+265	common	set_mempolicy			sys_set_mempolicy
+266	common	unshare				sys_unshare
+267	common	move_pages			sys_move_pages
+268	common	splice				sys_splice
+269	common	tee				sys_tee
+270	common	vmsplice			sys_vmsplice
+271	common	available271			sys_ni_syscall
+272	common	pselect6			sys_pselect6_time32
+273	common	ppoll				sys_ppoll_time32
+274	common	epoll_pwait			sys_epoll_pwait
+275	common	epoll_create1			sys_epoll_create1
+276	common	inotify_init			sys_inotify_init
+277	common	inotify_add_watch		sys_inotify_add_watch
+278	common	inotify_rm_watch		sys_inotify_rm_watch
+279	common	inotify_init1			sys_inotify_init1
+280	common	getcpu				sys_getcpu
+281	common	kexec_load			sys_ni_syscall
+282	common	ioprio_set			sys_ioprio_set
+283	common	ioprio_get			sys_ioprio_get
+284	common	set_robust_list			sys_set_robust_list
+285	common	get_robust_list			sys_get_robust_list
+286	common	available286			sys_ni_syscall
+287	common	available287			sys_ni_syscall
+# Relative File Operations
+288	common	openat				sys_openat
+289	common	mkdirat				sys_mkdirat
+290	common	mknodat				sys_mknodat
+291	common	unlinkat			sys_unlinkat
+292	common	renameat			sys_renameat
+293	common	linkat				sys_linkat
+294	common	symlinkat			sys_symlinkat
+295	common	readlinkat			sys_readlinkat
+296	common	utimensat			sys_utimensat_time32
+297	common	fchownat			sys_fchownat
+298	common	futimesat			sys_futimesat_time32
+299	common	fstatat64			sys_fstatat64
+300	common	fchmodat			sys_fchmodat
+301	common	faccessat			sys_faccessat
+302	common	available302			sys_ni_syscall
+303	common	available303			sys_ni_syscall
+304	common	signalfd			sys_signalfd
+# 305 was timerfd
+306	common	eventfd				sys_eventfd
+307	common	recvmmsg			sys_recvmmsg_time32
+308	common	setns				sys_setns
+309	common	signalfd4			sys_signalfd4
+310	common	dup3				sys_dup3
+311	common	pipe2				sys_pipe2
+312	common	timerfd_create			sys_timerfd_create
+313	common	timerfd_settime			sys_timerfd_settime32
+314	common	timerfd_gettime			sys_timerfd_gettime32
+315	common	available315			sys_ni_syscall
+316	common	eventfd2			sys_eventfd2
+317	common	preadv				sys_preadv
+318	common	pwritev				sys_pwritev
+319	common	available319			sys_ni_syscall
+320	common	fanotify_init			sys_fanotify_init
+321	common	fanotify_mark			sys_fanotify_mark
+322	common	process_vm_readv		sys_process_vm_readv
+323	common	process_vm_writev		sys_process_vm_writev
+324	common	name_to_handle_at		sys_name_to_handle_at
+325	common	open_by_handle_at		sys_open_by_handle_at
+326	common	sync_file_range2		sys_sync_file_range2
+327	common	perf_event_open			sys_perf_event_open
+328	common	rt_tgsigqueueinfo		sys_rt_tgsigqueueinfo
+329	common	clock_adjtime			sys_clock_adjtime32
+330	common	prlimit64			sys_prlimit64
+331	common	kcmp				sys_kcmp
+332	common	finit_module			sys_finit_module
+333	common	accept4				sys_accept4
+334	common	sched_setattr			sys_sched_setattr
+335	common	sched_getattr			sys_sched_getattr
+336	common	renameat2			sys_renameat2
+337	common	seccomp				sys_seccomp
+338	common	getrandom			sys_getrandom
+339	common	memfd_create			sys_memfd_create
+340	common	bpf				sys_bpf
+341	common	execveat			sys_execveat
+342	common	userfaultfd			sys_userfaultfd
+343	common	membarrier			sys_membarrier
+344	common	mlock2				sys_mlock2
+345	common	copy_file_range			sys_copy_file_range
+346	common	preadv2				sys_preadv2
+347	common	pwritev2			sys_pwritev2
+348	common	pkey_mprotect			sys_pkey_mprotect
+349	common	pkey_alloc			sys_pkey_alloc
+350	common	pkey_free			sys_pkey_free
+351	common	statx				sys_statx
+352	common	rseq				sys_rseq
+# 353 through 402 are unassigned to sync up with generic numbers
+403	common	clock_gettime64			sys_clock_gettime
+404	common	clock_settime64			sys_clock_settime
+405	common	clock_adjtime64			sys_clock_adjtime
+406	common	clock_getres_time64		sys_clock_getres
+407	common	clock_nanosleep_time64		sys_clock_nanosleep
+408	common	timer_gettime64			sys_timer_gettime
+409	common	timer_settime64			sys_timer_settime
+410	common	timerfd_gettime64		sys_timerfd_gettime
+411	common	timerfd_settime64		sys_timerfd_settime
+412	common	utimensat_time64		sys_utimensat
+413	common	pselect6_time64			sys_pselect6
+414	common	ppoll_time64			sys_ppoll
+416	common	io_pgetevents_time64		sys_io_pgetevents
+417	common	recvmmsg_time64			sys_recvmmsg
+418	common	mq_timedsend_time64		sys_mq_timedsend
+419	common	mq_timedreceive_time64		sys_mq_timedreceive
+420	common	semtimedop_time64		sys_semtimedop
+421	common	rt_sigtimedwait_time64		sys_rt_sigtimedwait
+422	common	futex_time64			sys_futex
+423	common	sched_rr_get_interval_time64	sys_sched_rr_get_interval
+424	common	pidfd_send_signal		sys_pidfd_send_signal
+425	common	io_uring_setup			sys_io_uring_setup
+426	common	io_uring_enter			sys_io_uring_enter
+427	common	io_uring_register		sys_io_uring_register
+428	common	open_tree			sys_open_tree
+429	common	move_mount			sys_move_mount
+430	common	fsopen				sys_fsopen
+431	common	fsconfig			sys_fsconfig
+432	common	fsmount				sys_fsmount
+433	common	fspick				sys_fspick
+434	common	pidfd_open			sys_pidfd_open
+435	common	clone3				sys_clone3
+436	common	close_range			sys_close_range
+437	common	openat2				sys_openat2
+438	common	pidfd_getfd			sys_pidfd_getfd
+439	common	faccessat2			sys_faccessat2
+440	common	process_madvise			sys_process_madvise
+441	common	epoll_pwait2			sys_epoll_pwait2
+442	common	mount_setattr			sys_mount_setattr
+443	common	quotactl_fd			sys_quotactl_fd
+444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+445	common	landlock_add_rule		sys_landlock_add_rule
+446	common	landlock_restrict_self		sys_landlock_restrict_self
+# 447 reserved for memfd_secret
+448	common	process_mrelease		sys_process_mrelease
+449	common  futex_waitv                     sys_futex_waitv
+450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	common	cachestat			sys_cachestat
+452	common	fchmodat2			sys_fchmodat2
+453	common	map_shadow_stack		sys_map_shadow_stack
+454	common	futex_wake			sys_futex_wake
+455	common	futex_wait			sys_futex_wait
+456	common	futex_requeue			sys_futex_requeue
+457	common	statmount			sys_statmount
+458	common	listmount			sys_listmount
+459	common	lsm_get_self_attr		sys_lsm_get_self_attr
+460	common	lsm_set_self_attr		sys_lsm_set_self_attr
+461	common	lsm_list_modules		sys_lsm_list_modules
+462	common	mseal 				sys_mseal
+463	common	setxattrat			sys_setxattrat
+464	common	getxattrat			sys_getxattrat
+465	common	listxattrat			sys_listxattrat
+466	common	removexattrat			sys_removexattrat
diff --git a/tools/perf/arch/xtensa/include/syscall_table.h b/tools/perf/arch/xtensa/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..4c942821662d95216765b176a84d5fc7974e1064
--- /dev/null
+++ b/tools/perf/arch/xtensa/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_32.h>
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index 99a278a3f1b5bf44132c817ed1f2623a232d3dc5..e9e352579e6d33085a1d863441432c81d2353f49 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -205,6 +205,7 @@ check_2 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl arch/mips/kernel/sys
 check_2 tools/perf/arch/arm/entry/syscalls/syscall.tbl arch/arm/tools/syscall.tbl
 check_2 tools/perf/arch/sh/entry/syscalls/syscall.tbl arch/sh/kernel/syscalls/syscall.tbl
 check_2 tools/perf/arch/sparc/entry/syscalls/syscall.tbl arch/sparc/kernel/syscalls/syscall.tbl
+check_2 tools/perf/arch/xtensa/entry/syscalls/syscall.tbl arch/xtensa/kernel/syscalls/syscall.tbl
 
 for i in "${BEAUTY_FILES[@]}"
 do

-- 
2.34.1


