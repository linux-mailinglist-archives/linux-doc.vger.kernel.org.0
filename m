Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A1F3BE3C4
	for <lists+linux-doc@lfdr.de>; Wed,  7 Jul 2021 09:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbhGGHnY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Jul 2021 03:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbhGGHnY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Jul 2021 03:43:24 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379F3C061574
        for <linux-doc@vger.kernel.org>; Wed,  7 Jul 2021 00:40:41 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k8so1507880lja.4
        for <linux-doc@vger.kernel.org>; Wed, 07 Jul 2021 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=2jS+Jr9b8OKBIyX32NdISqNkr3OWloJmB3rOqgoGhIw=;
        b=CDmVfD4ybOot8KAlT7bGErknSWRx3PkY25UXmMAzCZ37aKEj0HXnFbWVJxo2y6OqhA
         YJQvDuKiTDp1/gi3jDfdf94AGBe6YUM0b4WCDUiU4oSiJX3ZR9ASMYfagtuZK0DOWGKm
         U2vKUMeXBhzhAWMQcjt4c4q8LOrYSnqOJCdEFJb+eGdKQVF94g6NhadIoCpvi/5Ym4ea
         R7AYTiq4uLWqpgwXVFjpeUWfXnu38AWbDi/qtt9o4D595yaWGwJXsKVeg+xzdHptkVR9
         dbXb/HVdJRIZybLT/k6m7IF/GKtEMVHRcajpSJkvNlq8wdecAFXvvo3F/zjzXvKZPQhA
         Zlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=2jS+Jr9b8OKBIyX32NdISqNkr3OWloJmB3rOqgoGhIw=;
        b=e5TJr+yHu5ImYc2+cQGWsIx+Z1n/JbqeRGIUwOQZZbWCQp5ECP0NoVyKyw5H7WvkBm
         igWs5nAO/Ohnk0eowpHQY6eyZl02Hba0H0G1qPjiYytfh9euTqkRVC9sO/RmX2iXcpfr
         HLbl9zc7R4b5eLuQKckczPpP49ge5SZjkkcUj3ghyER3Dn7h8oNBBlDo2G3nuP0/jGaS
         eE5HObmM8WVBOvTg0QdGEM3p/E8X5iEm/vtNiMpBIDzQ5V9fzJZx/Prsevt8RZuRER5s
         COgrOo+MO2v8JgcbjQxHvyPx6D8gJcYETpCD1G3qGZIiQkmy5m8LRErQ9cy1YU0+cjBc
         FxVw==
X-Gm-Message-State: AOAM531fC8VHOGY/QZT6HRUAZ9Y89bAJ1yNRfNj4OaZID+dqqyHOpN1l
        TS870ASkw2ZmBSquaZLQpQs=
X-Google-Smtp-Source: ABdhPJyPQv/sda2SsBMMSrBXj/aWrkv8RYw05NFw5KE+8p19w2amKpvLujKnK/aOmlvUHYwNiMgHAA==
X-Received: by 2002:a2e:990a:: with SMTP id v10mr14832846lji.337.1625643639438;
        Wed, 07 Jul 2021 00:40:39 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id z11sm327649lfd.90.2021.07.07.00.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 00:40:38 -0700 (PDT)
Date:   Wed, 7 Jul 2021 10:40:27 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Roland Scheidegger <sroland@vmware.com>,
        Sean Paul <sean@poorly.run>, Hyun Kwon <hyun.kwon@xilinx.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-doc@vger.kernel.org, Edmund Dea <edmund.j.dea@intel.com>,
        Eric Anholt <eric@anholt.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Steven Price <steven.price@arm.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen-Yu Tsai <wens@csie.org>, Joel Stanley <joel@jms.id.au>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Chen Feng <puck.chen@hisilicon.com>,
        Alison Wang <alison.wang@nxp.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Huang Rui <ray.huang@amd.com>, Marek Vasut <marex@denx.de>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Russell King <linux@armlinux.org.uk>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Qiang Yu <yuq825@gmail.com>,
        Jyri Sarha <jyri.sarha@iki.fi>
Subject: Re: [PATCH v4] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210707104027.00d71abe@eldfell>
In-Reply-To: <20210706164241.ghd56546murmwnit@gilmour>
References: <20210616143842.632829-1-maxime@cerno.tech>
        <20210617112036.7373fdab@eldfell>
        <20210706085202.6o4fapfmq7osj5wf@gilmour>
        <20210706123723.6194abc5@eldfell>
        <20210706164241.ghd56546murmwnit@gilmour>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q22lv/4vTAmYozlFte/Yu=C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/Q22lv/4vTAmYozlFte/Yu=C
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 6 Jul 2021 18:42:41 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> On Tue, Jul 06, 2021 at 12:37:23PM +0300, Pekka Paalanen wrote:
> > > > > +- It must provide a generic helper in the core code to register =
that
> > > > > +  property on the object it attaches to.
> > > > > +
> > > > > +- Its content must be decoded by the core and provided in the ob=
ject's
> > > > > +  associated state structure. That includes anything drivers mig=
ht want to
> > > > > +  precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>=
` for planes.
> > > > > +
> > > > > +- An IGT test must be submitted where reasonable.   =20
> > > >=20
> > > > Would it be too much to replace "where reasonable" with "if it is at
> > > > all possible to write a test."?
> > > >    =20
> > > > > +   =20
> > > >=20
> > > > How about adding the following somewhere?
> > > >=20
> > > > - The initial state of the property (set during driver initializati=
on)
> > > >   must match how the driver+hardware behaved before introducing this
> > > >   property. It may be some fixed value or it may be inherited from =
e.g.
> > > >   the firmware that booted the system. How the initial state is
> > > >   determined must also be documented, that is, where does it come f=
rom.
> > > >=20
> > > > The initial state must not be called "default", because I want to
> > > > reserve the term default for something else if possible: the phrase
> > > > "reset everything to defaults", which is a whole another discussion=
.   =20
> > >=20
> > > I've taken into account your previous comments, thanks
> > >  =20
> > > > How about also saying that fbcon/fbdev must set this property when
> > > > taking over? That sounds to be like a common omission leading to fu=
nky
> > > > KMS state in fbcon. The value fbdev sets it to only needs to make
> > > > sense to fbdev, and it does not need to be ~~the initial value~~ no=
r the
> > > > default value. Or are we hoping to kill fbcon in favor of a userspa=
ce
> > > > kmscon soon? ;-)
> > > >=20
> > > > Ooh, maybe the KMS property documentation should also say what value
> > > > fbdev will set the property to. That's kind of UABI, because usersp=
ace
> > > > probably implicitly relies on it in many cases. ...which means fbdev
> > > > should set the property to its initial value, otherwise userspace w=
ill
> > > > break.   =20
> > >=20
> > > I'm not sure about this one: fbdev and fbcon are still optional featu=
res
> > > of the kernel and can be disabled at the user discretion. Having any
> > > part of the user-space rely on the fbdev behavior seems a bit broken,
> > > especially when we have a mechanism to retrieve the state when the
> > > application starts. =20
> >=20
> > yes, exactly that is why fbdev/fbcon should reset the properties to
> > their initial values. You would not want userspace inheriting a
> > different KMS state with vs. without fbcon when it starts. =20
>=20
> I'm not sure I'm following you when fbdev/fbcon should reset these
> properties. When a master takes over?

Hi,

when fbcon/fbdev takes over. If it doesn't reset things like GAMMA
LUT, it's possible it won't be readable even though nothing fails.

(Let's say you fumble with an xrandr incantation and manage to set a
LUT that turns everything into a single shade of green or something.
How do you recover?)

When a userspace KMS client hands off to another userspace KMS client,
fbcon/fbdev should not do anything. If it did, that would cause extra
flicker.

I'm assuming fbcon/fbdev already implement all the necessary
mechanisms, but they just don't poke at all the KMS properties
necessary, as is evident from e.g. Michel D=C3=A4nzer's testing seeing wrong
colors in fbcon after a userspace KMS client changed GAMMA or DEGAMMA
once.

Handling this properly would offer an escape hatch without reboot when
something goes wrong in a display server. It's not a fix for userspace
KMS client handing off to another userspace KMS client, for that we
need something else.

> If we consider fbdev as any KMS client, isn't it a fundamental change
> with how it's currently done? I haven't seen anywhere that a compositor
> (or any client for that matter) should put the KMS device in the same
> state that it started it with. In case of a crash it would be fairly
> difficult to achieve.

It has long been agreed IMO but never implemented anywhere AFAIK that a
userspace KMS client should fully reset the whole KMS state to the KMS
state it started with when it *comes back* after being switched away. I
have talked with Daniel Vetter about this several times over the years.
The problem with resetting the full KMS state is what to do with those
KMS properties the KMS client does not understand but are exposed by the
driver.

When a userspace KMS client switches out or quits, what is implemented
and what should be implemented differs again. I believe that KMS
clients of today do not change anything, so that the number of modesets
is minimized. This is sufficient if the KMS client didn't use any less
commonly used KMS properties. It's also consistent with crash behaviour.

If the KMS client wants to support seamless hand-off to another KMS
client, the practical approach is "reset everything to the sane KMS
state except keep the video mode" so that if the next KMS client
doesn't understand everything, it still works. I don't know if display
servers care to implement this, or do they just assume switching to
another instance of themselves in which case they know what the next
KMS client does. Or maybe the don't even use KMS properties others
don't use too.

Btw. Xorg understands very few KMS properties by itself I think. It
just exposes everything via RandR and assumes that whatever X11 clients
are running, some of them will take care of the KMS properties. So one
cannot look at Xorg as a single entity, one also needs to look at all
the different desktop environments and whatever.

Another idea that has come up is that userspace should invent a KMS
hand-off protocol completely in userspace. I'm not aware of anyone
working on that. It would allow better smooth KMS hand-off between KMS
clients, as the current and the next KMS client could negotiate about
which KMS properties they understand and which need to be reset
abruptly.

In any case, consensus seems to be that when a KMS client switches back
in, there are no guarantees at all about the KMS state it inherits at
that point. Therefore fbcon as a KMS client needs to reset everything.
People just don't seem to care about fbcon working that much.

There is also the assumption that when a KMS client starts, the KMS
state it inherits is... "reasonable". This should be true if the KMS
state is the initial state chosen by a driver, and also if the state
has been touched by fbcon, because it's not uncommon for fbcon to
be up before the first KMS userspace client starts. But after the first
KMS userspace client has started, all bets are practically off for the
next KMS client starting.

> > Retrieving the current KMS state is useless if the current KMS state is
> > somehow wonky and the application does not understand that specific KMS
> > property that is wonky. It cannot set the property to any value other
> > than it already had without user intervention. =20
>=20
> Yeah, that's true. But the same could be said if you switch from one
> client to the other for example, at the moment there's no guarantee that
> the first one didn't change a property to a value you don't expect in
> the second. Unless we manage to tie that somehow to a first open of the
> device?

As I wrote above, yes, this is an open problem. Fbcon being just a KMS
client needs a solution like all KMS clients. None of it is a
regression per se, unless you see adding new KMS properties that
provoke this problem more as a regression.

The idea I've been pondering about is a flag in atomic commit: instead
of basing the changes on the current KMS state, start with "the default
KMS state".

The definition of the default KMS state is tricky, because it should
not depend on e.g. firmware. So it is not the same as the initial KMS
state programmed in driver initialization. It needs to be defined
separately and individually for each KMS property. In my opinion, the
default KMS state should be defined as everything being off (planes,
crtcs), disabled (dithering, HDR), pass-through/identity (GAMMA,
DEGAMMA, CTM), "auto" where that applies and is the initial state, and
so on. The goal is to make it as neutral and as "off" as possible while
still giving good chances of letting the simpler KMS clients work
correctly.

If there was a mechanism for this "reset to default", fbdev could just
hit it.

There have been opinions that this problem does not need solving,
because an average Linux user will never switch between arbitrary KMS
clients. At most, they switch from bootsplash to a login manager, and
then to a desktop compositor. Bootsplash won't change "advanced" KMS
state, and the login manager's display server acts as the resetting
entity as it is maintained to explicitly(?) support all the different
desktops. If a desktop uses a new KMS property, the login manager is
updated(?) to reset that property.

Hence I didn't go all the way suggesting in the rules that the default
state needs to be defined.

And if fbcon is good to leave rotting, then no need to mention that
either.

> > I'd say fbcon causing all KMS state to be reset is a quality of life
> > thing. It's possible to live without by rebooting, but it would
> > certainly make at least developers' and testers' life easier until we
> > get the real "reset KMS" knob (which fbcon could then use too).
> >=20
> > Besides, even if it is broken for userspace to rely on the KMS state
> > set by fbcon/fbdev, userspace is already doing that and not on purpose
> > because new KMS properties get added in the kernel. I would bet that
> > there is not a single userspace program that would actually set all KMS
> > properties that drivers might expose. So they are depending on
> > inherited KMS state, which could be left by driver initialization, by
> > fbdev/fbcon, or by any other userspace.
> >=20
> > But yeah, this idea is something new, so don't let this discussion
> > delay landing the docs. =20
>=20
> Ack, I've sent a new version

Thank you!
pq

--Sig_/Q22lv/4vTAmYozlFte/Yu=C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDlWmsACgkQI1/ltBGq
qqeGrQ//a3S09RIccuY+aDIXvjOgkW5V2S5KZyvw6YY1NWuPd4KgbPi4HlNCvQhG
UkLhZBV0xZA3/4R3B6jSvYpD3dkIM1uW4AwlcD8QwOehcP0j/na32CIS6CZ7qBm4
2nlhIsB81n8m+8JGMFoFkPsNmhaAEXnZLptcaM83lTsP8ePkxbghpqCbrliB1QdN
/KNVjD4/hlKvrRQ9i4JlE7sDf89TpwlXBOQVnIz0dpeBGNEKS1rlVr1imLMXeY4x
Fhbz9I/WkruR8ZYviQMgf63l+uoTmf1xgvE4/yye+B6oIExCJ0EdSyevyWtHkBYj
Ubs6QezHzrgNZIzCBOU1AAjO7h+VuF6YRW2QNFweVYQZz228ujk6zTll/EIQIjmI
vfAt2LucE5dXEnSFDwphJm87yk0h9DlPr6KfPrtKULsk7k6ge9tQyLnVbDtLBuMr
gpTVYlhsXm/Lu57Z2NNepqzcuVksl5JYdyQnkwzSUAlwjIyrng2bcC4cu3Xn+cSD
dhQ+oH4YqIZSi1905yRJUT6GWW50rvKed0euDx6P/pV6i66VhI+5Rw8UGLzxVVdS
HGYcLRhlUAofAzMask+BkOm+v+0WP3c7w5IQhYUHC5mJAYsCRa6i9r8bx7lWu9jf
1+DTFHWz2PRTYAtUj3rg5JiMRH+Y5Xu78SxPN0BlzhvlJHFJRuU=
=w8KW
-----END PGP SIGNATURE-----

--Sig_/Q22lv/4vTAmYozlFte/Yu=C--
