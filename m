Return-Path: <linux-doc+bounces-37631-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3CAA2F8FC
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 20:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A23A93A57E8
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 19:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF0625E463;
	Mon, 10 Feb 2025 19:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="es0bOGsN"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D2D25A346
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 19:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216320; cv=none; b=Ga5Q7zZHl5CSE68lEgyqdQmGnalZHe9fuINJI8vKPqWhKJ27l/+ywNnEWPRxrYNa4kPzUoKplP1HDxUQlaHnWatCAk87sYzPCI56WKNH6yuIaJYDYFSchzbXkAH/kd3JVH8oCwEMBBe4pFBZRn2cDw/i4afAVqn5XwETGoOYb1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216320; c=relaxed/simple;
	bh=76d5pEBVKf4Yijczbwj7KuBibjsq0aAlESoqsTf2wbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmBYGcDjq72B628JGSPdkNkzNLrunaWOesDbD6YJPij2awNNWGUVXTg8Tp2vbn7lvgnhSmUyNQvwHLi5qwZjI+AOV8GcnptbVBaNnMtgHn7lIZSOicKb7eFm7e14JS1o3FphyTIFpg0r1BWl+d0npNXqZ6bZxdQEaTbi8wa2voM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=es0bOGsN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739216318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8sC+CKPivo9nJ2nwAVN+E4SAgEKJPEiCVQrD/mzwcqM=;
	b=es0bOGsN+emNWNv0iKtdB+/awn1NRoHB7YrfChy+rLlYA5DTzw/IxgRvietxiTkm8QeMQJ
	PAAYFe9CnfSBFi2IOFCsoMSOVm2xD9R1eH2egtajc9Z9ybOlUE+b/drXUagETlqCbzaihq
	1k1rfy1IcAwFoqUrQWAAeKi5VLJGMC4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-sVTgYj85NTe0fWw6VCEmHQ-1; Mon, 10 Feb 2025 14:38:36 -0500
X-MC-Unique: sVTgYj85NTe0fWw6VCEmHQ-1
X-Mimecast-MFC-AGG-ID: sVTgYj85NTe0fWw6VCEmHQ
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4392fc6bceaso13133425e9.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 11:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216315; x=1739821115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sC+CKPivo9nJ2nwAVN+E4SAgEKJPEiCVQrD/mzwcqM=;
        b=sqbXOQU7GVslGNEY9ec8oujkOrYdUJFp4KmrIPmKpQ9zgUSOs0iAztc734KVrSVT9r
         NMX9XeCAENLQ7qxcOHFW/s3Gn0jhbWf00aiQxFspvQlLxDEfgnejhDy78XesCAyCR10a
         KhM6OBHcPmJ71L18QqrwKmkZfSEW7U1MYoJkbqzYNL9dJP0tAII67JX13QJyBX5FYkB7
         b/VrE5uRPcDngsbtdcIYSz6F+OGPRYgBnWa0OrP7Bjxz0OrJsrfAQA6wYd1GqqSFdD/O
         lZB64GOcUUr8yCQ2OTdzLCVERIcoOlKBUffxJuCTm1cV893kFTugx/tpoVLWBzQHRTUA
         oPfA==
X-Gm-Message-State: AOJu0YyhmOJdheSs6lhmZ1DqTpnN78clvnQ95zxFW+a/2PqK5PxToz0k
	XKRACw8SGAM64qo0OLn9nJE7+zTi9a46TUuARuaJGPlrj9A4qxUVOmdZ+w0BwBAPgnQje/qdb5r
	8hK65PPfjkw6Z7kEyt3v+ZL47X473noxZKG6BLlgduMRkWq/iXpFnHBCKpg==
X-Gm-Gg: ASbGnct6B/OtunjOrg67OaEJtZ4jsXzvjPi4v+0gzJymPzskHvR7HHUCKWIY6wGKOwo
	Bsso52+QU0XKWRthohhXZ+5lUwVDfR8XrwQ/Lf4+OPcf5kxBTLlgZLcWAKLuTXnVGEX0tX+/nsF
	dOzIQHeXfymSn8iryZqh+SHRfoylLfN8hg6PpvWMbwYTD0IfRSMQDkYzoZGoAy+7yKjNq5mAlez
	sO0KNicGoATyBk74h89sVO/iSxT/Pkua3zZnJ7dvtm3IFw2EXSqrxraRqAiNH972fp3TRqhuUWw
	0Ei5SJANDk7ykKOdVoMPniNticZlm2UbO7L6xfBEuNR6mueodQGAkUzu7fap19tTmA==
X-Received: by 2002:a05:600c:4e91:b0:439:4637:9d9 with SMTP id 5b1f17b1804b1-43946370d97mr43287455e9.12.1739216315602;
        Mon, 10 Feb 2025 11:38:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6B7q2dhfsb9dj8LY+8M1CJU6DFUQTZK7m2VERaPDmly8AB+qIiZRItOcPeyw5uy4LKosd2g==
X-Received: by 2002:a05:600c:4e91:b0:439:4637:9d9 with SMTP id 5b1f17b1804b1-43946370d97mr43287075e9.12.1739216315147;
        Mon, 10 Feb 2025 11:38:35 -0800 (PST)
Received: from localhost (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d94d802sm195260345e9.12.2025.02.10.11.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:38:33 -0800 (PST)
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
Subject: [PATCH v2 08/17] kernel/events/uprobes: handle device-exclusive entries correctly in __replace_page()
Date: Mon, 10 Feb 2025 20:37:50 +0100
Message-ID: <20250210193801.781278-9-david@redhat.com>
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

__replace_page() is not prepared for that, so teach it about these
PFN swap PTEs. Note that device-private entries are so far not
applicable on that path, because GUP would never have returned such
folios (conversion to device-private happens by page migration, not
in-place conversion of the PTE).

There is a race between GUP and us locking the folio to look it up
using page_vma_mapped_walk(), so this is likely a fix (unless something
else could prevent that race, but it doesn't look like). pte_pfn() on
something that is not a present pte could give use garbage, and we'd
wrongly mess up the mapcount because it was already adjusted by calling
folio_remove_rmap_pte() when making the entry device-exclusive.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 kernel/events/uprobes.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 2ca797cbe465f..cd6105b100325 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -173,6 +173,7 @@ static int __replace_page(struct vm_area_struct *vma, unsigned long addr,
 	DEFINE_FOLIO_VMA_WALK(pvmw, old_folio, vma, addr, 0);
 	int err;
 	struct mmu_notifier_range range;
+	pte_t pte;
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, addr,
 				addr + PAGE_SIZE);
@@ -192,6 +193,16 @@ static int __replace_page(struct vm_area_struct *vma, unsigned long addr,
 	if (!page_vma_mapped_walk(&pvmw))
 		goto unlock;
 	VM_BUG_ON_PAGE(addr != pvmw.address, old_page);
+	pte = ptep_get(pvmw.pte);
+
+	/*
+	 * Handle PFN swap PTES, such as device-exclusive ones, that actually
+	 * map pages: simply trigger GUP again to fix it up.
+	 */
+	if (unlikely(!pte_present(pte))) {
+		page_vma_mapped_walk_done(&pvmw);
+		goto unlock;
+	}
 
 	if (new_page) {
 		folio_get(new_folio);
@@ -206,7 +217,7 @@ static int __replace_page(struct vm_area_struct *vma, unsigned long addr,
 		inc_mm_counter(mm, MM_ANONPAGES);
 	}
 
-	flush_cache_page(vma, addr, pte_pfn(ptep_get(pvmw.pte)));
+	flush_cache_page(vma, addr, pte_pfn(pte));
 	ptep_clear_flush(vma, addr, pvmw.pte);
 	if (new_page)
 		set_pte_at(mm, addr, pvmw.pte,
-- 
2.48.1


