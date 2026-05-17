Return-Path: <linux-doc+bounces-88012-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMYZKaLYCWossQQAu9opvQ
	(envelope-from <linux-doc+bounces-88012-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 17:02:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F761561DC1
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 17:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5C22302614F
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 15:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE923B52E2;
	Sun, 17 May 2026 15:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxY2GF8e"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B5D330324;
	Sun, 17 May 2026 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030076; cv=none; b=IQnVWcKdDWj0CO9VFvvUZFcrOmgNnweb9ftZmvcG5QLaW7aa8NoAie9mvakHivGmty7nq7s3C2QEI5Yk+jzRVibWhzqPuhdBq8rIILBpI6Fe/rAMeRRf2LyKEi9ArOrjVo8jNNultRzQWXHS/9jNcibuUWmuMqK1V4ICtub39hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030076; c=relaxed/simple;
	bh=+p/T8f8U9P6+mPDJp11pUIiEZbrCsqeSPkt/HUib5V8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zs3Ec/El3OmjEpYpAaTlJMJEXRtIvexsygl5cbofN6fBiQkMnYYzgKhREsQ1UriAdrMa+56ULbP5NQM3q50Q4XHCbbOupfXUMkhugzKEAoJw1YleFLI0Ypv2+fj3Cr6eHJTihMkHK3QZppbeget1uE4FRgFZIMGOOWGO5HQ0FMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxY2GF8e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9433EC2BCB8;
	Sun, 17 May 2026 15:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779030075;
	bh=+p/T8f8U9P6+mPDJp11pUIiEZbrCsqeSPkt/HUib5V8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KxY2GF8edvsnWPYhkTvlD9sJ/ueXhu6iUoG6HmnRof4HMVl/oJ8CkC2eqCxr5K4On
	 w4TDOYGHQmzQZ7pXp9qsn7Tnn4BJeAmDsQv61IwGdV8VKkwHD/0XOQBzNd6nqcq6LO
	 CDYT3sPoRN7jV1m85rPNv4hCBkoZcwyD/WzmYl0z6HSubMK2vV2wuJS72sCJe1W4wp
	 IRtQCC8HUE1cGNa5fGjpFOxTxcQtMMKhf96ssf23Rf1c1Rx8yuHdh2wKgy1G7lmMbb
	 UXtsHQiwT0uy55eYm93bLwQ/R2MTn2o+AmX84Ustp7+IhywFFlMo4HLPrXhSrWG/o7
	 vG10IhCc8aDWA==
Date: Sun, 17 May 2026 16:01:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH RFC v4 05/10] iio: frequency: ad9910: add digital ramp
 generator support
Message-ID: <20260517160105.362d9208@jic23-huawei>
In-Reply-To: <20260508-ad9910-iio-driver-v4-5-d26bfd20ee3d@analog.com>
References: <20260508-ad9910-iio-driver-v4-0-d26bfd20ee3d@analog.com>
	<20260508-ad9910-iio-driver-v4-5-d26bfd20ee3d@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4F761561DC1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-88012-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,rodrigo.alencar.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,analog.com:email]
X-Rspamd-Action: no action

On Fri, 08 May 2026 18:00:21 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add Digital Ramp Generator channels with destination selection (frequency,
> phase, or amplitude) based on attribute writes, dwell mode control,
> configurable upper/lower limits, step size controlled with rate of change
> config, and step rate controlled as sampling frequency.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> ---
>  drivers/iio/frequency/ad9910.c | 511 ++++++++++++++++++++++++++++++++++++++++-


>  static const struct iio_chan_spec_ext_info ad9910_phy_ext_info[] = {
>  	AD9910_EXT_INFO("powerdown", AD9910_POWERDOWN, IIO_SEPARATE),
>  	{ }
> @@ -677,6 +939,14 @@ static const struct iio_chan_spec_ext_info ad9910_pp_ext_info[] = {
>  	{ }
>  };
>  
> +static const struct iio_chan_spec_ext_info ad9910_drg_ramp_ext_info[] = {
> +	AD9910_EXT_INFO("dwell_en", AD9910_DRG_DWELL_EN, IIO_SEPARATE),
> +	AD9910_DRG_EXT_INFO("frequency_roc", AD9910_DRG_FREQ_ROC),
> +	AD9910_DRG_EXT_INFO("phase_roc", AD9910_DRG_PHASE_ROC),
> +	AD9910_DRG_EXT_INFO("scale_roc", AD9910_DRG_AMP_ROC),

See abi docs reply. This scale made me wonder if we can make this just roc with it
scaled to be in the base units for altvoltage.

> +	{ }
> +};

