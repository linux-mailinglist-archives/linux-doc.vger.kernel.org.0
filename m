Return-Path: <linux-doc+bounces-20889-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2AD9336F8
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 08:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A04971C209FE
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 06:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18E412E48;
	Wed, 17 Jul 2024 06:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e4bTEgSD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF29125DE
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 06:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721197565; cv=none; b=JTkNOF7ey5q38h+iVlRnw/O/9wrJvfA8tR2Dw5oVTdL/KjW5Brys47WsDmVe4ykPTVKiz/pgPr+2YxIq9T4QGJILjenJhBZwZZt4Qy5p3iRtXuJ3E/fJNk2wvJXMRZlGYBb6ZYnlylUth8lEbxgjbZcGYwjXq6kXrJ7idEazImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721197565; c=relaxed/simple;
	bh=ByuZeLQzwZ5x3nXl8kE+pf2jxHURXs8b01VJ/XfnZeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njBKtvu0lcvMU2i0uoua0k0XuxNCziSLZz0mD3FOe12GZQHfmzDDB3gLSBIQ5wby0/aeRxy+1rr1LJVU1hJL3dze1CwOIb03A8Baqj8zPUPF04OLflCkOkc4sZGiofOpbYlHsPJnj01bCCFt6lXaf1mkJPN75p7f6Pf2xXcJHVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e4bTEgSD; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52ea2f58448so8653017e87.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 23:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721197562; x=1721802362; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kRZCoDkETaEFOBCewGIFpdrgG+eZN4FZNraXMVegoL0=;
        b=e4bTEgSDEfWn7rENkpLoF+hCc9fKY8oY++rP9JBYSRBR7RxLje7itpWbdi3VSGWjIn
         asaYcjERfn+fP3lnAyyXvTbzvs+etHxKUeSntA4XHTyTX+S9OZeiCBxdT45wnXD2lJ6W
         tS9ccv3uPT2fFP9ZIO5EMwGVcnwKvNO09kxXAXmULeZTzcVB74tfbvBXxemzePDl4BJz
         B1GiEYq3ZU+6305EFZUeX6liW5EpBfbK467EgIPNG5AyrEF5vT3byKYjiAhq2FdHpgyS
         qhxVkO8h1V367NglYzcuxBdJpPtYH4VZBF/AlHvAjvdP+hmS2OIenbbumhhI99Znyl/1
         R8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197562; x=1721802362;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRZCoDkETaEFOBCewGIFpdrgG+eZN4FZNraXMVegoL0=;
        b=HCmf4HrAHPyEgTon63CUgC0R67DdekEq3qePJozJOTBz2fsi9FCvXnGN0yEPhpmcX4
         fNKaud4HKgpicczM2y8CmhnCPm10Hf0HcKPe/0hLhFKR+HbZi10744pCogOMmuU9MFbQ
         m4uHqphZniocYm2KVc7D4zixpBRVOZH2KXOIg4oWrAUU0JODS4OJRlTOsHPSAWxU+8bb
         S/yX27to7iygqj562/htFu+3iM1pa1sRn4n+C/4r8kHghIJ90zxW1el+/5t/CXbzOIX6
         Kx2Itj2dWzGHujFR0TlzFPCSkwyHmi0cTxhAnFBzZiNpbhczjxa01h7TM8RWLfpF60S8
         n10Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6WCYR4+VldzMnfCfcPc8JfajRmBWmc+D2E7WHJA2fWGR+XKFRCkhSA+RAwQHM4PtV0bLINyc/V4m4ow80ALHAuF+q2SLGReVv
X-Gm-Message-State: AOJu0YzwC9H7vY7S//Xs8hlIh/m+6XoJwgT3T20aH6wszgybZclWDVPS
	WBVPy4lTODEHMSF/P+Wx6qtr/aicRCXzk8Mq1PRsPQXGcepiLfoZBRKvLAqqJ3A=
X-Google-Smtp-Source: AGHT+IGDEwk+nZqPqfNzpH3tY2qHsGGwHFWpWnZPOMmrbDmZO3jaXfhbMrl3VS0/+lWJ0Ywpz+aWEA==
X-Received: by 2002:a05:6512:104a:b0:52e:9ec8:a3fd with SMTP id 2adb3069b0e04-52ee542718dmr459428e87.45.1721197561796;
        Tue, 16 Jul 2024 23:26:01 -0700 (PDT)
Received: from localhost (109-81-86-75.rct.o2.cz. [109.81.86.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b4f87sm406498866b.48.2024.07.16.23.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:26:01 -0700 (PDT)
Date: Wed, 17 Jul 2024 08:26:00 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Finkel <davidf@vimeo.com>
Cc: Tejun Heo <tj@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, core-services@vimeo.com,
	Jonathan Corbet <corbet@lwn.net>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shuah Khan <shuah@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Zefan Li <lizefan.x@bytedance.com>, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH] mm, memcg: cg2 memory{.swap,}.peak write handlers
Message-ID: <Zpdj-DVZ5U5EdvqL@tiehlicka>
References: <20240715203625.1462309-1-davidf@vimeo.com>
 <20240715203625.1462309-2-davidf@vimeo.com>
 <ZpZ6IZL482XZT1fU@tiehlicka>
 <ZpajW9BKCFcCCTr-@slm.duckdns.org>
 <Zpa1VGL5Mz63FZ0Z@tiehlicka>
 <ZpbRSv_dxcNNfc9H@slm.duckdns.org>
 <CAFUnj5MTRsFzd_EHJ7UcyjrWWUicg7wRrs2XdnVnvGiG3KmULQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFUnj5MTRsFzd_EHJ7UcyjrWWUicg7wRrs2XdnVnvGiG3KmULQ@mail.gmail.com>

On Tue 16-07-24 18:06:17, David Finkel wrote:
> On Tue, Jul 16, 2024 at 4:00 PM Tejun Heo <tj@kernel.org> wrote:
> >
> > Hello,
> >
> > On Tue, Jul 16, 2024 at 08:00:52PM +0200, Michal Hocko wrote:
> > ...
> > > > If we want to allow peak measurement of time periods, I wonder whether we
> > > > could do something similar to pressure triggers - ie. let users register
> > > > watchers so that each user can define their own watch periods. This is more
> > > > involved but more useful and less error-inducing than adding reset to a
> > > > single counter.
> > >
> > > I would rather not get back to that unless we have many more users that
> > > really need that. Absolute value of the memory consumption is a long
> > > living concept that doesn't make much sense most of the time. People
> > > just tend to still use it because it is much simpler to compare two different
> > > values rather than something as dynamic as PSI similar metrics.
> >
> > The initial justification for adding memory.peak was that it's mostly to
> > monitor short lived cgroups. Adding reset would make it used more widely,
> > which isn't necessarily a bad thing and people most likely will find ways to
> > use it creatively. I'm mostly worried that that's going to create a mess
> > down the road. Yeah, so, it's not widely useful now but adding reset makes
> > it more useful and in a way which can potentially paint us into a corner.
> 
> This is a pretty low-overhead feature as-is, but we can reduce it further by
> changing it so instead of resetting the watermark on any non-empty string,
> we reset only on one particular string.
> 
> I'm thinking of something like "global_reset\n", so if we do something like the
> PSI interface later, users can write "fd_local_reset\n", and get that
> nicer behavior.
> 
> This also has the benefit of allowing "echo global_reset >
> /sys/fs/cgroup/.../memory.peak" to do the right thing.
> (better names welcome)

This would be a different behavior than in v1 and therefore confusing
for those who rely on this in v1 already. So I wouldn't overengineer it
and keep the semantic as simple as possible. If we decide to add PSI
triggers they are completely independent on peak value because that is
reclaim based interface which by definition makes peak value very
dubious.
-- 
Michal Hocko
SUSE Labs

