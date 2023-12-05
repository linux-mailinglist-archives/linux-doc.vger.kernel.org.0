Return-Path: <linux-doc+bounces-4110-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F03805827
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 16:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85DBDB20A16
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 15:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E339167E82;
	Tue,  5 Dec 2023 15:05:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 116E4A9;
	Tue,  5 Dec 2023 07:05:09 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0C11139F;
	Tue,  5 Dec 2023 07:05:54 -0800 (PST)
Received: from [192.168.1.3] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C52D3F6C4;
	Tue,  5 Dec 2023 07:05:05 -0800 (PST)
Message-ID: <1a74fef6-7f51-a518-4258-5f693b56add9@arm.com>
Date: Tue, 5 Dec 2023 15:05:05 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 2/3] arm64: perf: Add support for event counting
 threshold
Content-Language: en-US
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 suzuki.poulose@arm.com, mark.rutland@arm.com, anshuman.khandual@arm.com,
 namhyung@gmail.com, Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231124102857.1106453-1-james.clark@arm.com>
 <20231124102857.1106453-3-james.clark@arm.com>
 <20231205131414.GA18119@willie-the-truck>
From: James Clark <james.clark@arm.com>
In-Reply-To: <20231205131414.GA18119@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/12/2023 13:14, Will Deacon wrote:
> On Fri, Nov 24, 2023 at 10:28:56AM +0000, James Clark wrote:
>> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
>> index 1d40d794f5e4..eb1ef84e1dbb 100644
>> --- a/drivers/perf/arm_pmuv3.c
>> +++ b/drivers/perf/arm_pmuv3.c
>> @@ -15,6 +15,7 @@
>>  #include <clocksource/arm_arch_timer.h>
>>  
>>  #include <linux/acpi.h>
>> +#include <linux/bitfield.h>
>>  #include <linux/clocksource.h>
>>  #include <linux/of.h>
>>  #include <linux/perf/arm_pmu.h>
>> @@ -294,9 +295,20 @@ static const struct attribute_group armv8_pmuv3_events_attr_group = {
>>  	.is_visible = armv8pmu_event_attr_is_visible,
>>  };
>>  
>> +#define THRESHOLD_LOW		2
>> +#define THRESHOLD_HIGH		13
>> +#define THRESHOLD_CNT		14
>> +#define THRESHOLD_CMP_LO	15
>> +#define THRESHOLD_CMP_HI	16
> 
> Do you think THWIDTH might extend beyond 12 bits in future? If so, it might
> be worth juggling these bits around a bit so it's not sandwiched between
> 'rdpmc' and 'threshold_compare'. I defer to your judgement, however.
> 

It's possible, both PMMIR.THWIDTH and PMEVTYPER.TH currently have unused
bits above them. I can easily move threshold to the end, I suppose that
covers us at least until someone adds a new field above that.

>>  PMU_FORMAT_ATTR(event, "config:0-15");
>>  PMU_FORMAT_ATTR(long, "config1:0");
>>  PMU_FORMAT_ATTR(rdpmc, "config1:1");
>> +PMU_FORMAT_ATTR(threshold, "config1:" __stringify(THRESHOLD_LOW) "-"
>> +				      __stringify(THRESHOLD_HIGH));
>> +PMU_FORMAT_ATTR(threshold_compare, "config1:" __stringify(THRESHOLD_CMP_LO) "-"
>> +					      __stringify(THRESHOLD_CMP_HI));
>> +PMU_FORMAT_ATTR(threshold_count, "config1:" __stringify(THRESHOLD_CNT));
>>  
>>  static int sysctl_perf_user_access __read_mostly;
>>  
>> @@ -310,10 +322,33 @@ static inline bool armv8pmu_event_want_user_access(struct perf_event *event)
>>  	return event->attr.config1 & 0x2;
>>  }
>>  
>> +static inline u32 armv8pmu_event_threshold(struct perf_event_attr *attr)
>> +{
>> +	return FIELD_GET(GENMASK(THRESHOLD_HIGH, THRESHOLD_LOW), attr->config1);
>> +}
>> +
>> +static inline u8 armv8pmu_event_threshold_control(struct perf_event_attr *attr)
> 
> You can drop the 'inline's for these functions (and, in fact, this whole
> file could do with that cleanup :)
> 

Will do.

>> +{
>> +	u8 th_compare = FIELD_GET(GENMASK(THRESHOLD_CMP_HI, THRESHOLD_CMP_LO),
>> +				  attr->config1);
>> +	u8 th_count = FIELD_GET(BIT(THRESHOLD_CNT), attr->config1);
> 
> I think this is correct, but you might want to look at how we handle this
> in the SPE driver as I think it ends up looking cleaner and makes it pretty
> obvious which bits correspond to the user ABI (i.e. config fields) and which
> bits are part of architectural registers. I'm not saying you have to do it
> that way, but please take a look if you haven't already.
> 

Yeah I could take the GEN_PMU_FORMAT_ATTR() etc macros out of there and
re-use them here too. And also for the other existing configs in
arm_pmuv3.c.

>> +	/*
>> +	 * The count bit is always the bottom bit of the full control field, and
>> +	 * the comparison is the upper two bits, but it's not explicitly
>> +	 * labelled in the Arm ARM. For the Perf interface we split it into two
>> +	 * fields, so reconstruct it here.
>> +	 */
>> +	return (th_compare << 1) | th_count;
>> +}
>> +
>>  static struct attribute *armv8_pmuv3_format_attrs[] = {
>>  	&format_attr_event.attr,
>>  	&format_attr_long.attr,
>>  	&format_attr_rdpmc.attr,
>> +	&format_attr_threshold.attr,
>> +	&format_attr_threshold_compare.attr,
>> +	&format_attr_threshold_count.attr,
>>  	NULL,
>>  };
>>  
>> @@ -365,10 +400,38 @@ static ssize_t bus_width_show(struct device *dev, struct device_attribute *attr,
>>  
>>  static DEVICE_ATTR_RO(bus_width);
>>  
>> +static u32 threshold_max(struct arm_pmu *cpu_pmu)
>> +{
>> +	/*
>> +	 * PMMIR.THWIDTH is readable and non-zero on aarch32, but it would be
>> +	 * impossible to write the threshold in the upper 32 bits of PMEVTYPER.
>> +	 */
>> +	if (IS_ENABLED(CONFIG_ARM))
>> +		return 0;
>> +
>> +	/*
>> +	 * The largest value that can be written to PMEVTYPER<n>_EL0.TH is
>> +	 * (2 ^ PMMIR.THWIDTH) - 1.
>> +	 */
>> +	return (1 << FIELD_GET(ARMV8_PMU_THWIDTH, cpu_pmu->reg_pmmir)) - 1;
>> +}
>> +
>> +static ssize_t threshold_max_show(struct device *dev,
>> +				  struct device_attribute *attr, char *page)
>> +{
>> +	struct pmu *pmu = dev_get_drvdata(dev);
>> +	struct arm_pmu *cpu_pmu = container_of(pmu, struct arm_pmu, pmu);
>> +
>> +	return sysfs_emit(page, "0x%08x\n", threshold_max(cpu_pmu));
>> +}
>> +
>> +static DEVICE_ATTR_RO(threshold_max);
>> +
>>  static struct attribute *armv8_pmuv3_caps_attrs[] = {
>>  	&dev_attr_slots.attr,
>>  	&dev_attr_bus_slots.attr,
>>  	&dev_attr_bus_width.attr,
>> +	&dev_attr_threshold_max.attr,
>>  	NULL,
>>  };
>>  
>> @@ -552,7 +615,7 @@ static void armv8pmu_write_counter(struct perf_event *event, u64 value)
>>  		armv8pmu_write_hw_counter(event, value);
>>  }
>>  
>> -static inline void armv8pmu_write_evtype(int idx, u32 val)
>> +static inline void armv8pmu_write_evtype(int idx, unsigned long val)
>>  {
>>  	u32 counter = ARMV8_IDX_TO_COUNTER(idx);
>>  	unsigned long mask = ARMV8_PMU_EVTYPE_EVENT |
>> @@ -921,6 +984,10 @@ static int armv8pmu_set_event_filter(struct hw_perf_event *event,
>>  				     struct perf_event_attr *attr)
>>  {
>>  	unsigned long config_base = 0;
>> +	struct perf_event *perf_event = container_of(attr, struct perf_event,
>> +						     attr);
>> +	struct arm_pmu *cpu_pmu = to_arm_pmu(perf_event->pmu);
>> +	u32 th, th_max;
>>  
>>  	if (attr->exclude_idle)
>>  		return -EPERM;
>> @@ -952,6 +1019,21 @@ static int armv8pmu_set_event_filter(struct hw_perf_event *event,
>>  	if (attr->exclude_user)
>>  		config_base |= ARMV8_PMU_EXCLUDE_EL0;
>>  
>> +	/*
>> +	 * Insert event counting threshold (FEAT_PMUv3_TH) values. If
>> +	 * FEAT_PMUv3_TH isn't implemented, then THWIDTH (threshold_max) will be
>> +	 * 0 and no values will be written.
>> +	 */
>> +	th_max = threshold_max(cpu_pmu);
>> +	if (IS_ENABLED(CONFIG_ARM64) && th_max) {
> 
> Why is the IS_ENABLED() check needed here?
> 

The FIELD_PREP() below would cause a compilation error on arm32 because
TH and TC are above 32 bits. I can add a comment.

>> +		th = min(armv8pmu_event_threshold(attr), th_max);
>> +		if (th) {
> 
> Why is it useful to take the minimum here? If userspace asks for a value
> bigger than the maximum support threshold, shouldn't we return an error
> rather than silently clamp it?
> 

I think it probably was just so I didn't have to think about what would
happen when the value varied between cores.

But you're right, it looks like I can add a validation function to
struct arm_pmu and call it from armpmu_event_init(). armpmu->map_event()
and armpmu->set_event_filter() are already called from there so I think
the validation could technically be added to one of those, but that's
probably a bit hacky. I don't know if you have any preference for where
the threshold validation should happen?

>> +			config_base |= FIELD_PREP(ARMV8_PMU_EVTYPE_TH, th);
>> +			config_base |= FIELD_PREP(ARMV8_PMU_EVTYPE_TC,
>> +						  armv8pmu_event_threshold_control(attr));
>> +		}
>> +	}
>> +
>>  	/*
>>  	 * Install the filter into config_base as this is used to
>>  	 * construct the event type.
>> diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
>> index ddd1fec86739..ccbc0f9a74d8 100644
>> --- a/include/linux/perf/arm_pmuv3.h
>> +++ b/include/linux/perf/arm_pmuv3.h
>> @@ -258,6 +258,7 @@
>>  #define ARMV8_PMU_BUS_SLOTS_MASK 0xff
>>  #define ARMV8_PMU_BUS_WIDTH_SHIFT 16
>>  #define ARMV8_PMU_BUS_WIDTH_MASK 0xf
>> +#define ARMV8_PMU_THWIDTH GENMASK(23, 20)
> 
> It's a bit messy having a mixture of GENMASK and MASK/SHIFT pairs. Please
> can you either update what's there to use GENMASK, or use SHIFT/MASK for the
> new addition?
> 
> Will
> 

Yep will do. Thanks for the review.

James

