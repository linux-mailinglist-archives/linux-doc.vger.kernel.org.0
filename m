Return-Path: <linux-doc+bounces-17937-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA0900365
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2024 14:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69D521C22010
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2024 12:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E31194098;
	Fri,  7 Jun 2024 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g43jr9BM"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B581919308A
	for <linux-doc@vger.kernel.org>; Fri,  7 Jun 2024 12:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717763049; cv=none; b=HGPxzSjmSFnIl/cQnZ2IHlNS+KHrBK56tScOil4b6C+heWgZTA0HP37TuY9ryBQBCEnDWPGLmliT297dN9Hl9dWj92orLyBuN63wEXi6kcvLeUX1uXQlhPO6cimyBA3pTfufRyT7m9tWoHHhEwfn0MuaV9h2dERF9UEhycembr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717763049; c=relaxed/simple;
	bh=/bdAnkh7wfSQqgRm3N2lVEQ4ZUNBEI5xmqLPD3ox538=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZYXX/vUShWo2pAU9gXBPG7E46ODD4PvAZnlZus3VOkP5aQaNc2hHFXK8QCuHbBB9kzoWTANWsHtfqAg4U/1M1UCt0ILFlFTZ6J/ksGzrn1TYXANVJnsa1mzoVA9dMwNR31NJmM8ZWmlcSru8MqepuoN3YmYDiz/Gfh0KnIkriUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g43jr9BM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717763046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mojzlgdpLrUHGcctTDkSw39VJjaquUXWuvUjF8zPifU=;
	b=g43jr9BMc+pEcTAinxaXoT8F6aQy1KAUw6cOaOFTWs+JJV1+j3kJIHR7DIdXKHJPNkCglU
	qXYVeKXgPoWhsInTOlnFkbyxypSwAOYpQEbjmNg2Zl2O5sbKAPRZGFioNPHk+8yVNfdFmi
	RqHkjp4ebP3U97WJ+oytNq23ESRW8i4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-qO0f5XSMMt2qQwX-QnqWqQ-1; Fri, 07 Jun 2024 08:24:01 -0400
X-MC-Unique: qO0f5XSMMt2qQwX-QnqWqQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBC63185A780;
	Fri,  7 Jun 2024 12:24:00 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.192.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABF24492BCD;
	Fri,  7 Jun 2024 12:23:58 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v1 0/6] fs/proc: move page_mapcount() to fs/proc/internal.h
Date: Fri,  7 Jun 2024 14:23:51 +0200
Message-ID: <20240607122357.115423-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

With all other page_mapcount() users in the tree gone, move
page_mapcount() to fs/proc/internal.h, rename it and extend the
documentation to prevent future (ab)use.

... of course, I find some issues while working on that code that I sort
first ;)

We'll now only end up calling page_mapcount()
[now folio_precise_page_mapcount()] on pages mapped via present page table
entries. Except for /proc/kpagecount, that still does questionable things,
but we'll leave that legacy interface as is for now.

Did a quick sanity check. Likely we would want some better selfestest
for /proc/$/pagemap + smaps. I'll see if I can find some time to write
some more.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>

David Hildenbrand (6):
  fs/proc/task_mmu: indicate PM_FILE for PMD-mapped file THP
  fs/proc/task_mmu: don't indicate PM_MMAP_EXCLUSIVE without PM_PRESENT
  fs/proc/task_mmu: properly detect PM_MMAP_EXCLUSIVE per page of
    PMD-mapped THPs
  fs/proc/task_mmu: account non-present entries as "maybe shared, but no
    idea how often"
  fs/proc: move page_mapcount() to fs/proc/internal.h
  Documentation/admin-guide/mm/pagemap.rst: drop "Using pagemap to do
    something useful"

 Documentation/admin-guide/mm/pagemap.rst |  21 -----
 fs/proc/internal.h                       |  33 ++++++++
 fs/proc/page.c                           |  21 +++--
 fs/proc/task_mmu.c                       | 102 +++++++++++++----------
 include/linux/mm.h                       |  27 +-----
 5 files changed, 104 insertions(+), 100 deletions(-)


base-commit: 19b8422c5bd56fb5e7085995801c6543a98bda1f
-- 
2.45.2


