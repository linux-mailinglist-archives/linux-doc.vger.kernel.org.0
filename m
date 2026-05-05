Return-Path: <linux-doc+bounces-85849-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMDyDsrA+WlADAMAu9opvQ
	(envelope-from <linux-doc+bounces-85849-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 12:04:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0F14CA66C
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 12:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D1AB30A1057
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 09:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C190833BBBA;
	Tue,  5 May 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyjhw2Ld"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCDD3358D6
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974882; cv=none; b=oOZ9aIaI98icmQf8ue/49CKbRqO+okIlHFnfryzdiYsAN4Bf69ys42jBXOEJOw9/tDwLHGqEar/ICvDM4aOC3YAWWiqJ3vKw59GLvyciIke//guM1LT8R9bUkYbVtdjYsuD18I/IEWygeddRYjAdgtfAwLfHfKMW1sRNiymlP+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974882; c=relaxed/simple;
	bh=PxaH7JEkFGR4j8g8WfN53Ub/nYRVGDBMMmwqa0ku9Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wkoc3vh+SxkL/dIcQUy8dFROim7JkOt0h+++cQKOb2s/rU6b0Q585claxZcBJc4C+iOA8Xtqifhv81BA6mXHJdUbngQEW4AyQh1J97zwJBCbcT8VciLpigXyt18eBmaejsKPi1vHAp02Pvu0+cunHLIOi7JLmV+adx7sbNvvrfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyjhw2Ld; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D7EC2BCFD
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 09:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974882;
	bh=PxaH7JEkFGR4j8g8WfN53Ub/nYRVGDBMMmwqa0ku9Ro=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iyjhw2LdsncUd1w1Gr8k+i+Ps+3e6h+F5hs6sCYhAgbXsbEr+/plWEpJaqyz/FbBs
	 1HCmosWthE/mVgageM08fXD2GUvFqOdVDMjvAHAQ2QOhIP9RBHchcXjDrXgj8dy3PH
	 br2eS8SqFwFJe0hpo+HJ3WTxVxWVCeiEbR0FuLoj0IkwMvKyr2rMo6EDrhN9ZovemP
	 poWZMvVlY+UFVCx8UzuWQfve7XFMLdU79kAHcZ90xTa970ioeO7GozL0H1W43oNGY1
	 HtYKuD/hhX5Ka8QA9bnLnAK+zytKsb575CazAjxo6VdrC4HwZLoQnKLoI1S7cV272O
	 PkH4A1kq5vsVA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40502e63bso5114399e87.0
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 02:54:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/hyMTGBZMEltoGzoZ9CwfQ/GM9qdNHlH5Yy1NIfrSR323YI2B/P6yh6lDm9L+4EQRI7u0juSM9eCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCaAVqqaaASyOZryx8TdN656gSqjfwfbYdVyiRm4Jy5/YjaJyh
	9e8VP/+1CLxkfmIjSnhzqNCWULejJ1aWx9PccxhVHKpdkQjsekAkyBlDhmKA6K7MGuM3iSMA5C/
	/w/w5xkJLUI6kWq+2OVsZ5TlU/epeYtA=
X-Received: by 2002:a05:6512:31cf:b0:5a2:bf50:763d with SMTP id
 2adb3069b0e04-5a8631c8222mr5342230e87.38.1777974881162; Tue, 05 May 2026
 02:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-send-v7-0-b432e00d2db8@gmail.com> <20260429-send-v7-6-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-6-b432e00d2db8@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:54:29 +0200
X-Gmail-Original-Message-ID: <CAD++jL=S6DSOuC-PXFn76SA7e-Lgueu9Z2wuF7icXCVX7MBpJw@mail.gmail.com>
X-Gm-Features: AVHnY4LKgP4azk8C0fxvoRTN_Zgf5-T84OtwL-usSAdLEb83x0Y0BnN24IkSneU
Message-ID: <CAD++jL=S6DSOuC-PXFn76SA7e-Lgueu9Z2wuF7icXCVX7MBpJw@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] ARM: zte: defconfig: Add a zx29 defconfig file
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
X-Rspamd-Queue-Id: BF0F14CA66C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-85849-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

On Wed, Apr 29, 2026 at 9:14=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This enables existing drivers for hardware that is present on this board
> even if it is not present in the DT yet.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

I'm in favor of this, mainly because multi_v7 is pretty useless
for this board, it is absolutely too big to boot on the machine,
the board is odd and need some ARM64 stuff.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

