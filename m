Return-Path: <linux-doc+bounces-4833-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 429B480F75F
	for <lists+linux-doc@lfdr.de>; Tue, 12 Dec 2023 21:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB05DB20E84
	for <lists+linux-doc@lfdr.de>; Tue, 12 Dec 2023 20:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932B26359B;
	Tue, 12 Dec 2023 20:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhzVaL1L"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C658E;
	Tue, 12 Dec 2023 12:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702411337; x=1733947337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KAnG3YVV07ZIrxW3h036E4sox/rMCvD6OghTCdFsjyM=;
  b=DhzVaL1L3dnRidSVmvpcyDIMlcxokCblrBgMaIrpzvbsvmed/Lqriy1n
   dpRyc2S9byUaQUGz/yNwbr13/utUpJpUkqGUoBjf5vPd2L1Q3F6Bh1DHG
   qU3EzHa+9V8RuiL+dmygPNATLuB9MbaQUPVdkKj0pHH7Qktx9WuEr8liO
   LtrdF+ViboYgUYoN1XCgamWBU+oZtKWSKCLGThvvQm6R79+dmwxaCYT3W
   tcD30pounz+BlBIAfHebZkKVOkpqAYz3E8q8bIXMFBoGKaw2cbiw4X1rj
   UmoK/YGkWU9RXY461wsBW6H+OqZryfEHc2QDQpEuqpwc+rDc4RdnymANv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="379856080"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="379856080"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 12:02:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="777215190"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="777215190"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.74])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 12:02:16 -0800
Date: Tue, 12 Dec 2023 12:02:14 -0800
From: Tony Luck <tony.luck@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Peter Newman <peternewman@google.com>,
	Fenghua Yu <fenghua.yu@intel.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	Babu Moger <babu.moger@amd.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v6 1/3] x86/resctrl: Add mount option "mba_MBps_event"
Message-ID: <ZXi8Rj3znA6lmjE9@agluck-desk3>
References: <20231201214737.104444-1-tony.luck@intel.com>
 <20231207195613.153980-1-tony.luck@intel.com>
 <20231207195613.153980-2-tony.luck@intel.com>
 <CALPaoCji1yzfkA=tms3LhYMvRB+wSJQM3qzPKrHNEa7a+KduTA@mail.gmail.com>
 <ZXORTTIUKWXOsd9p@agluck-desk3>
 <CALPaoCj_OvMzD8W9+jEORewwDquM6F-sOW32Ngcy+Gm6A1+OcQ@mail.gmail.com>
 <2377bfb8-00bc-4863-8d70-425cb70c9c0b@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2377bfb8-00bc-4863-8d70-425cb70c9c0b@intel.com>

On Tue, Dec 12, 2023 at 09:54:38AM -0800, Reinette Chatre wrote:
> 
> On 12/8/2023 2:09 PM, Peter Newman wrote:
> > On Fri, Dec 8, 2023 at 1:57 PM Tony Luck <tony.luck@intel.com> wrote:
> >>
> >> On Fri, Dec 08, 2023 at 10:17:08AM -0800, Peter Newman wrote:
> >>> Hi Tony,
> >>>
> >>> On Thu, Dec 7, 2023 at 11:56 AM Tony Luck <tony.luck@intel.com> wrote:
> >>>> @@ -2715,7 +2723,25 @@ static int rdt_parse_param(struct fs_context *fc, struct fs_parameter *param)
> >>>>         case Opt_mba_mbps:
> >>>>                 if (!supports_mba_mbps())
> >>>>                         return -EINVAL;
> >>>> -               ctx->enable_mba_mbps = true;
> >>>> +               if (is_mbm_local_enabled())
> >>>> +                       ctx->enable_mba_mbps_local = true;
> >>>> +               else
> >>>> +                       return -EINVAL;
> >>>> +               return 0;
> >>>> +       case Opt_mba_mbps_event:
> >>>> +               if (!supports_mba_mbps())
> >>>> +                       return -EINVAL;
> >>>> +               if (!strcmp("mbm_local_bytes", param->string)) {
> >>>> +                       if (!is_mbm_local_enabled())
> >>>> +                               return -EINVAL;
> >>>> +                       ctx->enable_mba_mbps_local = true;
> >>>> +               } else if (!strcmp("mbm_total_bytes", param->string)) {
> >>>> +                       if (!is_mbm_total_enabled())
> >>>> +                               return -EINVAL;
> >>>> +                       ctx->enable_mba_mbps_total = true;
> >>>> +               } else {
> >>>> +                       return -EINVAL;
> >>>
> >>> It looks like if I pass
> >>> "mba_MBps_event=mbm_total_bytes,mba_MBps_event=mbm_local_bytes" I can
> >>> set both flags true.
> >>
> >> That's going to be confusing. I'll add code to stop the user from
> >> passing both options.
> > 
> > Also kind of confusing, after reading the second patch, I realized
> > "mba_MBps_event=mbm_total_bytes,mba_MBps" also results in both being
> > set. If you're able to fail the mount operation if both flags somehow
> > get set, that would address this one too.
> 
> Are two separate flags required? All existing options within struct rdt_fs_context
> are of type bool but that does not imply that it is the required type for
> all. 

Reinette,

Maybe a flag and a value?  The structure becomes:

struct rdt_fs_context {
	struct kernfs_fs_context	kfc;
	bool				enable_cdpl2;
	bool				enable_cdpl3;
	bool				enable_mba_mbps;
	enum resctrl_event_id		mba_mbps_event;
	bool				enable_debug;
};

Mount option parsing (including blocking user from setting the options
multiple times):

	case Opt_mba_mbps:
		if (!supports_mba_mbps() || ctx->enable_mba_mbps)
			return -EINVAL;
		if (is_mbm_local_enabled())
			ctx->mba_mbps_event = QOS_L3_MBM_LOCAL_EVENT_ID;
		else if (is_mbm_total_enabled())
			ctx->mba_mbps_event = QOS_L3_MBM_TOTAL_EVENT_ID;
		else
			return -EINVAL;
		ctx->enable_mba_mbps = true;
		return 0;
	case Opt_mba_mbps_event:
		if (!supports_mba_mbps() || ctx->enable_mba_mbps)
			return -EINVAL;
		if (!strcmp("mbm_local_bytes", param->string))
			ctx->mba_mbps_event = QOS_L3_MBM_LOCAL_EVENT_ID;
		else if (!strcmp("mbm_total_bytes", param->string))
			ctx->mba_mbps_event = QOS_L3_MBM_TOTAL_EVENT_ID;
		else
			return -EINVAL;
		ctx->enable_mba_mbps = true;
		return 0;


and use of the options to enable the feature:

	if (ctx->enable_mba_mbps) {
		r->membw.mba_mbps_event = ctx->mba_mbps_event;
		ret = set_mba_sc(true);
		if (ret)
			goto out_cdpl3;
	}

-Tony

