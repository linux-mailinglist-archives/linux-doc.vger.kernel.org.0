Return-Path: <linux-doc+bounces-92494-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TjSuEFU0MWrVdwUAu9opvQ
	(envelope-from <linux-doc+bounces-92494-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 13:32:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C5968ECEB
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 13:32:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=en4cbng2;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92494-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92494-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B56F3019117
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 11:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAD33BAD94;
	Tue, 16 Jun 2026 11:32:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F8A3043C8;
	Tue, 16 Jun 2026 11:32:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781609554; cv=none; b=WeouoN0AphDdyXU0FGmW6tH1WvZcRmXkjkuZ+1HhPoAJIPmos5ipV/KVgzm3MChjTFE9jOicXnMMgxtJCHE22ZsUadyL2owpieM2HZbVkwLiyfH9e0f2h3b/08POT4/vrKSs8xFGK+RsqW59naYemm6aOg7rcK3BoNy/a9yz7rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781609554; c=relaxed/simple;
	bh=fQ2AA+B5HXg+9VGEjKTj0JjSlcUTHbf1yHvGGfrbrfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JD+fsS3VxK2PGeZgq4LQecbX8yYr7Koqa55+p91NSbWzEuZn7BKH6O0g3thTBWAk0znv4AMEBLbVE2OQdKgMsN8VYOy5Wts+uciy0vYyPoM6zbe+vhOBnLz4fnS6WAUB1zVpYXplNeh1EYps3tCj2HGnVfnDo7hX2bEMvSJJXow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=en4cbng2; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781609553; x=1813145553;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fQ2AA+B5HXg+9VGEjKTj0JjSlcUTHbf1yHvGGfrbrfE=;
  b=en4cbng2upN4Bz2ddIxOrL1GgigAaCjfgeQF6Snuu72ROb/2K4mnvlBS
   f/NlRIjiQ8vf47b9NPONfdMUxlA124Z5pq/lN7rU58hJCzGEb7CjGnTHg
   ynDJrvX7qKbgLT1IfQd2YWDnNzmd7PdYuSbsdKGOVvf/IIXMd5+0dco/W
   r4C1/zBI9EDZ9+4SnFAxYhIllajIC0tepBVgemFbAMuqsPNfSmAx33hNg
   H5hd3RRkaM0f/xQtP507yAY94m+2tt7OCUTaQi4WcC2/bhO5C4gqmpgi7
   +NdFBE1zWfJdo+/9Hh3vGRYTLg32aDAD48kljy5ICwdXt9qUxYIKJ9Az2
   w==;
X-CSE-ConnectionGUID: rgk3QDc3Te2E//zDcGMx4A==
X-CSE-MsgGUID: 0pIsejHvTciWi+gV50SOrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="99788903"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="99788903"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:32:33 -0700
X-CSE-ConnectionGUID: jo3l7CJ9R367mJbNikhgWQ==
X-CSE-MsgGUID: ANnVecl1QBm9K0FuCXVuzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="245376373"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.153])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:32:30 -0700
Date: Tue, 16 Jun 2026 14:32:27 +0300
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
Subject: Re: [PATCH RFC v5 6/6] iio: osf: register IIO devices from
 capabilities
Message-ID: <ajE0S4gQ7yMoxX51@ashevche-desk.local>
References: <20260616072242.3942-1-kimjinseob88@gmail.com>
 <20260616072242.3942-7-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616072242.3942-7-kimjinseob88@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-92494-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ashevche-desk.local:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71C5968ECEB

On Tue, Jun 16, 2026 at 04:22:42PM +0900, Jinseob Kim wrote:
> Register IIO devices for supported Open Sensor Fusion capability entries
> and push received samples into IIO buffers when enabled.

...

>  	help
> -	  Build the Open Sensor Fusion UART receive path.
> +	  Build the Open Sensor Fusion UART IIO driver.
>  
> -	  The driver receives OSF protocol frames over a serdev UART.
> -	  Frames are decoded and validated before being passed to the
> -	  driver core.
> -	  This patch only adds the transport path.
> -	  IIO device registration is added separately.
> +	  The driver receives OSF protocol frames over a serdev UART and
> +	  registers IIO devices for supported capability entries.

Can't you fix this in the initial patch?

...

>  obj-$(CONFIG_OPEN_SENSOR_FUSION) += open-sensor-fusion.o
>  
> -open-sensor-fusion-y := osf_core.o osf_protocol.o osf_serdev.o osf_stream.o
> +open-sensor-fusion-y := osf_core.o osf_iio.o osf_protocol.o osf_serdev.o \
> +			 osf_stream.o

Modify the original code the way that this will only have a + line.

...

>  void osf_core_unregister_iio(struct osf_device *osf)
>  {
> +	unsigned int i;
> +
> +	for (i = 0; i < osf->iio_dev_count; i++)

For all for-loops where it's not going outside it

	for (unsigned int i = 0; i < osf->iio_dev_count; i++)

> +		osf_iio_unregister_sensor(osf->iio_devs[i].indio_dev);
> +
> +	osf->iio_dev_count = 0;
> +}

...

> -		ret = osf_core_validate_sensor_sample(&frame);
> -		break;
> +		return osf_core_handle_sensor_sample(osf, &frame);
>  	case OSF_MSG_DEVICE_STATUS:
> -		ret = osf_core_validate_device_status(&frame);
> -		break;
> +		return osf_core_handle_device_status(osf, &frame);
>  	case OSF_MSG_CAPABILITY_REPORT:
> -		ret = osf_core_validate_capability_report(&frame);
> -		break;
> +		return osf_core_handle_capability_report(osf, &frame);
>  	default:
>  		if (frame.message_type >= OSF_RESERVED_MSG_FIRST &&
>  		    frame.message_type <= OSF_RESERVED_MSG_LAST)
> -			ret = 0;
> -		else if (frame.message_type >= OSF_VENDOR_PRIVATE_FIRST)
> -			ret = 0;
> -		else
> -			ret = -EOPNOTSUPP;
> -		break;
> +			return 0;
> +		if (frame.message_type >= OSF_VENDOR_PRIVATE_FIRST)
> +			return 0;
> +		return -EOPNOTSUPP;

With my suggestion this can be done in the initial patch.
So, this indeed needs a lot of work as for RFC :-)

I stop here.

-- 
With Best Regards,
Andy Shevchenko



