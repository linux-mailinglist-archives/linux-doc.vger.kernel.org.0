Return-Path: <linux-doc+bounces-16788-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1FE8CCFE5
	for <lists+linux-doc@lfdr.de>; Thu, 23 May 2024 12:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 485C5283FCE
	for <lists+linux-doc@lfdr.de>; Thu, 23 May 2024 10:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03FC13E3F2;
	Thu, 23 May 2024 10:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUmTPRz1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF1A13DDB8
	for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 10:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716458668; cv=none; b=IL6Sg+2M9WPEr1jmcgBA04SwD1P6iKVMXNzaFLyt2dFhASwXxEhxdwgXOifcjEnf5Ad+wgq0wwpqx3Aq5P5YtNMGG9+lmtiCNnF6hMRahY/q100+In/Qe0r9KuM70OhnquHmHAZdriGeuY5J+0qbJ1kNI2iGM0S2BvwXx2LW6+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716458668; c=relaxed/simple;
	bh=O4KCTeshkfk5LZ7Q0POVGtoHwRI1v4DW1pm6Bzo+dLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BajBmgkJ5PGPzeT7xcgBvpFgmSxU1TYdPXFwxFBHYBRX/xJxHUAUGKp4XL76Yw0NBROa9gkv5RL169UHh8AAc6f7whBOmpBkN9sdORQQQ3MBza76medn5v7K7vxL24qU7sDk1RDYdBsgOolEg3RODCIFsrIZjkyt8QXigKBYCT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUmTPRz1; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5238b5c080cso9162593e87.1
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 03:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716458665; x=1717063465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y4dfGDIGi6g96GxO6el+LliDi+3YKJVZHbevMlNSfR0=;
        b=IUmTPRz1rQTLY5sqgbORbhdC7q1l8+4EYrbwB+is2yP1d+KRkLzeSKvMVpYKTX/SAZ
         uC3HNnvPrXvtm7mG+7HOV3PyW7kUfsuypz2KEMCeKjdk3BPzH6c+pMzDiWeUnqf++Grq
         iRTVIWxwg1rvGMapONiTolSahr13mdMtgAINLW6icmS9lkDMpqlWChGBaf/ITC4ubjOs
         8mOtuHRYQsE/sQrAtLl1R3Auh74pZiMMMOR1l0Ak5wU/0bGdvpoJd8GeMatcKIPXA6zt
         gLZbXZNr7g0MTU2d25j2NqMjtB5uWOTu8hF7nRuYzQjbBmLUbxBpdyo1deIsmq8bfmvr
         ZTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716458665; x=1717063465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4dfGDIGi6g96GxO6el+LliDi+3YKJVZHbevMlNSfR0=;
        b=KVYNFUzZLqWgbxZldTFbXpN6BUQfRuTPeHMvuzaIHiJbGaH0rTzqjunlbEcGVHYqko
         B/4Qlm0XKYZjCdbGsU7W9nGWK9RdCpR8Q3/vRmrmLB/aaBFewtpeBgnN22j9nV6aA4/I
         IwIsupTl8caAUrJaEk9ZyzANWr888xLV8uXwHt7SOqlQTbgGWgL+gBoX2LQSnsSCyMr2
         EDUXqbxO51TGQl6fuxHr4idOTEa+6YXz4xXz5IgOHBtOHxNw1wj0EONDAbhHk78f00IC
         q6ERGVh6fEW2Z0Gt4AYlJ5HWONTnM94Hwz+EIL7rJYWznnsqEmKpiBvrZ7UuF5QooGEb
         g9uA==
X-Forwarded-Encrypted: i=1; AJvYcCU/iplNhm6qi+za4fGFRAeHGT8FT4MEc7lRWMtSVJi25V28nlfES/KLjjyetiAQ6F7Mfmh9b3coWucDJH/PBzzFhmrIKWk17Vdr
X-Gm-Message-State: AOJu0YwyMvf6CUzsVbkpiyaEBHWIFfVzrVxGVPS+a5WREkwpG8QuCxlJ
	EqMCSPeTPx9G2ENv7LZrx6wEo4KGKL66sD/d/k6yZU07pPxk0bW4DqL9TWGlgrM=
X-Google-Smtp-Source: AGHT+IHI9JqXzb0Cyfhcs6KeNERwPEvQfkeVQfr9ZS+SMw0TkOUBh/ztRskPl/+x+XS30MmAlFxklg==
X-Received: by 2002:ac2:5044:0:b0:523:3be3:cbfe with SMTP id 2adb3069b0e04-526bfc02bbemr2577217e87.65.1716458665403;
        Thu, 23 May 2024 03:04:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5236d2e9ad9sm3382898e87.178.2024.05.23.03.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:04:24 -0700 (PDT)
Date: Thu, 23 May 2024 13:04:22 +0300
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
Subject: Re: [PATCH v14 14/28] drm/tests: Add HDMI connector rate filter hook
 tests
Message-ID: <zds53yg36qf7ft7mrvvgv2k5avbjib3zy2pdd2azrnvthppngu@2bep5gso3wic>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-14-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-14-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:47PM +0200, Maxime Ripard wrote:
> The previous patch adds a new hook for HDMI connectors to filter out
> configurations based on the TMDS character rate. Let's add some tests to
> make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

