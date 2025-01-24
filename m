Return-Path: <linux-doc+bounces-36051-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AD7A1B447
	for <lists+linux-doc@lfdr.de>; Fri, 24 Jan 2025 11:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B63763A14FF
	for <lists+linux-doc@lfdr.de>; Fri, 24 Jan 2025 10:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC22A219A90;
	Fri, 24 Jan 2025 10:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NVpCoCct"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEDC1D45FE
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 10:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737716309; cv=none; b=eSiHBfgghuWunw6gS8imXJ6Gzns+8XSebVFH2VAxuA6AfNzwOLeQ/Qvbalj1elMqEDYYO8ttiiP9mCT8s+B+P2qQJj4w2MvarY3zIRxYQQNsv58rT8IY3i8JioNspClOgHU/mS+dQuhOC1YVX+SYD/QjiTWNLaM5oyYNI6XI12A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737716309; c=relaxed/simple;
	bh=sbEBeAA4tFoSk+b62opzzrzqZXSAeiZClFCJpKPq2ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JfN4YKWJdyWW5Ru0MmMjlYsQJ9V7IQwlrElpyneX7KMbhMkOQFt97hCFeGCI4OMDNKAo2AoU0SX5m65DKyHwoCfP4VsiVewLV9h/bcxLJl6wTKJGnotnLOaxgCTGr2u6Yjdau8KycwnhYoAPzVPe3M+whzDvFcDOdNEvVpFIwls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NVpCoCct; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21644db9f3cso4404605ad.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 02:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737716307; x=1738321107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pda3ELabzjHMCz9NofWB5XWgpAksp0H0JyV9tun2x64=;
        b=NVpCoCcthWlbgojWasR/lX+XkQXJeE9Ecte0blStMKqTOVLhobOejMdyUuN//obWOS
         RGhhfMvSLzKGqA3rJoTTUDRAabJq0hH7JZ3O/7dmCp81uOQcMVLnZ78EdpLkP97plfwo
         FxJwC0/3rvFE3IQ4ThM9brQv+xQCt9HM065LKZMmonL09EkDKeRhX5Q+envXQ2YN1v/q
         yhGVo8ppAQDPHayB2MmGJEschHPZy7UtRfAvmo7rJzghjfNpr5dgfKEw4Qf3BOiUgVRO
         YBTT8GDa9TA/Ahr17TZtZKsX56JrRAGhuRc1yQyhGy5I+LiDfVZg8rIeWr8AL9NELIsx
         CC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716307; x=1738321107;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pda3ELabzjHMCz9NofWB5XWgpAksp0H0JyV9tun2x64=;
        b=RDpkLpc7wTwWu/TcAd4vd1AldzNUU2QqcqLQgItS37KoSpf7CkOmDG05CZK9KFcdaj
         QfMTT+ISZvWVJIqBfSsWNIhhQNNft4QcsfGqUQlZpqZ61oFNO99b0MY2U8fg3QYLrM2A
         2+UjiIP/gK5mNuTN2YUALzkNKnDtIt02OuIIEjzROa6Af4fd043wNh8LvGiFCZbGifdS
         ioGhrXGEZoISTJRudFoBNYgwvkTmv0lm3HSSlGkuYJGis51lcMLG/jFhzeLi23auvQM8
         Rv3JZRsW+3oj6ByF/in4lM5/gQrhLC9B12AqW4d6OOKx5o/t7p9m7pgra47sT5Ryv/Ax
         ZYww==
X-Forwarded-Encrypted: i=1; AJvYcCUNOLKm35jupGF1PGAz/Jafwp6pL6MWxHTE7sTRaVzqKFw3ajATd4/sM4ln8BehfGHGFofwvIbt818=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO495z8bQoGA+wCx6KcUplnpVRd9P3DuUiGE46n7hHgl/wRGQs
	FnPRN4Auv9oAtn1K+5Kpdk375hKQw/jSI1IYRjcR2mfQ0lYg9iagiBZQ77tUlYQ=
X-Gm-Gg: ASbGncsbtroKuLHtz/ZDDaaagbBJYpP2H2yOCOUJIyTXr9L797Bx2nixmM0AKghztrc
	nHNVGdm7yS7lBUYCXByoqQwDnGkuV2pUqaVzNyyn83SsDfx09rxmE9yTpFEBT6vDcJUTrQd1rOD
	q3fqG576t9Kx7SwBpIYww1sI4MicvhJ19kaVqayiqBzsBd3nWKKh5RMOINB4SEZWxKlYj4l5G5t
	e5eAeSz9/lS5TqtBndHV7L/vJ4umbBmzEcBrVQDZQkbGVWWbYtpS2h3ZHQ5ofavF0iU7LTQOoKM
	RA5i1ZNEZMKauy+ZCOho1Fo4uqicdQ==
X-Google-Smtp-Source: AGHT+IFPPAFtKUdWUrQ1fZ9ztKOZDVBkhLa1n4uWXAzzo9DG3Aj4Kym2pHd3B4/CvxBQ8m2/WgEEgQ==
X-Received: by 2002:a17:902:d4c3:b0:21b:d105:26ca with SMTP id d9443c01a7336-21c35560010mr170856325ad.4.1737716307400;
        Fri, 24 Jan 2025 02:58:27 -0800 (PST)
Received: from [10.254.144.106] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9dedcsm13807185ad.46.2025.01.24.02.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 02:58:26 -0800 (PST)
Message-ID: <2824d739-235d-46d5-8559-aa3f374bccbe@bytedance.com>
Date: Fri, 24 Jan 2025 18:58:17 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] cgroup/rstat: Fix forceidle time in cpu.stat
Content-Language: en-US
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
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
References: <20250123174713.25570-1-wuyun.abel@bytedance.com>
 <20250123174713.25570-2-wuyun.abel@bytedance.com>
 <cf5k7vmtqa2a5e6haxghvsolnydaczrz5n3bkluttmula5s35y@z35txmj4bxsb>
 <a7a24c05-87ca-49d1-9fa3-be4c3555e238@bytedance.com>
 <amw4ehhgqglvym6u4bkht2fcrxfzcwcyh4eeju3m3a3icnscxa@qx5ntsgw3y3c>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <amw4ehhgqglvym6u4bkht2fcrxfzcwcyh4eeju3m3a3icnscxa@qx5ntsgw3y3c>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/24/25 6:39 PM, Michal Koutný Wrote:
> On Fri, Jan 24, 2025 at 05:58:26PM +0800, Abel Wu <wuyun.abel@bytedance.com> wrote:
>> The following hunk deleted the snapshot of cgrp->bstat.forceidle_sum:
> 
> But there's no such hunk in your PATCH 1/3 :-o

  	if (cgroup_parent(cgrp)) {
  		cgroup_rstat_flush_hold(cgrp);
-		usage = cgrp->bstat.cputime.sum_exec_runtime;
+		bstat = cgrp->bstat;
  		cputime_adjust(&cgrp->bstat.cputime, &cgrp->prev_cputime,
-			       &utime, &stime);
-		ntime = cgrp->bstat.ntime;
+			       &bstat.cputime.utime, &bstat.cputime.stime);
  		cgroup_rstat_flush_release(cgrp);
  	} else {

Because @bstat takes a full snapshot of @cgrp->bstat which contains
forceidle time. I think the lack of readability is the reason why
TJ doesn't like this :(

