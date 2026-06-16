Return-Path: <linux-doc+bounces-92490-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P2a1NQMvMWrjdQUAu9opvQ
	(envelope-from <linux-doc+bounces-92490-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 13:09:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F38E68EA8B
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 13:09:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=cKQqWLrr;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92490-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92490-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 043F1300D4C3
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 11:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DF7436352;
	Tue, 16 Jun 2026 11:09:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6E73ED5A6;
	Tue, 16 Jun 2026 11:09:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781608190; cv=none; b=kqYy+pj53BhPn7WLBL4MKdOz+nW8gg6e1TPFuo9tPjQnY2HE3qjyMCNcJT3gU4SAclhqH2dDg1L8s1si63hcFl5Ytx8maEfvXguEr2aXuHGx9ywYpTp9bradedZ2PYaB/g2AzKu2ozEIl0qgXXQuHl+vjoL6uKcqGPOZ/tn38g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781608190; c=relaxed/simple;
	bh=zVLmNdbqcdgaIpabNeHauLHcVtIQXyItIe+/fQ2wNd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4kAuMFM7THh1IgA5vqDa/eppVoqhg27i537QK1OmEm0R5+dFq8a9ZderFWVcSzPeP41bQKbnNPkdR7ZjsX1ndujXUyR4CmtxWQxNg7buE7/BAjYt0poamldrnN+9Urr2NhsHhAWVOj2OxA9WfENtvFjOCDFS04uP4aiogEZ754=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKQqWLrr; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781608189; x=1813144189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zVLmNdbqcdgaIpabNeHauLHcVtIQXyItIe+/fQ2wNd8=;
  b=cKQqWLrrPUp5y36hLlbXRaSqdnwxYhHPi6Rh2pEDIRLeNtwFFJyVm6Cb
   Chjg3sbM/H5496BxnHsFwAcWpyTo5VCTfS3S7+gPJjMWkIXcrkMMR1BWR
   mncrzyh/WNqoa4EaUMe7KvgxO6/eQTB6nzTfvLjQHggqvUyAvf1+GvC1f
   pTcHaGz3TGNsW9mUHrSxqyBORsHgu6T4sNrE+Vuf91qgGQWcsxWxs1YiU
   rYA4qX6UiEU93453h2alZpsJyQoZJwkX+9P+t5PJb1tq0EFMybmieHd6l
   5+jop6ACa545ApJdf+VnD9hA41uOqwTWTkNmKI/AXtgfGNV27FHObNpPV
   w==;
X-CSE-ConnectionGUID: ZaPB5hHCTA+Nvar0kOo0nw==
X-CSE-MsgGUID: 0d2cmOHZSIGt19AThb/f9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86271477"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="86271477"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:09:49 -0700
X-CSE-ConnectionGUID: IQ9r4yVVSjaSe3ozHtRXOQ==
X-CSE-MsgGUID: M7bd+DTERiy8I5Nn/qS3Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247615803"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.153])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:09:46 -0700
Date: Tue, 16 Jun 2026 14:09:43 +0300
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
Subject: Re: [PATCH RFC v5 3/6] iio: osf: add protocol decoding
Message-ID: <ajEu95ZgIPEsvoKu@ashevche-desk.local>
References: <20260616072242.3942-1-kimjinseob88@gmail.com>
 <20260616072242.3942-4-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616072242.3942-4-kimjinseob88@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-92490-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ashevche-desk.local:mid,intel.com:dkim,intel.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F38E68EA8B

On Tue, Jun 16, 2026 at 04:22:39PM +0900, Jinseob Kim wrote:
> Add helpers for validating and decoding Open Sensor Fusion frames and the
> message payloads used by the initial receive path.

...

> +int osf_protocol_sensor_sample_value(const struct osf_sensor_sample *sample,
> +				     unsigned int index, s32 *value)
> +{
> +	if (!sample || !sample->samples || !value)
> +		return -EINVAL;
> +
> +	if (index >= sample->channel_count)
> +		return -ERANGE;
> +
> +	/* Samples are little-endian two's-complement signed values. */
> +	*value = (s32)get_unaligned_le32(sample->samples + index * sizeof(s32));

This casting does not add anything.

> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



