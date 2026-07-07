Return-Path: <linux-doc+bounces-95407-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yX2tOTckTWoSvwEAu9opvQ
	(envelope-from <linux-doc+bounces-95407-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 18:07:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDE071DAAD
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 18:07:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=TBIT2Kmz;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95407-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95407-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFDA5311554E
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 16:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C08A431498;
	Tue,  7 Jul 2026 16:00:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DF3431484;
	Tue,  7 Jul 2026 16:00:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440052; cv=none; b=s7xTACwfb3oSvnUes3cPJxlVS5mZguYZ1TlfWatvanixXthcCsEznk4X5XmN5D72e58ztC996M+ps9PIocfQ1IAPXFH/O9OcycFVM10ks9UNwbptIiHo316LpzFo800Y1S+cxDOZ3tr/OhcWRJoQtlOFFE0e2XNyRWHvALR/fUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440052; c=relaxed/simple;
	bh=ChJRypsr3Dcq8r3UD1/SH4cIoxbNZOBcguf/Rdix3Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfkStqIC6B0EIx+MqEvtHsvXnt5ofUpSl044Jo47Fr0DYAOi9xrTNf0+KauxiB/zpuH55TMzzbA/NuhZKMDtu/+aaLvMYIvvhPxzUJhslgfqRYDS64UaxriJS6aCCpUntL0fkyhiJY6HrxVcsSYviPENmxTTZCFo3YOTApVh1Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBIT2Kmz; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783440050; x=1814976050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ChJRypsr3Dcq8r3UD1/SH4cIoxbNZOBcguf/Rdix3Oo=;
  b=TBIT2KmzESWNM0oZ5zKnfOcnCwX7PyF5icosspqXv6HvDT7kZN9kn8jK
   DGCMq37vocr45Mc6ZDyn4y8ASce7l2UQzlPNIwTJvEIURVGyid9dKEDBO
   XIWVIs/l+zDUg/asqAl32Ew3zLT5rdZXPzYqIVpTqqTWe0NGiKKD5mvk4
   LzZUXA6U5N58Gn03mbtsArTWe8D5e88wFqXVd5UkhCBQona/Cfn/bdKV9
   Zx0kWANirioZryRIhRhfoUvhbmBeDuC3K131KD7t7SJBB3Cs3WJn6M0gm
   cUtyrIz8AgFoNfKW7RTsHyJg+QV+TlUjzDpeoKZy8VH4U3c313FhgCj1m
   w==;
X-CSE-ConnectionGUID: La/cKO59RBW1n6//2HGoyg==
X-CSE-MsgGUID: ZI+DyjD2TDKH5IS3z7uy6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="95606865"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95606865"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 09:00:49 -0700
X-CSE-ConnectionGUID: 6wMFz189QgOFRSpef6Dblw==
X-CSE-MsgGUID: oPwpGielSgeqE+pcYxtbmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="250674850"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.36])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 09:00:45 -0700
Date: Tue, 7 Jul 2026 19:00:43 +0300
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
Subject: Re: [PATCH v7 08/17] iio: core: add hierarchical channel
 relationships
Message-ID: <ak0iq2KGgGnjTgfr@ashevche-desk.local>
References: <20260707-ad9910-iio-driver-v7-0-a4ec30f63700@analog.com>
 <20260707-ad9910-iio-driver-v7-8-a4ec30f63700@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-ad9910-iio-driver-v7-8-a4ec30f63700@analog.com>
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
	TAGGED_FROM(0.00)[bounces-95407-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:from_mime,intel.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DDE071DAAD

On Tue, Jul 07, 2026 at 03:04:29PM +0100, Rodrigo Alencar via B4 Relay wrote:

> Add parent-child relationship between iio channels by creating a parent
> pointer field in iio_chan_spec struct and exposing a sysfs attribute that
> returns the parent channel prefix.

...

> +static ssize_t iio_read_channel_parent(struct device *dev,
> +				       struct device_attribute *attr,
> +				       char *buf)
> +{
> +	const struct iio_chan_spec *chan = to_iio_dev_attr(attr)->c->parent;
> +	ssize_t len;
> +
> +	len = __iio_chan_prefix_emit(dev, chan, IIO_SEPARATE, buf, PAGE_SIZE);
> +	if (len < 0)
> +		return len;
> +
> +	buf[len] = '\n';
> +
> +	return len + 1;

	buf[len++] = '\n';

	return len;

? To me this variant is more robust as we don't forget about \n in the len
count.

> +}

-- 
With Best Regards,
Andy Shevchenko



