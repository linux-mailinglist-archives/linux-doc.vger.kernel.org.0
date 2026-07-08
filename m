Return-Path: <linux-doc+bounces-95567-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cgs3NE20TWoB9QEAu9opvQ
	(envelope-from <linux-doc+bounces-95567-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 04:22:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E1872116C
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 04:22:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=f+9tixgG;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95567-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-95567-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CD28306927C
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 02:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DF53BA246;
	Wed,  8 Jul 2026 02:19:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D89B25A642
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 02:19:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477143; cv=none; b=uAkTogKQy7BtWrx5fI+BPfl5lE63UCcXCHpT+BewWe1nEnrSl2LMj1FUm9y1FpDFqo6/6cJ368E4/jfCGsjyx1oz034SqwCohr++FCUu4vDRSiG9tNjw1fTlHmEI6QAyYyxE/GYzr8C0fymewnXfaqGUI6/QKiz4h8TuJQPfPJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477143; c=relaxed/simple;
	bh=f1LMLcm7HpUCjY0LgwqyXWI/nbYSKkJlJGfL377JIvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WxHZnl43ydYt6Y/pEXkjQ022nEBYxFeAeZrdUcIBOoUFobkgpZ3VmUZCKoy4ES1lXkrFZDkJlTPmdXRdQEslG9O8W1skWnbnAppa2kSL+khIs5ESHVVpgWMNj6Gp2UfK0Xwo2QLAoNsczhvWZeW38ZnEyUmGbJfj4ws6k4pPMHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+9tixgG; arc=none smtp.client-ip=209.85.167.170
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4960fb63c75so126508b6e.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 19:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477140; x=1784081940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3atFQ3HfHjIkDoR1IKy8zbGv01SGi/asouemJLY7Wc=;
        b=f+9tixgGI6vAOSH8Yy51o4nLhf/xg5DNdd9rRKA/F2MSMfsIFgGdNROB0EpBarjBEV
         QHCdZkcWEGUZ/ZxUXq1uMN57Jk+z2Qvmn3vR4AaaIpZ34AepTmMuOlKeTpAOED1FEgra
         3rXeZ/cdkF7YDEf82UekpSmkPozT2yKjnY94HTxHMzJOB/QCz4/1vBoAb86TqwmSobvZ
         xDjVBZx7g6TbnZk9IzfJs3ouchR7u+1ri2zA4eJmDVRc6fng+Dz/tY83Q/MuSjM1mFso
         ipAfaV6IovFmVvv67SZAQU3sDJwdObhAv87mblY7XhXZUIKzqZzPIuQg/THNIrbAdeJM
         9z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477140; x=1784081940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3atFQ3HfHjIkDoR1IKy8zbGv01SGi/asouemJLY7Wc=;
        b=h6QVzR9jJ8v3OowWujqCJdZf8gAZxC7am5HsOtV2b6hYgfGFjxitTcVFX/8pKIqovS
         aXzsAws0xPGCZSjOj6rlWT49HhuRBi7RY+zqkjOeWlkGnSBW5QvQNOpYDotB3cAXYfyz
         +JAhriUdaTEEInVXGa9aEmj+slqW7PZZ5l//JtlQ409JKVyOF3mcNbT1eIwrQoh6k3bD
         iUGuYW3hHmmKcOAknfa7wQgJ97wzj7MAljIkP3gm4avVd5URXnPcJVURQdHEtWzPYGPY
         Hl7mbPC6Pp4SLdruENzZBOmpY+FyfdIAkeVsSbOrjwZMp9JnpyNuYQr1IejuujJBGA40
         bjpA==
X-Forwarded-Encrypted: i=1; AFNElJ9S0+L6kqF2sz4Q1JUV9EArU8gjyhZwSIZZ7tVZqyKJVtGpsSmc+aXIAeSCyhpzTNJ0EY4MSU6yrBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJd8cMbOfMyeELdgFdehjQpFHhq6ZrgLNbY+pYev4GFQwD0n4D
	XE+pVwlIG3qaZjRsbmDPDWuq/vOtIU1N6ntnGtweGA6O70Ou6PJ5rOQx
X-Gm-Gg: AfdE7cl9MtL/TIFMzKjPAxFMOp5MdBCIx1tkC4DlJ/cg24YUsj+V4ojyFEYNTN3kMe1
	MTpED0mtKYXrb9D9aDl7AszOcSYcHHZejSXvMZOMo2b9scHlQxbyMsF6Ug0/+vqVYpWyH/eRZrT
	XqHfwIwtcIktcw5NzknvP/QZOr78OWR0qMVIxmjD9licjWsda6k6EoPG6oa4owMABYsErvL6wLB
	kzZ3WZxdLoJ3zhU//myhURlCSK7gVaWU6ytY48mJcJ2JwIGqRNlt8l7JR/jvcVvcO1iQPwY7o2I
	nLCXVGI89koyokA3kWBk2WM5UtAqizU1kLi8PnsccNPgcbH7j5aqilI6eukJU4F2Klgbty3EC4z
	1VZtvTipADYpfYAr4ZzGw/dnxrCAhONee/+SIFkqscMQPy/WYonRj0aUnGqdMW+QcTcY2hHVdHu
	n60FNWJx5WNlW0z+KGVb+FFBNjs6N1U2o9MFXVGa4SsmK8+wkj2RM=
X-Received: by 2002:a05:6808:124b:b0:496:e0:a47b with SMTP id 5614622812f47-4a2039be59bmr318703b6e.20.1783477139780;
        Tue, 07 Jul 2026 19:18:59 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4a1aa006f74sm799975b6e.0.2026.07.07.19.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:18:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 07 Jul 2026 20:18:18 -0600
Subject: [PATCH v6 18/24] dyndbg: macrofy a 2-index for-loop pattern
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dd-maint-2-v6-18-381f3edb0045@gmail.com>
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
 linux-modules@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783477102; l=2812;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=f1LMLcm7HpUCjY0LgwqyXWI/nbYSKkJlJGfL377JIvQ=;
 b=trvcg9ZaNLsNIpDb6Uahb5ZcOJlCuDAsyAa+3eRBSZB7MO61jqTE3zrEhQimlEmwi6binJuG6
 P6IJQn6YMJGAAWzMGNmmmraV/JO+uz6t5b2sQ/9PueOX3S0uipM51O6
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-95567-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:arnd@arndb.de,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-arch@vger.kernel.org,m:linux-modules@vger.kernel.org,m:jim.cromie@gmail.com,m:louis.chauvet@bootlin.com,m:jimcromie@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linux-foundation.org,akamai.com,linuxfoundation.org,lwn.net,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arndb.de,suse.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41E1872116C

dynamic-debug currently has 2 __sections (__dyndbg, __dyndb_classes),
struct _ddebug_info keeps track of them both, with 2 members each:
_vec and _vec#_len.

We need to loop over these sections, with index and record pointer,
making ref to both _vec and _vec_len.  This is already fiddly and
error-prone, and will get worse as we add a 3rd section.

Lets instead embed/abstract the fiddly-ness in the `for_subvec()`
macro, and avoid repeating it going forward.

This is a for-loop macro expander, so it syntactically expects to
precede either a single statement or a { block } of them, and the
usual typeof or do-while-0 tricks are unavailable to fix the
multiple-expansion warning.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2: move RvB after SoB
---
 lib/dynamic_debug.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 6b699ed23d26..d99c69b9ad12 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -149,6 +149,20 @@ static void v3pr_info_dq(const struct ddebug_query *query, const char *msg)
 		  query->first_lineno, query->last_lineno, query->class_string);
 }
 
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a member in @_box
+ */
+#define for_subvec(_i, _sp, _box, _vec)			\
+	for ((_i) = 0, (_sp) = (_box)->_vec;		\
+	     (_i) < (_box)->num_##_vec;			\
+	     (_i)++, (_sp)++)		/* { block } */
+
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
 							const char *class_string,
 							int *class_id)
@@ -156,7 +170,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1167,8 +1181,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * the builtin/modular classmap vector/section.  Save the start
 	 * and length of the subrange at its edges.
 	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
-
+	for_subvec(i, cm, di, classes) {
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			if (!nc) {
 				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",

-- 
2.55.0


