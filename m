Return-Path: <linux-doc+bounces-85848-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJYmLw3A+WlADAMAu9opvQ
	(envelope-from <linux-doc+bounces-85848-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 12:01:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8324CA559
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 12:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F223315505B
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 09:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13AD3E121F;
	Tue,  5 May 2026 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFkqNMfK"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E1433FE2F
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974806; cv=none; b=sh52mYXt5YFavitFQdlndDfiVPjM5Bs27kZMLCsYRmE6GOTB7gxfV+QllZZk1Q4rNgtrjCIwDJlJwwItysnXlj5J9DPZgrfaC1JZgjZdKu1aHawszeWY0USZT/FrIJD7899oB/3oKtqZsYdaNg9+wHWqfOKAog/E1bwX2qC16s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974806; c=relaxed/simple;
	bh=saiAoSq0Gjw4nVSv3lJIbi7mZbCEiUFubkklHZ6p6UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgvyMP5jPfPnAyBaUq+HeFvWQCxLyMCilmAmWNeZZFWrqvv3jI/XPf9BT+BW7Iq7tEJm8KmtVsYrCoO2yRe4JXvqmQpb61t8xUmNM3VLig0mzjJ+jUv+VL4whb9jOapqGqK5sFHkAUxl73oHKjhkbCZtnUQmcbCOlsgbC19Xoz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFkqNMfK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97073C2BCC7
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974806;
	bh=saiAoSq0Gjw4nVSv3lJIbi7mZbCEiUFubkklHZ6p6UU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tFkqNMfKJt7Q7XONP/ZHfpv5V9+vnr/gtXNIn3ijNpCHDU1BoQiALetWJSt+PmgoS
	 BBlwwgPBnV78TtaJ+qqsAWJKwy04QPBJA7QgkL/YCiCCJmhmXsUMSvQROJgCTk9K72
	 LYLjeDL1f2ZcOtEecI6GzZ8O6zCTjFBwRHGdvn2D9E4/oieDtY8CGp2nuukUFWHL+R
	 Rjumx4xYqOtsQgaslMgTG4/ycuwRE3YzrV0FqhDjssIDQ72Weuuu02Y+IG7diGD6l4
	 SlDWqIxoESZZKTuqqpnwzyEzXhczNwyfeuSBgznwvsv2LGbvIddoalPj75rgpWWe2T
	 0tvUDQj+4WKlw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39378db197aso32027751fa.3
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 02:53:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/e0GfL62YOwMO27ZQ/Y8qv2BVD7i0kg9SUh847/jhXbaSQVmn8acs54PNOKzIrRYYAJLWfCISCmtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YylBbDVmL1wUf5lARLG6xb7vzdnB4zfFozHwk+5bRTd6wOaXhvb
	uZlxhxpa8eY54YVqjHWTcrcMd/Y0Ev/mVBa+dq/DQBf6n0J9g7zenWdmszjB9ewC52F3Ouzly/t
	AcZo9O6pCj47+dZOqSk5uq20dOipp1EM=
X-Received: by 2002:a2e:be8e:0:b0:38e:a8ef:b61 with SMTP id
 38308e7fff4ca-3937857c3bamr54490251fa.29.1777974805235; Tue, 05 May 2026
 02:53:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-send-v7-0-b432e00d2db8@gmail.com> <20260429-send-v7-5-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-5-b432e00d2db8@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:53:12 +0200
X-Gmail-Original-Message-ID: <CAD++jL=PzwbKFvLDX_b-UvQtd83qfb+Kaeg1Oibo5mzRaFjR3Q@mail.gmail.com>
X-Gm-Features: AVHnY4KMDuCZ2LITDqNfqa9EPfYGc-qnLM8XOIgJiicE6urZJdWk9Rb4jm-mXt0
Message-ID: <CAD++jL=PzwbKFvLDX_b-UvQtd83qfb+Kaeg1Oibo5mzRaFjR3Q@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] ARM: dts: zte: Add D-Link DWR-932M support
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, soc@lists.linux.dev, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3A8324CA559
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-85848-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 9:14=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This adds base DT definition for zx297520v3 and one board that consumes i=
t.
>
> The stock kernel does not use the armv7 timer, but it seems to work
> fine. The board has other board-specific timers that would need a driver
> and I see no reason to bother with them since the arm standard timer
> works.
>
> The caveat is the non-standard GIC setup needed to handle the timer's
> level-low PPI. This is the responsibility of the boot loader and
> documented in Documentation/arch/arm/zte/zx297520v3.rst.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

