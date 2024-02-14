Return-Path: <linux-doc+bounces-9422-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F46C8553D4
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 21:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04FB9293C5D
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 20:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3256B13DBB1;
	Wed, 14 Feb 2024 20:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DiGIfItW"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF6613DB9F
	for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 20:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707941875; cv=none; b=jUyULvEeXIMV/R8IVCIFZMtNJQMJBLdQTctXSyzFC/k6VucBQ/csMdbyYijpEMrqqQUyqKIGDPUlKd/WPj/I1RsdDJD1Um12oX4HS1Wl2EfocMvnjx8bBTINaz37TsFkOgkHa8f64bULFhm9ZhZnI5gXkZtyjE8EA6r+7/0sK3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707941875; c=relaxed/simple;
	bh=LRwkqgTwbjojrvWlVJdTvGNtTmKNlI/lqhoWnlH86aU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pwABqscJGL3ui//2Rso6Nq2yZtNjD2qJeZBD2eXV3MUthwHplO58hnC3OANkmbCoV4Mxpr6jBdQg7QtIcUiy/Ad4G+rHKsRuTjDDjGiFX6DrcsR9SItxkdu5lNxF2NrK+P2YTf0QF+XSBoOAL5AinbnIP4PY8dmuJLsp5opdvGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DiGIfItW; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yosryahmed.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-607ca296b64so1332397b3.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 12:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707941872; x=1708546672; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DFRgEJKqx8IUK/onZJk4TNjtYloWEJQ2VMeYiwjP0ZI=;
        b=DiGIfItWbnQ5p1uLFwILlUgy2jXW0bqov0ksG0kcuH9lHg08UBB/puF+KuQMHafJhm
         snr6xO1Yjtvp1sIq4DH//10Dno5VuoTf3Q0R27qiOOXKpTOiNeT9Vn0D50M+W3fXukd5
         8KmunndnPzJiSlBPI7gHgPcsei3UiqYprEncQVgDZACtvVIwlDzdB+BGRuj2NixpVRAI
         4Wp0GAEdEdr/mlPmvpGL1gbGNp88p1OCmg/RTi4JTab6deKCPXgWGhAIeUp4sNz4FWDg
         TEjAqTqprDEUX00BxmyX2zhkr2m7bfQbl86rEb9vXQmlQ2BrNBZ/w3l+U8chNdGe+3oS
         Fq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707941872; x=1708546672;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFRgEJKqx8IUK/onZJk4TNjtYloWEJQ2VMeYiwjP0ZI=;
        b=eaRBkMW/Fu8ov8ozX5T1rOv5ycbt+5nPMNkrEj1CPpEOXxf7XWUH9WbrtIDKW8CoML
         IgID7gslIboTYr+t5gXVvQ8OzBBShvB/BjSBcD3eBbRSzNKYdQzn+f2SXzBqD4YSuN11
         v8q7Vhfo2AP7hqSU+hH5VFXv4MGxXbZKOmzlzyGNB1gpWM+KRmxyyaIHzlcAOEUoysvo
         kpJx5uPfFByjn+AzmBd/OgnQiI+a8jN4sVXvBzey/w/jFnEJT68+RL6aeJlK+K5wRYyO
         4MJ4ZHCI02Fr9v82ynFFKMd+glc2cHoYTQeHjqqr3Ogh35uBVeDDg5nktbOkbDJFltbD
         H9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyPBwQV+HWLnTKAzjmlS9G9UXQz9H8mND41jPhUTonMmLYv1ncBj1RB5G/3fsYqvjjHOCelJUIQDaG7nNfZhtV/BeJPCSQDn4W
X-Gm-Message-State: AOJu0Yxi352SSLcUmO3TYKabWmX+ri6UY9EFK2ZxwW4qQh+SM2imZVk5
	rSpd0MsuY1UaJNIdtIyeBqp+DuHyJlXbWLWmWCm/4VlmHwbwVZoh3JPF5ZAk8SdmD/2xBHw4xms
	zKII0Wlf6e54c0ybLig==
X-Google-Smtp-Source: AGHT+IEEh8/ECloTKF61F6HKam49RgeIZc46jcrBkT8h5W2oQ9+AR1Ak+1Ihvk+tliAKuf+Xfoj/5sdOnEOLcBzz
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:29b4])
 (user=yosryahmed job=sendgmr) by 2002:a0d:eac3:0:b0:5ff:b07b:fb83 with SMTP
 id t186-20020a0deac3000000b005ffb07bfb83mr555354ywe.4.1707941872610; Wed, 14
 Feb 2024 12:17:52 -0800 (PST)
Date: Wed, 14 Feb 2024 20:17:50 +0000
In-Reply-To: <CAJuCfpGnnsMFu-2i6-d=n1N89Z3cByN4N1txpTv+vcWSBrC2eg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <4f24986587b53be3f9ece187a3105774eb27c12f.camel@linux.intel.com>
 <CAJuCfpGnnsMFu-2i6-d=n1N89Z3cByN4N1txpTv+vcWSBrC2eg@mail.gmail.com>
Message-ID: <Zc0f7u5yCq-Iwh3A@google.com>
Subject: Re: [PATCH v3 00/35] Memory allocation profiling
From: Yosry Ahmed <yosryahmed@google.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>, akpm@linux-foundation.org, 
	kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yuzhao@google.com, dhowells@redhat.com, hughd@google.com, 
	andreyknvl@gmail.com, keescook@chromium.org, ndesaulniers@google.com, 
	vvvvvv@google.com, gregkh@linuxfoundation.org, ebiggers@google.com, 
	ytcoode@gmail.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com, 
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org, iamjoonsoo.kim@lge.com, 
	42.hyeyoo@gmail.com, glider@google.com, elver@google.com, dvyukov@google.com, 
	shakeelb@google.com, songmuchun@bytedance.com, jbaron@akamai.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

> > > Performance overhead:
> > > To evaluate performance we implemented an in-kernel test executing
> > > multiple get_free_page/free_page and kmalloc/kfree calls with allocation
> > > sizes growing from 8 to 240 bytes with CPU frequency set to max and CPU
> > > affinity set to a specific CPU to minimize the noise. Below are results
> > > from running the test on Ubuntu 22.04.2 LTS with 6.8.0-rc1 kernel on
> > > 56 core Intel Xeon:
> > >
> > >                         kmalloc                 pgalloc
> > > (1 baseline)            6.764s                  16.902s
> > > (2 default disabled)    6.793s (+0.43%)         17.007s (+0.62%)
> > > (3 default enabled)     7.197s (+6.40%)         23.666s (+40.02%)
> > > (4 runtime enabled)     7.405s (+9.48%)         23.901s (+41.41%)
> > > (5 memcg)               13.388s (+97.94%)       48.460s (+186.71%)
> 
> (6 default disabled+memcg)    13.332s (+97.10%)         48.105s (+184.61%)
> (7 default enabled+memcg)     13.446s (+98.78%)       54.963s (+225.18%)

I think these numbers are very interesting for folks that already use
memcg. Specifically, the difference between 6 & 7, which seems to be
~0.85% and ~14.25%. IIUC, this means that the extra overhead is
relatively much lower if someone is already using memcgs.

> 
> (6) shows a bit better performance than (5) but it's probably noise. I
> would expect them to be roughly the same. Hope this helps.
> 
> > >
> >
> >

