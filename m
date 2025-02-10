Return-Path: <linux-doc+bounces-37637-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF23A2F908
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 20:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2AEA3A5F0A
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 19:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E1F2505C3;
	Mon, 10 Feb 2025 19:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g67cTE5k"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681E82505A9
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 19:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216343; cv=none; b=ktoEB9l1wNWLz4ArXlCX/IDPhVP0L5Xhhh0dUkAK3V2waXR5T3fUHCkXqQdN03OqgOTwTPnPgod4IRBJvsx/djAhhP6VpsA9WRr6x4R8KP204dlydqEpPzZLSmJ+gMPKUpZg+yYKq+RnoMvzxXbwb0C0EeufsWxS96lSaoRxC/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216343; c=relaxed/simple;
	bh=xdb/Bd8nabay5U0SQXbchR0hBzNIzuX4jtY3vE4Olv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A4jluThhJNpnNOzWMbWtbJDb/apcCxFFSit1RUd5pWoubex7eaV9S2V0kjMDFqXHfOo9lLRHhvtsawvSV/j4xe0hqU9AJOGz6qMYmCAzGLVIHBEnnuKCG01RQht5ABzde+fim/V4DgXkHTEb9Fscm7dvaQCsAc5v4RVAt4w6TiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g67cTE5k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739216340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oE9Ja/aC61CHup4qeT96Odiagg40Q7TPEFXRUvHwXRo=;
	b=g67cTE5kem53Qfb56KG6/b812KoghfArDZpyBshBrSShtsRrNbMvTvQxkz48P05eyEUwK5
	YzsgqYdpC115+QJKyo2DNHaBkA++ut+VMfmYHEBnZcpAwmvTP4cQqanPLSGAI73KZTf+EY
	MECnnyuNWFQLlBbZidKnT+hpbQNqx3I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-6WgKZUj6PA6Wke2UL_3Fog-1; Mon, 10 Feb 2025 14:38:59 -0500
X-MC-Unique: 6WgKZUj6PA6Wke2UL_3Fog-1
X-Mimecast-MFC-AGG-ID: 6WgKZUj6PA6Wke2UL_3Fog
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38dc709f938so1785949f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 11:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216338; x=1739821138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oE9Ja/aC61CHup4qeT96Odiagg40Q7TPEFXRUvHwXRo=;
        b=AWrLooKn0kQE/Y/8XrVU7O5fwfiIJf5BYwMEWaw5flJM42Od8LI1IxgnvnqVdg7Wvl
         KO3f9LHtgquKmi4ATEmkly11YIZAKb3R/X4NDO1HlujmukUWYDWE5CzrgYhFBd53n5QJ
         35fMe9iR2IxEZtMfD5TA67m39ASSsWdsD4Ada+waYsNl6Ki9WnCTSlZSsoT6zJTntMn3
         aUEeVyjcnwmTGOmV9vWidR0ITsiPLb02iIcv5kGOiWCaZaoIqFwxI9Vq1HrecTIf31cw
         13rlfiOqTpFaS3+ZTWNJD4yZID9ET0Rjlrce4PmQerrsdHm+6is6F2VhqMhi1SAFGpRG
         /nRQ==
X-Gm-Message-State: AOJu0YxBMYxXuBUk1ONjWLMh08LGGVooA1nZBGOF1lihoqWHqDw3s2Tx
	NLZOXj+iUAN5K+nffqVFiNnKwidqQdwbl6yNKs2tlIYtvUwq/dsHhT1sDrvRbVKEzYM4iBBl+yI
	MPlXm7OL7f4jV1ZEke3GNPeNDBgZlLyKsCVoK1fv6euWNh4jo2nyza8YdFQ==
X-Gm-Gg: ASbGncuaOSaevsJ7RDuzAY3D+fQQuPd/Bodj9nmdVOB0u9ZyqSmaBLjKwfBV/ISijpw
	j6PwcOZ2D7LEfZUD6hul6GZLPUsUsKdmLxFvHOAU5nNRMiDa7sDnU/hv8OW+H+Zx1R3QpqjZ52l
	O1d+8XlP3rKy9jbb8wRKHC0Ju23CnBObXZxhqu3YVIoYAzsr4YKPmNONp36qYAvSFS/boCZXRth
	JMGn/deFS2QwYHwyNdBD40x/YZ0HtRy1ywYEIS7UdyLZqDjZXmbQHGau70Juc+4a/LplFds1WDx
	QKVwW914jVpCqBiKdbWRzCI/lnWnL/tVnE80SsnLqy64kE6ZN6YCb6cp0IKp0DzzPQ==
X-Received: by 2002:a05:6000:1887:b0:38b:f4e6:21aa with SMTP id ffacd0b85a97d-38de439b7e5mr512532f8f.5.1739216337880;
        Mon, 10 Feb 2025 11:38:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/uzgNmJSm7r4vj5m1RC+0Hk4d4M8qsuHzJI2p/6gaMOev6b/snbfbww+U3ctbsFbws8/HTA==
X-Received: by 2002:a05:6000:1887:b0:38b:f4e6:21aa with SMTP id ffacd0b85a97d-38de439b7e5mr512516f8f.5.1739216337518;
        Mon, 10 Feb 2025 11:38:57 -0800 (PST)
Received: from localhost (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dcc9bd251sm9816921f8f.9.2025.02.10.11.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:38:56 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	damon@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 14/17] mm/damon: handle device-exclusive entries correctly in damon_folio_young_one()
Date: Mon, 10 Feb 2025 20:37:56 +0100
Message-ID: <20250210193801.781278-15-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
we can return with a device-exclusive entry from page_vma_mapped_walk().

damon_folio_young_one() is not prepared for that, so teach it about these
PFN swap PTEs. Note that device-private entries are so far not applicable
on that path, as we expect ZONE_DEVICE pages so far only in migration code
when it comes to the RMAP.

The impact is rather small: we'd be calling pte_young() on a
non-present PTE, which is not really defined to have semantic.

Note that we could currently only run into this case with
device-exclusive entries on THPs. We still adjust the mapcount on
conversion to device-exclusive; this makes the rmap walk
abort early for small folios, because we'll always have
!folio_mapped() with a single device-exclusive entry. We'll adjust the
mapcount logic once all page_vma_mapped_walk() users can properly
handle device-exclusive entries.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/damon/paddr.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 0f9ae14f884dd..10d75f9ceeafb 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -92,12 +92,20 @@ static bool damon_folio_young_one(struct folio *folio,
 {
 	bool *accessed = arg;
 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, addr, 0);
+	pte_t pte;
 
 	*accessed = false;
 	while (page_vma_mapped_walk(&pvmw)) {
 		addr = pvmw.address;
 		if (pvmw.pte) {
-			*accessed = pte_young(ptep_get(pvmw.pte)) ||
+			pte = ptep_get(pvmw.pte);
+
+			/*
+			 * PFN swap PTEs, such as device-exclusive ones, that
+			 * actually map pages are "old" from a CPU perspective.
+			 * The MMU notifier takes care of any device aspects.
+			 */
+			*accessed = (pte_present(pte) && pte_young(pte)) ||
 				!folio_test_idle(folio) ||
 				mmu_notifier_test_young(vma->vm_mm, addr);
 		} else {
-- 
2.48.1


