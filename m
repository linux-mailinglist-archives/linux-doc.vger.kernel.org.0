Return-Path: <linux-doc+bounces-5925-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C6581E9B3
	for <lists+linux-doc@lfdr.de>; Tue, 26 Dec 2023 21:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDA9BB22183
	for <lists+linux-doc@lfdr.de>; Tue, 26 Dec 2023 20:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73D212E7F;
	Tue, 26 Dec 2023 20:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="gtJVPZ9A"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45052F4EF
	for <linux-doc@vger.kernel.org>; Tue, 26 Dec 2023 20:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78132affa95so226097385a.1
        for <linux-doc@vger.kernel.org>; Tue, 26 Dec 2023 12:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1703620933; x=1704225733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvjQljl7JPoogUlmvytdtR3rbtLgZccu0UZbVKP5s2w=;
        b=gtJVPZ9AG/wS3K12IVMJ3ccVJGcRXRUzF/PQBKMm9Z6oO93Ewh92WLp5PFCzVFAWVO
         O63zwyCJbN7gHzsffiQPcgtuEw0BZDZuJ6NLWp9VsKMbX7iaHpuvKtdq0ImV9XfWlPQ3
         mY+Op1olDfRx9IAalnbT+wCncYsWOiEylppiv1DgQTExCRlL5jbDiYKoQ+SVrcwSW38I
         7NaTxCWldhRtJKn6SmdcCDCiUeCpHyiR5qI8ObEtsZb41LAU6rEBZkOIIVeB15jeWo2h
         CLjPz6cIrczP17MwRZbv7MsL2dbYOmEwHNypmnw9xdNvxc3w4z4KS9Re68uY5grkaKsq
         8olQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703620933; x=1704225733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvjQljl7JPoogUlmvytdtR3rbtLgZccu0UZbVKP5s2w=;
        b=opbCs9xkSh5as3Rx0hfClEWdU6V0KgtAh8nF8bZ+m2TSE/nYekKoCO2Im5n1ZavcbE
         oh/5NwLKXSk+gzW5cHzkXOFlComEcguyjH+83+EQbYnPEMiSGLyWx/a1deFieLsYzKVo
         o9u9fmlvKqHva5r3O0HkwBB92tzvsmF6efX7SPwrZqxTgsG6BCAivSRZ72h9Ou7nalhu
         C3fSQRwoxw6NdpiWz39x3m8u0zqBAbOnbBlP8ogduoLNYfmPRL9MlPFq+bA6bSMae1At
         TZ/rHXUJ7ZbYDx/hyFUwjf49Wy9DByupkDAFhqwElwe66yKZ8hsqIvQXJIpOq+ZCyeBz
         QUAg==
X-Gm-Message-State: AOJu0Yyv52BJdYDyGrj+kjED13IhUipwyy/8H3n9Z6sxqcnsKOR6P2wS
	MuI3e9Xrz7vlChFj0/6kyBHzqyTWA6IpVQ==
X-Google-Smtp-Source: AGHT+IHPjp9+2kjPszPXsBaYDpwmHuWWhdFbzpOIFVRda6CdGBRpo12LyU+NRUYukzs17wjh8sdbkg==
X-Received: by 2002:a05:6214:2684:b0:67f:5c5:c035 with SMTP id gm4-20020a056214268400b0067f05c5c035mr12074627qvb.9.1703620932853;
        Tue, 26 Dec 2023 12:02:12 -0800 (PST)
Received: from soleen.c.googlers.com.com (55.87.194.35.bc.googleusercontent.com. [35.194.87.55])
        by smtp.gmail.com with ESMTPSA id t5-20020a0cf985000000b0067f696f412esm4894539qvn.112.2023.12.26.12.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 12:02:12 -0800 (PST)
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
	rientjes@google.com
Subject: [PATCH v3 05/10] iommu/exynos: use page allocation function provided by iommu-pages.h
Date: Tue, 26 Dec 2023 20:02:00 +0000
Message-ID: <20231226200205.562565-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231226200205.562565-1-pasha.tatashin@soleen.com>
References: <20231226200205.562565-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert iommu/exynos-iommu.c to use the new page allocation functions
provided in iommu-pages.h.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: David Rientjes <rientjes@google.com>
---
 drivers/iommu/exynos-iommu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 2c6e9094f1e9..3eab0ae65a4f 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -22,6 +22,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
+#include "iommu-pages.h"
+
 typedef u32 sysmmu_iova_t;
 typedef u32 sysmmu_pte_t;
 static struct iommu_domain exynos_identity_domain;
@@ -900,11 +902,11 @@ static struct iommu_domain *exynos_iommu_domain_alloc_paging(struct device *dev)
 	if (!domain)
 		return NULL;
 
-	domain->pgtable = (sysmmu_pte_t *)__get_free_pages(GFP_KERNEL, 2);
+	domain->pgtable = iommu_alloc_pages(GFP_KERNEL, 2);
 	if (!domain->pgtable)
 		goto err_pgtable;
 
-	domain->lv2entcnt = (short *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 1);
+	domain->lv2entcnt = iommu_alloc_pages(GFP_KERNEL, 1);
 	if (!domain->lv2entcnt)
 		goto err_counter;
 
@@ -930,9 +932,9 @@ static struct iommu_domain *exynos_iommu_domain_alloc_paging(struct device *dev)
 	return &domain->domain;
 
 err_lv2ent:
-	free_pages((unsigned long)domain->lv2entcnt, 1);
+	iommu_free_pages(domain->lv2entcnt, 1);
 err_counter:
-	free_pages((unsigned long)domain->pgtable, 2);
+	iommu_free_pages(domain->pgtable, 2);
 err_pgtable:
 	kfree(domain);
 	return NULL;
@@ -973,8 +975,8 @@ static void exynos_iommu_domain_free(struct iommu_domain *iommu_domain)
 					phys_to_virt(base));
 		}
 
-	free_pages((unsigned long)domain->pgtable, 2);
-	free_pages((unsigned long)domain->lv2entcnt, 1);
+	iommu_free_pages(domain->pgtable, 2);
+	iommu_free_pages(domain->lv2entcnt, 1);
 	kfree(domain);
 }
 
-- 
2.43.0.472.g3155946c3a-goog


