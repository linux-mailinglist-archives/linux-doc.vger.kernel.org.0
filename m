Return-Path: <linux-doc+bounces-2715-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0FC7F1D9E
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 20:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5AC01F25969
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 19:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CCD37150;
	Mon, 20 Nov 2023 19:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKNkukmI"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B1337142;
	Mon, 20 Nov 2023 19:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583B4C433C8;
	Mon, 20 Nov 2023 19:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700510321;
	bh=kqOXLzKsdX7CU+BiLbd6l4zUkLWhjs83HEjABTqBCM0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BKNkukmIlBs70y1buJVoLbG9KgdLqmiyiai9AM3sC1n6ybQf+tv3usOOs8CEgfQZO
	 lgSdc/lkoKDZdYxTomFUZNCzWuLZ4+5XgL9lxU2+18+N/avPDB/hMW5OUpWNeqOoNU
	 ACBvNxjZ5hoUuuj1rXup1tKbFRZHay3gn6bpMdQDa05xOB3sPdvMCteutsVQH50joc
	 Vsgxoqr/pSEZZIJsfkt2MiUb5k5v+tUntmuwN6U0to9GDNkjWjTdui/2wB65t+IiYZ
	 a5ps3Z3E9rZdAJenUi5Y421Flyb5YNbxq43UaHsfpWh1uuo/ZFYfVoyFmgIV7yJrCY
	 hH3QWP8K5Mzaw==
Date: Mon, 20 Nov 2023 11:58:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Richard
 Cochran <richardcochran@gmail.com>, Radu Pirea
 <radu-nicolae.pirea@oss.nxp.com>, Jay Vosburgh <j.vosburgh@gmail.com>, Andy
 Gospodarek <andy@greyhouse.net>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Horatiu Vultur <horatiu.vultur@microchip.com>,
 UNGLinuxDriver@microchip.com, Simon Horman <horms@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Maxime Chevallier
 <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v7 15/16] net: ethtool: ts: Let the active time
 stamping layer be selectable
Message-ID: <20231120115839.74ee5492@kernel.org>
In-Reply-To: <20231120190023.ymog4yb2hcydhmua@skbuf>
References: <20231114-feature_ptp_netnext-v7-0-472e77951e40@bootlin.com>
	<20231114-feature_ptp_netnext-v7-15-472e77951e40@bootlin.com>
	<20231118183433.30ca1d1a@kernel.org>
	<20231120104439.15bfdd09@kmaincent-XPS-13-7390>
	<20231120105255.cgbart5amkg4efaz@skbuf>
	<20231120121440.3274d44c@kmaincent-XPS-13-7390>
	<20231120120601.ondrhbkqpnaozl2q@skbuf>
	<20231120144929.3375317e@kmaincent-XPS-13-7390>
	<20231120142316.d2emoaqeej2pg4s3@skbuf>
	<20231120093723.4d88fb2a@kernel.org>
	<20231120190023.ymog4yb2hcydhmua@skbuf>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Nov 2023 21:00:23 +0200 Vladimir Oltean wrote:
> Well, first of all, given my understanding of the "laws of physics",
> I think something has to give in your use case description. I can't
> see how on RX, the NIC can decide in advance whether to provide low
> rate MAC timestamps for packets going to a socket and high rate DMA
> timestamps for packets going to another socket. It can either provide
> MAC timestamps, or DMA timestamps, or an unreliable, unpresentable to
> user space, mix.

Rx time stamping is configured by filters. Is there a problem with user
specifying that they want "true" timestamps for PTP/NTP packets, and
"dma" timestamps for all the rest?

Maybe we can extend struct scm_timestamping to carry an indication
which stamp ended up in ts[2] but that's less important to me than
the ability to configure the thing. Right now, as I said, mlx5 uses
an ethtool priv flag :(

> But maybe I'm wrong and there are NICs which can do that filtering.
> If such NIC exists, then I guess a SOF_TIMESTAMPING_RX_DMA flag should
> be added to the socket layer, and the NIC driver provides timestamps
> according to the skb->sk->sk_tsflags, and that problem is completely out
> of scope for K=C3=B6ry's patch set - and implicitly compatible with it, s=
ince
> as you say, the device-wide timestamping layer - PHC index - does not
> really change.

IDK. Maybe the sniffles I picked up at LPC are clouding my judgment
but to me this patch set is shaped too much by current implementation
and not enough by what it's modeling. It basically exposes to user
space the "mux" for choosing NETDEV vs PHYLIB.

There are multiple time stamping points as the packet moves thru=20
the pipeline. Expose them so that SIOC[GS]HWTSTAMP can target each
on individually.

> If I'm not wrong and the MAC-or-DMA timestamp selection is NIC-wide
> (which diverges from your problem description),

Nope.

> then neither K=C3=B6ry's work
> nor my "everything is a phc_index" proposal will bring your use case to
> fruition without further work. Here I would avoid speculating, because a
> lot will depend upon the details which you haven't really given.

What are the details you'd like? PTP gets stamped at the PHY/MAC,=20
the rest gets stamped at DMA. mlx5 achieves this by splitting the
PTP traffic to a separate queue pair, and configuring that qp to
capture PHY/MAC stamps, AFAIU.

> One question will be whether, in the case of "NIC-wide DMA timestamps",
> DMA timestamps should be presented as hardware timestamps - struct
> scm_timestamping[2] from CMSG_DATA() - or as their own thing, that user
> space needs explicit support for - by parsing a new cmsg level/type.
> If DMA timestamps won't look to user space like hardware timestamps,
> then the use case is again out of scope for K=C3=B6ry's work, as far as I=
 see
> it.
>=20
> Another simple question is - if NICs do this today - probably by giving
> the "unrepresentable mix" to user space in an implicit, hardcoded and
> very fine tuned way such that nobody bats an eye - then what is there
> more to support? Are you looking at extra UAPI as a way to legitimize
> hacks, or do you feel there is extra control that applications can gain?

I don't understand what you're asking me.

DMA timestamping is becoming increasingly important. Ready any
congestion control paper from the last 5 years and chances are
it will be using delay as a signal. If we're extending uAPI
for Hw stamping we should make sure to cater to CC use cases.

