Return-Path: <linux-doc+bounces-40720-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA29A5F33B
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 12:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41A3C17E8A0
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 11:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D68269CFD;
	Thu, 13 Mar 2025 11:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ueem3qgu"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41ED26989F
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866299; cv=none; b=nkHHrEkS3LcioPNiMseVq9fZdkvSFsBD16zHgUP+DAb+wdOozLuF0p74h9Rq5s+Rokca0n2LJcR8sESrJiCWTBU33oHD1DmaH0I/Y5gtKjBKUtywifl2qa7064MrFgys0IMdIEjW/CKgB17k4BC0fQzxjyVh8n0GAe6H+sB1nE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866299; c=relaxed/simple;
	bh=NbfqpVn1osOn99nDNr/w9uuM1r2DWHYwWsVBZu8K+4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=kYxbWPGLY1LiwjcJstDOSzVU3xWdhKrYvnXz/Xi4YNuVGFBZoPr6EMgLJGFZW51s4UuzkSpxlrBAz6qwSnVgPN9xXxTQ1QxkmFCWwmoRZ9rmKwlUnipomDqNrbvQGzT3Z0ShadPGOuaJFChVdzEjbWUIFJ3VGnofpvObseOgUsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ueem3qgu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuCFF39iXwBMHtdVpJheMeZKmjdk+AFM9NbRaPloTHM=;
	b=Ueem3qgu/bwrPeThggc8eKEZiZKCmBXNYZTVPIBU0m3PMAm+F6TvBn/xP1RgHL3spX5D/q
	4/o5TZaodkLFpfbVO9btq53ucOCuWY0pXlkLygMOuHcvN+SP5Z2Z8H0Hj+pyAYUFFjnVvf
	X/lbH228eB72/reWPv0oRXBouWFJNxc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-iSFEL3fxNoqO6NJhZ1mbGQ-1; Thu, 13 Mar 2025 07:44:55 -0400
X-MC-Unique: iSFEL3fxNoqO6NJhZ1mbGQ-1
X-Mimecast-MFC-AGG-ID: iSFEL3fxNoqO6NJhZ1mbGQ_1741866294
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so4303885e9.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866294; x=1742471094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuCFF39iXwBMHtdVpJheMeZKmjdk+AFM9NbRaPloTHM=;
        b=MpZxrQuJDvp77I4+CVd5nadiDTbjDQJl/5fR9UcAQpg6l7zG3x0fD2ZAtg1OIS2Acq
         Eh3mafPGdPPUhloSCnJAShR2OkHYxNpigdDEhAEPSOhCPj8L0D4+WHlho9KTx+wKafnO
         hMlBb7oo5AUt4Smjgisj/sLuhVRpmMH+zrZr9HbBjYVC6l5sMemrXxBBwLmOFH0z1883
         R0c/JOtsnc23HYgQ7SKflW7iQFiSXykxusU4XO4ITU4IeTlm30AtTTCQA22OIeQxXgrW
         jCIRByqZQZ7wVwGGKKxUL+HHTPsy6oybIFEvI2rhNv7z4gvBcaHmcYj3XgjI2rM0FpJ5
         P2NA==
X-Forwarded-Encrypted: i=1; AJvYcCUS+x1bWFGYZwD3LWzYGqKxfL8qvnOOPda+CS1BDmMC0Laj1q5z0Y+K2faAowkWFTzyckdxLw4BQmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxbD/45xiMGVz7eSCx4FRdSlJO/eP5iwr5YBFGuSQXusjztOi3
	c0lzvesfuLaWLdEDOLNcwHhxpjt6q8iCFBOCzPLi3IlxJrnI1dG7w61bHv4vALLOuXJEpEjNA8v
	thKK4Cm6A0gkqHwQlwuy1rGSe8zhIv6+3ieH1amhhCWX+uUuoEMEXeul40Q==
X-Gm-Gg: ASbGncs4h5QFgZKRRgtQqzwov57nOc4t/StOcfnglD80/qu3XEjUZ1wzeznHcx5d02L
	WRTlb3bUdmgFlRyPN5g877eQsQNK9U+3Et5BJIJYGk4PS8gU+NKJNFHbyEDTSF4U0P0W5rLZmKJ
	hRE88IJTkHK5HwqeX93tsutKUiEA2kLjRMf1sRYUAW37sYYgyIOdVrs5ipzpaei1YfLeTpIF8G7
	bea5UES3uNYS/b5sMrZHaafWH7kTp+h/scwjtVTR/6vM9VJKY2L5khAiChV0gmZbRvSxWC/Q0ZS
	jCJhMR27MOyA9p6h2Yu7
X-Received: by 2002:a05:600c:448a:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-43cee6235b7mr136023545e9.27.1741866293871;
        Thu, 13 Mar 2025 04:44:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0wHJ2zwJ8yj3cYw/s9VH9lfhVlHVsfQsMYeCFjOVxBPaF+5L2/VWS3+5UdzriUt/uCnhyuw==
X-Received: by 2002:a05:600c:448a:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-43cee6235b7mr136023005e9.27.1741866293519;
        Thu, 13 Mar 2025 04:44:53 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:52 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 11/14] sh: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:26 +0000
Message-Id: <20250313114329.284104-12-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Guenter Roeck <linux@roeck-us.net>

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
parameter is replaced with a (dummy) NULL parameter to avoid an image size
increase due to unused __func__ entries (this is necessary because __func__
is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 05a485c4fabc..470ce6567d20 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -24,21 +24,36 @@
  * The offending file and line are encoded in the __bug_table section.
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-	"\t.short %O2, %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	__BUG_FUNC_PTR				\
+	"\t.short %O3, %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b\n"			\
-	"\t.short %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	"\t.short %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #endif
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define BUG()						\
 do {							\
 	__asm__ __volatile__ (				\
@@ -47,6 +62,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__), "i" (0),		\
 		   "i" (sizeof(struct bug_entry)));	\
 	unreachable();					\
@@ -60,6 +76,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_WARNING|(flags)),	\
 		   "i" (sizeof(struct bug_entry)));	\
@@ -85,6 +102,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_UNWINDER),		\
 		   "i" (sizeof(struct bug_entry)));	\
-- 
2.34.1


