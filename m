Return-Path: <linux-doc+bounces-20955-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB0D934359
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 22:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B1421F22137
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2024 20:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A0C1849F3;
	Wed, 17 Jul 2024 20:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="V2q6bgzU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FA2182A5C
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 20:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721249101; cv=none; b=SJClcTuDyj2rHUWgLM1yALtCRA4DhkbQGtO0OCfrXezQ9aYKllkYjrOuVeXF9S+uLozPb3PMM0XTSdgPIVbUUrsCFjiXlMAxhZrkYof06BKM+Cs8XTwsos8Ihr49fvVMnEXN3h6fC0qH3pLdKegUfNCvAZ4ySEb+1ho2a48LQAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721249101; c=relaxed/simple;
	bh=gncgT7PRK6mABDbe37Ugg0maXzZBrhOvLbl/Lihmm/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpaXXUbE58QNtHDWw++ywpD38vfEyfYy4qLh7qsx20CNusikBQokXbEBhsmoRx30YdsiZcZzRrvWrNY5mAIDEcxXXEuvALKObbenyygrp33TsAtj40H/Gk5tMqk/tHKzDLzo3Ppqix+2bfmmRIuKJTG6a0dbMo2G3tV1Rnx06P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=V2q6bgzU; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d853e31de8so80422b6e.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 13:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1721249098; x=1721853898; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IYtwH57V8kt1/aiLa729CYDDtj9L/fOjcfkBpY+TAD4=;
        b=V2q6bgzUiODWLPsVr3UkmyCWSy8VWfCAOi82lq1IBJu6f5KrEMuY2l0JVVbiAWGz+M
         L0fTaokisQVJOHi0ium6hVI3EiHDjRJZMj8p9h6yvg7Z2JskQFFKTXC5qOHT3RR9qrOd
         Vl+gEEKZDO7Dl8WB0bEdCd/HHnzCw0IozfdfvRZJanxqWeoQME8fZau6Z42Yh4cVyGxO
         LFuL/8X5bfWq6ohazPD7gG5agPxKHh9I/LKYS9+NKpmnCdTGFSf4JqJvBU5GayEjUucK
         X/d89uW8lyFOSQpGN+3Xryany8mn9Uvp/IL7uj4hdzKmy1MKGd65sJar28jX5Hjh2lLv
         zKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721249098; x=1721853898;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYtwH57V8kt1/aiLa729CYDDtj9L/fOjcfkBpY+TAD4=;
        b=KeLcO0jt/3Oz03vCKJ7oOUX+1f+eMBKOnirZNM8ZdeMwJc2+qj6Rz1VR3bcHvJXyON
         BR5PD+8jPve+bTmbqYyfcgvQQX2KzmxagRREQY1dlB6JZ4VVd8rfkLyQmsj8QrZbUcF0
         OEWqmkIIhJeiiqpF09241z1S9KT/0VYjMU9/TWPU9JpfWMRyedb0iiRpZgfazr6B1ERS
         8Tmix30RtHa0BJSbkz7TcrmTgSWMSgULbjNihwipVC51XJDAw1dpTDSjcQeFEcjwm/BP
         ee6YTxcEZe3h7zRH6msyWuu+okOq3ZCaiUGIXw1ouCuBIYnPbb6hwIIRsFx09kIkBCr0
         qGSA==
X-Forwarded-Encrypted: i=1; AJvYcCUshkdNs0A+Yk752M6YD/clD2UFSxTxIXFNetHweh7EpCZLj1xvxTGg0r8k3qGXudp2hfg0s9sTdN6Jhqgb+8cJx0EzL3TNqkr0
X-Gm-Message-State: AOJu0Yxfe2F9LuPvzNHnAWd+RBeLQz4AfugxDCoVngFKzsG6I4IiFlIT
	D25Hsdi6x0MK2s9uL7YNuOJX0jddJsgIwIB0s7Za8nxVe8oA7zvV013k4yucI6U=
X-Google-Smtp-Source: AGHT+IF4+/Pck83cU63sy8DWfGHaNuyZzaqpdVdmLEhKuF8kgFuxUsMp0AUq43ixoy0Rip5ijHUwjA==
X-Received: by 2002:a05:6808:188f:b0:3d9:2b95:3306 with SMTP id 5614622812f47-3dad52bd2e4mr2359887b6e.42.1721249098162;
        Wed, 17 Jul 2024 13:44:58 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a160b98dc1sm445620285a.1.2024.07.17.13.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 13:44:57 -0700 (PDT)
Date: Wed, 17 Jul 2024 16:44:53 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: David Finkel <davidf@vimeo.com>
Cc: Tejun Heo <tj@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, core-services@vimeo.com,
	Jonathan Corbet <corbet@lwn.net>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shuah Khan <shuah@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH] mm, memcg: cg2 memory{.swap,}.peak write handlers
Message-ID: <20240717204453.GD1321673@cmpxchg.org>
References: <20240715203625.1462309-1-davidf@vimeo.com>
 <20240715203625.1462309-2-davidf@vimeo.com>
 <ZpZ6IZL482XZT1fU@tiehlicka>
 <ZpajW9BKCFcCCTr-@slm.duckdns.org>
 <20240717170408.GC1321673@cmpxchg.org>
 <CAFUnj5OA0KaC54M9vd8W+NZJwz5Jw25u-BStO=Bi2An=98Ruwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFUnj5OA0KaC54M9vd8W+NZJwz5Jw25u-BStO=Bi2An=98Ruwg@mail.gmail.com>

On Wed, Jul 17, 2024 at 04:14:07PM -0400, David Finkel wrote:
> On Wed, Jul 17, 2024 at 1:04 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Tue, Jul 16, 2024 at 06:44:11AM -1000, Tejun Heo wrote:
> > > Hello,
> > >
> > > On Tue, Jul 16, 2024 at 03:48:17PM +0200, Michal Hocko wrote:
> > > ...
> > > > > This behavior is particularly useful for work scheduling systems that
> > > > > need to track memory usage of worker processes/cgroups per-work-item.
> > > > > Since memory can't be squeezed like CPU can (the OOM-killer has
> > > > > opinions), these systems need to track the peak memory usage to compute
> > > > > system/container fullness when binpacking workitems.
> > >
> > > Swap still has bad reps but there's nothing drastically worse about it than
> > > page cache. ie. If you're under memory pressure, you get thrashing one way
> > > or another. If there's no swap, the system is just memlocking anon memory
> > > even when they are a lot colder than page cache, so I'm skeptical that no
> > > swap + mostly anon + kernel OOM kills is a good strategy in general
> > > especially given that the system behavior is not very predictable under OOM
> > > conditions.
> > >
> > > > As mentioned down the email thread, I consider usefulness of peak value
> > > > rather limited. It is misleading when memory is reclaimed. But
> > > > fundamentally I do not oppose to unifying the write behavior to reset
> > > > values.
> > >
> > > The removal of resets was intentional. The problem was that it wasn't clear
> > > who owned those counters and there's no way of telling who reset what when.
> > > It was easy to accidentally end up with multiple entities that think they
> > > can get timed measurement by resetting.
> > >
> > > So, in general, I don't think this is a great idea. There are shortcomings
> > > to how memory.peak behaves in that its meaningfulness quickly declines over
> > > time. This is expected and the rationale behind adding memory.peak, IIRC,
> > > was that it was difficult to tell the memory usage of a short-lived cgroup.
> > >
> > > If we want to allow peak measurement of time periods, I wonder whether we
> > > could do something similar to pressure triggers - ie. let users register
> > > watchers so that each user can define their own watch periods. This is more
> > > involved but more useful and less error-inducing than adding reset to a
> > > single counter.
> > >
> > > Johannes, what do you think?
> >
> > I'm also not a fan of the ability to reset globally.
> >
> > I seem to remember a scheme we discussed some time ago to do local
> > state tracking without having the overhead in the page counter
> > fastpath. The new data that needs to be tracked is a pc->local_peak
> > (in the page_counter) and an fd->peak (in the watcher's file state).
> >
> > 1. Usage peak is tracked in pc->watermark, and now also in pc->local_peak.
> >
> > 2. Somebody opens the memory.peak. Initialize fd->peak = -1.
> >
> > 3. If they write, set fd->peak = pc->local_peak = usage.
> >
> > 4. Usage grows.
> >
> > 5. They read(). A conventional reader has fd->peak == -1, so we return
> >    pc->watermark. If the fd has been written to, return max(fd->peak, pc->local_peak).
> >
> > 6. Usage drops.
> >
> > 7. New watcher opens and writes. Bring up all existing watchers'
> >    fd->peak (that aren't -1) to pc->local_peak *iff* latter is bigger.
> >    Then set the new fd->peak = pc->local_peak = current usage as in 3.
> >
> > 8. See 5. again for read() from each watcher.
> >
> > This way all fd's can arbitrarily start tracking new local peaks with
> > write(). The operation in the charging fast path is cheap. The write()
> > is O(existing_watchers), which seems reasonable. It's fully backward
> > compatible with conventional open() + read() users.
> 
> That scheme seems viable, but it's a lot more work to implement and maintain
> than a simple global reset.
> 
> Since that scheme maintains a separate pc->local_peak, it's not mutually
> exclusive with implementing a global reset now. (as long as we reserve a
> way to distinguish the different kinds of writes).
> 
> As discussed on other sub-threads, this might be too niche to be worth
> the significant complexity of avoiding a global reset. (especially when
> users would likely be moving from cgroups v1 which does have a global reset)

The problem is that once global resetting is allowed, it makes the
number reported in memory.peak unreliable for everyone. You just don't
know, and can't tell, if somebody wrote to it recently. It's not too
much of a leap to say this breaks the existing interface contract.

You have to decide whether the above is worth implementing. But my
take is that the downsides of the simpler solution outweigh its
benefits.

