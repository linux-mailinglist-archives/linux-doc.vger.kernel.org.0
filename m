Return-Path: <linux-doc+bounces-96886-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xA8yDEL4VmoVDwEAu9opvQ
	(envelope-from <linux-doc+bounces-96886-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 05:02:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C406475A2F8
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 05:02:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=OBFkSE0A;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96886-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96886-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4FD1311316C
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 03:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2D72931D3;
	Wed, 15 Jul 2026 03:01:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6539B219E8
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 03:01:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084463; cv=none; b=u08+ioM65fxLxfgLKlO/6E2g6w4+nb2O+TeAj6rKSbhqXjfeEy0N7k2tG7Yt4Y1iDSNZeB4aJjLId898RY+0z01+RM9y95i/k53pguQONvoLRZVh97jiwWgHFKqfi/kp6G+gdGJqgPdBQbwEBVrzzwdrUMOIcIJ9XRPG8yEp5tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084463; c=relaxed/simple;
	bh=Vzr3a51OVpzNKWf/Krbv6y3xEH3/ChJITFawP2Nx2hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RvboQdKp7jN/+jkyF8ABE1KU8q6ePHcmJaHI3KF0EBOY9xsVrj/r5JsQVhsjCKhxONdH5fApjZUPDmIuBzBtOJfwOEocMFUN2TeE9tO1tStTOPkGfQyHTxaml2TTq8PuTYSiaDF2zWx/MkauptTXPNmX08cmcm8lj5zahrQR7nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OBFkSE0A; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784084460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9uqOn1R4+r9lMeuwYoLpR5vlJPP1JnN5hGqw9wV+8Ww=;
	b=OBFkSE0A88U1DxzkLniI6o0LLtOAsX7SQx2Plpm1KV6jjXshn0lg6O6Pdad3m/1eqwhKPg
	x9p57J8w++JAVsnITD1/Wpo3bEpTeGLQBmUTyfzwkKKLbrvPBwRNSC+MPBIzeYMmyZ88JI
	GQDRIk1MctYssR2k9bUxGM1eIVZqWE0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-RLZNDMXpO7-tX4auukvGpQ-1; Tue,
 14 Jul 2026 23:00:52 -0400
X-MC-Unique: RLZNDMXpO7-tX4auukvGpQ-1
X-Mimecast-MFC-AGG-ID: RLZNDMXpO7-tX4auukvGpQ_1784084449
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC3C3180034C;
	Wed, 15 Jul 2026 03:00:49 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.22.76.5])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DEBAB180028B;
	Wed, 15 Jul 2026 03:00:38 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Nico Pache <npache@redhat.com>,
	Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 4/7] mm/khugepaged: fix outdated comments
Date: Tue, 14 Jul 2026 20:59:33 -0600
Message-ID: <20260715025941.1571316-5-npache@redhat.com>
In-Reply-To: <20260715025941.1571316-1-npache@redhat.com>
References: <20260715025941.1571316-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96886-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:npache@redhat.com,m:usama.arif@linux.dev,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[npache@redhat.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[npache@redhat.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C406475A2F8

Fix comment in collapse_scan_pmd() that still described the old
folio_mapcount() > folio_ref_count() check and a "512" false-positive
scenario. The code now uses folio_expected_ref_count() != folio_ref_count()
which doesn't suffer from the same limitation.

Fix comment in collapse_huge_page() that referenced ptep_clear_flush,
when the code actually uses pmdp_collapse_flush.

Fix comment in __collapse_huge_page_swapin() that referenced the old
function name khugepaged_scan_pmd, now collapse_scan_pmd.

Also clean up some simple typos and stale terminology (mmap_sem ->
mmap_lock, PG_lock -> folio lock, page -> folio, grammar).

We also clarify a comment regarding where the max_ptes_none check is
deferred to in mthp_collapse() from the original collapse_scan_pmd check.

Acked-by: Usama Arif <usama.arif@linux.dev>
Assisted-by: Cursor(claude-sonnet-4):4.6
Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index f65bbe2051b3..d785468ffb96 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -620,7 +620,7 @@ void __khugepaged_exit(struct mm_struct *mm)
 		/*
 		 * This is required to serialize against
 		 * collapse_test_exit() (which is guaranteed to run
-		 * under mmap sem read mode). Stop here (after we return all
+		 * under mmap_lock read mode). Stop here (after we return all
 		 * pagetables will be destroyed) until khugepaged has finished
 		 * working on the pagetables under the mmap_lock.
 		 */
@@ -789,7 +789,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 
 		/*
 		 * We can do it before folio_isolate_lru because the
-		 * folio can't be freed from under us. NOTE: PG_lock
+		 * folio can't be freed from under us. NOTE: folio lock
 		 * is needed to serialize against split_huge_page
 		 * when invoked from the VM.
 		 */
@@ -816,7 +816,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		}
 
 		/*
-		 * Isolate the page to avoid collapsing an hugepage
+		 * Isolate the folio to avoid collapsing a hugepage
 		 * currently in use by the VM.
 		 */
 		if (!folio_isolate_lru(folio)) {
@@ -1101,7 +1101,7 @@ static enum scan_result hugepage_vma_revalidate(struct mm_struct *mm, unsigned l
 		return SCAN_VMA_CHECK;
 	/*
 	 * Anon VMA expected, the address may be unmapped then
-	 * remapped to file after khugepaged reaquired the mmap_lock.
+	 * remapped to file after khugepaged reacquired the mmap_lock.
 	 *
 	 * thp_vma_allowable_orders may return true for qualified file
 	 * vmas.
@@ -1159,7 +1159,7 @@ static enum scan_result check_pmd_still_valid(struct mm_struct *mm,
 
 /*
  * Bring missing pages in from swap, to complete THP collapse.
- * Only done if khugepaged_scan_pmd believes it is worthwhile.
+ * Only done if collapse_scan_pmd believes it is worthwhile.
  *
  * For mTHP orders the function bails on the first swap entry, because
  * faulting pages back in during collapse could re-populate PTEs that
@@ -1351,8 +1351,8 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
 	mmap_read_unlock(mm);
 	/*
 	 * Prevent all access to pagetables with the exception of
-	 * gup_fast later handled by the ptep_clear_flush and the VM
-	 * handled by the anon_vma lock + PG_lock.
+	 * gup_fast later handled by the pmdp_collapse_flush and the VM
+	 * handled by the anon_vma lock + folio lock.
 	 *
 	 * UFFDIO_MOVE is prevented to race as well thanks to the
 	 * mmap_lock.
@@ -1643,7 +1643,8 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 
 	/*
 	 * If PMD is the only enabled order, enforce max_ptes_none, otherwise
-	 * scan all pages to populate the bitmap for mTHP collapse.
+	 * scan all pages to populate the bitmap for mTHP collapse. The bitmap
+	 * is then checked again in mthp_collapse() for each attempted order.
 	 */
 	if (enabled_orders != BIT(HPAGE_PMD_ORDER))
 		max_ptes_none = KHUGEPAGED_MAX_PTES_LIMIT;
@@ -1764,12 +1765,9 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		/*
 		 * Check if the page has any GUP (or other external) pins.
 		 *
-		 * Here the check may be racy:
-		 * it may see folio_mapcount() > folio_ref_count().
-		 * But such case is ephemeral we could always retry collapse
-		 * later.  However it may report false positive if the page
-		 * has excessive GUP pins (i.e. 512).  Anyway the same check
-		 * will be done again later the risk seems low.
+		 * Here the check is racy, but such case is ephemeral and
+		 * we could always retry collapse later. Anyway the same
+		 * check will be done again later the risk seems low.
 		 */
 		if (folio_expected_ref_count(folio) != folio_ref_count(folio)) {
 			result = SCAN_PAGE_COUNT;
-- 
2.54.0


