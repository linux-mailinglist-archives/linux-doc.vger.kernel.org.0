Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D553E1407
	for <lists+linux-doc@lfdr.de>; Thu,  5 Aug 2021 13:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238437AbhHELkc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 Aug 2021 07:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237913AbhHELkc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Aug 2021 07:40:32 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B42C061765
        for <linux-doc@vger.kernel.org>; Thu,  5 Aug 2021 04:40:17 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id c16so6085018wrp.13
        for <linux-doc@vger.kernel.org>; Thu, 05 Aug 2021 04:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+nlth2m2/8vEMrI+L6F6FH19lBWEC80x5zsmEulcRdg=;
        b=S59FAiqlqHkiyKe+HX/Y/AwMG03IFpd+AoQDLucqSXzXwnHWZ/iC0VztQ7OIZWFher
         K93Pc2O5O/jTdRON3ndmTxnbzUZ9mcRHvTl2EmnDez4bIlcdRbIPDLySFvFN530iaapU
         FE4vZHhEoaGO/hbZ09VaEXxQQp/oG+4t6Qpe+dTwph2VdtT+vRcl2O0kAwWlB6duk8Ty
         hcWzLBoIbHMOiTbq9Diix/vBTx+yaPK3oy3APIPjcc3QKrAqxqiL9LE/Z/9XbXp/2KPg
         XKzv7VbE8qrn1iJZVzNc/ZCZj6sRqOIrmVkpVY4bqSwSUKnO2S/jnNecvLeCo1PvwCVF
         PIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+nlth2m2/8vEMrI+L6F6FH19lBWEC80x5zsmEulcRdg=;
        b=BDGvde29UniDMjKLzf4gSlaRk8NOMVu1Hkuyoqbr5KCbsZ+rYR/4egXEpTvRBSp/yZ
         RAmid4qyPY4Wr2n/+2EYYVpIiPK7A2T0gk+FlCgkMbIZ1Efo8el+Q6dNcOIY6dX20Uv1
         mKkfKv8RTQ9G4zWf4P5coGCxNcAd4/SjZeMQuFdvyshFkKz8/q9G5viJFhKMcWQOXGk+
         JB/IBrnqu9XSugwBrCSPDTtMxLC7IJi58Cvjg+eKV2m0M12IQrkdczEzoPr3vQGwR5XG
         NTyUQ47+qCoHs56ire/Sj6jE7XbmJA53uQRTNq+hifX7tXMYcm3HvOFUW3NlON/Ripju
         LOiA==
X-Gm-Message-State: AOAM531ahAGeMFzUizXQ1cmqfqoIQ1VIEqYdA8I/Wl/y2cyPG2Vs8DBV
        Vj9NnQl7bclaN274OmxNpnhnJg==
X-Google-Smtp-Source: ABdhPJzSmpuPIP2d34jUR2jqTDBFOBvYKrEVvvPQKSyNt2dSiaVP/k3rv6EG6BE3se58Rqfv/meEbw==
X-Received: by 2002:adf:f74f:: with SMTP id z15mr4775150wrp.54.1628163615719;
        Thu, 05 Aug 2021 04:40:15 -0700 (PDT)
Received: from google.com ([109.180.115.228])
        by smtp.gmail.com with ESMTPSA id y197sm9290958wmc.7.2021.08.05.04.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 04:40:15 -0700 (PDT)
Date:   Thu, 5 Aug 2021 12:40:13 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Vincent Pelletier <plr.vincent@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Support Opensource <support.opensource@diasemi.com>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Opensource [Steve Twiss]" <stwiss.opensource@diasemi.com>
Subject: Re: [PATCH v3 1/3] mfd: da9063: Add HWMON dependencies
Message-ID: <YQvOHWAwG2xTIWMy@google.com>
References: <c06db13bb5076a8ee48e38a74caf3b81e4a2d1f8.1625662290.git.plr.vincent@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c06db13bb5076a8ee48e38a74caf3b81e4a2d1f8.1625662290.git.plr.vincent@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 07 Jul 2021, Vincent Pelletier wrote:

> From: "Opensource [Steve Twiss]" <stwiss.opensource@diasemi.com>
> 
> Dependencies required for DA9063 HWMON support.
> 
> Signed-off-by: Opensource [Steve Twiss] <stwiss.opensource@diasemi.com>
> 
> Moved temperature offset reading to hwmon driver.
> 
> Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>


Nit: Please remove the empty lines between tags.

And format like this please:

[vincent: Moved temperature offset reading to hwmon driver]

> ---
> Changes in v3:
> - moved temperature offset reading to hwmon driver
> 
> Changes in v2:
> - registers.h changes moved from patch 2
> 
> Originally submitted by Steve Twiss in 2014:
>   https://marc.info/?l=linux-kernel&m=139560864709852&w=2
> 
>  include/linux/mfd/da9063/registers.h | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

Once fixed:

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
