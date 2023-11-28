Return-Path: <linux-doc+bounces-3408-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7B37FC604
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 21:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D37C1C21E52
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 20:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FB857322;
	Tue, 28 Nov 2023 20:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="eESCoOjN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BEE1BE5
	for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 12:49:47 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5cc636d8a21so49945937b3.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 12:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701204587; x=1701809387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pzjq4U1m3Jk3/Q2EGDhq/3TlS/Ht1C4D8j4bsFObkQ=;
        b=eESCoOjNDxfrFLQ7MyEVad+SgTNdaWIKY9zAC6chNUh+LzlsqIJTp7jW3FM3XiEgaW
         escNzH8gnKUuAH+N2uVP3GlavOp587ZYyyZc0bGbcs+VSbr/A7LsO2DVA61WUOyPK9rf
         8e5E3h8ul2nHgN679Qnhe/KQhFXUJ/g7Jq/fjnVDYU93uEwFt41+ra92QkHgo2UExzkU
         vgVScuS4d9ZzuwO2f0leQULME174Q/f1n0++ExHntJ8dlgeakTntW2nmigsMfZVGKHlf
         EuddNsGT/OfXbUZ2M9BtTRAdjAuRKiYZ15Xsfar09fvB0T1tDHNmqU8HIsSc15muKbNY
         ++wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701204587; x=1701809387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pzjq4U1m3Jk3/Q2EGDhq/3TlS/Ht1C4D8j4bsFObkQ=;
        b=my6aJawvgFrjkgh5fnZtDizERbwKXNQxQh9GuwG2ADjuRmyNfi1XPR/1sUEGUiAPHa
         LAIdcPnhuU1rezPFkac+SRspr3EtlKSseOFEhWomXtApdQ5CtAI1IGu1z1Ow1DNYBzEV
         mLZHEN7ZjN6okMusvttZCjD1V+t293GewW9zdcXLFetc18YFmOoMhQZdbRngzvl/Wwnk
         afPj+1UUc7WWydu4MnlnAlzoDQxXjvr7V4gZe/IzKvDZzm116qM5yLNr76/GA1kmAwnx
         DaPMRKiFc5a8LXphlwysu9IAWIo+Jn16x0w1yzR7dW6VGRK5LoYll38BpdIOwCm/Z5kK
         KhdQ==
X-Gm-Message-State: AOJu0YwqYWg8PxNvAJaG5M3uGcNFOWo/XWB21+YVo8JBxYntpFSTNTO8
	BV3B3KShJ70v8PMQHoIi0mOSXQ==
X-Google-Smtp-Source: AGHT+IE/Byn/8N8Vta6BS83r49MMC2Wgiev3AoCZv/F2NdDhJZ9+kkS7XfcNeLYX07tpu8Z2obgTjA==
X-Received: by 2002:a81:87c2:0:b0:5c0:fc45:a249 with SMTP id x185-20020a8187c2000000b005c0fc45a249mr12000775ywf.40.1701204586847;
        Tue, 28 Nov 2023 12:49:46 -0800 (PST)
Received: from soleen.c.googlers.com.com (55.87.194.35.bc.googleusercontent.com. [35.194.87.55])
        by smtp.gmail.com with ESMTPSA id d11-20020a0cfe8b000000b0067a56b6adfesm1056863qvs.71.2023.11.28.12.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 12:49:46 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
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
	jasowang@redhat.com,
	jernej.skrabec@gmail.com,
	jgg@ziepe.ca,
	jonathanh@nvidia.com,
	joro@8bytes.org,
	kevin.tian@intel.com,
	krzysztof.kozlowski@linaro.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
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
	mst@redhat.com,
	m.szyprowski@samsung.com,
	netdev@vger.kernel.org,
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
	virtualization@lists.linux.dev,
	wens@csie.org,
	will@kernel.org,
	yu-cheng.yu@intel.com
Subject: [PATCH 06/16] iommu/dma: use page allocation function provided by iommu-pages.h
Date: Tue, 28 Nov 2023 20:49:28 +0000
Message-ID: <20231128204938.1453583-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert iommu/dma-iommu.c to use the new page allocation functions
provided in iommu-pages.h.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/iommu/dma-iommu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 85163a83df2f..822adad464c2 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -31,6 +31,7 @@
 #include <linux/vmalloc.h>
 
 #include "dma-iommu.h"
+#include "iommu-pages.h"
 
 struct iommu_dma_msi_page {
 	struct list_head	list;
@@ -874,7 +875,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 static void __iommu_dma_free_pages(struct page **pages, int count)
 {
 	while (count--)
-		__free_page(pages[count]);
+		__iommu_free_page(pages[count]);
 	kvfree(pages);
 }
 
@@ -912,7 +913,8 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
 			order_size = 1U << order;
 			if (order_mask > order_size)
 				alloc_flags |= __GFP_NORETRY;
-			page = alloc_pages_node(nid, alloc_flags, order);
+			page = __iommu_alloc_pages_node(nid, alloc_flags,
+							order);
 			if (!page)
 				continue;
 			if (order)
@@ -1572,7 +1574,7 @@ static void *iommu_dma_alloc_pages(struct device *dev, size_t size,
 
 	page = dma_alloc_contiguous(dev, alloc_size, gfp);
 	if (!page)
-		page = alloc_pages_node(node, gfp, get_order(alloc_size));
+		page = __iommu_alloc_pages_node(node, gfp, get_order(alloc_size));
 	if (!page)
 		return NULL;
 
-- 
2.43.0.rc2.451.g8631bc7472-goog


