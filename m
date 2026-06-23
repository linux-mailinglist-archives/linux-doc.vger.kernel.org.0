Return-Path: <linux-doc+bounces-93298-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V9F/BtLVOmrCIAgAu9opvQ
	(envelope-from <linux-doc+bounces-93298-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 20:52:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D86E6B987F
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 20:52:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VKg1qICd;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93298-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-93298-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DEB9530241C0
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 18:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4022359A91;
	Tue, 23 Jun 2026 18:51:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6243446A6
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 18:51:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782240688; cv=pass; b=j+9SYjR/sdqUBTCtcjHR34+i3FWsFq3h5huw7JmbsCeos2JGNy1jq70EQcCoVWNIvkkPF4k0g5BTZnUa9AhhEQ6b/huCKI7Ec92bWC6nszPSrKe84mfmQbQpaD9aGVQvFWZh7YXw+Q/S2BzWAaLiPChKkPhIo+MBLaGFSEi39Ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782240688; c=relaxed/simple;
	bh=Efr1OooVVeTRTisiJfG3vsg/+MXEtgRrVmeiLqYtGck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFDGGZQwzMdG2Wv0I5RG6u125moPguuNZMl0A93cg43fXLrxZE29ToSNviA8IuIs0ckZK5egZJVy5EfEX/7GBzzTbueZBWK7bW6E70JBiKbjrQlGVOCY6Nq3R9xm1cklDPMeE0PvaoB90xSVL3jFFzZisjTg6mPGD1yxCPkdw9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKg1qICd; arc=pass smtp.client-ip=74.125.224.45
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-662b95934dcso144589d50.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 11:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782240686; cv=none;
        d=google.com; s=arc-20240605;
        b=Ukta5QSlPEEiy3YKwPgxMdGnW/7Gwdo5zXeDEyj4tZZEhgzXCOw2DRzWP4TGKjW9WI
         Kw/E+6Hx2pza6/opuAWtn+Uy/mbefRbjLtgGrOKEQ7woKnSvHxppCzNqKZIEHd6q5aDK
         NUXCl+0Vz3sZMsGxlHlnF35TsvsdIndUTIdlGDPz4LxdUGDFBl6vRo9sNZruGbsm72jp
         vo96oLB2trIu3LpHO+KEX9FCK9DUW8oDzyNnkci3Mt9zWbpT0A2mWIaFUkPc7bDjTOp1
         1NNxGodDAtxG6Lq0fxePPJy1QW/uKiVYZoulqSlXL0Xo6TWDFhhm4LihDRVj1VADAv3H
         dxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QGHdQke52quudoElH5DIY+sbZKk9j5FB05lJCBdajHM=;
        fh=ARY5QF24nupzz8ZwQryOnoHFK5EF6G5nWK56w3E6fyA=;
        b=MG81w+QCrttq+DgRHgsG90K0LkYYO9D8zJB0qq9Mxuv2c/TtfmcWIZutwxblE/j4AQ
         ohNwWsbh5XlQuke2WBUDxppa5dUDAIhQHxV2PFqvG30eJmMYTlH9ehoHL/BgYakgNdLF
         zTW1ttHIsHt/Be5WlKI2J09U0Bxavz05FaibxOUKswZm96rPe907+tuo+EULjswiVqrN
         ZptOyvCpARRRT5bPFZ4YfbDE7PekxBPWBVbUIftf5lC6rewkdfJVAddvCYSyZBdPqNVC
         3hA7AMyAoG2okNvzG+yqrNDkrzNHwA2bwLGzGnWy5MLVLdDThQlIIfxVpj/3Va1zEoHo
         GFgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782240686; x=1782845486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGHdQke52quudoElH5DIY+sbZKk9j5FB05lJCBdajHM=;
        b=VKg1qICdpjOxcsGBBOa4HZh/J0a1Gkb0EZzxvAidRzTC9Dgp3FVJETu+voTIFXZxS9
         UYFdLjMqUKDF0mxBrllAHICDgZD+qQSKxnSxU9nkMI+B/Hj3biuRvkqYLxfxBOmEFxsu
         Freiwsq4CyIepsrOIqLrOgA3rbH6vsfofjT1UFSLlkucOdTkw9LaTqURfGeZtbNV+WcJ
         ZCEVFbQktuN1ovYuqx4WIcWMn6WFtRBznePqU8AhkFJtqZ38FY3fPJJGTqE6+8tqtsQD
         TAw/ScKHLKE81rwrUg3cUbxtLBu60RT20g7JqkAs9dZa+SzGX0pB98TwZMYP37yMrdB+
         tcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782240686; x=1782845486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QGHdQke52quudoElH5DIY+sbZKk9j5FB05lJCBdajHM=;
        b=Z+6FtiMafr4UKO4iAGCmVGiBmT5ZzmZeaUFqsS8ZqColiM3Q9IZ84gLMR5LYY87bXu
         esI/lL2GoL8X/0lvpzQNjApY/hhEASbAdVhSph2JhRXqadiwuu2sfKtBTKteOCnPluZr
         FCcDTji6dZQw6+RZqYQ2BefsqbNc9laM74X5mH2x8qEExUGH4YDn3mODcg7uYg1/ljtZ
         a4MVuv4YQjKkAMjE++W1mX4Fj01fiDFQn0eKC6UBTg9CpP+LKU3ZK2El0dVYdS7KBpk8
         pY78zf+0fCxDFkchRT+hbgtFk6R+NbNYEpshpE4r261pMaVTzXo4+prIvtqrDz+PHO0H
         KPpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdVTAo+kibxdhYiCwPTD3615ns4k3lBKXAHrgobzdRdaTeDVhFfhoG+kcQkO9wKy6s4Gwn0p9NcTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCVoRc/+yar6OiwpEpfOXpNUdSepAWNDRGwjH4bxZ3jYMUI6VM
	7y55oLQNfTY0svzdmked+DauWmn7a8CrwRryUTeiSNJf6hLnDzJ8Mz0eEeeiemF/EhtANxxObKA
	cSSYLUiTfMVSGhyzvrVaYOVsJxyez+ZA=
X-Gm-Gg: AfdE7cnzJJVKKdD/D1g4Q3tDZPKz7RUTa5xID/wGuY2VusOUTQelW/fIdMcDeAao9zA
	LKlEuJ6rxPOvtQ07MiCwAvsLrq13Go0KGhnhWgAP397PohepO/kegyw4PWIUYcqh101ABIVkIyW
	GGyoFske9d8PHrbt1OZKzw06gCOk2mplrXxsYO7mgzaX43FKl+1dQ2m++3iXWjPWF/aBHFVcQ1O
	YTeFe2XT18385cKthJBZ9aIuWYTcV82+kynWW5hXrMOwfyMP8Auwn4Ek+qhS21iJf8NDNtqZwTa
	CD3BPPaGPeTvhp14OiFvyqDJwek3FB6Y/qXKN8HQSpyJQhnphCFwARZxY+g=
X-Received: by 2002:a05:690e:e87:b0:662:f2d1:f27 with SMTP id
 956f58d0204a3-66359ece524mr3827196d50.27.1782240686326; Tue, 23 Jun 2026
 11:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622234803.6982-1-ebiggers@kernel.org> <CABBYNZ+QLvkYkn_EcBZ4+GopyhKqJLcfCoABYcw1VamavbSvhg@mail.gmail.com>
 <20260623165208.GB1793@sol> <20260623180502.GC1850517@google.com>
In-Reply-To: <20260623180502.GC1850517@google.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 23 Jun 2026 14:51:13 -0400
X-Gm-Features: AVVi8CfbI5Vx_0h2Ev3jl-1KL9OujVxy8AaPvUK9sScHwsY8ABVyPNIyPnDwcl8
Message-ID: <CABBYNZKdd2-S9C1z0vtUB5yMVTWxLHi+Ta0_aUrahDYAq5rpxg@mail.gmail.com>
Subject: Re: [PATCH] crypto: af_alg - Add af_alg_restrict sysctl, defaulting
 to 1
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, iwd@lists.linux.dev, 
	linux-hardening@vger.kernel.org, Milan Broz <gmazyland@gmail.com>, 
	Demi Marie Obenour <demiobenour@gmail.com>, Andy Lutomirski <luto@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-93298-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gondor.apana.org.au,lists.linux.dev,gmail.com,amacapital.net];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:iwd@lists.linux.dev,m:linux-hardening@vger.kernel.org,m:gmazyland@gmail.com,m:demiobenour@gmail.com,m:luto@amacapital.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[luizdentz@gmail.com,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D86E6B987F

Hi Eric,

On Tue, Jun 23, 2026 at 2:05=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Tue, Jun 23, 2026 at 09:52:08AM -0700, Eric Biggers wrote:
> > On Tue, Jun 23, 2026 at 11:04:14AM -0400, Luiz Augusto von Dentz wrote:
> > > > +=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +0    AF_ALG is unrestricted.
> > > > +
> > > > +1    AF_ALG is supported with a limited list of algorithms. The li=
st
> > > > +     is designed for compatibility with known users such as iwd an=
d
> > > > +     bluez that haven't yet been fixed to use userspace crypto cod=
e.
> > >
> > > Is the expectation that we go shopping for userspace crypto here?
> >
> > Yes, same as what 99% of userspace already does.  Probably you'll just
> > want to link to OpenSSL, but it could be something else if you want.
> >
> > - Eric
>
> By the way you do know that bluez already has a local implementation of
> ECDH, right?  See src/shared/ecc.c.

It's never been audited; it's only used for hardware emulation, I
didn't even remember we had that thingy. What we really use is
src/shared/crypto.c, and I'm not looking forward to having it changed.
With something like Zephyr, changing crypto libraries every so often
just because one didn't fit on a platform wasn't a great experience,
and that is a much bigger project. In the end it seems they are using
a forked mbedtls:

https://github.com/zephyrproject-rtos/mbedtls

I'm quite sure whatever choice we make will be the wrong choice for
someone. Then someone will have the brilliant idea to add some sort of
backend support to let everyone plug in their preferred crypto
library, possibly adding even more code to audit.

> - Eric



--=20
Luiz Augusto von Dentz

