Return-Path: <linux-doc+bounces-556-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E647CE5E6
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 20:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86FAA1C20B2A
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 18:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A873FE4E;
	Wed, 18 Oct 2023 18:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UD7MVgXN"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503BD3FB33
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 18:08:55 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E37118;
	Wed, 18 Oct 2023 11:08:53 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c9d407bb15so60384125ad.0;
        Wed, 18 Oct 2023 11:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697652533; x=1698257333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ld6HmXLSYRRRsAXk7NaS7NcT8UF+AvonAWMQInf21LE=;
        b=UD7MVgXNuSYKv1eZYy22clNA9NTWtaxLqRhxKkHPSPZxhELa0z40BF/KmR0zmQ0ppG
         +uGwd0u+CNucMQGtrCGq4Az+kNOvC+q15pjg3zJTkMlzitoqG7igm/HRpbtYCsJi73Rq
         1i39Y/HaNF5r8dwGgMUWaiThbatG8Fvizc1q1ESMaRRDKqSOwEeMHdvVugyGy5ZGFRvc
         20DSsqreZqzEYenaKx58gw4qTeXI8s3c/mGPkgE8QgL+JeSFnqUMHu7yEuaGe4+XrVNb
         HFqerREvEdn1vetR5V2I3LrcR49e8+AHJWV2dxbrIlIpZhoxwJXvSYMLxplBd/Ap9dtT
         dJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697652533; x=1698257333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ld6HmXLSYRRRsAXk7NaS7NcT8UF+AvonAWMQInf21LE=;
        b=b4nEuYnaPxwvvmO/gFgGpcDW88HUT6nXIyC2/uhlKkSkCSMpF6pA+sF8NWqR+fC6uo
         P3OJ9LBBul/H2oORi4UulHf+FptjCHvwdbwcGSp+K2UBVYjFlOagvPqN0v8YKD7E9SGI
         OKsRiGDUU2/ZN7CEhNH4gkpBuyqC2Lja+pm8wF5STk6mmWatM7qW3QINSQxW4H9P/asv
         7hNfoQKBueokLTqQou3CJOBOfzpAeDXVEE4K+mnpj41/B8XttzbUiSZdTU4wsqgE6fkI
         QqqcvadWOqSATMGm5qGONWc0QbQaAj6x/4zGWMNk0yOYzPr7eSHaAqBY+7zo+qLwUI3e
         XR+w==
X-Gm-Message-State: AOJu0Yz0/R/jUsYOZDaGm6pVNbkRjIsJR+DTniLgIzF4wKpZufEtdC7c
	PJezY7g/Whs7NtWzPYIJt3o=
X-Google-Smtp-Source: AGHT+IFL9GKGXOI+lJTZ8Q9Eg5fpHQMg6T7SyCcLceWEuAVXgtxy1Uj2YcAhoiWi9vp+15dl+P+M/A==
X-Received: by 2002:a17:903:320c:b0:1c6:d88:dc07 with SMTP id s12-20020a170903320c00b001c60d88dc07mr125730plh.48.1697652533114;
        Wed, 18 Oct 2023 11:08:53 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::4:dfd0])
        by smtp.gmail.com with ESMTPSA id ix11-20020a170902f80b00b001b7fd27144dsm233555plb.40.2023.10.18.11.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 11:08:52 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 18 Oct 2023 08:08:51 -1000
From: Tejun Heo <tj@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH-cgroup 3/4] cgroup/cpuset: Keep track of CPUs in isolated
 partitions
Message-ID: <ZTAfM0msp8Cg-qLy@slm.duckdns.org>
References: <20231013181122.3518610-1-longman@redhat.com>
 <20231013181122.3518610-4-longman@redhat.com>
 <ZS-kt6X5Dd1lktAw@slm.duckdns.org>
 <9e2772e3-f615-5e80-6922-5a2dd06a8b07@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e2772e3-f615-5e80-6922-5a2dd06a8b07@redhat.com>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 18, 2023 at 09:30:04AM -0400, Waiman Long wrote:
> On 10/18/23 05:26, Tejun Heo wrote:
> > On Fri, Oct 13, 2023 at 02:11:21PM -0400, Waiman Long wrote:
> > ...
> > > @@ -3875,6 +3931,13 @@ static struct cftype dfl_files[] = {
> > >   		.flags = CFTYPE_ONLY_ON_ROOT | CFTYPE_DEBUG,
> > >   	},
> > > +	{
> > > +		.name = "cpus.isolated",
> > > +		.seq_show = cpuset_common_seq_show,
> > > +		.private = FILE_ISOLATED_CPULIST,
> > > +		.flags = CFTYPE_ONLY_ON_ROOT | CFTYPE_DEBUG,
> > > +	},
> > I'd much rather show this in a wq sysfs file along with other related masks,
> > and not in a DEBUG file.
> 
> It can certainly be exposed as a permanent addition to the cgroup control
> files instead of a debug only file. However this set of isolated CPUs may be
> used by others not just by workqueue. So I doubt if it should be a sysfs
> file in the workqueue directory. I can see if it is possible to put a
> symlink there point back to the cgroupfs.

I don't know whether it will happen but let's say there will be three
subsystems which call into workqueue for this. Wouldn't it be better to have
all of them in workqueue sysfs using a consistent naming scheme? What does
putting it in cgroupfs buy us?

Thanks.

-- 
tejun

