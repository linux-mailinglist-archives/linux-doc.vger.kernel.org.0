Return-Path: <linux-doc+bounces-11738-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F918751FF
	for <lists+linux-doc@lfdr.de>; Thu,  7 Mar 2024 15:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EF04B22EA3
	for <lists+linux-doc@lfdr.de>; Thu,  7 Mar 2024 14:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACCA1E871;
	Thu,  7 Mar 2024 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mEGWb/ub"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB621DFF7
	for <linux-doc@vger.kernel.org>; Thu,  7 Mar 2024 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709822192; cv=none; b=TmVkXcAbXl5HP8z52XCbuMEHW2nI9jiRH9S5TMmZVNCLNKrUG2Ilbu/rsl+DXzkwLMqnbRV0DRQxNt3EihOXznCvWHdT0HB87p3y1qwBp992Rt8JvuUHD5zDdUOX6O32eNbMrWP/t87aoomwFNmoFlqUGwiDkXPnRiGh0/e30vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709822192; c=relaxed/simple;
	bh=RdZjTpDJtzmsKAMiw+aGwZusF0XSscBClg/ZWlH4myQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8tPxNJVN82tNBEHH1RubmswN6kREFcuPvo3awCQobhitct6reFO/IkIDj8CuUOTTou7kGSAWVMtK87VmxG6cPzM6TFqP9gKpfi09IEaqWc6vCh7xn4Ci3xFdqN0qnXPfJSORAY5I5B+jF32AIiCt9PoPa3yqTZq4h9cYNloQhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mEGWb/ub; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso995566276.2
        for <linux-doc@vger.kernel.org>; Thu, 07 Mar 2024 06:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709822189; x=1710426989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdZjTpDJtzmsKAMiw+aGwZusF0XSscBClg/ZWlH4myQ=;
        b=mEGWb/ubmqCtRL/r8UODsp4t11BN8h4AVwm6nCtiC8J8Pt5QR4D6vtXNCqkCGXykcB
         mz5zeybijYe5GRTGmsYzRtwUmmb+2NepLuAFdkKcDTP+QEhUkPWFxMyxuV+DeCQGDfN5
         2OKnTXLMIETTqxTfSPCc/RdqF9boKKmGzN1uezNLJUDvY138bFi+uSKJlg2XPLmzgQeW
         sEj049jdatsf8lOE51oiwB/BYHdwybWN7F//tVTJC28BIZiENJyHG1LuIwsQCmuPx8kF
         ZvMfjCPGUjrBijBcIj52HKXZ6IpH+lcABBczGFP23kdg3/dOik2Msd0/alzwUGXuWiIN
         x3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709822189; x=1710426989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdZjTpDJtzmsKAMiw+aGwZusF0XSscBClg/ZWlH4myQ=;
        b=IH3ghT50FdpYkaAkfe/Jx6knuc2yQ3Hzl9yAzLgKhuo+HecsdyddCq/R8PbevVJVGd
         DWsDxq8aO6awMtT4gXqnYnB4ktyvwjcoOSY794ye7523ASXcqy5dntoXlo8bKn2cTu3i
         EhpKdsH33wBLUGIjDl6MnVW2UcTtb9xdOCMUkplfoAv3SBbb/gSMq6BMSspkOB50iLVb
         FVBY+KiMe6bKEUuuO0IyYJhIekfpzQW5slglJHawHouFF9W/YFatoiL0boGdo3oKDS2U
         T08URRBvDNmDShOn5ls/2E4HDvmd53hGwTakgGYwadQhGbZuYbmUv3xFvMTxHYnBrowA
         h40Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZi4HAL8ZbEViZ6xuAqWq09bp0gYkTnD4W7GQc/LwSGVyE5jnSzpLlZxkUjoc4QgrVidmMqoimi8+PdI075tprerrTsTEx29p4
X-Gm-Message-State: AOJu0YwallHSqX2wXamGew/mQhiPHPjN4M37TjUB/bBlqX95A/1VNncM
	1h9NhUYeWjQPagzXqxNSKrNhJjYaMMfIq4R51Meu/m6PRzvNLvapej9hx5k+kbUwwnmHWnx/heD
	2ILfbLig3sU6bjQyduOT87YBrW6CJOu316SxR0Uoy22sAfFm6
X-Google-Smtp-Source: AGHT+IGhwp9+i1EovMeL7O79DpNpuhC9nVwzgcvvbTtNXf5Mnu+oIU5/6z+8bMnsrA0eesmXP0IAOqR6f2u3zVYn5rw=
X-Received: by 2002:a25:2fc2:0:b0:dcc:a446:551 with SMTP id
 v185-20020a252fc2000000b00dcca4460551mr7674950ybv.52.1709822189305; Thu, 07
 Mar 2024 06:36:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307135109.3778316-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240307135109.3778316-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Mar 2024 15:36:18 +0100
Message-ID: <CACRpkda6bykOFY6gcZqRKLAnprUooZooQ_g7Rj_63da2akbwtA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpiolib: Get rid of gpio_free_array()/gpio_request_array()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 2:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There are only two users left of the gpio_free_array()/gpio_request_array=
().
> Convert them to very basic legacy APIs (it requires much less work for
> now) and drop no more used gpio_free_array()/gpio_request_array().

That's reasonable and makes the kernel a better place.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

