Return-Path: <linux-doc+bounces-1232-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A84E17D893C
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 21:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48AFAB20F66
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 19:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042103B7BB;
	Thu, 26 Oct 2023 19:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmcIatbs"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6847D3C090
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 19:54:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37811B1;
	Thu, 26 Oct 2023 12:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698350043; x=1729886043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YoVYbR7RlCt/ClEPZWOyiJe3KsZblEHvYygtlHWLDFU=;
  b=EmcIatbsYHhuwmtHYEXrrRz9qvMDz0ldoQ5iHs8bIouc8m3OzlkvPKzn
   a0VCffsODoovEw3C+vxX2++tM6c9laDHR+mZVWrJrk7LOoD5jsyCYXAwp
   fojs9+KFtKphNW/cwrLTtgQMz6nqzy+kCJ4jNSguGcu3h7ZHZk4tBEuqz
   yzQC+8uQCBQIDK2SlzwKasd3w9djxF6BN3bHv/iZ3WFS2CSeL4J8LrpIm
   CoXSXk/2bJtc7F7aDQL2hQln8ZZLdERPP1tTbqlRdEaMZhXYSIKn7/Cth
   6ZTRQNGpOdoH3Eg1pQWy6uwjv3oB6EtJKWSNFdIm95iMltdxUxIPgGC2I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="384841179"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="384841179"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 12:54:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="735856795"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="735856795"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.74])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 12:54:02 -0700
Date: Thu, 26 Oct 2023 12:54:01 -0700
From: Tony Luck <tony.luck@intel.com>
To: "Moger, Babu" <babu.moger@amd.com>
Cc: Peter Newman <peternewman@google.com>,
	"Yu, Fenghua" <fenghua.yu@intel.com>,
	"Chatre, Reinette" <reinette.chatre@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"x86@kernel.org" <x86@kernel.org>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: Re: [PATCH] x86/resctrl: mba_MBps: Fall back to total b/w if local
 b/w unavailable
Message-ID: <ZTrD2Q8Hpk1EjIBA@agluck-desk3>
References: <20231024181600.8270-1-tony.luck@intel.com>
 <CALPaoChftF-H6GauKq4-c_qBJP1GJbR3-ByE5krsaQF4y4y9oQ@mail.gmail.com>
 <ZTluypa9bCWv4k2n@agluck-desk3>
 <CALPaoCj72V=o60tqsFMRzaeUw-1+rN7pyhsdCyVEV=0tN_CZ7A@mail.gmail.com>
 <95fc35a2-2f19-4ba5-ad3a-7d7ae578289c@amd.com>
 <SJ1PR11MB60837D379853EFB14A6A20BBFCDDA@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <a55c7d7e-019f-4eb1-9ae7-ec5e0f810bd3@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a55c7d7e-019f-4eb1-9ae7-ec5e0f810bd3@amd.com>

On Thu, Oct 26, 2023 at 12:19:14PM -0500, Moger, Babu wrote:
> Hi Tony,
> 
> On 10/26/23 11:09, Luck, Tony wrote:
> >>> What I meant was I think it would be enough to just give the function
> >>> you added a name that's more specific to the Mbps controller use case.
> >>> For example, get_mba_sc_mbm_state().
> >>
> >> I actually liked this idea. Add a new function get_mba_sc_mbm_state. That
> >> way we exactly know why this function is used. I see you already sent a v2
> >> making the event global. Making it global may not be good idea. Can you
> >> please update the patch and resend. Also please add the comment about why
> >> you are adding that function.
> > 
> > Can you explain why you don't like the global? If there is a better name for it,
> > or a better comment for what it does, or you think the code that sets the value
> > could be clearer, then I'm happy to make changes there.
> 
> My theory is always try to localize the changes and avoid global variables
> when there are other ways to do the same thing. It may not be strong argument.

A good theory. I do this too. But it seems I'm more likely to go with
global variables if the cost of avoiding them is high. But "cost" is
a very subjective thing.

> > Which events are supported by a system is a static property. Figuring out once
> > at "init" time which event to use for mba_MBps seems a better choice than
> > re-checking for each of possibly hundreds of RMIDs every second. Even though
> > the check is cheap, it is utterly pointless.
> 
> mbm_update happens here only to the active group (not on all the available
> rmids).

mbaMBps needs to get data from all active RMIDs to provide input to
the feedback loop. That might be a lot of RMIDs if many jobs are being
monitored independently (which I believe is a common mode of operation).

> Also, I am not clear about weather this is going fix your problem.
> You are setting the MSR limit based on total bandwidth. The MSR you are
> writing may only have the local socket effect. In cases where all the
> memory is allocated from remote socket then writing the MSR may not have
> any effect.

Intel MBA controls operate on all memory operations that miss the L3
cache (whether they are going to a local memory controller, or across
a UPI link to a memory controller on another socket).

> Also you said you don't have the hardware to verify. Its always good to
> verify if is really fixing the problem. my 02 cents.

I don't have hardare that enforces this. But Linux does have a boot
option clearcpuid=cqm_mbm_local to tell Linux that the system doesn't
provide a local counter. I've been using that for all my testing.

-Tony

