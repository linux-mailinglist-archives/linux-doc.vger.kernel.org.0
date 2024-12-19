Return-Path: <linux-doc+bounces-33286-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C2F9F7A40
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 12:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA57A7A1DC2
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 11:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20624222563;
	Thu, 19 Dec 2024 11:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BwzWC/I8"
X-Original-To: linux-doc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210A62594;
	Thu, 19 Dec 2024 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734607240; cv=none; b=mIauXQJSfISAaFn3fr27HFhiJaTD0J0KI/l3nbYlp1+6fD3JUF+eg+FLusVKj9hWLCuVWHjmOdgleC+R6H0HUibvBpXVEED2C5w8xo0XlWovlY6O//618XfwcGzdDlqTF3I4XXmIPSvhvkAANbdaubT04QLgyQRJwq3f5uZBlAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734607240; c=relaxed/simple;
	bh=EDsmWMzf9S3OfYcyO6RHRy3IZpq0rx5/vGKjJUihDO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwKyfLIwxvkzf14y1nINqKNBN0/wUfgBGQ+Jbpno/EeFhrHJsfjHmQ7ClXHDqVsRgjtHVGITb7H36DDpELQ8QdgNbqmdLdvb4fERx3zSWOO4oYKQbKZqJ36eAWtx6snjnAN0PRi8FiA679jY74ot8OFPqv9Y+KF1Jj9r8GKXWQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BwzWC/I8; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1GfGA0JV2idnv7+7kDBABUrKU+s7odyP7WiVHkQNEOA=; b=BwzWC/I89b30x9Pi55xC4uCitV
	jYC4YED/tEnUpTy292BMrni5q4fzJzK1r/SeALXTgh7t2CUl+vXI0rTOAO56b6aoTdgJgvSt5vSQs
	BG2Qt64pXTqT95JuqC73pj5A9noiVFsUlRxf8nDNy5iW+o+tGyWmGzFwQDWXXBtLUKtZ2qocmt72W
	govzhSeeqqJ+eswMtPNWr17rJpcpPO6etuDZKfo7oAM4jeF3ZqLGplOZfm+GnEqlXxIH2a592Ucry
	l9deg+7By/HEesIyhuU0Np5VaJN084w0PErLMePhiGJhQxp2DplzAXFLBo272Ei3CyXmYavBuzVBP
	Q3Avk2pQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEZg-00000005QoF-33vP;
	Thu, 19 Dec 2024 11:20:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E35863003FF; Thu, 19 Dec 2024 12:20:11 +0100 (CET)
Date: Thu, 19 Dec 2024 12:20:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org,
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
	oliver.sang@intel.com, mgorman@techsingularity.net,
	david@redhat.com, peterx@redhat.com, oleg@redhat.com,
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
	lokeshgidra@google.com, minchan@google.com, jannh@google.com,
	shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20241219112011.GA34942@noisy.programming.kicks-ass.net>
References: <20241218174428.GQ2354@noisy.programming.kicks-ass.net>
 <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
 <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
 <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
 <20241219091334.GC26551@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219091334.GC26551@noisy.programming.kicks-ass.net>

On Thu, Dec 19, 2024 at 10:13:34AM +0100, Peter Zijlstra wrote:
> On Wed, Dec 18, 2024 at 01:53:17PM -0800, Suren Baghdasaryan wrote:
> 
> > Ah, ok I see now. I completely misunderstood what for_each_vma_range()
> > was doing.
> > 
> > Then I think vma_start_write() should remain inside
> > vms_gather_munmap_vmas() and all vmas in mas_detach should be
> 
> No, it must not. You really are not modifying anything yet (except the
> split, which we've already noted mark write themselves).
> 
> > write-locked, even the ones we are not modifying. Otherwise what would
> > prevent the race I mentioned before?
> > 
> > __mmap_region
> >     __mmap_prepare
> >         vms_gather_munmap_vmas // adds vmas to be unmapped into mas_detach,
> >                                                       // some locked
> > by __split_vma(), some not locked
> > 
> >                                      lock_vma_under_rcu()
> >                                          vma = mas_walk // finds
> > unlocked vma also in mas_detach
> >                                          vma_start_read(vma) //
> > succeeds since vma is not locked
> >                                          // vma->detached, vm_start,
> > vm_end checks pass
> >                                      // vma is successfully read-locked
> > 
> >        vms_clean_up_area(mas_detach)
> >             vms_clear_ptes
> >                                      // steps on a cleared PTE
> 
> So here we have the added complexity that the vma is not unhooked at
> all. Is there anything that would prevent a concurrent gup_fast() from
> doing the same -- touch a cleared PTE?
> 
> AFAICT two threads, one doing overlapping mmap() and the other doing
> gup_fast() can result in exactly this scenario.
> 
> If we don't care about the GUP case, when I'm thinking we should not
> care about the lockless RCU case either.

Also, at this point we'll just fail to find a page, and that is nothing
special. The problem with accessing an unmapped VMA is that the
page-table walk will instantiate page-tables.

Given this is an overlapping mmap -- we're going to need to those
page-tables anyway, so no harm done.

Only after the VMA is unlinked must we ensure we don't accidentally
re-instantiate page-tables.

