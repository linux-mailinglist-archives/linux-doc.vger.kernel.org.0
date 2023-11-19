Return-Path: <linux-doc+bounces-2608-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 733257F0406
	for <lists+linux-doc@lfdr.de>; Sun, 19 Nov 2023 03:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07449280E1B
	for <lists+linux-doc@lfdr.de>; Sun, 19 Nov 2023 02:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F705ED5;
	Sun, 19 Nov 2023 02:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/BNYQnM"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6E2EA0;
	Sun, 19 Nov 2023 02:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2378DC433C8;
	Sun, 19 Nov 2023 02:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700360712;
	bh=POWSirjZ6zTCT6jiTYaz4Ladza7MojwlK1oOFCZP/Bk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C/BNYQnMTD9rublX+rGu5ulgy+9lBQj5hfurEmJWDqti4AGA2ddaF9cgPy7PXsZub
	 sqjWgdnGAVJZtErIACW1aXKjWsh1jF0M0nerrILzDjB0OETE2Mst67kFwnihYGUbnD
	 c3EkfQDPxAx6H/ebviLI/l63FUrYl1VXq3GeOfl5eGZ51ESnIeUI4hwuQ17vjFvpYT
	 gtgdwpkCxkEm9B/qy853kkxiXVeTDUuIM6MCa1IO/XYb7jKW/e1q927bHPQWleP+/q
	 lrP4MmqxsdUxlYdwY2rAxLZPzpfwbtGHhbfDzJ/q783ByXLflB6We+SAEFzeLbCeqd
	 c74gH/5oCIXLA==
Date: Sat, 18 Nov 2023 18:25:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Richard
 Cochran <richardcochran@gmail.com>, Radu Pirea
 <radu-nicolae.pirea@oss.nxp.com>, Jay Vosburgh <j.vosburgh@gmail.com>, Andy
 Gospodarek <andy@greyhouse.net>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Horatiu Vultur <horatiu.vultur@microchip.com>,
 UNGLinuxDriver@microchip.com, Simon Horman <horms@kernel.org>, Vladimir
 Oltean <vladimir.oltean@nxp.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Maxime Chevallier
 <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v7 09/16] netlink: specs: Introduce new netlink
 command to get current timestamp
Message-ID: <20231118182510.42c436c8@kernel.org>
In-Reply-To: <20231114-feature_ptp_netnext-v7-9-472e77951e40@bootlin.com>
References: <20231114-feature_ptp_netnext-v7-0-472e77951e40@bootlin.com>
	<20231114-feature_ptp_netnext-v7-9-472e77951e40@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Nov 2023 12:28:37 +0100 Kory Maincent wrote:
> +  -
> +    name: ts
> +    attributes:
> +      -
> +        name: header
> +        type: nest
> +        nested-attributes: header
> +      -
> +        name: ts-layer
> +        type: u32

Please add the definition of the enum to the spec,
and link it here, so that Python can convert the values
to names.

