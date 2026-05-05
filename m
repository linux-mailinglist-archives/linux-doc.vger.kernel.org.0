Return-Path: <linux-doc+bounces-85937-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPd8Jv4Q+mntIgMAu9opvQ
	(envelope-from <linux-doc+bounces-85937-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 17:47:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB0A4D0873
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 17:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C8E23076A7F
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 15:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3B848B399;
	Tue,  5 May 2026 15:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXHG/2X8"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF96448B37F;
	Tue,  5 May 2026 15:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995623; cv=none; b=IM8kSwWxheGSZTFz4wdNCiJ/qK//kW/urJ/XPiO9aZn8SQLYn1Za8gE9LzL7movwsz8DNDhaJmBs7kgfoDWMk08x471trJ/0mGJPu8UGxbhLLFpzr3LE7CRUJ9oM16SrQ68Tpf+7qd/B2mY+W7HkhBsXDFwa4MQzJaEl6WUkbMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995623; c=relaxed/simple;
	bh=049qJAgxHgN7rjuqk0ssOpe8JOJ4sYqPMqmLvTrcURA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ym1+Q9zwd1rvausbZ6e3AlM7vGp2rq17N8EcOvLRFI3CTTebc73LalQLoPvVGG4jco7ZJ4B9TkwqpJtN9TVWSNn9bhlP1xD4o0QuM24mCE2ZpClUFGimUWSNNBOxesVShtyqBZOocRpk9n6Fhh9yILy9wH/0K+WQZKy6AsE4A2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXHG/2X8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15BAC2BD04;
	Tue,  5 May 2026 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995623;
	bh=049qJAgxHgN7rjuqk0ssOpe8JOJ4sYqPMqmLvTrcURA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eXHG/2X8k3o03NZxsIJjI388gsoNF56px4sHtOhl/I9OeCXbfh0QUr/eCL+r/vZF0
	 ulBEyh4btxyEusuJ2NwDWHa5He+24I6TTyJdnJ7R8H/8igz4sSP3KUfxEZfChZhtkA
	 RSn6jASEUBBBl4OUbF7royOrK3DY1aC7/+e9ILKE9HrG9ipae4Ea+1M3kdDOZLeu1/
	 3usxfK9IFZ7+dkr5+CCUH7m+fQiQZUWYcHYnmdJwxGOrpSb2Y5BYIspyX3Q052iTF1
	 DVkf6lR9tOtGNqstb0nQvoUT7XuA16VPHe4mV4BByWe97yWMbR1jjqmP6OsC55tDyY
	 8N2/r2cBVnXrg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Sean Anderson
 <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 07/27] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-7-833dab5e7288@bootlin.com>
	(Miquel Raynal's message of "Fri, 03 Apr 2026 18:09:25 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-7-833dab5e7288@bootlin.com>
Date: Tue, 05 May 2026 17:40:18 +0200
Message-ID: <2vxzfr4527bx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 3AB0A4D0873
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-85937-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email]

Hi,

On Fri, Apr 03 2026, Miquel Raynal wrote:

> Add comments about how these requests are actually handled in the SPI
> NOR core. Their behaviour was not entirely clear to me at first, and
> explaining them in plain English sounds the way to go.
>
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/swp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 1d50db1ef1a0..64a917543928 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -346,6 +346,14 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
>  	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf[0]);
>  }
>  
> +/*
> + * These ioctls behave according to the following rules:
> + * ->lock(): Never locks more than what is requested, ie. may lock less
> + * ->unlock(): Never unlocks more than what is requested, ie. may unlock less
> + * -is_locked(): Checks if the region is *fully* locked, returns false otherwise.
> + *               This feeback may be misleading because users may get an "unlocked"
> + *               status even though a subpart of the region is effectively locked.
> + */

We already have some text where struct spi_nor_locking_ops is defined.
Can we move this information there?

>  static const struct spi_nor_locking_ops spi_nor_sr_locking_ops = {
>  	.lock = spi_nor_sr_lock,
>  	.unlock = spi_nor_sr_unlock,

-- 
Regards,
Pratyush Yadav

