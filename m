Return-Path: <linux-doc+bounces-86377-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLaSDtmU/WmXgAAAu9opvQ
	(envelope-from <linux-doc+bounces-86377-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 09:46:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB714F33C3
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 09:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 219C130325AA
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 07:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0346355057;
	Fri,  8 May 2026 07:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Af6tTmYX"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CBD26F2A0;
	Fri,  8 May 2026 07:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778225881; cv=none; b=swzZhGj55SEzkuaLyx+NyLaxjQ+TqTMCfIbQg3ipcGEePHMz6QmJXz3LjoWz0JWyBeH2OIwQrhrlMwdeoX4lsTdnmFcko0ApK+cJsdHUUJ81nXQPJxtdDmhQeEVqFb9mTJUtpM0+lPf0IRhOPBIvYpMtcsSKz5bbKgEEorW/BYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778225881; c=relaxed/simple;
	bh=NRhqpO0rWWTJQZAs7QEzV5sSKAJNdZGNTpfZ2fgN4xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzkeWjIMfQc9nmkxqIXCryVZY9P16WkGR6aV+gfc7s7AXCsyqkBJCfCHzIws90Dx5IRyoTGZjIYyeYXkK5zEW87r3kgjF8NvPjgMTMWgpvA6V2GUvc78Nna3BspkPOCjzvCNIqVQtwJkAmbKwJ34AFCvdRDAJvJvo+O3kg/URZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Af6tTmYX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778225880; x=1809761880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NRhqpO0rWWTJQZAs7QEzV5sSKAJNdZGNTpfZ2fgN4xw=;
  b=Af6tTmYXXlMbtgTjef+DUdN23Z5tlojj4AzFLqoownDTBEb83MJAjDS/
   M8UVXTXuiArIlJNzyglRZaK+D76N/KtdvnsmgPvYA9zzurosxjcm/sIJZ
   nB6hstynqZxOx/vYvkcBS6oju+iD4U3pvGHoqM0nDHnxzK03VQhmryhIt
   XQux/5pzuEghwF2fyk6mIqMkeLMd4AQo7V6DM/SNoJPir9Tu1C3586tiH
   nrWiKKPS0e08oNi0V1YeiMkkQ0/m6xgkf8BOcqVSFgTkmL6JIq6a2ZYnx
   hOo1jMggpMB14tIPCj70NoXTPW62ar6VQgbAyInMdudOp7wvjqcKzJl2y
   Q==;
X-CSE-ConnectionGUID: QQ/hh3sDTreiHv9ZCtjzKw==
X-CSE-MsgGUID: hGE1wk46Sx2ntQjJRTaXLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="66716276"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="66716276"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:37:59 -0700
X-CSE-ConnectionGUID: D+9fE+sqSgO0SUvGSNuNCw==
X-CSE-MsgGUID: W/HElhn4SGqBre2ryzpISw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="238483501"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.237])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:37:55 -0700
Date: Fri, 8 May 2026 10:37:53 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>
Subject: Re: [PATCH 0/3] iio: dac: Add support for AD5529R DAC
Message-ID: <af2S0eIia76c4m2K@ashevche-desk.local>
References: <20260507-ad5529r-driver-v1-0-b4460f3cb44f@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-ad5529r-driver-v1-0-b4460f3cb44f@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 4BB714F33C3
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
	FREEMAIL_CC(0.00)[metafoo.de,analog.com,kernel.org,baylibre.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-86377-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 06:28:08PM +0200, Janani Sunil wrote:
> This patch series adds support for Analog Devices AD5529R, a 16 channel
> 16 and 12 bit voltage Digital-to-Analog Converter (DAC) with integrated
> precision reference. The AD5529R operates from both unipolar and
> bipolar supplies. The device communicates via SPI interface.
> 
> **Device Overview:**
> The AD5529R features 16 independent DAC channels, with 16 or 12 bit
> resolution, allowing independently programmable output ranges. The
> internal 4.096V precision reference sets the accuracy of the output
> voltage.
> 
> **Features Implemented:**
> - Automatic detection of 12/16 bit generic with product ID read.
> - Reset support via GPIO.
> - Dual regmap configuration to handle 8 and 16 bit registers.
> 
> **Patch Summary:**
> 1. **dt-bindings**: Binding documentation with channel configuration.
> 2. **driver**: Implement IIO DAC Driver with regmap support.
> 3. **documentation**: Add driver documentation with usage examples.
> 
> **Testing:**
> The driver was compiled and tested on the EVAL-AD5529R-ARDZ using a
> coraZ7 with a mainline v7.0 kernel.

Missed section for a new driver. Id est answer the question "Why a new brand
driver? Do we have something similar in IIO  already to be expanded to cover
this HW part?"

-- 
With Best Regards,
Andy Shevchenko



