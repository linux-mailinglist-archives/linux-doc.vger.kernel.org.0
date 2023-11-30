Return-Path: <linux-doc+bounces-3654-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E740C7FFC37
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 21:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 983E9281390
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 20:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FC05EE61;
	Thu, 30 Nov 2023 20:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ldSfYzld"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D091734
	for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 12:15:13 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-67a8a6d104bso3665286d6.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 12:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701375312; x=1701980112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRGmXGqyJzQ9dzCxzy8J7vcwlH74KXpuX5+P/ckDUHQ=;
        b=ldSfYzldNZeeFRfd6WqclZ7cz8U/LZqMc8MlZSEdzA/tkcRw0K87Pz9aOqUllFGjU0
         DfTC661dc5RXXFDmuFvyoOLfHUKInF0b3P2nyJ48WBX97wyuaU5qU6w+CI/7s3z47OTf
         MqpQhsR6X6sBbtIFFII8Eeoh3aLZAddjGC28enTsVM38svDlowQQlRYE3aTRbnGN8zQz
         QT7vARL2lJMJ3g+Qh9CEhy1iUnbNnjfLa+uK7yvQSeInUpI+8HmN399R8BxWbxd5Fyzv
         Cd03EkbWyNT7XToZwcAm3pt1v2V0MEub0btvEzMCjC3US9HZ2bv2OukHerp98uhXNoLu
         7AcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701375312; x=1701980112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRGmXGqyJzQ9dzCxzy8J7vcwlH74KXpuX5+P/ckDUHQ=;
        b=JgfBp61nNrg9bwe+rIC+BwdgLjnf30e4oyoLulqhA00mDRlZUrsVZOkHscrFZoZdc0
         YioR4hu/PSYXZoGyqD2R4gqP51XRjtbsEHgorncYEGZEqb6tjVaQXlVKZGjjag5UOQSa
         iGxTHa5E88Hs2NbPPHuI7V4l97tCYAC3YstFbukFwCW96UcqQ9kgav44u4RAzmvtxu8/
         T2vowdudE6wrCStFXGuXC7WrxtuHdqNl1xQSZ+0CWSrgDfg+HAAJMxQNswruHaWa+l6y
         o5m32zPnu1FT7O8/xl85QKcs1eYCMShhFm/8cnLylGIOLSewRydFrEHFvS9CjSFru5cU
         iemw==
X-Gm-Message-State: AOJu0Yw55IEX/faUT/0PZNyK/A+q6EoxWJnAx7z33fuYRizM1mnvS0b3
	pqd/LnM4Z2ys3ydx4s4cnsAJXA==
X-Google-Smtp-Source: AGHT+IGcwSJfMg7Wvu1IirdGyJp85Q7AXnz+gps4Wsq6RDzrMQCHyomSRCyLZSC9k8WgNjE2V5K0wQ==
X-Received: by 2002:a05:6214:2e11:b0:67a:93fa:b331 with SMTP id mx17-20020a0562142e1100b0067a93fab331mr288846qvb.6.1701375312521;
        Thu, 30 Nov 2023 12:15:12 -0800 (PST)
Received: from soleen.c.googlers.com.com (55.87.194.35.bc.googleusercontent.com. [35.194.87.55])
        by smtp.gmail.com with ESMTPSA id e1-20020a0cb441000000b0067a35608186sm795252qvf.28.2023.11.30.12.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:15:12 -0800 (PST)
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
	yu-cheng.yu@intel.com
Subject: [PATCH v2 05/10] iommu/exynos: use page allocation function provided by iommu-pages.h
Date: Thu, 30 Nov 2023 20:14:59 +0000
Message-ID: <20231130201504.2322355-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231130201504.2322355-1-pasha.tatashin@soleen.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com>
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
2.43.0.rc2.451.g8631bc7472-goog


