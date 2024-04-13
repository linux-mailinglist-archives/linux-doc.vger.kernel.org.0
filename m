Return-Path: <linux-doc+bounces-14066-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 626368A3933
	for <lists+linux-doc@lfdr.de>; Sat, 13 Apr 2024 02:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 513151C20EB7
	for <lists+linux-doc@lfdr.de>; Sat, 13 Apr 2024 00:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C305B1C2A5;
	Sat, 13 Apr 2024 00:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="p+cg0PWl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0F8C125
	for <linux-doc@vger.kernel.org>; Sat, 13 Apr 2024 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712967936; cv=none; b=lq9Hsb72bf35+so7S/eqXbw0twNfJMfP4Ui1p/wm2EwqbI3hRf57zWKkSJl++dncuzcTo0aPYkvGZjyuWBjQvBsT0x/Ff9WEAkj58iMjwAKr6wQLff2xf3JZ7YGSLkauueAn7GScuNk1+ZklkGCruaeCLpbsoLIH7s04OA22wp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712967936; c=relaxed/simple;
	bh=k1Vm2QealHqCw8wGA+Hq/ZreqLosHug2bCq5aXJjOVE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tq1K7UHnWkTyHtRb6SM94OcqSZsE05P36ONd1nKJVqqQpXEy9ZOIqoZlZOVfxIDAEL+pa2+RPc5G5Ov3lKbjnFo6NuIypKKQz1ks9CF/xQwTraYU0zd+h1yjWh5UtKTKQJT1tbyzVU1V8E+2xlvdZAEWdPd4sRq24Gxn3MCUcUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=p+cg0PWl; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-78d5b1a34fdso94914885a.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 17:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712967930; x=1713572730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdzMORim0dHB7uEOtMEVFDL6Z2C9ADZmlFONNgiqMWY=;
        b=p+cg0PWlklIVTMzyWuFgJlH/Or2yOuZISrofX8TWF+h8KHCfd8OAY5rvjZqcNSvQGC
         XchDIVCkFBo95+KLmfWfWu+mmulMl/Pg6lcz2LnClki3AJrk4hRdO7KLqD5V1sRmz6mE
         S0+yxwB5F9ef1dqzJlGuOgX7lrqKvc853m/oAON07Df64nRTaXFpzbPZurFtOjPCqU9k
         TRZ9SDrQhLJcMKAy0lpDSILjUMPO4xqWBGC1rCBHDTXrKw3tWgwgsYsjpVsL4sRQKQU4
         QIxz8up73X3WiYwJWGMtUN0VK2bSMGYh0vvVhi0bR2S6kvNO+JXx8vrrGFX4j8G69cYF
         fFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712967930; x=1713572730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdzMORim0dHB7uEOtMEVFDL6Z2C9ADZmlFONNgiqMWY=;
        b=KPs5FJfu9fWNdb3YMdKBwzrXgh2HHmoI3QiCm3bnXCGai9nkzvYHQDeg4qHZewQUh1
         80aAq/azcCvCeLBupwSePyfNhOX+wUFz1McTEnqew6Pl4GR9L9GHPb9mFHD7qzPZ/+BT
         GnwgvuOn0obMMs4wMAApkoKjknhl90tGP2vsLL/GposVwfI5Q81wSn2Nezc9likvXeuR
         rwTrMougR1245XJU3oPoRwflCMYBfvqw14A7a2IsWekoiGk78quRyfWMJJG+4dHgQzNX
         J4fH5psmYevP82r6PUawsax4TPaO4Um75bWLwd5HZq/l5tB0LPrJsNPcgryyiAuBbJdH
         0RQg==
X-Forwarded-Encrypted: i=1; AJvYcCUhzoc0KTsI9HD2i9x9iR6Y18veEGaqlVnwzkHpCyUNkai+D08Hv7r/1ayaCbljso8FnOztmsZa3AfUAhFjmpPNPUF45yKRijID
X-Gm-Message-State: AOJu0YyZz1+30BtGt45+EZ4ixwOE5mrc+8E/ZcfypF3TQHkLcQlXebQm
	xhxCo3e6Db2GIJI55aw7dPPWtXwW4TcA0l09thNgOKmvEmC2EIoUkhk9aF4O2HU=
X-Google-Smtp-Source: AGHT+IH5Os3iRz2ANP4F2z0zw+BDU7+6X7QWkqdDRIDhPQUP0t1/fto88yhC6Si55lvEExsYEHVs9w==
X-Received: by 2002:a05:620a:28d6:b0:78e:d7dc:44ff with SMTP id l22-20020a05620a28d600b0078ed7dc44ffmr198409qkp.75.1712967930559;
        Fri, 12 Apr 2024 17:25:30 -0700 (PDT)
Received: from soleen.c.googlers.com.com (128.174.85.34.bc.googleusercontent.com. [34.85.174.128])
        by smtp.gmail.com with ESMTPSA id wl25-20020a05620a57d900b0078d5fece9a6sm3053490qkn.101.2024.04.12.17.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 17:25:30 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: akpm@linux-foundation.org,
	alim.akhtar@samsung.com,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	baolu.lu@linux.intel.com,
	bhelgaas@google.com,
	cgroups@vger.kernel.org,
	corbet@lwn.net,
	david@redhat.com,
	dwmw2@infradead.org,
	hannes@cmpxchg.org,
	heiko@sntech.de,
	iommu@lists.linux.dev,
	jernej.skrabec@gmail.com,
	jonathanh@nvidia.com,
	joro@8bytes.org,
	krzysztof.kozlowski@linaro.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	lizefan.x@bytedance.com,
	marcan@marcan.st,
	mhiramat@kernel.org,
	m.szyprowski@samsung.com,
	pasha.tatashin@soleen.com,
	paulmck@kernel.org,
	rdunlap@infradead.org,
	robin.murphy@arm.com,
	samuel@sholland.org,
	suravee.suthikulpanit@amd.com,
	sven@svenpeter.dev,
	thierry.reding@gmail.com,
	tj@kernel.org,
	tomas.mudrunka@gmail.com,
	vdumpa@nvidia.com,
	wens@csie.org,
	will@kernel.org,
	yu-cheng.yu@intel.com,
	rientjes@google.com,
	bagasdotme@gmail.com,
	mkoutny@suse.com
Subject: [PATCH v6 05/11] iommu/io-pgtable-dart: use page allocation function provided by iommu-pages.h
Date: Sat, 13 Apr 2024 00:25:16 +0000
Message-ID: <20240413002522.1101315-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
In-Reply-To: <20240413002522.1101315-1-pasha.tatashin@soleen.com>
References: <20240413002522.1101315-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert iommu/io-pgtable-dart.c to use the new page allocation functions
provided in iommu-pages.h., and remove unnecessary struct io_pgtable_cfg
argument from __dart_alloc_pages().

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Janne Grunau <j@jannau.net>
Acked-by: David Rientjes <rientjes@google.com>
Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/iommu/io-pgtable-dart.c | 37 +++++++++++++--------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
index 74b1ef2b96be..ad28031e1e93 100644
--- a/drivers/iommu/io-pgtable-dart.c
+++ b/drivers/iommu/io-pgtable-dart.c
@@ -23,6 +23,7 @@
 #include <linux/types.h>
 
 #include <asm/barrier.h>
+#include "iommu-pages.h"
 
 #define DART1_MAX_ADDR_BITS	36
 
@@ -106,18 +107,12 @@ static phys_addr_t iopte_to_paddr(dart_iopte pte,
 	return paddr;
 }
 
-static void *__dart_alloc_pages(size_t size, gfp_t gfp,
-				    struct io_pgtable_cfg *cfg)
+static void *__dart_alloc_pages(size_t size, gfp_t gfp)
 {
 	int order = get_order(size);
-	struct page *p;
 
 	VM_BUG_ON((gfp & __GFP_HIGHMEM));
-	p = alloc_pages(gfp | __GFP_ZERO, order);
-	if (!p)
-		return NULL;
-
-	return page_address(p);
+	return iommu_alloc_pages(gfp, order);
 }
 
 static int dart_init_pte(struct dart_io_pgtable *data,
@@ -262,13 +257,13 @@ static int dart_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
 
 	/* no L2 table present */
 	if (!pte) {
-		cptep = __dart_alloc_pages(tblsz, gfp, cfg);
+		cptep = __dart_alloc_pages(tblsz, gfp);
 		if (!cptep)
 			return -ENOMEM;
 
 		pte = dart_install_table(cptep, ptep, 0, data);
 		if (pte)
-			free_pages((unsigned long)cptep, get_order(tblsz));
+			iommu_free_pages(cptep, get_order(tblsz));
 
 		/* L2 table is present (now) */
 		pte = READ_ONCE(*ptep);
@@ -419,8 +414,7 @@ apple_dart_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	cfg->apple_dart_cfg.n_ttbrs = 1 << data->tbl_bits;
 
 	for (i = 0; i < cfg->apple_dart_cfg.n_ttbrs; ++i) {
-		data->pgd[i] = __dart_alloc_pages(DART_GRANULE(data), GFP_KERNEL,
-					   cfg);
+		data->pgd[i] = __dart_alloc_pages(DART_GRANULE(data), GFP_KERNEL);
 		if (!data->pgd[i])
 			goto out_free_data;
 		cfg->apple_dart_cfg.ttbr[i] = virt_to_phys(data->pgd[i]);
@@ -429,9 +423,10 @@ apple_dart_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	return &data->iop;
 
 out_free_data:
-	while (--i >= 0)
-		free_pages((unsigned long)data->pgd[i],
-			   get_order(DART_GRANULE(data)));
+	while (--i >= 0) {
+		iommu_free_pages(data->pgd[i],
+				 get_order(DART_GRANULE(data)));
+	}
 	kfree(data);
 	return NULL;
 }
@@ -439,6 +434,7 @@ apple_dart_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 static void apple_dart_free_pgtable(struct io_pgtable *iop)
 {
 	struct dart_io_pgtable *data = io_pgtable_to_data(iop);
+	int order = get_order(DART_GRANULE(data));
 	dart_iopte *ptep, *end;
 	int i;
 
@@ -449,15 +445,10 @@ static void apple_dart_free_pgtable(struct io_pgtable *iop)
 		while (ptep != end) {
 			dart_iopte pte = *ptep++;
 
-			if (pte) {
-				unsigned long page =
-					(unsigned long)iopte_deref(pte, data);
-
-				free_pages(page, get_order(DART_GRANULE(data)));
-			}
+			if (pte)
+				iommu_free_pages(iopte_deref(pte, data), order);
 		}
-		free_pages((unsigned long)data->pgd[i],
-			   get_order(DART_GRANULE(data)));
+		iommu_free_pages(data->pgd[i], order);
 	}
 
 	kfree(data);
-- 
2.44.0.683.g7961c838ac-goog


