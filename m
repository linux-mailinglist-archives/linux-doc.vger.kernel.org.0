Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3EAE39141A
	for <lists+linux-doc@lfdr.de>; Wed, 26 May 2021 11:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbhEZJyA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 26 May 2021 05:54:00 -0400
Received: from foss.arm.com ([217.140.110.172]:42336 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233288AbhEZJyA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 May 2021 05:54:00 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 983A01516;
        Wed, 26 May 2021 02:52:28 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B430D3F73B;
        Wed, 26 May 2021 02:52:26 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] sched/topology: Rework CPU capacity asymmetry
 detection
To:     Beata Michalska <beata.michalska@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>
Cc:     linux-kernel@vger.kernel.org, peterz@infradead.org,
        mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, corbet@lwn.net, rdunlap@infradead.org,
        linux-doc@vger.kernel.org
References: <20210524101617.8965-1-beata.michalska@arm.com>
 <20210524101617.8965-3-beata.michalska@arm.com> <87fsyc6mfz.mognet@arm.com>
 <20210524225508.GA14880@e120325.cambridge.arm.com>
 <87a6oj6sxo.mognet@arm.com>
 <20210525102945.GA24210@e120325.cambridge.arm.com>
From:   Dietmar Eggemann <dietmar.eggemann@arm.com>
Message-ID: <98ad8837-b9b8-ff50-5a91-8d5951ee757c@arm.com>
Date:   Wed, 26 May 2021 11:52:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525102945.GA24210@e120325.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 25/05/2021 12:29, Beata Michalska wrote:
> On Tue, May 25, 2021 at 10:53:07AM +0100, Valentin Schneider wrote:
>> On 24/05/21 23:55, Beata Michalska wrote:
>>> On Mon, May 24, 2021 at 07:01:04PM +0100, Valentin Schneider wrote:
>>>> On 24/05/21 11:16, Beata Michalska wrote:

[...]

>>>>> +static inline int
>>>>> +asym_cpu_capacity_classify(struct sched_domain *sd,
>>>>> +			   const struct cpumask *cpu_map)
>>>>> +{
>>>>> +	int sd_asym_flags = SD_ASYM_CPUCAPACITY | SD_ASYM_CPUCAPACITY_FULL;
>>>>> +	struct asym_cap_data *entry;
>>>>> +	int asym_cap_count = 0;
>>>>> +
>>>>> +	if (list_is_singular(&asym_cap_list))
>>>>> +		goto leave;
>>>>> +
>>>>> +	list_for_each_entry(entry, &asym_cap_list, link) {
>>>>> +		if (cpumask_intersects(sched_domain_span(sd), entry->cpu_mask)) {
>>>>> +			++asym_cap_count;
>>>>> +		} else {
>>>>> +			/*
>>>>> +			 * CPUs with given capacity might be offline
>>>>> +			 * so make sure this is not the case
>>>>> +			 */
>>>>> +			if (cpumask_intersects(entry->cpu_mask, cpu_map)) {
>>>>> +				sd_asym_flags &= ~SD_ASYM_CPUCAPACITY_FULL;
>>>>> +				if (asym_cap_count > 1)
>>>>> +					break;
>>>>> +			}
>>>>
>>>> Readability nit: That could be made into an else if ().
>>> It could but then this way the -comment- gets more exposed.
>>> But that might be my personal perception so I can change that.
>>
>> As always those are quite subjective! Methink something like this would
>> still draw attention to the offline case:
>>
>>                /*
>>                 * Count how many unique capacities this domain covers. If a
>>                 * capacity isn't covered, we need to check if any CPU with
>>                 * that capacity is actually online, otherwise it can be
>>                 * ignored.
>>                 */
>>                 if (cpumask_intersects(sched_domain_span(sd), entry->cpu_mask)) {
>>                         ++asym_cap_count;
>>                 } else if (cpumask_intersects(entry->cpu_mask, cpu_map)) {
>>                         sd_asym_flags &= ~SD_ASYM_CPUCAPACITY_FULL;
>>                         if (asym_cap_count > 1)
>>                                 break;
>>                 }
> Noted.
> Will wait for some more comments before sending out 'polished' version.

For me asym_cpu_capacity_classify() is pretty hard to digest ;-) But I
wasn't able to break it. It also performs correctly on (non-existing SMT)
layer (with sd span eq. single CPU).

Something like this (separating asym_cap_list iteration and flags
construction would be easier for me. But like already said here,
it's subjective.
I left the two optimizations (list_is_singular(), break on asym_cap_count
> 1) out for now. asym_cap_list shouldn't have > 4 entries (;-)).

static inline int
asym_cpu_capacity_classify(struct sched_domain *sd, 
                           const struct cpumask *cpu_map)
{
        int sd_span_match = 0, cpu_map_match = 0, flags = 0; 
        struct asym_cap_data *entry;

        list_for_each_entry(entry, &asym_cap_list, link) {
                if (cpumask_intersects(sched_domain_span(sd), entry->cpu_mask))
                        ++sd_span_match;
                else if (cpumask_intersects(cpu_map, entry->cpu_mask))
                        ++cpu_map_match;
        }

        WARN_ON_ONCE(!sd_span_match);

        if (sd_span_match > 1) { 
                flags |= SD_ASYM_CPUCAPACITY;
                if (!cpu_map_match)
                        flags |= SD_ASYM_CPUCAPACITY_FULL;
        }

        return flags;
}

BTW, how would this mechanism behave on a system with SMT and asymmetric CPU
capacity? Something EAS wouldn't allow but I guess asym_cap_list will be
constructed and the SD_ASYM_CPUCAPACITY_XXX flags will be set?
