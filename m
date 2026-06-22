Return-Path: <linux-doc+bounces-93118-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U9wiGbtnOWpmrwcAu9opvQ
	(envelope-from <linux-doc+bounces-93118-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 18:50:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3726B141A
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 18:50:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Lub6w4me;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93118-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93118-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39599301BCDA
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 16:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5C6313283;
	Mon, 22 Jun 2026 16:49:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597472C21C7;
	Mon, 22 Jun 2026 16:49:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146999; cv=none; b=dB6cx04OYpflfGK5+Szlh17PliQ2fhWVFYPdjhehtCrClcdw5UyVzs+bhGVDzHzpndD83Rdg+AaW+ZvecgE00sRYCk82BIjblxVYdkL96vFCQ5ys6zT5LeYxMPK9O1VM3PW04jOo5TnpU2v2V8LtMvPdPCtEQxwGHSB66CMdmME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146999; c=relaxed/simple;
	bh=SASbNBgHfUe2piqd/bAGqGGSZSSvGEyVmzsyV8nAOjo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETucSPVrEhIQY2FbtB9KZNrW8UOdFrAQyofnyVH4ayIdp9nysJQr/kIYC71cuv8jGOtd2wQhGhhKFKA6uh2rN+wcXPAt6LKNfhub0Qkq96H3/+SQyJxJPZJE7xGQOjsHfAi3Wn3qIIVj6jtHfArCOo5RsfYQPfDQCJAykTBjnrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lub6w4me; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF601F000E9;
	Mon, 22 Jun 2026 16:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782146998;
	bh=4wFkFlh6o8UtfgoYDfjZ3TFyAJB1QqVMPT3MDZ0e1cw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Lub6w4meU4xrbEEmbNwFhUL0t8fJWgzNHBrLU0YaB1iaFEgC7bXUsgjCNgjXs6C8b
	 t/DS8QvVU6iJJIP6cakYETLY/NZXca3bpu41C+1gKKF/fUUeER3wICN+Uz6KjpaRyt
	 U5pvI6SoC/qUV4NS/bNgXLUyx8h/gOK5kfshmWg6k+wSRpTFP2Qp2o8RDsbAQP6paM
	 N64+duq227RsETRNmARaBMTxvbyOoz9hM0J0gjEdFSAmF2Ue43wt8NU7m/GHDvlGtY
	 bC2JfGjnRkbO3ZBNqaJKDZnLXFvg2r4Q8anGnUz45Rg6p77GGMwIJcxgDQ0tRL8MkU
	 7ptoFSGsYq3Qg==
Date: Mon, 22 Jun 2026 17:49:48 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v5 5/6] iio: osf: add UART transport
Message-ID: <20260622174948.4b7032ca@jic23-huawei>
In-Reply-To: <20260616072242.3942-6-kimjinseob88@gmail.com>
References: <20260616072242.3942-1-kimjinseob88@gmail.com>
	<20260616072242.3942-6-kimjinseob88@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kimjinseob88@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-93118-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,jic23-huawei:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA3726B141A

On Tue, 16 Jun 2026 16:22:41 +0900
Jinseob Kim <kimjinseob88@gmail.com> wrote:

> Add the serdev UART transport and the initial OSF core receive path.
> 
> Enable the required vcc regulator with devm_regulator_get_enable()
> before opening the UART, keeping power handling limited to the simple
> probe-time requirement for this RFC.
> 
> Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
A few things inline.

Thanks,

Jonathan

> diff --git a/drivers/iio/opensensorfusion/Kconfig b/drivers/iio/opensensorfusion/Kconfig
> new file mode 100644
> index 000000000..d393eb3aa
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config OPEN_SENSOR_FUSION
> +	tristate "Open Sensor Fusion UART IIO driver"
> +	depends on IIO
> +	depends on SERIAL_DEV_BUS
> +	select CRC32
> +	help
> +	  Build the Open Sensor Fusion UART receive path.
> +
> +	  The driver receives OSF protocol frames over a serdev UART.
> +	  Frames are decoded and validated before being passed to the
> +	  driver core.
> +	  This patch only adds the transport path.
> +	  IIO device registration is added separately.

Don't talk about a patch in here.  Talk about what is supported then
if you really want to add the other bits in later patches.  Mostly
this help is generic enough we don't need to modify it more than
once in a series.

> diff --git a/drivers/iio/opensensorfusion/osf_core.c b/drivers/iio/opensensorfusion/osf_core.c
> new file mode 100644
> index 000000000..137fb7166
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_core.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/errno.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include "osf_core.h"
> +#include "osf_protocol.h"
> +
> +#define OSF_RESERVED_MSG_FIRST		0x7f00
> +#define OSF_RESERVED_MSG_LAST		0x7fff
> +#define OSF_VENDOR_PRIVATE_FIRST	0x8000
> +
> +void osf_core_init(struct osf_device *osf, struct device *dev)
> +{
> +	memset(osf, 0, sizeof(*osf));
	*osf = (struct osf_device){
		.dev = dev,
	};

is guaranteed to also clear all other fields (new C spec as
well as the options the kernel has long been built with)
so is how I would always do cases of zero then set stuff like
this.

> +	osf->dev = dev;
> +}


> diff --git a/drivers/iio/opensensorfusion/osf_serdev.c b/drivers/iio/opensensorfusion/osf_serdev.c
> new file mode 100644
> index 000000000..624cb01fe
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_serdev.c

> +
> +static void osf_serdev_remove(struct serdev_device *serdev)
> +{
> +	struct osf_serdev *osf_uart = serdev_device_get_drvdata(serdev);
> +
> +	serdev_device_close(serdev);
> +	osf_stream_reset(&osf_uart->stream);
> +	osf_core_unregister_iio(&osf_uart->osf);

My gut feeling is this should be first to tear down the device
interfaces as soon as possible.  They will have been initialized
after the serdev was opened so should be unregistered before it is closed.
If there is a reason for this specific order add a comment.

> +}

> +
> +static struct serdev_device_driver osf_serdev_driver = {
> +	.probe = osf_serdev_probe,
> +	.remove = osf_serdev_remove,
> +	.driver = {
> +		.name = "open-sensor-fusion-uart",
> +		.of_match_table = osf_serdev_of_match,
> +	},
> +};
> +

No blank line here as the macro is extremely tightly coupled
with the structure and it is nice to have the visual cue.

> +module_serdev_device_driver(osf_serdev_driver);
> +
> +MODULE_DESCRIPTION("Open Sensor Fusion IIO driver");
> +MODULE_LICENSE("GPL");


