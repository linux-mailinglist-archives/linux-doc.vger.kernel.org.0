Return-Path: <linux-doc+bounces-96734-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DxnKDAAnVmqs0AAAu9opvQ
	(envelope-from <linux-doc+bounces-96734-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 14:09:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 762C57544ED
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 14:09:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=A4MAnEao;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96734-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96734-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B581331CA3E
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 11:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5187E38CFEF;
	Tue, 14 Jul 2026 11:46:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE8D35BDC7;
	Tue, 14 Jul 2026 11:46:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029602; cv=none; b=lRwmfQNRqXmXYWuh8oGkJpwSvZXIqAH+jkcIVF4II8KhmobCoUsHXCwVjyDXIuRjAjg9NUrDYmLO9uKgMmScRI/W+Cgf+oF/d/M2obbnss2XPLjPvR39w4v6VMbOXD586HgJzaiQlTV88wlFWuKPKoZz1R1Q6jKCBy323SciZvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029602; c=relaxed/simple;
	bh=SuvH0R0BK+/0Ae0Mp+igWDU48vvsC5mEiQoQxHn1sBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCkGaYWApOPFxydJpFe4nKv0aGPPllMioLPgT//6UpmAQFM0+5g7HHmzvsYY92e1A/agzqHPUuQOKtsUhjfeyO7mjP9O72F55GLH15+a4bg5Y1Wi2Yt2yrSGTAQxmhUcFb8IuGcaI17biH9u+TOfu/MghZjbOq8+43XB30Dv5Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4MAnEao; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784029601; x=1815565601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SuvH0R0BK+/0Ae0Mp+igWDU48vvsC5mEiQoQxHn1sBM=;
  b=A4MAnEaojvoOKCrFwEaEU2VSDmLGPSwpk3way50gXMEpjtYfYBwJq/Db
   wC96cIw7nydxtbbwFmuvUKLaXeNLyOdXRBDX3wCKDPMTqsjMq/+CD30QZ
   0YG1znZdKYlvcCHWpDiGlPwkraFqiaVqmE/u8m22jEJ9b5OoqvSa3CEwO
   nD7eSeYWFf8x4iatRLvUm5RiIA3wFVQc8Vx4eIlKkgMkKGXn8+AJgFPC1
   tnY8PIyk9rFrq5eX1Qu9KfnDG9DAmgTTQm3e8hcWPcJPeBUYZgX8pHAvy
   ebQrqPProBY+xW0D24hKM5jkCiujRwF6DCAyhXEVUEZcVaGftlhwPisYn
   A==;
X-CSE-ConnectionGUID: 60E0xN9bTt2qse3fXPtQQg==
X-CSE-MsgGUID: HaUt82+DS/SGOVUmE4u9ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88470446"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="88470446"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:46:40 -0700
X-CSE-ConnectionGUID: RWzRhk1qTOWgY9v/MBMjwA==
X-CSE-MsgGUID: PFof6ymER0SXkV4IgFNRHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="257801627"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:46:36 -0700
Date: Tue, 14 Jul 2026 14:46:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: rodrigo.alencar@analog.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v8 06/17] iio: core: create local
 __iio_chan_prefix_emit() for reuse
Message-ID: <alYhmR7y7xlMqLJ1@ashevche-desk.local>
References: <20260714-ad9910-iio-driver-v8-0-36939c3c07d2@analog.com>
 <20260714-ad9910-iio-driver-v8-6-36939c3c07d2@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-ad9910-iio-driver-v8-6-36939c3c07d2@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96734-lists,linux-doc=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rodrigo.alencar@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 762C57544ED

On Tue, Jul 14, 2026 at 12:02:46PM +0100, Rodrigo Alencar via B4 Relay wrote:

> Move logic to create a channel prefix for naming attribute files into a
> separate __iio_chan_prefix_emit() function for reuse. The dev pointer is
> passed to __iio_device_attr_init() so that dev_err() replaces WARN().
> The new helper is going to be used to expose channel relationships as
> sysfs attributes.

...

> +static ssize_t __iio_chan_prefix_emit(struct device *dev,
> +				      const struct iio_chan_spec *chan,
> +				      enum iio_shared_by shared_by,
> +				      char *buf, size_t len)
> +{
> +	const char *type = iio_chan_type_name_spec[chan->type];
> +	const char *dir = iio_direction[chan->output];
> +	struct seq_buf s;
> +
> +	seq_buf_init(&s, buf, len);
> +
> +	switch (shared_by) {
> +	case IIO_SHARED_BY_ALL:
> +		break;
> +	case IIO_SHARED_BY_DIR:
> +		seq_buf_printf(&s, "%s", dir);
> +		break;
> +	case IIO_SHARED_BY_TYPE:
> +		seq_buf_printf(&s, "%s_%s", dir, type);
> +		if (chan->differential)
> +			seq_buf_printf(&s, "-%s", type);
> +		break;
> +	case IIO_SEPARATE:

> +		seq_buf_printf(&s, "%s_%s", dir, type);
> +		if (chan->indexed) {
> +			seq_buf_printf(&s, "%d", chan->channel);
> +			if (chan->differential)
> +				seq_buf_printf(&s, "-%s%d", type, chan->channel2);
> +		} else if (chan->differential) {
> +			dev_err(dev, "Differential channels must be indexed\n");
> +			return -EINVAL;
> +		}
> +
> +		if (chan->modified) {
> +			if (chan->differential) {
> +				dev_err(dev, "Differential channels can not have modifier\n");
> +				return -EINVAL;
> +			}
> +			seq_buf_printf(&s, "_%s", iio_modifier_names[chan->channel2]);
> +		}
> +
> +		if (chan->extend_name)
> +			seq_buf_printf(&s, "_%s", chan->extend_name);
> +		break;

Can we actually do the validation first without dirtying the output?

		/* Validate differential channel settings */
		if (chan->differential) {
			if (!chan->indexed) {
				dev_err(dev, "Differential channels must be indexed\n");
				return -EINVAL;
			}
			if (chan->modified) {
				dev_err(dev, "Differential channels can not have modifier\n");
				return -EINVAL;
			}
		}

		seq_buf_printf(&s, "%s_%s", dir, type);

		if (chan->indexed) {
			seq_buf_printf(&s, "%d", chan->channel);

		if (chan->differential)
			seq_buf_printf(&s, "-%s%d", type, chan->channel2);

		if (chan->modified)
			seq_buf_printf(&s, "_%s", iio_modifier_names[chan->channel2]);

		if (chan->extend_name)
			seq_buf_printf(&s, "_%s", chan->extend_name);
		break;


> +	}
> +
> +	return seq_buf_has_overflowed(&s) ? -EOVERFLOW : s.len;
> +}

-- 
With Best Regards,
Andy Shevchenko



