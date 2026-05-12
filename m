Return-Path: <linux-doc+bounces-87126-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LzeNrMxA2oA1gEAu9opvQ
	(envelope-from <linux-doc+bounces-87126-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 15:57:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 580D3521C94
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 15:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CA8530154A8
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 13:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FCE399881;
	Tue, 12 May 2026 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTqx1PrZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ABB3998A7;
	Tue, 12 May 2026 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593843; cv=none; b=S5JMIU3Wb8wvKOJkjlvyjiCNleO6FYECIs5Gn/AjwkCcwMu/LvoR8K21u3PXoyQzoNnpxpFXXnjB/k5g/ufWRhBOya40wYOBje18eupvU+iIkwGerbFs3PwyBEeJc9+JTY9+Ukdit1isQ5rXVvhI8u38xr8MwOsogmH6k2GDb9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593843; c=relaxed/simple;
	bh=hmVffbvSzjq/z84hTirUUpOvf9U9zXSnbQBAcVn7s6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3OMbt2WWe3joVQdWJ1oKELVJ8QwJ9EdYkDKxBb6wVy7JuV2xEoOS9HkLPtjd4CUKmBxp0O0nIAB87/2SGi+RZjgWmXFNe6Xg/UaJFlpRz6FKIWs0db8cldb1zynHHxXohVStUTeif/MRSTic8JqqofXPAapk4NQZ05AApLYZ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTqx1PrZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778593841; x=1810129841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hmVffbvSzjq/z84hTirUUpOvf9U9zXSnbQBAcVn7s6c=;
  b=UTqx1PrZiMxE2fA5n5RMb2++YIBcMt8gqgOXdrOxoyrX63rnGS0ZS8U4
   qgb2C1q3o1lUCUjso8zUrdhqAWp5/Euqfubf4BfxdJxdAGhSXlnTnM7Da
   WUeBQZ64AvfVF17VjbtGvNHtskYvTd68X/R2+MNIg1cVqni5ujgpad019
   kLzFnRI0UBIFFFacR5JOYH/nvktY+gGzXVw9dApVNm6gPHnxHPa6UUn2X
   0bO73KhluMc/KRSCWhNoDJoz8wTrAiiSTBvYAGGWEigOiRJxjQBfVyjHG
   KkgWA5Y908weqMWue4IxEVlBLQROCj+RV6AHJhuhLAKQVhMh51iuXOJk7
   g==;
X-CSE-ConnectionGUID: YYqAb077TtCh3I+N42E5Dw==
X-CSE-MsgGUID: XejKTXEETVq3x73PlJqtew==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78648613"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="78648613"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 06:50:40 -0700
X-CSE-ConnectionGUID: Hu/RcsjeREecqiKVawh7mg==
X-CSE-MsgGUID: VSaTucAuSOii8ZxwoyYGJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="239598091"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 06:50:35 -0700
Date: Tue, 12 May 2026 16:50:33 +0300
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
Subject: Re: [PATCH v12 04/11] lib: math: div64: add div64_s64_rem()
Message-ID: <agMwKYtrkfc3shuE@ashevche-desk.local>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
 <20260510-adf41513-iio-driver-v12-4-34af2ed2779f@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510-adf41513-iio-driver-v12-4-34af2ed2779f@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 580D3521C94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87126-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

On Sun, May 10, 2026 at 01:42:22PM +0100, Rodrigo Alencar via B4 Relay wrote:

> Add div64_s64_rem() function, with 32-bit implementation that uses
> div64_u64_rem() and a branchless approach to resolve the sign of the
> remainder and quotient (negation in two's complement).

Cool, also chance to address:
drivers/iio/pressure/dps310.c:687:      /* Kernel lacks a div64_s64_rem function; denoms are all positive */

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



