Return-Path: <linux-doc+bounces-74021-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMxpIlCRd2m9hgEAu9opvQ
	(envelope-from <linux-doc+bounces-74021-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 26 Jan 2026 17:07:44 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF73D8A7B5
	for <lists+linux-doc@lfdr.de>; Mon, 26 Jan 2026 17:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E08F9301B15B
	for <lists+linux-doc@lfdr.de>; Mon, 26 Jan 2026 16:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE432D1F64;
	Mon, 26 Jan 2026 16:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRo7fIlc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB63629E0E7;
	Mon, 26 Jan 2026 16:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443660; cv=none; b=SfmQEGPDL4ACriXs976Kq6oWB6noG+tgdjhT2KvCdTmQCF/qJWeXpFV4GxTgEkadhrjrdmrCQiWFegM87YhDHbT94vR4goM6p0O2oPIXtFzyvsw2Rr4aVSvNLOyt1LLB/xP0+6thH5fFnqyyONcuO32kpOEz5MT8kAGlb+BdQSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443660; c=relaxed/simple;
	bh=+/rUO9seL0e9+Zk1utxQiFfJLe8+T44OlW/g/uuuIQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVpMp1xY32EYUKqtakDAG0X2GyqXho+tRpCFsVg5cQOwHafPss3znBIBNn/bDiZOZBQc0DO7I9hvCM9zKwiQiPp86l3TSm2AVR6rOssPD0l95wSMBVgEzNaCNDV4ohDh3CQ9SL7TieEByNHqC5PJjOYvhJkruXhIMDtjzmUE2j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRo7fIlc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769443659; x=1800979659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+/rUO9seL0e9+Zk1utxQiFfJLe8+T44OlW/g/uuuIQY=;
  b=iRo7fIlcuIaUfpDuSl4fNpSUrua7v2v1n5rOns4qe9eVhp7qucNI2Mlq
   lMu6jrJ7e7YP00f0Q9QsGL4tBW4qd8vLxOp4nuF3w2/UOHMfUN9gjdzfl
   r3KuyTKX7yvUEebZJkhWW83K5OBkBP/P6K6i5hG+SztWHpRGrPWwbTtLz
   rfvTKefUY/yrmkTWOqMlFynFsvysb/+649mBYgdHVv+s9YkOGb1La1hQl
   aRzQ+LTONf4hbK+zqNJcCo+gbCrtzOrhvLPTXx4ZToU9kMelesqHOP7Sc
   qukxuuvnugcJe02nqCJh+0lgn74nN/IE52wxBe/B8d4zdEF3l459qS+/y
   g==;
X-CSE-ConnectionGUID: eSWra88xQvKocCl2tSj3gA==
X-CSE-MsgGUID: mGKpk7PMTpaZLSc3HBiB7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="73207851"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="73207851"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 08:07:38 -0800
X-CSE-ConnectionGUID: +1r2TUbGSla1JjHWgV1y5A==
X-CSE-MsgGUID: RThrSbgqTOGyVlGHFlc5xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207773414"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.122])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 08:07:34 -0800
Date: Mon, 26 Jan 2026 18:07:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v5 2/8] iio: core: add fixed point parsing with 64-bit
 parts
Message-ID: <aXeRQ4AXmn1SxoNa@smile.fi.intel.com>
References: <20260123-adf41513-iio-driver-v5-0-2dce812a2dda@analog.com>
 <20260123-adf41513-iio-driver-v5-2-2dce812a2dda@analog.com>
 <aXdUvRZ9NmP5Nh95@smile.fi.intel.com>
 <byitgzjli5gsq5v66topve7ip3inkk2udwhuihjdp6bknnkmos@tv226l7tek7s>
 <aXdtpkL5QUhhB_hh@smile.fi.intel.com>
 <ty6hptfh65k2rkqo6c6mg5z6vismuvyqsu3emvqarr2rbhpvcz@kn6tzjk5xi2o>
 <aXd_0uNVm8c_Fhwd@smile.fi.intel.com>
 <n2ms3esyxlegqibu4nluut3x4c4bkjxt5xrcd4gw35xxb2tipb@a2v73y25kroc>
 <shsikp7hinoxzj7pzxopvmvgpaak4dioekh4tyvns4kv6xp46f@z5vgnisqskco>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <shsikp7hinoxzj7pzxopvmvgpaak4dioekh4tyvns4kv6xp46f@z5vgnisqskco>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-74021-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: EF73D8A7B5
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 03:30:44PM +0000, Rodrigo Alencar wrote:
> On 26/01/26 03:20PM, Rodrigo Alencar wrote:
> > On 26/01/26 04:53PM, Andy Shevchenko wrote:
> > > On Mon, Jan 26, 2026 at 02:26:20PM +0000, Rodrigo Alencar wrote:

...

> > > Why? Can you elaborate how checking amount of digits is different to
> > > check_mul_overflow()?
> > 
> > consider U64_MAX = 18_446_744_073_709_551_615 as the limit:
> > - 19_000_000_000_000_000_000 contains the same amount of digits but overflows.
> > - 18_446_744_073_710_000_000 contains the same amount of digits but overflows.
> > 
> > to catch those cases, we need to check for the overflow, everytime we read a
> > character and accumulate:
> > 
> > u64 acc;
> > 
> > while(isdigit(*str))
> > 	if (check_mul_overflow(acc, 10, &acc) ||
> > 	    check_add_overflow(acc, *str - '0', &acc))
> > 		return -EOVERFLOW;
> > 
> > *res = acc;
> > 
> > acc can get weird results if not checked. 
> 
> Thinking about it again, that check could be done only in the last step
> (20th for u64)

Does kstrto*() also perform only last check? I think they do for each
iteration.

-- 
With Best Regards,
Andy Shevchenko



