Return-Path: <linux-doc+bounces-3412-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 609897FC621
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 21:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D3E2284FB3
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 20:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8B25DF29;
	Tue, 28 Nov 2023 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="LAML5hC+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A04B1FC6
	for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 12:49:51 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-67a31b64a9aso19243366d6.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 12:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701204590; x=1701809390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETdhPmFEsQhEIbzNxRgoLUCae/wd+Ix3V20Xa0Oz0Bc=;
        b=LAML5hC+xVM8EmlWOWNZB2pfvG0vfPx+JWDaBtbTILydta2ncRrj9pkOl22O+jEebR
         6Vqpbry6W/PfSfDW8CpdNN/+QYGY/kt36TYVQQ2UBKQEbBhBm8ucfjwNcsRvHqbiqWI2
         E43tozok1WKhwSrQ4DW7Qx8hMxDukNA1IeFgi6kd3EKGBnlpQEPU+1acZlJsXNS8qjqO
         AiCLSaIrF3UuHHLGSsz2ArUwIvTZoggs1dVtqTJ4b6dFtEQZ4ihN5oT/Trd4TEq9+Dvi
         LHrpSJULwD9IwjRrRLoKY47l7lkd+bBBkUK0skI4lClfUs1AfE7yqQ8kjQ2UyfWVs46b
         xDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701204590; x=1701809390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETdhPmFEsQhEIbzNxRgoLUCae/wd+Ix3V20Xa0Oz0Bc=;
        b=fb79ci41dUKuqkJVAm7N7DnBcGcmGQn5gKt1I3fLlcdKi/rqR1X4QfAgIUdWrs7bXu
         f8FQ/mtn1Ccz/F0psH/JqSYkwXtxd3cX8akaU3wS2x/OSYIKtS/uuxm0DpAANIz7nbMl
         KetaOv77Uc0AIfKEiWiLMTHii/HefVyoCIDIc7kALXX62GjL6t4KtiHbbNWPbxxYrg1I
         kgh9MnXpKm4YD8wbQdlVuIsKqF4qsceevuPbDWSl336cvRd18H6euAuPdQwpRXXxDQ8M
         ahTBYMzlVGpLOsK32cXXkN6tKrfBIjwVR1/qwsbu51QHcTGm+lZHwUaPffra0KJk933T
         3Otw==
X-Gm-Message-State: AOJu0YxMTpNqNFDEkqyXjWWz/BzF7Uoj0YnRWNzihYaTM3KOMPBzPoRK
	zzotvxvJyrz0wglCDINTJeUzTQ==
X-Google-Smtp-Source: AGHT+IF20t0VWjgac0dRIZCA1JkcXVtwNJBGTcAuMHzFzEm0RhGR7NzU38i0clAtj6I8+ULrxoVFmw==
X-Received: by 2002:a0c:ebc3:0:b0:67a:2129:c05a with SMTP id k3-20020a0cebc3000000b0067a2129c05amr14629363qvq.53.1701204590697;
        Tue, 28 Nov 2023 12:49:50 -0800 (PST)
Received: from soleen.c.googlers.com.com (55.87.194.35.bc.googleusercontent.com. [35.194.87.55])
        by smtp.gmail.com with ESMTPSA id d11-20020a0cfe8b000000b0067a56b6adfesm1056863qvs.71.2023.11.28.12.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 12:49:50 -0800 (PST)
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
Subject: [PATCH 10/16] iommu/rockchip: use page allocation function provided by iommu-pages.h
Date: Tue, 28 Nov 2023 20:49:32 +0000
Message-ID: <20231128204938.1453583-11-pasha.tatashin@soleen.com>
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

Convert iommu/rockchip-iommu.c to use the new page allocation functions
provided in iommu-pages.h.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/iommu/iommufd/iova_bitmap.c |  2 ++
 drivers/iommu/rockchip-iommu.c      | 14 ++++++++------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/iommufd/iova_bitmap.c b/drivers/iommu/iommufd/iova_bitmap.c
index 6b8575b93f17..4d5d1be807fe 100644
--- a/drivers/iommu/iommufd/iova_bitmap.c
+++ b/drivers/iommu/iommufd/iova_bitmap.c
@@ -8,6 +8,8 @@
 #include <linux/slab.h>
 #include <linux/highmem.h>
 
+#include "../iommu-pages.h"
+
 #define BITS_PER_PAGE (PAGE_SIZE * BITS_PER_BYTE)
 
 /*
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 2685861c0a12..e04f22d481d0 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -26,6 +26,8 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
+#include "iommu-pages.h"
+
 /** MMU register offsets */
 #define RK_MMU_DTE_ADDR		0x00	/* Directory table address */
 #define RK_MMU_STATUS		0x04
@@ -727,14 +729,14 @@ static u32 *rk_dte_get_page_table(struct rk_iommu_domain *rk_domain,
 	if (rk_dte_is_pt_valid(dte))
 		goto done;
 
-	page_table = (u32 *)get_zeroed_page(GFP_ATOMIC | rk_ops->gfp_flags);
+	page_table = iommu_alloc_page(GFP_ATOMIC | rk_ops->gfp_flags);
 	if (!page_table)
 		return ERR_PTR(-ENOMEM);
 
 	pt_dma = dma_map_single(dma_dev, page_table, SPAGE_SIZE, DMA_TO_DEVICE);
 	if (dma_mapping_error(dma_dev, pt_dma)) {
 		dev_err(dma_dev, "DMA mapping error while allocating page table\n");
-		free_page((unsigned long)page_table);
+		iommu_free_page(page_table);
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -1061,7 +1063,7 @@ static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
 	 * Each level1 (dt) and level2 (pt) table has 1024 4-byte entries.
 	 * Allocate one 4 KiB page for each table.
 	 */
-	rk_domain->dt = (u32 *)get_zeroed_page(GFP_KERNEL | rk_ops->gfp_flags);
+	rk_domain->dt = iommu_alloc_page(GFP_KERNEL | rk_ops->gfp_flags);
 	if (!rk_domain->dt)
 		goto err_free_domain;
 
@@ -1083,7 +1085,7 @@ static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
 	return &rk_domain->domain;
 
 err_free_dt:
-	free_page((unsigned long)rk_domain->dt);
+	iommu_free_page(rk_domain->dt);
 err_free_domain:
 	kfree(rk_domain);
 
@@ -1104,13 +1106,13 @@ static void rk_iommu_domain_free(struct iommu_domain *domain)
 			u32 *page_table = phys_to_virt(pt_phys);
 			dma_unmap_single(dma_dev, pt_phys,
 					 SPAGE_SIZE, DMA_TO_DEVICE);
-			free_page((unsigned long)page_table);
+			iommu_free_page(page_table);
 		}
 	}
 
 	dma_unmap_single(dma_dev, rk_domain->dt_dma,
 			 SPAGE_SIZE, DMA_TO_DEVICE);
-	free_page((unsigned long)rk_domain->dt);
+	iommu_free_page(rk_domain->dt);
 
 	kfree(rk_domain);
 }
-- 
2.43.0.rc2.451.g8631bc7472-goog


