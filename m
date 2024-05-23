Return-Path: <linux-doc+bounces-16762-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1422A8CC8F0
	for <lists+linux-doc@lfdr.de>; Thu, 23 May 2024 00:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B0D9B219CE
	for <lists+linux-doc@lfdr.de>; Wed, 22 May 2024 22:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19B0146A9C;
	Wed, 22 May 2024 22:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pIou0Jad"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A267FBD2
	for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 22:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716416246; cv=none; b=XgD9oejgc5fJ8fLWBIZd/RneyjqGbZ5GFrydRwTaBGYQqhcPE1mRCC8Mm4zKdjGAhfz+sfckavpKieGho7EEt4bTqfEbf1gghdHuR5Q1c1bCzNOVoeaX9TC8HZrXV80drvUKDjJmqfp+Y+KRVXlo47yuidnjPd1yDDxQmn500nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716416246; c=relaxed/simple;
	bh=//b3G9sO2gtB09XWop8ljHzV1PwbXxvr5BFI95w+WaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvbYYNuzIXpsuQHrYYOvBbjVZgmae+BttjTZ6gEA9eUcvxLbBIWFndEdy0bcyFRjUiYHnzuC8x7J9ZwqhP3XVncBOR5MOZF07dv88yovPTjcw8SyqTqwKlPU7mNj2eBaj4KftasesxX7KRxgp+vuCcafxkJtiJXkp87P/4LQfwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pIou0Jad; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5206a5854adso6276397e87.0
        for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 15:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716416243; x=1717021043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MKjPVo1pobuPoRvHj1uEO1HEyVXXDgMeLw2a17VZbrU=;
        b=pIou0JadJtTNVc97IdoU3ZGq1C2v/ewz3yNmZK2cC9hBj05YsUHzvEaDTXYYNTxk0u
         7uxABa1eRUkFaQQkaKn6e/AjX7hv1/+jZuiEDDILImpcG2cFF3Vke7+25sz4BmzMraEZ
         hSy4Iux9b2ie1k5QsCUqSWcoejGizUQn873MX5sOfLyyoPNnMZInavJ9R1cLCQfZVVIt
         Vw0zZTYDFRo9wmtCXu3+1BvpSbHsrZwYYrBsTyCCOFgatcHf9fMkyosPDQl1AySLMcdM
         MHDQFgXrWyE9EmvoQr8p6T77aoslLtaPLHllS9pPqxMV/TC8OgmV6hy7u1YppiF6woAw
         RzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716416243; x=1717021043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKjPVo1pobuPoRvHj1uEO1HEyVXXDgMeLw2a17VZbrU=;
        b=Nzdmw/tcmJq1LoTjhVEnOtlNMXnhKhypyDPleQ01WV0oNrVltd24lJDigQCUEQM3Ca
         XK1ms3KOWAOdemYZl8Bs18kdLq+2QRUkIm7vXDaupOAYY6Cm9YBkfpkrFF+1A59qdpFd
         a3fMfp9hkYxsn+oj4uzUmmrsGkmjwu03BupYeE2TIrBoYPoyzKzDfecpoZmjAuQObIev
         QOVWoxdSv8zAvoBXiddzLHgtybpDn6X0GGL5eELtil0yIIO5dwVwjZsNl/5YSSdaWUx7
         RfnkA6NA9Rgj7MsGFHfYgqZrk0uV3MP63qAuf5qQYDRN8vQyAnWDZ5fpX9hUYsqUFDqW
         vrsA==
X-Forwarded-Encrypted: i=1; AJvYcCWEgutvkWUTreOUKbsKLJdL/2T8OM0mwc09eIqBWLBN3vLl9PbPTr0S8nUubaiVSBx5Oh0bzxYNDNvc9fAS5fFgmBgCOJUA2jl3
X-Gm-Message-State: AOJu0Ywx71YIGiJBaxxHFWCAPnCa/8bWi6SKtq+yqSEMortEvJ8scEN0
	JqOfNpgIXxn7cHIN2tLj+cOGfeZP11g4y5UdOJOj9PMaBlPdhqKLqEC+hZNEGzs=
X-Google-Smtp-Source: AGHT+IHfhjtR8bEAU54UWtngodjp97JPGUmwO1OM74aRntp9IkGMZ3Yej1SUNJLq9vHd0wtc+li0YA==
X-Received: by 2002:ac2:4c95:0:b0:523:72b8:8002 with SMTP id 2adb3069b0e04-526be315f14mr1967940e87.30.1716416243518;
        Wed, 22 May 2024 15:17:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d8b66sm5075515e87.195.2024.05.22.15.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 15:17:23 -0700 (PDT)
Date: Thu, 23 May 2024 01:17:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v14 04/28] drm/connector: hdmi: Create an HDMI sub-state
Message-ID: <zeg3lwkgc36lheoh3wdieexta2roqhhx74crxtw7dygdffkgzn@fwkfx2ixhu4q>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-4-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-4-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:37PM +0200, Maxime Ripard wrote:
> The next features we will need to share across drivers will need to
> store some parameters for drivers to use, such as the selected output
> format.
> 
> Let's create a new connector sub-state dedicated to HDMI controllers,
> that will eventually store everything we need.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/Kconfig                 |  7 +++++
>  drivers/gpu/drm/display/Makefile                |  2 ++
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 41 +++++++++++++++++++++++++
>  include/drm/display/drm_hdmi_state_helper.h     | 16 ++++++++++
>  include/drm/drm_connector.h                     |  7 +++++
>  5 files changed, 73 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

