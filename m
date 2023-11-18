Return-Path: <linux-doc+bounces-2596-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF807F0253
	for <lists+linux-doc@lfdr.de>; Sat, 18 Nov 2023 20:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FDA01F2233C
	for <lists+linux-doc@lfdr.de>; Sat, 18 Nov 2023 19:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42C9199AA;
	Sat, 18 Nov 2023 19:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kelvie.ca header.i=@kelvie.ca header.b="NUpi+QWV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-108-mta162.mxroute.com (mail-108-mta162.mxroute.com [136.175.108.162])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA358130
	for <linux-doc@vger.kernel.org>; Sat, 18 Nov 2023 11:20:37 -0800 (PST)
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta162.mxroute.com (ZoneMTA) with ESMTPSA id 18be3e0b1ff000190b.001
 for <linux-doc@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 18 Nov 2023 19:20:35 +0000
X-Zone-Loop: ce067ea737c0cdfb7c2c57879808df0cfc6b32326586
X-Originating-IP: [136.175.111.2]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kelvie.ca;
	s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References
	:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cEDhQtXe1+N3fL0aqe3n5kp+RSO1sphZGhU2MGRUZhQ=; b=NUpi+QWVisl+eXv1NY6M7Z57T+
	zMNiUUdyYm8on+Qt7HSGke2vPsXJBj2+kcyxyhGVk17wRKfgF3Zm31q710SVSXng4Dzgc+JGmlAbw
	P/JhkaByB/VLtG+9ittKrCTd51/CIVl3g+PRBggOVtOF5nJqRkY9PlPIbqpVGOJsUYpNt+F4osZhM
	pgl6iUAKYeBiPtHabT1sWO+Tf+lwIfUyoBomie94svizzWM6EOZ63Cm4kUciUU9pE1ZrADqn6gyWO
	FJqbwbRwkR/DjaQT21UJiFsXra64h6OTbFNHhdgxTdyk+kO9X98N5NS2UHL/79ikMc2bui4lfSVtp
	GJ9OZxOA==;
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6c3363a2b93so3051046b3a.3;
        Sat, 18 Nov 2023 11:20:34 -0800 (PST)
X-Gm-Message-State: AOJu0Yw3zRpZN36fhmZj3dzykIAtTsnnNA+ZTgWH+Lf8veNSrF/LeUhk
	rMvZEgQxIEKjfK5w93W4w2yVaKZpPQP9pejrEyU=
X-Google-Smtp-Source: AGHT+IGYdPMZUCm0XogT5wexOPSwLc4gI2Jc3x2hz3qTtLWt14VdLR8V8TpBFzj1JO/7aUn/9BdnWwtCnW7pT+olMag=
X-Received: by 2002:a05:6a20:2618:b0:187:ed88:e790 with SMTP id
 i24-20020a056a20261800b00187ed88e790mr2575600pze.44.1700335233445; Sat, 18
 Nov 2023 11:20:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114022503.6310-1-kelvie@kelvie.ca> <a66a805c-3e1f-4b9a-a38e-aca84b8678a6@infradead.org>
In-Reply-To: <a66a805c-3e1f-4b9a-a38e-aca84b8678a6@infradead.org>
From: Kelvie Wong <kelvie@kelvie.ca>
Date: Sat, 18 Nov 2023 11:20:21 -0800
X-Gmail-Original-Message-ID: <CAK2bC5qHGE1uYuUWMg2L6Zo-vDsHA23nDiaKtEcoX_JVaZNG5g@mail.gmail.com>
Message-ID: <CAK2bC5qHGE1uYuUWMg2L6Zo-vDsHA23nDiaKtEcoX_JVaZNG5g@mail.gmail.com>
Subject: Re: [PATCH RFC] Add a lockdown_hibernate parameter
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, 
	linux-security-module <linux-security-module@vger.kernel.org>, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Authenticated-Id: kelvie@kelvie.ca

Hello,

[sorry for the duplicate, had to re-send this as text/plain]

On Mon, 13 Nov 2023 at 20:01, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> [add security & dhowells]
>
> On 11/13/23 18:23, Kelvie Wong wrote:
> > This allows the user to tell the kernel that they know better (namely,
> > they secured their swap properly), and that it can enable hibernation.
> >
> > I've been using this for about a year now, as it doesn't seem like
> > proper secure hibernation was going to be implemented back then, and
> > it's now been a year since I've been building my own kernels with this
> > patch, so getting this upstreamed would save some CO2 from me building
> > my own kernels every upgrade.
> >
> > Some other not-me users have also tested the patch:
> >
> > https://community.frame.work/t/guide-fedora-36-hibernation-with-enabled-secure-boot-and-full-disk-encryption-fde-decrypting-over-tpm2/25474/17
> > <snip>

Any comments on this patch? Or even a pulse (or a "this is a terrible
idea and it'll never be merged").

Or perhaps a "secure hibernate is on the way so we don't want this".

-- 
Kelvie

