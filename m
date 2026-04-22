Return-Path: <linux-doc+bounces-84126-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGMqDol16GmVKgIAu9opvQ
	(envelope-from <linux-doc+bounces-84126-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 09:15:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B9442D5A
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 09:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99A923004DA7
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 07:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFEC36B044;
	Wed, 22 Apr 2026 07:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocR0RmEA"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6A930E858;
	Wed, 22 Apr 2026 07:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841764; cv=none; b=pOwXhwO4gsgbs79wMlicEnKlDIy7k6+oDY+G8BsnxHyLH4JgddsRyFG2LV0JnxTez1l9KGrQ3EzsHAYw1b8iDhrKleY2+ZH3bl9BYp7NfjoFOGJ3jFHokkC1vaAvWewvJfIGamv3OZnipVWF4X2cX1WEAlqdkYYe5XfBVPF60Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841764; c=relaxed/simple;
	bh=pt6vRwU9dnqGT2fXxn6LaZWHRKbzGK7R13ATw3Np780=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jW1J5dFjTkH4HpXjQ1+TqJziqY4pCs+jYwsJg89vDc4M+3MKtgCzTmfAmItwP8HtrcE01cAjs78ZfHAsqYXwbEEmSrKeeRo9eyU8t4RI4QDhs0f54tzmvtYqC4B5KFsi2MVVm4DQtfUMzy9cX+he7YJfNOVx1eByySc1gUGdqYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocR0RmEA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7702C19425;
	Wed, 22 Apr 2026 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776841764;
	bh=pt6vRwU9dnqGT2fXxn6LaZWHRKbzGK7R13ATw3Np780=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ocR0RmEA2q20N3jyHu6qk8p4XBtc9iuezpQqUOMzKVTW77ueoyRUqObM+GjUJhp7e
	 KSzvIyaDQgM6+mJKf6RUybwYjPy85QbpFMlQOjs15xw4tCX2IgG6MoCfmRqsWBNDjB
	 3DP7cOA/nqsx8Ms3s63ksIi88I+s0DB89E7crl4TBk/mj49GoKrP77LWGWivqQ7h0C
	 OrXvZuQxnBggPK9TamyN1ESSBYMNY4hz7Ey1uTbWl/iyuiKvrIJaLAhUgxc5m739G/
	 uRLzG/7EeJutf6i01pvepoC209B+xQfSnPkKYh7MI2Hp5UbZC2Gpo+iFaH/7oSJx3C
	 p1+OH2TxXZ20w==
Date: Wed, 22 Apr 2026 09:09:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, soc@lists.linux.dev, 
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 3/8] ARM: dts: Add D-Link DWR-932M support
Message-ID: <20260422-white-dugong-of-temperance-09c610@quoll>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
 <20260421-send-v5-3-ace038e63515@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260421-send-v5-3-ace038e63515@gmail.com>
X-Spamd-Result: default: False [5.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84126-lists,linux-doc=lfdr.de];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-doc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.706];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 432B9442D5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 11:23:11PM +0300, Stefan D=C3=B6singer wrote:
> This adds base DT definition for zx297520v3 and one board that consumes i=
t.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

subject - missing zte prefix.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patch=
es.html#i-for-patch-submitters


=2E..

> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a53";
> +			reg =3D <0>;
> +		};
> +	};
> +
> +	soc {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		compatible =3D "simple-bus";
> +		interrupt-parent =3D <&gic>;
> +		ranges;
> +
> +		gic: interrupt-controller@f2000000 {
> +			compatible =3D "arm,gic-v3";
> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			reg =3D <0xf2000000 0x10000>,
> +			      <0xf2040000 0x20000>;
> +		};

This is pretty incomplete DTS. The first submission must have a working,
basic device support which requires at least one interface, e.g. serial.

Otherwise how is this usable?

Best regards,
Krzysztof


