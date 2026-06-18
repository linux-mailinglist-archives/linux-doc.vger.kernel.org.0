Return-Path: <linux-doc+bounces-92799-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qi0dEX41NGolRgYAu9opvQ
	(envelope-from <linux-doc+bounces-92799-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 20:14:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 958076A211D
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 20:14:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=CZ7UqX0c;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92799-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92799-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D923302974C
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 18:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9BC35B62C;
	Thu, 18 Jun 2026 18:14:15 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9ED2BEFFF;
	Thu, 18 Jun 2026 18:14:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806455; cv=none; b=qJIVFUSeXX7cya27ENg4r8dsdJ7xS//O7yCwhNKX4SssD6vf8tgbZZelqeJTvZYJBQaF0Nc4apvpBhnzm1kmdzAOJg+7xFs/+Dk4Gtx/rxUK9H3ViMQqKQBdUZR2zGXHyW7/IvM0XdddMBm/YPY5jJwrKSF08uyau9JJoDPx7Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806455; c=relaxed/simple;
	bh=3RvBOXRU63UpW/H4b39LYurMKFBvGSJTVWUULE93Bx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIPiRJByDqTdjobb+Gpax6PApym9isljVn+be53WLfSQtKxMPJkVk7wfMsYA5SDYipO+ESYjOIVAKfkwlrPGSRJIy9rg6/6qkyk/+VnxxRPkaNVGD3to2lPbYDyB4etM4maQXMzvOzKZQO+zQss4rV6KMc5iRAe+05LAGlCrhcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZ7UqX0c; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781806454; x=1813342454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3RvBOXRU63UpW/H4b39LYurMKFBvGSJTVWUULE93Bx8=;
  b=CZ7UqX0chX/VoixWARZvPEA0LxdtRQFLoMwW/+MD4QToN79G8QoY8DBL
   CvdUpgDSPCpipKFs7HtMnAkK5x0fRjyx0vsFM4196naxjOPJ6o5Y9NkwT
   pxGcT0xCJmgPbPu2GRo4WSLVKd0iEk8wPAVKefMUEvFHEKqVhn4cPlwDn
   yDLTEVV+DodSVzBPveR9sZwUqqLM9+oHxjRdUj2nOcCpFD2Db6+fIEtOP
   tTnDx+0+JpdB2YwiaLQAiDbZlzFGVI/D5xBPe1U5rlLsFdSr1+hNSFfCC
   k9hiaNxvxfbeI4yYClMMfDKbST5iEBE2X45zSKNyg2Z3ShJ1HIq/tOLPD
   A==;
X-CSE-ConnectionGUID: iDvMfDc1RSuWr43JOo5mMg==
X-CSE-MsgGUID: M7LNx2FgTpmP55ztL9Z7YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82427923"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82427923"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 11:14:13 -0700
X-CSE-ConnectionGUID: JQIlwvKqSU233DTG5fhlmg==
X-CSE-MsgGUID: WV26cfLWSqSdVdLPo5/zKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="272500066"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.10])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 11:14:08 -0700
Date: Thu, 18 Jun 2026 21:14:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v6 06/16] iio: core: create local
 __iio_chan_prefix_emit() for reuse
Message-ID: <ajQ1bZSNHQ96pyJx@ashevche-desk.local>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
 <20260618-ad9910-iio-driver-v6-6-79125ffbe430@analog.com>
 <ajQGTQ1_qcOwfzne@nsa>
 <x3aijvc4buo7aqbchikuoyyrgiq3afidtkla37h2rg4tvfdbc3@h42qp3estg2s>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <x3aijvc4buo7aqbchikuoyyrgiq3afidtkla37h2rg4tvfdbc3@h42qp3estg2s>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92799-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:455.rodrigo.alencar@gmail.com,m:noname.nuno@gmail.com,m:rodrigo.alencar@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:455rodrigoalencar@gmail.com,m:nonamenuno@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,analog.com,vger.kernel.org,metafoo.de,kernel.org,baylibre.com,pengutronix.de,lwn.net,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 958076A211D

On Thu, Jun 18, 2026 at 05:14:19PM +0100, Rodrigo Alencar wrote:
> On 18/06/26 16:06, Nuno Sá wrote:
> > On Thu, Jun 18, 2026 at 02:27:22PM +0100, Rodrigo Alencar via B4 Relay wrote:

...

> > > +	dev_attr->attr.name = kasprintf(GFP_KERNEL, "%s%s", prefix, postfix);
> > > +	if (!dev_attr->attr.name)
> > >  		return -ENOMEM;
> > 
> > I don't oppose the change. Looks like a nice cleanup.

May I oppose it? I found use scnprintf() is harder to follow in comparison to
nice kasprintf() that takes care for the dynamically allocated buffer.

Also there is a chance to get a name silently cut due to insufficient space.
Besides that this function can't be used (again due to 'c') in kasprintf()-like
wrapper. I do not consider this as a good approach. Have you looked at seq_buf
instead?

> > But bear in mind this very sensible as any subtle mistake means ABI breakage.

Which immediately raises a question of test coverage. Do we have one? If not,
this code must be accompanied with one.

> Yes! I tried to be careful... this is dangerous stuff!

-- 
With Best Regards,
Andy Shevchenko



