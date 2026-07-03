Return-Path: <linux-doc+bounces-94723-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O3S2EuEdR2qtTQAAu9opvQ
	(envelope-from <linux-doc+bounces-94723-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 04:26:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B73D36FDE7F
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 04:26:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=HAOh61zc;
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94723-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94723-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77F15302A4DE
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 02:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F92262FD0;
	Fri,  3 Jul 2026 02:26:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D0D257ACF
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 02:26:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783045596; cv=none; b=bk7KxqSt0c+EHi3YvhCjpb9qFYraGBr9dgP2tJsdscxKgdnaK9T0VEhPn5mPjaGFxPg2ugpuPlHlHDr9hZ7nf8wcGpFkp1Ww6oVdjMn2vXMKwYtQ6Mddz8B9U+g8e2pKZ/cP2zCtQ92vG3N3e5co8wunySc0X3x30Fy5xwqlqKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783045596; c=relaxed/simple;
	bh=T3XsEkIdyxoaeuMSiyD5B3ZHZUj9TDXqUjBQMbTBX/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B5t9tgJaoecaHtJ5HtJxW7WDi3B5GNzsjZtPkwZiPcmewYGlzDRC9G26uGJdefEWvlg19Jee+qoHSJ1DJTcIWs8fAkM25t1nBM1LFsw+7pSL+yi3YTDOwNvyTPhXBBgksG80COygJIqNXFU6lv+1FfO0vMZyRBNmRQ8xJpGyjVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HAOh61zc; arc=none smtp.client-ip=91.218.175.181
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783045581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZI0lTmkO/UHIT4+QlSIiK8ejRok32RfZUe5uhwcA5/U=;
	b=HAOh61zc+mozxiYtcPNEO5Yx8iORG5T8Mkpg/vMHNt2052hHUqbiQmAarZ6Dw+Wa155V9M
	3s5333q3wzpR9SONk7wmKAVZRq1Oa6jrucylyEZauSAr7GDU5Puc5fP1m+9Lie//AcBW+2
	G42rxvyD2sX024RzcWXP/b0U8+rU9uQ=
From: Leon Hwang <leon.hwang@linux.dev>
To: linux-mm@kvack.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Leon Hwang <leon.hwang@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Gary Guo <gary@garyguo.net>,
	Anand Moon <linux.amoon@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
Date: Fri,  3 Jul 2026 10:25:07 +0800
Message-ID: <20260703022507.187457-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94723-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:akpm@linux-foundation.org,m:liam@infradead.org,m:ljs@kernel.org,m:vbabka@kernel.org,m:jannh@google.com,m:pfalcato@suse.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:leon.hwang@linux.dev,m:nathan@kernel.org,m:peterz@infradead.org,m:ojeda@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:thomas.weissschuh@linutronix.de,m:aliceryhl@google.com,m:dianders@chromium.org,m:gary@garyguo.net,m:linux.amoon@gmail.com,m:rdunlap@infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[leon.hwang@linux.dev,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,linux-foundation.org,infradead.org,kernel.org,google.com,suse.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linux.dev,linutronix.de,chromium.org,garyguo.net,gmail.com,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon.hwang@linux.dev,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:from_mime,linux.dev:email,linux.dev:mid,linux.dev:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B73D36FDE7F

mseal.o is built only for 64-bit kernels, so 32-bit kernels fall back
to sys_ni_syscall() and return -ENOSYS rather than -EPERM.

Document the -EINTR return from mmap_write_lock_killable(), fix the
CONFIG_MSEAL_SYSTEM_MAPPINGS typo, and describe system mappings in
terms of VM_SEALED_SYSMAP.

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 Documentation/userspace-api/mseal.rst | 18 ++++++++++--------
 init/Kconfig                          |  2 +-
 mm/mseal.c                            |  4 ++--
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
index ea9b11a0bd89..1f1cf206670c 100644
--- a/Documentation/userspace-api/mseal.rst
+++ b/Documentation/userspace-api/mseal.rst
@@ -50,8 +50,10 @@ mseal syscall signature
          * The start address (``addr``) is not allocated.
          * The end address (``addr`` + ``len``) is not allocated.
          * A gap (unallocated memory) between start and end address.
-      - **-EPERM**:
-         * sealing is supported only on 64-bit CPUs, 32-bit is not supported.
+      - **-EINTR**:
+         * Interrupted while waiting for the mmap write lock.
+      - **-ENOSYS**:
+         * The kernel does not implement ``mseal()``.
 
    **Note about error return**:
       - For above error cases, users can expect the given memory range is
@@ -62,7 +64,8 @@ mseal syscall signature
         memory range could happen. However, those cases should be rare.
 
    **Architecture support**:
-      mseal only works on 64-bit CPUs, not 32-bit CPUs.
+      mseal is built only for 64-bit kernels. 32-bit kernels return
+      ``-ENOSYS``.
 
    **Idempotent**:
       users can call mseal multiple times. mseal on an already sealed memory
@@ -131,20 +134,19 @@ Use cases
 - Chrome browser: protect some security sensitive data structures.
 
 - System mappings:
-  The system mappings are created by the kernel and includes vdso, vvar,
+  The system mappings are created by the kernel and include vdso, vvar,
   vvar_vclock, vectors (arm compat-mode), sigpage (arm compat-mode), uprobes.
 
   Those system mappings are readonly only or execute only, memory sealing can
-  protect them from ever changing to writable or unmmap/remapped as different
+  protect them from ever changing to writable or unmapped/remapped as different
   attributes. This is useful to mitigate memory corruption issues where a
   corrupted pointer is passed to a memory management system.
 
   If supported by an architecture (CONFIG_ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS),
-  the CONFIG_MSEAL_SYSTEM_MAPPINGS seals all system mappings of this
-  architecture.
+  CONFIG_MSEAL_SYSTEM_MAPPINGS seals mappings marked with VM_SEALED_SYSMAP.
 
   The following architectures currently support this feature: x86-64, arm64,
-  loongarch and s390.
+  loongarch, riscv, and s390.
 
   WARNING: This feature breaks programs which rely on relocating
   or unmapping system mappings. Known broken software at the time
diff --git a/init/Kconfig b/init/Kconfig
index 5230d4879b1c..12bb39f637b1 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2112,7 +2112,7 @@ config ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
 	  from a kernel perspective.
 
 	  After the architecture enables this, a distribution can set
-	  CONFIG_MSEAL_SYSTEM_MAPPING to manage access to the feature.
+	  CONFIG_MSEAL_SYSTEM_MAPPINGS to manage access to the feature.
 
 	  For complete descriptions of memory sealing, please see
 	  Documentation/userspace-api/mseal.rst
diff --git a/mm/mseal.c b/mm/mseal.c
index 9781647483d1..0464c7b94ab9 100644
--- a/mm/mseal.c
+++ b/mm/mseal.c
@@ -132,8 +132,8 @@ static int mseal_apply(struct mm_struct *mm,
  *   addr is not a valid address (not allocated).
  *   end (start + len) is not a valid address.
  *   a gap (unallocated memory) between start and end.
- *  -EPERM:
- *  - In 32 bit architecture, sealing is not supported.
+ *  -EINTR:
+ *   interrupted while waiting for the mmap write lock.
  * Note:
  *  user can call mseal(2) multiple times, adding a seal on an
  *  already sealed memory is a no-action (no error).
-- 
2.54.0


