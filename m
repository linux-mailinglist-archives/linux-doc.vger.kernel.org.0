Return-Path: <linux-doc+bounces-87856-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKgyIY99CGqBsAMAu9opvQ
	(envelope-from <linux-doc+bounces-87856-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 16:22:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BBE55C0A4
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 16:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2736D300A61F
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 14:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96C1280A58;
	Sat, 16 May 2026 14:22:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp02-ext3.udag.de (smtp02-ext3.udag.de [62.146.106.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01678405C53;
	Sat, 16 May 2026 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941324; cv=none; b=PEpXa9kPX4jMtZlFqKNmWJdrTPtkSe/E02LAu3T/fl3PNkXFRbO5VhVFcR9dq+T7rZyOH8chwcqQoDSbXM/LmkrM7McgAokTWquqsnu6RI4hjf0+HdnXonUJ7hw6Li8o4kpMtXxiAudoABlPZT7OwVAAuwGAiqLLsW2ZAg/G/wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941324; c=relaxed/simple;
	bh=BEWCA5byu5IXhbA56f73LcHStz+2RzytfpTliKLsGbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHYScHUVa9yK45MQIA0Sc/LIuRL3LWY+OkLB7aKNpcAuTT4V18N4h56C/hfFGSty/T9TkiuJ1kZ8QN3rmqXNQ4rfwT/bcLrURGumIGKQ8BgvprnCiOKcmgFGm0+TOs+QcLxaPMBnXAAcULL60ncurf7TEUDZRFLv+mPobeATfGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (075-132-067-156.ip-addr.inexio.net [156.67.132.75])
	by smtp02-ext3.udag.de (Postfix) with ESMTPA id 5E05BE02E4;
	Sat, 16 May 2026 16:15:25 +0200 (CEST)
Authentication-Results: smtp02-ext3.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Sat, 16 May 2026 16:15:24 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Stafford Horne <shorne@gmail.com>
Cc: kernel test robot <lkp@intel.com>, 
	Horst Birthelmer <horst@birthelmer.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Horst Birthelmer <hbirthelmer@ddn.com>
Subject: Re: Re: Re: [PATCH] dcache: add fs.dentry-limit sysctl with
 negative-first reaper
Message-ID: <agh7m6iXFMsu81AU@fedora.fritz.box>
References: <20260514-limit-dentries-cache-v1-1-431b9eb0c530@ddn.com>
 <202605152333.0pOd2zJR-lkp@intel.com>
 <aggTg7OnEm175nSQ@fedora.fritz.box>
 <aghIDLYW91C4fcd7@antec>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aghIDLYW91C4fcd7@antec>
X-Rspamd-Queue-Id: E6BBE55C0A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[birthelmer.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-87856-lists,linux-doc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horst@birthelmer.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,01.org:url,fedora.fritz.box:mid]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 11:33:48AM +0100, Stafford Horne wrote:
> On Sat, May 16, 2026 at 08:55:16AM +0200, Horst Birthelmer wrote:
> > On Fri, May 15, 2026 at 11:09:54PM +0800, kernel test robot wrote:
> > > Hi Horst,
> > > 
> > > kernel test robot noticed the following build errors:
> > > 
> > > [auto build test ERROR on 5d6919055dec134de3c40167a490f33c74c12581]
> > > 
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Horst-Birthelmer/dcache-add-fs-dentry-limit-sysctl-with-negative-first-reaper/20260515-154600
> > > base:   5d6919055dec134de3c40167a490f33c74c12581
> > > patch link:    https://lore.kernel.org/r/20260514-limit-dentries-cache-v1-1-431b9eb0c530%40ddn.com
> > > patch subject: [PATCH] dcache: add fs.dentry-limit sysctl with negative-first reaper
> > > config: openrisc-randconfig-r073-20260515 (https://download.01.org/0day-ci/archive/20260515/202605152333.0pOd2zJR-lkp@intel.com/config)
> > > compiler: or1k-linux-gcc (GCC) 10.5.0
> > > smatch: v0.5.0-9185-gbcc58b9c
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152333.0pOd2zJR-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202605152333.0pOd2zJR-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    fs/dcache.c: In function 'dentry_limit_worker_fn':
> > > >> fs/dcache.c:1474:7: error: implicit declaration of function 'get_nr_dentry'; did you mean 'retain_dentry'? [-Werror=implicit-function-declaration]
> > >     1474 |  nr = get_nr_dentry();
> > >          |       ^~~~~~~~~~~~~
> > >          |       retain_dentry
> > >    cc1: some warnings being treated as errors
> > > 
> > > 
> > > vim +1474 fs/dcache.c
> > > 
> > ...
> > > 
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > 
> > This is puzzling to me get_nr_dentry() is defined in line 178 in the same file and first used in line 209 
> > and has been there since 2013.
> > 
> > Builds fine applied to tag v7.1-rc3 and to the current master with gcc and clang.
> 
> Hi
> 
> They are protected in:
> 
> #if defined(CONFIG_SYSCTL) && defined(CONFIG_PROC_FS)
> 
> With #endif on line 247.

You are right, of course.
Thank you!

I will send a corrected version.

> 
> In the rand config as least I see:
>  # CONFIG_PROC_FS is not set
> 
> -Stafford
> 

