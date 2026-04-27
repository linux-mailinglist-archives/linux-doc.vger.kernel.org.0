Return-Path: <linux-doc+bounces-84677-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XMu7BzsH72nd4AAAu9opvQ
	(envelope-from <linux-doc+bounces-84677-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 08:50:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA81C46DD71
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 08:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40CC23006B60
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 06:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DF2386C12;
	Mon, 27 Apr 2026 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCkc95Sx"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B66371063;
	Mon, 27 Apr 2026 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777272631; cv=none; b=V72JbV/AYBvo8j7x/9QzHBLB37B8K9nwd3Xr4YQFwFuvel0jq+hENLovHB9UpAKHjzbTrv9zTbaIiQ3zB2NWtM7UH2Xv69JGN2JZ0kDCFvcNeIBxWPZZaOWb0HcHxazNg2e59hSQ8olTp6Zifdnh7Vh7nU629kk7kQe5eiJC5Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777272631; c=relaxed/simple;
	bh=Dla8YPisQpFUiP5CnszIEM85dQreW5Y1H3GYNrZPlik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YanTu6oaL+9MWQYQEP3xkiGFF2URIOht0hfYi4o4ELu12FeseC7qjqxVOjGw+t8BYm+SauhDXGCYeUdqSZkE/gbiO7ehgW75zC7Bc10w6ZdqC1R7gW/nYQli2RaO91G5baNklUDfGlUwsIbyyY7KODg/oC4aEPyRmea5clKGFnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCkc95Sx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F754C19425;
	Mon, 27 Apr 2026 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272631;
	bh=Dla8YPisQpFUiP5CnszIEM85dQreW5Y1H3GYNrZPlik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GCkc95Sx9kdNbmFV/rzdEM1yffrI/VxN+1rAlBSULk+BxBPjpu/hzOR3B+aUJODsu
	 7imrTdTNeRDqM6lfzTHSjlStp8XLPrL6jHCsPXwQgzEhgPv9Vf6qrby0yZ5dYY85uj
	 tLM8W1PyeDVLeX3ZDZD6qFlEBKY6W9FHX1cHZLJlNhNQAr8qBPweYZIek8zsbbiqZW
	 xjap0l0S7bYTm3PAoM06R+QU6tnd1A1uCf5oV58uLycNDBcW3v4tRfXsdWUPM8yApS
	 MSe/MY5WRjcZrVdGgJ6kn6oKGeQ6XtEb7VMWNHI5ZQPGIty77U4nxCM9BaO+vtIzl3
	 u42tUzPkTRBog==
Date: Mon, 27 Apr 2026 08:50:27 +0200
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
Subject: Re: [PATCH v6 1/6] dt-bindings: arm: zte: Add D-Link DWR932M board
 based on zx297520v3 SoC
Message-ID: <20260427-neat-quoll-of-current-fed19c@quoll>
References: <20260426-send-v6-0-d49efa72bb09@gmail.com>
 <20260426-send-v6-1-d49efa72bb09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260426-send-v6-1-d49efa72bb09@gmail.com>
X-Rspamd-Queue-Id: AA81C46DD71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84677-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

On Sun, Apr 26, 2026 at 02:54:14PM +0300, Stefan D=C3=B6singer wrote:
> This adds a new binding file for ZTE, containing their zx297520v3 SoC
> and one board (D-Link DWR-932M) based on it.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


