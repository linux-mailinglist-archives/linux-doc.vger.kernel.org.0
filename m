Return-Path: <linux-doc+bounces-94006-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w+QgF8B+QmpZ8gkAu9opvQ
	(envelope-from <linux-doc+bounces-94006-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 16:18:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC436DBF09
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 16:18:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=RpX260gs;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94006-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94006-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CB1A3029215
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 14:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2A2352F86;
	Mon, 29 Jun 2026 14:05:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4910C224B15;
	Mon, 29 Jun 2026 14:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741934; cv=none; b=ug5ddtsSAQz2NMDvjHir6/GfoZMNqH6JTKFX0MHe/Ovcmsqeg/JumYL1aJTz8JcVPojI6GlCCi3DNtwuE9NjI92pEYBYt4BPkIToSIC9ldZbsNboIDCkNxr3fWJxIXIRnvAMtj3bHu0SQ2n/bPFx37j3qfg1tLcW104JQv1gxbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741934; c=relaxed/simple;
	bh=c5scqsKrFR923loW0LJkY5W0jRYL4ryhQKo4XfRhyYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJ6l4MN6xtjbGNOTNIXKHj4EHgNoXLOC3wMxL1EvQT1zPPcoe+5Bbcy9SJt6jv9K6Tabz5ubA1893V+g8Y7/NNV7Lh8Zqv0LvPvbF3YkzRIrmtvPFkOu3pGtKN4+bnurL2xJy+ijACGXq9vD+Iepjmy6VIq1tgaWUhPNXbOMo4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpX260gs; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782741934; x=1814277934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c5scqsKrFR923loW0LJkY5W0jRYL4ryhQKo4XfRhyYI=;
  b=RpX260gsvp2lt3nXY9rz3qhR2ipPusHxZj8y+6NQHdLFq2cd78vkU83i
   /Xc8X4LnLyx62ehJbw/lCNzv17oxAJ5G7mpgwcPUN3oRhps5S5kkE7Xxu
   xj/t0QIW4ig2yvCiAwMycIP5AUD8w183qwqkCq0DPCojkCuHi4vLB6Hmc
   mmvuvib1gP6WimCVlu0KoXAUDZgXWLJqgb70ET1wMcyLZE4QxLJyYmHbc
   qxEXV2YWCc3sTt6jPw6Jn8BDns1Jaq/lXto3KFb5LStPxgI5KYoql7QNg
   Mlpi3Qt1XRrlFuAMYxgGIInTRYJalKQO7qGYz3OjbbQdRitFioxiTMqv1
   Q==;
X-CSE-ConnectionGUID: iiRb8/+KRUumIiicUngCJg==
X-CSE-MsgGUID: ugdVhjuOQKmoBFeDYXAgEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83437526"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83437526"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:05:33 -0700
X-CSE-ConnectionGUID: D2WYEo3GTRqDo8mRszrxIA==
X-CSE-MsgGUID: BXYOOxUDQuWINzIO0K/3dw==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:05:29 -0700
Date: Mon, 29 Jun 2026 17:05:27 +0300
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
Subject: Re: [PATCH RFC v6 3/5] iio: osf: add protocol decoding
Message-ID: <akJ7p17eay2mnW-Y@ashevche-desk.local>
References: <20260628191337.937-1-kimjinseob88@gmail.com>
 <20260628191337.937-4-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628191337.937-4-kimjinseob88@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94006-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DC436DBF09

On Mon, Jun 29, 2026 at 04:13:35AM +0900, Jinseob Kim wrote:
> Add helpers for decoding Open Sensor Fusion frame headers and supported
> message payloads.
> 
> The decoder validates the OSF0 wire magic, protocol major version,
> header length, payload bounds, reserved fields and CRC before exposing
> decoded frame contents to the rest of the driver.
> 
> Use explicit little-endian wire storage sizes and designated
> initializers for decoded output structures.

...

> +#include <linux/bits.h>
> +#include <linux/crc32.h>
> +#include <linux/errno.h>
> +#include <linux/limits.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>

...

> +#define OSF_FRAME_MAGIC		0x3046534f /* "OSF0" little-endian */

#define OSF_FRAME_MAGIC		0x3046534f /* "OSF0", little-endian */

(mind a comma).

...

> +int osf_protocol_decode_sensor_sample(const struct osf_frame *frame,
> +				      struct osf_sensor_sample *sample)
> +{
> +	u16 channel_count;
> +	u16 sample_format;
> +	u16 sensor_type;
> +	size_t expected_len;
> +	const u8 *payload;
> +
> +	if (!frame || !sample || !frame->payload)
> +		return -EINVAL;
> +
> +	if (frame->message_type != OSF_MSG_SENSOR_SAMPLE)
> +		return -EPROTO;
> +
> +	if (frame->payload_len < OSF_SENSOR_SAMPLE_BASE_LEN)
> +		return -EMSGSIZE;
> +
> +	payload = frame->payload;
> +	sensor_type = get_unaligned_le16(payload);
> +	channel_count = get_unaligned_le16(payload + 4);
> +	sample_format = get_unaligned_le16(payload + 6);
> +
> +	if (!osf_sensor_type_valid(sensor_type))
> +		return -EPROTO;
> +
> +	if (!channel_count)
> +		return -EPROTO;
> +
> +	if (sample_format != OSF_SAMPLE_FORMAT_S32)
> +		return -EPROTO;
> +
> +	if (get_unaligned_le32(payload + 12))
> +		return -EPROTO;

> +	if (channel_count > (SIZE_MAX - OSF_SENSOR_SAMPLE_BASE_LEN) /
> +	    sizeof(__le32))
> +		return -EOVERFLOW;

Dead code because it's always 'false'? Hasn't compiler given a warning?
Always compile your code with `make W=1` using both compilers: clang and GCC.

> +	expected_len = OSF_SENSOR_SAMPLE_BASE_LEN + channel_count * sizeof(__le32);
> +	if (frame->payload_len != expected_len)
> +		return -EMSGSIZE;
> +
> +	*sample = (struct osf_sensor_sample) {
> +		.sensor_type = sensor_type,
> +		.sensor_index = get_unaligned_le16(payload + 2),
> +		.channel_count = channel_count,
> +		.sample_format = sample_format,
> +		.scale_nano = get_unaligned_le32(payload + 8),
> +		.samples = payload + OSF_SENSOR_SAMPLE_BASE_LEN,
> +	};
> +
> +	return 0;
> +}

...

> +	if (capability_count > (SIZE_MAX - OSF_CAP_REPORT_BASE_LEN) /
> +	    OSF_CAP_SENSOR_ENTRY_LEN)
> +		return -EOVERFLOW;

Ditto.

-- 
With Best Regards,
Andy Shevchenko



