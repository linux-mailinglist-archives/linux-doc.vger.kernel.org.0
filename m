Return-Path: <linux-doc+bounces-91026-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fnKtK6ZDImrQUQEAu9opvQ
	(envelope-from <linux-doc+bounces-91026-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 05:33:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5539644E26
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 05:33:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=soleen.com header.s=google header.b=Rxx5Y45N;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91026-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91026-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=soleen.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5EDE3011575
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 03:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9921A3B19AB;
	Fri,  5 Jun 2026 03:33:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53EE2EEE98
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 03:33:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630431; cv=none; b=iM8a93f4+yyYfxIDAjD0a5NBwMyFxJJGHF5UsMIsxob0n9GSFgF+WM4pJ7TlcXBQ/pu8rSXTcViDtG403pWltUIGS1L+LlZ5a9ivDGJiUIeiFhXQYHbQ8fS+hVcp1+U3kZYBN8xKAtMDYt6nSFRjq2hx79qsdVwf4QjKlxBGW3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630431; c=relaxed/simple;
	bh=56yqutzR1Yl+W9ZaMZOq3iC0gVO2m06Akdi9QmEvda8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfw2InYFc1JsdLKYTNmtf4/iBTmzc/Ih5W+0MmoLmgO+j4Y8U4Xtl5ek0rDZqdvlfCW5FW9uJbk6eX51Thd0aUkxHOyHZaiUVrtuR9Gbua+qxJ7CE3Cyfz2HNTj3U3sbmwK2KLpgD1QRb1l4K4ARy7zr/4Bg/g1Zb6cCeouNO0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Rxx5Y45N; arc=none smtp.client-ip=209.85.219.54
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8cce77eb087so12619086d6.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 20:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630428; x=1781235228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTLNc6RdVPC/3p3BVrwRRbnK/J4mwuIt5WmEdvU+mDY=;
        b=Rxx5Y45Nr6Qb/IkTNurQAvapSkN1zF+IDadotoPc26sHZlQGD4jHANXejHiESOV9Tq
         TlojiYVCl8Dlv7MWiqou+hknf5jFihysVbH0VHJR2PG1ujZEZ5ScOGWI6kb82B96Vjp4
         sEIrtXtnr7yM795K1MVkb45w51DKwkqL7rzUsLw8pAmU0UoCPKEJdpczZrfUXhL10+SH
         i+8FviEA1lJOdGBZKEbmqcA4/qszZShQT0j3hOKlKe9x9VOmcO5S8EDJDItARn42kdQq
         frM8zmp2HqI4Wmf/QRDm4aGhUlhrogHKczK/vkuW21yqO916T+pwrrpTXFZBOU7JPzc8
         lO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630428; x=1781235228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MTLNc6RdVPC/3p3BVrwRRbnK/J4mwuIt5WmEdvU+mDY=;
        b=lEBJN8UynZAEfqkLNNtpBz+DZ3R2xh0vRNjijvckfk5XanRP35xc+hvhMMfEQ3kSva
         IxQnOAA3l5DsiGCJRoEtkyUDmcVwNI9o6lFq+E693zRdqsG+WdrSCsGr5xul9CyXhQkE
         3nHifhcmwKSpgFoM+ZofWRc/s3eqJS7p4/OFJk+C60a+jgu2cJ5YiCe06KZGStnKdfMU
         wYRyUmCCr6gfUwP+oElK1BXCcV/9yt+23HzWscRTeJm7xpZ7jNxVeQY4Uw1PyLRg5k0N
         7dl3TCowilZwDrIKVspGN4AlPE7rig0kqOJNuIl6mHMEUYmFmGmUUrRVm9BdDKaz1XwR
         iEQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rj+3JSKpWz3KfE0LDHDpANJqKYcDUVPQBOprSn3pVmkRR+8+K2SEHa5a6dsZom64GESyZIU/pcw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCx9cdKrbYLxVbmNe1ptkEkE4eYzMFdM7UsGUljI2f7scgeksx
	fPhWgNOTqdPZ51HFUQPxrSivGXZwlmMgU+vBGhL+hztgtcc7SJWtxhI0uRuaXzaUiH8=
X-Gm-Gg: Acq92OFgA1oNfGv1+NQWMJEe8tA9FlTBhfjcBIb6WBFX6ej9JgA0poMmWDZE8snIXp0
	cnU3eu6A0XMiJ+j7CCqoIOWjH/TtoG5/VKaxOIs+hege64eLinFtUElSCSeNKLgLx/4Q3En1Hfg
	fzrg5LQvqNOXtUuIAyVSlC1IuoEMUnMq0EsQoAi0xxFnZbQGhZB76LTerMIcmbJIwr4ZHlrwO2f
	VxJwFGrjXT/Jl5oB7NY3BkQ7EFTWAJrJGLES+QL5Y+evhJytRfoBtWcbOKMFlp9HmBTFjiDFXUV
	XlrYootPGexDF/zD+An5BAIJiaLEMNv9dZWTy6mKrAGRhOzovseFnssowT0MYxlc/b4fygvgsrF
	MkkgC2VJw3HWF84BnN7UCxDC0ykM5WoDtEamMswDhmU9lgbZBNb+ibTgYqO413pwB37Iiucoytc
	Ye1xe1RUrwmltJJF7lPML7UGPktojGPU1er1EAnUaHcajo+N3Af9LwN/WmKvHpsA==
X-Received: by 2002:a05:6214:8088:b0:8cc:58f2:339f with SMTP id 6a1803df08f44-8cee601673fmr33023096d6.16.1780630427604;
        Thu, 04 Jun 2026 20:33:47 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9fc7dsm70512926d6.5.2026.06.04.20.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:33:47 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	jasonmiu@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	ran.xiaokai@zte.com.cn,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [RFC v1 6/9] kho: introduce compatibility helpers and decouple block version
Date: Fri,  5 Jun 2026 03:32:32 +0000
Message-ID: <20260605033235.717351-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605033235.717351-1-pasha.tatashin@soleen.com>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[soleen.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[soleen.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-91026-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kselftest@vger.kernel.org,m:rppt@kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:jasonmiu@google.com,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:ran.xiaokai@zte.com.cn,m:pasha.tatashin@soleen.com,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:graf@amazon.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[soleen.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,soleen.com:mid,soleen.com:dkim,soleen.com:from_mime,soleen.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5539644E26

Decouple the block compatibility string from the global KHO version.

Introduce a compatibility helper header (compat.h) defining utility
macros for constructing subsystem compatibility strings, specifically:
- KHO_SUB_COMPAT() to append sub-component compatibility strings using
  a semicolon separator.
- KHO_COMPAT_ALIGN() to align compatibility string sizes to 8-byte
  boundaries.

Define the individual block compatibility string "block-v1" in block.h,
and integrate it into the composite LUO compatibility string (LUO_ABI_COMPATIBLE)
via the new compatibility helpers.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho/abi/block.h  |  4 +++-
 include/linux/kho/abi/compat.h | 33 +++++++++++++++++++++++++++++++++
 include/linux/kho/abi/luo.h    |  8 ++++++--
 3 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/kho/abi/compat.h

diff --git a/include/linux/kho/abi/block.h b/include/linux/kho/abi/block.h
index d06d64b963be..95d13cf677cf 100644
--- a/include/linux/kho/abi/block.h
+++ b/include/linux/kho/abi/block.h
@@ -14,7 +14,7 @@
  * This interface is a contract. Any modification to the structure fields,
  * compatible strings, or the layout of the `__packed` serialization
  * structures defined here constitutes a breaking change. Such changes require
- * incrementing the version number in the `KHO_FDT_COMPATIBLE` string to
+ * incrementing the version number in the `KHO_BLOCK_COMPATIBLE` string to
  * prevent a new kernel from misinterpreting data from an old kernel.
  *
  * Changes are allowed provided the compatibility version is incremented;
@@ -28,6 +28,8 @@
 #include <asm/page.h>
 #include <linux/types.h>
 
+#define KHO_BLOCK_COMPATIBLE "block-v1"
+
 /**
  * KHO_BLOCK_SIZE - The size of each serialization block.
  *
diff --git a/include/linux/kho/abi/compat.h b/include/linux/kho/abi/compat.h
new file mode 100644
index 000000000000..25edd964c390
--- /dev/null
+++ b/include/linux/kho/abi/compat.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+#ifndef _LINUX_KHO_ABI_COMPAT_H
+#define _LINUX_KHO_ABI_COMPAT_H
+
+#include <linux/align.h>
+
+/**
+ * KHO_SUB_COMPAT - Helper to append a sub-component compatibility string.
+ * @str: The compatibility string of the sub-component.
+ *
+ * Appends a KHO safe data structure compatibility string to a sub-system
+ * compatibility string using a semicolon ';' as a separator.
+ *
+ * NOTE: Sub-components MUST be added in strict alphabetical order to maintain
+ * a consistent and predictable compatibility string value.
+ */
+#define KHO_SUB_COMPAT(str) ";" str
+
+/**
+ * KHO_COMPAT_ALIGN - Align a compatibility string size to 8 bytes.
+ * @str: The compatibility string.
+ *
+ * Aligns the size of a compatibility string to an 8-byte boundary for use
+ * in ABI structures.
+ */
+#define KHO_COMPAT_ALIGN(str)	ALIGN(sizeof(str), 8)
+
+#endif /* _LINUX_KHO_ABI_COMPAT_H */
diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 288076de6d4a..b502670cd2a6 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -58,6 +58,7 @@
 #define _LINUX_KHO_ABI_LUO_H
 
 #include <linux/align.h>
+#include <linux/kho/abi/compat.h>
 #include <linux/kho/abi/block.h>
 #include <uapi/linux/liveupdate.h>
 
@@ -65,8 +66,11 @@
  * The LUO state is registered under this KHO entry name.
  */
 #define LUO_KHO_ENTRY_NAME	"LUO"
-#define LUO_ABI_COMPATIBLE	"luo-v5"
-#define LUO_ABI_COMPAT_LEN	ALIGN(sizeof(LUO_ABI_COMPATIBLE), 8)
+#define LUO_ABI_COMPAT_BASE	"luo-v5"
+#define LUO_ABI_COMPATIBLE						\
+	LUO_ABI_COMPAT_BASE						\
+	KHO_SUB_COMPAT(KHO_BLOCK_COMPATIBLE)
+#define LUO_ABI_COMPAT_LEN	KHO_COMPAT_ALIGN(LUO_ABI_COMPATIBLE)
 
 /**
  * struct luo_ser - Centralized LUO ABI header.
-- 
2.53.0


