Return-Path: <linux-doc+bounces-39160-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B62A41ACA
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 11:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2C397A480C
	for <lists+linux-doc@lfdr.de>; Mon, 24 Feb 2025 10:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF7C24BC08;
	Mon, 24 Feb 2025 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9YLbuhW"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C92F24A04A;
	Mon, 24 Feb 2025 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740392658; cv=none; b=Bqrgi6PkwANa/O+Ql9R9UyIMZ4fAXS0lh2r0gzKwPjHQjrLd/cLned+bV2c9UDFdfiKEEXxDKKbtHrWjxCTjoNS++vBQK0BECI7pYdDkMmjLypEpAh+kgn6HafGgxoVrkzLDtnO4NBe9R/tzT52ODYtlnscr/FMSG+1uemKJINE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740392658; c=relaxed/simple;
	bh=6Q7YxosGYCvvfZdEhOxa5tW2ht0jkZihzhAPG6TYYuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZXyj0oIQc1/66GUiMzIfi5YNe2g1OBKF6w8SdqoTCI6bLIr6tAh5BV6sDLjnhKY+EC9oMLOUsUaybZIxu41AFHcH6aGalIMWQ0Nt4xSMjFk0EbNow1KBSvgRhB2Sx2/GTDBL35WnN6SO8AcsXwY2UTiNxs6RfGNNoSwSQNto8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9YLbuhW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740392657; x=1771928657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6Q7YxosGYCvvfZdEhOxa5tW2ht0jkZihzhAPG6TYYuc=;
  b=L9YLbuhWpc02Ob/kPk7kvlOWPQZJk4WwxTlSclpiD9wfbRQMahu/VA8I
   L4fDo7roahc9ngwDDUsh2Rhqc+w9EkaTbLEBlktFkOi6eZajtXoWZE+WK
   1ZjPytRAk/a6QkzdMh4fO5lW5PIR+HqA3bRYNmFuCdP//VoZpjiSPxuhE
   peuaMf7xU7wgPwP6KjfBBhhFNVssX1moEs9d+Dn4AdfcYbsf2i58BCN/+
   id9c5w7MFLbTqHtFUYfJ9qI5jSQfWTUSMDFh2whK9sG6UGePYitqZZtO/
   jeIFKrIr5qQY1izYb0iFLE1NRtcoFcTt2NToMM/aoQXeg6cYjmy7y8cHS
   A==;
X-CSE-ConnectionGUID: sJySdjU+TbC/O4bcMh2/Kw==
X-CSE-MsgGUID: 7xWSFAudTlKarxoq8E33Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="58688072"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="58688072"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 02:24:16 -0800
X-CSE-ConnectionGUID: +pAAAG08Rvu5FzAQi5JPqA==
X-CSE-MsgGUID: 9ieeuXQLQPOIECVGNEmZEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="139243452"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 02:24:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmVd7-0000000EfEB-0qjH;
	Mon, 24 Feb 2025 12:24:05 +0200
Date: Mon, 24 Feb 2025 12:24:04 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	"kekrby@gmail.com" <kekrby@gmail.com>,
	"admin@kodeit.net" <admin@kodeit.net>,
	Orlando Chamberlain <orlandoch.dev@gmail.com>,
	"evepolonium@gmail.com" <evepolonium@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	Hector Martin <marcan@marcan.st>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Z7xIxFT-eB_OTGzm@smile.fi.intel.com>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
 <6CB20172-906F-4D13-B5E4-100A9CF74F02@live.com>
 <Z7xCr4iPmIkPoWGC@smile.fi.intel.com>
 <PN3PR01MB9597CF2907CBBD6ED43D5E62B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597CF2907CBBD6ED43D5E62B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 24, 2025 at 10:18:48AM +0000, Aditya Garg wrote:
> 
> 
> > On 24 Feb 2025, at 3:28 PM, andriy.shevchenko@linux.intel.com wrote:
> > 
> > ﻿On Sat, Feb 22, 2025 at 03:46:03PM +0000, Aditya Garg wrote:
> >>>> On 20 Feb 2025, at 10:09 PM, Aditya Garg <gargaditya08@live.com> wrote:
> >>> 
> >>> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> >>> it's useful to be able to print generic 4-character codes formatted as
> >>> an integer. Extend it to add format specifiers for printing generic
> >>> 32-bit FOURCCs with various endian semantics:
> >>> 
> >>> %p4ch   Host-endian
> >>> %p4cl Little-endian
> >>> %p4cb Big-endian
> >>> %p4cr Reverse-endian
> >>> 
> >>> The endianness determines how bytes are interpreted as a u32, and the
> >>> FOURCC is then always printed MSByte-first (this is the opposite of
> >>> V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> >>> allow printing LSByte-first FOURCCs stored in host endian order
> >>> (other than the hex form being in character order, not the integer
> >>> value).
> > 
> > ...
> > 
> >> BTW, after looking at the comments by Martin [1], its actually better to use
> >> existing specifiers for the appletbdrm driver.  The driver needs the host
> >> endian as proposed by this patch, so instead of that, we can use %.4s
> > 
> > Do you mean this patch will not be needed? If this a case, that would be the
> > best solution.
> 
> I tested with %4pE, and the results are different from expected. So this
> would be preferred. Kindly see my latest email with a proposed workaround for
> the sparse warnings.

%.4s sounded okay, but %4pE is always about escaping and the result may occupy
%4x memory (octal escaping of non-printable characters). Of course, you may vary
the escaping classes, but IIRC the octal or hex escaping is unconditional.

> >> [1]: https://lore.kernel.org/asahi/E753B391-D2CB-4213-AF82-678ADD5A7644@cutebit.org/
> >> 
> >> Alternatively we could add a host endian only. Other endians are not really
> >> used by any driver AFAIK. The host endian is being used by appletbdrm and
> >> Asahi Linux’ SMC driver only.

-- 
With Best Regards,
Andy Shevchenko



