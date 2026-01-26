Return-Path: <linux-doc+bounces-74008-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNI0Helud2m8gAEAu9opvQ
	(envelope-from <linux-doc+bounces-74008-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 26 Jan 2026 14:40:57 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1C088FF6
	for <lists+linux-doc@lfdr.de>; Mon, 26 Jan 2026 14:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59BD130916EA
	for <lists+linux-doc@lfdr.de>; Mon, 26 Jan 2026 13:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C7D33A6E8;
	Mon, 26 Jan 2026 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3QJqKXR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D24C33A00C;
	Mon, 26 Jan 2026 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434542; cv=none; b=J4rLS/NMcO/7/pVqvunN81xQo1dvvhOZWITNAVS+Ai/2GbK+wsaHYn9pX/dhCykwQPuepHP/8CbsWmLA3LTeWCz38MduuUrxPGGr/OfTEPJgq/odf4fYI7Ot/yWNLi+ckSnUO0N0VTqPOoq4Jxpdx5oT5YubyIWaVez9y4FS4Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434542; c=relaxed/simple;
	bh=+F6fYbHMKoc4x2WxstoV/N1PVSE9Jur6Eo6X4yGUds0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7PfDjGHa8ezWdfwfzVMg1Y09FjPp3tGPfOiNf0fCUJ+npjivh8Xo6eqyRmL+bdzMqP2YWif+9Zsp+ZjM9fEsrHzCbp1zwyuxb8dcx33uXbjiiak2ghyZkFf44f2cnwQRPdk5/ueDmpy5wIeFfhMIA3xogZT2lVzGxLE8VuW3xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3QJqKXR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769434540; x=1800970540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+F6fYbHMKoc4x2WxstoV/N1PVSE9Jur6Eo6X4yGUds0=;
  b=A3QJqKXR4pnhwCaZztC4TCtaDQPe+gZZlDAc8U6O21eis0gly7XvsoXC
   lSpFM7nsdeEqG509fjC1GCsc0/Q+zQe8xIey5/dDb6Trvjfh0tBc89X09
   v4PER+NU2INypT/aysjdsjSQfpQlbNbV7RwmfPYWyxSytUNcCtNBBd6xY
   Aul3cvOQAW4CWk8Xv4JVRsTlOt0Kd2DpUJkISKyrTdqz8bMO/lNHjFDno
   e0K4V/acaIru5qKFmEGQ3b5juJdW1P+ycgXB8dq4BgwITtAt8ldXWwUpT
   514ScfDDzlQsYPIYAvH0RNLM+wuMrium9HzEsiASsafIgLw4qq90YCEhY
   A==;
X-CSE-ConnectionGUID: 0ddJiwRkQyOA76j2mxO4JQ==
X-CSE-MsgGUID: CCzUsmkvTYW7vIzic8YkMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82042151"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="82042151"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 05:35:40 -0800
X-CSE-ConnectionGUID: CLCut5vYRsiTnTKyf1GvIQ==
X-CSE-MsgGUID: IHKxvmhkR8upyYnpRiId9Q==
X-ExtLoop1: 1
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.122])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 05:35:36 -0800
Date: Mon, 26 Jan 2026 15:35:34 +0200
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
Message-ID: <aXdtpkL5QUhhB_hh@smile.fi.intel.com>
References: <20260123-adf41513-iio-driver-v5-0-2dce812a2dda@analog.com>
 <20260123-adf41513-iio-driver-v5-2-2dce812a2dda@analog.com>
 <aXdUvRZ9NmP5Nh95@smile.fi.intel.com>
 <byitgzjli5gsq5v66topve7ip3inkk2udwhuihjdp6bknnkmos@tv226l7tek7s>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <byitgzjli5gsq5v66topve7ip3inkk2udwhuihjdp6bknnkmos@tv226l7tek7s>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-74008-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C1C088FF6
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 12:42:53PM +0000, Rodrigo Alencar wrote:
> On 26/01/26 01:49PM, Andy Shevchenko wrote:
> > On Fri, Jan 23, 2026 at 03:53:07PM +0000, Rodrigo Alencar via B4 Relay wrote:

...

> > > +static int __iio_str_to_fixpoint64(const char *str, u64 fract_mult,
> > > +				   s64 *integer, s64 *fract, bool scale_db)
> > > +{
> > > +	u64 i = 0, f = 0;
> > > +	char *end;
> > > +	int digit_count, precision = ffs(fract_mult);
> > > +	bool negative = false;
> > > +
> > > +	if (str[0] == '-') {
> > > +		negative = true;
> > > +		str++;
> > > +	} else if (str[0] == '+') {
> > > +		str++;
> > > +	}
> > > +
> > > +	i = simple_strtoull(str, &end, 10);
> > > +	digit_count = end - str;
> > > +	if (digit_count > 20)
> > > +		return -EINVAL;
> > 
> > Not really. If we are talking about decimal (only) cases we need to also count
> > leading 0:s.
> > 
> > 0000000000000000000000000000000025 is still 25, no overflow.
> > 
> > That's why I recommend to have a helper, maybe for now locally here, like
> > 
> > int safe_strtoull(..., unsigned long long *res)
> > {
> > 	...
> > }
> 
> Are you suggesting to not use simple_strtoull then?

Nope, I suggest to do an additional step before checking for the range.

> Understood, leading zeros can be ignored only when parsing the integer 
> part. Also, would be nice to have truncation of the fractional part
> while doing the parsing. How about:
> 
> static int iio_safe_strtoull(const char *str, const char **end,
> 			     size_t max_chars, u64 *res)

> - max_chars = 0: ignores leading 0's and process all digits
> - max_chars > 0: process only initial max_chars digits and ignores the rest

I'm not sure why we would need that. It should parse the whole line until the
first invalid character or overflow.

> on overflow of u64, the function would return -EOVERFLOW
> 
> > that will do all necessary checks and returns -EINVAL, -ERANGE, et cetera.
> > In the below we would need check for the error codes respectively.
> > 
> > > +	if (precision && *end == '.') {
> > > +		str = end + 1;
> > > +		f = simple_strtoull(str, &end, 10);
> > > +		digit_count = end - str;
> > > +		if (!digit_count || digit_count > 20)
> > > +			return -EINVAL;
> > > +
> > > +		if (digit_count > precision) {
> > > +			digit_count -= precision;
> > > +			f = div64_u64(f, int_pow(10, digit_count));
> > > +		} else {
> > > +			digit_count = precision - digit_count;
> > > +			f *= int_pow(10, digit_count);
> > > +		}
> > > +	} else if (!digit_count) {
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (scale_db) {
> > 
> > > +		/* Ignore the dB suffix */
> > > +		if (!strncmp(end, " dB", sizeof(" dB") - 1))
> > > +			end += sizeof(" dB") - 1;
> > > +		else if (!strncmp(end, "dB", sizeof("dB") - 1))
> > > +			end += sizeof("dB") - 1;
> > 
> > Now we have strends()
> 
> strends() would not account for the acceptable '\n' before the end.

Good point.

> I don't think we would need to test for " dB", " dB\n", "dB" and "dB\n"

Then you can try sysfs_eq() which does that check. But I think it requires
the (end of the) string to be exact, and not something like 'dB   \n'.

-- 
With Best Regards,
Andy Shevchenko



