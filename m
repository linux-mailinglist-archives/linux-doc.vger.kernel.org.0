Return-Path: <linux-doc+bounces-74232-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOoRCekVemlS2QEAu9opvQ
	(envelope-from <linux-doc+bounces-74232-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jan 2026 14:58:01 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F41AA25F9
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jan 2026 14:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D1293010774
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jan 2026 13:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA304361644;
	Wed, 28 Jan 2026 13:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2HZNztt"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17613612F0
	for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 13:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608617; cv=none; b=au/ckSZHSpoLHNfc2A4vYn8/Q1ItFJrpxQF6J884WxA6IQrxJeHNRE/olw1uZsRaz6NiYhNavnABNWAFWZifarg4ZdCM9e22/wQxSp76ODH/RIjUTF6YpwSSfeVtehLoKGwA9Sg08Qc2NWwrBghKkf1prxvOk2CYZSO1OahyC8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608617; c=relaxed/simple;
	bh=/J8V9jwFScp2INMSJwfe65TqSX6OjE7/lS2Qj5yolSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSli1nxSm83RF7gjsxnQvjAaLFkhRYXuuUDs/6v/27HF0UTfGDhy6qhhQlQVbdpnexn+RjIC1wU2Nm/0dsq6WgNLUbtp8e4SjYVYgO+TpoHokT5I4Q/aH/QwJU23IXf2/0hGWRqkX+Sr4uxDF8cp24WlFaPlqh+NLyDzNI8pe/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2HZNztt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B57C2BC87;
	Wed, 28 Jan 2026 13:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769608617;
	bh=/J8V9jwFScp2INMSJwfe65TqSX6OjE7/lS2Qj5yolSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r2HZNzttR9S47HYlLiT2TjUsmz/3zG+QxDqwRSYLNPXdAKLmHJx2IFEMqXxUIb9Al
	 VzvxU1MIt+9Uka4xgO9CgKWW3F1iUJH0GzIUOdFcfz4dmRkeq1KBEAuW6RkzpG5htH
	 UK8WyDL6Kqx6QhXT/3Lm+KdmsfozXI/U/t7Y6HSSkSqN7hCpqOZkjn9AnWdOSb4Y5V
	 2CYpdWA2WtuKim3T6HYPTzj/2dYbcRAAm4EyJHZ77xXyt8kqRxl/Rro8vSwpOlukYx
	 rTbleo3bFDu+kT9+DHiOe0gh8M4iIcXQOqiglAGrbyJNDXlchxEh3rXc+wF2x8uT5X
	 2SnrociFGwESw==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id D8C30F40068;
	Wed, 28 Jan 2026 08:56:55 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 28 Jan 2026 08:56:55 -0500
X-ME-Sender: <xms:pxV6aZgwMmEZQJGTkdBBUFpH375y3foHYhDGK0zbi8q7Y9zVYSUcoA>
    <xme:pxV6aXNK2GUSkDz7fC3nz4sKGg6itah0R9huGtqOdgi7wXhf8V_T8JfvxO7AkF1op
    TGPr_fJ0oacvCE4w43pzjBatxSzXmkQWusPjx76N59w7v1_1Z2tHQU6>
X-ME-Received: <xmr:pxV6aTPmrAnN-L6JrhSoyRc9Qb7d60iEG5J6M5apRrk5fk5KS_cNi7xRfVHYZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:pxV6afIolyNXFFgNATLFUCybtrTAeNlWlYGAzVQUzTnwfBzNKfKd4Q>
    <xmx:pxV6aSvF-HVWdV-JOaJhE9G5pytWLByCY1bIwtyymt0YG654XmiCHw>
    <xmx:pxV6aREZAEZG7GwRy2jRORfck6fhSZ_83t7QwmL2pPMOhRUSCSuYIg>
    <xmx:pxV6aRNaoerreMj35yd1nzUqnON4lumQBbPEI8KRNLKe9tyAxpPttQ>
    <xmx:pxV6aUFMLM8N_VPr6YHInStFXxsd_ytMCtTWp__mdHJMLT2aENmFBXsN>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 08:56:54 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv5 13/17] hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
Date: Wed, 28 Jan 2026 13:54:54 +0000
Message-ID: <20260128135500.22121-14-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260128135500.22121-1-kas@kernel.org>
References: <20260128135500.22121-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linux-foundation.org,linux.dev,redhat.com,infradead.org,gmail.com,google.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-74232-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[kas@kernel.org,linux-doc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F41AA25F9
X-Rspamd-Action: no action

The VMEMMAP_SYNCHRONIZE_RCU flag triggered synchronize_rcu() calls to
prevent a race between HVO remapping and page_ref_add_unless(). The
race could occur when a speculative PFN walker tried to modify the
refcount on a struct page that was in the process of being remapped
to a fake head.

With fake heads eliminated, page_ref_add_unless() no longer needs RCU
protection.

Remove the flag and synchronize_rcu() calls.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 mm/hugetlb_vmemmap.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index f5f42b92dd7d..fd74a164c494 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -47,8 +47,6 @@ struct vmemmap_remap_walk {
 #define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
 /* Skip the TLB flush when we remap the PTE */
 #define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(1)
-/* synchronize_rcu() to avoid writes from page_ref_add_unless() */
-#define VMEMMAP_SYNCHRONIZE_RCU		BIT(2)
 	unsigned long		flags;
 };
 
@@ -409,9 +407,6 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	if (!folio_test_hugetlb_vmemmap_optimized(folio))
 		return 0;
 
-	if (flags & VMEMMAP_SYNCHRONIZE_RCU)
-		synchronize_rcu();
-
 	vmemmap_start	= (unsigned long)&folio->page;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
 
@@ -444,7 +439,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
  */
 int hugetlb_vmemmap_restore_folio(const struct hstate *h, struct folio *folio)
 {
-	return __hugetlb_vmemmap_restore_folio(h, folio, VMEMMAP_SYNCHRONIZE_RCU);
+	return __hugetlb_vmemmap_restore_folio(h, folio, 0);
 }
 
 /**
@@ -467,14 +462,11 @@ long hugetlb_vmemmap_restore_folios(const struct hstate *h,
 	struct folio *folio, *t_folio;
 	long restored = 0;
 	long ret = 0;
-	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH | VMEMMAP_SYNCHRONIZE_RCU;
+	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH;
 
 	list_for_each_entry_safe(folio, t_folio, folio_list, lru) {
 		if (folio_test_hugetlb_vmemmap_optimized(folio)) {
 			ret = __hugetlb_vmemmap_restore_folio(h, folio, flags);
-			/* only need to synchronize_rcu() once for each batch */
-			flags &= ~VMEMMAP_SYNCHRONIZE_RCU;
-
 			if (ret)
 				break;
 			restored++;
@@ -556,8 +548,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 
 	static_branch_inc(&hugetlb_optimize_vmemmap_key);
 
-	if (flags & VMEMMAP_SYNCHRONIZE_RCU)
-		synchronize_rcu();
 	/*
 	 * Very Subtle
 	 * If VMEMMAP_REMAP_NO_TLB_FLUSH is set, TLB flushing is not performed
@@ -615,7 +605,7 @@ void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio)
 {
 	LIST_HEAD(vmemmap_pages);
 
-	__hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, VMEMMAP_SYNCHRONIZE_RCU);
+	__hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, 0);
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
@@ -643,7 +633,7 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 	struct folio *folio;
 	int nr_to_optimize;
 	LIST_HEAD(vmemmap_pages);
-	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH | VMEMMAP_SYNCHRONIZE_RCU;
+	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH;
 
 	nr_to_optimize = 0;
 	list_for_each_entry(folio, folio_list, lru) {
@@ -696,8 +686,6 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 		int ret;
 
 		ret = __hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, flags);
-		/* only need to synchronize_rcu() once for each batch */
-		flags &= ~VMEMMAP_SYNCHRONIZE_RCU;
 
 		/*
 		 * Pages to be freed may have been accumulated.  If we
-- 
2.51.2


