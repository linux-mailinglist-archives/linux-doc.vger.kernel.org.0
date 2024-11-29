Return-Path: <linux-doc+bounces-31641-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CEB9DA30C
	for <lists+linux-doc@lfdr.de>; Wed, 27 Nov 2024 08:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 037162840FF
	for <lists+linux-doc@lfdr.de>; Wed, 27 Nov 2024 07:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D6E14D2B7;
	Wed, 27 Nov 2024 07:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="c8JE9lF0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7F314A0B3
	for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2024 07:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732692380; cv=none; b=HRjpqeFOvnwi4o27GA/tf/B+ooaU8HQjXzqN+C6zzdlOzwk0FMfn3PIQKZLS3fNga33wfTw4OZI6VNvO43yY9Vkgnjl+v4XtvvnaFB8L2XrNVYPDbkoIGGQINPc82NGfCueBDUi8QAtmNgldnyZnVLaZYhQt6bATc4JBp0YCZ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732692380; c=relaxed/simple;
	bh=LaCgO/1I3Ht7VzxrqJNIKq5AGQ9WB0sRXb58RNW5hlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpuTksv1rrfk1kheaygLNYYPaVmqDoxcbNzoNqX9hbSo6PvH9D4PXUVTsufQkF5Wm9GjUEB/YWaavHxZAIWhZjHNxNS4XD7VAy0TykS8sbDW3wZ6DoD6Qtr3oehNhBzFCsrc36a10IRXV242jyBpQw2sUbgI+u8CmTginyIOwVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=c8JE9lF0; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46690cbec70so22646731cf.1
        for <linux-doc@vger.kernel.org>; Tue, 26 Nov 2024 23:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1732692375; x=1733297175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oki+SLMP3RV96wUZX5TvrU7XbLUfwG8p5rgWcxa7qog=;
        b=c8JE9lF0M2SJGsQUqFEkjxAJBTkoJo3zqr9I6bI5vvYl0hoh/s4Dprwa7Uj7YdG+V1
         lz3tHUPxIrsk0wDbomc/bFM72SB5QDSG3iZJ0nRR82IZn2tWBjOC2ERyMdt+8Tbf7cpR
         3PqiobwJiUyncnENpJuYh48JBaeLu82f7FXJnPdPuWnRUw5Jlbx7Gbjw+bOS2bONfScj
         aaZ8fUunewONGvfnX9FTHFa8hVJkzhzfb156PgkYOQ5/4q++jo31AabxZ72ZvzrmQel4
         sVbTWMbwA2w6j0dC5M7il/dtDhtJqUwgB2UJaGZNCHrjO5ian5qfDtDpyfYqla49xwTQ
         yEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732692375; x=1733297175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oki+SLMP3RV96wUZX5TvrU7XbLUfwG8p5rgWcxa7qog=;
        b=QuBJSSRGl060zLYVwJLr3oVObFp+bO22YzprJVk/Vu3NVRTFIeHx9LY7qktGKs5F6u
         X4WpUhuNDeOFKqyu/bTSDHrDgs6UBdjMBd0yycdCNapRpBmFmIAS+p5eQlmACPYjd4p1
         c7TSNGMbtd4srGzGxKaiSMadwK32BMAl5Hl1yhlzb9BQM3TaR0cT3BDqroJg9Ddmzkli
         WwZ+zvCKKy8BFelzxyS6UzwRHiSmtbVApA6uqosuodc623x/M4oyvN7Uqa2It2gCYWJ3
         N/ijFu1ntfIQRCVZv+/AMB5KpaH40xD/betw3lLflbMkDUiFoKJjfOQap0MuQucm8XVn
         9O8g==
X-Forwarded-Encrypted: i=1; AJvYcCV+20mQBp//KWqPaunAb04g0Vr8ErISxIeTFXdOTUiNzCH5tSLxM6xi/s3bakGTR/0Cq2LPVoTv2II=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBl3UzV/peRr6gLugRSazi87wMThF1BLyunwZQ++eehBHhQws9
	Dsp+BiP0r8GxZnxZKIuPOHL4OL1mhedggyYHMvSi0uohblAXtzL3dqRcPUFqcLw=
X-Gm-Gg: ASbGncsenVnzCRAWXQEIUfk8PsN7j9qrJgRraeDGmOx74XDo8KnbXDMUjEAq+UmI83R
	6MYN6rgNfE+nQsw5HlFeng236vcudM+XZw4iJ8JUsSwU9mmc85TqPYjIYRLJfaIdqMW0e/XHJ6H
	2jwL2Bq2ufcfi/Pd1oCdNYQ5Mqe06Moc4TrBCN+O8End4+nxzNmcnSYzWq6LFYkTwwfXlgU9c6l
	sY1Opyqzw1MzOu1H38ntxKcfDMC/EgNTAd5Lu5wcX8QhJ6k
X-Google-Smtp-Source: AGHT+IFJX0yoGf3rx43xtnjD4i0P7b6zQwuz1COBccsUFDJEwvH0o2DEs2dB0wnhyvUHM+XIFAHoZg==
X-Received: by 2002:a05:622a:19a2:b0:460:aa51:840a with SMTP id d75a77b69052e-466b366240emr26501991cf.45.1732692375403;
        Tue, 26 Nov 2024 23:26:15 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b666fd9999sm324018785a.23.2024.11.26.23.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 23:26:13 -0800 (PST)
Date: Wed, 27 Nov 2024 02:26:04 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yuanchu Xie <yuanchu@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Khalid Aziz <khalid.aziz@oracle.com>,
	Henry Huang <henry.hj@antgroup.com>, Yu Zhao <yuzhao@google.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Gregory Price <gregory.price@memverge.com>,
	Huang Ying <ying.huang@intel.com>, Lance Yang <ioworker0@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Watson <ozzloy@each.do>, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH v4 0/9] mm: workingset reporting
Message-ID: <20241127072604.GA2501036@cmpxchg.org>
References: <20241127025728.3689245-1-yuanchu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127025728.3689245-1-yuanchu@google.com>

On Tue, Nov 26, 2024 at 06:57:19PM -0800, Yuanchu Xie wrote:
> This patch series provides workingset reporting of user pages in
> lruvecs, of which coldness can be tracked by accessed bits and fd
> references. However, the concept of workingset applies generically to
> all types of memory, which could be kernel slab caches, discardable
> userspace caches (databases), or CXL.mem. Therefore, data sources might
> come from slab shrinkers, device drivers, or the userspace.
> Another interesting idea might be hugepage workingset, so that we can
> measure the proportion of hugepages backing cold memory. However, with
> architectures like arm, there may be too many hugepage sizes leading to
> a combinatorial explosion when exporting stats to the userspace.
> Nonetheless, the kernel should provide a set of workingset interfaces
> that is generic enough to accommodate the various use cases, and extensible
> to potential future use cases.

Doesn't DAMON already provide this information?

CCing SJ.

> Use cases
> ==========
> Job scheduling
> On overcommitted hosts, workingset information improves efficiency and
> reliability by allowing the job scheduler to have better stats on the
> exact memory requirements of each job. This can manifest in efficiency by
> landing more jobs on the same host or NUMA node. On the other hand, the
> job scheduler can also ensure each node has a sufficient amount of memory
> and does not enter direct reclaim or the kernel OOM path. With workingset
> information and job priority, the userspace OOM killing or proactive
> reclaim policy can kick in before the system is under memory pressure.
> If the job shape is very different from the machine shape, knowing the
> workingset per-node can also help inform page allocation policies.
> 
> Proactive reclaim
> Workingset information allows the a container manager to proactively
> reclaim memory while not impacting a job's performance. While PSI may
> provide a reactive measure of when a proactive reclaim has reclaimed too
> much, workingset reporting allows the policy to be more accurate and
> flexible.

I'm not sure about more accurate.

Access frequency is only half the picture. Whether you need to keep
memory with a given frequency resident depends on the speed of the
backing device.

There is memory compression; there is swap on flash; swap on crappy
flash; swapfiles that share IOPS with co-located filesystems. There is
zswap+writeback, where avg refault speed can vary dramatically.

You can of course offload much more to a fast zswap backend than to a
swapfile on a struggling flashdrive, with comparable app performance.

So I think you'd be hard pressed to achieve a high level of accuracy
in the usecases you list without taking the (often highly dynamic)
cost of paging / memory transfer into account.

There is a more detailed discussion of this in a paper we wrote on
proactive reclaim/offloading - in 2.5 Hardware Heterogeneity:

https://www.cs.cmu.edu/~dskarlat/publications/tmo_asplos22.pdf

> Ballooning (similar to proactive reclaim)
> The last patch of the series extends the virtio-balloon device to report
> the guest workingset.
> Balloon policies benefit from workingset to more precisely determine the
> size of the memory balloon. On end-user devices where memory is scarce and
> overcommitted, the balloon sizing in multiple VMs running on the same
> device can be orchestrated with workingset reports from each one.
> On the server side, workingset reporting allows the balloon controller to
> inflate the balloon without causing too much file cache to be reclaimed in
> the guest.
> 
> Promotion/Demotion
> If different mechanisms are used for promition and demotion, workingset
> information can help connect the two and avoid pages being migrated back
> and forth.
> For example, given a promotion hot page threshold defined in reaccess
> distance of N seconds (promote pages accessed more often than every N
> seconds). The threshold N should be set so that ~80% (e.g.) of pages on
> the fast memory node passes the threshold. This calculation can be done
> with workingset reports.
> To be directly useful for promotion policies, the workingset report
> interfaces need to be extended to report hotness and gather hotness
> information from the devices[1].
> 
> [1]
> https://www.opencompute.org/documents/ocp-cms-hotness-tracking-requirements-white-paper-pdf-1
>
> Sysfs and Cgroup Interfaces
> ==========
> The interfaces are detailed in the patches that introduce them. The main
> idea here is we break down the workingset per-node per-memcg into time
> intervals (ms), e.g.
> 
> 1000 anon=137368 file=24530
> 20000 anon=34342 file=0
> 30000 anon=353232 file=333608
> 40000 anon=407198 file=206052
> 9223372036854775807 anon=4925624 file=892892
>
> Implementation
> ==========
> The reporting of user pages is based off of MGLRU, and therefore requires
> CONFIG_LRU_GEN=y. We would benefit from more MGLRU generations for a more
> fine-grained workingset report, but we can already gather a lot of data
> with just four generations. The workingset reporting mechanism is gated
> behind CONFIG_WORKINGSET_REPORT, and the aging thread is behind
> CONFIG_WORKINGSET_REPORT_AGING.
> 
> Benchmarks
> ==========
> Ghait Ouled Amar Ben Cheikh has implemented a simple policy and ran Linux
> compile and redis benchmarks from openbenchmarking.org. The policy and
> runner is referred to as WMO (Workload Memory Optimization).
> The results were based on v3 of the series, but v4 doesn't change the core
> of the working set reporting and just adds the ballooning counterpart.
> 
> The timed Linux kernel compilation benchmark shows improvements in peak
> memory usage with a policy of "swap out all bytes colder than 10 seconds
> every 40 seconds". A swapfile is configured on SSD.
> --------------------------------------------
> peak memory usage (with WMO): 4982.61328 MiB
> peak memory usage (control): 9569.1367 MiB
> peak memory reduction: 47.9%
> --------------------------------------------
> Benchmark                                           | Experimental     |Control         | Experimental_Std_Dev | Control_Std_Dev
> Timed Linux Kernel Compilation - allmodconfig (sec) | 708.486 (95.91%) | 679.499 (100%) | 0.6%                 | 0.1%
> --------------------------------------------
> Seconds, fewer is better

You can do this with a recent (>2018) upstream kernel and ~100 lines
of python [1]. It also works on both LRU implementations.

[1] https://github.com/facebookincubator/senpai

We use this approach in virtually the entire Meta fleet, to offload
unneeded memory, estimate available capacity for job scheduling, plan
future capacity needs, and provide accurate memory usage feedback to
application developers.

It works over a wide variety of CPU and storage configurations with no
specific tuning.

The paper I referenced above provides a detailed breakdown of how it
all works together.

I would be curious to see a more in-depth comparison to the prior art
in this space. At first glance, your proposal seems more complex and
less robust/versatile, at least for offloading and capacity gauging.

It does provide more detailed insight into userspace memory behavior,
which could be helpful when trying to make sense of applications that
sit on a rich layer of libraries and complicated runtimes. But here a
comparison to DAMON would be helpful.

>  25 files changed, 2482 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/admin-guide/mm/workingset_report.rst
>  create mode 100644 include/linux/workingset_report.h
>  create mode 100644 mm/workingset_report.c
>  create mode 100644 mm/workingset_report_aging.c
>  create mode 100644 tools/testing/selftests/mm/workingset_report.c
>  create mode 100644 tools/testing/selftests/mm/workingset_report.h
>  create mode 100644 tools/testing/selftests/mm/workingset_report_test.c

