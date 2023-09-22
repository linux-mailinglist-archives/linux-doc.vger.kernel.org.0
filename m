Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF2397AAC75
	for <lists+linux-doc@lfdr.de>; Fri, 22 Sep 2023 10:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjIVITb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 22 Sep 2023 04:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjIVITa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Sep 2023 04:19:30 -0400
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B18EF7;
        Fri, 22 Sep 2023 01:19:22 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R641e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=renyu.zj@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0VscqxyT_1695370757;
Received: from 30.221.145.107(mailfrom:renyu.zj@linux.alibaba.com fp:SMTPD_---0VscqxyT_1695370757)
          by smtp.aliyun-inc.com;
          Fri, 22 Sep 2023 16:19:19 +0800
Message-ID: <0f5bbe93-1875-ff9b-a1d8-8518a8cf3e84@linux.alibaba.com>
Date:   Fri, 22 Sep 2023 16:19:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v9 1/7] perf pmu: "Compat" supports regular expression
 matching identifiers
To:     Ian Rogers <irogers@google.com>
Cc:     John Garry <john.g.garry@oracle.com>,
        Will Deacon <will@kernel.org>,
        James Clark <james.clark@arm.com>,
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
References: <1695037955-107983-1-git-send-email-renyu.zj@linux.alibaba.com>
 <1695037955-107983-2-git-send-email-renyu.zj@linux.alibaba.com>
 <CAP-5=fUxfJT-gxKB+Ls3drUeQ0sy55uydi8Y36gumUnaFSYeqA@mail.gmail.com>
From:   Jing Zhang <renyu.zj@linux.alibaba.com>
In-Reply-To: <CAP-5=fUxfJT-gxKB+Ls3drUeQ0sy55uydi8Y36gumUnaFSYeqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-11.4 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
        URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2023/9/21 上午2:36, Ian Rogers 写道:
> On Mon, Sep 18, 2023 at 4:52 AM Jing Zhang <renyu.zj@linux.alibaba.com> wrote:
>>
>> The jevent "Compat" is used for uncore PMU alias or metric definitions.
>>
>> The same PMU driver has different PMU identifiers due to different
>> hardware versions and types, but they may have some common PMU event.
>> Since a Compat value can only match one identifier, when adding the
>> same event alias to PMUs with different identifiers, each identifier
>> needs to be defined once, which is not streamlined enough.
>>
>> So let "Compat" support using regular expression to match identifiers
>> for uncore PMU alias. For example, if the "Compat" value is set to
>> "43401|43c01", it would be able to match PMU identifiers such as "43401"
>> or "43c01", which correspond to CMN600_r0p0 or CMN700_r0p0.
>>
>> Signed-off-by: Jing Zhang <renyu.zj@linux.alibaba.com>
>> ---
>>  tools/perf/util/pmu.c | 23 +++++++++++++++++++++--
>>  tools/perf/util/pmu.h |  1 +
>>  2 files changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
>> index e215985..7e2242f 100644
>> --- a/tools/perf/util/pmu.c
>> +++ b/tools/perf/util/pmu.c
>> @@ -28,6 +28,7 @@
>>  #include "strbuf.h"
>>  #include "fncache.h"
>>  #include "util/evsel_config.h"
>> +#include <regex.h>
>>
>>  struct perf_pmu perf_pmu__fake = {
>>         .name = "fake",
>> @@ -875,6 +876,24 @@ static bool pmu_uncore_alias_match(const char *pmu_name, const char *name)
>>         return res;
>>  }
>>
>> +bool pmu_uncore_identifier_match(const char *compat, const char *id)
>> +{
>> +       regex_t re;
>> +       regmatch_t pmatch[1];
>> +       int match;
>> +
>> +       if (regcomp(&re, compat, REG_EXTENDED) != 0) {
>> +               /* Warn unable to generate match particular string. */
>> +               pr_info("Invalid regular expression %s\n", compat);
>> +               return false;
>> +       }
>> +
>> +       match = !regexec(&re, id, 1, pmatch, 0);
> 
> I wonder if we can make the regular expressions like
> "^(434|436|43c|43a)" more like "(434|436|43c|43a).*", so that we fully
> match the id string, by here doing:
> 
> if (match) {
>   /* Ensure a full match. */
>   match = pmatch[0].rm_so == 0 && pmatch[0].rm_eo == strlen(id);
> }
> 

Ok, will do.


> I think longer term we can use jevents.py to generate a pmu-events.l,
> which would have a contents something like:
> 
> (434|436|43c|43a).*  { return PMU_....;}
> 
> That should make the matching faster but may add some restrictions
> onto the regular expression.

Could you please describe the function of pmu-event.l in more detail? I may not fully understand it.

Thanks,
Jing

> 
> Thanks,
> Ian
> 
>> +       regfree(&re);
>> +
>> +       return match;
>> +}
>> +
>>  static int pmu_add_cpu_aliases_map_callback(const struct pmu_event *pe,
>>                                         const struct pmu_events_table *table __maybe_unused,
>>                                         void *vdata)
>> @@ -915,8 +934,8 @@ static int pmu_add_sys_aliases_iter_fn(const struct pmu_event *pe,
>>         if (!pe->compat || !pe->pmu)
>>                 return 0;
>>
>> -       if (!strcmp(pmu->id, pe->compat) &&
>> -           pmu_uncore_alias_match(pe->pmu, pmu->name)) {
>> +       if (pmu_uncore_alias_match(pe->pmu, pmu->name) &&
>> +                       pmu_uncore_identifier_match(pe->compat, pmu->id)) {
>>                 perf_pmu__new_alias(pmu,
>>                                 pe->name,
>>                                 pe->desc,
>> diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
>> index bd5d804..fc155ce 100644
>> --- a/tools/perf/util/pmu.h
>> +++ b/tools/perf/util/pmu.h
>> @@ -240,6 +240,7 @@ void pmu_add_cpu_aliases_table(struct perf_pmu *pmu,
>>  char *perf_pmu__getcpuid(struct perf_pmu *pmu);
>>  const struct pmu_events_table *pmu_events_table__find(void);
>>  const struct pmu_metrics_table *pmu_metrics_table__find(void);
>> +bool pmu_uncore_identifier_match(const char *compat, const char *id);
>>
>>  int perf_pmu__convert_scale(const char *scale, char **end, double *sval);
>>
>> --
>> 1.8.3.1
>>
