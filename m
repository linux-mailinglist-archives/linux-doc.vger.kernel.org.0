Return-Path: <linux-doc+bounces-39233-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 001B6A428C1
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 18:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15A2D17DA1F
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 16:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193AA2673A2;
	Mon, 24 Feb 2025 16:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bxb+WrKb"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12495263F5D
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416198; cv=none; b=gn34RIRUJzhgzx6ha4I9bCwVIcCH8adV9TpSYdldyCNREq/vxYIiuJD7KkSa/ZMTr4r4YD8ZvHwMaBuq/iEcBfbiXYvUgLAZNyPldQbR5mHstCRA+fvmNvoZtm9uYJJ/nAh+FE9xaSLdCutJElYZ1IT76in31W2XaOaSCOrzTTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416198; c=relaxed/simple;
	bh=+oO0YOFo2loLfbEqLOJlR2w0XdWVO+uOgMtYkv7+0wA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFfBJgF2oGqeo3u/2TLfnDQcjacLJqisHO+2TaE+oLs22ai2bC/IjQCfzhtj7GVEugtY6dBhRmKsaqJE3KDSKUElLInxcBnqoY/kU6M+T4E8Sl12kv3B4KjNuBH/XVLs/RezpMoGWX1HfDkhStG+nZOk5BK8emT5AGhwgnuBv9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bxb+WrKb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740416195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pg2vY9vqWz7IHDYregwabj5LRZT1HxPxFKsGucVLMU4=;
	b=Bxb+WrKbyvXSXgGJjpMwICQUQNQhB00d5hchNzMIJ5WfPw0G3AB6DL/KUXwQ47VlE6GLFN
	n+O2U97CeIkDmFm0ZjRFSFnsrnOWjO2FgIaKIuGfM09QchtwoXnsEgLlXjGEpbXhowPNoS
	yqWe9AdTdOf00hsexXRAqA/koEejg38=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-YY9Mxeh-NeKm1TV9D1FxUw-1; Mon, 24 Feb 2025 11:56:33 -0500
X-MC-Unique: YY9Mxeh-NeKm1TV9D1FxUw-1
X-Mimecast-MFC-AGG-ID: YY9Mxeh-NeKm1TV9D1FxUw_1740416193
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38f455a8e43so1778435f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 08:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416192; x=1741020992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pg2vY9vqWz7IHDYregwabj5LRZT1HxPxFKsGucVLMU4=;
        b=ecYwjF9MkB/AcJt1sWWruHokuUH9q/yFXFjj0voC3ncsivfVG87c2bnUAOmXdkEjfp
         bXh+eeaOZER5qpZeIeEV1w4PicmxfNYAP9F9L6ht4bDgcXmwFi9xOnAZRLG7quXqysXY
         sRjMz5C1hcr8y6QPdMQGdCSqKJuVWhlsr4eHHdnZEz/ysd8hoT5ua2in21rp+Q0jJqcB
         2Q8xI3IdfbJIHtSjeC9bkG56RGrrbVCFfQ4gtQp0Rcjf5LZmu2VO4j8SCOBWgk+sHC22
         4KxjRPCY1gyISkmLU7ZzHnVwPN45FxPuNaXGPzH617KMANvR8PmHkOlWFa7ySU0DBcvk
         VYcg==
X-Gm-Message-State: AOJu0YxaFfkDRn4iapkskKySSERDeYWLXApUrY2OLVxFRDa8jxwjeRTB
	P8ChJhN9B+oAtW6EQdd3oz1wjP4CekhbjxuTTjLY47mF/v+UjGH2R4V5+n4hpZP1wOdR7B2nUQ1
	RXabnUyqEk4j6Pz8XFTgIOPwzXrh3I/RtelJ2HL+3Ln2sn4ZZSzsQpA9fTQ==
X-Gm-Gg: ASbGncv2+igs6KFuPsWrJyv1d2DMaaNBtndIgUMAncnxXbSUb1fluZQkitMfmM/VRrA
	zDEzZGXNQ+toF39HWDieY7Uvc+zjHhywx6c89JfBPN3dxEH0nRYbV2k875ppnlphMM7zYFEDfGF
	g+nb+wUZBQbeOOY/mj3CUp6o6Us4+MNaYlnBvchv1DBn0VeXMb8JT2Xeu5sZg/zF1aLHdXfyUvh
	6Kmdk+vzz9aBdgmKTyeGCMancZ8wNAdiAFFrVQBxyh4OKMnw1qGGzI4oS9PIf6Bms9nfYNSumMg
	oF4tM4PvFssDt6y23xQOC0flyzWZnvlkErl6Aya7QQ==
X-Received: by 2002:a5d:648a:0:b0:38d:db7b:5d90 with SMTP id ffacd0b85a97d-38f6f0951bbmr11757099f8f.41.1740416192489;
        Mon, 24 Feb 2025 08:56:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaIBsZiKHsVYYcLtCIPoeZB3FHIPU3YJhCLPdlvukEQ+/K5hEIgCDRy8AjGPWVYvGgArScYA==
X-Received: by 2002:a5d:648a:0:b0:38d:db7b:5d90 with SMTP id ffacd0b85a97d-38f6f0951bbmr11757061f8f.41.1740416192060;
        Mon, 24 Feb 2025 08:56:32 -0800 (PST)
Received: from localhost (p4ff234b6.dip0.t-ipconnect.de. [79.242.52.182])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f258b4163sm32531566f8f.19.2025.02.24.08.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 08:56:31 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Muchun Song <muchun.song@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v2 13/20] mm: Copy-on-Write (COW) reuse support for PTE-mapped THP
Date: Mon, 24 Feb 2025 17:55:55 +0100
Message-ID: <20250224165603.1434404-14-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224165603.1434404-1-david@redhat.com>
References: <20250224165603.1434404-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, we never end up reusing PTE-mapped THPs after fork. This
wasn't really a problem with PMD-sized THPs, because they would have to
be PTE-mapped first, but it's getting a problem with smaller THP
sizes that are effectively always PTE-mapped.

With our new "mapped exclusively" vs "maybe mapped shared" logic for
large folios, implementing CoW reuse for PTE-mapped THPs is straight
forward: if exclusively mapped, make sure that all references are
from these (our) mappings. Add some helpful comments to explain the
details.

CONFIG_TRANSPARENT_HUGEPAGE selects CONFIG_MM_ID. If we spot an anon
large folio without CONFIG_TRANSPARENT_HUGEPAGE in that code, something
is seriously messed up.

There are plenty of things we can optimize in the future: For example, we
could remember that the folio is fully exclusive so we could speedup
the next fault further. Also, we could try "faulting around", turning
surrounding PTEs that map the same folio writable. But especially the
latter might increase COW latency, so it would need further
investigation.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 76 insertions(+), 8 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index ef74c4f009f84..8dc241961b684 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3706,19 +3706,87 @@ static vm_fault_t wp_page_shared(struct vm_fault *vmf, struct folio *folio)
 	return ret;
 }
 
-static bool wp_can_reuse_anon_folio(struct folio *folio,
-				    struct vm_area_struct *vma)
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static bool __wp_can_reuse_large_anon_folio(struct folio *folio,
+		struct vm_area_struct *vma)
 {
+	bool exclusive = false;
+
+	/* Let's just free up a large folio if only a single page is mapped. */
+	if (folio_large_mapcount(folio) <= 1)
+		return false;
+
 	/*
-	 * We could currently only reuse a subpage of a large folio if no
-	 * other subpages of the large folios are still mapped. However,
-	 * let's just consistently not reuse subpages even if we could
-	 * reuse in that scenario, and give back a large folio a bit
-	 * sooner.
+	 * The assumption for anonymous folios is that each page can only get
+	 * mapped once into each MM. The only exception are KSM folios, which
+	 * are always small.
+	 *
+	 * Each taken mapcount must be paired with exactly one taken reference,
+	 * whereby the refcount must be incremented before the mapcount when
+	 * mapping a page, and the refcount must be decremented after the
+	 * mapcount when unmapping a page.
+	 *
+	 * If all folio references are from mappings, and all mappings are in
+	 * the page tables of this MM, then this folio is exclusive to this MM.
 	 */
-	if (folio_test_large(folio))
+	if (folio_test_large_maybe_mapped_shared(folio))
+		return false;
+
+	VM_WARN_ON_ONCE(folio_test_ksm(folio));
+	VM_WARN_ON_ONCE(folio_mapcount(folio) > folio_nr_pages(folio));
+	VM_WARN_ON_ONCE(folio_entire_mapcount(folio));
+
+	if (unlikely(folio_test_swapcache(folio))) {
+		/*
+		 * Note: freeing up the swapcache will fail if some PTEs are
+		 * still swap entries.
+		 */
+		if (!folio_trylock(folio))
+			return false;
+		folio_free_swap(folio);
+		folio_unlock(folio);
+	}
+
+	if (folio_large_mapcount(folio) != folio_ref_count(folio))
 		return false;
 
+	/* Stabilize the mapcount vs. refcount and recheck. */
+	folio_lock_large_mapcount(folio);
+	VM_WARN_ON_ONCE(folio_large_mapcount(folio) < folio_ref_count(folio));
+
+	if (folio_test_large_maybe_mapped_shared(folio))
+		goto unlock;
+	if (folio_large_mapcount(folio) != folio_ref_count(folio))
+		goto unlock;
+
+	VM_WARN_ON_ONCE(folio_mm_id(folio, 0) != vma->vm_mm->mm_id &&
+			folio_mm_id(folio, 1) != vma->vm_mm->mm_id);
+
+	/*
+	 * Do we need the folio lock? Likely not. If there would have been
+	 * references from page migration/swapout, we would have detected
+	 * an additional folio reference and never ended up here.
+	 */
+	exclusive = true;
+unlock:
+	folio_unlock_large_mapcount(folio);
+	return exclusive;
+}
+#else /* !CONFIG_TRANSPARENT_HUGEPAGE */
+static bool __wp_can_reuse_large_anon_folio(struct folio *folio,
+		struct vm_area_struct *vma)
+{
+	BUILD_BUG();
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+static bool wp_can_reuse_anon_folio(struct folio *folio,
+				    struct vm_area_struct *vma)
+{
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && folio_test_large(folio))
+		return __wp_can_reuse_large_anon_folio(folio, vma);
+	VM_WARN_ON_ONCE(folio_test_large(folio));
+
 	/*
 	 * We have to verify under folio lock: these early checks are
 	 * just an optimization to avoid locking the folio and freeing
-- 
2.48.1


