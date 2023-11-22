Return-Path: <linux-doc+bounces-2904-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBFF7F4C01
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 17:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E59C1C209AD
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 16:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E0F1CAB3;
	Wed, 22 Nov 2023 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QyYObT/q"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1F7A1;
	Wed, 22 Nov 2023 08:11:16 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B70DE0007;
	Wed, 22 Nov 2023 16:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700669475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKOV/Z/369p+Ig5Wi5vZTAl5YNXFdkGpmq3M44EHZwA=;
	b=QyYObT/qeq6FL+xnl+X+3ZYqxKx/6fswUDTCYEAXqwCu+5zig5Aps5cUGkdtWViVXH5SGW
	ExhYuOBKORylGz2SoHQrfPZrDpWM6hABUjGZmF7OjN02Cu+CVk2XDQeiikJSAR7WNAGLPd
	/fzB4ZzcFEqyGHEKmI6clLg/1s5mPMOZGx5YOrnrJh4bVwZUGhhSx8Mv9DBgnhMugfDjnc
	YuCEu60HF8YbAnG1MTH0u+moLMwpw8aq1r4FDue3BqpP2SFM1XbOTj95JGL3L33mcMelJv
	WhQWj5TzN6/ThTU9bCiCTPK5fBpjm5YnbnKR++1Iqj1oRAwtG2Gh+NSokbneZg==
Date: Wed, 22 Nov 2023 17:11:12 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Luis Chamberlain
 <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 9/9] net: pse-pd: Add PD692x0 PSE controller
 driver
Message-ID: <20231122171112.59370d21@kmaincent-XPS-13-7390>
In-Reply-To: <2ff8bea5-5972-4d1a-a692-34ad27b05446@lunn.ch>
References: <20231116-feature_poe-v1-0-be48044bf249@bootlin.com>
	<20231116-feature_poe-v1-9-be48044bf249@bootlin.com>
	<2ff8bea5-5972-4d1a-a692-34ad27b05446@lunn.ch>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: kory.maincent@bootlin.com

Thanks for your reviews!

On Thu, 16 Nov 2023 23:54:02 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> I'm reading this patch first, so this might be a dumb question...
>=20
> > +static int pd692x0_recv_msg(struct pd692x0_priv *priv,
> > +			    struct pd692x0_msg *msg,
> > +			    struct pd692x0_msg_content *buf)
> > +{ =20
>=20
> ...
>=20
> > +	i2c_master_recv(client, (u8 *)buf, sizeof(*buf));
> > +	if (buf->key)
> > +		goto out;
> > +
> > +	msleep(10000); =20
>=20
> That is 10 seconds, right?

Yes, it is in the communication loss procedure.

>=20
> > +static int pd692x0_sendrecv_msg(struct pd692x0_priv *priv,
> > +				struct pd692x0_msg *msg,
> > +				struct pd692x0_msg_content *buf)
> > +{
> > +	struct device *dev =3D &priv->client->dev;
> > +	int ret;
> > +
> > +	ret =3D pd692x0_send_msg(priv, msg);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D pd692x0_recv_msg(priv, msg, buf); =20
>=20
> So this function takes at least 10 seconds?

No, on normal communication it takes a bit more than 30ms.
It could be more if there are communication loss, even reset the controller.
See the communication loss procedure in "PD692x0 BT Serial Communication
Protocol User Guide" for details.

> > +static int pd692x0_ethtool_set_config(struct pse_controller_dev *pcdev,
> > +				      unsigned long id,
> > +				      struct netlink_ext_ack *extack,
> > +				      const struct pse_control_config
> > *config) +{ =20
>=20
> ....
>=20
> > +	switch (config->admin_control) {
> > +	case ETHTOOL_PSE_ADMIN_STATE_ENABLED:
> > +		msg.content.data[0] =3D 0x1;
> > +		break;
> > +	case ETHTOOL_PSE_ADMIN_STATE_DISABLED:
> > +		msg.content.data[0] =3D 0x0;
> > +		break;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	msg.content.sub[2] =3D id;
> > +	ret =3D pd692x0_sendrecv_msg(priv, &msg, &buf); =20
>=20
> So this is also 10 seconds?=20
>=20
> Given its name, it looks like this is called via ethtool? Is the
> ethtool core holding RTNL? It is generally considered bad to hold RTNL for
> that long.

Yes it is holding RTNL lock. Should I consider another behavior in case of
communication loss to not holding RTNL lock so long?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

