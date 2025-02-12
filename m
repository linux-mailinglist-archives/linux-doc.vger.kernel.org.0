Return-Path: <linux-doc+bounces-37889-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F55A329BC
	for <lists+linux-doc@lfdr.de>; Wed, 12 Feb 2025 16:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8752F7A128B
	for <lists+linux-doc@lfdr.de>; Wed, 12 Feb 2025 15:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD4E208983;
	Wed, 12 Feb 2025 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="VEXBTZb5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D604627183C
	for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2025 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739373451; cv=none; b=NTnqaP79G/DRypQmfA4s5r6J6n95hrfgyrlwzdm4v1YvGw9erA4tzw/YOSJgazwAznBEcoaDjmFIM9xwk2BnvMkT0xKB2tJLnnd3hUeGg73E/PiWwEjuT3FthH4Fbm/S9PnGdrb2hxkUHFAZa4GUJyUDpLQOW7Gj6kZ3P5CJzOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739373451; c=relaxed/simple;
	bh=uDCf5cSTeU5fMxoojUj0qD4NkNwcI1qy3O/oPBYOdVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujLf7ydyc09P8kHQYlFTXaJS7abPBQ8m6dGiaUmfLOypsVhxH4QAzZjVq88xNfwwmQTqBiH1fE1HzTTcLM3YzhTXFWRSgq2JivqdkJwJmZ9l6nz8xawUK2EvjZYj4TMFgWKSjfJ30/J8w3m5HFa+kQsmAvs9/EqFT5s6Hs05aq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=VEXBTZb5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f6fb68502so8928755ad.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2025 07:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739373449; x=1739978249; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j4Y5qtwiWWBCUuyHL6kUsNo5ULsNCnhaneGE9b6ZnxI=;
        b=VEXBTZb5Cw2hQwScsrvMOfAGQtVDNZO6ANxq62To2IQtKXlVxEDJ2dWnmfSCIJxAiq
         6ayn2baesmrN52JM1Rk85hHgRfYGaRAd2YqyWS/Crz5t50hMa5AjKGm756S6B28knvCn
         /hLVW4A0hAgmxPdC8XmNY1eDO6jDw/ZarmAKL5piKjOYBPv+BEyhOXj6DbHrpBlpY/0a
         rlTn5dFKyGDAY70Fu7YhF0nrDPn/jjmZfGTvsl3gxg6vq8i9J+qO/nIw68suzdVH5Ctm
         Ks1mDO4D4xft7re1sPkVv92Y0b16hn9DHcFpROHBZzxf0hym2CDUc31v3FYjeKD9ARBy
         Vkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739373449; x=1739978249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j4Y5qtwiWWBCUuyHL6kUsNo5ULsNCnhaneGE9b6ZnxI=;
        b=bGGFJee0KgVwLVYbss23rbl+0JbF4SE23lFHTjfCxIlxLCFZpo9JwTKKBVvxPJb5xi
         c0A1BLUpgjICCxFDi5TppoXt6l6py/l2HH6ht9f2LsJ0iHT+TP1MEmiWSKPN0ZbMePLl
         PfOlymgtOYg4xj2HTa0Bfhh8tp16+PnxuD4/EeySsysHdDRVkcwV+2EJwASVLH3Lt2Eq
         vbBYOrkqZafkckF1SXM06dJzFY5K56jpt4u6vWsRp/Rtw9N95nWE020pwPdji/rKZ6Le
         V22kHIIw6q1uQvHSaoAFYxJMsP0Ce1qJdT399MKIlDEiYSVzNKYueK211kKBxAcjlrHh
         pz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWm09rNninyNrAURnUKX9V6VNynMaDgi+1cqu/H8T5S3U2YyhbyXqRd0nEylZIEjI+iKmEKFNwwdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU+h7dI/tamPMLT6KRQV40vNKg9RS2wB79AqrQz//5EqM7a04j
	R1qGbrZ43Ga4t+PM7/ZNblF7BQTFnYisYZ5dZvvTVQLXh7zrHgaSltqYJHXanog=
X-Gm-Gg: ASbGncvmihle+bwvem+SPDbOBxdxHWCIoRDMjE+80QZ0ijibKkZ/SE2UAdBqQosFsjk
	Ftu+y67DQ7yLWxgDS2GnVUuk5S5upkSFlrFOqbMc2/UpCa7dS57yrZawcF594ECuRgCCTBr4uL9
	207EM4Ewv0qo5J174sRdDEKhQ6oZsL2k5llSEnnh/s4+BEr9q37+qoiDS0+vaphC1fnTC2HjH+k
	zwE5OimRSO8hVZY/cXylE2hnLRw9ghp3ycADJGZ2/ZCzI7/1RNNMKfefIFLCMXAJyCwcoYumcGM
	OFcvQMyw6aV0SgfhG9FRDW1n8AZV1O6X+F1g
X-Google-Smtp-Source: AGHT+IHSDBOUcY4DgChpk0VgGr5Q3FBvaJPNKMmexpCLPTtk05TaIQ9t4qmleE/HZFgIUTI1TQ/PFQ==
X-Received: by 2002:a05:6a21:e85:b0:1cf:34a9:63d2 with SMTP id adf61e73a8af0-1ee5cd41f1dmr2188229637.9.1739373449062;
        Wed, 12 Feb 2025 07:17:29 -0800 (PST)
Received: from [10.4.234.23] ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae7baasm11351432b3a.73.2025.02.12.07.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 07:17:28 -0800 (PST)
Message-ID: <83a9d6c0-47bd-4257-9162-a926c1ecd1d0@bytedance.com>
Date: Wed, 12 Feb 2025 23:17:19 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH v2 3/3] cgroup/rstat: Add run_delay accounting for
 cgroups
Content-Language: en-US
To: Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Yury Norov <yury.norov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bitao Hu
 <yaoma@linux.alibaba.com>, Chen Ridong <chenridong@huawei.com>,
 "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250125052521.19487-1-wuyun.abel@bytedance.com>
 <20250125052521.19487-4-wuyun.abel@bytedance.com>
 <3wqaz6jb74i2cdtvkv4isvhapiiqukyicuol76s66xwixlaz3c@qr6bva3wbxkx>
 <9515c474-366d-4692-91a7-a4c1a5fc18db@bytedance.com>
 <qt3qdbvmrqtbceeogo32bw2b7v5otc3q6gfh7vgsk4vrydcgix@33hepjadeyjb>
 <Z6onPMIxS0ixXxj9@slm.duckdns.org> <20250210182545.GA2484@cmpxchg.org>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <20250210182545.GA2484@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/11/25 2:25 AM, Johannes Weiner Wrote:
> On Mon, Feb 10, 2025 at 06:20:12AM -1000, Tejun Heo wrote:
>> On Mon, Feb 10, 2025 at 04:38:56PM +0100, Michal Koutný wrote:
>> ...
>>> The challenge is with nr (assuming they're all runnable during Δt), that
>>> would need to be sampled from /sys/kernel/debug/sched/debug. But then
>>> you can get whatever load for individual cfs_rqs from there. Hm, does it
>>> even make sense to add up run_delays from different CPUs?
>>
>> The difficulty in aggregating across CPUs is why some and full pressures are
>> defined the way they are. Ideally, we'd want full distribution of stall
>> states across CPUs but both aggregation and presentation become challenging,
>> so some/full provide the two extremes. Sum of all cpu_delay adds more
>> incomplete signal on top. I don't know how useful it'd be. At meta, we
>> depend on PSI a lot when investigating resource problems and we've never
>> felt the need for the sum time, so that's one data point with the caveat
>> that usually our focus is on mem and io pressures where some and full
>> pressure metrics usually seem to provide sufficient information.
>>
>> As the picture provided by some and full metrics is incomplete, I can
>> imagine adding the sum being useful. That said, it'd help if Able can
>> provide more concrete examples on it being useful. Another thing to consider
>> is whether we should add this across resources monitored by PSI - cpu, mem
>> and io.
> 
> Yes, a more detailed description of the usecase would be helpful.

Please check my last reply to see our usecase, and it would be appreciated
if you can shed some light on it.

> 
> I'm not exactly sure how the sum of wait times in a cgroup would be
> used to gauge load without taking available concurrency into account.
> One second of aggregate wait time means something very different if
> you have 200 cpus compared to if you have 2.

Indeed. So instead of comparing between different cgroups, we only
compare with the past for each cgroup we care about.

> 
> This is precisely what psi tries to capture. "Some" does provide group
> loading information in a sense, but it's a ratio over available
> concurrency, and currently capped at 100%. I.e. if you have N cpus,
> 100% some is "at least N threads waiting at all times." There is a
> gradient below that, but not above.
> 
> It's conceivable percentages over 100% might be useful, to capture the
> degree of contention beyond that. Although like Tejun says, we've not
> felt the need for that so far. Whether something is actionable or not
> tends to be in the 0-1 range, and beyond that it's just "all bad".

PSI is very useful and we heavily rely on it, especially for mem and
io. The reason of adding run_delay is try to find the piece lost by
cpu.some when <100%. Please check Michal's example.

> 
> High overload scenarios can also be gauged with tools like runqlat[1],
> which give a histogram over individual tasks' delays. We've used this
> one extensively to track down issues.
> 
> [1] https://github.com/iovisor/bcc/blob/master/tools/runqlat.py

Thanks for mentioning this, but I am not sure whether it is appropriate
to make it constantly enabled as we rely it to be realtime to trigger
throttling or eviction of certain jobs.

Thanks & Best Regards,
	Abel


