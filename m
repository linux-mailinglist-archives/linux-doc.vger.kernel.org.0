Return-Path: <linux-doc+bounces-46900-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ADBABDE0E
	for <lists+linux-doc@lfdr.de>; Tue, 20 May 2025 17:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57E1B3A5205
	for <lists+linux-doc@lfdr.de>; Tue, 20 May 2025 15:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F3E24EF6B;
	Tue, 20 May 2025 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WviNNwbI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310BE242D95
	for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 15:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747753266; cv=none; b=YsTGpW/dD5HGwhLaVy+GWDPDeLne08/nOrXWySr/i3dPr11iSkkukYBv1kaD1o5Pv0nuF2srxZBhL+lvefWZR5GSiJ89d96dKeBSuXabhQj0MyxgP25wWAI8sQ3DWHaLsjrnpTiCuNbcvwelGct6zN8gydsTcLjhcox7uCB2+4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747753266; c=relaxed/simple;
	bh=vxtLkO7E3I4lrtJrUfMLXkQwXrxvUdKqWCgJy3w4zag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsJWMfKONQHff5rC58Fko7bhqlN8tzAg2OqDLfU0RYFAWbbaXC8dSVPQ3WtyKcttKL6DsRR+qDKQH2OXz/wivfayS31oZAo+LT5SBSmyU4IHHxwoW3OKtO4lEKQn4s5De/WMuzL3cyrto2oHF0o9omSlbhL+Yh9uB/k2EFYCmIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WviNNwbI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so47129225e9.0
        for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 08:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747753261; x=1748358061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEtrnnDuAmJYKZeSMvf5c7nmLNzlk/l+Iae0vySJelU=;
        b=WviNNwbI+XG3gnlTkqtjB/mdipNWnaApELzacJvMBfW2ZC+QBvLvo+a6mAWKAmXCD5
         K2Ql765lzPDsSrh+7MW33gMShbqpSrJkS6injdC/4hAWrm+jwnE8tibISaa8uyQyEXcN
         3JnUn7G8ljuoMe64vtE5RdjdVivzBHLr06eiX1R5NeND6++Anms1Wr3wLTfoWH1moj3a
         IS4lTVOJKv1P8Fhop/5iv5C+Tz+3Vicw8LtZRmcu6iwIhbBDQeJLVYuFlcszWs0pZ1Ii
         cg6K2V4I3Ti6krsGXyckGeF690VZEfHsjxJ7L8pOEXa/yk0jOI11xgiAzlshzFeeUlyy
         3h8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747753261; x=1748358061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEtrnnDuAmJYKZeSMvf5c7nmLNzlk/l+Iae0vySJelU=;
        b=KhH9orjdNqJGG0t0gVZjW5VAmEK31wuu8sH4sXQ/F0aEp5zm3VfSm2uZEYM9uenjtN
         l/9qcIQJA8xtXFJdmLHxHjmEHFCQlM+RG4q6kobbBkRybWvikgH/v7+vcSQYCrBJIvaL
         X3IctRAhdxcMOYCo3gScylf6S5lGq+wC39hOw1modh0gjdgc4oC7cTU28Xuhl7eNwOSZ
         Cf12mvdWt1efP3E+f8InRi8UpXVRAFJSs/504lsgda4nSUaqJoGflVevH6GqLkwHclv9
         PQPk4qngOPFm/TM/3hUlJ4/fjYmGSSc+eN24+9l8mm6Tz4qnloSWdTtv9uqiNXaLQOpY
         vVNg==
X-Forwarded-Encrypted: i=1; AJvYcCWRdweU7TsKkCsiHbRTWDhspCu3PcV0Rp/uNzI1Cz8Iaxf6IbIzi87AmEojb9jIDu11lTMLLgOU1ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YywEsqVWHGIf4hQop5hjcee6sU/Dt9LXWpBq1iGzZnSURUgUUHQ
	MWhWsS8Ps5E0ECiv8flQ0Q4+wKm8+x69U9g3Zx1y2OexZP9nCcwNFUAlb/kqK4JdXCI=
X-Gm-Gg: ASbGncs2PuXE807uzSvbDlolfo8pX2htssvwuyEUFfWcNFZLknwlusu/YwjmtRp54Tj
	ZJxs1W3R/S1bBBScXjvYLCmSzx6kEISFbQOgDrQelf51ZLYqfVrATqkdyeM87wmXzoQaCMyACIr
	8YBQN8BpUGkLqm9faaZaG1TQKHkJjcNsZFNPwFX5nz3d/sZ0EbqdNkFDYf6JlkCgmGaUjmUnXNh
	WY+FPTkXHCimFsSL9URD67heIiAo0KwBdaLvrJvDIvKYx8H7d1i861CHgZSxxolDG15xo8r6VP7
	LR3VRYPb2yidREtpjK7khw6EFgBjLpVrZDA1NZvIhO7KATltI9wKzo+T
X-Google-Smtp-Source: AGHT+IH24Rob6qzsp/B6a4YvVXoqQFWt4twT0lUoObQ25VvZu+ofvWuRa8S+DtGe5tHJROxKWkMZ3Q==
X-Received: by 2002:a05:600c:a418:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-445198425a6mr87579185e9.5.1747753261270;
        Tue, 20 May 2025 08:01:01 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b295fdsm35699865e9.5.2025.05.20.08.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 08:01:00 -0700 (PDT)
Message-ID: <443141db-6950-4a15-83be-ad9e9c0e03a0@linaro.org>
Date: Tue, 20 May 2025 16:00:59 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] perf: arm_spe: Add support for filtering on data
 source
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-7-dd480e8e4851@linaro.org>
 <20250520134632.GR412060@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250520134632.GR412060@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/05/2025 2:46 pm, Leo Yan wrote:
> On Tue, May 06, 2025 at 12:41:39PM +0100, James Clark wrote:
>> SPE_FEAT_FDS adds the ability to filter on the data source of packets.
>> Like the other existing filters, enable filtering with PMSFCR_EL1.FDS
>> when any of the filter bits are set.
>>
>> Each bit maps to data sources 0-63 described by bits[0:5] in the data
>> source packet (although the full range of data source is 16 bits so
>> higher value data sources can't be filtered on). The filter is an OR of
>> all the bits, so for example setting bits 0 and 3 filters packets from
>> data sources 0 OR 3.
> 
> As Arm ARM says:
> 
>    0b0 : If PMSFCR_EL1.FDS is 1, do not record load operations that have
>          bits [5:0] of the Data Source packet set to <m>.
>    0b1 : Load operations with Data Source <m> are unaffected by
>          PMSFCR_EL1.FDS.
> 
> We need extra handling for this configuration (0b0 means filtering,
> 0b1 means no affaction):
> 
> - By default, the driver should set all bits in the 'data_src_filter'
>    field.
> 
> - The perf tool needs an extra patch in userspace to initialize all
>    bits in config4 unless user specify other values.
> 
> Thanks,
> Leo
> 

Did you take into account PMSFCR_EL1.FDS being set automatically? I 
think the wording is slightly confusing but I tested it on the model and 
it works.

If PMSFCR_EL1.FDS == 0 then PMSDSFR_EL1 does nothing, and if the data 
source filter isn't set by the user then FDS isn't set so there's no 
need to set all the bits in the filter to 1. Once the user asks for any 
filter then we set FDS, at which point it's whatever filter they asked 
for. They can set all the bits if they want, or just one.

This is same way PMSFCR_EL1.FT already works. If the user asks for any 
filter then it's set automatically, but we don't allow the user to ask 
for "no filters" but with FT set.

So the only thing we can't do is filter out samples with _any_ data 
source. Which would be PMSFCR_EL1.FDS == 1 and PMSDSFR_EL1 == 0. But I 
don't think that's useful, and there are other filters to get you all or 
most of the way there.

>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/perf/arm_spe_pmu.c | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index 9309b846f642..d04318411f77 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -87,6 +87,7 @@ struct arm_spe_pmu {
>>   #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
>>   #define SPE_PMU_FEAT_DISCARD			(1UL << 7)
>>   #define SPE_PMU_FEAT_EFT			(1UL << 8)
>> +#define SPE_PMU_FEAT_FDS			(1UL << 9)
>>   #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
>>   	u64					features;
>>   
>> @@ -232,6 +233,10 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
>>   #define ATTR_CFG_FLD_inv_event_filter_LO	0
>>   #define ATTR_CFG_FLD_inv_event_filter_HI	63
>>   
>> +#define ATTR_CFG_FLD_data_src_filter_CFG	config4	/* PMSDSFR_EL1 */
>> +#define ATTR_CFG_FLD_data_src_filter_LO	0
>> +#define ATTR_CFG_FLD_data_src_filter_HI	63
>> +
>>   GEN_PMU_FORMAT_ATTR(ts_enable);
>>   GEN_PMU_FORMAT_ATTR(pa_enable);
>>   GEN_PMU_FORMAT_ATTR(pct_enable);
>> @@ -248,6 +253,7 @@ GEN_PMU_FORMAT_ATTR(float_filter);
>>   GEN_PMU_FORMAT_ATTR(float_filter_mask);
>>   GEN_PMU_FORMAT_ATTR(event_filter);
>>   GEN_PMU_FORMAT_ATTR(inv_event_filter);
>> +GEN_PMU_FORMAT_ATTR(data_src_filter);
>>   GEN_PMU_FORMAT_ATTR(min_latency);
>>   GEN_PMU_FORMAT_ATTR(discard);
>>   
>> @@ -268,6 +274,7 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
>>   	&format_attr_float_filter_mask.attr,
>>   	&format_attr_event_filter.attr,
>>   	&format_attr_inv_event_filter.attr,
>> +	&format_attr_data_src_filter.attr,
>>   	&format_attr_min_latency.attr,
>>   	&format_attr_discard.attr,
>>   	NULL,
>> @@ -286,6 +293,9 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
>>   	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
>>   		return 0;
>>   
>> +	if (attr == &format_attr_data_src_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_FDS))
>> +		return 0;
>> +
>>   	if ((attr == &format_attr_branch_filter_mask.attr ||
>>   	     attr == &format_attr_load_filter_mask.attr ||
>>   	     attr == &format_attr_store_filter_mask.attr ||
>> @@ -406,6 +416,9 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
>>   	if (ATTR_CFG_GET_FLD(attr, inv_event_filter))
>>   		reg |= PMSFCR_EL1_FnE;
>>   
>> +	if (ATTR_CFG_GET_FLD(attr, data_src_filter))
>> +		reg |= PMSFCR_EL1_FDS;
>> +
>>   	if (ATTR_CFG_GET_FLD(attr, min_latency))
>>   		reg |= PMSFCR_EL1_FL;
>>   
>> @@ -430,6 +443,12 @@ static u64 arm_spe_event_to_pmslatfr(struct perf_event *event)
>>   	return FIELD_PREP(PMSLATFR_EL1_MINLAT, ATTR_CFG_GET_FLD(attr, min_latency));
>>   }
>>   
>> +static u64 arm_spe_event_to_pmsdsfr(struct perf_event *event)
>> +{
>> +	struct perf_event_attr *attr = &event->attr;
>> +	return ATTR_CFG_GET_FLD(attr, data_src_filter);
>> +}
>> +
>>   static void arm_spe_pmu_pad_buf(struct perf_output_handle *handle, int len)
>>   {
>>   	struct arm_spe_pmu_buf *buf = perf_get_aux(handle);
>> @@ -788,6 +807,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
>>   	if (arm_spe_event_to_pmsnevfr(event) & arm_spe_pmsevfr_res0(spe_pmu->pmsver))
>>   		return -EOPNOTSUPP;
>>   
>> +	if (arm_spe_event_to_pmsdsfr(event) &&
>> +	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
>> +		return -EOPNOTSUPP;
>> +
>>   	if (attr->exclude_idle)
>>   		return -EOPNOTSUPP;
>>   
>> @@ -857,6 +880,11 @@ static void arm_spe_pmu_start(struct perf_event *event, int flags)
>>   		write_sysreg_s(reg, SYS_PMSNEVFR_EL1);
>>   	}
>>   
>> +	if (spe_pmu->features & SPE_PMU_FEAT_FDS) {
>> +		reg = arm_spe_event_to_pmsdsfr(event);
>> +		write_sysreg_s(reg, SYS_PMSDSFR_EL1);
>> +	}
>> +
>>   	reg = arm_spe_event_to_pmslatfr(event);
>>   	write_sysreg_s(reg, SYS_PMSLATFR_EL1);
>>   
>> @@ -1116,6 +1144,9 @@ static void __arm_spe_pmu_dev_probe(void *info)
>>   	if (FIELD_GET(PMSIDR_EL1_EFT, reg))
>>   		spe_pmu->features |= SPE_PMU_FEAT_EFT;
>>   
>> +	if (FIELD_GET(PMSIDR_EL1_FDS, reg))
>> +		spe_pmu->features |= SPE_PMU_FEAT_FDS;
>> +
>>   	/* This field has a spaced out encoding, so just use a look-up */
>>   	fld = FIELD_GET(PMSIDR_EL1_INTERVAL, reg);
>>   	switch (fld) {
>>
>> -- 
>> 2.34.1
>>


