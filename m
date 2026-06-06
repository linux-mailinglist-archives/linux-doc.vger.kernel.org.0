Return-Path: <linux-doc+bounces-91209-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gFevIH7NI2rZywEAu9opvQ
	(envelope-from <linux-doc+bounces-91209-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 09:34:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C60E764CDAB
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 09:34:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Fx7684AQ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91209-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91209-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6C81300B079
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jun 2026 07:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67530149C6F;
	Sat,  6 Jun 2026 07:34:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6761045039;
	Sat,  6 Jun 2026 07:34:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780731259; cv=none; b=ep4Zus8BMSGTETWeMOzYkPJlZFw61QGxGNDo/GwR4DWz0nuxGp6JZeXoa3bOLi8IPqOgSaZHUkOcQjA8Z5K0QlKRXCBexmB4dRK7Cg3omscqBwaec7SxBRs/UeVRDOWQpyg84w59d9LCISgsQOa1VGkYFChOPPBORAQIMYfTHaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780731259; c=relaxed/simple;
	bh=Hj4jtNlmm4TyAKUXCKYOWfzfBlQpj3Y4D+j5+2tpzEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6XjLmILUogcFbuGeHQPwBFsU4Q2ZdAT8JMThwCR/72CCl/nRgQcJWaTQrUtiE/xvAfsHWJM6DpdZSMd4NdbBuQL18iDeviLfLh94YSH6wBj0SXB/gOFQUt9KUExsnTGHKvuFuDLOO3MqbIJpzzUxPKuIt7ZrszqpS8rpcFuD2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fx7684AQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C2C1F00893;
	Sat,  6 Jun 2026 07:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780731258;
	bh=EnqYGUdPmuADwtZ4RT0d+RNOynoAs9q0xEap8W9Djtg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Fx7684AQRixnSFIhI3q7J2qXC/Fxx17OV8Ee3KgrbzF/nq79QZ6JsPgz8J47VS6g4
	 iorwffelSHkkEVd5bbz9d+OjIVEkwtRsrRPn3CJj2unu7RlEO9/+/siH+Obj6k6I0N
	 Y5rYNel4riZqW2tfKvIW8xps1HKdx72LEGjT1aszG/cH1Xnl0eHPel949XQLEgx7sW
	 muT7d4H5b7B83VcTZzC6Rk8h8JprMWVOKKXDGqipqRI2G1/qjpiQ7NwpmMv/wmtBbl
	 TIhpSTeXIcOLrwURx/3SbQ9jZuSoyl9Rpe3vvs9sJruoNFmrDHV0KdaCZ9f90s8c3k
	 ix0XdgK0U78aA==
Message-ID: <32705660-cd65-423f-a04b-8c6babed53bf@kernel.org>
Date: Sat, 6 Jun 2026 15:33:59 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] block: add configurable error injection
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260605184441.590927-1-hch@lst.de>
 <20260605184441.590927-5-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260605184441.590927-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:corbet@lwn.net,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-91209-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dlemoal@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlemoal@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C60E764CDAB

On 2026/06/06 2:44, Christoph Hellwig wrote:
> Add a new block error injection interface that allows to inject specific
> status code for specific ranges.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

[...]

> +===================	=======================================================
> +op=%s			block layer operation this rule applies to, e.g. READ
> +			or WRITE.

Like you did in the commit message of patch 3, maybe mention that this should
match "XYZ" of one of the defined REQ_OP_XYZ operation ?

> +			Mandatory.
> +start=%u		First block layer sector the rule applies to.
> +			Optional, defaults to 0.
> +nr_sectors=%u		Number of sectors this rule applies.
> +			Optional, defaults to the remainder of the device.
> +status=%s		Status to return.

Maybe mention that this should match XYZ for one one of the defined BLK_STS_XYZ ?

> +			Mandatory.
> +chance=%u		Only return a failure with a likelihood of 1/chance.
> +			Optional, defaults to 1 (always).
> +===================	=======================================================

[...]

> +	/*
> +	 * Add to the front of the list so that newer entries can partially
> +	 * override other entries.  This also intentional allows duplicate

s/intentional/intentionally

> +	 * entries as there is no real reason to reject them.
> +	 */

Beside these nits, looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

