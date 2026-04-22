Return-Path: <linux-doc+bounces-84123-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPlVB6tz6GlCKgIAu9opvQ
	(envelope-from <linux-doc+bounces-84123-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 09:07:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBE3442C15
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 09:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEA79300DF63
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 07:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B15E35F614;
	Wed, 22 Apr 2026 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K64fVnx1"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2473C2C08D0;
	Wed, 22 Apr 2026 07:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841594; cv=none; b=WSMcl29dirEiO1ZR1k37xIs3ZmRr6zOmnZqeVjQD6OQS7E3gNiAaMxu8DVEgjcPwdZekOBs7kR0vPgtFG/yG1+6cO7UpqM37xJjJXriUPRIXI5RlYGcBiQuw+Novl2wCWPTyqLwWmrrVLho8RrDUN/6JkLEUprHBTafYoI8fdmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841594; c=relaxed/simple;
	bh=s/4NNvvbT5+1meXDTAtsXuKvs/oS52CCo22GJtQKNQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZbANAD3Vgsd+Oh+JwwuKAqOHe3RsWCOpwVj2KCcJov0i33doYqn4O2d6RUvdWeixR3XKisQoFz5S9qf6Xr/6eOGZfirbhgzqyuETJLKKyUKi/F4ruocKh3ex2/kMjCW3GLX0n1OaDv4o6x+u3byZVtihkeZoMLuHNpK61rClno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K64fVnx1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722D9C2BCB3;
	Wed, 22 Apr 2026 07:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776841593;
	bh=s/4NNvvbT5+1meXDTAtsXuKvs/oS52CCo22GJtQKNQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K64fVnx16SQRlS4Mz4UJ7/0RCDVkH/6btgMbI7FAh2FQBBjQIUc/OzDaLVpUUm+TA
	 3tw5MUA+1uUN5X4bWep7PIlDZHSL+k4pJWYituxnZAwD4827mfEMsraCHBio9sW3XS
	 dIR9KNbheVIr72lM0z5QzH08K3vwgwenV1vDxru2TT0VU2eG4fuGjlHmB3HAQKxuT7
	 tEfmTQETXL9/EZE07kNovpUQEf1Jy8VXV5YAb+pRyQ8wpqqsMQiry1C5iLTASy5szK
	 JivJ8u0khCIO2nSntYi3XdZZMQ5udZ16c3CkY8AQ5O+y+PwIv02BJm/ihKg7RBL4z3
	 7zbfFXhmzoYyQ==
Date: Wed, 22 Apr 2026 09:06:31 +0200
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
Subject: Re: [PATCH v5 2/8] dt-bindings: arm: Add zx297520v3 board binding
Message-ID: <20260422-majestic-rabbit-of-jest-c4df6c@quoll>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
 <20260421-send-v5-2-ace038e63515@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260421-send-v5-2-ace038e63515@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-84123-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CBE3442C15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 11:23:10PM +0300, Stefan D=C3=B6singer wrote:
> +maintainers:
> +  - Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> +
> +properties:
> +  $nodename:
> +    const: "/"
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - dlink,dwr932m
> +              - hgsd,r310
> +              - tecno,tr118
> +              - zte,k10

Where are users of these bindings? We do not need unused ABI.

Best regards,
Krzysztof


