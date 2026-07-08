Return-Path: <linux-doc+bounces-95562-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xJTfH8K0TWoc9QEAu9opvQ
	(envelope-from <linux-doc+bounces-95562-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 04:24:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 192F17211BC
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 04:24:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rKBQhxlS;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95562-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95562-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52BFA304BE64
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 02:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7043B7777;
	Wed,  8 Jul 2026 02:18:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136663ACF16
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 02:18:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477134; cv=none; b=PCanggzwExs835rTitBBFsvvwSFzZiAposF2v4sZzN/w4HPcxsoDd5QaA4Y4hWF9MLlxeF+NrpCBBdPORLBFeKX6ZuqrdDwq0fboUYd2LBPRGPtLnBzeXOrxxQf2ZOzL9cYUnybv5dTvLlHKZF9XIxuPXe3CH51L2f/GeZxCVg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477134; c=relaxed/simple;
	bh=cOvO6sx3YqLFd3U+lr49fTx42/CUMz8iaG20o06tc/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=imY9SKXyeLAHZfCkKTnR0t4Rhl6LSTOlW6BHk2R8KTzf8iqJRGzLc5i6DRD9zF80ukIHa5CJMDzPXzqUDhCEXEr50rvwUh4x9SrOjzxngYvy5K1W+Hmly0/LjYUStBFXbVRO8UL31hpUye7eUrCR8UPxg3Ww1K/fmKCC9yfcHxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rKBQhxlS; arc=none smtp.client-ip=209.85.167.176
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-495d310b587so71294b6e.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 19:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477129; x=1784081929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/mBb0fGCUwSIYa5j0WOJP7wxrKLNvtiy/Z40bYPFTI=;
        b=rKBQhxlSZsCCIYPy4cXSy9IvRV6WsF8ApUKiNTBn6LiX9ASXPTYFezer2qFdLHu0mc
         4PTZWnZsQyIVbFOuJ12y5VDQJS4KhPJkxsAMGQX2mx8I7v2bmljaKmNrRuNf2wH/XN86
         iIuZO28J3/NZXa0+iiOZuK+RaPHZXrbSj9Bo8HqZwLIcjRZywxLMWhtxdrm9A8nrbca0
         SLJqFXQ7UWHeHikArbj8w9YWnwv8vH7tcb9elnSxOv8KcEj9gn4XaNbTBgnYo3LFki/M
         xC6vdWHj+RvF3q3ZhcxoI6qqL16Rqy+iChjZJCXz0SE2SrS9hmtBa+S/bA4kQx07Lyiz
         Ii7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477129; x=1784081929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l/mBb0fGCUwSIYa5j0WOJP7wxrKLNvtiy/Z40bYPFTI=;
        b=MaiQVSSZfPkGsVlg0EMp93AXfeK3PA6s8cHdgqhv5qOMvsLOQADr9bqkOp/uAZi2FF
         iaZ8seZaMXx9temcCcuFH8fI2MFc+epba6erZA0K7XA3yMSsfFJsGk4ka2oE48PzbJwl
         UXyr5MDRKqWx0L+kx+zKJbkvcfYRo0yCaWyYf2gv/iw61A02+fPkXQsDXYmbeRL6zM0N
         aKI0RVbebDLSO+djgealFPgnDYmTvJK0EVTOeVTdGHdn2Lo151dwblErEj7u0X0GXx9x
         Ep22QzTSJyUf8jWg9FdOpVXcQo25hnuOb2RI2QCiRZZCgmXoBw+uOD2RGRjI44IwWnvb
         2Hxg==
X-Forwarded-Encrypted: i=1; AFNElJ/7e9cDFfoDvFaazQoIsE6rDNUqFLxMPgGtb7omJVcwgwipAmM/wTn0kJzHEe94FSzXJLgeDLYbMTM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7HWhX/bYfwyE/q5GFe8FVbjnjKpKhIyJeyZavi1gBttHYh4wt
	CnrMM3t2uTecBF7ofPFlJqDRSeQGpYPM1lUv/OXhj3u1SJv670mCkWRB
X-Gm-Gg: AfdE7ckA4Pz4Z1rsHrUyj1ve3czhgtzPFVNmnURxx3TgKFWV7kSz97ahBtcjmLSUKnm
	ywL/z1EHQNdkC40GBeXOWxGidgQ4iWmgZraYabAiTexj+Iv7beAy6EBcbptAhg7LsejzwM3lZ1k
	6HR5Qdomp/QVXMterqeBmTjlmlkfVKZB8Y16LfwVXkiNod0JOH+U6nMvRUpYNbZos+moax4ioSs
	VW2GTc2WjBvtK1fAzeEpAjx327ntNH610rbO9/rT30iB3PdliyR3GSLf7ENeaHaWk0UiQUV6xxm
	4YgOVJj6QEncc0dCKXRhHSJXqjnkFTFTsCOEGiF2/RYqv4rIEp9cnpNFEBKMwttlQOjKZUToNu2
	KuC4dSND8wjrx6VxThE7kM6LA4+iT62YwOvT/y0NM/8YlekmKSs1GVcjC6bNjDc5DZ/xI0LwKkj
	LsaBi6YlfwiEAb6kWv/T9asXoh9qvTJVOBZSUuX1wMWtlb7qzngfw=
X-Received: by 2002:a05:6808:690a:b0:491:3ade:8b9e with SMTP id 5614622812f47-4a204be6dafmr307849b6e.36.1783477128889;
        Tue, 07 Jul 2026 19:18:48 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4a1aa006f74sm799975b6e.0.2026.07.07.19.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:18:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 07 Jul 2026 20:18:13 -0600
Subject: [PATCH v6 13/24] lib/parser: add match_wildcard_hyphen() for
 agnostic matching
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dd-maint-2-v6-13-381f3edb0045@gmail.com>
References: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
In-Reply-To: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783477102; l=4222;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=cOvO6sx3YqLFd3U+lr49fTx42/CUMz8iaG20o06tc/Q=;
 b=fH4cz7gW7gQleI3gjGUtJ+SY/4OyEbN39bNTdvRHLXKHHDuXqOnwRFYYoExs8ygRoRpHkgAe6
 ZV6Ju8DSs2hD4+zruFWjdvsTEtNVTmLSJGv4jSilNH7wWImQjGLOnL4
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-95562-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:arnd@arndb.de,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-arch@vger.kernel.org,m:linux-modules@vger.kernel.org,m:jim.cromie@gmail.com,m:jimcromie@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linux-foundation.org,akamai.com,linuxfoundation.org,lwn.net,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arndb.de,suse.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 192F17211BC

This commit introduces match_wildcard_hyphen() as a variant of the
existing match_wildcard() function. It treats hyphens and underscores
as identical characters during the matching process.

This is necessary for subsystems like dynamic_debug that need to match
module names provided by users (who often use underscores) against
names stored in the kernel (which may use hyphens, especially when
using KBUILD_MODFILE for built-ins).

To avoid code duplication, the core logic is refactored into a private
__match_wildcard() function marked as __always_inline. This allows the
compiler to generate optimized versions for both the strict and agnostic
callsites with zero runtime overhead.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5: move ahead of array-slice patch to silence sashiko complaint about it
v4: initial version
---
 include/linux/parser.h |  1 +
 lib/parser.c           | 58 +++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 44 insertions(+), 15 deletions(-)

diff --git a/include/linux/parser.h b/include/linux/parser.h
index dd79f45a37b8..a3cc7bc5fb93 100644
--- a/include/linux/parser.h
+++ b/include/linux/parser.h
@@ -34,6 +34,7 @@ int match_u64(substring_t *, u64 *result);
 int match_octal(substring_t *, int *result);
 int match_hex(substring_t *, int *result);
 bool match_wildcard(const char *pattern, const char *str);
+bool match_wildcard_hyphen(const char *pattern, const char *str);
 size_t match_strlcpy(char *, const substring_t *, size_t);
 char *match_strdup(const substring_t *);
 
diff --git a/lib/parser.c b/lib/parser.c
index 62da0ac0d438..d5be01fa9adf 100644
--- a/lib/parser.c
+++ b/lib/parser.c
@@ -268,20 +268,13 @@ int match_hex(substring_t *s, int *result)
 }
 EXPORT_SYMBOL(match_hex);
 
-/**
- * match_wildcard - parse if a string matches given wildcard pattern
- * @pattern: wildcard pattern
- * @str: the string to be parsed
- *
- * Description: Parse the string @str to check if matches wildcard
- * pattern @pattern. The pattern may contain two types of wildcards:
- *
- * * '*' - matches zero or more characters
- * * '?' - matches one character
- *
- * Return: If the @str matches the @pattern, return true, else return false.
- */
-bool match_wildcard(const char *pattern, const char *str)
+static inline char dash2underscore(char c)
+{
+	return (c == '-') ? '_' : c;
+}
+
+static __always_inline bool __match_wildcard(const char *pattern, const char *str,
+					     bool hyphen_agnostic)
 {
 	const char *s = str;
 	const char *p = pattern;
@@ -301,7 +294,9 @@ bool match_wildcard(const char *pattern, const char *str)
 			pattern = p;
 			break;
 		default:
-			if (*s == *p) {
+			if (hyphen_agnostic ?
+			    (dash2underscore(*s) == dash2underscore(*p)) :
+			    (*s == *p)) {
 				s++;
 				p++;
 			} else {
@@ -319,8 +314,41 @@ bool match_wildcard(const char *pattern, const char *str)
 		++p;
 	return !*p;
 }
+
+/**
+ * match_wildcard - parse if a string matches given wildcard pattern
+ * @pattern: wildcard pattern
+ * @str: the string to be parsed
+ *
+ * Description: Parse the string @str to check if matches wildcard
+ * pattern @pattern. The pattern may contain two types of wildcards:
+ *
+ * * '*' - matches zero or more characters
+ * * '?' - matches one character
+ *
+ * Return: If the @str matches the @pattern, return true, else return false.
+ */
+bool match_wildcard(const char *pattern, const char *str)
+{
+	return __match_wildcard(pattern, str, false);
+}
 EXPORT_SYMBOL(match_wildcard);
 
+/**
+ * match_wildcard_hyphen - parse if a string matches given wildcard pattern
+ * @pattern: wildcard pattern
+ * @str: the string to be parsed
+ *
+ * Description: Same as match_wildcard, but treats '-' and '_' as identical.
+ *
+ * Return: If the @str matches the @pattern, return true, else return false.
+ */
+bool match_wildcard_hyphen(const char *pattern, const char *str)
+{
+	return __match_wildcard(pattern, str, true);
+}
+EXPORT_SYMBOL(match_wildcard_hyphen);
+
 /**
  * match_strlcpy - Copy the characters from a substring_t to a sized buffer
  * @dest: where to copy to

-- 
2.55.0


