Return-Path: <linux-doc+bounces-84127-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFQvD9V06GmVKgIAu9opvQ
	(envelope-from <linux-doc+bounces-84127-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 09:12:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3797F442CC7
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 09:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 807AE301A697
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 07:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEEC36B05E;
	Wed, 22 Apr 2026 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUnwRQJ0"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A71F36923B;
	Wed, 22 Apr 2026 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841830; cv=none; b=d+8BcufsdnSkBlHG6a7mz9Wx6cPyOv19SIgxdFZGc549Ss8DUMyn5z42Tvd59Ice2tj4l9NlFv9F5eJY49KAMF2VCEfjGKamlGoGdgeVliyIYCPX5ePaXp1hHUKQrWEGE9fxOAgycVN5lZA9dWntraYgny0MC8KRsLawoBe6xGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841830; c=relaxed/simple;
	bh=KvmZiFZoDwQVe3uf1Ar4i8FckEwLYLs0mfXSzOsjS88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfIwcQgTMeCmS0sPE6k4Mx3EGzAWsS11hVduEtbBM/q8YP2vWFdNq+yUH+hnDn/Ld1opfdeCUMzOi8PqMAr0SkZuMGf1rpGUAZdE+zCGPYdFU26l9zclUyyKuznRNwJi2sKb6dgYAl2FbE0cZauf9GF25l3zAUxXlTp5IQLNbM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUnwRQJ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78075C19425;
	Wed, 22 Apr 2026 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776841830;
	bh=KvmZiFZoDwQVe3uf1Ar4i8FckEwLYLs0mfXSzOsjS88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUnwRQJ0eXfclcS0MbVxMPh/mtzCH9rqCF9Qa6j1gaL5mh51IZY8ZLV5mRsHSXNSY
	 gP+Un7p66fiRWVywu3gbbJp94KnTdnkNRxhLnhnay5a6ew505gsn2MAyQYV3yeHCL6
	 1SQA+lgc116iQtjJzBPG9UNcfDm+LrdIuRUeKEy7noR9zhGxty1lfDlGt6Z5sHqS5l
	 wXnJhYiZdyFHhM7kkPTeZYY7B8LnlesEefPlwNCOdJeUkPT4x+pkvLkf3Zjovlnk6r
	 4YlA8iXJc55PH+sXDM8YzkDOECVL2S8YtAjGZhQ1TdMyYsaoxDSzlAXFJrbldK/kZ9
	 me8aFI3uywGJQ==
Date: Wed, 22 Apr 2026 09:10:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, soc@lists.linux.dev, 
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 5/8] ARM: dts: Add an armv7 timer for zx297520v3
Message-ID: <20260422-zealous-utopian-dinosaur-ca0d5d@quoll>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
 <20260421-send-v5-5-ace038e63515@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260421-send-v5-5-ace038e63515@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84127-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3797F442CC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 11:23:13PM +0300, Stefan D=C3=B6singer wrote:
> The stock kernel does not use this timer, but it seems to work fine. The
> board has other board-specific timers that would need a driver and I see
> no reason to bother with them since the arm standard timer works.
>=20
> The caveat is the non-standard GIC setup needed to handle the timer's
> level-low PPI. This is the responsibility of the boot loader and
> documented in Documentation/arch/arm/zte/zx297520v3.rst.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> ---
>  arch/arm/boot/dts/zte/zx297520v3.dtsi | 24 ++++++++++++++++++++++++

This must be squashed. You add new SoC - that's one commit. One logical
change. Adding "not working SoC" and then "let's fix it" are not two
separate tasks.

Best regards,
Krzysztof


