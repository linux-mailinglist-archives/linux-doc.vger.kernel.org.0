Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD1B786530
	for <lists+linux-doc@lfdr.de>; Thu, 24 Aug 2023 04:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239240AbjHXCNK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Aug 2023 22:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233104AbjHXCMi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 22:12:38 -0400
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B1FE75;
        Wed, 23 Aug 2023 19:12:33 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=renyu.zj@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0VqS2I.A_1692843149;
Received: from 30.221.146.144(mailfrom:renyu.zj@linux.alibaba.com fp:SMTPD_---0VqS2I.A_1692843149)
          by smtp.aliyun-inc.com;
          Thu, 24 Aug 2023 10:12:30 +0800
Message-ID: <a646dfd0-1962-ba67-8a60-925e23d85730@linux.alibaba.com>
Date:   Thu, 24 Aug 2023 10:12:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v7 7/8] perf jevents: Add support for Arm CMN PMU aliasing
To:     Robin Murphy <robin.murphy@arm.com>,
        John Garry <john.g.garry@oracle.com>,
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
        Shuai Xue <xueshuai@linux.alibaba.com>
References: <1692606977-92009-1-git-send-email-renyu.zj@linux.alibaba.com>
 <1692606977-92009-8-git-send-email-renyu.zj@linux.alibaba.com>
 <46a0917c-e288-7ef9-d72d-cdd53bb52a0a@arm.com>
From:   Jing Zhang <renyu.zj@linux.alibaba.com>
In-Reply-To: <46a0917c-e288-7ef9-d72d-cdd53bb52a0a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-12.6 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2023/8/23 下午5:33, Robin Murphy 写道:
> On 2023-08-21 09:36, Jing Zhang wrote:
>> Currently just add aliases for part of Arm CMN PMU events which
>> are general and compatible for any SoC and CMN-ANY.
>>
>> "Compat" value "434*;436*;43c*;43a*" means it is compatible with
>> all CMN600/CMN650/CMN700/Ci700, which can be obtained from
>> commit 7819e05a0dce ("perf/arm-cmn: Revamp model detection").
>>
>> The arm-cmn PMU events got from:
>> [0] https://developer.arm.com/documentation/100180/0302/?lang=en
>> [1] https://developer.arm.com/documentation/101408/0100/?lang=en
>> [2] https://developer.arm.com/documentation/102308/0302/?lang=en
>> [3] https://developer.arm.com/documentation/101569/0300/?lang=en
>>
>> Signed-off-by: Jing Zhang <renyu.zj@linux.alibaba.com>
>> Reviewed-by: John Garry <john.g.garry@oracle.com>
>> ---
>>   .../pmu-events/arch/arm64/arm/cmn/sys/cmn.json     | 266 +++++++++++++++++++++
>>   tools/perf/pmu-events/jevents.py                   |   1 +
>>   2 files changed, 267 insertions(+)
>>   create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json
>>
>> diff --git a/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json b/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json
>> new file mode 100644
>> index 0000000..30435a3
>> --- /dev/null
>> +++ b/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json
>> @@ -0,0 +1,266 @@
>> +[
>> +    {
>> +        "EventName": "hnf_cache_miss",
>> +        "EventIdCode": "0x1",
>> +        "NodeType": "0x5",
> 
> Given my other comment, I also think there would be no harm in just having these as:
>     
>         "ConfigCode" : "0x10005"
> 
> if you'd rather make life easier to begin with, then be able to come back and improve things later. IMO it doesn't affect the readability of the important values *all* that much, since it's not like they're tighly packed together in oddly-aligned bitfields.
> 

Thanks a lot! that's a great suggestion.  I hope to merge it in v6.6 first in the current way,
and then I will improve it in CMN driver and perf tools later.

Thanks,
Jing


> Thanks,
> Robin.
> 
>> +        "BriefDescription": "Counts total cache misses in first lookup result (high priority).",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hnf_slc_sf_cache_access",
>> +        "EventIdCode": "0x2",
>> +        "NodeType": "0x5",
>> +        "BriefDescription": "Counts number of cache accesses in first access (high priority).",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hnf_cache_fill",
>> +        "EventIdCode": "0x3",
>> +        "NodeType": "0x5",
>> +        "BriefDescription": "Counts total allocations in HN SLC (all cache line allocations to SLC).",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hnf_pocq_retry",
>> +        "EventIdCode": "0x4",
>> +        "NodeType": "0x5",
>> +        "BriefDescription": "Counts number of retried requests.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hnf_pocq_reqs_recvd",
>> +        "EventIdCode": "0x5",
>> +        "NodeType": "0x5",
>> +        "BriefDescription": "Counts number of requests that HN receives.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hnf_sf_hit",
>> +        "EventIdCode": "0x6",
>> +        "NodeType": "0x5",
>> +        "BriefDescription": "Counts number of SF hits.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hnf_sf_evictions",
>> +        "EventIdCode": "0x7",
>> +        "NodeType": "0x5",
>> +        "BriefDescription": "Counts number of SF eviction cache invalidations initiated.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hnf_dir_snoops_sent",
>> +        "EventIdCode": "0x8",
>> +        "NodeType": "0x5",
>> +        "BriefDescription": "Counts number of directed snoops sent (not including SF back invalidation).",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hnf_brd_snoops_sent",
>> +        "EventIdCode": "0x9",
>> +        "NodeType": "0x5",
>> +        "BriefDescription": "Counts number of multicast snoops sent (not including SF back invalidation).",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hnf_slc_eviction",
>> +        "EventIdCode": "0xa",
>> +        "NodeType": "0x5",
>> +        "BriefDescription": "Counts number of SLC evictions (dirty only).",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hnf_slc_fill_invalid_way",
>> +        "EventIdCode": "0xb",
>> +        "NodeType": "0x5",
>> +        "BriefDescription": "Counts number of SLC fills to an invalid way.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hnf_mc_retries",
>> +        "EventIdCode": "0xc",
>> +        "NodeType": "0x5",
>> +        "BriefDescription": "Counts number of retried transactions by the MC.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hnf_mc_reqs",
>> +        "EventIdCode": "0xd",
>> +        "NodeType": "0x5",
>> +        "BriefDescription": "Counts number of requests that are sent to MC.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hnf_qos_hh_retry",
>> +        "EventIdCode": "0xe",
>> +        "NodeType": "0x5",
>> +        "BriefDescription": "Counts number of times a HighHigh priority request is protocolretried at the HN‑F.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "rnid_s0_rdata_beats",
>> +        "EventIdCode": "0x1",
>> +        "NodeType": "0xa",
>> +        "BriefDescription": "Number of RData beats (RVALID and RREADY) dispatched on port 0. This event measures the read bandwidth, including CMO responses.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "rnid_s1_rdata_beats",
>> +        "EventIdCode": "0x2",
>> +        "NodeType": "0xa",
>> +        "BriefDescription": "Number of RData beats (RVALID and RREADY) dispatched on port 1. This event measures the read bandwidth, including CMO responses.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "rnid_s2_rdata_beats",
>> +        "EventIdCode": "0x3",
>> +        "NodeType": "0xa",
>> +        "BriefDescription": "Number of RData beats (RVALID and RREADY) dispatched on port 2. This event measures the read bandwidth, including CMO responses.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "rnid_rxdat_flits",
>> +        "EventIdCode": "0x4",
>> +        "NodeType": "0xa",
>> +        "BriefDescription": "Number of RXDAT flits received. This event measures the true read data bandwidth, excluding CMOs.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "rnid_txdat_flits",
>> +        "EventIdCode": "0x5",
>> +        "NodeType": "0xa",
>> +        "BriefDescription": "Number of TXDAT flits dispatched. This event measures the write bandwidth.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "rnid_txreq_flits_total",
>> +        "EventIdCode": "0x6",
>> +        "NodeType": "0xa",
>> +        "BriefDescription": "Number of TXREQ flits dispatched. This event measures the total request bandwidth.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "rnid_txreq_flits_retried",
>> +        "EventIdCode": "0x7",
>> +        "NodeType": "0xa",
>> +        "BriefDescription": "Number of retried TXREQ flits dispatched. This event measures the retry rate.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "sbsx_txrsp_retryack",
>> +        "EventIdCode": "0x4",
>> +        "NodeType": "0x7",
>> +        "BriefDescription": "Number of RXREQ flits dispatched. This event is a measure of the retry rate.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "sbsx_txdat_flitv",
>> +        "EventIdCode": "0x5",
>> +        "NodeType": "0x7",
>> +        "BriefDescription": "Number of TXDAT flits dispatched from XP to SBSX. This event is a measure of the write bandwidth.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "sbsx_arvalid_no_arready",
>> +        "EventIdCode": "0x21",
>> +        "NodeType": "0x7",
>> +        "BriefDescription": "Number of cycles the SBSX bridge is stalled because of backpressure on AR channel.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "sbsx_awvalid_no_awready",
>> +        "EventIdCode": "0x22",
>> +        "NodeType": "0x7",
>> +        "BriefDescription": "Number of cycles the SBSX bridge is stalled because of backpressure on AW channel.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "sbsx_wvalid_no_wready",
>> +        "EventIdCode": "0x23",
>> +        "NodeType": "0x7",
>> +        "BriefDescription": "Number of cycles the SBSX bridge is stalled because of backpressure on W channel.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hni_txrsp_retryack",
>> +        "EventIdCode": "0x2a",
>> +        "NodeType": "0x4",
>> +        "BriefDescription": "Number of RXREQ flits dispatched. This event is a measure of the retry rate.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hni_arvalid_no_arready",
>> +        "EventIdCode": "0x2b",
>> +        "NodeType": "0x4",
>> +        "BriefDescription": "Number of cycles the HN-I bridge is stalled because of backpressure on AR channel.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hni_arready_no_arvalid",
>> +        "EventIdCode": "0x2c",
>> +        "NodeType": "0x4",
>> +        "BriefDescription": "Number of cycles the AR channel is waiting for new requests from HN-I bridge.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hni_awvalid_no_awready",
>> +        "EventIdCode": "0x2d",
>> +        "NodeType": "0x4",
>> +        "BriefDescription": "Number of cycles the HN-I bridge is stalled because of backpressure on AW channel.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hni_awready_no_awvalid",
>> +        "EventIdCode": "0x2e",
>> +        "NodeType": "0x4",
>> +        "BriefDescription": "Number of cycles the AW channel is waiting for new requests from HN-I bridge.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hni_wvalid_no_wready",
>> +        "EventIdCode": "0x2f",
>> +        "NodeType": "0x4",
>> +        "BriefDescription": "Number of cycles the HN-I bridge is stalled because of backpressure on W channel.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    },
>> +    {
>> +        "EventName": "hni_txdat_stall",
>> +        "EventIdCode": "0x30",
>> +        "NodeType": "0x4",
>> +        "BriefDescription": "TXDAT valid but no link credit available.",
>> +        "Unit": "arm_cmn",
>> +        "Compat": "434*;436*;43c*;43a*"
>> +    }
>> +]
>> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
>> index 369c8bf..935bd4b 100755
>> --- a/tools/perf/pmu-events/jevents.py
>> +++ b/tools/perf/pmu-events/jevents.py
>> @@ -272,6 +272,7 @@ class JsonEvent:
>>             'DFPMC': 'amd_df',
>>             'cpu_core': 'cpu_core',
>>             'cpu_atom': 'cpu_atom',
>> +          'arm_cmn': 'arm_cmn',
>>         }
>>         return table[unit] if unit in table else f'uncore_{unit.lower()}'
>>   
