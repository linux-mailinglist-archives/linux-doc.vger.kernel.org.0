Return-Path: <linux-doc+bounces-1132-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A87647D7479
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 21:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6245E281D30
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 19:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E8131A76;
	Wed, 25 Oct 2023 19:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRv+3ZTY"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B1A31A72
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 19:38:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD22F13D;
	Wed, 25 Oct 2023 12:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698262733; x=1729798733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+1FcziEC4Fko1fRoSTXWHKNgLHQEHQDm0zdcSDsN4rg=;
  b=CRv+3ZTYOMeUbP2RZ5zdTq8OPfu4LN14lPvM37N4FR7GgvOjif27RaAl
   QREwocGm/NAamGRylFdiNow7+ZSx23ppBOORiRZ9gZKiWoCxMpZ2wKKiM
   PvBV14rzq+Ou7hmP3eNDSppNf03iw+bStLjacf3/RcF+xz6ukO9bBnZSv
   HKxKjt8w7LJZ9/oytGRD+rfOuNxcx5DcghmvPB3y9JrhP1CCAi/Z9rMiM
   4UDMsZMnun30bGtFyx6z3eeSW1rf5zFV/u2GF4Am/l5oR5m/UcqY2YfMJ
   3Q5U8mIZqfxlyUYeB1f41/JE4A/+UDT6IggpHShgd4PyYJ681h75T//Od
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="8941200"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="8941200"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 12:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829350374"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="829350374"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.74])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 12:38:52 -0700
Date: Wed, 25 Oct 2023 12:38:50 -0700
From: Tony Luck <tony.luck@intel.com>
To: Peter Newman <peternewman@google.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	Babu Moger <babu.moger@amd.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] x86/resctrl: mba_MBps: Fall back to total b/w if local
 b/w unavailable
Message-ID: <ZTluypa9bCWv4k2n@agluck-desk3>
References: <20231024181600.8270-1-tony.luck@intel.com>
 <CALPaoChftF-H6GauKq4-c_qBJP1GJbR3-ByE5krsaQF4y4y9oQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALPaoChftF-H6GauKq4-c_qBJP1GJbR3-ByE5krsaQF4y4y9oQ@mail.gmail.com>

On Wed, Oct 25, 2023 at 02:46:53PM +0200, Peter Newman wrote:
> Hi Tony,
> 
> On Tue, Oct 24, 2023 at 8:16 PM Tony Luck <tony.luck@intel.com> wrote:
> > --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> > +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> > @@ -418,6 +418,14 @@ static int __mon_event_count(u32 rmid, struct rmid_read *rr)
> >         return 0;
> >  }
> >
> > +static struct mbm_state *get_mbm_data(struct rdt_domain *dom_mbm, int rmid)
> > +{
> > +       if (is_mbm_local_enabled())
> > +               return &dom_mbm->mbm_local[rmid];
> > +
> > +       return &dom_mbm->mbm_total[rmid];
> > +}
> 
> That looks very similar to the get_mbm_state() function I added to
> this same file recently:
> 
> https://lore.kernel.org/all/20221220164132.443083-2-peternewman%40google.com
> 
> I think the name you picked is misleadingly general. "local if
> available, otherwise total" seems to be a choice specific to the mbps
> controller. I think these functions should be reconciled a little
> better.
> 

Peter (and Babu, who made the same point about get_mbm_state().

Do you want to see your function extended to do the "pick an MBM event?"

I could add a s/w defined "event" to the enum resctrl_event_id and
extend get_mbm_state() like this:


static struct mbm_state *get_mbm_state(struct rdt_domain *d, u32 rmid,
				       enum resctrl_event_id evtid)
{
	switch (evtid) {
	case QOS_L3_MBM_TOTAL_EVENT_ID:
		return &d->mbm_total[rmid];
	case QOS_L3_MBM_LOCAL_EVENT_ID:
		return &d->mbm_local[rmid];
+	case QOS_L3_MBM_LOCAL_OR_TOTAL_EVENT_ID:
+		if (is_mbm_local_enabled())
+			return &d->mbm_local[rmid];
+		if (is_mbm_total_enabled())
+			return &d->mbm_total[rmid];
+		fallthrough;
	default:
		return NULL;
	}
}

Is this the direction you are thinking of?

Callers then look like:

static void mbm_bw_count(u32 rmid, struct rmid_read *rr)
{
	struct mbm_state *m = get_mbm_state(rr->d, rmid, QOS_L3_MBM_LOCAL_OR_TOTAL_EVENT_ID);
	u64 cur_bw, bytes, cur_bytes;

similar for the other three places where this is needed.

Any suggestions on how "QOS_L3_MBM_LOCAL_OR_TOTAL_EVENT_ID" could be
abbreviated, or just have some different, but descriptive, name?

-Tony

