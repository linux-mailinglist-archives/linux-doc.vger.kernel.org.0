Return-Path: <linux-doc+bounces-95403-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /Ya7M9EcTWodvQEAu9opvQ
	(envelope-from <linux-doc+bounces-95403-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 17:35:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F61A71D55E
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 17:35:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=M5GV+xhb;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95403-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95403-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AFF6306B8C3
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 15:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C42E430CDC;
	Tue,  7 Jul 2026 15:33:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BFA2E1F0E;
	Tue,  7 Jul 2026 15:33:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783438432; cv=none; b=ubOrtt4asmIEoJ7r97P3LsFxb+cEMaNvUvJkKr+aH7R/MTulfupELV2avF3TYGbdwmz4fyvniuqUy6ziFV6V4Ir+HR7rSoHI3I0sdNget+gO9CPUuCKP4ggnS4WlNAFtgxGOWYSRsBwhnEwACMChdGdB99rFhlkuhhp7aqYmX/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783438432; c=relaxed/simple;
	bh=OqHbrvd0am5hYqxR6pBiWhgji4NKkISAJhdpnLRkw8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQTQjfUlmLGVNfV9ZZoBpXq3MhPd3m4w8F5k0rbIpV1O1LO+iXCS1iULTNBIqMdqq7pGGfdbt74k9aEoAjDzQNUcDdCXV6Il7swrofY/YD8LuczRzgTE0ZSSZx2Grpm2y+//2qr92Os4YeBRYXzVMLqPMQpCdFzpux3wq9QaQes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5GV+xhb; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783438429; x=1814974429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OqHbrvd0am5hYqxR6pBiWhgji4NKkISAJhdpnLRkw8o=;
  b=M5GV+xhb4gUqEiiQkKFrRg0oww1p0h2Rm6WvzjaFfBK1ehNqm/50DmHf
   cypj79paL5VLNlN8QFSFK3Ry2E+vzuSg/L5BYaxKgn/6/Vy53paH0PKGU
   mncf9BsEBovitbwz5/1IdQsnU/9Vjy+OkK2D8zOeNUg+sxcb154lxFa/U
   v8Upuen2SbOlOadz7PM5w4w71gRgCpiYuWHgBewEoA5k9dxg04HAStkOM
   GSQt1a1HuuGlvldcnPfYjxPf8IGrpn7f2F8I5KH/bmJLaU/jVghlICy7c
   mGmoRvVKbhC1HdeQD0a/dd4szllRndgU4NluPF8bhCZRhw406mdhklBq0
   g==;
X-CSE-ConnectionGUID: x2rxLr4cRGyjO0Rk+BzFWA==
X-CSE-MsgGUID: WbLyxpvvR66r0Kg4n5EZbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="106887457"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="106887457"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 08:33:47 -0700
X-CSE-ConnectionGUID: /FmlpsCaTNqsHjjXI/a5MA==
X-CSE-MsgGUID: 25TDvVtJSfmNiH9Tn9acqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="251357994"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.36])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 08:33:43 -0700
Date: Tue, 7 Jul 2026 18:33:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/5] iio: osf: add authenticated stream parser
Message-ID: <ak0cVeEUhNP1wTkQ@ashevche-desk.local>
References: <20260707014525.1015-1-kimjinseob88@gmail.com>
 <20260707014525.1015-5-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707014525.1015-5-kimjinseob88@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95403-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:dkim,ashevche-desk.local:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F61A71D55E

On Tue, Jul 07, 2026 at 10:45:24AM +0900, Jinseob Kim wrote:
> Add a UART byte-stream parser for Open Sensor Fusion frames.
> 
> The parser searches for the OSF0 wire magic, keeps partial frames
> buffered, checks header length and payload bounds, and passes complete
> candidate frames to the core decoder.
> 
> Rejected candidate frames drop only the current head byte before
> resynchronizing, so a corrupted unauthenticated payload length cannot
> make the parser skip later valid frames.

...

> +static bool osf_stream_frame_prefix_match(const u8 *buf, size_t len)
> +{
> +	for (size_t i = 0; i < len; i++) {
> +		if (buf[i] != (u8)(OSF_FRAME_MAGIC >> (i * 8)))
> +			return false;
> +	}
> +
> +	return true;

Why so complicated? le32_to_cpup() + just integer comparison should work, no?
Alternatively get_unaligned_le32() if the buffer is unaligned.

> +}

...

> +static size_t osf_stream_discard_to_magic(struct osf_stream *stream)
> +{
> +	size_t old_len = stream->len;
> +	size_t match_len;
> +
> +	for (size_t i = 0; i < stream->len; i++) {
> +		match_len = stream->len - i;
> +		if (match_len > OSF_STREAM_MAGIC_LEN)
> +			match_len = OSF_STREAM_MAGIC_LEN;

Seems like reinvention of min() from minmax.h.

> +		if (osf_stream_frame_prefix_match(stream->buf + i, match_len)) {
> +			if (i)
> +				osf_stream_discard(stream, i);
> +			return i;
> +		}
> +	}
> +
> +	stream->len = 0;
> +	return old_len;
> +}

...

> +void osf_stream_init(struct osf_stream *stream, struct osf_device *osf)
> +{
> +	if (!stream)
> +		return;
> +
> +	stream->osf = osf;
> +	stream->len = 0;
> +	memset(&stream->stats, 0, sizeof(stream->stats));
> +}
> +
> +void osf_stream_reset(struct osf_stream *stream)
> +{
> +	if (stream) {

I believe I have commented on this already. Please, go and double check all comments.

> +		stream->len = 0;
> +		memset(&stream->stats, 0, sizeof(stream->stats));
> +	}

My comment was to use the same pattern as in _init() above.

> +}

...

> +int osf_stream_receive_bytes(struct osf_stream *stream, const u8 *buf,
> +			     size_t len)

Not sure, but likely also commented on this, id est to wrap on logical split:

int osf_stream_receive_bytes(struct osf_stream *stream,
			     const u8 *buf, size_t len)

OR simply do in a single line (it's only 82 characters with increased
readability):

int osf_stream_receive_bytes(struct osf_stream *stream, const u8 *buf, size_t len)

> +{
> +	size_t copy_len;
> +	size_t space;
> +	int first_err = 0;
> +	int ret;
> +
> +	if (!stream || !stream->osf || (!buf && len))
> +		return -EINVAL;
> +
> +	if (!len) {
> +		ret = osf_stream_process(stream);
> +		if (ret && !first_err)
> +			first_err = ret;
> +		return first_err;

Why all this dances? first_err is 0, we all know this.

> +	}
> +
> +	while (len) {
> +		space = OSF_STREAM_MAX_FRAME_LEN - stream->len;
> +		if (!space) {
> +			stream->stats.dropped_bytes++;
> +			osf_stream_discard(stream, 1);
> +			if (!first_err)
> +				first_err = -EMSGSIZE;
> +			continue;
> +		}
> +
> +		copy_len = len < space ? len : space;
> +		memcpy(stream->buf + stream->len, buf, copy_len);
> +		stream->len += copy_len;
> +		buf += copy_len;
> +		len -= copy_len;
> +
> +		ret = osf_stream_process(stream);
> +		if (ret && !first_err)
> +			first_err = ret;

This error checking and handling is unusual. It requires a good comment
explaining what's going on.

> +	}
> +
> +	return first_err;
> +}

-- 
With Best Regards,
Andy Shevchenko



