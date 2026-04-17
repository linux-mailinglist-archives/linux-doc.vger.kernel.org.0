Return-Path: <linux-doc+bounces-83716-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCp6Fu334Wn50AAAu9opvQ
	(envelope-from <linux-doc+bounces-83716-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 11:05:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0004190DE
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 11:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DB7331EBB8A
	for <lists+linux-doc@lfdr.de>; Fri, 17 Apr 2026 09:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0563B27DF;
	Fri, 17 Apr 2026 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="JS/UeliM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WaSxT0Xq"
X-Original-To: linux-doc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1933A9615;
	Fri, 17 Apr 2026 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776416402; cv=none; b=opugV/lpwcVGU1i7e4ud1Kp1a6iYQqSRCVQKSVRmQp0kimA7P+dyUnfXpCjzp8vUVEi8GwFtqLSk0Kh8nYOvX1EaE/Jhqfj8/g0YO/PcXwZWLW0xBczcv+cdqnQMmRcsOlEU31SktbZPd+c1xuK5l6OML8M6QPW0NpmKvzu141Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776416402; c=relaxed/simple;
	bh=hshxd87I7o4SSyjp/EHX3u4T0PWayKVK/jIU2zs7yxM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=g3cD2cmEuq+3GGj0Qb406NXkZT1C7Sr54T+HDCVd5pzGinT5CFHTpjolIFFJuLI04FBHGUbNbBvHtGHMblxAiCqmE75Hs3zcMz1vUveccpV0hU3VuQspRtEgp4e/kyEb1YVXocP9wVujvrlBqGC92EI0ukTTpbqM5KPmQYJWs+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=JS/UeliM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WaSxT0Xq; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 9D3DE1D001E3;
	Fri, 17 Apr 2026 04:59:58 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 17 Apr 2026 04:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776416398;
	 x=1776502798; bh=UUvDMgT2JDILnPFp/rQMG5xa0/FbaPkssLGIWBPbYgo=; b=
	JS/UeliMctoAoIjBE3RhNUS3edBlWLZsyGRgrONFKmz/CiVVFMhHNtetfjM6JtYQ
	vhFE5tdjK6uy+zuwU2ldiI2TlC18ZZ2YZLLNoJXI6zYYalxRAVDM6HW395y87Q/7
	Z1+QaKK3TyTsy7wq1vzXIGQBct7+ddSpDmH7EY5xfyxY/EM+MlqAcwaDNnnK104I
	H8e5gK1lbaSN9/AtAogtApuHRZsCPUEbWWOn5L3j3UBP1BwK4nc8OK43a1iDW8xE
	5wZNs8Ayo/84JGwpCUxJjcTOg7lYQOoXiQbSg6ZVNSDQ76sMI/UXv4v+tSmuMpIZ
	uOBsqxQ3NsYY+gSbaH79cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776416398; x=
	1776502798; bh=UUvDMgT2JDILnPFp/rQMG5xa0/FbaPkssLGIWBPbYgo=; b=W
	aSxT0XqmNdL6YS4/HeSJP2lsDApkXf0O9c9SWzPy8SFX8ZhYhTmisvLzDa0MuAJ2
	7BrehUxkn7QsZTwGuhl/upRnMcM1UAWrVkvI7LYFJS7ImyG9wHlXkET/m53wU0D3
	w03IvFqGs6GlgwRv9/BqT453wti6jJIcNrtCysHJmiIYr/0vmFOyEquKD1a62oSc
	tGhyIZd49KLpeSTvYuk8YQp737LnM6FujUyMG5UVPvuZEqiVugDCDnzfRfz14HiS
	11DN5i/IoZTW9PHHqOcmJ8yb+3W/ZFP5HBRKl4DiWsYaNIeqGr9jWybv6aNzRUek
	EU0bgjIorrZ1l0HPF/Hfg==
X-ME-Sender: <xms:jfbhaVCKzv6Y5_tboWvdprRfSdNQOWe4XLA7ZKJagNGj88goJ1BCPQ>
    <xme:jfbhaeWXg8sJufOIzqIVXDXeu0gK5r2qqDylP8NBILdyki6WdieNCo7Zvi9XKJnla
    C5hyto0XjpqfpjHIR9It9u_IpqRGicpVy0ZzLliu9Vi79O125Tk4DI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegleegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghp
    thhtohepshhtvghfrghnughovghsihhnghgvrhesghhmrghilhdrtghomhdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhushhtihhn
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhirhhishhlrggshieskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsfieskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jfbhaZkiRndjPCwU6sql-kOX10LyujavQxQBoN4M6zLknn8cqvafOA>
    <xmx:jfbhaTMbcbJ58fLah-LqrDOHtB4mfjWZqP9VFCwxbPoEjLUNh71LCg>
    <xmx:jfbhabofCGG5zweFeXghmctJU7-N5LHnIIR6i8bI2NG8mg3lhLoa1Q>
    <xmx:jfbhacs0yuhPrjhyheW8S6qyVgAWvGv4Ym_2dYXv7pkkkmN5CH0_zg>
    <xmx:jvbhaTPSJ6wafZHNswkUf5Vf0rZBdqmkwoEVH7znV98AIPrNVgrTg05d>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C1056700065; Fri, 17 Apr 2026 04:59:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AkOrUqlAGQ43
Date: Fri, 17 Apr 2026 10:59:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Russell King" <linux@armlinux.org.uk>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>, "Drew Fustini" <fustini@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 soc@lists.linux.dev, linux-serial@vger.kernel.org
Message-Id: <0d80dcbe-cb46-45e5-821a-de5299d6a663@app.fastmail.com>
In-Reply-To: <20260416-send-v4-7-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
 <20260416-send-v4-7-e19d02b944ec@gmail.com>
Subject: Re: [PATCH v4 7/8] ARM: dts: Declare UART1 on zx297520v3 boards
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-83716-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lwn.net,linuxfoundation.org,armlinux.org.uk,kernel.org,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,messagingengine.com:dkim,0.21.124.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:dkim]
X-Rspamd-Queue-Id: AC0004190DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026, at 22:19, Stefan D=C3=B6singer wrote:
>
> The reason why I add the serial1=3Duart1 alias is to keep console=3Dtt=
yAMA1
> stable regardless of the other enabled UARTs. UART0, as the name
> implies, has a lower MMIO address, but uart1 is the one that usually h=
as
> the boot output and console.

I'm not sure I'm following here. You generally want to either make
sure the alias matches whatever number is printed on the product
if there are multiple numbered ports, or you just use 'serial0'
as the only alias if there is only one port.

> +	aliases {
> +		serial1 =3D &uart1;
> +	};

Either way, the alias should go into the board specific file, not
the general SoC file, as a board might be using a different
set of UARTs.

> +
> +		/* The UART clock defaults to 26 mhz. It will be replaced when the =
zx29 clock
> +		 * framework is added.
> +		 */
> +		uartclk: uartclk: clock-26000000 {
> +			#clock-cells =3D <0>;
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <26000000>;
> +		};
> +
> +		uart1: serial@1408000 {
> +			compatible =3D "arm,pl011", "arm,primecell";
> +			arm,primecell-periphid =3D <0x001feffe>;
> +			reg =3D <0x01408000 0x1000>;
> +			interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&uartclk>;
> +			clock-names =3D "apb_pclk";
> +		};

Since you know the addresses of the other uart instances, I would
suggest you add all of them at the same time.

       Arnd

