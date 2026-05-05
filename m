Return-Path: <linux-doc+bounces-85784-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOjaI+VG+Wki7gIAu9opvQ
	(envelope-from <linux-doc+bounces-85784-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 03:24:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E44E14C5BCE
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 03:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F2AB3013D67
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 01:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148E931E82F;
	Tue,  5 May 2026 01:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4s0ajFm"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5354285060;
	Tue,  5 May 2026 01:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777944264; cv=none; b=OPtUcQIyvb3X3VhFT77L2U8fj3uaYIViMDKTUhd6HMqPW/aCPbPCqgdMd+nmDTwDRANfM/Q1hjPxoXUjs7QmCYsG13twq+EgbD6TWnGXXWQE5NQ5gYaL2n4BGCqbMeqr436V25SDMrv5nLF4uhn+pp4lewVbwqxj01OMZpeBjZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777944264; c=relaxed/simple;
	bh=VhJ3FHF5RKDAUojAdgDZ02UW61hTTtF81rfIYV6VApc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bm0hn7FTvss/gaY5Fx2kW1hW37wLdKN9R6eHIkuEN4N1LMwquhKfEhNlfsOT7EEJdyIhFbTnOSu+31O7tGGG5PETqY1FinJYskhdTH5kIKYKjJk6FzptcAbjqpe+FDM1pfuK5OW7f6hGMc2zsF1epdOO46vgXqQjkPvdTimJu74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4s0ajFm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D32C2BCB8;
	Tue,  5 May 2026 01:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777944263;
	bh=VhJ3FHF5RKDAUojAdgDZ02UW61hTTtF81rfIYV6VApc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4s0ajFmMitqcIceQI6aJxoyU4nmimrMlsCCQPAYYXUPGWw5H+Q0/RYsDQGDbnOum
	 V4/kpnQh4MJ+qZC5DMVJ0wiz9DWV2V3eOLOgPXNRBAkRLdBVJkE9P6tKdWd/cuhyW9
	 az5oHzk7Kts0h1fiEdB/RUc5fx3A3WNMh+XETvw8exBOxTpLd2zYUfFcmLEK/F/DzM
	 hv0FnooyPtBiDNOH9KyMeCYgj1xWjuEV5rr3ZepOxWkbyry+cYWwUSLz6Ui8VtKyr7
	 P/Kt3Ge/Y6VhB2oiGEmY7QYkrh9i/Zvb6EXfbrt50tm3FP5SSqEUPHNKGcQppudkDQ
	 yLZumDq4uEe+w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 360E11AC586C; Tue, 05 May 2026 02:24:21 +0100 (BST)
Date: Tue, 5 May 2026 10:24:21 +0900
From: Mark Brown <broonie@kernel.org>
To: Vishwaroop A <va@nvidia.com>
Cc: linux-spi@vger.kernel.org, smangipudi@nvidia.com, jonathanh@nvidia.com,
	thierry.reding@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] spi: add new_device/delete_device sysfs interface
Message-ID: <aflGxdXEq51Cp_vK@sirena.co.uk>
References: <20260504074037.704833-1-va@nvidia.com>
 <20260504074037.704833-2-va@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TYcGYA8EPnenytE3"
Content-Disposition: inline
In-Reply-To: <20260504074037.704833-2-va@nvidia.com>
X-Cookie: Alex Haley was adopted!
X-Rspamd-Queue-Id: E44E14C5BCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-85784-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,nvidia.com,gmail.com,lwn.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]


--TYcGYA8EPnenytE3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2026 at 07:40:36AM +0000, Vishwaroop A wrote:
> Development boards such as the Jetson AGX Orin expose SPI buses
> on expansion headers (e.g. the 40-pin header) so that users can
> connect and interact with SPI peripherals from userspace. The
> standard way to get /dev/spidevB.C character device nodes for
> this purpose is to register spi_device instances backed by the
> spidev driver.

> +static ssize_t
> +new_device_store(struct device *dev, struct device_attribute *attr,
> +		 const char *buf, size_t count)
> +{

> +	mutex_lock(&ctlr->add_lock);
> +	status = __spi_add_device(spi, NULL);

This takes add_lock in a sysfs operation but spi_unregister_controller()
also does that while it's calling device_del on the controller's device
which will result in the sysfs files for the controller being deleted.
That'll deadlock...

--TYcGYA8EPnenytE3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn5RsQACgkQJNaLcl1U
h9AOBgf/SOBC70qYUJhv6l7Bj1ZhqpjaTCoI4+Mu+X/VoNpDOZeeaB6FOAGBDcV0
UikrKAhFnUqUOzQu9sgUTYoTAP/RguRcBl6XmporILAY5z3RU7mvTJ6l5Vp1Iw7G
DdSM8ZWK62Izm4CiRMFprYSptsFTOwXas8Hzz3iS6nRUZ9QklEILOAtJZpbtm2UU
sWSfITvf9nadX+5jpDt7xrwolhTLkYBr57ghGjQbziJUdIexzxyrfQPzTdbeDTX+
nCVYe5z/XEzyMFMWuTS/vxwbpmUFG8LYQ4BqnuhUzxSEfmLHr4jaSDfsfOSIMvg+
kURFzi/eFeg2Q06VNhYR0ZNmL+2wkg==
=8l1B
-----END PGP SIGNATURE-----

--TYcGYA8EPnenytE3--

