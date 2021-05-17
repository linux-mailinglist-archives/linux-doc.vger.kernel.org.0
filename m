Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF68F3834A6
	for <lists+linux-doc@lfdr.de>; Mon, 17 May 2021 17:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242264AbhEQPLK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 May 2021 11:11:10 -0400
Received: from foss.arm.com ([217.140.110.172]:54816 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242655AbhEQPH2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 May 2021 11:07:28 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7BE1106F;
        Mon, 17 May 2021 08:06:11 -0700 (PDT)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54DEE3F73B;
        Mon, 17 May 2021 08:06:10 -0700 (PDT)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Beata Michalska <beata.michalska@arm.com>
Cc:     linux-kernel@vger.kernel.org, peterz@infradead.org,
        mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        corbet@lwn.net, rdunlap@infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] sched/topology: Rework CPU capacity asymmetry detection
In-Reply-To: <20210517131816.GA13965@e120325.cambridge.arm.com>
References: <1621239831-5870-1-git-send-email-beata.michalska@arm.com> <1621239831-5870-3-git-send-email-beata.michalska@arm.com> <87mtst1s8m.mognet@arm.com> <20210517131816.GA13965@e120325.cambridge.arm.com>
Date:   Mon, 17 May 2021 16:06:05 +0100
Message-ID: <87k0nx1jtu.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17/05/21 14:18, Beata Michalska wrote:
> On Mon, May 17, 2021 at 01:04:25PM +0100, Valentin Schneider wrote:
>> On 17/05/21 09:23, Beata Michalska wrote:
>> > +static void asym_cpu_capacity_scan(const struct cpumask *cpu_map)
>> > +{
>> > +	struct asym_cap_data *entry, *next;
>> > +	int cpu;
>> >
>> > -		for_each_sd_topology(tl) {
>> > -			if (tl_id < asym_level)
>> > -				goto next_level;
>> > +	if (!list_empty(&asym_cap_list))
>> > +		list_for_each_entry(entry, &asym_cap_list, link)
>> > +			cpumask_clear(entry->cpu_mask);
>> >
>>
>> The topology isn't going to change between domain rebuilds, so why
>> recompute the masks? The sched_domain spans are already masked by cpu_map,
>> so no need to do this masking twice. I'm thinking this scan should be done
>> once against the cpu_possible_mask - kinda like sched_init_numa() done once
>> against the possible nodes.
>>
> This is currently done, as what you have mentioned earlier, the tl->mask
> may contain CPUs that are not 'available'. So it makes sure that the masks
> kept on  the list are representing only those CPUs that are online.
> And it is also needed case all CPUs of given capacity go offline - not to to
> lose the full asymmetry that might change because of that ( empty masks are
> being removed from the list).
>
> I could change that and use the CPU mask that represents the online CPUs as
> a checkpoint but then it also means additional tracking which items on the
> list are actually available at a given point of time.
> So if the CPUs masks on the list are to be set once (as you are suggesting)
> than it needs additional logic to count the number of available capacities
> to decide whether there is a full asymmetry or not.
>

That should be doable by counting non-empty intersections between each
entry->cpumask and the cpu_online_mask in _classify().

That said I'm afraid cpufreq module loading forces us to dynamically update
those masks, as you've done. The first domain build could see asymmetry
without cpufreq loaded, and a later one with cpufreq loaded would need an
update. Conversely, as much of a fringe case as it is, we'd have to cope
with the cpufreq module being unloaded later on...

:(
