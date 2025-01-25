Return-Path: <linux-doc+bounces-36124-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E3A1C0FA
	for <lists+linux-doc@lfdr.de>; Sat, 25 Jan 2025 05:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A0C43A8715
	for <lists+linux-doc@lfdr.de>; Sat, 25 Jan 2025 04:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E3A146A7A;
	Sat, 25 Jan 2025 04:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="eqrcObbZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C082063FA
	for <linux-doc@vger.kernel.org>; Sat, 25 Jan 2025 04:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737780893; cv=none; b=sMIn+Y1aNl/OHIgj1Ix2BhR0zoNZikHfHDN4xilCLcO1pY5dNnV6diPZPa0oUdEeTGDaE4IYToSnlu/ZhXcCb7y/sfyw+H5L0VOIJ/rS7/k/kxk12KubYNtjbs/mnPQIci9ExtyHW5aHduwgCoHCYkCdy/WVMpc2uWBw81JCzk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737780893; c=relaxed/simple;
	bh=99zIExNxV8TToDSVXEOlJWH3cgVLTzynrGOeD2kxGAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=atBO0GbQqXbOlFvpR3mQ1lCBd13gkacX2XjhuFV5wOBrZd3+IqKNcilPegFzUEv7pQQllRfsi4bZzwG+I/aRoMZy2gS/cSG0uADmHVKjUjSEgi7rvYkbRbAR+SgHdtPKPb7hSpx/XOZll67kHvChF/7vrgKImUGUguZgGoGnLd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=eqrcObbZ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f45526dea0so626463a91.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 20:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737780891; x=1738385691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcNgN6gZIcmY//g8EryXMm8MjUwB/SDjbpwyh5XT/f4=;
        b=eqrcObbZEOhbJLf1ghTPego94RSfzfsVT5r7qwa/9voiUU7b+PJYAXNsXzpGBGjNu/
         odoV5Xu+W7FLoesTzAXcqcv7PZsAf6yAwrxqUlVq32AjCvXeQhFliAAj4ecTmBur9iY3
         avY5PSrlt8poQkPB6UdoJTS6aGGHzO5KjdrI3OA+aX8JXjwTVIyugirjEaYI6+PvK+Ye
         MEJj23uyGDkCpJELCPWdo+sqTtCOZBW2FkeSeC2rEMEqTRlGGAPCOYjA8CaMjAn3REPG
         6d99nc/kjmynvP5QsTKKNuPnyFh7PGh2X92ND4m1zqx8Wh814hSZRiUE+TvunqgFURhL
         8SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737780891; x=1738385691;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YcNgN6gZIcmY//g8EryXMm8MjUwB/SDjbpwyh5XT/f4=;
        b=aeZN4lBRNvfbaVgDZhYr1CUwnSJLZn+Z7hdPJBtbZ6tXlQz0cQDR1WQCzYA2qljQl0
         5M9TopJM3GM8ZH9yf47ESPJU0lrr/6WAvssDeW/WFhJ/RRhoHXXbjzbzdihYoI/FAsvW
         T/VQ0WO5qsV5My3gYGJspgBwmH0cMHpLsfSzOof7MYevfNUfB4B8yqLGByBxWVACkqGB
         ImLAyot/JamN70lv4qYzc4jvj9DH0ucMMyMYlImO6LLHZAG7a4Ue93hk7m7JOmDYiacS
         qVojBagKPs0l8KSiUesecJgHkbHLUjeRJI6VXzLRlCFjhOmxkYvl7EcnOOw3GTO6EFLR
         ct1w==
X-Forwarded-Encrypted: i=1; AJvYcCXIl9sIAs7v1QzKYz+FUZtqt+D4uVbfrL+gHtY49TFqawscBjDE0LANf0Avi8MF61Hm/zN+h/K5Kao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ5/QEp6nR87EqOZrYY4oGnGZK74lBf5z4YOKzGs+Ib0ok+S6A
	k8+wtfIYfpydeHqtnu7e/oCmDheMNDiC1KuovZQ9EdWMSuLr7rHqYEnlEUDU5eg=
X-Gm-Gg: ASbGnctfKOPQX6DQYRm+SWJKDZ3Sk4scnMC6rF1pTf7bpKqcxUeAuwqtxh0fzK5jRbn
	2xTv9lXDu4ZR7pDn6ASp0jggPCB1Z3XTNEzv91Dtq6Afdd3/Gqbog5VB72O32eTmfK3U63newjH
	PDl0E1/PVUGvIwH3ft1VP1TeD1nPLMTXhykLiaZP6kD+ZkkxrHjHjb2DE52nvElLMjJalI9GelO
	wqvUXKmXo5ixHOg5mKuAJDMq/HW6uilt5FKWnt7gfjBZSVHh2h+XBudSThYSvUYIigucaBmlHeH
	FyLKwdtE4ZX5fSqwymbsMigupyqg6A==
X-Google-Smtp-Source: AGHT+IEGD3EkTIh6y8VfxvJvDoX08GEOp3byEl8/0wwfQdu/2ISPUjOo35Ke9spLN4IHxZe/yYhQkw==
X-Received: by 2002:a05:6a20:12cd:b0:1cf:4845:67f with SMTP id adf61e73a8af0-1eb216879bbmr19531476637.9.1737780891383;
        Fri, 24 Jan 2025 20:54:51 -0800 (PST)
Received: from [10.254.144.106] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b47f5sm2825005b3a.70.2025.01.24.20.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 20:54:50 -0800 (PST)
Message-ID: <5b71f446-8a83-46e1-9e28-fb5f90f78793@bytedance.com>
Date: Sat, 25 Jan 2025 12:54:42 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: Re: [PATCH 1/3] cgroup/rstat: Fix forceidle time in cpu.stat
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>
Cc: chenridong <chenridong@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Yury Norov <yury.norov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bitao Hu
 <yaoma@linux.alibaba.com>,
 "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250123174713.25570-1-wuyun.abel@bytedance.com>
 <20250123174713.25570-2-wuyun.abel@bytedance.com>
 <853d2669-e05b-435e-9ac1-86311ead56e5@huawei.com>
 <2bba87cf-69aa-4fac-ae1a-c50e2f376e2a@bytedance.com>
 <Z5Qm9aXwZhwjBEfy@slm.duckdns.org>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <Z5Qm9aXwZhwjBEfy@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/25/25 7:49 AM, Tejun Heo Wrote:
> On Fri, Jan 24, 2025 at 03:49:16PM +0800, Abel Wu wrote:
> ...
>>>> --- a/kernel/cgroup/rstat.c
>>>> +++ b/kernel/cgroup/rstat.c
>>>> @@ -613,36 +613,33 @@ static void cgroup_force_idle_show(struct seq_file *seq, struct cgroup_base_stat
>>>>    void cgroup_base_stat_cputime_show(struct seq_file *seq)
>>>>    {
>>>>    	struct cgroup *cgrp = seq_css(seq)->cgroup;
>>>> -	u64 usage, utime, stime, ntime;
>>>> +	struct cgroup_base_stat bstat;
>>>>    	if (cgroup_parent(cgrp)) {
>>>>    		cgroup_rstat_flush_hold(cgrp);
>>>> -		usage = cgrp->bstat.cputime.sum_exec_runtime;
>>>> +		bstat = cgrp->bstat;
>>>
>>> Thank you for finding that.
>>> In my version 2, I used to assign cgrp->bstat to bstat.
>>> This is Tj's comment:
>>> https://lore.kernel.org/linux-kernel/ZoQ2ti7nnz9EJSc3@slm.duckdns.org/
> 
> I wasn't saying that memcpy() should be used instead of assignment. I was
> saying that if a non-trivial struct can be pointed to instead of being
> copied, it should be pointed to. If all the fields need to be snapshotted,
> assigning is fine.

Thanks for your clarification, Tejun. I will post v2 to address Michal's
comments.

Best Regards,
	Abel


