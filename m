Return-Path: <linux-doc+bounces-84910-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iODZJsJu8GmgTQEAu9opvQ
	(envelope-from <linux-doc+bounces-84910-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 10:24:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C9547FF74
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 10:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 217AB300E3A0
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 08:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1EE3CD8BD;
	Tue, 28 Apr 2026 08:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWhH7r6Z"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786B83C5539
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 08:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364319; cv=none; b=I9u8wR4HtM+LOqIxrmwyipJle+N9yhh1oW7AHmruSd/1H5OTnHPvAvuYZUjVIJvyqHbYx1rpZQbkDCpMBrf5XuYnaSqu8zCxCT6drRmRP2pOklkpwf2h6oLLUIhNFw/50ONTx4U/BiTO014Uz6y1mPLTHYVUOfS/3Jpa34IT5Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364319; c=relaxed/simple;
	bh=rhTVfU0iqqWoXDOvkBlf/jSklc9+eqr7sxlcBfQT9M8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYXLrLSZ9yY60rgnbiLI9xfwAjSQ1OoGyLeYd7j7egVd0s7ESOT9j0zWR6kUAR+Ml44GpayM9kiEx9BbGyWsHfXqodxRFtDClXWbod/Hsw302EryRR3/o5q/dewGnKu+qeiXw5FMZPOrRiOF3iNeWymArARSmZGkrPdWLk6G0MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWhH7r6Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAB6C4AF0B
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 08:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777364319;
	bh=rhTVfU0iqqWoXDOvkBlf/jSklc9+eqr7sxlcBfQT9M8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WWhH7r6ZRUSWECnN00A9lnuE2V4KHXjMyZ4g0wK97LPDRGmHVZQNET24ueovX2+2u
	 1DaBcX6XdRRCj9+iwml0tczkLdQm3D6yNpoVJp5zanuhEabyfUF4sSag6oPjXhJCns
	 dch36Ra5BOlX6Y1FecwewOne8gChNUUlH/EK9XYOHXSvz2JD1LMF9X6R85FBOF8VCS
	 M9oZk0+MPz5DWqdNay6NJNp83WTtTTaZXYmyhI/lkyYP/Nbvo1XF6QyrUQ3ptxOiCx
	 DJqRtjFVMWCyMLcztcMEQhrA6cfpCLoxsDcquWVMN8QvSD6DChdSvP1b1rIyZlAh3n
	 rmI/VTSyYQSLg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e12c67a6fso110696131fa.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 01:18:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9D4B4L7sRPSgOEuXji9UDOY7YkZI5YvPi4Q0FumiSaTEYQVpwkZlxSMNTy26/N82c9xwUmRLPlajk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlxl38U3gG6RWmZvZSW8mLHlASJ1OjMW+rX8WoMOVXtx3jvuF6
	jR2BklmzMm2UQ12S6PeWbch/AV76Ct8aYprH6LAEGlj16LW0yYb0cJq83eGN+UuujD5C/iHkOp8
	ZvX4mF9Nzg0tuzWDOXWyVp1BR7stDrzU6i8R57KQ+RQ==
X-Received: by 2002:a05:6512:124f:b0:5a3:ff48:f7db with SMTP id
 2adb3069b0e04-5a746615ca1mr877554e87.34.1777364318061; Tue, 28 Apr 2026
 01:18:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427135841.96266-1-tzungbi@kernel.org> <CAMRc=MdnrKaEgFZod7DZC2FkigeQW6DogfODwmsZO=LS0Zie+w@mail.gmail.com>
In-Reply-To: <CAMRc=MdnrKaEgFZod7DZC2FkigeQW6DogfODwmsZO=LS0Zie+w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 28 Apr 2026 10:18:25 +0200
X-Gmail-Original-Message-ID: <CAMRc=McXwgujqaZw-S-yzU329fRPmjPDZHvc9aMd9=MeU8mvCw@mail.gmail.com>
X-Gm-Features: AVHnY4JD7aUdC5j3W8xDfoS0kGuriHPxhl3Qt0U8ZbQApFNMnsdkWkk7dojljys
Message-ID: <CAMRc=McXwgujqaZw-S-yzU329fRPmjPDZHvc9aMd9=MeU8mvCw@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] drivers/base: Introduce revocable
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 02C9547FF74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84910-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Tue, Apr 28, 2026 at 10:16=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> > ---
> > v9:
> > - Rebase onto v7.1-rc1.
> > - Remove the selftests patch as it makes less sense to test revocable
> >   APIs via kselftests.
>
> May I suggest kunit for that purpose?
>
> Bart

Nevermind this, you did exactly that.

Bart

