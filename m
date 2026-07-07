Return-Path: <linux-doc+bounces-95346-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F7vwHbzWTGqOqgEAu9opvQ
	(envelope-from <linux-doc+bounces-95346-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 12:36:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6445171A769
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 12:36:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=Komcgpon;
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95346-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95346-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5357302E9B7
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 10:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F523E3D8C;
	Tue,  7 Jul 2026 10:22:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203FD3DD87E
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 10:22:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419746; cv=none; b=lMKvDX7CRlXhwIbHa5Ce75Wms51lKkVtW/1qzvG5nXoyrNquarDoKcz0i4BcKxW7p+u2o7kCdly0Eb8LyyCnWft44pCQIySlfzMyYxxVOSuYtZVN6cwZzoNgdyMOLOS6MeOeMCZPz3Of4J76CQwrxh8wtcgiHuK+R7TWCLRnQuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419746; c=relaxed/simple;
	bh=1G07HVMo6Kbko+O7640ojgF/RK7TzOB0t1Dzx2PzN0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hrNmBl9c5pSkbLli8MLgR1cX+p49HEo9P36V5nCBE57G7/5nPwz5neKESy0DWTBkpfh4KGeA2h6JsDRj++y/ZGOFzt6uCJF3VcRhsXTWkRjK1TdXxQ+W5+UPSlMf7zQtxsM2qdXz6YMuspTd+nU04zoCnbhZp/AHjWunG0vOaTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Komcgpon; arc=none smtp.client-ip=95.215.58.173
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783419743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G1KdXVb1VzZ7QBRolc1PdP8ABMe6k87XpLbFlAF9Zwk=;
	b=KomcgponEWrBPtPFaMg0wv6XLm1DNdjWxZULv/T4z7dZ29RXYN6ffV7qbWd0PSEhNVgoMv
	xmotmGa5HADYePLZUeS8GPH2I0EXRyW0mPYpeJq1Poeioe21WdqTkPlr4BDclIG87AqvHy
	Z3Fi8IwzADZgIpaBNPU3tZHoNQ/FNjM=
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH 1/3] Docs/admin-guide/cgroup-v2: drop stale misc interface file count
Date: Tue,  7 Jul 2026 18:21:46 +0800
Message-ID: <20260707102148.692250-2-guopeng.zhang@linux.dev>
In-Reply-To: <20260707102148.692250-1-guopeng.zhang@linux.dev>
References: <20260707102148.692250-1-guopeng.zhang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95346-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[guopeng.zhang@linux.dev,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:cgroups@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:guopeng.zhang@linux.dev,m:zhangguopeng@kylinos.cn,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guopeng.zhang@linux.dev,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,vger.kernel.org:from_smtp,linux.dev:from_mime,linux.dev:dkim,linux.dev:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6445171A769

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

The Miscellaneous controller documentation states it "provides 3 interface
files", but misc_cg_files[] actually registers six (max, current, peak,
capacity, events, events.local). Drop the stale count and let the file
list that follows speak for itself.

Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
---
 Documentation/admin-guide/cgroup-v2.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index b0bd591bc4bf..df3fe7a7c6b3 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2968,7 +2968,8 @@ include/linux/misc_cgroup.h.
 Misc Interface Files
 ~~~~~~~~~~~~~~~~~~~~
 
-Miscellaneous controller provides 3 interface files. If two misc resources (res_a and res_b) are registered then:
+Miscellaneous controller provides the following interface files. If two misc
+resources (res_a and res_b) are registered then:
 
   misc.capacity
         A read-only flat-keyed file shown only in the root cgroup.  It shows
-- 
2.43.0


