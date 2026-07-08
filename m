Return-Path: <linux-doc+bounces-95808-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DE74FhTETmqyTgIAu9opvQ
	(envelope-from <linux-doc+bounces-95808-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 23:41:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0A172A99B
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 23:41:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=1YurD4Bp;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95808-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95808-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 540E6308AC4D
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 21:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87B13F6C26;
	Wed,  8 Jul 2026 21:35:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5093AB29E;
	Wed,  8 Jul 2026 21:35:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783546554; cv=none; b=fRlyIbDg6SwmXHZm7BVsMB9KIT9GKzGQkgIRCS9QrR68aBMgQFImP/KfWzzq3SIkpY7YJeqEZ6w5jaEymqW2MjBo5BbkFFEmR9qm/Zg993xOvn9PE3ZHo+9axYxR7VfwZkzLrnrR1XjT5iTgiWuC67pKw6YAQdcYKo4cZfU1eCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783546554; c=relaxed/simple;
	bh=v/alvAQP+jlzA+aPsb7wsJALL8BWeqnB0RmIUKanbEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t909ToSFc+9Nn6PUgeACUnsa1c90E5fOypchNkNLTEJsG5U4rk8dcX0siBN35Fb0mJ57jPcotXIDgB2fNlXbqHEPEOicu1iEO9NS03EpS5CLq+WfCdKapz9Uh+h862RlSWPt60DF9PTdJC7i5t4W3IGPuZQ4gcCIDEkRdWla0dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1YurD4Bp; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=v5GQi58UpKN/xjPR77HNmT/9H9qJkRbf6vrytCHrfhY=; b=1YurD4BphaNx7EJvKravGeZ5f3
	STQE+OxHlj4n5qi4TV9obhX9YI2u++s8edlTugW83CTAFB0W/FMf6D9likbdfWwxEReUSj1vN5aaK
	if3Xn/kz7QVu/cxxRPEddlRzdjt2ya1Jh00ONYsz3qZjyaietR18jRY/i8xx8KuO/OMbnpnurk+GG
	MXnLGnZk7z3b+C+wz9r+mW1/npZeWajHTUfPu4tanNSILdY1Uzb2ZFU29noQCXmzoFWjzLQoKFYhV
	P3ol4yQaZbxCzmfB29c5vD3kj+yYSBBYKYgzfnbo1gBtIChepwgwXLv5gtx6Qa4F9kplY+eRIb38S
	HwmKTjEw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZvp-00000000SCc-0q1x;
	Wed, 08 Jul 2026 21:35:49 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Zhen Ni <zhen.ni@easystack.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] mm/page_owner: avoid docs build warning
Date: Wed,  8 Jul 2026 14:35:48 -0700
Message-ID: <20260708213548.469155-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95808-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:rdunlap@infradead.org,m:zhen.ni@easystack.cn,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lwn.net:email,infradead.org:from_mime,infradead.org:email,infradead.org:mid,infradead.org:dkim,kvack.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB0A172A99B

Fix literal block and indentation to prevent a docs build warning:

Documentation/mm/page_owner.rst:70: WARNING: Literal block expected; none found. [docutils]

Fixes: c34eea8cecca ("mm/page_owner: document page_owner filter")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
OK, there may be a better way but I didn't find it.

Cc: Zhen Ni <zhen.ni@easystack.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-mm@kvack.org

 Documentation/mm/page_owner.rst |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- linux-next-20260706.orig/Documentation/mm/page_owner.rst
+++ linux-next-20260706/Documentation/mm/page_owner.rst
@@ -65,14 +65,15 @@ un-tracking state.
 Usage
 =====
 
-1) Build user-space helpers::
+1) Build user-space helpers:
+::
 
-To filter page_owner output:
+   To filter page_owner output:
 
 	cd tools/mm
 	make page_owner_filter
 
-To sort and analyze page_owner output:
+   To sort and analyze page_owner output:
 
 	cd tools/mm
 	make page_owner_sort

