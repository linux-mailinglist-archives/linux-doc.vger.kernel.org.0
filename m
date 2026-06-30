Return-Path: <linux-doc+bounces-94201-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u31RO0rwQ2pplwoAu9opvQ
	(envelope-from <linux-doc+bounces-94201-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 18:35:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACEF6E6805
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 18:35:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TZNxtZNk;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94201-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94201-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5C06309C749
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 16:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E684D47A0B2;
	Tue, 30 Jun 2026 16:28:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E032B4534A3
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 16:28:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836892; cv=none; b=nSDMoVASR06aLADFv8ttIQfxS6r56NJ4KBuVi00/GYeNGsCZoIymqImmMWfvUVfDebGFROxgHElY87SaPenn+HCaHN5THvKqITZ0Jt8VHSMKaqmOOaS6ezz8CdfNbK/aZmAmeVM2mxR6rHee0ywg62XifunH3FkMZPZtpe1c46Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836892; c=relaxed/simple;
	bh=XRhxz5NWmGckudR2wVBYwj+A9z2FfL4uflUcGrBVXU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1Hc6bJTj2jifdg1Eeh4M3NB/DcojP0bO8VzlfsktJQxl20iifDOpflfxR1MiIe4swBGKX8J6piPXU6CH2sogWybyf05zcCj7G4SBopCAlBO0NfhNaDudI+obHT32v6MLYwxGh+XoPkyjhUDuHkG/fOUoAZmUR9kQKt3QId0hTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZNxtZNk; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c9d87b1f9eso18265945ad.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 09:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782836890; x=1783441690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLyMnEKrEL8CEzg90HHddtIh/3xfPpGptax6HcLpH/g=;
        b=TZNxtZNki75SVVO/a12ayoeHFeQuL5/bi/SzYQEylik/qq41/Ivm4Ify7nv3xTh+7a
         3s3Lk4ZJSyOYJ+Y5utBVgLMtf4nbGvwVVgE4skQWVzyM07kGRimmAnz6Wz/MOu4TYoLv
         LJ8G7iZU04in0UhSlgWOv8S3JMmKotBzBTk13ae8/p2ddJ5TBc6lJQ7TUqkoRsLwIjqJ
         eT2oylwuxLf69hopF1Ztld66ySg9DHSbjNPcCU1dHa878FRVSfzVn0aIuIQX3ZngTxBF
         3jPkMw4fhLCmi8R1WySg6Hz0qpnpRtbzSe3hlyYa81KC7t3rdvgV7dI2iJjEZ4SmYizn
         l4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782836890; x=1783441690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VLyMnEKrEL8CEzg90HHddtIh/3xfPpGptax6HcLpH/g=;
        b=F4EVKO98OokzHYJlTbaVyGC/SlW+JTKgZhWKD9rl/aJnqLWThPB7Ixer/lnmDCpDBu
         LZuWki1e0eRPX1q89iLqLqdviUCzy6fQ5V33zlHi4jYWZ7B79yCTb6sArwe9nWkm0uWc
         PLiDOK7DdjHrIc3xu5lI+nhGp70qVhDgGx5kxSelXLa13njLfxJQ4cZJ3WOnKagr1Mu/
         u/CaQqiNsBMQu2Xf+gXsPUl6fxubOCbtbCo9yFeTlVZKqyN4vSbRvWDuPaBYdLMgWm3i
         1BjnPrbRrym0X61E94802UZp4BVv1CEfyA30gZLluWs73yxSg1+j4EosyMAhyGbG2UTn
         egLw==
X-Forwarded-Encrypted: i=1; AHgh+RpoqvQTg9kJNLQDjcKhPEhcYn7vslZLXpBLOiWkRf/GeJgcfgyZEKp2qqgpqpmLYbEdszTsNE942nQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmd9TBuQTVqYQJt/6Flc1nvGB1NKfkxzB2tqkJmW/fABOBfhKG
	xfv1gBZ+8l0wNRMZVthyh8cKW3GJI7mSUuJulqPLL1XjuItaDqAjWs1r
X-Gm-Gg: AfdE7cnR0vjpQv8HKXOYLLDkbxn3/p8FRWSNuxJF8M46rvAteAPhwf9aeaHKLYL68z4
	OdQ2M55gJsrnkqn9XyFqwzsmNH7+f0qpM7nC2QEwA996a9s7fxWaTWw7dQfoUJWQwqAWEXO3VHO
	H5paC+Lk6dI/nbORJqozY7rfcBUFPK7ZknfLMYooDgcGRwg034s8jaqjf3kJQ0DautZuzdgpDp6
	TYlqYZdY8j6fPSaTpQ6Zc1VFEi/eTdWlJqKEs6FpUdUK5QE+fQv5+bhgrSoQHIYYGiM3InP2MIE
	H/OC65sM0uS3SbiHWDuqkadN3DvShSDWHPS6kiKmLqVPTD9jUzoWpeIhbeZ7J5BPXQ6bLMEtijO
	oCY8EiaunODIDBx37CQfd9+P9mucKMkcWc60SaIApGSH6ANtsxVywDWtH3V3S/eJZUuwA/EqaWd
	qOhPJ5PcQXh6z2v7lpG1FlJNauVKs/pFL1r+evZ1pGhMTdq5wp67LCcS39F4dyL2okI748DeO0
X-Received: by 2002:a17:902:c941:b0:2c6:a772:7e43 with SMTP id d9443c01a7336-2ca2e333005mr31821535ad.18.1782836890006;
        Tue, 30 Jun 2026 09:28:10 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bcesm17829375ad.29.2026.06.30.09.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:28:09 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 01 Jul 2026 00:27:34 +0800
Subject: [PATCH v6 3/3] mm: move reclaim-internal declarations out of
 swap.h
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-3-d4f648963382@gmail.com>
References: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-0-d4f648963382@gmail.com>
In-Reply-To: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-0-d4f648963382@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
 Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Baoquan He <baoquan.he@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1782836860; l=7981;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=XRhxz5NWmGckudR2wVBYwj+A9z2FfL4uflUcGrBVXU0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDVAm9iAhamWZlnpY66chIWu58g1gHeC2XJg0VBOBZksKBGjlgDxkS3D7Ip8kDTzesWnsNGTS3Q
 odVh3ODZnIwM=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:hannes@cmpxchg.org,m:david@kernel.org,m:mhocko@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:baoquan.he@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:wujianyue000@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94201-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,kernel.org,tencent.com,huaweicloud.com,gmail.com,lge.com,linux.dev,google.com,cmpxchg.org,infradead.org,suse.com,linux.alibaba.com,lwn.net,linuxfoundation.org];
	FORGED_SENDER(0.00)[wujianyue000@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kvack.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wujianyue000@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cmpxchg.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4ACEF6E6805

Keep include/linux/swap.h focused on swap-facing interfaces by moving
MM-internal reclaim and workingset declarations into mm/internal.h.

Leave the small set of LRU helper declarations that are used outside mm/
in swap.h so this cleanup does not need a new public header under
include/linux/.

Suggested-by: Barry Song <baohua@kernel.org>
Suggested-by: Baoquan He <bhe@redhat.com>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 include/linux/swap.h | 74 +++++-----------------------------------------------
 mm/internal.h        | 67 +++++++++++++++++++++++++++++++++++++++++++++++
 mm/memfd.c           |  1 +
 3 files changed, 75 insertions(+), 67 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 48cbcbe534bd..ea5c6860c539 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -293,39 +293,19 @@ static inline swp_entry_t page_swap_entry(struct page *page)
 	return entry;
 }
 
-/* linux/mm/workingset.c */
-bool workingset_test_recent(void *shadow, bool file, bool *workingset,
-				bool flush);
-void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages);
-void *workingset_eviction(struct folio *folio, struct mem_cgroup *target_memcg);
-void workingset_refault(struct folio *folio, void *shadow);
-void workingset_activation(struct folio *folio);
-
 /* linux/mm/page_alloc.c */
 extern unsigned long totalreserve_pages;
 
 /* Definition of global_zone_page_state not available yet */
 #define nr_free_pages() global_zone_page_state(NR_FREE_PAGES)
 
+/* linux/mm/folio.c */
+void folio_add_lru(struct folio *folio);
+void folio_mark_accessed(struct folio *folio);
+void lru_add_drain_all(void);
 
-/* linux/mm/swap.c */
-void lru_note_cost_unlock_irq(struct lruvec *lruvec, bool file,
-		unsigned int nr_io, unsigned int nr_rotated);
-void lru_note_cost_refault(struct folio *);
-void folio_add_lru(struct folio *);
-void folio_add_lru_vma(struct folio *, struct vm_area_struct *);
-void mark_page_accessed(struct page *);
-void folio_mark_accessed(struct folio *);
-
-static inline bool folio_may_be_lru_cached(struct folio *folio)
-{
-	/*
-	 * Holding PMD-sized folios in per-CPU LRU cache unbalances accounting.
-	 * Holding small numbers of low-order mTHP folios in per-CPU LRU cache
-	 * will be sensible, but nobody has implemented and tested that yet.
-	 */
-	return !folio_test_large(folio);
-}
+/* linux/mm/folio-compat.c */
+void mark_page_accessed(struct page *page);
 
 extern atomic_t lru_disable_count;
 
@@ -334,42 +314,7 @@ static inline bool lru_cache_disabled(void)
 	return atomic_read(&lru_disable_count);
 }
 
-static inline void lru_cache_enable(void)
-{
-	atomic_dec(&lru_disable_count);
-}
-
-extern void lru_cache_disable(void);
-extern void lru_add_drain(void);
-extern void lru_add_drain_cpu(int cpu);
-extern void lru_add_drain_cpu_zone(struct zone *zone);
-extern void lru_add_drain_all(void);
-void folio_deactivate(struct folio *folio);
-void folio_mark_lazyfree(struct folio *folio);
-
 /* linux/mm/vmscan.c */
-extern unsigned long zone_reclaimable_pages(struct zone *zone);
-extern unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
-					gfp_t gfp_mask, nodemask_t *mask);
-unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru, int zone_idx);
-
-#define MEMCG_RECLAIM_MAY_SWAP (1 << 1)
-#define MEMCG_RECLAIM_PROACTIVE (1 << 2)
-#define MIN_SWAPPINESS 0
-#define MAX_SWAPPINESS 200
-
-/* Just reclaim from anon folios in proactive memory reclaim */
-#define SWAPPINESS_ANON_ONLY (MAX_SWAPPINESS + 1)
-
-extern unsigned long try_to_free_mem_cgroup_pages(struct mem_cgroup *memcg,
-						  unsigned long nr_pages,
-						  gfp_t gfp_mask,
-						  unsigned int reclaim_options,
-						  int *swappiness);
-extern unsigned long mem_cgroup_shrink_node(struct mem_cgroup *mem,
-						gfp_t gfp_mask, bool noswap,
-						pg_data_t *pgdat,
-						unsigned long *nr_scanned);
 extern unsigned long shrink_all_memory(unsigned long nr_pages);
 extern int vm_swappiness;
 long remove_mapping(struct address_space *mapping, struct folio *folio);
@@ -390,11 +335,6 @@ static inline void reclaim_unregister_node(struct node *node)
 }
 #endif /* CONFIG_SYSFS && CONFIG_NUMA */
 
-#ifdef CONFIG_NUMA
-extern int sysctl_min_unmapped_ratio;
-extern int sysctl_min_slab_ratio;
-#endif
-
 void check_move_unevictable_folios(struct folio_batch *fbatch);
 
 extern void __meminit kswapd_run(int nid);
@@ -551,7 +491,7 @@ static inline int mem_cgroup_swappiness(struct mem_cgroup *memcg)
 
 void lru_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent, int nid);
 #else
-static inline int mem_cgroup_swappiness(struct mem_cgroup *mem)
+static inline int mem_cgroup_swappiness(struct mem_cgroup *memcg)
 {
 	return READ_ONCE(vm_swappiness);
 }
diff --git a/mm/internal.h b/mm/internal.h
index 181e79f1d6a2..6843b4a2917e 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -24,6 +24,73 @@
 
 struct folio_batch;
 
+/* mm/workingset.c */
+bool workingset_test_recent(void *shadow, bool file, bool *workingset,
+			    bool flush);
+void workingset_age_nonresident(struct lruvec *lruvec, unsigned long nr_pages);
+void *workingset_eviction(struct folio *folio,
+			  struct mem_cgroup *target_memcg);
+void workingset_refault(struct folio *folio, void *shadow);
+void workingset_activation(struct folio *folio);
+
+/* mm/folio.c */
+void lru_note_cost_unlock_irq(struct lruvec *lruvec, bool file,
+		unsigned int nr_io, unsigned int nr_rotated);
+void lru_note_cost_refault(struct folio *folio);
+void folio_add_lru_vma(struct folio *folio, struct vm_area_struct *vma);
+
+static inline bool folio_may_be_lru_cached(struct folio *folio)
+{
+	/*
+	 * Holding PMD-sized folios in per-CPU LRU cache unbalances accounting.
+	 * Holding small numbers of low-order mTHP folios in per-CPU LRU cache
+	 * will be sensible, but nobody has implemented and tested that yet.
+	 */
+	return !folio_test_large(folio);
+}
+
+static inline void lru_cache_enable(void)
+{
+	atomic_dec(&lru_disable_count);
+}
+
+void lru_cache_disable(void);
+void lru_add_drain(void);
+void lru_add_drain_cpu(int cpu);
+void lru_add_drain_cpu_zone(struct zone *zone);
+void folio_deactivate(struct folio *folio);
+void folio_mark_lazyfree(struct folio *folio);
+
+/* mm/vmscan.c */
+unsigned long zone_reclaimable_pages(struct zone *zone);
+unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
+				gfp_t gfp_mask, nodemask_t *mask);
+unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru,
+			      int zone_idx);
+
+#define MEMCG_RECLAIM_MAY_SWAP (1 << 1)
+#define MEMCG_RECLAIM_PROACTIVE (1 << 2)
+#define MIN_SWAPPINESS 0
+#define MAX_SWAPPINESS 200
+
+/* Just reclaim from anon folios in proactive memory reclaim */
+#define SWAPPINESS_ANON_ONLY (MAX_SWAPPINESS + 1)
+
+unsigned long try_to_free_mem_cgroup_pages(struct mem_cgroup *memcg,
+					   unsigned long nr_pages,
+					   gfp_t gfp_mask,
+					   unsigned int reclaim_options,
+					   int *swappiness);
+unsigned long mem_cgroup_shrink_node(struct mem_cgroup *memcg,
+				     gfp_t gfp_mask, bool noswap,
+				     pg_data_t *pgdat,
+				     unsigned long *nr_scanned);
+
+#ifdef CONFIG_NUMA
+extern int sysctl_min_unmapped_ratio;
+extern int sysctl_min_slab_ratio;
+#endif
+
 /*
  * Maintains state across a page table move. The operation assumes both source
  * and destination VMAs already exist and are specified by the user.
diff --git a/mm/memfd.c b/mm/memfd.c
index abe13b291ddc..6c72fe6caef7 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -19,6 +19,7 @@
 #include <linux/memfd.h>
 #include <linux/pid_namespace.h>
 #include <uapi/linux/memfd.h>
+#include "internal.h"
 #include "swap.h"
 
 /*

-- 
2.43.0


