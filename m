Return-Path: <linux-doc+bounces-1608-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0EA7DF243
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 13:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB40B281B1C
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 12:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9812A18638;
	Thu,  2 Nov 2023 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zu2OGUil"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028E714F6C;
	Thu,  2 Nov 2023 12:24:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F612112;
	Thu,  2 Nov 2023 05:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698927854; x=1730463854;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=Hn3HxLIchr3g7rx6JvOiqgfPvzN/KUrJgEv9IL8moEQ=;
  b=Zu2OGUilRUEJA+Te4WPvqSffFzvSwG0MsE2OEIZKbXvJWnq4n2MeAu6g
   pARWg1MBBo6D2UGGFtjclSrRT9FSdURMqMxRoWSj9lo9LjE1P1CY8iah8
   mrRZZudvj5oR3He03L9b4rfbIwq6hmHgkwE0s1eWeJeUrffnkNmzLEVN9
   cjcAYC0H5oA/OH7b35txgJ5Fxtl+9Id3KHnpwj5S+2zt1zeoTEEnFNMtT
   vK22KWoR7WxQr+3YBA8hN4422lKgFoM7RiGNPvl4Jf9ARoZhiVbfx9H77
   +o/BTEp/OHL5K8dqg/spGrGKgA6ZJrvOZxkwofnTnsDKM+kRwcYYe5STf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7340674"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7340674"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="2523649"
Received: from sdsadara-mobl.ger.corp.intel.com ([10.251.215.6])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:24:09 -0700
Date: Thu, 2 Nov 2023 14:24:06 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
cc: Ma Jun <Jun.Ma2@amd.com>, amd-gfx@lists.freedesktop.org, lenb@kernel.org, 
    davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
    pabeni@redhat.com, alexander.deucher@amd.com, Lijo.Lazar@amd.com, 
    mario.limonciello@amd.com, Netdev <netdev@vger.kernel.org>, 
    linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    majun@amd.com, Evan Quan <quanliangl@hotmail.com>
Subject: Re: [Patch v13 4/9] wifi: mac80211: Add support for WBRF features
In-Reply-To: <b080757463a1f55a38484e3ea39fd3697e98409e.camel@sipsolutions.net>
Message-ID: <e42c5484-d66-e41a-8b2e-a1fa4495ce2@linux.intel.com>
References: <20231030071832.2217118-1-Jun.Ma2@amd.com>  <20231030071832.2217118-5-Jun.Ma2@amd.com>  <5b8ea81c-dd4c-7f2a-c862-b9a0aab16044@linux.intel.com> <b080757463a1f55a38484e3ea39fd3697e98409e.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-387861400-1698927329=:2124"
Content-ID: <8f10c3aa-da5e-8e6-b212-dcb8f7f64325@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-387861400-1698927329=:2124
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <163c94a-bfac-2984-64c1-1c2281e27410@linux.intel.com>

On Thu, 2 Nov 2023, Johannes Berg wrote:
> On Thu, 2023-11-02 at 13:55 +0200, Ilpo J�rvinen wrote:
> 
> > > +static void get_chan_freq_boundary(u32 center_freq, u32 bandwidth, u64 *start, u64 *end)
> > > +{
> > > +	bandwidth = MHZ_TO_KHZ(bandwidth);
> > > +	center_freq = MHZ_TO_KHZ(center_freq);
> > 
> > Please use include/linux/units.h ones for these too.
> 
> Now we're feature creeping though - this has existed for *years* in the
> wireless stack with many instances? We can convert them over, I guess,
> but not sure that makes much sense here - we'd want to add such macros
> to units.h, but ... moving them can be independent of this patch?

What new macros you're talking about? Nothing new needs to be added 
as there's already KHZ_PER_MHZ so these would just be:

	bandwidth *= KHZ_PER_MHZ;
	center_freq *= KHZ_PER_MHZ;

Everything can of course be postponed by the argument that some 
subsystem specific mechanism has been there before the generic one
but the end of that road won't be pretty... What I was trying to do
here was to point out the new stuff introduced by this series into the 
direction of the generic thing.

-- 
 i.
--8323329-387861400-1698927329=:2124--

