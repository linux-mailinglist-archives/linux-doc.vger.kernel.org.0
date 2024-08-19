Return-Path: <linux-doc+bounces-23237-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A63939573B5
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 20:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B8CB1F22998
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 18:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D8518E773;
	Mon, 19 Aug 2024 18:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SCtttJRn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C50118A6AD
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 18:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724092757; cv=none; b=I2iUe37Q8hBk/tLJqG5IY6CHDYIt6jAyPAh20zUj/+N7FT+y4UdlGS2Bw8hEjJrE5NwzdbyXQQXjOYsY0AcU/tLv40I3GKTAJR00p5OLUIOzPAiRNnqv4oe3VmRgDZBGNpP2Nie2FTZOdaOd4WdkbSvz6JN/IPIbAe1foqIvzkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724092757; c=relaxed/simple;
	bh=SWpGCGgfSTInA73Lkq9d3XSm6SVeqmrSlW6/NUDvBMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2LptPXik2s/a3djMc+zKfZ64rjT5B9tTCrgGahKLfBJNZNl+bsQ7RFnaJUFECOd/AOM+Vo1WfTg0t8cutI7RN/cjNYNGaut+jE86UvtUjJKS3w/dVVPFdGNe4bR9Z6TuopSBPZba9JcDqD5ExDjuFJMtxK9Dk1+2OrctjOvQTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SCtttJRn; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53310adb4c3so4973490e87.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 11:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724092753; x=1724697553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWpGCGgfSTInA73Lkq9d3XSm6SVeqmrSlW6/NUDvBMM=;
        b=SCtttJRnlJKd16RTxmcFD1U1owjkDsprv8a39TbNtF0p7lRdNaz4bt2Y/UuGzNTQSk
         8U9A9sMQ9KpCMdmc/+PSBvJczvHgSLsMVStporF4BgdFU+eYloTd8SzMF+uHJUsQ/EMF
         Lghuw209b+k1qh/6WaQYAjAF5v/kLHXAmxC8nKOfk/yZRnHUrIiwgkxq/MLHOFEp1nN6
         Rp0sPapA5U5xZEq528Ye1J7ZNQaOOi5Oj4FVDWB4wR/lz7hN0lTvoisqq0ggAplAyGx5
         jiV6MVc7z9A5vP6t/JjxeulgAQOb4wyCZWceNYHvNBgDE04PPpKhruYD9pZgNN38AMi4
         d1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724092753; x=1724697553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWpGCGgfSTInA73Lkq9d3XSm6SVeqmrSlW6/NUDvBMM=;
        b=asmsryfWmO1pPkzabpBA1gDRsBe+uIDaQOxr5VuLFqsnAj7LWvLPB6tYR6WhGfhGiT
         ClmsAvE+X6bKdWP0YXJJsHEUgbr5r+RRhvgAjdPeuiHLEB870SQ/oxszTRknle4QGVLj
         o9zYzn2boQoAeLHW88BF9a/D6u0UuqcLi2YRiFKdSNOdEjmjf7paaXrXujxKcxN/iCbA
         uP8eXdP0Q3MIHqslgD7AdFjQsObtvC7WFo2PWWalcydb1BHw8/FFXVQ3jpbQ2kh31rqe
         O8qmF6WH+YEqi/f93mv4CbTj4q3eOcguzFW9XdrUmwHyZgiwlh9sW95yvaUobevM2tUq
         vDDw==
X-Forwarded-Encrypted: i=1; AJvYcCU3XMFVuB3+ACnf81GdX04lkYaoCVq2jSrNmpxGqwUCgFy55mq5lLIWG1aZBuxbqKM3CD+iuITo0+X5TdeSVunET6NGYMnFJ62r
X-Gm-Message-State: AOJu0YyZ2E6xaIBxvpgKM0OtFJemw4xH1v6AfH5cOSVxO/68vRWxHYrl
	37mnKkywV6GUuZf66XqHNeWJM0VrccThaLiX0iu2cBRZyu/gVLgPcJ3ldYk4TSWXbOm7J18bWnx
	j3JJlAi1C/vi4KgDDgB/HoBrLtoWfPn17a4T2Ig==
X-Google-Smtp-Source: AGHT+IHelUVu+3Ik9JdWKk+zeumpW2YAF7qu0Ohxq5buMaU2cv0DmlPnfzkmnuU6AUlGRzMu60+m9UNlwGENsdtWTIk=
X-Received: by 2002:a05:6512:3e22:b0:533:d3e:16e6 with SMTP id
 2adb3069b0e04-5331c6af14dmr8387737e87.25.1724092752397; Mon, 19 Aug 2024
 11:39:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819165148.58201-2-pstanner@redhat.com> <20240819165148.58201-7-pstanner@redhat.com>
In-Reply-To: <20240819165148.58201-7-pstanner@redhat.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 Aug 2024 20:39:01 +0200
Message-ID: <CAMRc=MdLsLeXqm+40wb4O2PmNX9C-g0is13berDF6yDQ1EBh+w@mail.gmail.com>
Subject: Re: [PATCH 5/9] gpio: Replace deprecated PCI functions
To: Philipp Stanner <pstanner@redhat.com>
Cc: onathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, Wu Hao <hao.wu@intel.com>, 
	Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Alvaro Karsz <alvaro.karsz@solid-run.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Mark Brown <broonie@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Hannes Reinecke <hare@suse.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 6:53=E2=80=AFPM Philipp Stanner <pstanner@redhat.co=
m> wrote:
>
> pcim_iomap_regions() and pcim_iomap_table() have been deprecated by the
> PCI subsystem in commit e354bb84a4c1 ("PCI: Deprecate
> pcim_iomap_table(), pcim_iomap_regions_request_all()").
>
> Replace those functions with calls to pcim_iomap_region().
>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

