Return-Path: <linux-doc+bounces-983-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 533957D53D0
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 16:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1642B20F36
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 14:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2512E2C85C;
	Tue, 24 Oct 2023 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ls48EsEM"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D60FBFB;
	Tue, 24 Oct 2023 14:21:54 +0000 (UTC)
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE7EB6;
	Tue, 24 Oct 2023 07:21:53 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-457cb7f53afso1739134137.3;
        Tue, 24 Oct 2023 07:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698157312; x=1698762112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AM3VQlVHWtuvahhyiClhILx1R0OrNBnU/X/2IXCfrYs=;
        b=ls48EsEMy1c8FePn//GL3tYrj78Hh/ijd8X9Sif/9p40zdbgQOcgY0bz8cpSsPBC70
         Iuc9X2aq40lO2NkEOHY5mJT5fG3SeunaobL4tGSKPIULLEijaCHmFUbsa7O9lPezpOjy
         5gHChkwi28xHccuwUypDHz2h0Rpsf+1Ahxh8sJqbAk/tHkW1HMeCO24xOsdpr+7Gj8sw
         d9/rgH9g0t1/RQENjH9KnB8S+3I/OKv/fzdqsVthfAhRyIipr62QepVaeGQ9NBhZfe6c
         BOuiEtkJkk1eXHGX8/9YPpMSvBa9hQ7n8Sw7vVaHOnJKVTvhKTjkOK6E2aFWx1BH5cMO
         Knhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698157312; x=1698762112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AM3VQlVHWtuvahhyiClhILx1R0OrNBnU/X/2IXCfrYs=;
        b=TYcP+FXWFsv//dXg4xU0LK0JcZQN3TLqTsaLSwDC2Y8K2+9UhQSytZso+AYb84WOes
         FCMz09xD16pWnezBcJQTW/lvJ3txyV7mtlOrsZYINYQ5Ecw4qQg4OhT6F9FgFT8FSYPU
         MuiI68TIAx2hNgkCihXUmAy+BgYYLhcz/frPToXnS01PkW9JXKIJaUjjzBlcx3qaeHJn
         zc3B2MG2Zbs+LUIYQC/8cD1GmgHu0P7+Nl7Q019EBX9rpFHG/iO4ZG46tMVEjFGLJsWC
         xdAYKY0HKxFA/69KpEd5tlO34Ns+k5mAijgkxFLQCqh/FzTdHToXzGQBeKe+rYk5DmsG
         h7XA==
X-Gm-Message-State: AOJu0YzJ8Wxnrd7JOrgehFxVg2g9K2ShEiU6WEDfOVoS44rm8Lz1vpR/
	qYd3bxd6QsmsMHFS6DFG+pXf4u85pWxjRRjHME4=
X-Google-Smtp-Source: AGHT+IFYEeyvkUjneMKD8oSOQEaL2dS8evoHtXBbEz0EBN99vN9ZQDb4/ksFw4kT8cjWaFCUFkxB0bjW60CpMzl9M2g=
X-Received: by 2002:a05:6102:23d1:b0:452:5d45:6345 with SMTP id
 x17-20020a05610223d100b004525d456345mr12294330vsr.34.1698157312490; Tue, 24
 Oct 2023 07:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231019-feature_ptp_netnext-v6-0-71affc27b0e5@bootlin.com>
 <20231019-feature_ptp_netnext-v6-7-71affc27b0e5@bootlin.com>
 <CAF=yD-+O6QxuYJzijMes7J_DHHd7yYCz8sBLFERM1U6pYN0Gkg@mail.gmail.com> <20231024154037.2f61fe5b@kmaincent-XPS-13-7390>
In-Reply-To: <20231024154037.2f61fe5b@kmaincent-XPS-13-7390>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 24 Oct 2023 10:21:15 -0400
Message-ID: <CAF=yD-LCNGcCMqpAbV1HfyVdjH7Gj-_tTwsS=08Y5CC6bqBd=w@mail.gmail.com>
Subject: Re: [PATCH net-next v6 07/16] net_tstamp: Add TIMESTAMPING SOFTWARE
 and HARDWARE mask
To: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Radu Pirea <radu-nicolae.pirea@oss.nxp.com>, 
	Jay Vosburgh <j.vosburgh@gmail.com>, Andy Gospodarek <andy@greyhouse.net>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	UNGLinuxDriver@microchip.com, Simon Horman <horms@kernel.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 9:40=E2=80=AFAM K=C3=B6ry Maincent <kory.maincent@b=
ootlin.com> wrote:
>
> On Thu, 19 Oct 2023 10:48:04 -0400
> Willem de Bruijn <willemdebruijn.kernel@gmail.com> wrote:
>
> > On Thu, Oct 19, 2023 at 10:29=E2=80=AFAM Kory Maincent
> > <kory.maincent@bootlin.com> wrote:
> > >
> > > Timestamping software or hardware flags are often used as a group,
> > > therefore adding these masks will easier future use.
> >
> > This assumes that device support for timestamping is often symmetric:
> > a device supports both rx and tx, or neither.
> >
> > All devices support software receive timestamping, as that timestamp
> > is taken in the core network stack. But to support transmit timestamps
> > drivers have to call sbk_tstamp_tx in their ndo_start_xmit.
>
> Yes, and in that software only case they often call ethtool_op_get_ts_inf=
o to
> fill the timestamp info.
>
> There is several drivers that support hardware and software timestamp, th=
ese
> mask could be useful for these. In case of asymmetric support we can stil=
l use
> the SOF_TIMESTAMPING_RX/TX_SOFTWARE flags.
>
> I forgot to specify, in the commit message but this patch is mainly to ea=
se
> the next patch of this series to deal with software/hardware time stampin=
g.
> Maybe you prefer to have this squash into next patch as had suggested Flo=
rian
> in last version.

Thanks. I did not see such use in net/ or in my experience of using
setsockopt SO_TIMESTAMPING.

But I had not considered net device get_ts_info. It would be useful there.

Slight preference from me to keep this a separate patch, as it applies
not only to the use case in your follow-on patch.

