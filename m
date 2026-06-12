Return-Path: <linux-doc+bounces-92068-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kousKPGOK2rd/gMAu9opvQ
	(envelope-from <linux-doc+bounces-92068-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 06:45:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02647676A70
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 06:45:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=Q+ywobdJ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92068-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92068-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 684B5311612C
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 04:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277623955CB;
	Fri, 12 Jun 2026 04:45:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D996343D86;
	Fri, 12 Jun 2026 04:45:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781239502; cv=none; b=rVCjOB+cLA7drmnhCr28xP83yE+lvIksy69hhxfClygw0Cs+0LWLD+4yCKoBvA5gUzeRqVP9QueinbtB1NMmP07Det+icrOxFokWsbTW7VuYikkjdbhaj9D6l3y+sj8SGibn9SnDXSeuBWe3BMKl/YRCmHSz5D4n4dHhWjmAq3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781239502; c=relaxed/simple;
	bh=b00TklBGecqQHLra7PJTRi5mE5kXZpjh3sOy2Gf7YPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLR7Qih1TCw8vo3/FKeC0jCRcqhBpr03B/PoQGbFJFZvc7252kvMyRC59Dui2QY3EcnJ1XCKwcSj39Let1SOK3KGZx2WPEk9kPUBKVbSt/FwA/uPZ46iesGEUAhiJmV2FXeGGDBUlti+gIne528IMnC4JQBs4R/cyRZwXH8548Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Q+ywobdJ; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C26E2E91;
	Thu, 11 Jun 2026 21:44:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BAF13FAF5;
	Thu, 11 Jun 2026 21:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781239499; bh=b00TklBGecqQHLra7PJTRi5mE5kXZpjh3sOy2Gf7YPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q+ywobdJtIBtiIj1Lm87NJAvMg5U5ZyPO3GOiZE5j7oUMWa2LPjn5dzWP/UcvIfsR
	 eAIppw1XHah98pdVj9WRrylHYixsfy899jM7BhUXauI0syxEiAplt27uUuk/UZ4Tct
	 1rn0H7QLZBrriUcOjns9J7XKs7UrCuhBG1BRs4Wk=
From: Dev Jain <dev.jain@arm.com>
To: ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net
Cc: Dev Jain <dev.jain@arm.com>,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	kaleshsingh@google.com,
	21cnbao@gmail.com,
	david@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com
Subject: [RFC PATCH 1/2] kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
Date: Fri, 12 Jun 2026 04:44:23 +0000
Message-ID: <20260612044425.763060-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92068-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org,lwn.net];
	FREEMAIL_CC(0.00)[arm.com,google.com,gmail.com,googlegroups.com,kvack.org,vger.kernel.org,linuxfoundation.org,lists.infradead.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ryabinin.a.a@gmail.com,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:dev.jain@arm.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:ryan.roberts@arm.com,m:anshuman.khandual@arm.com,m:kaleshsingh@google.com,m:21cnbao@gmail.com,m:david@kernel.org,m:will@kernel.org,m:catalin.marinas@arm.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dev.jain@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev.jain@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arm.com:dkim,arm.com:email,arm.com:mid,arm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02647676A70

In preparation for adding "tag only on alloc" boot time option, use
KASAN_PAGE_REDZONE instead of KASAN_TAG_INVALID for poisoning the tail end
of the vmalloc allocation.

Although both values are the same for hw tags, KASAN_SLAB_REDZONE is used
for poisoning the tail end of a kmalloc object allocation, so maintain
the pattern.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/kasan/hw_tags.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index cbef5e450954e..c1a2b48808ed7 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -375,7 +375,7 @@ void *__kasan_unpoison_vmalloc(const void *start, unsigned long size,
 	redzone_start = round_up((unsigned long)start + size,
 				 KASAN_GRANULE_SIZE);
 	redzone_size = round_up(redzone_start, PAGE_SIZE) - redzone_start;
-	kasan_poison((void *)redzone_start, redzone_size, KASAN_TAG_INVALID,
+	kasan_poison((void *)redzone_start, redzone_size, KASAN_PAGE_REDZONE,
 		     flags & KASAN_VMALLOC_INIT);
 
 	/*
-- 
2.43.0


