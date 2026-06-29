Return-Path: <linux-doc+bounces-94011-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RklVHQ+DQmp58wkAu9opvQ
	(envelope-from <linux-doc+bounces-94011-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 16:37:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF5F6DC20B
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 16:37:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=IUJ1kk8t;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94011-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94011-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4663830C5E71
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 14:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83742406830;
	Mon, 29 Jun 2026 14:13:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8C35675B;
	Mon, 29 Jun 2026 14:13:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742384; cv=none; b=YTla0rxTtkabfmNiSXyuhWx9wr0jiHhuhsuDwakCwvriK4ljNbU5gs6EKbHdp2d8g08nb2XzeGE0VYHoCQOmpn7NJ4d41QoARwDJcngebIdz/EK/KzqhmOn8OX/4NpISEBNwoZTSSw9yoFzPPXXJpPnkEx4Ezll7lVVp59RA65g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742384; c=relaxed/simple;
	bh=tKHtzoYf+ONSIaUJBs5LTkbQeLS8Vw/N8hPM7z+LNrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5PNoJAbVcVi13Yo0VPntbVs1MQl/OG47u8UBT+E5d+8CKL+lWJR1VJEg/AtGoSowdOHsIn0lEZYSaAGycO+grHLm99yN2NghcTTlYaJ6i/qc8rZMQhJJAq7jgDAeQbpCbcmjKdnLWyPCt1oeVg6WcWiSnrXd6J+vzyrG4h5Vk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUJ1kk8t; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782742382; x=1814278382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tKHtzoYf+ONSIaUJBs5LTkbQeLS8Vw/N8hPM7z+LNrU=;
  b=IUJ1kk8tWIE1O5CP70MOak48GS0VVaiBx2skXhCBHk4YJKFH9+KOuQga
   AhIBGkaVISht7nf0ciKWGR68Oznv6sSfDzKSB7nob/pXeb4PLqnZlbFKx
   lyATNBUbRJw0jk66q6NUUMnPakVDJZyEyRB1bFG9DMKqa5z54n1+ooaPk
   Jx5If7xvY3IJtK7cMb6vauwX0Mn+9JCCwZN6PvRxNRmz5PqEK9PiK/sFw
   B5U2342r3rBJOKlPOOlVsytAFB5eQDQaLXWOALxt2xqk4nzEqUYRkVFN7
   encvr3e50CVjlNFxNxIwb0sAdmyd5yCNI3JMW7IPU2WXhmyYFb337fmwi
   w==;
X-CSE-ConnectionGUID: lkSszQRBQDChiMe6uaQUAw==
X-CSE-MsgGUID: MAjGVTpcRFKWQnMbx+seuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83438253"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83438253"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:13:01 -0700
X-CSE-ConnectionGUID: 0fjlTSkHS1Wmu1mSwb6SIg==
X-CSE-MsgGUID: t2VRGnY9THqgHT5uGXYA0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="252607197"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:12:58 -0700
Date: Mon, 29 Jun 2026 17:12:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 0/5] iio: add Open Sensor Fusion IIO driver
Message-ID: <akJ9Z6jHGP-fUPFz@ashevche-desk.local>
References: <20260628191337.937-1-kimjinseob88@gmail.com>
 <akJ8itlDBJfaYRj2@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akJ8itlDBJfaYRj2@ashevche-desk.local>
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
	TAGGED_FROM(0.00)[bounces-94011-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFF5F6DC20B

On Mon, Jun 29, 2026 at 05:09:21PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 29, 2026 at 04:13:32AM +0900, Jinseob Kim wrote:
> > Open Sensor Fusion (OSF) devices expose a UART/serdev host interface
> > for a sensor aggregation hub.  This RFC adds a Linux IIO driver that
> > parses OSF frames and creates IIO devices at runtime from capability
> > reports provided by the device firmware.
> > 
> > When the corresponding capabilities are reported, the driver exposes
> > accelerometer, gyroscope, magnetometer, and temperature data as IIO
> > devices named osf-accel, osf-gyro, osf-magn, and osf-temp.
> > 
> > This remains RFC while the binding, protocol subset, runtime discovery
> > model, and driver-facing ABI are reviewed.
> 
> Where are the lore links to the previous versions?

Besides that you utterly ignorant in replying to the comments of the reviewers.
v3 and v5 left unanswered, third time in this version I give the very same
comments. What the heck?!

-- 
With Best Regards,
Andy Shevchenko



