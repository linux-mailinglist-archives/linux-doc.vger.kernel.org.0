Return-Path: <linux-doc+bounces-94008-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VGI7O11/QmqE8gkAu9opvQ
	(envelope-from <linux-doc+bounces-94008-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 16:21:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CE76DBF64
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 16:21:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=PyXHNHw+;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94008-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94008-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83FF530786F1
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 14:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F213793BD;
	Mon, 29 Jun 2026 14:09:24 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA13769E5;
	Mon, 29 Jun 2026 14:09:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742163; cv=none; b=EaqjLjCU9cpNyzMm6y2avpzhvP7c53rUg9AupzyFkVCT4VbcbM2sk09hTL7xw5PZj6orWuIRRH7t55HKMUsnWYTjdSADQMF4RZtGu1dubeASpDT3QjyfEZEgiqjC769N3r7iLTTYj51WryUkSfJMVaQ1F+HLw3LlGvzHO46MqvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742163; c=relaxed/simple;
	bh=teeX39/m1S4D7PMAq39faNk4sI6sySbT2nT+YJyHiQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQdkxNwg/XAOOnswhPlfvsVH9chFS1osoXJa0oiNV4XXEr2DANS7aobEx4v41EqUYojBvoRynHDLxcilktkUT9w5xfQAOYjWZH0oyGnE5Lm8E7DxzVDWqB52I7SBbjNSfZQol/mM1pVLarKsNzCmoGuaP4Q+hGdhpUp0syGHgrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PyXHNHw+; arc=none smtp.client-ip=192.198.163.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782742162; x=1814278162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=teeX39/m1S4D7PMAq39faNk4sI6sySbT2nT+YJyHiQI=;
  b=PyXHNHw+TJ9cueQvYTkfOEmfPV+2cb9WM2BAyKOQMzP9obCRf7ZGthDH
   UxAMeuEpWP0lfG8tNqUa6r5VfCuVFKsUupnw3KhYjWt9kZ6hk+E9vafLj
   ZpYXUQOs/Qo8nk2AKQFMLYZ2cihriqHbHIfHu053SXFad27CpLC/qQz30
   4xYW30gTd9r0dtyOLYdoGUU6HgmweB3hLcSJN8zjAucHG4gobty5RXqUB
   +Xv5eVldEr25WtJpgSLYqcVyQaMqW0GPQobgrnTk3W5a5an6tZf56UA5N
   URWBbxJjNqlIj90MG6yT9MQjv9UokDVRNvH/brouKM5zZmcl7kwohoHCO
   A==;
X-CSE-ConnectionGUID: jfEIin4XQTW+/J/255776g==
X-CSE-MsgGUID: sl5OO3+hS/y9seXsr36Aug==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94088230"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94088230"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:09:21 -0700
X-CSE-ConnectionGUID: hNYDjxHyQqqxBfhoCt1Z+g==
X-CSE-MsgGUID: h7anExFSRryvVsfY/Rlw5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="247514569"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:09:17 -0700
Date: Mon, 29 Jun 2026 17:09:14 +0300
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
Message-ID: <akJ8itlDBJfaYRj2@ashevche-desk.local>
References: <20260628191337.937-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628191337.937-1-kimjinseob88@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94008-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ashevche-desk.local:mid,intel.com:dkim,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7CE76DBF64

On Mon, Jun 29, 2026 at 04:13:32AM +0900, Jinseob Kim wrote:
> Open Sensor Fusion (OSF) devices expose a UART/serdev host interface
> for a sensor aggregation hub.  This RFC adds a Linux IIO driver that
> parses OSF frames and creates IIO devices at runtime from capability
> reports provided by the device firmware.
> 
> When the corresponding capabilities are reported, the driver exposes
> accelerometer, gyroscope, magnetometer, and temperature data as IIO
> devices named osf-accel, osf-gyro, osf-magn, and osf-temp.
> 
> This remains RFC while the binding, protocol subset, runtime discovery
> model, and driver-facing ABI are reviewed.

Where are the lore links to the previous versions?

-- 
With Best Regards,
Andy Shevchenko



