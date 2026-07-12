Return-Path: <linux-doc+bounces-96444-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tw6ZHKpjU2rqaQMAu9opvQ
	(envelope-from <linux-doc+bounces-96444-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 11:51:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B846174450D
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 11:51:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=JS0rhk09;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96444-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96444-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DC9B300F11B
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 09:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC07437475B;
	Sun, 12 Jul 2026 09:51:33 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50750369D71;
	Sun, 12 Jul 2026 09:51:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849893; cv=none; b=g97C+wdqks5mgnHZo7cB036mTusGcvG0eldW9l3A8tFDCyfPHWkrAZWbhX8KWU743OvGCgFEX5fbynmFSrLPGQGiC8n53wK6zhHrFyCh0TE2VnHgA/PJpwM5TYnXV5G5OXtr95wepP+AfgEMVoG87LjA4dxyvbf5mL2z1iFrsdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849893; c=relaxed/simple;
	bh=UUTPrVk9MPoWQl5qgG7RoPAhAuxqhxAdTplAK3yIO5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTTUnVfRtwv4wK11UjsOGWsYHZpD9U/UZ8GsxkxxlPYJoNxDOW3Xs3/pFkG3wlZbUC0+RV9PAtXRj8PjFZtjgailheWfUoUwcerE1H6OQcJu3Gy+Y9q0bAn+ZK5rUh0XmvuvFkHVUOrbHc+l4ZsF8UZ0tNAKWhMKriaEt07fytk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JS0rhk09; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783849893; x=1815385893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UUTPrVk9MPoWQl5qgG7RoPAhAuxqhxAdTplAK3yIO5w=;
  b=JS0rhk09rEP0g8PeFENFHx3DKgyiCioYM4n0A5y7csI34DdZM4B8yYlJ
   l1ect9rb2FNpZyDgNTEOIxKytvBM9e1MPRrJi1kWoT3aoarUwVCl8YIBD
   xIEUNaHcskyiY+agIYA2LrxHVMX2rFSGdiIcBEMUwUxeOhXjbHZsGGGdx
   2T0yfY5CuUtR0KD9KJyxcFy7pf7jYGkd87/LhsX/odAVleD0U3gXvfaLl
   PZK3SNWoLvUt7mnmaJ6DAUrXjM5iGhr0BlZ4DSxJ0G8M1Jy+xk55Cx23U
   FvJmKqYessBsI16vMY7lN0R/VrPyab536Oe75c4pKSdESs8ShIwHXxJYR
   w==;
X-CSE-ConnectionGUID: kr0RTc1KR9mwbfKh2OYA1A==
X-CSE-MsgGUID: Pd6RJHoaTnyKq61q987vhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88170047"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88170047"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 02:51:32 -0700
X-CSE-ConnectionGUID: bbqStwH/QtW4X7FAHnfr+w==
X-CSE-MsgGUID: FyBeK+vATgmoXHljqIdUMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251315259"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 02:51:29 -0700
Date: Sun, 12 Jul 2026 12:51:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kim Jinseob <kimjinseob88@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/5] iio: osf: add authenticated stream parser
Message-ID: <alNjnjAlLRr8Q23k@ashevche-desk.local>
References: <20260707014525.1015-1-kimjinseob88@gmail.com>
 <20260707014525.1015-5-kimjinseob88@gmail.com>
 <ak0cVeEUhNP1wTkQ@ashevche-desk.local>
 <CALMSewLACs7+QEq=3Pp=Wo6dvmEu0hFjmuOx8oe0AGoZHPmADw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALMSewLACs7+QEq=3Pp=Wo6dvmEu0hFjmuOx8oe0AGoZHPmADw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96444-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:kimjinseob88@gmail.com,m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:dkim,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B846174450D

On Sat, Jul 11, 2026 at 12:24:12AM +0900, Kim Jinseob wrote:

What happened to your email? Regular MUAs add the line to see the quoting legend,
and in your email it's gone?

...

> > Seems like reinvention of min() from minmax.h.
> 
> Agreed. The open-coded minimum calculations are now replaced with min().

You too eagerly removed the context... But okay, it seems you agreed on
the suggested changes.

-- 
With Best Regards,
Andy Shevchenko



