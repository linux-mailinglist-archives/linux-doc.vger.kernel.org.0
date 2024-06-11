Return-Path: <linux-doc+bounces-18258-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29635903472
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 09:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C52C282217
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 07:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF0C174EC2;
	Tue, 11 Jun 2024 07:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r7Sf8Lzu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4124F17335E
	for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718092579; cv=none; b=bH7ZdlLBAJe9dXIqa1h0P9n8zXcihSTyyc6moEkhNRc0oSJXp2uKYQQUEr5a2iPn6QyvCUGD6DwRjqewN25H2uUog7nkJwGPpz2Xs0hSf6GlRZshRRqLxvD/9SilbdAQf5LRnDKnm10wMMeQXu59BKr0w8br7vSw4FUrTNroCPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718092579; c=relaxed/simple;
	bh=fz/fl1AdWD5D7YlbHf2tsLLn/LfH4RJ9gD1f59iOLB4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YhQANbFg5aPJXjxchf/GYfs866naw8rA2XU+m4IgU74//maTXFHM7/FVLecp6NSEfKYxmljgbVL8pt+EAaQDedkUYt9ROY5T8BsAaxRlG4Ys5hCXsgDqsXO3vaM+zCj3iFzMKiHpQkuv5oH4RiaHpQvGdJF/faw3KY8zIxA3rXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r7Sf8Lzu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-421f4d1c057so13534935e9.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 00:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718092575; x=1718697375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaXeG3R9YcDyayLk5fnOo/XnkT8Q/xttYsYmH8uTJ2Y=;
        b=r7Sf8LzuHMAw1y+Y24pJ2jaq9Eng5iCjDTzHqA33HnKz+O2S3Reyv0KjykpPR4ezEz
         N9eKLYqI99wW64RdP7ZYne9Xw0WlAiFoIxqxZu5y8lWtdTKQUBA8m5A5gGJmhRzCJIoJ
         wNLiZb/bDZ61fdFXouirbpIlNzkVgRn8ATh4efuxcxYbb0SRUZ20wY8k+uJW+6J4TMiS
         bWLMblfdWJ652Y/LdnhAyIk1tjlxrymuE2F0ClRaOzhXBi9NYn+P0xv2dVnZSWVlN8Aq
         QhhQOEFbr4K1BVFsLpaZRKyctPaHGSEA8buTOqvBIWe3NcWwmLbD3ar3EaxsRTdusvzL
         bmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718092575; x=1718697375;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yaXeG3R9YcDyayLk5fnOo/XnkT8Q/xttYsYmH8uTJ2Y=;
        b=X8vr09+EballYD+zHLVYmedeDgM1ze0tH9emSo6Kiw94XtXa84P3Qg0Ab7XU8DBHjL
         n8Ho9QAU9+YzpqW4KSJa0CsdFMtLAuzHK4hFqJGzuD7Hk4EHlPveUeQB2tqt3ArxbGTN
         wsaapVgFnlCVffZFIt1WWo0LTvmY+rlQyvnh2FVmfz19jLIs/kETZiqp0zKX9+x3d4av
         mnXrR2pVHYrREcsUWuKTBKpvHdyZdGcQVEOhu7ctmnFS+xYzOCBnkHz5qxw1XzWU7lju
         YM1jZTx6tQ3GF+s0QodMtdzhz9LjxkTcmmdp0UJN2b7TOUosDRL4H+agRjrdYr4XaHcG
         prCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1mCi5UFlsx9jkDRC03HPNMaz0xhvK0e0gTdY9PlT8MGvTyQaFDfERYO48s0OZU+kFuulsvzUrQtUju9DpPI7MCk2uMJ3Vh7LZ
X-Gm-Message-State: AOJu0YyBy6CFy5T9RX8RiMXGKwcLNljXTUT7qpfD29eqtndHs2yhZKwy
	/pnhoMUGg/7OVQ0pKxVj1FZfO7U4WbT/BWNhjSSlVXM+jaUhMJiB4Xg+KIW+cdo=
X-Google-Smtp-Source: AGHT+IF5ErUhZ0Gir3WaEpkIMTyi5A9X1sNl7/oV0utGu6R3mmUFRlimyA8iwylUV2vLZCk0lFcIhA==
X-Received: by 2002:a05:600c:35d3:b0:421:7fe5:12a with SMTP id 5b1f17b1804b1-4217fe50433mr49372795e9.35.1718092575454;
        Tue, 11 Jun 2024 00:56:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c? ([2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158148f66sm206043675e9.32.2024.06.11.00.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 00:56:14 -0700 (PDT)
Message-ID: <9067e697-4786-49ae-8727-603c7cc8ec5b@linaro.org>
Date: Tue, 11 Jun 2024 09:56:13 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 00/24] drm/panel: Remove most store/double-check of
 prepared/enabled state
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240605002401.2848541-1-dianders@chromium.org>
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
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/06/2024 02:22, Douglas Anderson wrote:
> 
> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
> 
> This series attempts to do just that. While the original grep, AKA:
>    git grep 'if.*>prepared' -- drivers/gpu/drm/panel
>    git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> ...still produces a few hits after my series, they are _mostly_ all
> gone. The ones that are left are less trivial to fix.
> 
> One of the main reasons that many panels probably needed to store and
> double-check their prepared/enabled appears to have been to handle
> shutdown and/or remove. Panels drivers often wanted to force the power
> off for panels in these cases and this was a good reason for the
> double-check.
> 
> In response to my V1 series [1] we had much discussion of what to
> do. The conclusion was that as long as DRM modeset drivers properly
> called drm_atomic_helper_shutdown() that we should be able to remove
> the explicit shutdown/remove handling in the panel drivers. Most of
> the patches to improve DRM modeset drivers [2] [3] [4] have now
> landed.
> 
> In contrast to my V1 series, I broke the V2 series up a lot
> more. Since a few of the panel drivers in V1 already landed, we had
> fewer total drivers and so we could devote a patch to each panel.
> Also, since we were now relying on DRM modeset drivers I felt like we
> should split the patches for each panel into two: one that's
> definitely safe and one that could be reverted if we found a
> problematic DRM modeset driver that we couldn't fix.
> 
> Many of the patches in the V2 series [5] landed, so this V3 series is
> the patches that are left plus one new bonus patch. At this point, we
> may want to just land the patches that are left since it seems like
> nobody is going to test/review them and they've all been Acked by
> Linus and Maxime.
> 
> NOTE: this touches _a lot_ of drivers, is repetitive, and is not
> really possible to generate automatically. That means it's entirely
> possible that my eyes glazed over and I did something wrong. Please
> double-check me and don't assume that I got everything perfect, though
> I did my best. I have at least confirmed that "allmodconfig" for arm64
> doesn't fall on its face with this series. I haven't done a ton of
> other testing.
> 
> [1] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid
> [2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
> [3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
> [4] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org
> [5] https://lore.kernel.org/r/20240503213441.177109-1-dianders@chromium.org/
> 
> Changes in v3:
> - drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown
> 
> Changes in v2:
> - Only handle 1 panel per patch.
> - Split removal of prepared/enabled from handling of remove/shutdown.
> 
> Douglas Anderson (24):
>    drm/panel: boe-himax8279d: Stop tracking prepared/enabled
>    drm/panel: boe-himax8279d: Don't call unprepare+disable at
>      shutdown/remove
>    drm/panel: khadas-ts050: Stop tracking prepared/enabled
>    drm/panel: khadas-ts050: Don't call unprepare+disable at
>      shutdown/remove
>    drm/panel: olimex-lcd-olinuxino: Stop tracking prepared/enabled
>    drm/panel: olimex-lcd-olinuxino: Don't call unprepare+disable at
>      remove
>    drm/panel: osd-osd101t2587-53ts: Stop tracking prepared/enabled
>    drm/panel: osd-osd101t2587-53ts: Don't call unprepare+disable at
>      shutdown/remove
>    drm/panel: tdo-tl070wsh30: Stop tracking prepared
>    drm/panel: tdo-tl070wsh30: Don't call unprepare+disable at
>      shutdown/remove
>    drm/panel: jdi-lt070me05000: Stop tracking prepared/enabled
>    drm/panel: jdi-lt070me05000: Don't call disable at shutdown/remove
>    drm/panel: panasonic-vvx10f034n00: Stop tracking prepared/enabled
>    drm/panel: panasonic-vvx10f034n00: Don't call disable at
>      shutdown/remove
>    drm/panel: seiko-43wvf1g: Stop tracking prepared/enabled
>    drm/panel: seiko-43wvf1g: Don't call disable at shutdown/remove
>    drm/panel: sharp-lq101r1sx01: Stop tracking prepared/enabled
>    drm/panel: sharp-lq101r1sx01: Don't call disable at shutdown/remove
>    drm/panel: sharp-ls043t1le01: Stop tracking prepared
>    drm/panel: sharp-ls043t1le01: Don't call disable at shutdown/remove
>    drm/panel: raydium-rm67191: Stop tracking enabled
>    drm/panel: raydium-rm67191: Don't call unprepare+disable at shutdown
>    drm/panel: Update TODO list item for cleaning up prepared/enabled
>      tracking
>    drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown
> 
>   Documentation/gpu/todo.rst                    |  47 +++---
>   drivers/gpu/drm/drm_panel.c                   |  12 ++
>   drivers/gpu/drm/panel/panel-boe-himax8279d.c  |  40 -----
>   .../gpu/drm/panel/panel-drm-shutdown-check.h  | 151 ++++++++++++++++++
>   drivers/gpu/drm/panel/panel-edp.c             |  19 +--
>   .../gpu/drm/panel/panel-jdi-lt070me05000.c    |  35 ----
>   drivers/gpu/drm/panel/panel-khadas-ts050.c    |  39 -----
>   .../drm/panel/panel-olimex-lcd-olinuxino.c    |  44 -----
>   .../drm/panel/panel-osd-osd101t2587-53ts.c    |  41 +----
>   .../drm/panel/panel-panasonic-vvx10f034n00.c  |  47 +-----
>   drivers/gpu/drm/panel/panel-raydium-rm67191.c |  26 ---
>   drivers/gpu/drm/panel/panel-seiko-43wvf1g.c   |  49 ------
>   .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   |  63 +-------
>   .../gpu/drm/panel/panel-sharp-ls043t1le01.c   |  24 ---
>   drivers/gpu/drm/panel/panel-simple.c          |  19 +--
>   drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c  |  23 ---
>   16 files changed, 199 insertions(+), 480 deletions(-)
>   create mode 100644 drivers/gpu/drm/panel/panel-drm-shutdown-check.h
> 


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

for all patches, let me apply all but the last one and let us a more
week to review it. Could you resend it as standalone patch?

Thanks,
Neil


