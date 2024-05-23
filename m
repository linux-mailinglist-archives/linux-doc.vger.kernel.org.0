Return-Path: <linux-doc+bounces-16802-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAD88CD175
	for <lists+linux-doc@lfdr.de>; Thu, 23 May 2024 13:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC8C01C210E0
	for <lists+linux-doc@lfdr.de>; Thu, 23 May 2024 11:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5168D13B7AC;
	Thu, 23 May 2024 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QBLvEpc/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998773307B
	for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716464846; cv=none; b=RqH1g9HyyM2FB37HTmf7Cq87cgYynpcDyN+NdbgwBENeJ1+oV0i+ML4HvUHB2VNDaHAozHYyuBi0KfsetX0rBR3iA1kletU+5e7Jq0+7a4ha3SJyzjwrRiXhqqgG/zJlfCww6lJFxiNsvoLVB15nGGJEBTqbfAX1dtYheNPtPtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716464846; c=relaxed/simple;
	bh=/v0IBX+5fBpI01TXlBxXnhYYhzIXqSCAmPfHSBwuNwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVgwLqb5GfJmzBSIN4FC1hnmn2YsZ/83l2N2wOeuqETWH6JNQaiQ64wAFTUESUJv8iLn1TR7DBkc5w1v0lbI78TNYAx96hruPPADXo9V3NEtt4rf8RPN5gnlBfedPezchyHAGOV1C7em+HNjhfOTUlpGm1f0vjsd1WzVdYRklao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QBLvEpc/; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5231efd80f2so8368324e87.2
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 04:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716464843; x=1717069643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5JoDrVHVM7LfBzm/j8yQ//z7NC7zUr0L//iZ9DPpuos=;
        b=QBLvEpc/uVL6waD6U0OZGvPLOYWl41IfiX8ICACYAdDYjeSyQhKpUVLImw/GWuRaCM
         QMLWhKObOXbEimpg1F/KC9hEH9QecJxJiaKHO17PDW3C8t2kHLWzJPN14KxehGPCkZRp
         EwAwfIb1xiEVXY+5aJ2YWPHRRxDmGCJooIOHv9obnfH+2+i7okODCc2xPGKCMNEiPo+i
         jKJcfQmkk1jnVKxMpz0zbp5AaWDx+EffxM22NdN2H4h+FlhoNro3Sadvk3HsrI8vnuh9
         vSgrbjfh4odBG2w2nPPOvAxLS+zHaIrkb/395FBAboRfjMe7Rf71X4sQfB1JzMXbMozc
         utXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716464843; x=1717069643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JoDrVHVM7LfBzm/j8yQ//z7NC7zUr0L//iZ9DPpuos=;
        b=YbkdcRT8bGeROU7kYMxtuUYxrhxDh16UAI0gObhQnE3ViqV6SXd4Chb9a/NwW7926C
         QDivxQSzY6MKWXPrVscVK9kSQHERDm/27oJ8bS3gfcFHjFH0PewJfSFJyWaaZxolVO01
         4128oy1loxYIJMtG3WMr+Zj6L9qu9d1cSVC3d5KpF61jx3Jbx6RK9CBaut9VhYidCCJM
         d68zjtUZshr9wu6L8ngH9Ilp0gf7ffipSXKfxUq4IjQYx1WktrfTpzN/rA7TH/NWPoVp
         qR0Us4ZQsT4PAf5e+0fFwQvuGZ5DoblF56vG1rjXikw5N1pLDsRN/CQDrtl56foJ+D+u
         1K3g==
X-Forwarded-Encrypted: i=1; AJvYcCUjwdVmHFt5+pmfjjlGSn9+SqauNdOpojHkmcB8vwVQKZmVCJh4ifwrydGZDxSlYrruZYS4ap7r5ri1PGeKw/BriF+wnxMvGFxg
X-Gm-Message-State: AOJu0YxMxlNO/UQB0AWQfFYPuy+3OMHA4OuR9XR8hXcdRwDBTai52ilF
	ewbdQysjyS4GfRhWP1bUPVGSw7CoygO3fBpGSCbj0mwUsGTg2Xg2m0ZB5fKvkKA=
X-Google-Smtp-Source: AGHT+IEN/K1SwxIaCA4NY4v+I8nntKcBr37nrUarJyi3sJM40IZJFMrjSZD7I/KQY++RSCd91be4qw==
X-Received: by 2002:a05:6512:4807:b0:522:32c0:bb6e with SMTP id 2adb3069b0e04-526bf35cc19mr3052433e87.23.1716464843059;
        Thu, 23 May 2024 04:47:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f318a326sm5291741e87.0.2024.05.23.04.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 04:47:22 -0700 (PDT)
Date: Thu, 23 May 2024 14:47:21 +0300
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
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v14 22/28] drm/tests: Add infoframes test
Message-ID: <blzznexaou6bbiaonw3zeii43rcj5izgqt5zomv5wx5gxbeu2o@3j4o3hs3lfx3>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-22-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-22-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:55PM +0200, Maxime Ripard wrote:
> The previous patch added the generation of the infoframes matching an
> HDMI connector state. Let's add a few tests to make sure it works as
> expected.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c | 219 +++++++++++++++++++++++++++++
>  1 file changed, 219 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

