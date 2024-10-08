Return-Path: <linux-doc+bounces-26784-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7269951C8
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 16:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EF2E1F21C67
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 14:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89031DFD9A;
	Tue,  8 Oct 2024 14:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GhzlbFAq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07751DFD80
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728398035; cv=none; b=GsddYnYZ+5IrB7QmgI3bdy4k+0UvY2SBNcvyOG9bd5qlyvGJKrzLOrV0GeIfrNvRnW9pTkN1ga4DuL5W3gJk0ExS6qg6cUtb3Pv24oV15uDHkHVu+7HA6TL0/8ZduDQWe8Fp+H+6Ebumq1sRMSU63bAoqdufkPEIpQ9ka5Eklo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728398035; c=relaxed/simple;
	bh=cJbvDgUha/1eoUVSaOiEuoQnBVNtsRTyLKAM+qSvSQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFmHGZRHuzs83z5Ed5zAsRdBUBIQC7tsYpsCKBcxAUhxQ1iKnlphqwrvpFYY9XJXpdxTDaGBiBAWG4ZxT5dzfLvuGCZAzArzHjLH191dMc5CiY2g0p5cbTbNMV6MkIwWW0ClFTSbOSyhuBV+yYM0yUFxYlQpwtXIa4lKMDv5tKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GhzlbFAq; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5398f3be400so6490821e87.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 07:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728398032; x=1729002832; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l8UUeF5zVA7me/KDNa1uZvUuZ4ABpmFfw0rMc8MJiM4=;
        b=GhzlbFAqqtx77ra1+v8o//33rCwoJFllP1X9NohIgaVgqW3neaEHb4GF1co9xIgMGb
         MvgqDehmYJf+Urq4ShbnFZL5RiyRNBEzhTL52ptNFDgj/qkWc2oMXjjDXZjT1n9zYPQV
         1Xp0fz/FPp5XqtgGub8V5ldG+2DgD5Hnj4aRW0i/9y4H2PgqpnZNsPgi5LvLNpUOgKIO
         DrKJQQMqGFa2bGbvdYm1n3u3AbEKmBOQVhGESBiiNV11dmaOQFJdinp5TIrLswSzWdZ8
         645L6DeP+i7OwvIHg7UHNCOhsdifTcL72MmqZ/aspTzzktZ4fb/e+y254KqX1i0qWLdT
         LLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398032; x=1729002832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8UUeF5zVA7me/KDNa1uZvUuZ4ABpmFfw0rMc8MJiM4=;
        b=dBSZ9XVhemz4jDrpew7vl49Z4SJVeQIbeUjOlGFN6BKQCvdX1usQTCF2Ur69q6s4zH
         nPiAfAcCO7EXYSrEorTVwxVIn4DJ5E5RpdLG4wHw6qB6TbkhBwoHMjrYXt9uj/XMvPOe
         hwOG9dBczvgo4ewZdnJdtIzR7tJGXfVnn0pqNknvN8tBkPRblSAurgc9aEEBRrEmULFX
         gXDDMLH85ntvOk6Td75TqKhBz1hNnpu40enj5CE7Twrkn1PFHLtoYJEpS/pEeAAAHyvL
         k2zPTi6wloYy9oQlM3DAqAQf8+O4bTgXR4Z6zopjyHKFBqfUpnlCP44BG8XtPSvE4XzJ
         PwIA==
X-Forwarded-Encrypted: i=1; AJvYcCWSCnGyO0Y5OMU2JvaGXfg4D4naxMv5nIwjX1HfwdvfLVWqU9YqOv+LdoEDpICo6MB5MTJldbrFNK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHvu2/djGdlwy+6VkUh+sX06/ZM+F8ba852S0vFjuRdEJx93s
	c4AbMeWnC2gTu8Z3TEZgJJ/txLY3aN7PYVn7iZKs1YQEckHx/8b9WJUoMRBN2u/b2F5Dvjnwu7b
	F+k62mfINqqD5Voy9yaUZxoKLgnpS/U6+1qVDWQ==
X-Google-Smtp-Source: AGHT+IGBYcpHt0lMWnVGb0Hy+ZeNqvJFr2wYYFazy0Mc7IJSh/h6XvyFgyinHLgdB/nKkTDcnov6qsaKInqYJZBkAPE=
X-Received: by 2002:a05:6512:3b85:b0:536:54df:bffc with SMTP id
 2adb3069b0e04-539ab9dc722mr7192766e87.42.1728398031871; Tue, 08 Oct 2024
 07:33:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002221306.4403-1-ansuelsmth@gmail.com> <172833255295.162249.16483920948700467749.b4-ty@kernel.dk>
 <CAPDyKFoueMwVfN+P+tG7zT+-iUs=hghsRu+i9mNiHGw_9tcwBw@mail.gmail.com> <fe10ee8f-1220-4a1d-a25b-efaaa314699a@kernel.dk>
In-Reply-To: <fe10ee8f-1220-4a1d-a25b-efaaa314699a@kernel.dk>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Oct 2024 16:33:14 +0200
Message-ID: <CAPDyKFpoFP3v8XneMoY5_DEVssYkDyK03QpikBdsZseO4_MLPw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] block: partition table OF support
To: Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Golle <daniel@makrotopia.org>, INAGAKI Hiroshi <musashino.open@gmail.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ming Lei <ming.lei@redhat.com>, Li Lingfeng <lilingfeng3@huawei.com>, 
	Christian Heusel <christian@heusel.eu>, Avri Altman <avri.altman@wdc.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Riyan Dhiman <riyandhiman14@gmail.com>, Mikko Rapeli <mikko.rapeli@linaro.org>, 
	Jorge Ramirez-Ortiz <jorge@foundries.io>, Li Zhijian <lizhijian@fujitsu.com>, 
	Dominique Martinet <dominique.martinet@atmark-techno.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-block@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, upstream@airoha.com, 
	Christoph Hellwig <hch@infradead.org>, Christian Marangi <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Oct 2024 at 15:24, Jens Axboe <axboe@kernel.dk> wrote:
>
> On 10/8/24 3:10 AM, Ulf Hansson wrote:
> > On Mon, 7 Oct 2024 at 22:22, Jens Axboe <axboe@kernel.dk> wrote:
> >>
> >>
> >> On Thu, 03 Oct 2024 00:11:40 +0200, Christian Marangi wrote:
> >>> this is an initial proposal to complete support for manually defining
> >>> partition table.
> >>>
> >>> Some background on this. Many OEM on embedded device (modem, router...)
> >>> are starting to migrate from NOR/NAND flash to eMMC. The reason for this
> >>> is that OEM are starting to require more and more space for the firmware
> >>> and price difference is becoming so little that using eMMC is only benefits
> >>> and no cons.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >>
> >> [1/6] block: add support for defining read-only partitions
> >>       commit: 03cb793b26834ddca170ba87057c8f883772dd45
> >> [2/6] docs: block: Document support for read-only partition in cmdline part
> >>       commit: 62adb971e515d1bb0e9e555f3dd1d5dc948cf6a1
> >> [3/6] block: introduce add_disk_fwnode()
> >>       commit: e5f587242b6072ffab4f4a084a459a59f3035873
> >> [4/6] mmc: block: attach partitions fwnode if found in mmc-card
> >>       commit: 45ff6c340ddfc2dade74d5b7a8962c778ab7042c
> >> [5/6] block: add support for partition table defined in OF
> >>       commit: 884555b557e5e6d41c866e2cd8d7b32f50ec974b
> >> [6/6] dt-bindings: mmc: Document support for partition table in mmc-card
> >>       commit: 06f39701d0666d89dd3c86ff0b163c7139b7ba2d
> >>
> >
> > I think we may need another merging strategy for this as I quite big
> > changes in the pipe for the mmc block device this cycle.
> >
> > Would it be possible for you to drop the mmc patches and instead share
> > an immutable branch with the block changes that I can pull in, so I
> > can take the mmc changes?
>
> I mean we can, but the mmc changes in here are pretty self contained.
> I'd rather avoid rebasing the block tree for that, given how small the
> changes are. If it conflicts, should be easy enough to resolve.

Okay, let's give it a try and see how it goes.

>
> You an also just pull in the block tree now and resolve the conflict.
> There's not a whole lot in there yet outside of this series.

Let's wait and see. If we get some conflicts, you can always set a tag
to the latest of the mmc commits in your tree that I can pull instead.

Kind regards
Uffe

