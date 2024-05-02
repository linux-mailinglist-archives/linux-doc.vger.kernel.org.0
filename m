Return-Path: <linux-doc+bounces-15623-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2308B9593
	for <lists+linux-doc@lfdr.de>; Thu,  2 May 2024 09:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BD001C20F35
	for <lists+linux-doc@lfdr.de>; Thu,  2 May 2024 07:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3E023775;
	Thu,  2 May 2024 07:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hLYGR6a8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066A7224F2
	for <linux-doc@vger.kernel.org>; Thu,  2 May 2024 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714636136; cv=none; b=ZsdVUyHp4CNbbSXp2Udrax9bfR+hZm4Hbmocv68NUVXCGIJsVnnXfh+QTzysZT8isxnWC+U9WtpXVoiHEljQIVlge2Zn2NJ/vaYlC3D56vr2yf+fnp1qk25sNrwVfJfPxKng3xdla0aNLGTvkHjwRRros7aAN6ZBY0Q5HsHBaQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714636136; c=relaxed/simple;
	bh=YnErUF2MNKugI/b9UXB92WK1VSQ9+Td+hA0TBAdfc9A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=A8weXE2SjqjhbfCMSHN44HgehWctS1Zy7WBTjwR/0VTiEd1xTz0bB1n3m/JV62m/vq8axVHBtWSuCLWSQ1vJUU760zSkE+ZnOUwV/ZhkFaYrn9XOwmfbXX+vzRfd7ekxcQ1NLeMNzfqheIkadUsoWLQsZ2iUGNwHnecFyLzR6ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hLYGR6a8; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51f0b6b682fso669498e87.1
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2024 00:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714636133; x=1715240933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BX9W08JmhUFPTdQQggPd87vyyhpP+MKlPGyZ3mfavs=;
        b=hLYGR6a8/S7BHwOrzCRfJIw+Xx6+R00Y5rY8XGJpExRHThXJm4PHU88Qg9Q1+Cs0Rr
         RQoS+NOxQYyihgLB5JZom3EHRyimasmSqtX2JBdo8XTeF++A7Y2NUPUbSDb2Zhh4pTRe
         +FcL2l+o1pXiOqjTl59MJTeNrS6vj3st0IMf9UjDrTbwy01ywA62nHpKfvjCMcqlxX1v
         Ioqhnfx8nZRTMgpnQiHtbPJ2HjztnGgSClxx61njymoOLk1mF8xJ06KZwhdCv6SZeNfK
         lFjSDCLcHwZA0xrWLwDewp2XKMgJxqeQri62fpvboM2rbUQ/tHPVUYlJIuqGfvoqsdbf
         NXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714636133; x=1715240933;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3BX9W08JmhUFPTdQQggPd87vyyhpP+MKlPGyZ3mfavs=;
        b=e78wS3CyV3py55BN1Ao/hbRhbrQtxzQys1ZEPKxt11ZOCDf+9MkgM7Q9xw4mus7I7h
         mFQref43mDInmCyDFP0s6SKmTZpewuifFbCeaMXKb6sPIf4H6N3rCruir4n19F5Qk7Ms
         1icdK13xnjbE/vQzkHChyi14Deddp8QUSnOTFJU/YOBVSLwuwuYVCW7FKqv8Y47XHxrH
         XaVq5jgAGfPzLfFOOTPINz8fvt8UkFk0vx3boiUOVKLmMAYodB1dMm1S3rGCPvcvhgr7
         ucwWJYm9blZrJvFejoBKeBeKEia154zOkJYi6Q8gFapvBg0/merEQFm5YWYF6a6w2VSf
         IIJw==
X-Forwarded-Encrypted: i=1; AJvYcCUVU9w7mlCprXQRPTWMKZS3ZdFenOmofKsyqDM2HHvsvY+HbYDasqAe29rwTBeL+IEa+TzoO9MU+u+KIE145ZkMpEJvaPZqX/2G
X-Gm-Message-State: AOJu0Yya/ptUu0SSvZe1TVcibBVnqQ6FMp9QZOiA/ZZ9wd86BB+Hmbgz
	EYoLarSehOS80shn8MrEvs8L9FkiwlDhjE8r6DAqbJ+4lqOjs3B6aKPXEWp2hjU=
X-Google-Smtp-Source: AGHT+IEAX8pf7KqlUWuWWePCAeDLiAG7KikemqzaZtoEPB2JzXIwOySVUHsVe5LhTMlDYzmtVlyuqQ==
X-Received: by 2002:a05:6512:2144:b0:51d:804a:232 with SMTP id s4-20020a056512214400b0051d804a0232mr782827lfr.11.1714636132970;
        Thu, 02 May 2024 00:48:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:67e2:5e2:652b:4129? ([2a01:e0a:cad:2140:67e2:5e2:652b:4129])
        by smtp.gmail.com with ESMTPSA id s20-20020adfa294000000b0034e285d818dsm584976wra.32.2024.05.02.00.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 00:48:52 -0700 (PDT)
Message-ID: <a8a73fc4-7699-4c47-8970-cd68be0fe1d9@linaro.org>
Date: Thu, 2 May 2024 09:48:51 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/9] drm/mipi-dsi: Reduce bloat and add funcs for
 cleaner init seqs
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, Brian Norris <briannorris@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Joel Selvaraj
 <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240501154251.3302887-1-dianders@chromium.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240501154251.3302887-1-dianders@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/05/2024 17:41, Douglas Anderson wrote:
> The consensus of many DRM folks is that we want to move away from DSI
> drivers defining tables of init commands. Instead, we want to move to
> init functions that can use common DRM functions. The issue thus far
> has been that using the macros mipi_dsi_generic_write_seq() and
> mipi_dsi_dcs_write_seq() bloats the driver using them.
> 
> While trying to solve bloat, we realized that the majority of the it
> was easy to solve. This series solves the bloat for existing drivers
> by moving the printout outside of the macro.
> 
> During discussion of my v1 patch to fix the bloat [1], we also decided
> that we really want to change the way that drivers deal with init
> sequences to make it clearer. In addition to being cleaner, a side
> effect of moving drivers to the new style reduces bloat _even more_.
> 
> This series also contains a few minor fixes / cleanups that I found
> along the way.
> 
> This series converts four drivers over to the new
> mipi_dsi_dcs_write_seq_multi() function. Not all conversions have been
> tested, but hopefully they are straightforward enough. I'd appreciate
> testing.
> 
> NOTE: In v3 I tried to incorporate the feedback from v2. I also
> converted the other two panels I could find that used table-based
> initialization.
> 
> [1] https://lore.kernel.org/r/20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid
> 
> Changes in v3:
> - ("mipi_dsi_*_write functions don't need to ratelimit...") moved earlier.
> - Add a TODO item for cleaning up the deprecated macros/functions.
> - Fix spacing of init function.
> - Inline kerneldoc comments for struct mipi_dsi_multi_context.
> - Rebased upon patch to remove ratelimit of prints.
> - Remove an unneeded error print.
> - Squash boe-tv101wum-nl6 lowercase patch into main patch
> - Use %zd in print instead of casting errors to int.
> - drm/panel: ili9882t: Don't use a table for initting panels
> - drm/panel: innolux-p079zca: Don't use a table for initting panels
> 
> Changes in v2:
> - Add some comments to the macros about printing and returning.
> - Change the way err value is handled in prep for next patch.
> - Modify commit message now that this is part of a series.
> - Rebased upon patches to avoid theoretical int overflow.
> - drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq()
> - drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_generic_write_seq()
> - drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
> - drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit prints
> - drm/panel: boe-tv101wum-nl6: Convert hex to lowercase
> - drm/panel: boe-tv101wum-nl6: Don't use a table for initting commands
> - drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi()
> 
> Douglas Anderson (9):
>    drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq()
>    drm/mipi-dsi: Fix theoretical int overflow in
>      mipi_dsi_generic_write_seq()
>    drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit
>      prints
>    drm/mipi-dsi: Reduce driver bloat of mipi_dsi_*_write_seq()
>    drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
>    drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi()
>    drm/panel: boe-tv101wum-nl6: Don't use a table for initting panels
>    drm/panel: ili9882t: Don't use a table for initting panels
>    drm/panel: innolux-p079zca: Don't use a table for initting panels

Thanks Doug!

I think we all agree on the core changes, now I think we can wait a few weeks
and try to get some test feedbacks on the indirectly and directly affected
panels, drm-misc-next won't be merged into linux-next until v6.10-rc1 anyway
so we have some time to test on our boards.

Neil
> 
>   Documentation/gpu/todo.rst                    |   18 +
>   drivers/gpu/drm/drm_mipi_dsi.c                |  112 +
>   .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 2792 +++++++++--------
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c |  794 +++--
>   drivers/gpu/drm/panel/panel-innolux-p079zca.c |  284 +-
>   .../gpu/drm/panel/panel-novatek-nt36672e.c    |  576 ++--
>   include/drm/drm_mipi_dsi.h                    |  101 +-
>   7 files changed, 2451 insertions(+), 2226 deletions(-)
> 


