Return-Path: <linux-doc+bounces-3974-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F0A803C98
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 19:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DECA42810E0
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 18:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C290241E9;
	Mon,  4 Dec 2023 18:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cssjppck"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658A1CA;
	Mon,  4 Dec 2023 10:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701713808; x=1733249808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/IRu8CoFEU+yM59MMBNJJ8QuzWoxaN8B65KXast7tec=;
  b=cssjppck7scXQ4bDnlAVhuntd+xPzoLAT5JpC3y8wC2EOo57czHrrgCt
   CQD/C+DXOym51lG99kHktUshyW0VSL6/gp2/4qr8LixE8p99nC0PqsFI2
   V3hWH6eAfSfcRZZJZmX2AA14+8byIVwe0m7pc27PUgIiTZuOfUGjqlft8
   xrbeThLd2AygP+DQFtijGeIa0JQVMiKkNDo0soK9ICObDdIAIEJCB5vws
   FfCCH9Yo8bLIvMAatIZ2kQxPClZo1QZ2WZNvKsuqngDBmL0k3WNqcaP7d
   mrZJUNhfBj9x8MfEVpuX+u2CUEoqAUvf50UBnDAR8LQjD4lYi6UJLKv5f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="15318973"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="15318973"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 10:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="914521551"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="914521551"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.74])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 10:16:47 -0800
Date: Mon, 4 Dec 2023 10:16:46 -0800
From: Tony Luck <tony.luck@intel.com>
To: "Moger, Babu" <babu.moger@amd.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Peter Newman <peternewman@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v5] x86/resctrl: Add event choices for mba_MBps
Message-ID: <ZW4XjqxfYBFZId6H@agluck-desk3>
References: <20231128231439.81691-1-tony.luck@intel.com>
 <20231201214737.104444-1-tony.luck@intel.com>
 <fd8a44a1-9001-4e3e-a1a9-63e7f737e6e1@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd8a44a1-9001-4e3e-a1a9-63e7f737e6e1@amd.com>

On Mon, Dec 04, 2023 at 10:24:58AM -0600, Moger, Babu wrote:
> Hi Tony,
>
> You are intending to achieve two things at once here.
> 1. Adding new mount option
> 2. Changing behaviour for the current option.
> I think you need to split this patch into two. Few comments below.

Hi Babu,

Thanks for looking at this patch.

You are right. I will split the patch into two as you suggest.

> On 12/1/23 15:47, Tony Luck wrote:
> > The MBA Software Controller(mba_sc) is a feedback loop that uses
> > measurements of local memory bandwidth to adjust MBA throttling levels to
> > keep workloads in a resctrl group within a target bandwidth set in the
> > schemata file.
> >
> > But on Intel systems the memory bandwidth monitoring events are
> > independently enumerated. It is possible for a system to support
> > total memory bandwidth monitoring, but not support local bandwidth
> > monitoring. On such a system a user could not enable mba_sc mode.
> > Users will see this highly unhelpful error message from mount:
> >
> >  # mount -t resctrl -o mba_MBps resctrl /sys/fs/resctrl
> >  mount: /sys/fs/resctrl: wrong fs type, bad option, bad superblock on
> >  resctrl, missing codepage or helper program, or other error.
> >  dmesg(1) may have more information after failed mount system call.
> >
> > dmesg(1) does not provide any additional information.
> >
> > Add a new mount option "mba_MBps_event=[local|total]" that allows
> > a user to specify which monitoring event to use. Also modify the
> > existing "mba_MBps" option to switch to total bandwidth monitoring
> > if local monitoring is not available.
>
> I am not sure why you need both these options. I feel you just need one of
> these options.

I should have included "changes since v4" in with this message, and
pasted in some parts of this earlier messge from the discussion about
v4:

https://lore.kernel.org/all/ZWpF5m4mIeZdK8kv@agluck-desk3/

Having the option take "local" would give a way for a user to
avoid the failover to using "total" if they really didn't want
that to happen.

Not in that message, because I didn't think of it until later, it
opens the door for different events in the future.

But I'm also open to other suggestions on naming and function of
mount options here.

Thanks

-Tony

