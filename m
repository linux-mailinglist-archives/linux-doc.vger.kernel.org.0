Return-Path: <linux-doc+bounces-37709-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4385BA2FFA0
	for <lists+linux-doc@lfdr.de>; Tue, 11 Feb 2025 01:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9375E167F54
	for <lists+linux-doc@lfdr.de>; Tue, 11 Feb 2025 00:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A64D1D7999;
	Tue, 11 Feb 2025 00:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hNfL8gVn"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578F41D8A0A
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 00:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234548; cv=none; b=l2PrYRJHT+9LE+2Wpo5u+Y3PMJ1XJ9YHREZeQufp3GMmMtUj9NEUxkMIQaTzAzC4+2Uj0+gzlt4/D6OZqCDqE4BKNAr4SscEMu3zT8EMDCZZIPjYNmB45C8Qsp2xm+LbDGXrPi1i5Nfq2iOgegqAlm/WqAagyb9aDfHnxy/oF7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234548; c=relaxed/simple;
	bh=oqwAWfvbdoScRtu8hPtWbARYhO1gtAfiQzHTgvD5/jY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vd3uRxPk0QAYY/85vmvcjhO7jy9EWfuBBi9Wu0Oti59DvIWkv9CcMa83LhaRiuYY0hBhsbyCALuL3SIrdMNd4jcRNwmxLTBw+FgEF3kEOV/TtINofOVLieb1eyOs43gPJ9zdkcGB+u6uQOVxDnxSBWXr5cWdIi+S+nrQ3PlA2Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hNfL8gVn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739234545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9t+x6jSPF/Kaax2beF3oSfdLLrK+SQWfb/7DMQGVOLs=;
	b=hNfL8gVnf1SnfxA7EG5MebdLhI53qmK489TuvlNJguFh2cg9djq8xn0hOkkhp4i9R3STNd
	bXGrR0l5OBEB4x7VkKe9adJ44cIGoEFJ7Dyd/3QO84mnX6QZFIGjvNuSepoKHdfDoeTZrK
	dxPpNgwAfy/cFaBBFea3fgP6n1ekjj8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-Ku2qpg2aMryfCR2GurdvVQ-1; Mon,
 10 Feb 2025 19:42:23 -0500
X-MC-Unique: Ku2qpg2aMryfCR2GurdvVQ-1
X-Mimecast-MFC-AGG-ID: Ku2qpg2aMryfCR2GurdvVQ
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5936B180087A;
	Tue, 11 Feb 2025 00:42:19 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.129])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 602901800873;
	Tue, 11 Feb 2025 00:42:10 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	vbabka@suse.cz,
	mhocko@suse.com,
	apopple@nvidia.com,
	dave.hansen@linux.intel.com,
	will@kernel.org,
	baohua@kernel.org,
	jack@suse.cz,
	srivatsa@csail.mit.edu,
	haowenchao22@gmail.com,
	hughd@google.com,
	aneesh.kumar@kernel.org,
	yang@os.amperecomputing.com,
	peterx@redhat.com,
	ioworker0@gmail.com,
	wangkefeng.wang@huawei.com,
	ziy@nvidia.com,
	jglisse@google.com,
	surenb@google.com,
	vishal.moola@gmail.com,
	zokeefe@google.com,
	zhengqi.arch@bytedance.com,
	jhubbard@nvidia.com,
	21cnbao@gmail.com,
	willy@infradead.org,
	kirill.shutemov@linux.intel.com,
	david@redhat.com,
	aarcange@redhat.com,
	raquini@redhat.com,
	dev.jain@arm.com,
	sunnanyong@huawei.com,
	usamaarif642@gmail.com,
	audra@redhat.com,
	akpm@linux-foundation.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	tiwai@suse.de,
	baolin.wang@linux.alibaba.com,
	corbet@lwn.net,
	shuah@kernel.org
Subject: [RFC v2 5/5] mm: document mTHP defer setting
Date: Mon, 10 Feb 2025 17:40:54 -0700
Message-ID: <20250211004054.222931-6-npache@redhat.com>
In-Reply-To: <20250211004054.222931-1-npache@redhat.com>
References: <20250211004054.222931-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Now that we have mTHP support in khugepaged, lets add it to the
transhuge admin guide to provide proper guidance.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 Documentation/admin-guide/mm/transhuge.rst | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index b3b18573bbb4..99ba3763c1c4 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -63,7 +63,7 @@ often.
 THP can be enabled system wide or restricted to certain tasks or even
 memory ranges inside task's address space. Unless THP is completely
 disabled, there is ``khugepaged`` daemon that scans memory and
-collapses sequences of basic pages into PMD-sized huge pages.
+collapses sequences of basic pages into huge pages.
 
 The THP behaviour is controlled via :ref:`sysfs <thp_sysfs>`
 interface and using madvise(2) and prctl(2) system calls.
@@ -103,8 +103,8 @@ madvise(MADV_HUGEPAGE) on their critical mmapped regions.
 Applications that would like to benefit from THPs but would still like a
 more memory conservative approach can choose 'defer'. This avoids
 inserting THPs at the page fault handler unless they are MADV_HUGEPAGE.
-Khugepaged will then scan the mappings for potential collapses into PMD
-sized pages. Admins using this the 'defer' setting should consider
+Khugepaged will then scan the mappings for potential collapses into (m)THP
+pages. Admins using this the 'defer' setting should consider
 tweaking khugepaged/max_ptes_none. The current default of 511 may
 aggressively collapse your PTEs into PMDs. Lower this value to conserve
 more memory (ie. max_ptes_none=64).
@@ -119,11 +119,14 @@ Global THP controls
 
 Transparent Hugepage Support for anonymous memory can be entirely disabled
 (mostly for debugging purposes) or only enabled inside MADV_HUGEPAGE
-regions (to avoid the risk of consuming more memory resources) or enabled
-system wide. This can be achieved per-supported-THP-size with one of::
+regions (to avoid the risk of consuming more memory resources), defered to
+khugepaged, or enabled system wide.
+
+This can be achieved per-supported-THP-size with one of::
 
 	echo always >/sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/enabled
 	echo madvise >/sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/enabled
+	echo defer >/sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/enabled
 	echo never >/sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/enabled
 
 where <size> is the hugepage size being addressed, the available sizes
@@ -155,6 +158,13 @@ hugepage sizes have enabled="never". If enabling multiple hugepage
 sizes, the kernel will select the most appropriate enabled size for a
 given allocation.
 
+khugepaged use max_ptes_none scaled to the order of the enabled mTHP size to
+determine collapses. When using mTHPs its recommended to set max_ptes_none low.
+Ideally less than HPAGE_PMD_NR / 2 (255 on 4k page size). This will prevent
+undesired "creep" behavior that leads to continously collapsing to a larger
+mTHP size. max_ptes_shared and max_ptes_swap have no effect when collapsing to a
+mTHP, and mTHP collapse will fail on shared or swapped out pages.
+
 It's also possible to limit defrag efforts in the VM to generate
 anonymous hugepages in case they're not immediately free to madvise
 regions or to never try to defrag memory and simply fallback to regular
@@ -318,7 +328,7 @@ Alternatively, each supported anonymous THP size can be controlled by
 passing ``thp_anon=<size>[KMG],<size>[KMG]:<state>;<size>[KMG]-<size>[KMG]:<state>``,
 where ``<size>`` is the THP size (must be a power of 2 of PAGE_SIZE and
 supported anonymous THP)  and ``<state>`` is one of ``always``, ``madvise``,
-``never`` or ``inherit``.
+``defer``, ``never`` or ``inherit``.
 
 For example, the following will set 16K, 32K, 64K THP to ``always``,
 set 128K, 512K to ``inherit``, set 256K to ``madvise`` and 1M, 2M
-- 
2.48.1


