Return-Path: <linux-doc+bounces-95174-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o8xpDP7WS2rXbAEAu9opvQ
	(envelope-from <linux-doc+bounces-95174-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 18:25:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A9B713392
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 18:25:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=PnF+4oRK;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95174-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-95174-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 314283056CAE
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 15:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034793A3E68;
	Mon,  6 Jul 2026 15:44:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC43264EF
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 15:44:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352675; cv=none; b=CuKq7vpjHXOz+mxS5HKEU3B0F9nxftWBabvkutKuNTOfouzHOLCMZojOvKFT80/eNTlVpRgoN8PSSNHw77ywQL1dUnotNi9yHBvaCLrz+ANomJRKsEIXcYZ0MFh04EyHD2cH0AhHwM2hcqg8hNcOFUEF6YVtHjlPknsb+WYP4xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352675; c=relaxed/simple;
	bh=eTYZmf1KGBxj2ykPRYyTXCH9SQapkqsgBOohsxn84/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BmWRSnC/I3QYbGjJR2rYznhkg87Nbo6uqPX/AYiW6F/z7VEeifmliE3Z6zHj5QXlPENNbEQwzc+eE7KOg9hkwObBhOR5OlgE7rieOGUBjL7e5b5O8cURGJ4QMYsCkkKpYyLwspyBrcGwEax676siSB1HrZVy+3tg9iJQ9soSmiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PnF+4oRK; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ri1h3tN8eEN6boK6iP4+hRTCKqh6Pl+RZ36BeSYkv6o=;
	b=PnF+4oRKmdmF3/SBSBOeJnPWO97RfC67fvukR3QVVM3DcIEz7aSH7EJAHj7/Bv1jp4oFO/
	Tg42d9w2uNQl4mUlFK5a4nC4Wu5VfGP5QSky8Bo4vmmyI+xtJsXWp04xF25rd03zpStRfN
	VP/GeXhfjNVW7DgupUyg1Vt9zlrB9HU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-22-wUX65L7YMZyFrm8Ipz-Xig-1; Mon,
 06 Jul 2026 11:44:31 -0400
X-MC-Unique: wUX65L7YMZyFrm8Ipz-Xig-1
X-Mimecast-MFC-AGG-ID: wUX65L7YMZyFrm8Ipz-Xig_1783352668
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A13C91802669;
	Mon,  6 Jul 2026 15:44:28 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.22.58.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4EC1E195604B;
	Mon,  6 Jul 2026 15:44:19 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Nico Pache <npache@redhat.com>,
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
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 2/8] mm/khugepaged: extract young page check into collapse_is_young() helper
Date: Mon,  6 Jul 2026 09:44:49 -0600
Message-ID: <20260706154500.39178-3-npache@redhat.com>
In-Reply-To: <20260706154500.39178-1-npache@redhat.com>
References: <20260706154500.39178-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95174-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:npache@redhat.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:usama.arif@linux.dev,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30A9B713392

The change deduplicates the "is this PTE young enough to count as
referenced" condition that was repeated in both
__collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it into
a single inline helper function.

Also move the comment and use it as the function header. While we are at
it, updated the comment to clarify that a young pte is a recently accessed
one.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b3985b854e77..48b008a3c891 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -675,6 +675,23 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
 	}
 }
 
+/*
+ * collapse_is_young() - Check for enough young pte to justify collapsing
+ *
+ * If collapse was initiated by khugepaged, check that the page has been
+ * recently accessed (young pte) to justify collapsing the page.
+ *
+ * Return: true if the page has been recently accessed (young pte).
+ */
+static inline bool collapse_is_young(struct collapse_control *cc, pte_t pteval,
+	struct folio *folio, struct vm_area_struct *vma, unsigned long addr)
+{
+	return cc->is_khugepaged &&
+	       (pte_young(pteval) || folio_test_young(folio) ||
+		folio_test_referenced(folio) ||
+		mmu_notifier_test_young(vma->vm_mm, addr));
+}
+
 static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		unsigned long start_addr, pte_t *pte, struct collapse_control *cc,
 		unsigned int order, struct list_head *compound_pagelist)
@@ -813,14 +830,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		if (folio_test_large(folio))
 			list_add_tail(&folio->lru, compound_pagelist);
 next:
-		/*
-		 * If collapse was initiated by khugepaged, check that there is
-		 * enough young pte to justify collapsing the page
-		 */
-		if (cc->is_khugepaged &&
-		    (pte_young(pteval) || folio_test_young(folio) ||
-		     folio_test_referenced(folio) ||
-		     mmu_notifier_test_young(vma->vm_mm, addr)))
+		if (collapse_is_young(cc, pteval, folio, vma, addr))
 			referenced++;
 	}
 
@@ -1769,14 +1779,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 			goto out_unmap;
 		}
 
-		/*
-		 * If collapse was initiated by khugepaged, check that there is
-		 * enough young pte to justify collapsing the page
-		 */
-		if (cc->is_khugepaged &&
-		    (pte_young(pteval) || folio_test_young(folio) ||
-		     folio_test_referenced(folio) ||
-		     mmu_notifier_test_young(vma->vm_mm, addr)))
+		if (collapse_is_young(cc, pteval, folio, vma, addr))
 			referenced++;
 	}
 	if (cc->is_khugepaged &&
-- 
2.54.0


