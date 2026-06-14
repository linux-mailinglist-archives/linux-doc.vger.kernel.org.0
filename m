Return-Path: <linux-doc+bounces-92329-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +1FIIqPrLmqF6AQAu9opvQ
	(envelope-from <linux-doc+bounces-92329-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 19:57:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D85BA681D45
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 19:57:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QuhAe9bG;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92329-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92329-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB0753008D05
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 17:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8785739F184;
	Sun, 14 Jun 2026 17:57:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FCF303A35;
	Sun, 14 Jun 2026 17:57:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781459871; cv=none; b=gdwSz4xoXlroMo/YPbVfpAip6kLR014ug+Iq2Y2KEsvWiQxiX3NnbyXoZXV0OwFpGbkvNjoamnTdGwUYswMUeW/uBs6hifvO7YjZDAYInnWqZ81jboeXG2BxB10mvZWzDjIvg0v08/RP8QFNiQQwKUGLgT8pgFtfJ3tnh0Lmeo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781459871; c=relaxed/simple;
	bh=TXjqj/4pmnnKvT/53TQlFE/FD34TYAqsSx3MsKEuKJU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cJB3cK57/CgFTydho5BAMoHmvhNBgjeNb9w8nnqVLDqCkS7KZ0hfpA1LL9lNx+y4l+1ySMzWt5TKgctnv0dk6p7F4wkm1EafAKhu2+jqGDZn0jYumdlR0rvCK6pG04XaenjcXePYOY07RshY54Fh52BnhKBd42EUqFebaWI3B54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuhAe9bG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76DD1F000E9;
	Sun, 14 Jun 2026 17:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781459870;
	bh=DauTCXOBmHSgstOu88XTN6FSX1Ww5vmgjV3IuE4PRDc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QuhAe9bGISt6myY6XKqL1Mn/yQ5wQxDEYvdfMRvDGbfHUxxQBDvMgpoBah+bAZvoi
	 QlFrXnrwRl0OogjTe7mDFwh1AeiwmZXjOkqWBwXnwR62vpj+WIh1/IMGN9ntVAuAhd
	 4DBvwTuXv+teqpDYOHG2ClRUJs96VJHpjkWPFKMG4vQp5pHxHjdVXvsOVDd+B3M0Cn
	 nbNggKGP3C/Y5gLb5EfHae3ES/oGQ7IJ1Ebuv5RasNkgNExaLIq+BI4veqKqWl1JnE
	 JDniEfreB7k4Z4XzHIpI1hdyccbWNCeM4u/APYvwgx72fsVs26huuebJ44iVZr9YRP
	 wYG9UOfOQ63dQ==
Date: Sun, 14 Jun 2026 18:57:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v4 1/6] dt-bindings: iio: add Open Sensor Fusion
 device
Message-ID: <20260614185742.3cc7bdd9@jic23-huawei>
In-Reply-To: <20260607234343.22109-2-kimjinseob88@gmail.com>
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
	<20260607234343.22109-2-kimjinseob88@gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:kimjinseob88@gmail.com,m:linux-iio@vger.kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andriy.shevchenko@intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92329-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,linux.dev:server fail,vger.kernel.org:server fail,jic23-huawei:server fail,devicetree.org:server fail];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email,vger.kernel.org:from_smtp,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D85BA681D45

On Mon,  8 Jun 2026 08:43:38 +0900
Jinseob Kim <kimjinseob88@gmail.com> wrote:

> Describe the OSF sensor aggregation hub.
> 
> Use the generic opensensorfusion,osf compatible.
> 
> Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>

This seems to be a patch against an earlier version of your series.
Make sure this applies directly on the upstream kernel (release or rc1
typically depending on which is most recent).

Jonathan

> ---
>  .../iio/imu/opensensorfusion,osf-green.yaml   | 43 -------------------
>  .../bindings/iio/opensensorfusion,osf.yaml    | 43 +++++++++++++++++++
>  MAINTAINERS                                   | 27 ++++++------
>  3 files changed, 57 insertions(+), 56 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
>  create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml b/Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
> deleted file mode 100644
> index 626b41fb0..000000000
> --- a/Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/iio/imu/opensensorfusion,osf-green.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
As above. There shouldn't be anything to remove!

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 56181470d..e227b9aff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19977,19 +19977,6 @@ F:	Documentation/networking/oa-tc6-framework.rst
>  F:	drivers/net/ethernet/oa_tc6.c
>  F:	include/linux/oa_tc6.h
>  
> -OPEN SENSOR FUSION IIO DRIVER
> -M:	Jinseob Kim <kimjinseob88@gmail.com>
> -S:	Maintained
> -F:	Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
> -F:	Documentation/iio/open-sensor-fusion-protocol-v0.rst
> -F:	drivers/iio/opensensorfusion/Kconfig
> -F:	drivers/iio/opensensorfusion/Makefile
> -F:	drivers/iio/opensensorfusion/osf_core.*
> -F:	drivers/iio/opensensorfusion/osf_iio.*
> -F:	drivers/iio/opensensorfusion/osf_protocol.*
> -F:	drivers/iio/opensensorfusion/osf_serdev.c
> -F:	drivers/iio/opensensorfusion/osf_stream.*
> -
>  OPEN FIRMWARE AND FLATTENED DEVICE TREE
>  M:	Rob Herring <robh@kernel.org>
>  M:	Saravana Kannan <saravanak@kernel.org>
> @@ -20024,6 +20011,20 @@ F:	Documentation/devicetree/
>  F:	arch/*/boot/dts/
>  F:	include/dt-bindings/
>  
> +OPEN SENSOR FUSION IIO DRIVER
> +M:	Jinseob Kim <kimjinseob88@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> +F:	Documentation/iio/open-sensor-fusion-protocol-v0.rst
> +F:	drivers/iio/opensensorfusion/Kconfig
> +F:	drivers/iio/opensensorfusion/Makefile
> +F:	drivers/iio/opensensorfusion/osf_core.*
> +F:	drivers/iio/opensensorfusion/osf_iio.*
> +F:	drivers/iio/opensensorfusion/osf_protocol.*
> +F:	drivers/iio/opensensorfusion/osf_serdev.c
> +F:	drivers/iio/opensensorfusion/osf_stream.*
> +
One blank line.

> +
>  OPENCOMPUTE PTP CLOCK DRIVER
>  M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
>  L:	netdev@vger.kernel.org


