Return-Path: <linux-doc+bounces-64972-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C413C1C0BA
	for <lists+linux-doc@lfdr.de>; Wed, 29 Oct 2025 17:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6757D5E1789
	for <lists+linux-doc@lfdr.de>; Wed, 29 Oct 2025 15:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7152C345CBE;
	Wed, 29 Oct 2025 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RSPCrRHB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4D633F36D
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752805; cv=none; b=moUu6f0M1pEemil2IIOIxP6L2UhIAZPQHuqC2Nyg1yYuEMBWZhdNWSuQ2hsKZFZHfOokth22/I6rLe/H1NxALXXyVenW+FVTCC1CD4B4iNVAVSQXJKpFDYw+ZctcpdWe5z9gTgIP+WSdCW6na5QKu/V2ZUDd2QuBPo2KuGBiKTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752805; c=relaxed/simple;
	bh=SadB828C5dPf0BWbY6PbKBHvcUIXDrqbiyTpXZ3dCN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CraItW00oZR/7GYpwOeRF5H7oGxlVodDu2P9/cCT6Eh94ZI9mecjLQ91TNevfga8AxkL6qk3cQzb41Hs8JnYjkVM9+ecyesFERfJ13gU03uhs7zeLizaGbqYQEuRcNYT4eHGRXQQo6fnm4Ok88XDM2a0eFlrVF5L6ko8jeda2tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RSPCrRHB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-475dc6029b6so48743985e9.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752801; x=1762357601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ib/m0uUPLSkVp1ZlpwY6PmfsEKy79muQ35cF6NAqDLw=;
        b=RSPCrRHB5/U5OvDCqgLLusHzhCIX7f79XBMi0I7sn+3K7R33FdGHFy3SblVdMzxenC
         E+/EmwIrSF9MLIHJa8ydWdlzZpw5TlPzaDbfHNiD3LC4wE8TCyHBEBVpMIOIQbqPRoMs
         QXvBYbpwuf3s/n0ORLyMsfn4TorSTzOpVi67nP7rtxLGfOh/ruF6V6Lbmr++mvW41YRd
         Vkd4FRGJXYuQ1wrTnW/P0sHr2bVD+J/WjjhbGGpGN3kf6S1+Wa9yozE9XcIZY0VRifgP
         5pXCnb0/OT4FjcmOJ9NaATgnEdOn7dB/N6uHxrbpBHoaaR8gf988b4vd06fhnVRsLyMb
         hEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752801; x=1762357601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ib/m0uUPLSkVp1ZlpwY6PmfsEKy79muQ35cF6NAqDLw=;
        b=sIbVTeC3ch06MYlDk5y1pvfA4vD6t5T8DvtSWesxtShuXzxnR9JoeN2hzN3pRjwVoS
         KyrmmqjWfzPSH828QmN0j3HTFIle+4Mrg5IOneo5+mNvBTYpERMJ2kL/KnpBSob9abfM
         XNVXDrgDUd/pF6VvrOMD0vasS6lHUitNja4k4wO6PA3AIiu5mTpLmdkMm4xIhDPTL1Ne
         wSsqTDdTbVsXEny3b8y58OwSM+JHbd2W1vUqciQvmJv2cF54LjDWF1uGOZkRmymWNKt7
         GHtOPPooVCknAkvTk+en3R4SmsvzGfI8hP3JDWJ7fz6H7vFp8gMA6WN6fpiId5iloS/X
         lIEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF0EbmNWnwdyHcwYuwwwpb8Pf4hkejp5PukoFazvjqOHD+SkgSdoSbLUKi7BV4jH7Or1kd+Pt4jL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfAovbSyKMsY816j2pL9WfKVmnDoSh56lWRVF89q63r+iCR5pt
	i7W35YyhVg6wcVw+n4AjShQgsT8u91wjoHkbBiJDYYYNaFQghtVtLco97qRd4Ki8Cig=
X-Gm-Gg: ASbGncu9NapAilJz1t/aH6wjUIaGIi5mmr30S12AuU+7kNOJ4GqR/VfIX7KRpbRrovj
	EMfTs1OCTIjG4jZxZVbR/CF4aMUnew3WtFqID4NW4OIpk3KYDdEHYvQu0Zc8ewu45GMhf2wtU/7
	xeoaB3lDozuYtIT/eSZPneRPwZuTP/NzbnvOhHdDas6IWMbAygbFkCS63hgcjYWV4Ai+svrRzKJ
	D1zhD0VkDyJzTX73zNeFgj8hWcqHg4RhBRHIZRRDt4WnIWAdkS0kDMvC6f0eX9t7tM2Kk5EjUMd
	S7kidBNoz7PhEFyfaav3nToToCuNFXkKR07yGMMlQAwTtA3Jr5etmmSbVbpbb1PZOdfd7xH8+U2
	yIYMXTjc2gLGEogRZaYUngsDuUSUHU91UceVQF+Eti8nmi+dXq7EUagId/l9Go9GmPVX8U3R5xC
	BunNxMPjSxaw==
X-Google-Smtp-Source: AGHT+IHpC4zA9rHyOq1xNedwh/vBadqHyptjOa8+6vrhjj8123XYNoSFYmp8q1PCWiMuh3tVBr2dqQ==
X-Received: by 2002:a05:600c:190d:b0:46e:32d4:46a1 with SMTP id 5b1f17b1804b1-4771e1ccb50mr30318945e9.22.1761752801364;
        Wed, 29 Oct 2025 08:46:41 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b9994sm53745535e9.16.2025.10.29.08.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:46:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 29 Oct 2025 15:46:02 +0000
Subject: [PATCH v9 2/5] perf: arm_spe: Add support for filtering on data
 source
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-james-perf-feat_spe_eft-v9-2-d22536b9cf94@linaro.org>
References: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
In-Reply-To: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

SPE_FEAT_FDS adds the ability to filter on the data source of packets.
Like the other existing filters, enable filtering with PMSFCR_EL1.FDS
when any of the filter bits are set.

Each bit maps to data sources 0-63 described by bits[0:5] in the data
source packet (although the full range of data source is 16 bits so
higher value data sources can't be filtered on). The filter is an OR of
all the bits, so for example clearing bits 0 and 3 only includes packets
from data sources 0 OR 3.

Invert the filter given by userspace so that the default value of 0 is
equivalent to including all values (no filtering). This allows us to
skip adding a new format bit to enable filtering and still support
excluding all data sources which would have been a filter value of 0 if
not for the inversion.

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index fa50645fedda..617f8a98dd63 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -87,6 +87,7 @@ struct arm_spe_pmu {
 #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
 #define SPE_PMU_FEAT_DISCARD			(1UL << 7)
 #define SPE_PMU_FEAT_EFT			(1UL << 8)
+#define SPE_PMU_FEAT_FDS			(1UL << 9)
 #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
 	u64					features;
 
@@ -252,6 +253,10 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
 #define ATTR_CFG_FLD_inv_event_filter_LO	0
 #define ATTR_CFG_FLD_inv_event_filter_HI	63
 
+#define ATTR_CFG_FLD_inv_data_src_filter_CFG	config4	/* inverse of PMSDSFR_EL1 */
+#define ATTR_CFG_FLD_inv_data_src_filter_LO	0
+#define ATTR_CFG_FLD_inv_data_src_filter_HI	63
+
 GEN_PMU_FORMAT_ATTR(ts_enable);
 GEN_PMU_FORMAT_ATTR(pa_enable);
 GEN_PMU_FORMAT_ATTR(pct_enable);
@@ -268,6 +273,7 @@ GEN_PMU_FORMAT_ATTR(float_filter);
 GEN_PMU_FORMAT_ATTR(float_filter_mask);
 GEN_PMU_FORMAT_ATTR(event_filter);
 GEN_PMU_FORMAT_ATTR(inv_event_filter);
+GEN_PMU_FORMAT_ATTR(inv_data_src_filter);
 GEN_PMU_FORMAT_ATTR(min_latency);
 GEN_PMU_FORMAT_ATTR(discard);
 
@@ -288,6 +294,7 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
 	&format_attr_float_filter_mask.attr,
 	&format_attr_event_filter.attr,
 	&format_attr_inv_event_filter.attr,
+	&format_attr_inv_data_src_filter.attr,
 	&format_attr_min_latency.attr,
 	&format_attr_discard.attr,
 	NULL,
@@ -306,6 +313,10 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
 	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
 		return 0;
 
+	if (attr == &format_attr_inv_data_src_filter.attr &&
+	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
+		return 0;
+
 	if ((attr == &format_attr_branch_filter_mask.attr ||
 	     attr == &format_attr_load_filter_mask.attr ||
 	     attr == &format_attr_store_filter_mask.attr ||
@@ -430,6 +441,9 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
 	if (ATTR_CFG_GET_FLD(attr, inv_event_filter))
 		reg |= PMSFCR_EL1_FnE;
 
+	if (ATTR_CFG_GET_FLD(attr, inv_data_src_filter))
+		reg |= PMSFCR_EL1_FDS;
+
 	if (ATTR_CFG_GET_FLD(attr, min_latency))
 		reg |= PMSFCR_EL1_FL;
 
@@ -454,6 +468,17 @@ static u64 arm_spe_event_to_pmslatfr(struct perf_event *event)
 	return FIELD_PREP(PMSLATFR_EL1_MINLAT, ATTR_CFG_GET_FLD(attr, min_latency));
 }
 
+static u64 arm_spe_event_to_pmsdsfr(struct perf_event *event)
+{
+	struct perf_event_attr *attr = &event->attr;
+
+	/*
+	 * Data src filter is inverted so that the default value of 0 is
+	 * equivalent to no filtering.
+	 */
+	return ~ATTR_CFG_GET_FLD(attr, inv_data_src_filter);
+}
+
 static void arm_spe_pmu_pad_buf(struct perf_output_handle *handle, int len)
 {
 	struct arm_spe_pmu_buf *buf = perf_get_aux(handle);
@@ -791,6 +816,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	if (arm_spe_event_to_pmsnevfr(event) & spe_pmu->pmsevfr_res0)
 		return -EOPNOTSUPP;
 
+	if (arm_spe_event_to_pmsdsfr(event) != U64_MAX &&
+	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
+		return -EOPNOTSUPP;
+
 	if (attr->exclude_idle)
 		return -EOPNOTSUPP;
 
@@ -866,6 +895,11 @@ static void arm_spe_pmu_start(struct perf_event *event, int flags)
 		write_sysreg_s(reg, SYS_PMSNEVFR_EL1);
 	}
 
+	if (spe_pmu->features & SPE_PMU_FEAT_FDS) {
+		reg = arm_spe_event_to_pmsdsfr(event);
+		write_sysreg_s(reg, SYS_PMSDSFR_EL1);
+	}
+
 	reg = arm_spe_event_to_pmslatfr(event);
 	write_sysreg_s(reg, SYS_PMSLATFR_EL1);
 
@@ -1125,6 +1159,9 @@ static void __arm_spe_pmu_dev_probe(void *info)
 	if (FIELD_GET(PMSIDR_EL1_EFT, reg))
 		spe_pmu->features |= SPE_PMU_FEAT_EFT;
 
+	if (FIELD_GET(PMSIDR_EL1_FDS, reg))
+		spe_pmu->features |= SPE_PMU_FEAT_FDS;
+
 	/* This field has a spaced out encoding, so just use a look-up */
 	fld = FIELD_GET(PMSIDR_EL1_INTERVAL, reg);
 	switch (fld) {

-- 
2.34.1


