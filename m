Return-Path: <linux-doc+bounces-76578-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIv4EP9unGmcGAQAu9opvQ
	(envelope-from <linux-doc+bounces-76578-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 16:15:11 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1A91789A3
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 16:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1B133026306
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 15:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5DA366832;
	Mon, 23 Feb 2026 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKxXpHjP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A70A36681A;
	Mon, 23 Feb 2026 15:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859708; cv=none; b=AaFHd8wBezpICwiNls8yxIYI+YuQV6pbk3ditug3jfJs5oLZGGQino2l6M4zqHt57sFgj/8GzKCx3l9Brx1sJcwFHNzNbIdvFAUtbg+TqJiqojHoGqApAfjIVQ279sw78Hh2hbdS++Oy0S1GWCuZ5kYoV1K8mvOyrc8+iDUaahA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859708; c=relaxed/simple;
	bh=BzTuTP90OJmXVCHTiz/s79phpJ7mPbJzIPjAjZ+SIO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8JI+fwNtFEJIO7jFxEXmmUGzuormG16Jzdnt+txbSymrSaTmN26AKvV3qjN7IYA0B3rO/L7I0GvbWXXbmjLGsjaDu9cD/UrxqKbcDdyUjixl5haLti+FnukNSjHESrCzJ6v+Q+zJjz2clTP0NYY8SaEjcnidg6SqbPGonZrTaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKxXpHjP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771859707; x=1803395707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BzTuTP90OJmXVCHTiz/s79phpJ7mPbJzIPjAjZ+SIO4=;
  b=HKxXpHjP4TY4ZaE68V8hj/YthidsdGkaSEV4god2NLUbxALPAS8uTYb2
   06iSKXEZUHkl5ojScDLpHZq8v01COqN+QJid0eixraIHJBbzIHfvlDU8C
   NPayaoYn8eJBPY6UDPdfESRyo0U4mwVOAmbKLHl7JqILb+ZiSImRdbL4a
   1c5dC+TUr7l4ySLUbkURn1cZq6NIl+rk8EC5YYfd5P2RSnSF6E4pOLDVe
   mVgeWNMuqXgHWeXj+OLQp8PBfQ3Ek2JePdoCLUglHoOcZvwWGOohAPOsi
   e1gIRZ/pcp7zycuYTnh9jcMn0l8AxiXNyBVBUjPAvPuziwEEPTKUwpLuu
   w==;
X-CSE-ConnectionGUID: ayAuz6IzRruef2kE0YYodg==
X-CSE-MsgGUID: zNCYLQ/4RG6lsj+tuCcUFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90264347"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="90264347"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:15:06 -0800
X-CSE-ConnectionGUID: Tp3je2PdSMe3FbnYyuXisA==
X-CSE-MsgGUID: FWDdmDwRRvuxEFm30hmjvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="253314331"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:15:03 -0800
Date: Mon, 23 Feb 2026 17:15:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael.hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, Trevor Gamblin <tgamblin@baylibre.com>,
	Axel Haslam <ahaslam@baylibre.com>
Subject: Re: [PATCH v9 5/8] iio: adc: ad4030: Add SPI offload support
Message-ID: <aZxu9CxmTRDqMoOw@smile.fi.intel.com>
References: <cover.1771253601.git.marcelo.schmitt@analog.com>
 <20f1dc8eb6bb692eb6eb814a49e54309d973a9e4.1771253601.git.marcelo.schmitt@analog.com>
 <20260222125703.00e3152a@jic23-huawei>
 <aZxthMvaSR3zhZD8@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZxthMvaSR3zhZD8@debian-BULLSEYE-live-builder-AMD64>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76578-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: DB1A91789A3
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 12:08:52PM -0300, Marcelo Schmitt wrote:
> On 02/22, Jonathan Cameron wrote:
> > On Mon, 16 Feb 2026 12:00:39 -0300
> > Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:

...

> > > +	st->cnv_trigger = devm_pwm_get(dev, NULL);
> > > +	if (IS_ERR(st->cnv_trigger))
> > > +		return dev_err_probe(dev, PTR_ERR(st->cnv_trigger),
> > > +				     "Failed to get CNV PWM\n");
> > > +
> > > +	/*
> > > +	 * Preemptively disable the PWM, since we only want to enable it with
> > > +	 * the buffer.
> > > +	 */
> > > +	pwm_disable(st->cnv_trigger);
> > 
> > Feels like there should really be a way to get a pwm disabled in one call
> > so there isn't an edge case of it being on briefly.
> > I'm a bit surprised it defaults to on.  I guess this is because DT can provide
> > the parameters?

I believe it defaults to "as is". The immediate case (disregard to IIO) came
to my mind is PWM-based backlight. In such a case we most likely want to leave
the state as previous stage (FW, bootloader) left it in.

> Not really. DT doesn't specify any initial state for the PWM. It might, though,
> be left enabled if another device was using it previously. Not a thing I've
> ever seen during tests, but it may in theory happen.
> 
> We may have devm_pwm_get_disabled(). In IIO, ad7625 and this ad4030 would be
> the users of such interface. Would you like me to propose that one?

Not sure it will be accepted by PWM maintainers, and personally I would be not
a fan of such a call. Sounds a bit confusing to me (however, we have IRQ flag
to not enable IRQs, which makes a lot of sense in comparison to other use
cases).


-- 
With Best Regards,
Andy Shevchenko



