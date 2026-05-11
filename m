Return-Path: <linux-doc+bounces-86905-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HGhOnMnAmrFoQEAu9opvQ
	(envelope-from <linux-doc+bounces-86905-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 21:01:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D04514C86
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 21:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8D7D300A649
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 19:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2D1298991;
	Mon, 11 May 2026 19:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kr3948Ar"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DE32FFFB8
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 19:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778526034; cv=none; b=gkW/CQrQjAebMggWwMUMkhP+YVHbSsLf9z524RK4751pCEDbc6ylbHYGoYsX6sofPFKQjLuN5w7S5VwazNG0TyG6qjCd4vXEyb/9XaLsJVSit+0GltVZ/ynQqQfUaqpiFqvhpahWW3Z7BwmSzQ6uEPoV9ecIEQHXpKpZE0r3bJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778526034; c=relaxed/simple;
	bh=HD0QHGuqKkG9dqYPKxgoXD8/BmlmWU5nssHi+vIQfeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4/NK5WJINhqi2uweKrJE0GOYPTtlOOrVLTJeJ7NVHAaet+G3X7gCktNGIprDcHa0ZKXJl0qV6S7OQ6iRbrIiVthCAeGb7DvN455yPBUI1qbvyYYR8qhzvMyto5apgGJ1skEgSQUWVKZExMY7o0Cy7LoqPk/AFUDW7JZjhkshnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kr3948Ar; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778526032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMiKbJIv8O+0Y9TOH41K0m9qnmm5UDCiFzxBAtFMR/E=;
	b=Kr3948ArvG3uQT4CmH0J7JxxmJfq5X2efk8fcwEXu0uoM18pW5rvngan280eRbC40rioCQ
	UScP5uC+E3RP3zS9+SwzKcezEC8x4ToiMUAyQRY6sgyGoy3FJvei0zpBgJM0Iy1+9iIRQc
	yVudrIRCz5z4FAGeH+mAzZvY52QtZZw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-AlwXo2wZOsCHF5h7E1ID8w-1; Mon,
 11 May 2026 15:00:29 -0400
X-MC-Unique: AlwXo2wZOsCHF5h7E1ID8w-1
X-Mimecast-MFC-AGG-ID: AlwXo2wZOsCHF5h7E1ID8w_1778526028
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 15975180061B;
	Mon, 11 May 2026 19:00:28 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.44.22.3])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5555530001BE;
	Mon, 11 May 2026 19:00:08 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org
Cc: aarcange@redhat.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	byungchul@sk.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jack@suse.cz,
	jackmanb@google.com,
	jannh@google.com,
	jglisse@google.com,
	joshua.hahnjy@gmail.com,
	kas@kernel.org,
	lance.yang@linux.dev,
	liam@infradead.org,
	ljs@kernel.org,
	mathieu.desnoyers@efficios.com,
	matthew.brost@intel.com,
	mhiramat@kernel.org,
	mhocko@suse.com,
	npache@redhat.com,
	peterx@redhat.com,
	pfalcato@suse.de,
	rakie.kim@sk.com,
	raquini@redhat.com,
	rdunlap@infradead.org,
	richard.weiyang@gmail.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shivankg@amd.com,
	sunnanyong@huawei.com,
	surenb@google.com,
	thomas.hellstrom@linux.intel.com,
	tiwai@suse.de,
	usamaarif642@gmail.com,
	vbabka@suse.cz,
	vishal.moola@gmail.com,
	wangkefeng.wang@huawei.com,
	will@kernel.org,
	willy@infradead.org,
	yang@os.amperecomputing.com,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	zokeefe@google.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH mm-unstable v17 07/14] mm/khugepaged: skip collapsing mTHP to smaller orders
Date: Mon, 11 May 2026 12:58:07 -0600
Message-ID: <20260511185817.686831-8-npache@redhat.com>
In-Reply-To: <20260511185817.686831-1-npache@redhat.com>
References: <20260511185817.686831-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rspamd-Queue-Id: E0D04514C86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-86905-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linux-foundation.org,arm.com,nvidia.com,kernel.org,linux.alibaba.com,sk.com,gentwo.org,lwn.net,linux.intel.com,gourry.net,cmpxchg.org,google.com,suse.cz,gmail.com,linux.dev,infradead.org,efficios.com,intel.com,suse.com,suse.de,goodmis.org,amd.com,huawei.com,os.amperecomputing.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[npache@redhat.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_GT_50(0.00)[60];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,alibaba.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.dev:email]
X-Rspamd-Action: no action

khugepaged may try to collapse a mTHP to a smaller mTHP, resulting in
some pages being unmapped. Skip these cases until we have a way to check
if its ok to collapse to a smaller mTHP size (like in the case of a
partially mapped folio). This check is also not done during the scan phase
as the current collapse order is unknown at that time.

This patch is inspired by Dev Jain's work on khugepaged mTHP support [1].

[1] https://lore.kernel.org/lkml/20241216165105.56185-11-dev.jain@arm.com/

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: Usama Arif <usama.arif@linux.dev>
Co-developed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index f49bef78cf51..ba21b134fc86 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -685,6 +685,14 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 				goto out;
 			}
 		}
+		/*
+		 * TODO: In some cases of partially-mapped folios, we'd actually
+		 * want to collapse.
+		 */
+		if (!is_pmd_order(order) && folio_order(folio) >= order) {
+			result = SCAN_PTE_MAPPED_HUGEPAGE;
+			goto out;
+		}
 
 		if (folio_test_large(folio)) {
 			struct folio *f;
-- 
2.54.0


