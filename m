Return-Path: <linux-doc+bounces-16454-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8A08C8467
	for <lists+linux-doc@lfdr.de>; Fri, 17 May 2024 12:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CB421C22E7E
	for <lists+linux-doc@lfdr.de>; Fri, 17 May 2024 10:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C2B23770;
	Fri, 17 May 2024 10:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HUTsqVsm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021E02C1B6
	for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715940096; cv=none; b=R5dGh/qEIrHLHIGK9bW5J5oTCToxzMNpBeV4jCvj9Z0rxo61JEo5yXoiVfrfeWbafvkadCAUjv5TdMWAuNQ3opKe0SEegUySrn4W1yXHZ1WPHDbnfqLvQ3BVsJwBNmnafBih9Wxl+DVokO1vLb39s6UUZOwsrlxLkPgCR7zSgqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715940096; c=relaxed/simple;
	bh=PWrHcj6HzEkQvCE4ut2qDtva3893i1h4KvwxXKEnsyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdKbkuI+PC07FEzP7IeVIkMphHSwpqbVP2iaHlJ9ZIR3kYlmfoK4HALffylgbGomrzbkriM/NrjQE4DBDFcJchX+wolLcy3w0DZMt2i+cqYlc8GsS9JiNtYzHGxOO13KPVnaXqRB4d60L+H9pgAomqQ1TAIUUWaTvsxxGsQ7Z6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HUTsqVsm; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-de5ea7edb90so9202656276.1
        for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 03:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715940094; x=1716544894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWrHcj6HzEkQvCE4ut2qDtva3893i1h4KvwxXKEnsyQ=;
        b=HUTsqVsmufgkyquQRPqNWGNbxm6Mt1JXEb46HVd1MZhmJuPBSSVzo7L5VQeIf4fyq4
         TcDnmPzrlxlTmc3D7RzQbUf3SP6sqOjRcfcXL1C4nXxUDQjGEOxyo3jmsVdhpHhvFtLN
         VvttUTLLhjy/8Fep3nLqL2m9RioUx/HsyOLiyun000b6lwNf098I+jJWrG7bTMYKl1aM
         NnESZqxVKtw/xhF8PKNdNoDRGJIKovHVDeVtNyX7W4bL3UMDwKWjRxwmBqbcOLIV6Kbw
         WKypVpMIhd2P4k2rcEMp94wd+X3xLH4JMZmgVDYdtTHogRkCy4Riyhl0v3FpsEiJLLXt
         7mOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715940094; x=1716544894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWrHcj6HzEkQvCE4ut2qDtva3893i1h4KvwxXKEnsyQ=;
        b=JVV/3y46jdmjTE0kz1kFCxWRnzD9CMZs7qJNvwmxYN6AVB7P1naxSnsPRFc55ylKBi
         ASIVU7p89jq1jsYthrnxm3yzQ8tokkiknLmFL/QO0I2FdBA5NM7JRw80tvOuw1tcTfq4
         uRxOvtyxMkJY0pMOJPuJsIaXYBiGIsboEJdJVotAuLiUZ+Al9b2UdkqkyQCfl9K9vbn8
         EbDBX539iGOsV62Xl7w0ckc0KhF301zy/+jwzZHysHzO/g4FglkkTwoKsFLxvKhlbFHm
         EkNDZ3WYeML5vY769r/sABUirVXz4u47+wR/zLjangIG8LLcQVCVWGTEaIwyojN3tnUE
         Tnog==
X-Forwarded-Encrypted: i=1; AJvYcCUl3GGX1j1v3CTKnKB9CoBFk8OivZBZtDtreClUOUjasnMc0WPYF9MD4gs+uNbVMqROZhxZvAJl7hN8O1YzuCTdbVL3U784MT5Y
X-Gm-Message-State: AOJu0YwyDUP7Z+99K22iqXz4vqpHhkOEDO4hoQqdGGWULazw5SdVs8Qz
	N6s1nrxiHs+/xo6KMOeaSFndw+7lQmc+F7epwycLK6BvaRxkJBTusU5yIc1TmZUgt25uXCmH0nO
	jMKLdz2r6Rcs0dhhWm6b0gANc9p1WSVo7F4ND/A==
X-Google-Smtp-Source: AGHT+IFWtvkjHx1cRApkWmP+4gW7HWytdCwPBOFtAteNB80YOe4v7R7d8sV+ukCkw3UrBiJsw320m7Xbh0v/iFu2xWI=
X-Received: by 2002:a25:844b:0:b0:de6:17eb:3cb5 with SMTP id
 3f1490d57ef6-dee4f1b77c1mr20119979276.10.1715940093906; Fri, 17 May 2024
 03:01:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240508101703.830066-1-andriy.shevchenko@linux.intel.com>
 <ZkYQHnF76WLIf8-r@smile.fi.intel.com> <CAMRc=MePRxKumCTQ+2W3Q=UgSetAkAROGRWZApdTcn3dRj79WA@mail.gmail.com>
In-Reply-To: <CAMRc=MePRxKumCTQ+2W3Q=UgSetAkAROGRWZApdTcn3dRj79WA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 May 2024 12:01:21 +0200
Message-ID: <CACRpkdbLQKKp1z+1CUqxGFbLETPw0AY_+d+hNxe3R6Voc7pOWg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove legacy API documentation
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, 
	Vegard Nossum <vegard.nossum@oracle.com>, Kent Gibson <warthog618@gmail.com>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 11:47=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> On Thu, 16 May 2024 15:54:38 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Wed, May 08, 2024 at 01:17:01PM +0300, Andy Shevchenko wrote:
> >> In order to discourage people to use old and legacy GPIO APIs
> >> remove the respective documentation completely. It also helps
> >> further cleanups of the legacy GPIO API leftovers, which is
> >> ongoing task.
> >
> > Bart, Linus, Kent, what do you think about this?
> >
> > If there is a positive consensus, I would even dare to go for v6.10-rc2
> > with it.
> >
>
> I don't have a problem with this change but I will not send it before the
> v6.11 merge window. Why would I? I'll have it go the normal route, it's n=
ot
> a fix.

That's reasonable, then people get some time to think about it
and protest if they like.

I am in favor of the change, better delete the docs too early than
too late, we must do what we can to stop the old API from gaining
brainshare.

Yours,
Linus Walleij

