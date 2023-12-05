Return-Path: <linux-doc+bounces-4050-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF25805009
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 11:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E0F11F21498
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 10:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2014D13D;
	Tue,  5 Dec 2023 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IC90/i/a"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177D31A1;
	Tue,  5 Dec 2023 02:15:06 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5CD0FF80F;
	Tue,  5 Dec 2023 10:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701771305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=56obyiQINpp8qp99k/anDIat4PLYEo9bc6Sx/F9dwMM=;
	b=IC90/i/aj3xV0sCBcJjjXH1B1xlq5KA4l5YAXssJ1PqT3ecv5q3st0Lx+dh+U52plJgymw
	5XZGg8RiMuQtY++M6kl45xTR8ILX8BYIKNgZfUscRh2B0PtXGAh0EDPTCCnOwD8SsNB8yD
	TKVpzNIFPVQm1exU0cs+BBiyXdbBACD7B4vVJ1ewMUq/KGd4UUkgjIem+OhKfkjKAwZqLI
	McTfkvmVCQcu7o4kNm8fPvQAY6CIBoFlDyZbu03eq/VuNmSsth1rkd4rdC9XcKha0QjE9q
	oECfswlDMJW7XhrHe+c5Wj1Ni2d4OZ2PhDOTKTSmCkICKLXQ3uyJosWjnbMa3w==
Date: Tue, 5 Dec 2023 11:15:01 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Luis Chamberlain
 <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, Dent Project <dentproject@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH net-next v2 7/8] dt-bindings: net: pse-pd: Add bindings
 for PD692x0 PSE controller
Message-ID: <20231205111501.43f80846@kmaincent-XPS-13-7390>
In-Reply-To: <20231205063606.GI981228@pengutronix.de>
References: <20231201-feature_poe-v2-0-56d8cac607fa@bootlin.com>
	<20231201-feature_poe-v2-7-56d8cac607fa@bootlin.com>
	<20231204230845.GH981228@pengutronix.de>
	<20231205063606.GI981228@pengutronix.de>
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
X-GND-Sasl: kory.maincent@bootlin.com

On Tue, 5 Dec 2023 07:36:06 +0100
Oleksij Rempel <o.rempel@pengutronix.de> wrote:

> > > +examples:
> > > +  - |
> > > +    i2c {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        ethernet-pse@3c {
> > > +          compatible =3D "microchip,pd69200";
> > > +          reg =3D <0x3c>;
> > > +          #pse-cells =3D <1>;
> > > +          ports-matrix =3D <0 2 5
> > > +                          1 3 6
> > > +                          2 0 0xff
> > > +                          3 1 0xff>; =20
> >=20
> > Hm... this will probably not scale.  PSE is kind of PMIC for ethernet. I
> > has bunch of regulators which can be grouped to one more powerful
> > regulator. Since it is regulators, we will wont to represent them in a
> > system as regulators too. We will probably have physical, board
> > specific limitation, so we will need to describe regulator limits for
> > each separate channel. =20
>=20
> After diving a bit deeper to the chip manual and communication protocol
> manual I would recommend to recreate system topology as good as possible
> in the devicetree. The reason is that we actually able to communicate
> with with "manager" behind the "controller" and the "port-matrix" is all
> about the "managers" and physical ports layout.

Ok, but the "managers communication" implementation will be added later as
for now only the basics of the the PSE controller is implemented.

> Typical system architecture looks like this:
>=20
> SoC   --- i2c/uart --> controller -- spi --> manager0 -- phys_port0 -->
> log_port0 (PoE4) |           \- phys_port1 -/
> 					 |	     \- phys_port2 -->
> log_port1 (PoE2) |	     \- phys_port3 --> log_port2 (PoE2)
>                                          \- manager1 -- phys_port0 ..
> 					....
>=20
> Please include some ASCII topology to the documentation :)

Ok.=20

> I would expect a devicetree like this:
>=20
>         ethernet-pse@3c {
> 	  // controller compatible should be precise
>           compatible =3D "microchip,pd69210";
>           reg =3D <0x3c>;
>           #pse-cells =3D <1>;
>          =20
> 	  managers {
> 	    manager@0 {
> 	      // manager compatible should be included, since we are
> 	      // able to campare it with communication results
> 	      compatible =3D "microchip,pd69208t4"
> 	      // addressing corresponding to the chip select addressing
> 	      reg =3D <0>;
>=20
> 	      physical-ports {
> 	        phys0: port@0 {
> 		  // each of physical ports is actually a regulator
> 		  reg =3D <0>;
> 		};
> 	        phys1: port@1 {
> 		  reg =3D <1>;
> 		};
> 	        phys2: port@2 {
> 		  reg =3D <2>;
> 		};
>=20
>                ...
> 	      }
>=20
>           // port matrix can be calculated by using this information
>           logical-ports {
> 	    log_port0: port@0 {
> 	      // PoE4 port
> 	      physical-ports =3D <&phys0, &phys1>;
> 	    };
> 	    log_port1: port@1 {
> 	      // PoE2 port
> 	      physical-ports =3D <&phys2>;
> 	    };
> 	  };
>=20
> ....
>    ethernet-phy@1 {
>      reg =3D <1>;
>      pses =3D <&log_port0>;
>    }
>    ethernet-phy@2 {
>      reg =3D <2>;
>      pses =3D <&log_port1>;
>    }

The pse node will become massive (more than 140 subnodes) but indeed this w=
ill
fit the real topology architecture.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

