Return-Path: <linux-doc+bounces-20772-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B7C9327A3
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jul 2024 15:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB2291C224AC
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jul 2024 13:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0914381732;
	Tue, 16 Jul 2024 13:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="h7Jg8z7z"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E65B19AD90
	for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 13:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721137176; cv=none; b=ZXY+LwUOApO1iGCnpSKdPmj5i3H1JzOAb/gBFucwVcA6vh1DcG71KjurIKlMD0fGOUVw02zjoKWoaDzZBnAKqDbA55YC2Z+SZkV4/Gctph3kXVWtkHuiRr8TUdOS1qDAS9xg16rM6RSGHPMJo5E4fe2ZGPB4fUokDe5XEe/ZUHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721137176; c=relaxed/simple;
	bh=sa/S9BUnkuh7riQ38FnqtofoY2nQOcei+QSKBaXW8x4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZjl3hd5HaIhtIbFYXGe3EC7Xtcd6m/9N/CqdXiUdAvPdyY+PETMUu7bLpkXZMlps42/cqVChQ/haCfNMqIFW0OZJI+KREvi8IJZrivaMm+MuP7IHEVolcwzcj9amgmW5VDw3Nk7c9W/6d+AD0dCkPcbLo8enIwADna0t6WX+hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com; spf=fail smtp.mailfrom=vimeo.com; dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b=h7Jg8z7z; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vimeo.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-8076ebb7ba1so231485439f.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 06:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1721137174; x=1721741974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YW+mzHCCEAL/Dc8/KBWky+xkhTLtxxONIcmsaUT5KqU=;
        b=h7Jg8z7zJFB+M0KHVAsr8iU3g/rKcyQTlVxJN3RM4pL0baZCbGOHbNHUBMGmZqQ66C
         FAYIhKNnwVB7Eu9AD8OsiKj7Z0O77veVMcTSV9s7oyCVP8ZkrzKiUzcZKt3ttCWzS5/2
         9mIWI3sWVSRf9zE/BwWXXHFvyfQr057MB9/po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721137174; x=1721741974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YW+mzHCCEAL/Dc8/KBWky+xkhTLtxxONIcmsaUT5KqU=;
        b=DHY7ln2u/eq15xz8qAQrAyXo0yrFHen4cdKy8ZE34yTnRDl0qv38WBu96IqrxWcFh/
         j/SUzsQMRPPqcj3pd+no2/+6gVmo+9X6qjWd8bvFIu0z8/tVxM1Fxe0EbuxvyaOLaMM0
         YKpZO29TmCT7k8uOjjqkYBa3vxZoxidrbjFPC1+VOOB3eWW9T1kF+Y+8ISZq793aMRT5
         21zqFmW/a1G1vMDpk9kRx4fRnd90F4HWbpP1rpK2pjVPs8J8yiaN2WZ3GvQZLQs948zG
         Y5xtQydJxdI6awExuFFWKKlsUx5V4DVUcgL1S50FJoKQaO4vwIbqKqNYe0B3f9lbIGBc
         uVNw==
X-Forwarded-Encrypted: i=1; AJvYcCWxbsbjuT9UC6VXKQ5PGlsXDjEXQgHU7xdXoEUyPKZ3uewhLxBm3QaoL2+V1rlEuWfpf+kMe3aeLs07SB9c+67cVJIEscmAacpS
X-Gm-Message-State: AOJu0Yzac6lwpqcUXZQ9rpx/hGFG1IMJOr+FHXDGQb1eyeehSj0xuAeR
	Z+SWDtb/+BKhh8ITH2npN1zmRFeZwOgYKV0+NxrJMc2D8XQO8dYR63GtxLpUMia2Nu9r0bZ7+VP
	sVh1LJZacuhct+eXm8Y+H4MhjmwhgodI9AElr1g==
X-Google-Smtp-Source: AGHT+IFAW6xD2cRw42K+ikziVp4S7EEpVyEzWOobZokAgbO77o8tjQsQwHXYPrPwZ6wknA35Un4xwKN+/cd1Bihx4nQ=
X-Received: by 2002:a05:6602:6417:b0:803:980e:5b38 with SMTP id
 ca18e2360f4ac-81574541183mr302910339f.1.1721137174472; Tue, 16 Jul 2024
 06:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715203625.1462309-1-davidf@vimeo.com> <20240715203625.1462309-2-davidf@vimeo.com>
 <CAFUnj5Oh_OsP4TikWTGT6cKKTnWLaBYpE5PGzcxLTp7b=UqLkQ@mail.gmail.com>
 <CAFUnj5MahNvM+B2zynVtcnYKJ7LZHwBNEcPKGAdz-tesDeOXcw@mail.gmail.com>
 <ZpYfKI6W1uSMkt5i@tiehlicka> <CAFUnj5Mb82Yjih4-xZMS2Ge+1Oj+zm-ZVaoTak_SisZnv6G-0w@mail.gmail.com>
 <ZpZzYM6kdQmq7TPI@tiehlicka>
In-Reply-To: <ZpZzYM6kdQmq7TPI@tiehlicka>
From: David Finkel <davidf@vimeo.com>
Date: Tue, 16 Jul 2024 09:39:22 -0400
Message-ID: <CAFUnj5O=-3LRuTFPNZHpMB=SCbVgpNriuB2UHZkNreC4QQ5Q1w@mail.gmail.com>
Subject: Re: [PATCH] mm, memcg: cg2 memory{.swap,}.peak write handlers
To: Michal Hocko <mhocko@suse.com>
Cc: Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	core-services@vimeo.com, Jonathan Corbet <corbet@lwn.net>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 9:19=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Tue 16-07-24 08:47:59, David Finkel wrote:
> > On Tue, Jul 16, 2024 at 3:20=E2=80=AFAM Michal Hocko <mhocko@suse.com> =
wrote:
> > >
> > > On Mon 15-07-24 16:46:36, David Finkel wrote:
> > > > > On Mon, Jul 15, 2024 at 4:38=E2=80=AFPM David Finkel <davidf@vime=
o.com> wrote:
> > > > > >
> > > > > > Other mechanisms for querying the peak memory usage of either a=
 process
> > > > > > or v1 memory cgroup allow for resetting the high watermark. Res=
tore
> > > > > > parity with those mechanisms.
> > > > > >
> > > > > > For example:
> > > > > >  - Any write to memory.max_usage_in_bytes in a cgroup v1 mount =
resets
> > > > > >    the high watermark.
> > > > > >  - writing "5" to the clear_refs pseudo-file in a processes's p=
roc
> > > > > >    directory resets the peak RSS.
> > > > > >
> > > > > > This change copies the cgroup v1 behavior so any write to the
> > > > > > memory.peak and memory.swap.peak pseudo-files reset the high wa=
termark
> > > > > > to the current usage.
> > > > > >
> > > > > > This behavior is particularly useful for work scheduling system=
s that
> > > > > > need to track memory usage of worker processes/cgroups per-work=
-item.
> > > > > > Since memory can't be squeezed like CPU can (the OOM-killer has
> > > > > > opinions),
> > >
> > > I do not understand the OOM-killer reference here. Why does it matter=
?
> > > Could you explain please?
> >
> > Sure, we're attempting to bin-packing work based on past items of the s=
ame type.
> > With CPU, we can provision for the mean CPU-time per-wall-time to get
> > a lose "cores"
> > concept that we use for binpacking. With CPU, if we end up with a bit
> > of contention,
> > everything just gets a bit slower while the schedule arbitrates among c=
groups.
> >
> > However, with memory, you only have so much physical memory for the out=
er memcg.
> > If we pack things too tightly on memory, the OOM-killer is going to kil=
l
> > something to free up memory. In some cases that's fine, but provisionin=
g for the
> > peak memory for that "type" of work-item mostly avoids this issue.
>
> It is still not clear to me how the memory reclaim falls into that. Are
> your workloads mostly unreclaimable (e.g. anon mostly consumers without
> any swap)? Why I am asking? Well, if the workload's memory is
> reclaimable then the peak memory consumption is largely misleading
> because an unknown portion of that memory consumption is hidden by the
> reclaimed portion of it. This is not really specific to the write
> handlers to reset the value though so I do not want to digress this
> patch too much. I do not have objections to the patch itself. Clarifying
> the usecase with your followup here would be nice.

Thanks, I'm happy to clarify things!

That's a good point about peak-RSS being unreliable if the memory's reclaim=
able.

The memory is mostly unreclaimable. It's almost all anonymous mmap,
with a few local files that would be resident in buffercache. (but
generally aren't mmaped)
We don't run with swap enabled on the systems for a few reasons.
In particular, kubernetes disallows swap, which ties our hands, but
even if it didn't,
demand paging from disk tends to stall any useful work, so we'd rather
see the OOM-killer invoked, anyway.

(we actually have some plans for disabling OOM-kills in these cgroups
and letting the userspace process
managing these memcgs handle work-throttling and worker-killing when
there are OOM-conditions, but that's another story :) )

>
> Thanks for the clarification!
> --
> Michal Hocko
> SUSE Labs



--=20
David Finkel
Senior Principal Software Engineer, Core Services

