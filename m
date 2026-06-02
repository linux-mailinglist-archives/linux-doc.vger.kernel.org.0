Return-Path: <linux-doc+bounces-90581-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oA8ADH9eH2rflAAAu9opvQ
	(envelope-from <linux-doc+bounces-90581-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 00:51:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B62C56329EC
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 00:51:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hFuxi0H2;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90581-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-90581-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F5CD30DEC9A
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 22:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E932C3CB919;
	Tue,  2 Jun 2026 22:48:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044D23CAA31
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 22:48:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440524; cv=none; b=fWFHCKFEZDFF2hW+SHhhjZ4innePip0KXTWR7gnbsA6Jeu6p2/XYuATjgd1kCKceLCyU1/adYwwCdkAWQDIEqkh7B2mP9ph2UC0OYMmvglwnuj9pzRfKlWj2Uxp4WQMiDEzMGh4d57GJSYhSQ0cTK7SeppiV9CUAuhAl9ZdL5xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440524; c=relaxed/simple;
	bh=Ah9OubhC/0J+O5fnf6mytQN8u50S2Bl4xoeKfk7IEd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eOICEwJhYCO8U/MHgplo27CNih7MftcBt59y1GsOP60MsFDSwMLVbOfNM23IZ+7mNKavMUMuzxQVDAl7Om/WReBmsf5KaMggIc3QQnwq+O4dhXEAcdWQvgtTrh/6yeF56/wfeJnSlgvTiPhWZbBFN/jsORWgYyYFDbMFwq3Em58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFuxi0H2; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eeba68948so4423401f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 15:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780440519; x=1781045319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/UoMyrbDRBJtnX/0jQKUAOsd+dEJyLvzD20lPdR4ww=;
        b=hFuxi0H2UuJnZ64MYnC7sk1J7y3+R9yeqezMzy6OPMv3yOV9tOrx0vSkjnvoCP1MNg
         Z/sctMu6JTcTxu1ng+32FHKBbFWFUOHLT1k8cRTf6CB3MQoVyHJYMzhTJl9MNhas3JcB
         V4MK4N7d+0njhO7U9zJZmIF1t7HUEF2+8ZB9L/6ZPM+iC/mr8SeCg9TgPsWtxDADNJfP
         P3loPLaXlwuy6HgaGkizpXNQs9k3iIbojMWpWA9MLasUmVUomupYoYqFUCm6Jj2QsqW1
         RaN/FnjxN1G0Sx6sk/G+9685NCbRdv1EhOzDMiFqcv2nPPcvFKIlET7p+nspkMfjFBEv
         oZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780440519; x=1781045319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1/UoMyrbDRBJtnX/0jQKUAOsd+dEJyLvzD20lPdR4ww=;
        b=Snnut872lNcKD/QfFpzzgCa7f+7sDkNsWHTPBDbkQJMZnQFU+D3E3PVuXSlllRahaO
         n2M6k9dQajgpdG4MrF4X/2yZ3A+OVKJPjWfc+1FQUx5fuLdAlHgflLzaEsYx8BSJlBa+
         J0/zMDryWxjVJXX760BqD8cvStcgYbWYEAJRrNp0jmvOCbHZOm+AfjvqP9zlcIHqzTPQ
         dQnBSXS5bUBQIqwftfUakJp8Pn0oeyhThzWe3IJeV8DkF3VV1GQYXHZbgC98Z7SHJfwg
         r9JctJdOXrAOhzrOz/wy1r8axFT3tprbuE5F3UuB39uiKbpa2jL8/GKHP3LnvUEAr587
         FLmg==
X-Gm-Message-State: AOJu0Yw2SyQv6mpwtdlQApODoh1LchBWXBvt6syV+RT99OolQBiJxHOI
	8B0637LeUnEQdFljeK8Y3y13em+rL1/v9tfkdvnIGLvpKffy9qHQsP61
X-Gm-Gg: Acq92OHloJuVoHv1H1bxyHG/MVErCZDA2f5rVOfsO2c6wdLd6YEKTrUDjySOgbACaB7
	D7zTKXJp8QSz7OrAaNQUMFtH1EKL/ScaqQfVO2Xt7S0fqsLl3v9OqJZYMc+naKr3CS2IEJkofN+
	Lh7DactnGq+T1j45mbQcsFjnvSp7ezFFlRjvCFQ8bftkFblCbM9z/iAoIKXKHI1osbcAj+YoRJ0
	a3BDc7CpMg4rl000613Crqy7yCuCpaaCKadsEH+GurNAgumQm+pBcqcxTDoK4iNF9PmyUov1y5Y
	ujN8Cre5PrAXhoND7vUEnr5bRj/A6w5V6hUfnRCOtBHXw5GTqP7xGl18JrBmj+GhT9HTt2g/3uE
	kKJ9yJ9l1kpjLkA9FHLddKUctSPsi6EMrNjyHcuWrIRvSW0fSOb601a9hkWdQj8PJDMjclJ2lHx
	2ZDqUZ8jIGxRkRZ+TJwdKatLthnt9Axl2yEUrabGUl5w==
X-Received: by 2002:a05:600c:458b:b0:490:b409:94f4 with SMTP id 5b1f17b1804b1-490b5fdcda1mr13028365e9.28.1780440519473;
        Tue, 02 Jun 2026 15:48:39 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm1999791f8f.14.2026.06.02.15.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:48:39 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 02 Jun 2026 22:48:07 +0000
Subject: [PATCH v4 10/25] dyndbg: reword "class unknown," to
 "class:_UNKNOWN_"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dd-maint-2-v4-10-19a1445585a8@gmail.com>
References: <20260602-dd-maint-2-v4-0-19a1445585a8@gmail.com>
In-Reply-To: <20260602-dd-maint-2-v4-0-19a1445585a8@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780440488; l=1309;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=Ah9OubhC/0J+O5fnf6mytQN8u50S2Bl4xoeKfk7IEd0=;
 b=mY6va1q+pplf3oiRh9kAqV2/4rkm8Jt+FXjkD2G7wa/YV3UYCu8KlP74E8zHuHM0fBwUW7QfI
 85+dFL9KEusADx7bjdzgWA9Z4a2ALDbaZGX4b6jMBC5KuU25CaW5OCx
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
	TAGGED_FROM(0.00)[bounces-90581-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:arnd@arndb.de,m:jbaron@akamai.com,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:akpm@linux-foundation.org,m:shuah@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:jim.cromie@gmail.com,m:louis.chauvet@bootlin.com,m:jimcromie@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arndb.de,akamai.com,kernel.org,suse.com,google.com,atomlin.com,linux-foundation.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[24];
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
X-Rspamd-Queue-Id: B62C56329EC

When a dyndbg classname is unknown to a kernel module, the callsite is
un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

NB: while this might be seen as a user-visible change, this shouldn't
disqualify the change:

a- it reports classmap coding error condition, which should be
   detected before review.
b- SHOUTING the error makes it uniquely greppable.
c- the classmap feature is marked BROKEN for its only current user.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 6b1e983cfedc..a9caf84ddb22 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1166,7 +1166,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 

-- 
2.54.0


