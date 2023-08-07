Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABC0771BD5
	for <lists+linux-doc@lfdr.de>; Mon,  7 Aug 2023 09:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbjHGHwS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Aug 2023 03:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbjHGHvt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Aug 2023 03:51:49 -0400
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F7A172C;
        Mon,  7 Aug 2023 00:51:46 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=renyu.zj@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0VpC-05s_1691394701;
Received: from srmbuffer011165236051.sqa.net(mailfrom:renyu.zj@linux.alibaba.com fp:SMTPD_---0VpC-05s_1691394701)
          by smtp.aliyun-inc.com;
          Mon, 07 Aug 2023 15:51:41 +0800
From:   Jing Zhang <renyu.zj@linux.alibaba.com>
To:     John Garry <john.g.garry@oracle.com>,
        Ian Rogers <irogers@google.com>
Cc:     Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
        Zhuo Song <zhuo.song@linux.alibaba.com>,
        Jing Zhang <renyu.zj@linux.alibaba.com>,
        Shuai Xue <xueshuai@linux.alibaba.com>
Subject: [PATCH v6 7/7] perf vendor events: Add JSON metrics for Arm CMN
Date:   Mon,  7 Aug 2023 15:51:25 +0800
Message-Id: <1691394685-61240-8-git-send-email-renyu.zj@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1691394685-61240-1-git-send-email-renyu.zj@linux.alibaba.com>
References: <1691394685-61240-1-git-send-email-renyu.zj@linux.alibaba.com>
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add JSON metrics for Arm CMN. Currently just add part of CMN PMU
metrics which are general and compatible for any SoC with CMN-ANY.

Signed-off-by: Jing Zhang <renyu.zj@linux.alibaba.com>
Reviewed-by: John Garry <john.g.garry@oracle.com>
---
 .../pmu-events/arch/arm64/arm/cmn/sys/metric.json  | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cmn/sys/metric.json

diff --git a/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/metric.json b/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/metric.json
new file mode 100644
index 0000000..64db534
--- /dev/null
+++ b/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/metric.json
@@ -0,0 +1,74 @@
+[
+	{
+		"MetricName": "slc_miss_rate",
+		"BriefDescription": "The system level cache miss rate.",
+		"MetricGroup": "cmn",
+		"MetricExpr": "hnf_cache_miss / hnf_slc_sf_cache_access",
+		"ScaleUnit": "100%",
+		"Unit": "arm_cmn",
+		"Compat": "434*;436*;43c*;43a*"
+	},
+	{
+		"MetricName": "hnf_message_retry_rate",
+		"BriefDescription": "HN-F message retry rate indicates whether a lack of credits is causing the bottlenecks.",
+		"MetricGroup": "cmn",
+		"MetricExpr": "hnf_pocq_retry / hnf_pocq_reqs_recvd",
+		"ScaleUnit": "100%",
+		"Unit": "arm_cmn",
+		"Compat": "434*;436*;43c*;43a*"
+	},
+	{
+		"MetricName": "sf_hit_rate",
+		"BriefDescription": "Snoop filter hit rate can be used to measure the snoop filter efficiency.",
+		"MetricGroup": "cmn",
+		"MetricExpr": "hnf_sf_hit / hnf_slc_sf_cache_access",
+		"ScaleUnit": "100%",
+		"Unit": "arm_cmn",
+		"Compat": "434*;436*;43c*;43a*"
+	},
+	{
+		"MetricName": "mc_message_retry_rate",
+		"BriefDescription": "The memory controller request retries rate indicates whether the memory controller is the bottleneck.",
+		"MetricGroup": "cmn",
+		"MetricExpr": "hnf_mc_retries / hnf_mc_reqs",
+		"ScaleUnit": "100%",
+		"Unit": "arm_cmn",
+		"Compat": "434*;436*;43c*;43a*"
+	},
+	{
+		"MetricName": "rni_actual_read_bandwidth.all",
+		"BriefDescription": "This event measure the actual bandwidth that RN-I bridge sends to the interconnect.",
+		"MetricGroup": "cmn",
+		"MetricExpr": "rnid_rxdat_flits * 32 / 1e6 / duration_time",
+		"ScaleUnit": "1MB/s",
+		"Unit": "arm_cmn",
+		"Compat": "434*;436*;43c*;43a*"
+	},
+	{
+		"MetricName": "rni_actual_write_bandwidth.all",
+		"BriefDescription": "This event measures the actual write bandwidth at RN-I bridges.",
+		"MetricGroup": "cmn",
+		"MetricExpr": "rnid_txdat_flits * 32 / 1e6 / duration_time",
+		"ScaleUnit": "1MB/s",
+		"Unit": "arm_cmn",
+		"Compat": "434*;436*;43c*;43a*"
+	},
+	{
+		"MetricName": "rni_retry_rate",
+		"BriefDescription": "RN-I bridge retry rate indicates whether the memory controller is the bottleneck.",
+		"MetricGroup": "cmn",
+		"MetricExpr": "rnid_txreq_flits_retried / rnid_txreq_flits_total",
+		"ScaleUnit": "100%",
+		"Unit": "arm_cmn",
+		"Compat": "434*;436*;43c*;43a*"
+	},
+	{
+		"MetricName": "sbsx_actual_write_bandwidth.all",
+		"BriefDescription": "sbsx actual write bandwidth.",
+		"MetricGroup": "cmn",
+		"MetricExpr": "sbsx_txdat_flitv * 32 / 1e6 / duration_time",
+		"ScaleUnit": "1MB/s",
+		"Unit": "arm_cmn",
+		"Compat": "434*;436*;43c*;43a*"
+	}
+]
-- 
1.8.3.1

