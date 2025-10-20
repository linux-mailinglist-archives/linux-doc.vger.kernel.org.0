Return-Path: <linux-doc+bounces-63933-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D6BF3588
	for <lists+linux-doc@lfdr.de>; Mon, 20 Oct 2025 22:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E7C8A350C34
	for <lists+linux-doc@lfdr.de>; Mon, 20 Oct 2025 20:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1D62D6400;
	Mon, 20 Oct 2025 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ew38WnhZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0089207A32
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 20:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991243; cv=none; b=HnyOfX/8QVZolLA0mTG4UmHCSoXTDoS8Gw4549PsK9fSOZgS3BxcynQnM0pvFcf0bZ8+0Z5/DT/AdPMYnhgOEbMndIgC9fTowMkrsLcd//4jiIPewLrpUcQSmI8l+f83qpjcaxoZx3xFEf+21mnzDTuVACqt0yUUgsgf4FQVcWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991243; c=relaxed/simple;
	bh=5fLzEqK5A2hwmmwREI+Kllkw/W/iw9u+5J8DZTvuVl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8treM5XsyhSnw1uAnQworhLLqD4JOmKgNVfv/qBjpyjPUMcogQAaePaZYyzyQAzsKPf98gl70wE7tVu0bix9kD8Q+0LkfMTh7WFd7QOwv2G6OOfzt3leeiQM/+OCYsKIgxV2XyenBv9OL9VE2y5EzODnpaQGa46/NglyNXfsts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ew38WnhZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760991240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2T0NyN+YGFi4g6i2WG6cBJeSzKhwHk280K4nlQEhRCo=;
	b=ew38WnhZBSFDiCAKiIwpNbjQy3VGecyF3YhrgyhqpgG28gosm0fTIMG4oxAc/bI8BY5Xjq
	RQ2NcEp3JOmBOSw6inavHpk3nqajSWnXJlIRpm80DADaEj1X2stqj+8g4nN8Hz6GG1ePD4
	w7IduZ4NJPSw6OG5gdY14o4ogsJlJGY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-euyVmB3HNzW7c8JrqBwvRQ-1; Mon, 20 Oct 2025 16:13:59 -0400
X-MC-Unique: euyVmB3HNzW7c8JrqBwvRQ-1
X-Mimecast-MFC-AGG-ID: euyVmB3HNzW7c8JrqBwvRQ_1760991238
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-471001b980eso29329445e9.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 13:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991238; x=1761596038;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2T0NyN+YGFi4g6i2WG6cBJeSzKhwHk280K4nlQEhRCo=;
        b=RMVZfog4nBI1hxjPhyGz02lpDf6nTZXVUSFiYOGV6zUisnW8NxJF5GPrrANpX88d/j
         3L4xrYGbp2GGoL8XEt//eiRD5rhaBcpRBE1JBxfVlD/L2fW/EsPFCpE+86h1ZuJcYCem
         eQt795rB4ciLfngmwRIdapquHBLNnMyo2l84Cwmd2ea0bnVDN58g9tyoVOYnFC4HKI85
         6RnrfqBLK/vkVITFcuKEGb3FT6H96qUdTJufoV5YkObXSPIAL4e5dw4L+eCi133Ns50c
         FfKlIVit3MwNtaB7Dp2Mp50UbjySg9cM5s1VyjRzWUu9lvfN2Y4rRhBvKQPU98KyQ0NC
         a4ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVYFt/RaE8t1vYmfmtnbFDHeEpJ5GtgjFMLfME26ssjHHOBKF/C/jKhMkWozTJ/U3vKqKn2MhKg+mQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz2hmRtAkdPdlY+s+g8GhYIXRSgULncKSVsYwJxEq7YfOfDbtx
	A3GGHir5e+cibXdLc8kV5CK0xWbD2ljpj/SIkm3ZM4qfK5679BWsXIUZE+bHmEw/yoWdtyMAhSg
	T2AAMljhHeDoxR0Ltw1ky0yjowdR7NZcuk7vLot0AIYhOpcntitPeaVCHc+PErA==
X-Gm-Gg: ASbGncv0Gnh9K1fPt417FLy7PGLBkR0P5l0AYiEDnqHSZ+rRCL8KivCH8PquGThtJoR
	ruyLEDU0P7IWmNv9CHkbShMeVqgwRq3acPzAaTrN6V5ra4oWdlwqZ49VV9xW6Z1dq2DDcV7uS9H
	+SS1UvlAFIX/OEryAr4/XtGQerjB1j5jq2IKzzji+bvDm0USXB+F8xQBeKi2zErHlNhUUz63GPY
	oDCxPNWmJs0WLpReC5iCS6AJ+y8YvsSnqy7de32CW+MMlfc34yasI1RsU97H8eHrfIhSqKTJQGO
	MKyQ5ISP8oWWnEM6KepVFsJRQgp/oYvQXfIJwHnZvPSjIVZFjqlWeXwooiDOPumvJt1ngDoIcSE
	JLkuPVaFXKJ2HQkBhtSSv/QTRjsfKEfiNN72r5Mkp9PiJteveU5QZy+XXwRVVKwHClDAWJivzqU
	j+hJSJf9y8jhdw7vknNG6eOPAJnxw=
X-Received: by 2002:a05:600c:3e17:b0:46f:c576:189a with SMTP id 5b1f17b1804b1-4711791c3c3mr109408505e9.29.1760991238259;
        Mon, 20 Oct 2025 13:13:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8oQSLlrBWBrnXlJZdSNYWQiMF6x5Uvq9jFmOA2rBpFcRspl2TeLKhipWvEjNhrOkmji86Yg==
X-Received: by 2002:a05:600c:3e17:b0:46f:c576:189a with SMTP id 5b1f17b1804b1-4711791c3c3mr109408305e9.29.1760991237875;
        Mon, 20 Oct 2025 13:13:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce? (p200300d82f0cc200fa4ac4ff1b3221ce.dip0.t-ipconnect.de. [2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144239bdsm294773555e9.3.2025.10.20.13.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 13:13:57 -0700 (PDT)
Message-ID: <21ade241-76b9-4f0a-8e99-be033dcc882c@redhat.com>
Date: Mon, 20 Oct 2025 22:13:55 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sched/core: Enable full cpumask to clear user cpumask
 in sched_setaffinity()
To: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Nico Pache <npache@redhat.com>,
 Phil Auld <pauld@redhat.com>, John Coleman <jocolema@redhat.com>
References: <20250923175447.116782-1-longman@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250923175447.116782-1-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.09.25 19:54, Waiman Long wrote:
> Since commit 8f9ea86fdf99 ("sched: Always preserve the user requested
> cpumask"), user provided CPU affinity via sched_setaffinity(2) is
> perserved even if the task is being moved to a different cpuset.
> However, that affinity is also being inherited by any subsequently
> created child processes which may not want or be aware of that affinity.

So I assume setting the affinity to the full bitmap would then allow any 
child to essentially reset to the default, correct?

> 
> One way to solve this problem is to provide a way to back off from
> that user provided CPU affinity.  This patch implements such a scheme
> by using a full cpumask (a cpumask with all bits set) to signal the
> clearing of the user cpumask to follow the default as allowed by
> the current cpuset.  In fact, with a full cpumask in user_cpus_ptr,
> the task behavior should be the same as with a NULL user_cpus_ptr.
> This patch just formalizes it without causing any incompatibility and
> discard an otherwise useless cpumask.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   kernel/sched/syscalls.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
> index 77ae87f36e84..d68c7a4ee525 100644
> --- a/kernel/sched/syscalls.c
> +++ b/kernel/sched/syscalls.c
> @@ -1229,14 +1229,22 @@ long sched_setaffinity(pid_t pid, const struct cpumask *in_mask)
>   		return retval;
>   
>   	/*
> -	 * With non-SMP configs, user_cpus_ptr/user_mask isn't used and
> -	 * alloc_user_cpus_ptr() returns NULL.
> +	 * If a full cpumask is passed in, clear user_cpus_ptr and reset the
> +	 * current cpu affinity to the default for the current cpuset.
>   	 */
> -	user_mask = alloc_user_cpus_ptr(NUMA_NO_NODE);
> -	if (user_mask) {
> -		cpumask_copy(user_mask, in_mask);
> +	if (cpumask_full(in_mask)) {
> +		user_mask = NULL;
>   	} else {
> -		return -ENOMEM;
> +		/*
> +		 * With non-SMP configs, user_cpus_ptr/user_mask isn't used and
> +		 * alloc_user_cpus_ptr() returns NULL.
> +		 */
> +		user_mask = alloc_user_cpus_ptr(NUMA_NO_NODE);
> +		if (user_mask) {
> +			cpumask_copy(user_mask, in_mask);
> +		} else {
> +			return -ENOMEM;
> +		}
>   	}
>   
>   	ac = (struct affinity_context){

Not an expert on this code.

I'm only wondering if there is somehow, some way we could be breaking 
user space by doing that.


-- 
Cheers

David / dhildenb


