Return-Path: <linux-doc+bounces-36405-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F269A22974
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 09:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71C9D3A6A3A
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 08:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF411A8F82;
	Thu, 30 Jan 2025 08:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JlH6NiL1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A0A199924
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 08:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738224913; cv=none; b=Jy0JKOmNjp2wX7nwq0H/Q3snTXTFm0/5Uvj6rH2NOH0hlL4TJLP3HPQIwsfXjIZjr/C1/6mv4AeUSLqWFIHqDyhpiUMdeD96BBhFFZCYhAqeiGPg8azWu3wF7C7lkqr9H9kbJ4dAE9IBwvTu7Af8CadNJmSRSxBfzJcSj0aq9P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738224913; c=relaxed/simple;
	bh=KP3oV+9reynS+fHo+js2BMI/eMFWrdIW5NJ9OSJoOI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLIcj4bA/d/EH07ge9WXTGePH3gsYyN2FHdr+bMYCNx5Ss89uaAI/9y8rzIgS7mpuaqyXitiXkITwYqBJHQkFwfMniYQUILt8qKxDCceMeRnsb4pkvrTQm014eRy4Lst9B4LWtzWYfwupRdDBJW1TfKux0LcexgseuI5RhqxeBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JlH6NiL1; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab698eae2d9so110773966b.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 00:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738224910; x=1738829710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Yd9VP1y+BPQkS13xsK2KcWh5RNg6hbyGkYuynFoiXU=;
        b=JlH6NiL1sZoUYcjKoQgDR92iT4sv3G9TbTrsCrmeu0ySZ+hw7LU17OKYE1hCjELu/J
         0OxbT8Py2mps/c1YlaFAq9vYzjFo/hO0xjZVb4WxrpAiU1Tdndjew6xcbHvB4tId9KKQ
         fqUKdWDErf2x09X3535MpMie/iRTTzVWoj81/Ql05K3d5LKRFJVJRIWPHaY0f4YM6tDa
         sDK2HsC4dayjJv8JIiVlrqycARAk4PUlCtSEXXDeD4lShI0l9AN6Y1kO7JvtYsh3rG5H
         WrIVj82p46l7KeVN65Z4ozmK6N7z19IKWld8kOJKfmhI7nrs6zEiKvlriv7zsU5cpJ/Q
         bnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738224910; x=1738829710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Yd9VP1y+BPQkS13xsK2KcWh5RNg6hbyGkYuynFoiXU=;
        b=C0r9zK9JFwUoC5sW9fgckO2h08WRnkGvm5xeOl8Q1rSzLySZS95BQnh+Cj3shrlE2m
         ETx9wRlMBsFRxNhyW06OqLigVq++EQIi0WoukjZcaFdDpzpZdu20A1SuO+xsNgn0p0H+
         Y7kLdm30WtSc/TDWBuObaXc8g8RJTY6SgTrRP4AtFu75VvdHcx2qYmdoGpPTsW0bkutZ
         PrcPlQrP9Xq7enqIJeBT2x9zc47csr9g8p6REXqUaMdCFZrnsSQg1AbPEFU6mHe5o5le
         In/pHIoLFAnPDUhatsIEf7pngRHhL14/1sVzN8fg24GNSo2agttyO3HPL5EMS5AmAaE6
         51Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXkag5WdiMFP+CMHEcsX7GXxX7aUkMDCqFMpOnISlOnZBiXcDZ1cuLcGRBlYNudUjcpi253m5p11tc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJUA+OQISrcj/TnrCljdwtEfDkSnc8PjNJx/YyhLtEzeNC+pdc
	TT5TG38AO/CYQ/nRFkd5MdzanKLQdOCo17qIBunl5WD7NH+WSsjtircnO83NAYs=
X-Gm-Gg: ASbGncsHy933REist031xn4eUrJPbh/StjOJyUmnFCBs9B0PFKrlwSOdmSTq5LBZNO2
	3RhnFQ0TkvhF1sB7dDI8Ir0/bTPdiWom7jdSulv29qQYq+TXt80fLxE9Zf0AevWCSzC513cHeiD
	UdPEIU2SoJHrJDgcczgmcwngpNW+ShYSNqSin2psPKmbLTIsmWh6Rfqv8HZltc3FOSblasIfOLJ
	XJp7C+dDYDkbC1gWBtw6v2ajF66O746+6ssX/Nle0ZFvoYPQjAJ/E4THjidqS1PCciQ/IPPRvwN
	Ny4f5g==
X-Google-Smtp-Source: AGHT+IHYvWOfej6DnMLzp2Xiw9S+tkev5jMy3KwGkLNQuYfF/NRaZoyfB9k61+r7Ggik1KDW2aMMow==
X-Received: by 2002:a17:906:6d8c:b0:ab6:d47a:9b20 with SMTP id a640c23a62f3a-ab6d47a9fc0mr492898866b.31.1738224909401;
        Thu, 30 Jan 2025 00:15:09 -0800 (PST)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab6e4a32253sm76696266b.152.2025.01.30.00.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 00:15:09 -0800 (PST)
Date: Thu, 30 Jan 2025 09:15:08 +0100
From: Michal Hocko <mhocko@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	Peter Hunt <pehunt@redhat.com>
Subject: Re: [RFC PATCH] mm, memcg: introduce memory.high.throttle
Message-ID: <Z5s1DG2YVH78RWpR@tiehlicka>
References: <20250129191204.368199-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129191204.368199-1-longman@redhat.com>

On Wed 29-01-25 14:12:04, Waiman Long wrote:
> Since commit 0e4b01df8659 ("mm, memcg: throttle allocators when failing
> reclaim over memory.high"), the amount of allocator throttling had
> increased substantially. As a result, it could be difficult for a
> misbehaving application that consumes increasing amount of memory from
> being OOM-killed if memory.high is set. Instead, the application may
> just be crawling along holding close to the allowed memory.high memory
> for the current memory cgroup for a very long time especially those
> that do a lot of memcg charging and uncharging operations.
> 
> This behavior makes the upstream Kubernetes community hesitate to
> use memory.high. Instead, they use only memory.max for memory control
> similar to what is being done for cgroup v1 [1].

Why is this a problem for them?

> To allow better control of the amount of throttling and hence the
> speed that a misbehving task can be OOM killed, a new single-value
> memory.high.throttle control file is now added. The allowable range
> is 0-32.  By default, it has a value of 0 which means maximum throttling
> like before. Any non-zero positive value represents the corresponding
> power of 2 reduction of throttling and makes OOM kills easier to happen.

I do not like the interface to be honest. It exposes an implementation
detail and casts it into a user API. If we ever need to change the way
how the throttling is implemented this will stand in the way because
there will be applications depending on a behavior they were carefuly
tuned to.

It is also not entirely sure how is this supposed to be used in
practice? How do people what kind of value they should use?

> System administrators can now use this parameter to determine how easy
> they want OOM kills to happen for applications that tend to consume
> a lot of memory without the need to run a special userspace memory
> management tool to monitor memory consumption when memory.high is set.

Why cannot they achieve the same with the existing events/metrics we
already do provide? Most notably PSI which is properly accounted when
a task is throttled due to memory.high throttling.
-- 
Michal Hocko
SUSE Labs

