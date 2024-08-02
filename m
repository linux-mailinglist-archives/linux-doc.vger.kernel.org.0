Return-Path: <linux-doc+bounces-22045-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2832C9460EF
	for <lists+linux-doc@lfdr.de>; Fri,  2 Aug 2024 17:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7E351F21F9C
	for <lists+linux-doc@lfdr.de>; Fri,  2 Aug 2024 15:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A1E1537AE;
	Fri,  2 Aug 2024 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z4WhcLR1"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A244815C142
	for <linux-doc@vger.kernel.org>; Fri,  2 Aug 2024 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722614150; cv=none; b=PoYrW3S0neCa6gbrigVVZQzfK/TLR2p8qGnE1+Fe6CcA1NaztDyKkEx5hPbV+7Wq9CTSsBl0wBo5DRoYwYqb/gNSXPExevvVtyedDuUfMInO7kLYJxL2/Mn/r3Ip+Nx6fHUifjfsWYa9z/J/tTioXYgVOvLAmiTyJQTqE32M/kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722614150; c=relaxed/simple;
	bh=yWrrysTviCd1i7aiL4my77/CM6Vr1IENrGtPRMboIWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ar7/yOjXUO9W4+VVc1tS2lUtc2KUn7w2IMbW5ovXqIv5i65c4ncuKRpokR+zvq9vmVxnZYVdKr82m9OPviSXPYQI1SE6DuzVDD9v4opA4lp90bsyzmNTnix0D+B7Ufknev8uQazzGFO7m4HohuR4zLfqBayjJu9mG536YkLHV9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z4WhcLR1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722614147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UBGeX8yYPmEXT+9EKnjIl4n92Yc2dlnMkDo/CXaQu2Y=;
	b=Z4WhcLR1KKZB37a8A+RyG0Mh+njWkllxS57+KVTmrRnRp/gHzXWR0/cghAoO4bOXGqI5mu
	Ma4Fdea/Xo9xSoDUjD5e7mlgK9Y89tUyRDFwCxHYBpUK9vptfhiy6jlDzSXaQQ4eVAwkJw
	XbMEZGMjQiDefqOUvGqwOf0ePujVjuc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-693-3V3FyyZyMi6_6IaMXo6ocw-1; Fri,
 02 Aug 2024 11:55:42 -0400
X-MC-Unique: 3V3FyyZyMi6_6IaMXo6ocw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D08A81955EB7;
	Fri,  2 Aug 2024 15:55:39 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.192.113])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 90DD4300018D;
	Fri,  2 Aug 2024 15:55:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: [PATCH v1 01/11] mm: provide vm_normal_(page|folio)_pmd() with CONFIG_PGTABLE_HAS_HUGE_LEAVES
Date: Fri,  2 Aug 2024 17:55:14 +0200
Message-ID: <20240802155524.517137-2-david@redhat.com>
In-Reply-To: <20240802155524.517137-1-david@redhat.com>
References: <20240802155524.517137-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

We want to make use of vm_normal_page_pmd() in generic page table
walking code where we might walk hugetlb folios that are mapped by PMDs
even without CONFIG_TRANSPARENT_HUGEPAGE.

So let's expose vm_normal_page_pmd() + vm_normal_folio_pmd() with
CONFIG_PGTABLE_HAS_HUGE_LEAVES.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 4c8716cb306c..29772beb3275 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -666,7 +666,7 @@ struct folio *vm_normal_folio(struct vm_area_struct *vma, unsigned long addr,
 	return NULL;
 }
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
 struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 				pmd_t pmd)
 {
-- 
2.45.2


