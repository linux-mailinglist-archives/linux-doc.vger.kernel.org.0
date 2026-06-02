Return-Path: <linux-doc+bounces-90562-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2p2xL1UyH2pVigAAu9opvQ
	(envelope-from <linux-doc+bounces-90562-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 21:43:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1711F6317CE
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 21:43:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Hn99b9IT;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90562-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-90562-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85A563004F2A
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 19:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE75D310651;
	Tue,  2 Jun 2026 19:43:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032441DF73C;
	Tue,  2 Jun 2026 19:43:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429392; cv=none; b=mhhiRBS/5wfJRey8u95cWq1AMF2wV4IpmF5sEaIS7iE+4MjgUBgOzogWOVxcTGCEdJkgaqj+9XsplC86TaXeL9L9Ikp7IDQxCVzprvttkoTgA3Kd9/UiL45eUZyxQ173CTfoG2TbfkuVWmX0Tqb3dxYUpicbbviPjZTvT21NSYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429392; c=relaxed/simple;
	bh=gMr1z32Fe9bVRotM8G9d9TWLVOlwDGCHucb/wxnUKM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2yq1hla4rw9TMauHijLXc8yKMr8aeKDi6G7Snr5n8cmrv+fpN2cAgtRvM4v8+zrBPpMA3mFO/UAivegB1onumzGWNYLfNv/XAiIAhJZedTatmf+5KP4BTXTDPg2ZISVf7LFsu9FcPMnzz9fP7DQvd+D2sN03p8JwXwXvBhOX9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hn99b9IT; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780429391; x=1811965391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gMr1z32Fe9bVRotM8G9d9TWLVOlwDGCHucb/wxnUKM0=;
  b=Hn99b9ITzX0ObLjo5WozsW6o9ppzYWABGwLdywzUjQzIKTk+DhRtMbnJ
   IkvTZWwsdhT8wq30x3FK+3iyvtxWkgUypluBVjsLLBO0VuN6/Uh3whSwX
   a8VPJi3w8acFp3l6ptO6BzkyB2Yf6C8e3Me6/20AL/tV+VRyk6xvO+uGG
   y4cEQ+B2cOlwqFlEnWjTZWDpZyngnafcR4WftLXT7uRnzTp/ba5Rf13KD
   wW/tXA8kL3uBQp2I1Luy00815yFWGBpmk3G/P/GvD0jQwxUlw2eWyJtIp
   V8UG/difCz/ALDzgeeOE/9d1LjP1Pb0KRIPiRM9zlFJxAYEMRMCe1zGO5
   g==;
X-CSE-ConnectionGUID: d7w8yqpoQkWXOTTkJ8NPAA==
X-CSE-MsgGUID: mhdcstt9Sr+BWBNnj8A8kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92712200"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="92712200"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 12:43:10 -0700
X-CSE-ConnectionGUID: dHMUEn4ITCSkBb4SIKHeaw==
X-CSE-MsgGUID: D6zO8JWPTAy8dvwBtEzkoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="244107628"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 12:43:06 -0700
Date: Tue, 2 Jun 2026 22:43:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v15 02/12] lib: kstrtox: add local
 _parse_integer_limit_init() helper
Message-ID: <ah8yR3Os8NDNll27@ashevche-desk.local>
References: <20260531-adf41513-iio-driver-v15-0-da09adf1c0dd@analog.com>
 <20260531-adf41513-iio-driver-v15-2-da09adf1c0dd@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531-adf41513-iio-driver-v15-2-da09adf1c0dd@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90562-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rodrigo.alencar@analog.com,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:akpm@linux-foundation.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:linux@rasmusvillemoes.dk,m:senozhatsky@chromium.org,m:skhan@linuxfoundation.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:dkim,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1711F6317CE

On Sun, May 31, 2026 at 09:30:45AM +0100, Rodrigo Alencar via B4 Relay wrote:

> Add parsing helper that accepts an initial value for the accumulated
> result when parsing an 64-bit integer. It reuses current implementation
> for _parse_integer_limit(), which now consumes the new function with
> init = 0. The diff algorithm would have the documentation header and
> prototype of _parse_integer_limit() moved around so it is adjusted
> according to guidelines.

...

> +static unsigned int _parse_integer_limit_init(const char *s, unsigned int base,
> +					      unsigned long long init,

Why not name it res...

> +					      unsigned long long *p,
> +					      size_t max_chars)
>  {
>  	unsigned long long res;

...and drop this one...

>  	unsigned int rv;
>  
> -	res = 0;
> +	res = init;

...and this one?

-- 
With Best Regards,
Andy Shevchenko



