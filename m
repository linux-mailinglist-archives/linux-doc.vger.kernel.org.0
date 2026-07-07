Return-Path: <linux-doc+bounces-95299-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gdi/ChqhTGo9nQEAu9opvQ
	(envelope-from <linux-doc+bounces-95299-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 08:47:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 784637181D1
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 08:47:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=E6btGgr4;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95299-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95299-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3EC4300734E
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 06:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E6B3ADB9B;
	Tue,  7 Jul 2026 06:42:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB29D3AA4EB
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 06:42:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406564; cv=none; b=T19b7lwLtZ+bptyd9PqNydO0AAp2ViQPbW5vEr6VpGYYH0+LeLjfdkbqm9nEp9BpXNSpsKeUQgJZJRu1AF2mg8RzFjxOIcRKMjsE3UB70+dRTh9weiYxb5BSXkkzyo2J+Xd9ExkOvVtDY/mGlpaniXotR8QmoHd6OcQMeSHx0kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406564; c=relaxed/simple;
	bh=2lLGZPZ12t2H2bDJsmFjZT9bYckblK5ShT/m5eK8VdI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AiAXW4z+hMglmkBTvLDAEc9nnUG3FYxjhfKd4hAotKYChLNRaD54WxgT8/E3IfQ7lnT4GT4bRDeuUWGOMRJtApZ4GDKAS8sq88N7FtGb4q7hjuLm0QhkcV3AVHEG74ODlVveosl0iopgnNZ56BgfuIUDSRggHFlEkYwTL7URzik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--souravpanda.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E6btGgr4; arc=none smtp.client-ip=209.85.210.201
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-845bc2e658aso3514141b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 23:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783406562; x=1784011362; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbIFtySlJ/B4vAMWak3mVgchLPUkdC1Nvsmy15z5aNM=;
        b=E6btGgr4mF2t+fLaS8rqg1jE9huXAzRNduXoPqKj75e8XZBjkToshRI8XCyu+qUHJq
         2dVttij7jEOE15yB/VchawjduzJIcZRp861rAxE9UGylkIGeceAdkXh6Ch9LDnxYdsrk
         I45NgjC/1OAx9Icj+79iHof/OmugMXFIYebXdN+KAj/WjumS2BnIv+QrGm+I0wnqYt+8
         Zgg3qEZ4QFBBAGl3xMalEXdgzQvPG2pPbNLlt/vrwZWDT00XN//FL2y+/W5DxsgrfS5K
         maImdeD7KYVTe5JWb3lpIzOojMaDJY7yFxNkMGoQ51JCnzmMqy31pYyDXv8SsKfSCAwC
         K3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783406562; x=1784011362;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbIFtySlJ/B4vAMWak3mVgchLPUkdC1Nvsmy15z5aNM=;
        b=lGoh3FzDHBugVpmYyB8oUeu6OHSiaV7lkgG5YQF+9fNz0bcq6rAQ2s7rPDB6VQgPOp
         Jh+RV5U4WnaTE5gqQCjexOLfzq9Qz1LN9lEWtjPwWLRtVff3BIcp03Yvcx/XihFUt5at
         kGYtiuIcm71wNZZh2H1Sddkpdfx3zwlM4jf8y63U+qTtabcytYUi2aqB3dlEM1WtOlsN
         lZrzca4yWlzWtdG+eU59nA4MXbx1o/tu6hUsE83kwRFJF/nW1hs2wGCODNaptbqz2+m5
         YvaddW//jp6EIrwS6y47c2AUSPR+LdKEYlhlZmLM7N3VxD/Q9ugj3csfonREanH0jog3
         /0ig==
X-Forwarded-Encrypted: i=1; AHgh+RolGd+LOoO2c4XXHemGnxK7kbDPdCNc1GktjgkxNQeDICvY55xZUOYcKytnUvQva5Rl4IQDmm7qw+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzWRvRJTeJGr4aRJ08zCNIJHTE0RMMsbZ456BSoAEUzYRedY/T
	CBbYqDjCxIp9mXl8ZA/+sT6j1kEZMnQDy7tiKJxDLP0z5dxIIIljcuUcVHLzSBsesyw2bwz6pD0
	iyOjrcwTMpKYpp19fhnvVJBEZPg==
X-Received: from pfbbx25.prod.google.com ([2002:a05:6a00:4299:b0:847:82b3:aca])
 (user=souravpanda job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:94a4:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-8482e3c9a98mr1470448b3a.4.1783406561929;
 Mon, 06 Jul 2026 23:42:41 -0700 (PDT)
Date: Tue,  7 Jul 2026 06:42:33 +0000
In-Reply-To: <20260707064235.1386552-1-souravpanda@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260707064235.1386552-1-souravpanda@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260707064235.1386552-5-souravpanda@google.com>
Subject: [PATCH 4/6] mm/hugetlb: add memory shrinker for cache
From: Sourav Panda <souravpanda@google.com>
To: muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org
Cc: david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, mst@redhat.com, 
	mhklinux@outlook.com, souravpanda@google.com, fvdl@google.com, 
	gthelen@google.com, mike.kravetz@oracle.com, pasha.tatashin@soleen.com, 
	rientjes@google.com, riel@surriel.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-95299-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,google.com,suse.com,redhat.com,outlook.com,oracle.com,soleen.com,surriel.com,kvack.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:muchun.song@linux.dev,m:osalvador@suse.de,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:mst@redhat.com,m:mhklinux@outlook.com,m:souravpanda@google.com,m:fvdl@google.com,m:gthelen@google.com,m:mike.kravetz@oracle.com,m:pasha.tatashin@soleen.com,m:rientjes@google.com,m:riel@surriel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[souravpanda@google.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[souravpanda@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 784637181D1

Register a memory shrinker for the HugeTLB dynamic cache to
reclaim cached pages under memory pressure.

Implement hugetlb_shrinker_count to report the number of cached pages
(currently limited to gigantic pages in the shrinker) and
hugetlb_shrinker_scan to free them back to the buddy allocator.

The shrinker scan uses LRU policy to reclaim the coldest pages first.

Signed-off-by: Sourav Panda <souravpanda@google.com>
---
 mm/hugetlb.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index f18a3123cbcb..1bc0198a695c 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4399,6 +4399,68 @@ ssize_t __max_cached_huge_pages_store_common(bool obey_mempolicy,
 
 	return err ? err : len;
 }
+
+static unsigned long hugetlb_shrinker_count(struct shrinker *shrink,
+					    struct shrink_control *sc)
+{
+	struct hstate *h;
+	unsigned long count = 0;
+	int nid = sc->nid;
+
+	for_each_hstate(h) {
+		count += h->nr_cached_hugepages_node[nid];
+	}
+	return count;
+}
+
+static unsigned long hugetlb_shrinker_scan(struct shrinker *shrink,
+					   struct shrink_control *sc)
+{
+	struct hstate *h;
+	int nid = sc->nid;
+	unsigned long freed = 0;
+	unsigned long to_scan = sc->nr_to_scan;
+
+	for_each_hstate(h) {
+		while (freed < to_scan) {
+			struct folio *folio = NULL;
+			bool atomic = true;
+
+			/*
+			 * Only do synchronous vmemmap restoration if the caller
+			 * context allows blocking and FS reclaim (GFP_KERNEL compatible).
+			 * Otherwise, defer to workqueue to avoid lock inversion.
+			 */
+			if (gfpflags_allow_blocking(sc->gfp_mask) &&
+			    (sc->gfp_mask & __GFP_FS))
+				atomic = false;
+
+			spin_lock_irq(&hugetlb_lock);
+			if (list_empty(&h->hugepage_cache_lists[nid])) {
+				spin_unlock_irq(&hugetlb_lock);
+				break;
+			}
+
+			folio = list_first_entry(&h->hugepage_cache_lists[nid],
+						 struct folio, lru);
+
+			remove_hugetlb_folio(h, folio, false);
+			spin_unlock_irq(&hugetlb_lock);
+
+			update_and_free_hugetlb_folio(h, folio, atomic);
+
+			freed++;
+			if (current->reclaim_state)
+				current->reclaim_state->reclaimed += pages_per_huge_page(h);
+		}
+		if (freed >= to_scan)
+			break;
+	}
+
+	return freed;
+}
+
+static struct shrinker *hugetlb_cached_pages_shrinker;
 #endif /* CONFIG_HUGETLB_CACHE */
 
 ssize_t __nr_hugepages_store_common(bool obey_mempolicy,
@@ -4502,6 +4564,21 @@ static int __init hugetlb_init(void)
 
 	for (i = 0; i < num_fault_mutexes; i++)
 		mutex_init(&hugetlb_fault_mutex_table[i]);
+
+#ifdef CONFIG_HUGETLB_CACHE
+	hugetlb_cached_pages_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE |
+						       SHRINKER_NONSLAB,
+						       "hugetlb-cached-pages");
+	if (!hugetlb_cached_pages_shrinker) {
+		pr_warn("HugeTLB: Failed to allocate shrinker\n");
+	} else {
+		hugetlb_cached_pages_shrinker->count_objects = hugetlb_shrinker_count;
+		hugetlb_cached_pages_shrinker->scan_objects = hugetlb_shrinker_scan;
+		hugetlb_cached_pages_shrinker->batch = 1;
+		shrinker_register(hugetlb_cached_pages_shrinker);
+	}
+#endif
+
 	return 0;
 }
 subsys_initcall(hugetlb_init);
-- 
2.55.0.rc0.799.gd6f94ed593-goog


