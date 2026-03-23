Return-Path: <linux-doc+bounces-80734-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEltEvuCwWnATgQAu9opvQ
	(envelope-from <linux-doc+bounces-80734-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 19:14:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 846CD2FB102
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 19:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E06C31607F0
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 16:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F05F3C3C01;
	Mon, 23 Mar 2026 16:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cb0ITN9Z"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26303C5DC4;
	Mon, 23 Mar 2026 16:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284583; cv=none; b=mvFZv7gIr7PrG5V/h24MnKtEvGWGL1l5bvkfNckL3uSweDl4QnvrLp6+HJbQoioZv+3t3mxCKD8ngUB1YCIp+FwES8yHkqUa4F+waJHs/OmlcI4i9PlMGKIq2YWhzJs85i5vkFPM7swH6Kx33kkQJwMiKdT22AfYwOO/cyBsBPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284583; c=relaxed/simple;
	bh=ooUKnytu14nYqeVs7+Kk/+bg8TZRpyjw3tTH764a1Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjgFTHjnv0fiXXKNFfUFtwZbbZGJEfbiQxu/K426OIKgTjvJicrpQn9AQ6StGp3/G8DuuKK0NG4uKsi/ZXxrkUXW9l/1TFDAyR0Zyt7GH15Q6U7AGkcsevFyXr9boVBVNoYalxjqluvRECPOGQFsDdKIkfnWC/hwT2kBSwRD9mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cb0ITN9Z; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774284581; x=1805820581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ooUKnytu14nYqeVs7+Kk/+bg8TZRpyjw3tTH764a1Uo=;
  b=Cb0ITN9ZOVhaBiTxZjresJLmIC2ANzs2aelEhcs2qZJrjk8bflvlqX9C
   ArnhV61co7vGzBp4OiHYTQwDRds6SLF6Z58sGWDiXhqztQ4n5UtorZS89
   km8/+3BT5vvgpeM0/evSwFoXCtivkbFZWBb/KNBRQn3Bv0BCk7qT+YJiM
   xbvb/PnYJoVO8roNhx1trUfuMjWuLGj1d4s110I9bPhGpulv9G1q2X4BX
   GE9t3Gr92hGEvK0oLqpT44FVVDYcdHQpC22Iq2ZBLlsMItHztkK0Qqd1A
   R0I1Fp7zAYoHJ5u1SeKSLKjgk6hDmBchyY5f5ArGrIAqnQjCfMYiw9dhO
   g==;
X-CSE-ConnectionGUID: T+3/H3IBQ8iRlblDewQs0g==
X-CSE-MsgGUID: EyZLoBKASySbTwLH23Ubhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75406542"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75406542"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:49:40 -0700
X-CSE-ConnectionGUID: pYdYR84mR/y7/JyyPJHhzw==
X-CSE-MsgGUID: yG9kF0DbS9qsXBawU1hn9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="224050586"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:49:37 -0700
Date: Mon, 23 Mar 2026 18:49:34 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Francesco Lavra <flavra@baylibre.com>
Cc: David Lechner <dlechner@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v8 2/6] iio: Replace 'sign' field with union in struct
 iio_scan_type
Message-ID: <acFvHgTo-3cxH_UP@ashevche-desk.local>
References: <20260317150316.3878107-1-flavra@baylibre.com>
 <20260317150401.3878294-1-flavra@baylibre.com>
 <4723284d-1e18-4a13-9ec1-878220af257e@baylibre.com>
 <af2128c68d2a14e1eb664ce9dc075ed02b640407.camel@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af2128c68d2a14e1eb664ce9dc075ed02b640407.camel@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80734-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 846CD2FB102
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 05:04:10PM +0100, Francesco Lavra wrote:
> On Sat, 2026-03-21 at 12:22 -0500, David Lechner wrote:
> > On 3/17/26 10:04 AM, Francesco Lavra wrote:

...

> > > + * @IIO_SCAN_FORMAT_SIGNED_INT: Signed integer (two's complement).
> > > + * @IIO_SCAN_FORMAT_UNSIGNED_INT: Unsigned integer.

> > We could make this proper kernel doc format with one comment per macro.
> 
> Actually, a set of related #defines can be documented with a single
> comment. I see a few examples doing that in include/linux/gfp_types.h and
> include/linux/fpga/fpga-mgr.h
> 
> > > +#define IIO_SCAN_FORMAT_SIGNED_INT     's'
> > > +#define IIO_SCAN_FORMAT_UNSIGNED_INT   'u'

...or use enum

/**
 * ...kernel-doc for enum...
 */
enum {
	IIO_SCAN_FORMAT_SIGNED_INT = 's',
	IIO_SCAN_FORMAT_UNSIGNED_INT = 'u',
};


-- 
With Best Regards,
Andy Shevchenko



