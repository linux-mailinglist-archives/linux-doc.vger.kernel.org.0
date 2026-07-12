Return-Path: <linux-doc+bounces-96425-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jJSLHjvlUmpRVQMAu9opvQ
	(envelope-from <linux-doc+bounces-96425-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 02:52:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0944A74354E
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 02:52:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NE4gPOF+;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96425-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96425-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5195F3018292
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 00:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8B71A239A;
	Sun, 12 Jul 2026 00:51:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654E013D503;
	Sun, 12 Jul 2026 00:51:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783817516; cv=none; b=Qhi+yBdZiperHVyzKcnMNULYFdtL4t7az7+R5XXCAC3O+KN/kFBy6aPLlycyCZjlyz0DwHqwhFrK9pRd0B/le/lAHuWnFUSQEbCdJeuWOSZtWjdTWf+KiS+bUUrUJ6WgSfNQfOSUeEWrC3NEsHQKCzS/+CaEiV2nZryNP/Lj498=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783817516; c=relaxed/simple;
	bh=MWXyKx3r+87ZAIALgY2n0zGUU4+3uAlRyvtd94skiSw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g8ZxzWYxcfKzEcTQODt1HYyA2zVRCLCjFtctYerTjDHKzucddPi+g0fiuMlR+QYkG8q0gtcwTmpiQCCQBhv/579eAHgHg1aioxLKsEiVdYPQkzcciqQqv0botw4no27XYyY39vjMRr6XSNZIGIE18Unszh2+IweLhNVqZEl93Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NE4gPOF+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A0B1F000E9;
	Sun, 12 Jul 2026 00:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783817514;
	bh=Ky+9NbjAdq3ljTtqL/5UQG2UbRk9lfd00iRsnPy/ybM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NE4gPOF+5ZDgpuAGPyniJv/uBvi+FIKifdHjwRe6wouz21hRaTm0YSyuDTdIT+ME6
	 Eg+tnCyDTQJpnEY9InmK+QysMlbfkimqnVv3IMKx3VJXwphH8pY+6Q08+5YnJ1KX4Q
	 HTJdpyiaiY6kkZ1P7wjtoDsLYEhp1Wi1cfzr6eGeTy5hLkcMKOUaf3TG+2ZvSqIkyN
	 sL6JzznXUIp6L5zhWyir543csb5Cg6XsCN/kn2/LtCt5MpoP8ZCy0vc5ujvD4yRX2m
	 E8mkEqbfxRGI3TY8B3qtQrZYD7P0uRtIRSKQxGaNC2yG7VDjCplyuiba4mrThA251T
	 vFtNWViSiHwRA==
Date: Sun, 12 Jul 2026 01:51:48 +0100
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
Subject: Re: [PATCH v7 03/17] iio: ABI: add parent entry for iio channels
Message-ID: <20260712015148.098f0bdb@jic23-huawei>
In-Reply-To: <20260707-ad9910-iio-driver-v7-3-a4ec30f63700@analog.com>
References: <20260707-ad9910-iio-driver-v7-0-a4ec30f63700@analog.com>
	<20260707-ad9910-iio-driver-v7-3-a4ec30f63700@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:devnull+rodrigo.alencar.analog.com@kernel.org,m:rodrigo.alencar@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:devnull@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-96425-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,rodrigo.alencar.analog.com,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jic23-huawei:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,analog.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0944A74354E

On Tue, 07 Jul 2026 15:04:24 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add documentation for a read-only sysfs attribute that allows to expose
> parent-child relationships between IIO channels.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>

> +
> +		For example, an IIO device may expose a primary output channel as
> +		"out_voltage0" together with a set of profile-based or mode-based
> +		subchannels used to configure or compose the output signal. These
> +		subchannels may carry common attributes such as frequency, phase, etc.
> +		They do not represent physical outputs, but rather logical/virtual
> +		channels grouping configurations that affect the primary output.
> +		Each subchannel exposes a *_parent attribute reading "out_voltage0",
> +		allowing userspace to group controls under the output channel they
> +		belong to rather than treating them as unrelated top-level channels.
> +
Nice.  Thanks for adding that.

Jonathan

>  What:		/sys/bus/iio/devices/iio:deviceX/in_phaseY_raw
>  KernelVersion:	4.18
>  Contact:	linux-iio@vger.kernel.org
> 


