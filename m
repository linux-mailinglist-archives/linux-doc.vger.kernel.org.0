Return-Path: <linux-doc+bounces-74410-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLrnOhENe2k6AwIAu9opvQ
	(envelope-from <linux-doc+bounces-74410-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 08:32:33 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D21ACB74
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 08:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A317302658C
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 07:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B901E37AA6D;
	Thu, 29 Jan 2026 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBM+6/Xk"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4534237AA86
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671819; cv=none; b=N/cMZV7xRSriT0ZKqig0R0NPzjnU+mWU+YPK20zWqCXYpo3t8RQ0KtVxesRc22nZuJizV4rCLvxSgtT59tes9rA73IFfy6h0mFSO1zkLDnGDwLwrfhRjQCGOMDKWIGo6QyAL49PSc69oxf+bTD4nVKS1wuY5Tec8qz46hnmK3nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671819; c=relaxed/simple;
	bh=MAAeseAOeCsfRMUxTeI+VK7zeHqjJHWgLK5FZ29nNc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hj6+N7SicXeoRRuRzTKBFPRIW0xql8gi0ps9i5CNScm0dW68z/F2Tgal/4qBOnjm/6Fi5wAyiCIziZFZAniDwJerWRcmQbEXlhHT2TB3OERa2QGHCNaSMD6MWXyHFUaibAkOtdmBVucVQLVAywouK8Ram9Oc3EMXhL/P/OyEdSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBM+6/Xk; arc=none smtp.client-ip=209.85.167.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-45f10d7eb81so303397b6e.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671817; x=1770276617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGsz9erGUhMjPGOxoaearCe+6L/KMh0lW399GvOTyUQ=;
        b=nBM+6/XkPBsHRS9jx0dFbVK8SSrLK+JCIXdO8vpWtFTgPu+Yk+5KaYfHo/KEUe642U
         LU/WTj5yaJJwi4IWNMtvygQmH1Ac+vC95kXRUgh72AMKv0LC10MxFnDNk9VHmOuH/UlT
         0l2wlfJD57bFzoadP7K5wyRa9JuLgTMpu4wcteNWeZBguBUxJEvb33zw5XPIfrvvr6HU
         28oYx3JfsGGxkVKNmKAyQQjb+vICvoUH/REHSmzQRt1vLSd5/Gfjz1bZ++k6eCZTo2HB
         ghshsZ/tk/Ws3nHGne2sn/hja+p56V36JN+zeOwY6N1rd8REhK5+6XuMMI7JenGRezhr
         FNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671817; x=1770276617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YGsz9erGUhMjPGOxoaearCe+6L/KMh0lW399GvOTyUQ=;
        b=scuHcOZ/gpG9QqhqBxVRv54hrZ8rlp3Xd0eeNAGUWK5oBkbYD1hL0ixODrYPzkZo4D
         2lr9XYClsbrEEKgkpi3rzrhudWZbjJQiG7bzfatv2SwpeZz7lc9QIq3v7ZEaru3eDouU
         Qktqah6mVjbf5nbyrV0EeGsH/Rq/+VMbfT2jJB+xAtB1rTFGqEjRguPY1rYn4uI88Wzb
         LbC0clfZgWUWhWIIWMqtxJpryxNQ8UfJ9FOV+Twp4OR6rLaW95nDu5xtie/lwwq+PWqQ
         3rJn1+R5MpmueDPMCGSfJXHZhgzjKcoYRmSj/x2+WA1auGLTI6O2yJXNLi1Y/T1i52mf
         XZHw==
X-Forwarded-Encrypted: i=1; AJvYcCX+W2yPlKPfa8r4f9YMArOxJczl21eXtQFs+tthFxtbXddzga6Y668JMmSJZaxP93qQsriuAZubhgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN8AhgAWhbh/AaDWqUPrH/58j6JcSTRJ6KgfYMAbxrnORNz2EN
	SEFv7ZgTsbFhb1d6aoH2ba1LZ97Vhg4W57nR4k26rDjy7K7fqUSXw3W6
X-Gm-Gg: AZuq6aLISIgC7XcRR4pC5wQ1t/WHaZEugh90vvCH7qTK1dKHy9hILI5NLgi29lMNoLv
	c8Ey9iWzrAIGMa0BsPYLZoXKSzij+JHaJaHdd4W0yjrlyys/ZZAiyh4pHOKDL0Tn/acPUFDoemg
	DSCRlg+cwSF712EgbO0dOD7IRtDPLrIXFkQ+60IB+yL3dvxXAc7/7u1k2g84LPJoQ52TNQrFVTj
	5ktoEF8x6uBRFoHCOCjD6j0iBY/q8AaWxgJcp30UA1v+cmc/zPorRvNDzDi5UHf5Z+IRncsH5kO
	KFxaTwh+SziieZsMGxzgClqpAnBPbuMXLF8wprioZypwJrGdxHOalCxK+FnUhh1Hgs5c9G+43Ao
	qbbo/GXpgVuPrGsB9MiWHsZ/C823wrcQjcEfo3qCkq6x52oDAaSYiU0vOJZAxsqENOjzIeQoG/9
	2yI8DfrxMOZz+lTjJ54SEAJCj/hqI/DNI5Tjug/xP2MHDsqPkIXjs=
X-Received: by 2002:a05:6808:2f08:b0:45e:b6a5:c6d with SMTP id 5614622812f47-45efc67e199mr4344900b6e.49.1769671817183;
        Wed, 28 Jan 2026 23:30:17 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-45f08f20d7asm2611894b6e.12.2026.01.28.23.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:16 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 07/32] dyndbg: reword "class unknown," to "class:_UNKNOWN_"
Date: Thu, 29 Jan 2026 00:28:53 -0700
Message-ID: <20260129072932.2190803-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,chromium.org,bootlin.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,suse.com,linuxfoundation.org,vger.kernel.org,linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74410-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 67D21ACB74
X-Rspamd-Action: no action

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e7578507945a..55e07b706c84 100644
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
2.52.0


