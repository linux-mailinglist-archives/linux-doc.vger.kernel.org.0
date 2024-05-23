Return-Path: <linux-doc+bounces-16786-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBE08CCF7B
	for <lists+linux-doc@lfdr.de>; Thu, 23 May 2024 11:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A773F282150
	for <lists+linux-doc@lfdr.de>; Thu, 23 May 2024 09:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3452F13D298;
	Thu, 23 May 2024 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5NYLLE2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883824685
	for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716457274; cv=none; b=g9V4504MSd3ZfVVgIA98y6/1ES86q5vcXVABTtHBQQXhlFE3VDU+sEU4U7vi7zrqdq2kaCzGKvy7TCtiJNlzO5Nx30pK9sEDYbzKnFhqiD6RDvLkr99jVcPHUyssCSmi5EE/aRZ8nTW2AMSpLc4orfyXWz5VQtboVGDFxrGxUXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716457274; c=relaxed/simple;
	bh=j2zx3VaHX0GsfKBrlQgn1untBcEyimrqEdjGH5+DWdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhiuGV8THPVm42BTPTkx9k1uJEcxelRqU3tUUzapmG5/te6XaCSk5OMH+pZssM+925nLW8qlDY8K2fp0uI+uaNLu+1WEnTYlW3fVJ7MQ1fknpchSqTYlWVzkMhtV2okdVwcvXlZ60vWTUtC3pEk8utfPZcR8GkOh1Y2PLd/4RXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E5NYLLE2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5210684cee6so8013033e87.0
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 02:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716457270; x=1717062070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymOIxLRXX6/t992boJGrCdN0THAC8qBuamXJNsylAfs=;
        b=E5NYLLE2otA5YJCF3nLVWisS/DzmSW2A0uqi6T4ZhdoRKjLe7LLqbSCX9/WS1vWBsB
         Za9COMKgC3G4chCxrt97Umzv9xuceDHoVQD4vywBhAsxxfDFscGNlG1Ws+ncyuyfsJsB
         LSQprJnj4VqnMO8qY8/h/aQmZrjLV5HGPh8whUw8HJJxf/ynW5W01PEuj8K92yY9b23t
         FKppsKdzuhLTSUrVILe0WtJxx4rVnkqvBDAOlQ98O7uHt4ctCwl4EWdH5a2q+Mx8/qbk
         fI6rg9f0+4CBwOYtYM/BRlfaa/YhAk2iJfYPN2PIKj7WY+3PCIBHgmBUJ76S5IbO2Dzo
         xHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716457270; x=1717062070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymOIxLRXX6/t992boJGrCdN0THAC8qBuamXJNsylAfs=;
        b=wrOcHK/U9SQNX9cadoIrJnQDqrtwmDGjAn6hoYRVGHnx0t+0HKRDXDpsLlCamed8fu
         Pp9LKfDSYfWxk7H3xExmsb8/TGgRmnpoZuu4gtxJN11SDrF5tqRzjqaYxZB1OQmBoGOH
         prwXRsnn2GZSz96a9tCcecDW61X2ixGgHthhRmLTQt/CLtr9pglMBPK+6jSzkSF+/ZsA
         3MvZv/DJZPoG3fIGHrpUeeNQTdvqtCKFvoZ/Qq3heECe0mSkSeo5aCtOAkT4GM8TMKf9
         u5ipQv40D/2bJ7qDeUbGCO1UiYQ3t9uNE9Gfgf2SF3+7I4PQ3MqCBqLEkpOv5U5GaIRP
         vB3w==
X-Forwarded-Encrypted: i=1; AJvYcCW5Yd/dYfClUSBYKwG21RCHBw/F4UVUFf+YoBdLR5Ox+wjwTbtyKNXIk9GER1VPxFKM3PO84mJPcC7fylHrbPD1naMj7EtrU7hF
X-Gm-Message-State: AOJu0YxI85NoppuHGdEjKgGzz1538J33yI6RWqLI+jwNlVbBALi3wFXL
	lfGQymLLeL7DtrnjVCbtkqNN6EdpSgnelTzNkIeWnpFdP49dKV0VDytAEsiv0+E=
X-Google-Smtp-Source: AGHT+IGDBnS6Yxc91Ez/LJRvHEhoF+0Je5SmLoZcaOOlSUX1bIaRGc7t5bjpMnVmIRgP+hN+dWcqmQ==
X-Received: by 2002:a05:6512:611:b0:51e:f1a6:ac39 with SMTP id 2adb3069b0e04-526be6ea79amr2624505e87.12.1716457269807;
        Thu, 23 May 2024 02:41:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52394a319f1sm2983965e87.64.2024.05.23.02.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:41:09 -0700 (PDT)
Date: Thu, 23 May 2024 12:41:07 +0300
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
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 12/28] drm/tests: Add TDMS character rate connector
 state tests
Message-ID: <ghotwzdstmtpnovbmt2fgvxxkcno67hfwydzjzbyfn6dkt247c@52ycrfinmimo>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-12-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-12-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:45PM +0200, Maxime Ripard wrote:
> The previous patch stores in the connector state the expected TMDS
> character rate matching the configuration of the HDMI connector. Let's
> add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 166 ++++++++++++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 216 +++++++++++++++++++++
>  2 files changed, 382 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

