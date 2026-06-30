Return-Path: <linux-doc+bounces-94159-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MfDHFl27Q2ongAoAu9opvQ
	(envelope-from <linux-doc+bounces-94159-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 14:49:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B656E46D9
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 14:49:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=Az1wZIaL;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94159-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94159-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C55CA304E95B
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 12:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5DA40E8F6;
	Tue, 30 Jun 2026 12:46:47 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A587140F8C6;
	Tue, 30 Jun 2026 12:46:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823607; cv=none; b=NAvu/cut/RvnDjTYvWrh5h5ymJF/Ka4uDDrX19wZCuIL7lwM+QafGFB9NMVb3iZ3tdiX8lIQXq4ZEeDLkq6p9WCCk5Ydmh6kGpKRRZwFdlDk8PGln24FYIYr9jiRkMnbZj0jQEZo7Q6iLNOB+aBxod7fuqn/D5gyI3+6tzIQAoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823607; c=relaxed/simple;
	bh=QiA0KGoCN46shnI5qT5X0mAB2aGO1DAFqEcShnOA/HE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTXew5kWBrlPg+ZzKNwlCy0sZpRRSSOHcP2yof2adodGXdaCHz2CaaHsaUvOx0nq+XiRi5wD5PjpQ3keSnTgOWAfBAfuABWBnHEPgWWqsiPVSX3dMGo8XR/wmVdrvyaCxf/G+0dervgHBXKiPwLlyawhl59c3xiEhCtLVtD9dM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Az1wZIaL; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=yKuJcjdWzQFo0sQFTE+S5Gh5L1HH8cwYpvBwkdQvObQ=; b=Az1wZIaLfhQxIr6kDONe+Mv+y0
	jG+tTsnSVoKsfMgy/YsXiYHtfAkNzLt0aJY3EEZapDPqBgcmXwsz6HWe3dZeNjpQUiBrlpQuWJJ3j
	xyzYY+WsGFX6wh0ABTxSssKPtBDcX414Nq8Q+CRAjhm6GLt4oom7Dg5V4Ae1xCp/ypD3NQ5/OEF7j
	0n1gXVwDNnSVp9SaAaw6O6CarPcTHOtaTljcCGwoYuRhHGrElTH/VlL3B3zL5/PiBRi8i+DbqeoMX
	LDb91n4jbD3KLAfVkiEcytACIgYmfiRZwsP3cTWb1hpDpNUadWmZfSMPw8MJAQR6xspHcQUnH/aBp
	/H6m0DEQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1weXrG-0074bK-19;
	Tue, 30 Jun 2026 12:46:34 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 30 Jun 2026 05:46:04 -0700
Subject: [PATCH v10 1/6] mm/memory-failure: drop dead error_states[] entry
 for reserved pages
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-ecc_panic-v10-1-c6ed5b62eea2@debian.org>
References: <20260630-ecc_panic-v10-0-c6ed5b62eea2@debian.org>
In-Reply-To: <20260630-ecc_panic-v10-0-c6ed5b62eea2@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, lance.yang@linux.dev, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 "Liam R. Howlett" <liam@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, linux-trace-kernel@vger.kernel.org, 
 kernel-team@meta.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3201; i=leitao@debian.org;
 h=from:subject:message-id; bh=QiA0KGoCN46shnI5qT5X0mAB2aGO1DAFqEcShnOA/HE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqQ7qdrz16EpE9ncXgjPQGVbtAOucfGhxcex96C
 9typ4DQV7WJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCakO6nQAKCRA1o5Of/Hh3
 bSZeEACAQcBUlw7QGrJCZkO/0ZmETp3GR2br05j4IgU5SIXqykYpfraNOW/39Xofc8THBIbXP1O
 Oem0yYxD2KlIAmLL7YtQlfzYIMqg5PMXxmLMN1GP/QpvM1D6tt6gGGka8Zp7slGQFjL8mOB7HCi
 gKSpSnLu0HtSiUsANF8NwfVrlOxIMkGJ7V1XjAZfGKP1kRdNdcxdtAzglJcrKI+H76FqHaSzWk0
 Le4U4ORkLcylhFWG5JD5N+Ciu0CO+DsgE5EbZq+pnNpOPZWUvh22e+wnHYTRqZm8I7Y56jb+5ml
 /VSZw6EvijnGxVwaLYCyAvbStfNKXpXebskCAUqVDoAcv/yl56tOOJCX7YAkOUXsHRsanoSOtNq
 fnRuheKVbZ/xNKXuisyPkwe+4SX0+/iefY+lACTw1/GjM1GzpShroazKAPZSZSsjBs0uawtiRkm
 p0NKDF6QADz9Qd+2Q6bsy4TXE84fNR3yPbKf7Zd5Hjt9xv6uaYWmZTkfs5OWg9+ACf8WO7PxYua
 3c01clnwZEV3KvXfwGLqFpqNiiVRf9AMzcA2VzN3uMGDf+yBqoZRnuahLxSHmH2aHrdQjG/D8sa
 N84ZAbK45UGhnprya6LmpkO0Y5UGJNurb3/sxZ5XUBLA1ZcqTqR9awvQK+/SI5tt5NVoU57KiS8
 T+H+WBL1XYxtLgA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94159-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linmiaohe@huawei.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:nao.horiguchi@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:liam@infradead.org,m:lance.yang@linux.dev,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:leitao@debian.org,m:linux-trace-kernel@vger.kernel.org,m:kernel-team@meta.com,m:naohoriguchi@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[huawei.com,linux-foundation.org,kernel.org,google.com,suse.com,gmail.com,lwn.net,linuxfoundation.org,infradead.org,linux.dev,goodmis.org,efficios.com];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,huawei.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16B656E46D9

The first entry of error_states[],

	{ reserved,	reserved,	MF_MSG_KERNEL,	me_kernel },

is unreachable.  identify_page_state() has two callers, and neither
one can dispatch a PG_reserved page to me_kernel():

  * memory_failure() reaches identify_page_state() only after
    get_hwpoison_page() returned 1.  get_any_page() reaches that
    return only via __get_hwpoison_page(), which only takes a
    refcount when the page is HWPoisonHandlable().
    HWPoisonHandlable() is an allowlist for LRU, free-buddy, and
    (for soft-offline) movable_ops pages -- PG_reserved pages do
    not satisfy any of these, so they fail with -EBUSY/-EIO long
    before identify_page_state() runs.

  * try_memory_failure_hugetlb() reaches identify_page_state() only
    via the MF_HUGETLB_IN_USED branch, where the page is necessarily
    a hugetlb folio.  hugetlb folios don't carry PG_reserved at that
    point: hugetlb_folio_init_vmemmap() calls __folio_clear_reserved()
    during init, so the reserved entry would not match even if it
    were still present.

me_kernel() never executes and the entry exists only to be matched
against by code that cannot see it.

Drop the entry, the me_kernel() helper, and the now-unused
"reserved" macro.  Leave the MF_MSG_KERNEL enum value in place: it
remains part of the tracepoint and pr_err() string tables, and
follow-on work to classify unrecoverable kernel pages can reuse it
without churning the user-visible enum.

No functional change.

Suggested-by: David Hildenbrand <david@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Acked-by: Miaohe Lin <linmiaohe@huawei.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/memory-failure.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 51508a55c4055..f4d3e6e20e13f 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -980,17 +980,6 @@ static bool has_extra_refcount(struct page_state *ps, struct page *p,
 	return false;
 }
 
-/*
- * Error hit kernel page.
- * Do nothing, try to be lucky and not touch this instead. For a few cases we
- * could be more sophisticated.
- */
-static int me_kernel(struct page_state *ps, struct page *p)
-{
-	unlock_page(p);
-	return MF_IGNORED;
-}
-
 /*
  * Page in unknown state. Do nothing.
  * This is a catch-all in case we fail to make sense of the page state.
@@ -1199,10 +1188,8 @@ static int me_huge_page(struct page_state *ps, struct page *p)
 #define mlock		(1UL << PG_mlocked)
 #define lru		(1UL << PG_lru)
 #define head		(1UL << PG_head)
-#define reserved	(1UL << PG_reserved)
 
 static struct page_state error_states[] = {
-	{ reserved,	reserved,	MF_MSG_KERNEL,	me_kernel },
 	/*
 	 * free pages are specially detected outside this table:
 	 * PG_buddy pages only make a small fraction of all free pages.
@@ -1234,7 +1221,6 @@ static struct page_state error_states[] = {
 #undef mlock
 #undef lru
 #undef head
-#undef reserved
 
 static void update_per_node_mf_stats(unsigned long pfn,
 				     enum mf_result result)

-- 
2.53.0-Meta


