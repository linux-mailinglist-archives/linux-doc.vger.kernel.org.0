Return-Path: <linux-doc+bounces-15550-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9CF8B86FC
	for <lists+linux-doc@lfdr.de>; Wed,  1 May 2024 10:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71E882819E1
	for <lists+linux-doc@lfdr.de>; Wed,  1 May 2024 08:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA824F881;
	Wed,  1 May 2024 08:38:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DE41E4A1
	for <linux-doc@vger.kernel.org>; Wed,  1 May 2024 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714552717; cv=none; b=gWhAn2lnhHZrB1imKXKbpR9M0zvjeEbSqzgsCBflGJ3O4h0dYXrZF9oDvsv3eRKbmJeFoRUBgf9ACWpS4FgH6/xBRDg+rynQASNW4BngylgnGYjyUGpW6/HavzTQ7b4sqtCObydxChww+mXWiiskFpb81wh31T9+uoHAOdFAS8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714552717; c=relaxed/simple;
	bh=S8xB0pu0UGjmJsXA1KVHJVZn/NFuMYiIw0FFzRR2NYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJBjACgkmxS8E4ngGp/Gdgo3IuWmM6bVWPqiknnU2ntbFH5ve1hMpmHAD8mTWQ2OT+0BM1TJdfc+brPko9NnMrj4mZf3a2C6kLuL1K1AZwGl0LMLysFRcaz2UibDuv6EErBP1TLTCaoDTK497qlOzlUJUj07rovt8EaLgfkV3jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1s25Tj-0002df-Cp; Wed, 01 May 2024 10:38:15 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1s25Tf-00FJG0-QC; Wed, 01 May 2024 10:38:11 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1s25Tf-005psV-2I;
	Wed, 01 May 2024 10:38:11 +0200
Date: Wed, 1 May 2024 10:38:11 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	v9fs@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v4 1/3] usb: gadget: function: move u_f.h to
 include/linux/usb/
Message-ID: <ZjH_cx_0uBLc6M6L@pengutronix.de>
References: <20240116-ml-topic-u9p-v4-0-722ed28b0ade@pengutronix.de>
 <20240116-ml-topic-u9p-v4-1-722ed28b0ade@pengutronix.de>
 <1fb801bf-3bef-4f95-8036-fc8634679141@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iCgt8I7LXby3Cgzv"
Content-Disposition: inline
In-Reply-To: <1fb801bf-3bef-4f95-8036-fc8634679141@rowland.harvard.edu>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org


--iCgt8I7LXby3Cgzv
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 09:51:20PM -0400, Alan Stern wrote:
>On Tue, Apr 30, 2024 at 01:33:26AM +0200, Michael Grzeschik wrote:
>> We move the u_f.h header to include/linux/usb to be
>> able to compile function drivers outside of the
>> drivers/usb/gadget/function directory.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>Given that you're moving a private header file to a public location,
>don't you think it should now have a name that's more meaningful to
>general kernel developers than "u_f.h"?

Fair point.

How about func_utils.h instead?

Michael Grzeschik

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--iCgt8I7LXby3Cgzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmYx/3AACgkQC+njFXoe
LGR1TRAAzV4XmkkHXoTc9OOaNH4Ke92oyaSauNaj4rSJG1ry3Or8RcnFdVFJv+H1
P5BgIy+DKSje3YRiW5hNJLkQabuR+U/UvI4UKS580aFX3KtEMIqZf6GQgFswjYkC
KZElxmIYcGAzPfDEGR4ij5H2izz145zll9KJhjArZYvkoR5OjewiNqfZkIS5t0br
xFfjs5olYEP6VGI5HONEJEd9VzIz70x7GbHAOxrQSCrBzffUcI2d57KAOXYlMAw9
xZf4Y+BidBFkmUOxAooZoZRtU0gey9KW/qR8JwO88s9OiX0YHC8obM6AsFLmYHzj
yDMq4hqakZT2YqWy71t2q+hDI47mRv8XX8WwpIcnBIBdOiRJo59fr6HZRjE/3scM
JAQM5IY8Kj/wOEElCGje4JJX0T8+hAE3cIR/K8of3UgVVb8qZ+T09Wz19B+Ym7K4
ruLQYJo+PW50sHQezNl07tFcVta25j3dGROr5FDwuR1BGFq4SqErIHutWDBs4se0
YTMdqhXMoZ5vbSdv5krECuVLFGO1AQ14yBIUsWvFNScNJS9jeFgaA/bzroO4qL/H
u/NTb87GVKoOn5EjvRcLGG2lhuIaoj9yc8WhWQJ+CDyafhifQMJb7lDSQJO6VXdi
co/MNGglLUvFyxf33lddJpUc3DqGcOcDKCzaowVyNlambgrWCpc=
=Pv8D
-----END PGP SIGNATURE-----

--iCgt8I7LXby3Cgzv--

