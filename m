Return-Path: <linux-doc+bounces-20319-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E1692C308
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jul 2024 20:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6C471C22972
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jul 2024 18:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71702BAE5;
	Tue,  9 Jul 2024 18:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="BQPV2tZE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DB3180046
	for <linux-doc@vger.kernel.org>; Tue,  9 Jul 2024 18:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720548165; cv=none; b=mSXsh4vwACFWiahujk8BGnSwvi8YgKb3oZSDg9QaK/VY0O+B+RHGXa836H/d/KMMkNKNNuVzyFMiSOemmPqgpR9JqD5WwFS9bic57o93TQxi3u5hpF//Ogz8WZngylxTAdTpQd17u2pLmrSMsV8zHfJVZyJZPkzl5jUsoWYIvH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720548165; c=relaxed/simple;
	bh=n72nzCQmu7Uf9t8urKOZKRJUvWBcV42NC38GoXt79Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IA5/KznAroAUm2znoTKfvvBXXV4KtkLSi36MvX+3Qnu+0IhdXgNd93Il9MZYPgawFfLa3wL/C7k+aLUNZGXE6ZNRulaJV8fPJMurDGRt88O7mFDuW+eLQd+Rw4BqwpG7WHmLs74J9LMTOJQ4OCTZELlvhybKb/AcU+b6TCT5XAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=BQPV2tZE; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-79f08b01ba6so1791085a.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jul 2024 11:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1720548161; x=1721152961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Irxhv9yTruFv4uXuWqjPhdyo6pTZLnzFnR9Muo7KEoo=;
        b=BQPV2tZEZICnLpb05Umv/Jzx7bSEub8Pdz99W9EsqZlYNpRyERr4JexRFYzJtrAoF3
         uW3qZRze0Ot4qF1ndh76MS7kBKImwihiN1fResPiWt9qqwljl/b2VxGCrMYQKUg5bvH7
         KVL4n7ij52DY4ADiXrEz9rR8VsKed9g2AuOtTG6epAq3AqIIJJwAgmJJOZSGBmCIgEw/
         12goDYyEy2tXHc36zeysN1lljKVa7SJ3PHO9WbBnt4XmI7zuQSpmgeJdn8bnI4zkgG1R
         EkcfgVtRl1rrQccdeHFv0kcFhjwu3ZrOL4pZbze9zCgLerq47O8/EhfPTzXpFOfiSRqX
         9DUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720548161; x=1721152961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Irxhv9yTruFv4uXuWqjPhdyo6pTZLnzFnR9Muo7KEoo=;
        b=NkOHCHNSUP1jYn+Dk0ibcIKisvQPY787LI+rqN+V6/Znak6xflAKBkr9BgRlxja9h4
         sNPcflSdEhz6YNKFpWzBB7cQm8PQqASseNfZH8gzrvj/yYazE/f+lK+ZRQX9A/4P/7pQ
         fQKPSVAX5FD3ZVI+fOEblsgY0k28MnqNQuSBcrPuz+R1qdAGSvaQHGkPYnShCIevoNF8
         spaFL9P9OWs4fpKWFzSjPKQSsiBVQor59IZ423k/tjM7G5lUUd4XlcbwvMbBKv9rbjZ/
         lj+ewO7yR5yitZj40YHpvORvaeDV8ZNBzPUxEKq9B7qrcvhmqKBclSEHIMdqDX9qArEV
         fLKw==
X-Forwarded-Encrypted: i=1; AJvYcCUOOoKIVVkI/PVO789H/wNry0095blnN451Mp1+vCpkFxHgtX1w9P8O1IVh41FrCnq5W/WmDgSB/L/8FtXYh15RrQikRWJ7r2Ff
X-Gm-Message-State: AOJu0YwlGfwOIB9by+bLk55qszk6+Ey26CgIxmGW1J3ZjA/JDL6AIQCm
	wUOrDJ73na3pNdmmMNAxhF6EWgJ0tWeIXtEjMQ8VzXkIj260oB1YVofK0Z+02K0=
X-Google-Smtp-Source: AGHT+IFcexZAj7/r7NPrrKocvgmKcfvcVaFp6UYS7n+YHaDTdFeFG0AfnTvdUAPHWGgPEURuJSjIRA==
X-Received: by 2002:a05:620a:46a4:b0:79d:554d:731f with SMTP id af79cd13be357-79f1b5bbce8mr505280485a.29.1720548161376;
        Tue, 09 Jul 2024 11:02:41 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff6756sm119458485a.2.2024.07.09.11.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 11:02:40 -0700 (PDT)
Date: Tue, 9 Jul 2024 14:02:31 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Waiman Long <longman@redhat.com>
Cc: Kamalesh Babulal <kamalesh.babulal@oracle.com>,
	Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
	Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH-cgroup v2] cgroup: Show # of subsystem CSSes in root
 cgroup.stat
Message-ID: <20240709180231.GA251628@cmpxchg.org>
References: <20240709132814.2198740-1-longman@redhat.com>
 <1c0d9ee1-e80a-46da-a48d-2ab23dd04673@oracle.com>
 <4291c0ed-bc37-46de-b081-271e8b299b1d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4291c0ed-bc37-46de-b081-271e8b299b1d@redhat.com>

On Tue, Jul 09, 2024 at 12:09:05PM -0400, Waiman Long wrote:
> On 7/9/24 11:58, Kamalesh Babulal wrote:
> >
> > On 7/9/24 6:58 PM, Waiman Long wrote:
> >> The /proc/cgroups file shows the number of cgroups for each of the
> >> subsystems.  With cgroup v1, the number of CSSes is the same as the
> >> number of cgroups. That is not the case anymore with cgroup v2. The
> >> /proc/cgroups file cannot show the actual number of CSSes for the
> >> subsystems that are bound to cgroup v2.
> >>
> >> So if a v2 cgroup subsystem is leaking cgroups (usually memory cgroup),
> >> we can't tell by looking at /proc/cgroups which cgroup subsystems may be
> >> responsible.  This patch adds CSS counts in the cgroup_subsys structure
> >> to keep track of the number of CSSes for each of the cgroup subsystems.
> >>
> >> As cgroup v2 had deprecated the use of /proc/cgroups, the root
> >> cgroup.stat file is extended to show the number of outstanding CSSes
> >> associated with all the non-inhibited cgroup subsystems that have been
> >> bound to cgroup v2.  This will help us pinpoint which subsystems may be
> >> responsible for the increasing number of dying (nr_dying_descendants)
> >> cgroups.
> >>
> >> The cgroup-v2.rst file is updated to discuss this new behavior.
> >>
> >> With this patch applied, a sample output from root cgroup.stat file
> >> was shown below.
> >>
> >> 	nr_descendants 53
> >> 	nr_dying_descendants 34
> >> 	nr_cpuset 1
> >> 	nr_cpu 40
> >> 	nr_io 40
> >> 	nr_memory 87
> >> 	nr_perf_event 54
> >> 	nr_hugetlb 1
> >> 	nr_pids 53
> >> 	nr_rdma 1
> >> 	nr_misc 1
> >>
> >> In this particular case, it can be seen that memory cgroup is the most
> >> likely culprit for causing the 34 dying cgroups.
> >>
> >> Signed-off-by: Waiman Long <longman@redhat.com>
> >> ---
> >>   Documentation/admin-guide/cgroup-v2.rst | 10 ++++++++--
> >>   include/linux/cgroup-defs.h             |  3 +++
> >>   kernel/cgroup/cgroup.c                  | 19 +++++++++++++++++++
> >>   3 files changed, 30 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> >> index 52763d6b2919..65af2f30196f 100644
> >> --- a/Documentation/admin-guide/cgroup-v2.rst
> >> +++ b/Documentation/admin-guide/cgroup-v2.rst
> >> @@ -981,6 +981,12 @@ All cgroup core files are prefixed with "cgroup."
> >>   		A dying cgroup can consume system resources not exceeding
> >>   		limits, which were active at the moment of cgroup deletion.
> >>   
> >> +	  nr_<cgroup_subsys>
> >> +		Total number of cgroups associated with that cgroup
> >> +		subsystem, e.g. cpuset or memory.  These cgroup counts
> >> +		will only be shown in the root cgroup and for subsystems
> >> +		bound to cgroup v2.
> >> +
> >>     cgroup.freeze
> >>   	A read-write single value file which exists on non-root cgroups.
> >>   	Allowed values are "0" and "1". The default is "0".
> >> @@ -2930,8 +2936,8 @@ Deprecated v1 Core Features
> >>   
> >>   - "cgroup.clone_children" is removed.
> >>   
> >> -- /proc/cgroups is meaningless for v2.  Use "cgroup.controllers" file
> >> -  at the root instead.
> >> +- /proc/cgroups is meaningless for v2.  Use "cgroup.controllers" or
> >> +  "cgroup.stat" files at the root instead.
> >>   
> >>   
> >>   Issues with v1 and Rationales for v2
> >> diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
> >> index b36690ca0d3f..522ab77f0406 100644
> >> --- a/include/linux/cgroup-defs.h
> >> +++ b/include/linux/cgroup-defs.h
> >> @@ -776,6 +776,9 @@ struct cgroup_subsys {
> >>   	 * specifies the mask of subsystems that this one depends on.
> >>   	 */
> >>   	unsigned int depends_on;
> >> +
> >> +	/* Number of CSSes, used only for /proc/cgroups */
> >> +	atomic_t nr_csses;
> >>   };
> >>   
> >>   extern struct percpu_rw_semaphore cgroup_threadgroup_rwsem;
> >> diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
> >> index c8e4b62b436a..48eba2737b1a 100644
> >> --- a/kernel/cgroup/cgroup.c
> >> +++ b/kernel/cgroup/cgroup.c
> >> @@ -3669,12 +3669,27 @@ static int cgroup_events_show(struct seq_file *seq, void *v)
> >>   static int cgroup_stat_show(struct seq_file *seq, void *v)
> >>   {
> >>   	struct cgroup *cgroup = seq_css(seq)->cgroup;
> >> +	struct cgroup_subsys *ss;
> >> +	int i;
> >>   
> >>   	seq_printf(seq, "nr_descendants %d\n",
> >>   		   cgroup->nr_descendants);
> >>   	seq_printf(seq, "nr_dying_descendants %d\n",
> >>   		   cgroup->nr_dying_descendants);
> >>   
> >> +	if (cgroup_parent(cgroup))
> >> +		return 0;
> >> +
> >> +	/*
> >> +	 * For the root cgroup, shows the number of csses associated
> >> +	 * with each of non-inhibited cgroup subsystems bound to it.
> >> +	 */
> >> +	do_each_subsys_mask(ss, i, ~cgrp_dfl_inhibit_ss_mask) {
> >> +		if (ss->root != &cgrp_dfl_root)
> >> +			continue;
> >> +		seq_printf(seq, "nr_%s %d\n", ss->name,
> >> +			   atomic_read(&ss->nr_csses));
> >> +	} while_each_subsys_mask();
> >>   	return 0;
> >>   }
> >>   
> > Thanks for adding nr_csses, the patch looks good to me. A preference comment,
> > nr_<subsys>_css format, makes it easier to interpret the count.
> >
> > With or without the changes to the cgroup subsys format:
> >
> > Reviewed-by: Kamalesh Babulal <kamalesh.babulal@oracle.com>
> 
> Thanks for the review.
> 
> CSS is a kernel internal name for cgroup subsystem state. Non kernel 
> developers or users may not know what CSS is and cgroup-v2.rst doesn't 
> mention CSS at all. So I don't think it is a good idea to add the "_css" 
> suffix. From the user point of view, the proper term to use here is the 
> number of cgroups, just like what "nr_descendants" and 
> "nr_dying_descendants" are referring to before this patch. The only 
> issue that I didn't address is the use of the proper plural form which 
> is hard for cgroup subsystem names that we have.

It's not quite the same right? You could have 1 dying cgroup with
multiple zombie subsys states. At least in theory. It could be
confusing to add these counts without introducing the css concept.

I also wonder if it would be better to just report the dying css
instead of all of them. Live ones are 1) under user control and 2)
easy to inspect in cgroupfs. I can see a scenario for the
nr_descendants aggregation ("Oh, that's a lot of subgroups!"); and a
scenario for dying css ("Oh, it's memory state pinning dead groups!").
But not so much "Oh, that's a lot of live memory controlled groups!"

I can't think of a good name for it though.

nr_dying_memory_css is a mouthful

nr_offline_memory?

nr_zombie_memory?

Should this be in debugfs?

