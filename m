Return-Path: <linux-doc+bounces-37886-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD7A329A5
	for <lists+linux-doc@lfdr.de>; Wed, 12 Feb 2025 16:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB4317A0533
	for <lists+linux-doc@lfdr.de>; Wed, 12 Feb 2025 15:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FB4211466;
	Wed, 12 Feb 2025 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QtiL1o5f"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0D22116FC
	for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2025 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739373306; cv=none; b=Npdj3QjKfXa9A1B0ieMmyerbu88POXisat0BtE8cbKOy4RJsSMlBzyJQkJJB0cGIRmJhjkD50Q+sE3PdaEriplmlMYO3ZQHH2eaD0S6HlyUF8itwFeR0olcvkabR1RApT2TSDHaNAJRiMPsjW4V9+Z6N0gZrN5z2vbJ91mjKGxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739373306; c=relaxed/simple;
	bh=UKSI6EDytSdjdgykF5MQAulLMhQVp1al45tKOJnsdH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TPIceKOYpCMAM57V4nKuIrJlubkcqavnRNOyy82CAnFCgCqJu+w0q6X+TVcZjUqEt5TfzixGCEdpHcN1J4rp5VXplJkXeYzNPAwhr/uHe5c8L+O7fP6XBJGUb+kAMRT6tS2+xGG5zuEK4zf+PJYD4b4E0MXGpWJ3LCE8aAeqlqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QtiL1o5f; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21fa8ca8eedso6846385ad.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Feb 2025 07:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739373304; x=1739978104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljlNJ9UmDZpoTWF1Xq95Z534XH7s9JC+28dFI3VXtdY=;
        b=QtiL1o5fqu/nFwGQkhRUAbMFBMr2j7j+IJMele+Y/ilWf46h53pfx/2CBq/OskzUEX
         mDk6n4g+gG8XUFPYCcxRT1K2o9Tt/CYGha8v5RU6VBpL9CYt9fz4qh8ukfHgsYDvhpNs
         YS1fhaAdnxzLPmWTsBQFwg/ZSn81YY2to/J1WyWxCbGLaUH+Ahl8wMbiE0DzMrgqMeD6
         aGDWSgVhTcBppWgvKsa7a/T/vVXhVbI1OtDYMqDFXUKeMY2uSrtaNQjsucqOZgvS2l4j
         GlQapwQ58YJRg1CGPhjMszqS0876cbX9GNA2HPgyzu/Hm+6E3/kZ5DrQ8Evu1RhZ5cgt
         Ce5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739373304; x=1739978104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljlNJ9UmDZpoTWF1Xq95Z534XH7s9JC+28dFI3VXtdY=;
        b=ZP7mck7M3hRx+o6VrAgcQNbpvPjXokIniT2+0jwbc8ojvxJdPAbXxVWB1IaISkpb2e
         Gz4a3pzZpC3xNMRwX0UMvw5vcFj4Byz3fEFOG1PxMm35812fwvmr1ty73QXpsybloG6r
         8FLyrlWUsyWYs915vmEx2WkUTLTYZBq1RBZMjtYzVB6geNapy33Yf25Q5v+JafcHEaOY
         F0aKdeYPJAXQBixz25+rPtqzUKgimqJ2MLuISK0JZBiKzGxtmxlc1eTNbTp4d1L26R5H
         4ZpEa4NDz8qkfpeovxF2Y4+O1YJcRkXUyvhR40zVlgG7zo1IvAd4dIoCB9l2LhWxlHht
         JttQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5Hgbl4YGRwyM4wkF1AZdy/YQt/hkDXC0eIrjALfYlFsywQfQdTjfrnyG3GdTK9jeUWVKidc8RfBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTBoisCNXdIwOBcLRQ0MCRFy+Og+kkKSV1mTaPPUpZM3mSTgGq
	8EOYITInwun0abN7yK7ocWP1lZ9wKg0MkGRAu61fD0UIManfNU61ps3ElaenyA0=
X-Gm-Gg: ASbGnctRiYU88VNJnmMprIm2sb6k7fV4afqYjgHTQ2Mqm7cCMbLqyOZAvexuQ+E3tjn
	qLDjLvdw7XmbvlIzw8a5RFhkR/KH4AsBpKAAmEjRVluRMsxhzsbVXte/QzDLPFoyHn32m+aduLM
	VNAJiMNta4/ookcaygUIoi2vwDr7bDGtCsazKv3zDK29GZ9O66EcsR7S81iOIk5nutTRS1i1HPJ
	Ax0n+6xgKOtkAUN8OmLDsc06p1YuY773GKPJS6sYnXu+1eKYNEcBjtVlwXje5biuIRkKLIcQHo+
	gAXCfbwzBk1ihMOP0dsFjEjuGA7La400yUbM
X-Google-Smtp-Source: AGHT+IGMKZH7Pjm+B4qQMXXr8SYftdRnx3TSgwBf542/KSP2GU0FH9uQfkBy0KRoBLo407PBjmHRWg==
X-Received: by 2002:a05:6a21:a46:b0:1ea:e7be:ff07 with SMTP id adf61e73a8af0-1ee5cd189aamr2473323637.6.1739373304086;
        Wed, 12 Feb 2025 07:15:04 -0800 (PST)
Received: from [10.4.234.23] ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ad2809sm11229424b3a.58.2025.02.12.07.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 07:15:03 -0800 (PST)
Message-ID: <b4ae80bf-36b4-4f31-96ad-6876372c91a2@bytedance.com>
Date: Wed, 12 Feb 2025 23:14:53 +0800
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
To: Tejun Heo <tj@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
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
 <Z6onPMIxS0ixXxj9@slm.duckdns.org>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <Z6onPMIxS0ixXxj9@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/11/25 12:20 AM, Tejun Heo Wrote:
> On Mon, Feb 10, 2025 at 04:38:56PM +0100, Michal Koutný wrote:
> ...
>> The challenge is with nr (assuming they're all runnable during Δt), that
>> would need to be sampled from /sys/kernel/debug/sched/debug. But then
>> you can get whatever load for individual cfs_rqs from there. Hm, does it
>> even make sense to add up run_delays from different CPUs?
> 
> The difficulty in aggregating across CPUs is why some and full pressures are
> defined the way they are. Ideally, we'd want full distribution of stall
> states across CPUs but both aggregation and presentation become challenging,
> so some/full provide the two extremes. Sum of all cpu_delay adds more
> incomplete signal on top. I don't know how useful it'd be. At meta, we
> depend on PSI a lot when investigating resource problems and we've never
> felt the need for the sum time, so that's one data point with the caveat
> that usually our focus is on mem and io pressures where some and full
> pressure metrics usually seem to provide sufficient information.

It's interesting, as we also find that PSI is of great useful in memory
and io and never thought of aggregating them across CPUs. With my limited
knowledge, I guess it's because they have shared global bottleneck. F.e.
a shortage of memory will put all the tasks of that memcg in same situation
no matter which cpu they are running on. And the io issues are generally
caused by legacy backends which have poor performance, that is lower speed
or less hwqueues, so still contend with each other outside the scope of
cpus. While the scheduling is different, some cpus can be much contended
than others due to affinity constrains or something else, since different
cpus have separated bandwidth.

> 
> As the picture provided by some and full metrics is incomplete, I can
> imagine adding the sum being useful. That said, it'd help if Able can
> provide more concrete examples on it being useful. Another thing to consider
> is whether we should add this across resources monitored by PSI - cpu, mem
> and io.

Please check my last reply to see our usecase, and it would be appreciated
if you can shed some light on it.

Thanks & Best Regards,
	Abel


