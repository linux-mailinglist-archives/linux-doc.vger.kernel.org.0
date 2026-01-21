Return-Path: <linux-doc+bounces-73406-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF3pCqikcGlyYgAAu9opvQ
	(envelope-from <linux-doc+bounces-73406-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 11:04:24 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D01CA54E22
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 11:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7109F6049EA
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 09:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A33347D953;
	Wed, 21 Jan 2026 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkCvd3mU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4839738B7D0;
	Wed, 21 Jan 2026 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989136; cv=none; b=IHmBw3uXRK1cesBZSNOugx5TyPVp/cXsqZsh8Zih6lslln4+dMqXsg9OafauTdWW3ciiskgXFNA1LK3kYzvfqidOiNqY72+jZLaKevchYaBWME+rNfXjvRpHwTp4ri8O7dkDz+Nocjl670aDZNAaEJB+pRi46PbcyXrKk2M+4fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989136; c=relaxed/simple;
	bh=EPkQjhxLIdSfzGwc60b0/0B/7SwCxHhP12hfLgUdfD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7WuEVSULoctLjFgM2XZCMgwXdeURV0kkpsXp78GPHIAKfFFa5lVy15UA2KpjzaRAd+un9OkPZUYPEAkU/gRf+0DOh3emFQIE9bK8lEjOX1Nfasr5dg/gpgNyar7BLy5b7sxyEAHeYiPYtu018hDvbDvz9IrtvtVvyNIQaXaIAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkCvd3mU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768989134; x=1800525134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EPkQjhxLIdSfzGwc60b0/0B/7SwCxHhP12hfLgUdfD4=;
  b=PkCvd3mU9uR5ut37+nbhj8p/xYlytoGGN8wuA4zJHfmI2MUWzXujXG5v
   VDLJapoFpw3vFp1Rnr8LFTmti7IY2/slOuSfIBQWRvClMXpTI0nUOFRxH
   FB2TDmoCMGFei/QF6U796CtguLPNV8A2Zg6uCwZwZxRd5gDH9AF1b85W6
   cMg50wrR08Q0Q0nHuZ5N/0txJRIPzPqvy7HlmXZqoXTs1KzKHN84PUczw
   9ymsdukchvBCCleTGuXlpHULMXYQawo3jxw0bTofQyhYH05x6tTtdhESR
   MJn1SIrcw9LbsqCTOCTM+ZROcjOTORy3kM84/Y2wr8ra/fIQHWIYUuSqD
   g==;
X-CSE-ConnectionGUID: b1X38CyNQ1itkgEhk5k00w==
X-CSE-MsgGUID: 1FVvTx9IR2CS+Gp7pFEtDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81591883"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="81591883"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 01:52:12 -0800
X-CSE-ConnectionGUID: 5WFzXOo5SrWFn4GHCW+v4Q==
X-CSE-MsgGUID: 4XM1BOWJTe6YBCuU41qFuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="210910529"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.73])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 01:52:08 -0800
Date: Wed, 21 Jan 2026 11:52:06 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, rodrigo.alencar@analog.com,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v4 3/7] iio: frequency: adf41513: driver implementation
Message-ID: <aXChxvlZxKVrOMsW@smile.fi.intel.com>
References: <aW3dxuelYDM67pqZ@smile.fi.intel.com>
 <texwv5s2tvcy34bwr4iruj5xofmea663pwletmpqpuh66zulmv@m7qvjgqbhalv>
 <aW40ylvMwVhqNQMw@smile.fi.intel.com>
 <hgy3bcrqqsvt7pobhnzuvwzhb2taetpxltkaxpigmmlvmlirod@v6anhmrsvv2r>
 <aW5kk6K30Izckvg5@smile.fi.intel.com>
 <e5lcg5kkey3c6u2l4rlzzpolp7qkudhcofyzcx5s2tjbh2iwkg@js3fisv23zyj>
 <CAHp75VepcSZo_E4_UxhKRfHrMFDd7huJg14m8=6zVo4ENKFXkA@mail.gmail.com>
 <vvdk3whhwua73g63eetnmn46t2cpbpkzzkx7m6wsbverp7gcvs@mi7cipis3i4t>
 <aW-Fai68pk1tAeyY@smile.fi.intel.com>
 <kmdqcaewxxg7isappgfxuf5ode5fepbywrdriksmvrzmaykcjd@crpr27tt3bmf>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <kmdqcaewxxg7isappgfxuf5ode5fepbywrdriksmvrzmaykcjd@crpr27tt3bmf>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[gmail.com,analog.com,vger.kernel.org,kernel.org,baylibre.com,metafoo.de,lwn.net];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-73406-lists,linux-doc=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,smile.fi.intel.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: D01CA54E22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 09:41:25AM +0000, Rodrigo Alencar wrote:
> On 26/01/20 03:38PM, Andy Shevchenko wrote:
> > On Tue, Jan 20, 2026 at 01:07:49PM +0000, Rodrigo Alencar wrote:
> > > On 26/01/20 01:24PM, Andy Shevchenko wrote:
> > > > On Tue, Jan 20, 2026 at 12:43 PM Rodrigo Alencar
> > > > <455.rodrigo.alencar@gmail.com> wrote:
> > > > > On 26/01/19 07:07PM, Andy Shevchenko wrote:
> > > > > > On Mon, Jan 19, 2026 at 04:37:09PM +0000, Rodrigo Alencar wrote:
> > > > > > > On 26/01/19 03:42PM, Andy Shevchenko wrote:
> > > > > > > > On Mon, Jan 19, 2026 at 11:21:59AM +0000, Rodrigo Alencar wrote:
> > > > > > > > > On 26/01/19 09:31AM, Andy Shevchenko wrote:
> > > > > > > > > > On Fri, Jan 16, 2026 at 02:32:22PM +0000, Rodrigo Alencar via B4 Relay wrote:

...

> > > > > > > > > The current implementation is kind of a stripped version of
> > > > > > > > > __iio_str_to_fixpoint(). Would you prefer something like this, then?:
> > > > > > > >
> > > > > > > > Do they have most of the parts in common? If so, why can't we use
> > > > > > > > __iio_str_to_fixpoint() directly? Or why can't we slightly refactor
> > > > > > > > that to give us the results we need here?
> > > > > > >
> > > > > > > __iio_str_to_fixpoint() only parses "int" chunks, adf41513_parse_uhz
> > > > > > > was modified to accomodate the u64 parsing removing unnecessary stuff.
> > > > > >
> > > > > > But why? The fractional part most likely will be kept int (it's up to 10⁻⁹).
> > > > > > The integer can be bigger than 10⁹?
> > > > >
> > > > > Correct, integer part of the frequency value goes up to 26.5 GHz
> > > > > (uint_max is approx 4.3 GHz). Also, with the dual modulus, the PLL can
> > > > > achieve micro Hz resolution.
> > > > 
> > > > µHz is not a problem since it's up to nHz.
> > > > So, the difference so far is the integer part that can be 64-bit.
> > > > Again, can we factor out something to be used for this and for the
> > > > __iio_str_to_fixpoint() cases?
> > > 
> > > I am not sure what you are suggesting,
> > 
> > To make changes to reuse the code.
> > 
> > > but I am avoiding changes to iio core at this point.
> > 
> > Why?
> 
> I understood that core changes would require more than one user
> supporting the change.

At least one. And we have tons of them as the callers of
__iio_str_to_fixpoint() are not going to disappear. Basically it's a surgery in
the middle of the existing chain of APIs. To me one user is enough justification
for such a surgery. For the newly introduced API (imagine __iio_str_to_fixpoint()
as an example) it's indeed one user not enough.

> > > If any other user needs similar behavior,
> > > I'd say we would need to have __iio_str_to_fixpoint() implementation
> > > modified, so to create a version of iio_str_to_fixpoint() that handles
> > > long long variables. Possibly consuming simple_strtoull instead of
> > > doing the manual parsing.
> > 
> > That's the problem here. With Yet Another Cool Parser this all becomes
> > unmaintainable very soon
> 
> Considering that the need for a new parser for 64-bit parts is only driven
> by this specific PLL driver, I wonder how things become that unmaintainable.

Because there is a duplication of the code (to some extent) and if we found
a bug in the one implementation it will be hard to fix (or even remeber) about
the other.

> > (basically as you said when new comer needs a third
> > variant of it). This is not good. Instead better to create (amend, expand)
> > existing test cases, split out a foundation API that parses 64-bit parts
> > (maybe even for fractional as well, dunno) and evolve a needed (sub)API
> > from it.
> 
> I don't disagree with you though, I suppose I will need a green light to
> move on with this?

Fine with me, let's gather opinions of David, Nuno, Jonathan, and others.

-- 
With Best Regards,
Andy Shevchenko



