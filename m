Return-Path: <linux-doc+bounces-5926-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2E981E9B7
	for <lists+linux-doc@lfdr.de>; Tue, 26 Dec 2023 21:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0741228359A
	for <lists+linux-doc@lfdr.de>; Tue, 26 Dec 2023 20:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E1D12E75;
	Tue, 26 Dec 2023 20:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Mh0HGI8/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E846C525B
	for <linux-doc@vger.kernel.org>; Tue, 26 Dec 2023 20:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-67f9f6163a1so23913036d6.1
        for <linux-doc@vger.kernel.org>; Tue, 26 Dec 2023 12:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1703620934; x=1704225734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnHaCiJRfpPGl2Fxvk26Xz7yYvu7rKjQdjdVfjQamuM=;
        b=Mh0HGI8/n3SxesCSYlYs3yXUUaCOBikXNgoC8gCUbQnMySjGnAlu/5MmF/gCk2C9cA
         HwN0DnkTWcMS0qbtv5eEr8wK5FbjiQXia8IWukBHqdsQZEUG6gh1AJVcs42COFvdLrC7
         1V/l/1TEgGItcx52FZeFTyiFfa76K4954F0z2PUkUxZN4u7HueCSJLT3B9MBJtqElK1m
         9sePuC1OWDaRvP7B23JBUq6mksOf6mQk2XQFRqvJUTFnIWlC/BviTXlc/31J1K1p/k+m
         StPnHSwGxqPBzLamr56zNWtnT6/o9QYaRucnQfkfIuWoOZXM8O1fO7zqaZuhCYcBRSKo
         hgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703620934; x=1704225734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnHaCiJRfpPGl2Fxvk26Xz7yYvu7rKjQdjdVfjQamuM=;
        b=mBTSJvypF+Xxc7TtIua0ALTA4Oeq6OElmbvrs4fVilmYYnMJn5SDqdPkPCj1ey7beQ
         iBglSG6pV9fOgWrbhSDm6DHgxMGkvvyCpGu/Nnd7W/r8xFwYD7kLmAo1/QMRiI+Fvh8G
         nHSuULsilsac4pnaVmMddAJAwLixToGElGrzTRoKuPusVsYETEvA9pm/nwHx8fxGVKlU
         8FliPKPHkD2Fz2kGTsWg2OK1kbyPsfae2NTCvUY4Z/CIGKzEGs88Hg2i5nGNQdhJ8dHR
         OnJWORCEfl1ypDz9MI/qJOjWCIsdCCweEwkHGY++UPzKzPrHiJHy/dDvERbHDekw/f1q
         0cyQ==
X-Gm-Message-State: AOJu0Yy8gR7FRMF0q32T4aYPC0KODcOEg7Mm8W1xlvVRyw91pjfaOEJB
	0Bsn9UYW5KaEL0QvPm1o7QuJlPXO3vDKsg==
X-Google-Smtp-Source: AGHT+IEjSL92+xZ/bAtRl2Tju/DugZ1gVQzpypJBCuESKN0IWhI/QyhY0T30YGd/IZCCOkD5WPDVJg==
X-Received: by 2002:a05:6214:2a85:b0:67f:67de:5d32 with SMTP id jr5-20020a0562142a8500b0067f67de5d32mr12181917qvb.41.1703620934647;
        Tue, 26 Dec 2023 12:02:14 -0800 (PST)
Received: from soleen.c.googlers.com.com (55.87.194.35.bc.googleusercontent.com. [35.194.87.55])
        by smtp.gmail.com with ESMTPSA id t5-20020a0cf985000000b0067f696f412esm4894539qvn.112.2023.12.26.12.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 12:02:14 -0800 (PST)
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
Subject: [PATCH v3 07/10] iommu/sun50i: use page allocation function provided by iommu-pages.h
Date: Tue, 26 Dec 2023 20:02:02 +0000
Message-ID: <20231226200205.562565-8-pasha.tatashin@soleen.com>
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

Convert iommu/sun50i-iommu.c to use the new page allocation functions
provided in iommu-pages.h.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: David Rientjes <rientjes@google.com>
---
 drivers/iommu/sun50i-iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 41484a5a399b..172ddb717eb5 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -26,6 +26,8 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
+#include "iommu-pages.h"
+
 #define IOMMU_RESET_REG			0x010
 #define IOMMU_RESET_RELEASE_ALL			0xffffffff
 #define IOMMU_ENABLE_REG		0x020
@@ -679,8 +681,7 @@ sun50i_iommu_domain_alloc_paging(struct device *dev)
 	if (!sun50i_domain)
 		return NULL;
 
-	sun50i_domain->dt = (u32 *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
-						    get_order(DT_SIZE));
+	sun50i_domain->dt = iommu_alloc_pages(GFP_KERNEL, get_order(DT_SIZE));
 	if (!sun50i_domain->dt)
 		goto err_free_domain;
 
@@ -702,7 +703,7 @@ static void sun50i_iommu_domain_free(struct iommu_domain *domain)
 {
 	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 
-	free_pages((unsigned long)sun50i_domain->dt, get_order(DT_SIZE));
+	iommu_free_pages(sun50i_domain->dt, get_order(DT_SIZE));
 	sun50i_domain->dt = NULL;
 
 	kfree(sun50i_domain);
-- 
2.43.0.472.g3155946c3a-goog


