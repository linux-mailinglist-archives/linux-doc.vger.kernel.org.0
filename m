Return-Path: <linux-doc+bounces-10416-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C755B85FFA3
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 18:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A569B23576
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 17:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B3D1586C5;
	Thu, 22 Feb 2024 17:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="SUq+1qIF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64319154BE3
	for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708623594; cv=none; b=UPd2qRzN/t5QkZC0VE/i8Rv5bTw0Tkbgc3LboWPAmTe4WRgNNuyjL9lFjso8faB1ZQf29D5NiZaYBoJ80C6JG7eUHwAPNt43LVL2cwrFOWli8EZEXl8Td4PYrbD65XRYr2SrEUGbPv9ERs/ronb21JbukW/GPQTYtOfUaRLcuvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708623594; c=relaxed/simple;
	bh=e5/EqNK9UpM0PQlRBjtqkQj6WaKZ0lxzfKw0E0tVZJ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SVreZGqi+cCtLzvtZ1K1Lv28ZqdiXVIT0famcWDajnZnLxDacFHEdfEJBdvcU1chVzmH8XS3HLbDCi9G8SeQjUXq5dqp/FQC8jFkyDj47k3NMBoYr8LuZG8P2qHUAmCoBTN3BvbTFo5pGE3Gv7QQOZA9i8MVIVFN4DBx0XaeI2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=SUq+1qIF; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-42a31b90edcso55593881cf.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 09:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708623588; x=1709228388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCq+3vWtONMZUCcchixRvndD69tz6ABYgm5wv9T97ic=;
        b=SUq+1qIFGJX2KSx7gOCeTyimDlKQLq0GTGlAM05sJHDPXcw4o8u9HahlDtGj6Pjqem
         xNipopXVFWGha260DWAkgbdcb6DE180aHBVXX3QbWPTLGbxd8dj1E8W/Qu4GE2PljXEl
         Ga78hJWd4yBV7F6fKSAz2NHoVt1PV5ZyP46zwD1Fz//7jbaoi4lYu4oWDyl5hNcbPqka
         NBi/scXvxTYGVPxr89quvOJL9fq8cQt5AjcebgU3uCDhFKPcbF2eijwnkNUTN+hi1/bK
         +nnypxKZUEmwrqPPbL+koZcXlt247YwPDjwHz8kld1LMuzeXGIOpezmjY9G9ovVgoxGP
         mj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708623588; x=1709228388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCq+3vWtONMZUCcchixRvndD69tz6ABYgm5wv9T97ic=;
        b=k4J8laO26lBxxAwaQKfuTavSHB1U7/Gg2BnMYRsXrPdrY5tVa09CDKXkTzRElDAuiL
         rLUqyvF/XKx0qBPg9eN0jKYNyH8Js8w+xXYZIy/CqCHxaiJyOydTVLzZJhdK1b9sbAeX
         fh7ri3ck1+uRigVi11Uu1AcehIWL5ilMSBi2Cm8ucrtBVeAKeILei0rpKItBfyvchzrn
         ElQ1jooDmFg8Fm2VoSVQpEuQkx9jMyl7VDOdaTT0tTTRQkhMNVmCVzsnxocZLuZwEWQy
         1i9IVKw2cssh4NwBO3xi5oxIHYqx+TJMMdpQy4gkvpmh1kX0LbtuVqTXwvkns85fapKi
         Vhew==
X-Forwarded-Encrypted: i=1; AJvYcCXqCY/2p944O2s4MuP7yoN7yFqs3yQ4FwFyHYofLTMJ9d1I9SyOsL9N/saW7pgucrwR5/UZUTxgEg5duWpGgo1EDpTijlXtMOSu
X-Gm-Message-State: AOJu0YwZYBZZ5aI/aGiM8HjlihD7qGqHHohUMEcMEbbVRNahm2Av4h95
	vyMASUfXKouWVHsUzxkJIgbbeHjvtcWFk9XPtOYoNbD9m8/RdAYLhA9xFvtFhcA=
X-Google-Smtp-Source: AGHT+IHYsjufxgrQOIaZKGAlBEgAe+E77c4mX2kxpmgTPbMZQuerhv+xRzMr0weawYHNzNvAJaqSlw==
X-Received: by 2002:ac8:7e82:0:b0:42e:5791:3531 with SMTP id w2-20020ac87e82000000b0042e57913531mr1519017qtj.22.1708623587773;
        Thu, 22 Feb 2024 09:39:47 -0800 (PST)
Received: from soleen.c.googlers.com.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id f17-20020ac86ed1000000b0042e5ab6f24fsm259682qtv.7.2024.02.22.09.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:39:47 -0800 (PST)
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
Subject: [PATCH v5 02/11] iommu/dma: use iommu_put_pages_list() to releae freelist
Date: Thu, 22 Feb 2024 17:39:28 +0000
Message-ID: <20240222173942.1481394-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240222173942.1481394-1-pasha.tatashin@soleen.com>
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Free the IOMMU page tables via iommu_put_pages_list(). The page tables
were allocated via iommu_alloc_* functions in architecture specific
places, but are released in dma-iommu if the freelist is gathered during
map/unmap operations into iommu_iotlb_gather data structure.

Currently, only iommu/intel that does that.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/iommu/dma-iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 50ccc4f1ef81..fa0c4be79f9f 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -32,6 +32,7 @@
 #include <trace/events/swiotlb.h>
 
 #include "dma-iommu.h"
+#include "iommu-pages.h"
 
 struct iommu_dma_msi_page {
 	struct list_head	list;
@@ -156,7 +157,7 @@ static void fq_ring_free_locked(struct iommu_dma_cookie *cookie, struct iova_fq
 		if (fq->entries[idx].counter >= counter)
 			break;
 
-		put_pages_list(&fq->entries[idx].freelist);
+		iommu_put_pages_list(&fq->entries[idx].freelist);
 		free_iova_fast(&cookie->iovad,
 			       fq->entries[idx].iova_pfn,
 			       fq->entries[idx].pages);
@@ -254,7 +255,7 @@ static void iommu_dma_free_fq_single(struct iova_fq *fq)
 	int idx;
 
 	fq_ring_for_each(idx, fq)
-		put_pages_list(&fq->entries[idx].freelist);
+		iommu_put_pages_list(&fq->entries[idx].freelist);
 	vfree(fq);
 }
 
@@ -267,7 +268,7 @@ static void iommu_dma_free_fq_percpu(struct iova_fq __percpu *percpu_fq)
 		struct iova_fq *fq = per_cpu_ptr(percpu_fq, cpu);
 
 		fq_ring_for_each(idx, fq)
-			put_pages_list(&fq->entries[idx].freelist);
+			iommu_put_pages_list(&fq->entries[idx].freelist);
 	}
 
 	free_percpu(percpu_fq);
-- 
2.44.0.rc0.258.g7320e95886-goog


