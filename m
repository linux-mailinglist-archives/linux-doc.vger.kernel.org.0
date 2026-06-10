Return-Path: <linux-doc+bounces-91872-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YFv8IkG+KWqBcgMAu9opvQ
	(envelope-from <linux-doc+bounces-91872-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 21:42:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2917566C8E5
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 21:42:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=dsgeVa7B;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91872-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91872-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F30F300B468
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 19:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB23F3750D6;
	Wed, 10 Jun 2026 19:42:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF62B37AA63;
	Wed, 10 Jun 2026 19:42:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781120572; cv=none; b=R3arl2WNJvHIH/66TVIsRVS0cT8uBJtpsH6n7QlAZ4kMYqcg6jWRdvIXn9MPf4+rVNeDSAsKIDBthN4QeVr8zA/so2tfmlCpYV+G9GNSGNi+ZAJiTGaJkfOp+VhtWBFOiDelEleAM26zswgx7KnmIE4dT85/BBwbxYxsEkNXrsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781120572; c=relaxed/simple;
	bh=dP4HXRIDYUSR15Nwgds/5wXJm0luZvRegrcYrhnfNy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQJI0LpCrbxOle+9y/vFprujbp243yRF/zoHtad6bACAqabW7rO3L7JA3YrGRHC1YL1FzlzUWGnbZ4v4QBOF0DcWiDyTQC6prbnog3LHCE37zrAy8SJs+K0kYLuqSTKbK0LzdYtBWcZoDGXj7B0gw94PPiph47Jt9DZMZkY31y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsgeVa7B; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781120572; x=1812656572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dP4HXRIDYUSR15Nwgds/5wXJm0luZvRegrcYrhnfNy4=;
  b=dsgeVa7Bkc0R/SJuoEpX7xkdwwIvOupnbyYT+Wi/AohkLjQLg+wb7Dfm
   /RghFr2p3GPDgzVVCYkZ/T+ZjAN2MDi+veStU5o//qHcGgxwrQIWjfqIS
   CUlxag0gdlCxsjfA1o8Uxh/mROv9hkZ2iCy1M/Mn44d0lXNkNSczyS7SE
   7lJMmnGml6feyXJ+jAp1zLXsUcDzcXEtj3hiGfZmLMjaYqvdjv/DNpi3A
   E/28KmTd1VV7BJ5V8M2RQxSR3D1h+7pnZBwzqg0ny5ULavjgizD8hesAJ
   sRbxJ6vuHtvlObmfsCvoK+E/3Ah+ZBmz223r+9CovfRv4XXjO2f3DW0Fk
   Q==;
X-CSE-ConnectionGUID: zwmn+M41Rf+MFVgh7xXd1A==
X-CSE-MsgGUID: bUjZ8fNQREWHooOo0dro6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92243801"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92243801"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 12:42:51 -0700
X-CSE-ConnectionGUID: 3jQBOfo8Styw2yrTc2+UuA==
X-CSE-MsgGUID: h4L2fMvHR8umsHN+MGctDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="241847089"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jun 2026 12:42:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXOp3-00000000Lq2-2zVn;
	Wed, 10 Jun 2026 19:42:45 +0000
Date: Thu, 11 Jun 2026 03:42:24 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Bapat <abhishekbapat@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Hao Ge <hao.ge@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sourav Panda <souravpanda@google.com>,
	Abhishek Bapat <abhishekbapat@google.com>
Subject: Re: [PATCH v4 6/6] kselftest: alloc_tag: extend the allocinfo ioctl
 kselftest
Message-ID: <202606110300.R4LPBVBO-lkp@intel.com>
References: <d0a8308b4d0799876d24461a8ed9b5a71d3e1e89.1781042698.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0a8308b4d0799876d24461a8ed9b5a71d3e1e89.1781042698.git.abhishekbapat@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91872-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:abhishekbapat@google.com,m:surenb@google.com,m:akpm@linux-foundation.org,m:kent.overstreet@linux.dev,m:hao.ge@linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:souravpanda@google.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,git-scm.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2917566C8E5

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20260609]
[cannot apply to akpm-mm/mm-nonmm-unstable shuah-kselftest/next shuah-kselftest/fixes linus/master v7.1-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Bapat/alloc_tag-add-ioctl-to-proc-allocinfo/20260610-081508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/d0a8308b4d0799876d24461a8ed9b5a71d3e1e89.1781042698.git.abhishekbapat%40google.com
patch subject: [PATCH v4 6/6] kselftest: alloc_tag: extend the allocinfo ioctl kselftest
config: sparc64-randconfig-r061-20260610 (https://download.01.org/0day-ci/archive/20260611/202606110300.R4LPBVBO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110300.R4LPBVBO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110300.R4LPBVBO-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/alloc_tag.c: In function 'allocinfo_compat_ioctl':
>> lib/alloc_tag.c:346:58: error: implicit declaration of function 'compat_ptr' [-Wimplicit-function-declaration]
     346 |         return allocinfo_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
         |                                                          ^~~~~~~~~~


vim +/compat_ptr +346 lib/alloc_tag.c

   341	
   342	#ifdef CONFIG_COMPAT
   343	static long allocinfo_compat_ioctl(struct file *file, unsigned int cmd,
   344					   unsigned long arg)
   345	{
 > 346		return allocinfo_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
   347	}
   348	#endif
   349	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

