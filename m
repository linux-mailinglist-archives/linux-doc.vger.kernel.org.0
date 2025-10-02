Return-Path: <linux-doc+bounces-62332-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 473A4BB3902
	for <lists+linux-doc@lfdr.de>; Thu, 02 Oct 2025 12:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9074016F142
	for <lists+linux-doc@lfdr.de>; Thu,  2 Oct 2025 10:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA67309EE1;
	Thu,  2 Oct 2025 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="opoN/qe2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463A83090E5
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759399803; cv=none; b=q249S7LGP1fmohq/f47939YpXqlCDEFBQrFatwCO76mwKH2+uJkn7hwtR/P5p7i2wsN/dVsPXLjSng55bgK7U8L2btCCgxLrAH2O88iLkPrJi3gPfG+tbpzzfWSA1m+BFcUrsPPFU/yMgEsFQPLdEHD14C19kkkqIaEOHsBlHMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759399803; c=relaxed/simple;
	bh=NodSNY+BcxD6E9MO9rn64ii25lVljvGPejK28wY81u8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FkRm0gGlGK/iahedLf69mXV5ImopQ0So0EHu/bfmYdOWgoRIO626De3Q0NjyBr3ENwCLTTxc7loj9W0E1fdKnYxgpuchgPu+UvRstukdYrL0xM926+IOztGMUS4+vjGD2gglgByjDdA+/dI0nA6fUx3Gl0285NgXXds7mPLtC5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=opoN/qe2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so7035495e9.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 03:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759399799; x=1760004599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nwhvpaffB2pXp/ljo/Ru9JZ/V74Q4XqKzNaVtDeMyw=;
        b=opoN/qe2ejAi3Rsfa5/fRNLpaUT0IlImV3yvrzFkPZAclmloZWTnxH6CRVBbxt9+Uq
         Q+AeA6vkfwMHUXRT5ChP3oXAEojd1jugGEd0KDPvLBg5WA8J+SHhoXnOWwmGxF1QWUPZ
         ZQwmOwg9M4Dr/zRLBwwuqQFV8uq5QRuHq9W4B4gSV6f42alLOjZr1pplHWLSZ/NJqVu0
         iAaTR3uvxHw1+bIDQE2420b0pPFmwJM2uqZHpYzws9wxRufUtCFfvxRIqbisPL3QOoeY
         hPUEP5AgX0wYNBRVoNn1br1KHtWKTI0as97W7XXqlR0p/9FRQAaL/IamEQCID24TFpja
         O7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399799; x=1760004599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nwhvpaffB2pXp/ljo/Ru9JZ/V74Q4XqKzNaVtDeMyw=;
        b=C7IBCsBJ7edsfqwthRENsC4cbSiYej0qDYB+MlOSiNl+vNc8lHGwb3haiyf6B3H2E3
         Ru+H2lwKIkKi4xp/VAZNOcmRZ75D2pBWCpPEZ2+tDzw25CaDQRRBcKccJ9v03lLoouTG
         E4sAAc3uRMBXdygTraE7uM66nAbXMrsrbxb3VALRNL5WbrNzoMe/D1WjyCgE2fj/7yJw
         dChJNKt3qmHUwLgysyHOzqZRKOqWp158B6wVnNFaAL2wdMwhUsZkDyPUY8zlCcIhdCy1
         XQpgcy+/cJvlHRfJ0w4h4ANhg/tETRHbXXquPD8EmwZnQwoKhqpazBN+brXxQEaho/vb
         YeFw==
X-Forwarded-Encrypted: i=1; AJvYcCXWiwfV0VtRrGWkOAQe99PFbJEpmvQduW2kD2jgLx5azVawdUdE9tjSfXO+Ki8DNQ51V/o3hsZYKDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ7u3nux1FRdo+mvBCRPDv6PNtJRpfUrlpS6uZk7mSpRtiMru2
	AMATSER+zygGlaXUI5fXa1mrgF8/+xHgJFJlCOVnl5/ddeAhwy0kX3qLcPJ5j8Qt5Ac=
X-Gm-Gg: ASbGncv4uKMbmAs8UjUdXvvqCIf0CVy/7fBhJp9lSdNC18ytoKpFrlFChCHYiYSWJrV
	rMagypmf0JyLWNkSHkJRhNXurGGVh3aM4otdZYmTXH4o3uQx1wqewdfWa6bOtbH5EatfQiUQf1I
	HTHqhudxcoMbKTRT6fEffXejf8YF+mAPm/tUqBl8RoGzdUpN1IAcnqzcdEw1GQGmSX6Ka07HLNO
	4gwxgrVSoZ/NRnxboeJ+ty7ZzXXILWpATa3rN053LH1f/rIb53+1SrYOSDVZK6YVGN1rlH57K3I
	eU5nPoAOyZbJV7UCCbE5n/5G+ly8aMy5IMvMAL2jcE7BNSo99f2nGKBNPspLCLifDXtghRtGWvP
	2aqDj3szQE6tX10Qf3UEAtY5jZPDkD7v/ekquSVnAhJdjOCvMoWwfJsDWJoCo
X-Google-Smtp-Source: AGHT+IHr08HxjkRp93BXV80HRH/1LL0M5XuhCuT5Z8qI/nr9hlsv++b8qZOSGz24catkR5X862GWCA==
X-Received: by 2002:a05:600c:a08e:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-46e6127b7a9mr57468195e9.12.1759399799467;
        Thu, 02 Oct 2025 03:09:59 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab960sm3017289f8f.13.2025.10.02.03.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:09:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 02 Oct 2025 11:09:32 +0100
Subject: [PATCH v3 4/5] coresight: Add format attribute for setting the
 timestamp interval
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-james-cs-syncfreq-v3-4-fe5df2bf91d1@linaro.org>
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Timestamps are currently emitted at the maximum rate possible, which is
much too frequent for most use cases. Add an attribute to be able to set
the interval. Granular control is not required, so save space in the
config by interpreting it as 2 ^ ts_interval. And then 4 bits (0 - 15) is
enough to set the interval to be larger than the existing SYNC timestamp
interval.

No sysfs file is needed for this attribute because counter generated
timestamps are only configured for Perf mode.

Only show this attribute for ETM4x because timestamps aren't configured
in the same way for ETM3x. The attribute is only ever read in
coresight-etm4x-core.c.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c   | 16 +++++++++++++++-
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  7 +++++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 21 ++++++++++++---------
 3 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f677c08233ba..0c1b990fc56e 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -13,6 +13,7 @@
 #include <linux/mm.h>
 #include <linux/init.h>
 #include <linux/perf_event.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/percpu-defs.h>
 #include <linux/slab.h>
 #include <linux/stringhash.h>
@@ -69,7 +70,8 @@ PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
 /* config ID - set if a system configuration is selected */
 PMU_FORMAT_ATTR(configid,	"config2:32-63");
 PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
-
+/* Interval = (2 ^ ts_level) */
+GEN_PMU_FORMAT_ATTR(ts_level);
 
 /*
  * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
@@ -103,11 +105,23 @@ static struct attribute *etm_config_formats_attr[] = {
 	&format_attr_configid.attr,
 	&format_attr_branch_broadcast.attr,
 	&format_attr_cc_threshold.attr,
+	&format_attr_ts_level.attr,
 	NULL,
 };
 
+static umode_t etm_format_attr_is_visible(struct kobject *kobj,
+					  struct attribute *attr, int unused)
+{
+	if (attr == &format_attr_ts_level.attr &&
+	    !IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
+		return 0;
+
+	return attr->mode;
+}
+
 static const struct attribute_group etm_pmu_format_group = {
 	.name   = "format",
+	.is_visible = etm_format_attr_is_visible,
 	.attrs  = etm_config_formats_attr,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 5febbcdb8696..d2664ffb33e5 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -7,6 +7,7 @@
 #ifndef _CORESIGHT_ETM_PERF_H
 #define _CORESIGHT_ETM_PERF_H
 
+#include <linux/bits.h>
 #include <linux/percpu-defs.h>
 #include "coresight-priv.h"
 
@@ -20,6 +21,12 @@ struct cscfg_config_desc;
  */
 #define ETM_ADDR_CMP_MAX	8
 
+#define ATTR_CFG_FLD_ts_level_CFG	config3
+#define ATTR_CFG_FLD_ts_level_LO	12
+#define ATTR_CFG_FLD_ts_level_HI	15
+#define ATTR_CFG_FLD_ts_level_MASK	GENMASK(ATTR_CFG_FLD_ts_level_HI, \
+						ATTR_CFG_FLD_ts_level_LO)
+
 /**
  * struct etm_filter - single instruction range or start/stop configuration.
  * @start_addr:	The address to start tracing on.
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 920d092ef862..034844f52bb2 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -28,6 +28,7 @@
 #include <linux/amba/bus.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -616,7 +617,7 @@ static void etm4_enable_hw_smp_call(void *info)
  *  +--------------+
  *         |
  *  +------v-------+
- *  | Counter x    |   (reload to 1 on underflow)
+ *  | Counter x    |   (reload to 2 ^ ts_level on underflow)
  *  +--------------+
  *         |
  *  +------v--------------+
@@ -627,11 +628,17 @@ static void etm4_enable_hw_smp_call(void *info)
  *  | Timestamp Generator  |  (timestamp on resource y)
  *  +----------------------+
  */
-static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
+static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
+				       struct perf_event_attr *attr)
 {
 	int ctridx;
 	int rselector;
 	struct etmv4_config *config = &drvdata->config;
+	u8 ts_level = ATTR_CFG_GET_FLD(attr, ts_level);
+
+	/* Disable when ts_level == MAX */
+	if (ts_level == FIELD_GET(ATTR_CFG_FLD_ts_level_MASK, UINT_MAX))
+		return 0;
 
 	/* No point in trying if we don't have at least one counter */
 	if (!drvdata->nr_cntr)
@@ -667,12 +674,8 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
 		return -ENOSPC;
 	}
 
-	/*
-	 * Initialise original and reload counter value to the smallest
-	 * possible value in order to get as much precision as we can.
-	 */
-	config->cntr_val[ctridx] = 1;
-	config->cntrldvr[ctridx] = 1;
+	/* Initialise original and reload counter value. */
+	config->cntr_val[ctridx] = config->cntrldvr[ctridx] = 1 << ts_level;
 
 	/*
 	 * Trace Counter Control Register TRCCNTCTLRn
@@ -762,7 +765,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		 * order to correlate instructions executed on different CPUs
 		 * (CPU-wide trace scenarios).
 		 */
-		ret = etm4_config_timestamp_event(drvdata);
+		ret = etm4_config_timestamp_event(drvdata, attr);
 
 		/*
 		 * No need to go further if timestamp intervals can't

-- 
2.34.1


