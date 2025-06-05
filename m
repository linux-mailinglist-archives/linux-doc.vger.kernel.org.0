Return-Path: <linux-doc+bounces-48190-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BFBACEE01
	for <lists+linux-doc@lfdr.de>; Thu,  5 Jun 2025 12:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 197187A78A4
	for <lists+linux-doc@lfdr.de>; Thu,  5 Jun 2025 10:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56284224220;
	Thu,  5 Jun 2025 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eGsgTUNY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647B3218E91
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 10:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120607; cv=none; b=utUGS0zqnBeDWHTIJLq7qqUeRPuLPL2JR9C+PC48VzUmrSU8XluQOEGXbjUe8WO6kL4dtJY5vgst4T2zgNpIj9XuS6AorOIXzO03DO95BrYQvnReblkOP8bVvgm2P4Et6bmSjZfeN4dEF8S0zl0RtX+63wIxR6SbE2Wkvo3FUrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120607; c=relaxed/simple;
	bh=isf38v+uTebHr/0KouGZLHu/zXcyClycP3zhjgiVfZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHLoEVcFRP8H6fs6TiqVfdns+QAzOS6AxoZHYVaWokyljlBRdJyab/geGOkghZDnGTfKZRPtkzSYVqbkrQ1GYaqPv6ym+YNLXeAkvcmwZjRLG+v04rD6Q22vQM825WMt7OApt4uHOga0egF7pgQ8sf9Inlp7mvurIg4WGaPZuHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eGsgTUNY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cd6b511cso5028005e9.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Jun 2025 03:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120604; x=1749725404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpkxTGRvQkor5ThWfPSfZfarMFvM1/zI/E944bIEcHE=;
        b=eGsgTUNY4P4xYxKNfpqtsNEVRXV4e6/ADyhy8XZhuxMDIJSI44yV7RmFgGbZS+LFxW
         m2m22yYJAjP8T4VHP1sjbThJ2XlQRGVkEU8xOHbbCUgnEz8jVipBh1sjTj9rvSoyu5xd
         K95GCe2GXMkvG+esfoxDgwoMsgRIhOM7UU63a3EkgusFQaj72f4VgcfIZOMu3VpGsDMx
         Rb72e8/VK9UFib2Hc9qwj1a9S8CNU4CH+gXDQzH2Fxmwi7Qf3r+t5eg6dH3ZDuj+zz1D
         FDDTmpQnJiFwm0j86SEssabhl+hDhIxczNwpikSeYSLFNjAj9hWHzhlryQUypaI+PXSH
         bjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120604; x=1749725404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpkxTGRvQkor5ThWfPSfZfarMFvM1/zI/E944bIEcHE=;
        b=OIMi8LO+JqfR16gn5bu3F6clBP48h+qYKDyvpDT/dwxPcLESsJY/sadBgFvhFLMChI
         nor87+11gy0/VnW5gi9Cb9pxSxPOgd5NLeX4WwvxYDsmpJKJ8bQ4skZ2/bAxxVVVYzZs
         GZ8vunQQVedeZ6dQtwPFHeJSP6yQaaorAYf5wI1k3Zxej9fhLM3VdcU3fMl7h8CRNtwJ
         dydKPPByPuVazyspxvbpUlCsw4BH13Dgy2ITL4tFm462o1xDlCD/XYswzqoNnJHvZn2x
         cZsMaAxeenY3WiKI+Rc4WdX+H594oiA1782NYxbcQK5WplZhKEWq+Eet6+0FP2TJH0sP
         7umA==
X-Forwarded-Encrypted: i=1; AJvYcCVlI6Q/3bs7q4SUNDsVGPbrtvsJ3O9Nw8oesibRYCwg9N1re2ZJvKxX8IJGANIx0Kg9mOKJ6auwi90=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQvMgdOaslnwhVJnWa7q/Ft79XXcmmBbUk8wxGOo3A6pfJaTyW
	blQhUUW0EGuloz42Ajtzulc2d/6VrZtD8cIkdpOFQ3ZU1SjCqkSJRPscilSPpymMOyM=
X-Gm-Gg: ASbGncuDnGGNKQNOjk6cOnyeTirYVno16lyU+CY/uQLmcFAknH8UwqAbSCSnLD6cOHj
	Y6dL9zY5scbUcllL4ClVf2Ul3cY2JharQPNWViU7necT1NqFHX9weVpYiYij6hWFSPtrVmPZtz9
	s2+GTvLAO6lDSAdovHO/qP7qu/sEu0Pv6M2t09QlgoyvSoHQybNLISLmJfSD+q2S8TkLutsuVXR
	EL6MIJJ8hs7EE/QOnJruuR1mxhybNvdJFkCvcDNiNwXtQ7lXHLPoRq4Sgv3GL9M8SMSQKCOndeH
	rZlz0Qaz3xa7BUwvcYZBQq5r6FCWm37jhUZ6+LR0jNlvet0YOa9A437HLupo
X-Google-Smtp-Source: AGHT+IGzwrshaRz6RzNc0J7tOxVdD9PJSTMnVH2Zjax7vPL/2HgFnaNJ3JtdmLcA1rgDpG5sbM8aDQ==
X-Received: by 2002:a05:600c:8b27:b0:450:d37d:3584 with SMTP id 5b1f17b1804b1-451f0f31013mr62452085e9.13.1749120603619;
        Thu, 05 Jun 2025 03:50:03 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:03 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:48:59 +0100
Subject: [PATCH v3 01/10] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-1-71b0c9f98093@linaro.org>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Add new fields and register that are introduced for the features
FEAT_SPE_EFT (extended filtering) and FEAT_SPE_FDS (data source
filtering).

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8a8cf6874298..2e897d8a4040 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2859,11 +2859,20 @@ Field	0	RND
 EndSysreg
 
 Sysreg	PMSFCR_EL1	3	0	9	9	4
-Res0	63:19
+Res0	63:53
+Field	52	SIMDm
+Field	51	FPm
+Field	50	STm
+Field	49	LDm
+Field	48	Bm
+Res0	47:21
+Field	20	SIMD
+Field	19	FP
 Field	18	ST
 Field	17	LD
 Field	16	B
-Res0	15:4
+Res0	15:5
+Field	4	FDS
 Field	3	FnE
 Field	2	FL
 Field	1	FT

-- 
2.34.1


