Return-Path: <linux-doc+bounces-29245-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9779B67D0
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 16:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72B3C1C21C25
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 15:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1DE213EC1;
	Wed, 30 Oct 2024 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TDrINMGT"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE223213EE9
	for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 15:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730302063; cv=none; b=uMbo9nToa7vXNJu8rVrvEmq5iNQAZ8wQWdi3xgSJGfmYdjJuiUAuc2z01LN6r83wkevvKERYbOhvL/4gatUyOCd3unlDurKNsFn/tDJbd/QW/U3eHn8pPx9C+OjZlFL7WDNcdo2DKjLRURuYaeD6sIbbIDNLRDurQykvgD4MUN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730302063; c=relaxed/simple;
	bh=6OKtBO9V7ryspxfflXMVeVAwE4QutMPA8qD3mnSFEVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMS4f05MMsTlZPuvOjqHxNmRIrCEN/3EHEEHt01xTtum/wb+FuOwJ7Uy6GjedUL6m/Ojvgi/DiNgkwLseB04NWeMGzUBGOfOVBu+++CIne8EZ65Luuv9On4YowFDHaL+Nzhm/4YlWYa8oB4R562a22DrAcZLOadfC29nFxLuBUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TDrINMGT; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c96936065dso4942a12.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 08:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730302059; x=1730906859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwB5DeVTS7vafGaY+6J9Yo9yIy438E4Wo0/qN3/NQSc=;
        b=TDrINMGTZpSN/rZovHSMnAPD7cun/wOK9GyMmx+Quxfl7AenEEbjNGySnJ7uCPpB16
         ZWPKehf9YexigaP9XkLdIskOPwL+O76EFpPssSj6dmjgILsyqb8Mfwfa5EKE/tC7mjXe
         CCeTQKR0Ly7TJLjc3qB+uX7Dytq29vQoNgCWwJ5ynYumAibrjQ+oaHqSILOObsFRdaB/
         1TxBHJRWebIOlBY5qzfJ47XjScckMlHPlLRVM1nxiPmub6q8aeskoY9iXzRFMH2I2vUb
         T2traX2jZDPga/rs1aKQ2gKAhJN7+HmaTDeHr4sZM6/hfCuo1j2de1B6dE+8mzA6sQbY
         AmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730302059; x=1730906859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwB5DeVTS7vafGaY+6J9Yo9yIy438E4Wo0/qN3/NQSc=;
        b=OViPXrEYty3aSeyBsTcE9Kt5HswUqb2FuJiopLRrSJFxpVCb9pA2BcpmBRThKOfkur
         MWVCydr4eG0+WHfB3QJgaJxIg+ygMsiNUIRAyGxB0sNSsiQ07s3Wp/RMum5FzI3FuOVM
         EFAU6qHK1ltc9xp2PahSsOPhnX4d8TJb73dyJxhEgPMTL/mL508Jymu9AC2ht+/6fB1Z
         BYjep2CHxeoIItJOhQnOOCe5u1NoucT5bpmAHn2+kfOg5TjYs2YKmPHPL6pCasM6FAy2
         rAJuyre2fmCy4O+TylPBxMwY40JwEpRw19bxM+u+nppddNFJPWxOAmX5lNSSKQMzS0in
         yQbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO3/KXs41IB9Y4JDmu9iNz4NT3Tf8JqsXZXoqwDxzo8NYZTQO36WZdFsWNim9FWeDJz8boE7ty+us=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFvU6e5NaGeQSGUdPuzkf/wpdR/ry8nSz36e2inRBDolCkoNdX
	Wv6K5XTUqu3rHmyk0JEMZr9LbGw7XUS53y83krreRRsfvs58iv6S8lGGusCYtQM=
X-Google-Smtp-Source: AGHT+IGmLSt0zTkktlnYGAfkGITlISBKJ2hsSa2xN9IdSwZmvdJA4vg8q68zy3/an3of/jLhkV7m6w==
X-Received: by 2002:a05:6402:524f:b0:5c9:7f8b:4e3d with SMTP id 4fb4d7f45d1cf-5cd54af10dcmr2933577a12.23.1730302059107;
        Wed, 30 Oct 2024 08:27:39 -0700 (PDT)
Received: from localhost (109-81-81-105.rct.o2.cz. [109.81.81.105])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62c0cb4sm4835864a12.43.2024.10.30.08.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 08:27:38 -0700 (PDT)
Date: Wed, 30 Oct 2024 16:27:37 +0100
From: Michal Hocko <mhocko@suse.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, nphamcs@gmail.com,
	shakeel.butt@linux.dev, roman.gushchin@linux.dev,
	muchun.song@linux.dev, tj@kernel.org, lizefan.x@bytedance.com,
	mkoutny@suse.com, corbet@lwn.net, lnyng@meta.com,
	akpm@linux-foundation.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 1/1] memcg/hugetlb: Adding hugeTLB counters to memcg
Message-ID: <ZyJQaXAZSMKkFVQ2@tiehlicka>
References: <20241028210505.1950884-1-joshua.hahnjy@gmail.com>
 <ZyIZ_Sq9D_v5v43l@tiehlicka>
 <20241030150102.GA706616@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030150102.GA706616@cmpxchg.org>

On Wed 30-10-24 11:01:02, Johannes Weiner wrote:
> On Wed, Oct 30, 2024 at 12:35:25PM +0100, Michal Hocko wrote:
> > On Mon 28-10-24 14:05:05, Joshua Hahn wrote:
> > [...]
> > > Changelog
> > > v3:
> > >   * Removed check for whether CGRP_ROOT_HUGETLB_ACCOUNTING is on, since
> > >     this check is already handled by lruvec_stat_mod (and doing the
> > >     check in hugetlb.c actually breaks the build if MEMCG is not
> > >     enabled.
> > [...]
> > > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > > index 190fa05635f4..fbb10e52d7ea 100644
> > > --- a/mm/hugetlb.c
> > > +++ b/mm/hugetlb.c
> > > @@ -1925,6 +1925,7 @@ void free_huge_folio(struct folio *folio)
> > >  				     pages_per_huge_page(h), folio);
> > >  	hugetlb_cgroup_uncharge_folio_rsvd(hstate_index(h),
> > >  					  pages_per_huge_page(h), folio);
> > > +	lruvec_stat_mod_folio(folio, NR_HUGETLB, -pages_per_huge_page(h));
> > >  	mem_cgroup_uncharge(folio);
> > >  	if (restore_reserve)
> > >  		h->resv_huge_pages++;
> > > @@ -3093,6 +3094,7 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
> > >  
> > >  	if (!memcg_charge_ret)
> > >  		mem_cgroup_commit_charge(folio, memcg);
> > > +	lruvec_stat_mod_folio(folio, NR_HUGETLB, pages_per_huge_page(h));
> > >  	mem_cgroup_put(memcg);
> > >  
> > >  	return folio;
> > 
> > I do not see any specific checks for CGRP_ROOT_MEMORY_HUGETLB_ACCOUNTING
> > in these paths. I guess you wanted to say that you rely on
> > mem_cgroup_commit_charge setting memcg pointer which then __lruvec_stat_mod_folio
> > relies on when updating stats.
> 
> Yes, this is what Shakeel pointed out here:
> 
> https://lore.kernel.org/lkml/il346o3nahawquum3t5rzcuuntkdpyahidpm2ctmdibj3td7pm@2aqirlm5hrdh/

It belongs to the changelog.

> > I suspect this all is done because you want a global counter to be
> > updated as well, right? Changelog doesn't say anything about that
> > though. Why is this needed when /proc/meminfo already describes the
> > global hugetlb usage?
> 
> Sigh.
> 
> vmstats is the preferred framework for cgroup stats. It makes stat
> items consistent between global and cgroup. It provides a per-node
> breakdown as well which is useful. It avoids proliferating
> cgroup-specific hooks in generic MM code.
> 
> It was a ton of work to integrate cgroup stats into vmstats and get
> rid of all the memcg special casing everywhere. You were there for all
> of it. We're not adding cgroup-specific stats unless unavoidable.
> 
> Duplication doesn't matter, either. We have plenty of overlap between
> vmstat and meminfo. By all means, send a follow-up patch to have the
> meminfo one sourced from global_node_page_state().
> 
> But you know all this.

It is not really important what _I_ do know. The commit log is not
written for me.

Joshua has greatly improved the motivation part. Yet implementation
specifics are still lacking behind mostly left in Changelog part of the
commit message which will be dropped along with the diffstat.

> I'm having a hard time seeing the way you are,
> and have been, engaging with this patch as good-faithed.

Sorry to hear that but this hasn't been my intention. My main focus has
been to put implicit assumptions into patch description. I really do not
see reason for such a pushback TBH.
-- 
Michal Hocko
SUSE Labs

