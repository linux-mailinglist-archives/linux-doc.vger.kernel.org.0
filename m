Return-Path: <linux-doc+bounces-27545-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4637699E36B
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 12:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FA6BB21C0E
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 10:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A381E3763;
	Tue, 15 Oct 2024 10:08:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693271DE4FB
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 10:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728986883; cv=none; b=Fbu7b+oM0a6rYJ/HceawE07hchVv/y8U8NdmC5t7gx0MiexngrK27CIwp2asdkgqm7JGlxKV2yyKlwOYC9OT9UJZS05G9TYgJIKVtFh3jQoqps03Ee7K2/1dmMsPAUDjz8R5ZcM8rkJJfCHwWZjQau+loUECBbKlHb19vMR9Ac0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728986883; c=relaxed/simple;
	bh=K2NbxgybNusi+SAnYvjfO09UJfWncABnQUFIl1zosII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWYI84MPWhJIxQbXNNeedPNSe547/TzXj4ZHvAwvXn25J0brw6zEgD8yuK61yWFZOwAbxYxu8wwmfA/nOwXZ43e2AfxfB9oQ0fdW1GFgeG3XQBiRXf5fmCKnoZNd1HWUsB1qg/JW6WmW1WocPsQDWinDAsXOk1Fd9Ub8YITHtJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t0eSx-0002FM-Fu; Tue, 15 Oct 2024 12:07:47 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1t0eSw-0020R2-PI; Tue, 15 Oct 2024 12:07:46 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 6A3BB3531D8;
	Tue, 15 Oct 2024 10:07:46 +0000 (UTC)
Date: Tue, 15 Oct 2024 12:07:46 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 0/5] v8: firmware: imx: driver for NXP secure-enclave
Message-ID: <20241015-eminent-fat-muskrat-de8bbd-mkl@pengutronix.de>
References: <20241015-imx-se-if-v8-0-915438e267d3@nxp.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fwx5wstgqxbiqtx4"
Content-Disposition: inline
In-Reply-To: <20241015-imx-se-if-v8-0-915438e267d3@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org


--fwx5wstgqxbiqtx4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Pankaj Gupta,

please install "sparse", compile your driver with "C=3D1" and fix the
following warnings:

| drivers/firmware/imx/se_ctrl.c:347:63: warning: incorrect type in argumen=
t 2 (different address spaces)
| drivers/firmware/imx/se_ctrl.c:347:63:    expected void [noderef] __iomem=
 *addr
| drivers/firmware/imx/se_ctrl.c:347:63:    got unsigned char [usertype] *p=
tr
| drivers/firmware/imx/se_ctrl.c:379:58: warning: incorrect type in argumen=
t 1 (different address spaces)
| drivers/firmware/imx/se_ctrl.c:379:58:    expected void [noderef] __user =
*to
| drivers/firmware/imx/se_ctrl.c:379:58:    got unsigned char [usertype] *u=
sr_buf_ptr
| drivers/firmware/imx/se_ctrl.c:570:52: warning: incorrect type in argumen=
t 2 (different address spaces)
| drivers/firmware/imx/se_ctrl.c:570:52:    expected void const [noderef] _=
_user *from
| drivers/firmware/imx/se_ctrl.c:570:52:    got unsigned char [usertype] *
| drivers/firmware/imx/se_ctrl.c:595:50: warning: incorrect type in argumen=
t 1 (different address spaces)
| drivers/firmware/imx/se_ctrl.c:595:50:    expected void const [noderef] _=
_user *
| drivers/firmware/imx/se_ctrl.c:595:50:    got unsigned int [usertype] *[a=
ddressable] tx_buf
| drivers/firmware/imx/se_ctrl.c:642:46: warning: incorrect type in argumen=
t 1 (different address spaces)
| drivers/firmware/imx/se_ctrl.c:642:46:    expected void [noderef] __user =
*to
| drivers/firmware/imx/se_ctrl.c:642:46:    got unsigned int [usertype] *[a=
ddressable] rx_buf
| drivers/firmware/imx/se_ctrl.c:653:27: warning: incorrect type in argumen=
t 1 (different address spaces)
| drivers/firmware/imx/se_ctrl.c:653:27:    expected void [noderef] __user =
*to
| drivers/firmware/imx/se_ctrl.c:653:27:    got void *
| drivers/firmware/imx/se_ctrl.c:689:27: warning: incorrect type in argumen=
t 1 (different address spaces)
| drivers/firmware/imx/se_ctrl.c:689:27:    expected void [noderef] __user =
*to
| drivers/firmware/imx/se_ctrl.c:689:27:    got unsigned char [usertype] *
| drivers/firmware/imx/se_ctrl.c:713:34: warning: incorrect type in argumen=
t 2 (different address spaces)
| drivers/firmware/imx/se_ctrl.c:713:34:    expected void const [noderef] _=
_user *from
| drivers/firmware/imx/se_ctrl.c:713:34:    got unsigned char [usertype] *
| drivers/firmware/imx/se_ctrl.c:762:61: warning: incorrect type in argumen=
t 2 (different address spaces)
| drivers/firmware/imx/se_ctrl.c:762:61:    expected void const [noderef] _=
_user *from
| drivers/firmware/imx/se_ctrl.c:762:61:    got unsigned char [usertype] *[=
addressable] [assigned] user_buf
| drivers/firmware/imx/se_ctrl.c:782:27: warning: incorrect type in argumen=
t 1 (different address spaces)
| drivers/firmware/imx/se_ctrl.c:782:27:    expected void [noderef] __user =
*to
| drivers/firmware/imx/se_ctrl.c:782:27:    got unsigned char [usertype] *
| drivers/firmware/imx/se_ctrl.c:808:34: warning: incorrect type in argumen=
t 1 (different address spaces)
| drivers/firmware/imx/se_ctrl.c:808:34:    expected void [noderef] __user =
*to
| drivers/firmware/imx/se_ctrl.c:808:34:    got unsigned char [usertype] *

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--fwx5wstgqxbiqtx4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcOPu8ACgkQKDiiPnot
vG8zJwf/dU27FkKIisB5y+xIMvwJ5ep9HHPy45zI6E01BL/3owRzXNIKhz1d7XxR
0kOjPYbIn2lTte6EXh+sBssMHpm6dI+kYNE329IzC/9q5JA7aBjxrvvT8JxzW14R
hiti08klJ/sfLfndL2D1L0/HdqZVm5i13M+VrCzaBvfcSu17Wo0DP4IBprPziUjs
4TMy4+4zp8E5dfTLkX6e+4W++/melV6CqI6EwsF2Y30mI0TXP40Ba/mHWFU6uNkm
doD6097Yr85TNTwGmtS84qxSHVvk8UVoLrfQzTuKeb4VXHXGsr/FsJFD0K5dMvfW
TpxF94cuajycIGXRZwCFokff6vRetw==
=9+AC
-----END PGP SIGNATURE-----

--fwx5wstgqxbiqtx4--

