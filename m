Return-Path: <linux-doc+bounces-77435-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ol2KdBfo2myBQUAu9opvQ
	(envelope-from <linux-doc+bounces-77435-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 28 Feb 2026 22:36:16 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8061C928F
	for <lists+linux-doc@lfdr.de>; Sat, 28 Feb 2026 22:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53A8B330E7CC
	for <lists+linux-doc@lfdr.de>; Sat, 28 Feb 2026 20:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675AB40149D;
	Sat, 28 Feb 2026 19:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5Ae7O2d"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0D277C81;
	Sat, 28 Feb 2026 19:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772306144; cv=none; b=K4NLueo7IsUniBqY4syCXuo0T0Y9tkL0yWPnH5vc7MIIZNehVcAVD2LrURQDL4pCj2SYEbwvgDCaCqTw3jyXvDJ5LmlUFItQ4DqjIAw5nZS4s4TQljdnM8UoJPVt8w1Q5D+wSpfLZtifGt97mrkoGP2sNiC0XyZ/rsVgtGv58GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772306144; c=relaxed/simple;
	bh=DWW76vcfVwuwoF60EnAL2u6JzTUPFdmM/12fzoqr6tY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=boe66BQMq3MnHY7ZPFLZLXWnICXDQBS144a+m2f1v66gh56psw0y4/u+0fB4Dq7BHvYKLQr5sVpk4CdGTytW8Q7Cg8l/kQHEY0mJwwMmV8+mHOr/gO5JNXhc2vrEfaiMkjaEbraxdy2VBx4zPKp5NqT4ISDL2McD+hk7n7hrw/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5Ae7O2d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C94C116D0;
	Sat, 28 Feb 2026 19:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772306144;
	bh=DWW76vcfVwuwoF60EnAL2u6JzTUPFdmM/12fzoqr6tY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m5Ae7O2dMFtvPV2fbqtIjrgaDgiDdGT6FvHNN22LpyAggbitlxFrN18KQjWICLO0Y
	 pdEH/vixseMC8yIbhcpscSUiLlDXA2dqpDdimbXznss7WjWLnWw4dhaCOGM8uUAlMs
	 kBGWy/EzXD/ym/WU616+Wz9fgYaeKIbqN0WuDIILce+idB0xYC4a1a19ZBVq9H91MR
	 TJGfW3fJGcVXGSwIa2f1gbqJxMc5MbBOT44GgO79MGvle4Ac19eLrwBJElt5uzzS/S
	 oCdDebc9lbim2KhzQS6/dMLq/UXnB1yNM9pHcwMmgJ4GDHSsrIeBblNGkM1+P65YJG
	 HFilUQcC4Z89Q==
Date: Sat, 28 Feb 2026 19:15:33 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <michael.hennerich@analog.com>, <nuno.sa@analog.com>,
 <eblanc@baylibre.com>, <dlechner@baylibre.com>, <andy@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <corbet@lwn.net>, <marcelo.schmitt1@gmail.com>
Subject: Re: [PATCH v10 0/6] Add SPI offload support to AD4030
Message-ID: <20260228191533.62fa1f15@jic23-huawei>
In-Reply-To: <cover.1771865684.git.marcelo.schmitt@analog.com>
References: <cover.1771865684.git.marcelo.schmitt@analog.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77435-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,analog.com,baylibre.com,kernel.org,lwn.net,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,analog.com:email]
X-Rspamd-Queue-Id: 7E8061C928F
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 14:08:50 -0300
Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:

> Hello,
> 
> This is v10 of high speed data capture support for AD4030/AD4630 and similar ADCs.
> It also adds support for ADAQ4216 and ADAQ4224.
> 
> Rebased on top of IIO testing.
Series applied to the togreg branch of iio.git and pushed out as testing.

Thanks!

J

> 
> Looks like a devm_pwm_get_disabled() interface might not get accepted so I
> didn't change the handling of PWM initialization on v10.
> 
> Change log v9 -> v10
> [DT]
> - No changes.
> [IIO]
> - Explained the need of PWM in commint message.
> - Fixed off-by-one bug.
> - Use in-loop counter declaration.
> - Correctly prepared patches, dropping unsupported bindings for input gain control.
> - Skipped the patches applied from previous version.
> - Initialize iio_scan_type struct fields on same order they are on structure definition.
> 
> Link to v9: https://lore.kernel.org/linux-iio/cover.1771253601.git.marcelo.schmitt@analog.com/
> 
> Thanks,
> Marcelo
> 
> Marcelo Schmitt (6):
>   Docs: iio: ad4030: Add double PWM SPI offload doc
>   dt-bindings: iio: adc: adi,ad4030: Add PWM
>   iio: adc: ad4030: Add SPI offload support
>   dt-bindings: iio: adc: adi,ad4030: Add ADAQ4216 and ADAQ4224
>   iio: adc: ad4030: Add support for ADAQ4216 and ADAQ4224
>   iio: adc: ad4030: Support common-mode channels with SPI offloading
> 
>  .../bindings/iio/adc/adi,ad4030.yaml          |  62 ++
>  Documentation/iio/ad4030.rst                  |  39 ++
>  drivers/iio/adc/Kconfig                       |   5 +
>  drivers/iio/adc/ad4030.c                      | 641 +++++++++++++++++-
>  4 files changed, 726 insertions(+), 21 deletions(-)
> 
> 
> base-commit: 0be8a2716187607daaa8ba80687a926438d88432


