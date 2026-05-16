Return-Path: <linux-doc+bounces-87822-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF/fOuUUCGoXYgMAu9opvQ
	(envelope-from <linux-doc+bounces-87822-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 08:55:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4504B55A86C
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 08:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AA693013D45
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 06:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257201F91E3;
	Sat, 16 May 2026 06:55:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp06-ext.udag.de (smtp06-ext.udag.de [62.146.106.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE542556E;
	Sat, 16 May 2026 06:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778914529; cv=none; b=e6yq5mevgNlaB453HvG0qyZ1IQPwWo4ulBrRHDcdv0kiuuQfg1fhEEeWuqqvStgS9/xtzAc1tSq+qf4cr7kHhT+CHAZ2eGNf9nrupaJPZnr5vDee/39PkSCrBkYR0mrwW/ll+hSE0SkBM9GCkRsky9WWoo1qoYZXgshRMLZsbKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778914529; c=relaxed/simple;
	bh=z8/9X7Bvm3CIChoyhozd5xpK/hWysmqIPSywUfmGpMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmoBgh84CXrmgVXvzI33Y9Ru9gheC2aPxBQUf/IEEUD5lsxJoaevoSg9Amr8seJJV6NvYpDSS7PgaHpcwxH/lRV8IZWDmkLQFvZ8SDku5Rzvg2QfV8N9wEIZ4tR0tlMSGTlw3c7HOjJGjWqYLrquaymufjkNqL/QZJyN61zsB5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (075-132-067-156.ip-addr.inexio.net [156.67.132.75])
	by smtp06-ext.udag.de (Postfix) with ESMTPA id 9722CE0276;
	Sat, 16 May 2026 08:55:17 +0200 (CEST)
Authentication-Results: smtp06-ext.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Sat, 16 May 2026 08:55:16 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: kernel test robot <lkp@intel.com>
Cc: Horst Birthelmer <horst@birthelmer.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, oe-kbuild-all@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Horst Birthelmer <hbirthelmer@ddn.com>
Subject: Re: Re: [PATCH] dcache: add fs.dentry-limit sysctl with
 negative-first reaper
Message-ID: <aggTg7OnEm175nSQ@fedora.fritz.box>
References: <20260514-limit-dentries-cache-v1-1-431b9eb0c530@ddn.com>
 <202605152333.0pOd2zJR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605152333.0pOd2zJR-lkp@intel.com>
X-Rspamd-Queue-Id: 4504B55A86C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[birthelmer.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87822-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horst@birthelmer.de,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 11:09:54PM +0800, kernel test robot wrote:
> Hi Horst,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 5d6919055dec134de3c40167a490f33c74c12581]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Horst-Birthelmer/dcache-add-fs-dentry-limit-sysctl-with-negative-first-reaper/20260515-154600
> base:   5d6919055dec134de3c40167a490f33c74c12581
> patch link:    https://lore.kernel.org/r/20260514-limit-dentries-cache-v1-1-431b9eb0c530%40ddn.com
> patch subject: [PATCH] dcache: add fs.dentry-limit sysctl with negative-first reaper
> config: openrisc-randconfig-r073-20260515 (https://download.01.org/0day-ci/archive/20260515/202605152333.0pOd2zJR-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 10.5.0
> smatch: v0.5.0-9185-gbcc58b9c
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152333.0pOd2zJR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605152333.0pOd2zJR-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    fs/dcache.c: In function 'dentry_limit_worker_fn':
> >> fs/dcache.c:1474:7: error: implicit declaration of function 'get_nr_dentry'; did you mean 'retain_dentry'? [-Werror=implicit-function-declaration]
>     1474 |  nr = get_nr_dentry();
>          |       ^~~~~~~~~~~~~
>          |       retain_dentry
>    cc1: some warnings being treated as errors
> 
> 
> vim +1474 fs/dcache.c
> 
...
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This is puzzling to me get_nr_dentry() is defined in line 178 in the same file and first used in line 209 
and has been there since 2013.

Builds fine applied to tag v7.1-rc3 and to the current master with gcc and clang.

