Return-Path: <linux-doc+bounces-92397-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TpCHNRAKMGpDMQUAu9opvQ
	(envelope-from <linux-doc+bounces-92397-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 16:20:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A7C6870D7
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 16:19:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=T4ffCKJX;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92397-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92397-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F2173300530B
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 14:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8692C3FA5D5;
	Mon, 15 Jun 2026 14:18:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141DB3FA5CE
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 14:18:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533130; cv=none; b=JOuF6CVa8zRGbEoen/PAn7Fpy3QfS5VQkgBJ8cLhQWTyC0bOUErQQq4SuFDmy7tj0PsY+Ym/QeblQkorTXXsQqebMqFiw8xGNaS6DRJkQeQ1LPt9Lq2wgHavrc2CHlhHZg+xDvI9kGZeVwWiC26tT/eD3syPObjgEC0arGGYRCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533130; c=relaxed/simple;
	bh=taTuI/uTOMXjIXPXu667WK4H5vUawgRfjbE0mglsoXM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzNB2zzX09SC0iySxEh0RGaNIy5aMwHdd6zMZ1Zc352uobi9Qc2Ha5K+26wbFB0dX4sOYRaOgiA7wbcKmFIujIut/xS9TbeYmV6aF5iPh4owJxxpD9vCHO+OwWgSc4LdZlSectPEUZ6T9bdwjrIVVvbzy1NbqcVf66j3hWVvL5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4ffCKJX; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490c1915793so30222595e9.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533123; x=1782137923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hkIb+b4xA4Dtv3ljZrlwMo9RpQWTNWYQCjFJM6rj18U=;
        b=T4ffCKJXecs/GEA3jL3SD9gnWfr2vZCj6s+uKJMMshsFFDI+ko8XEr6+TbrR8m3i5w
         YV/D8ZbqmYPpF8gP4XFZ50gbvntssElJc3kN83H/4Vs7DK0Srnk9CzW+6MVRfPz4Kbzq
         avGNXPh8FXrGXCoRwi/vCEP/+kSUUrwkwejWyKqyhvKfrVeLm4xGZL5jUwRvDBfbIZYk
         tL5CaCze5IdjLR9/VmmIpv1mzMGGg7wbZk7Vpam05Y5OlPp//KEFH+BsI7Af/xf+sxf0
         2AhsWkNBEkbr17ObfDRHyZMX7Ynul1uB5Z6S5jQGFmPApFw+qbZYV1xjjLABhsHL53qp
         Ltpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533123; x=1782137923;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkIb+b4xA4Dtv3ljZrlwMo9RpQWTNWYQCjFJM6rj18U=;
        b=ZeRojct/F6CGSFs0byzIr9uTQaB3wHwFZ7QpQmvYXkIP4M+ZGBksIFDalebVcYRPQg
         BxhwkSFiT4hHC+nxCrPecEupMAbbEI8yYmQhEoKwOzeKpG7KxSgIUwo2jAwXD5/6J2cd
         WWU+JP8xqEOEBCBq5zBPHn3yIJVupSlUXRMzDMEnmcyM6L9gHRULj4La4yXJGrm37ztw
         jbBNiShRq9Cgc/dtGtXqX0McIDq96Z0UsvyJhwAokLYuQPG4D1hyBQ6Q/1jekLJBj/4l
         Iuc2/1qVQUg84YLoOBfwx4JwUBNSsHk1uJGSIUqZsRvF+XJGhXhr278bBay0HfiiJGjA
         yTgg==
X-Forwarded-Encrypted: i=1; AFNElJ85RWuQQ2qTZ4SkI6EalB4iOQhw52Lo4mcwv+tIe5PDMoW4CbjJx+holCC7FRad8/0q3jCvj1VLRAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxR4SVfUh/3IkQvaPLIhrBWWeLIjLm3HjhiITfdxqS3erQkgEa
	DmvBhz/1yyeexzTGLTqEgXNExa9jG02i/44VDiyrNFW9qewcyYKDTKN/
X-Gm-Gg: Acq92OHRK/UQluDDvld205b7od8ncJHivzouBqyzeuTetqWK23jQCQx7nqV197jLgNr
	HMpc1gW1tcIn6byUcZSKJTAJOk24qVdzmcUPS917lVfWPVfNIGk5i9mnH+c0vLB1VVAxh55iS5O
	EK4igdVWb4+Iq9J7J7BYm3urLPzEYIHNCuxhSogYly7CM4cXJZIoF5xet7Br765X/3BPkhoqFa/
	PAkOMn3/0/fyReCkwa9PfQCtbqqZuRMI9tVlM5uV+aIg88MnJoKKxC4G+4/oOIXVSFRQecav39x
	jBwupH7Euj/IUKPx3ktS/Y9/SOr7V/lefKHoV9IaNatCo/l8yIJ0atTrqvq6TlwncDm6QIIC5sy
	MnWWtQ+d3s8rW9BsyGt7+AYsh+Xd6jb5PuEA8Tdpi/NPpBfr/G58QJIDJKRv3Ca5CUlFupNKxCf
	tx3BXq6LNx3d0uajV4w1+4F6aDvwpav8m8qCxlovXKBUH+rRbo514BCg==
X-Received: by 2002:a05:600c:3153:b0:490:e5c1:b897 with SMTP id 5b1f17b1804b1-490ec4fe7c2mr195111285e9.20.1781533122746;
        Mon, 15 Jun 2026 07:18:42 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edec6sm283566035e9.3.2026.06.15.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:18:42 -0700 (PDT)
Message-ID: <6a3009c2.561280e1.2acd9f.2f06@mx.google.com>
X-Google-Original-Message-ID: <ajAJvXT9R7UrMqQA@Ansuel-XPS.>
Date: Mon, 15 Jun 2026 16:18:37 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v7 01/12] net: phylink: keep and use MAC
 supported_interfaces in phylink struct
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
 <20260615122950.22281-2-ansuelsmth@gmail.com>
 <371a1df7-084c-4431-bd00-0045298e3212@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <371a1df7-084c-4431-bd00-0045298e3212@bootlin.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92397-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:horms@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:lorenzo@kernel.org,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:p.zabel@pengutronix.de,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:llvm@lists.linux.dev,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ansuelsmth@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,lwn.net,linuxfoundation.org,gmail.com,armlinux.org.uk,pengutronix.de,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ansuelsmth@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev,dt,lkml];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mx.google.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6A7C6870D7

On Mon, Jun 15, 2026 at 03:33:34PM +0200, Maxime Chevallier wrote:
> Hello Christian,
> 
> On 6/15/26 14:29, Christian Marangi wrote:
> > Add in phylink struct a copy of supported_interfaces from phylink_config
> > and make use of that instead of relying on phylink_config value.
> > 
> > This in preparation for support of PCS handling internally to phylink
> > where a PCS can be removed or added after the phylink is created and we
> > need both a reference of the supported_interfaces value from
> > phylink_config and an internal value that can be updated with the new
> > PCS info.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/phy/phylink.c | 22 +++++++++++++++-------
> >  1 file changed, 15 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index 087ac63f9193..4d59c0dd78db 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -60,6 +60,11 @@ struct phylink {
> >  	/* The link configuration settings */
> >  	struct phylink_link_state link_config;
> >  
> > +	/* What interface are supported by the current link.
> > +	 * Can change on removal or addition of new PCS.
> > +	 */
> > +	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
> 
> Can you clarify a bit what you mean here ? Is that the combination of the
> interfaces the MAC supports AND the currently in-use PCS ?
> 

Combination of interface the MAC supports and the currently attached PCS
(not the current one in use)

The fact that it can change is due to the fact that PCS can be attached
later and supported_interfaces can be updated accordingly.

-- 
	Ansuel

