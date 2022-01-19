Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B34494025
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jan 2022 19:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243215AbiASStQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Jan 2022 13:49:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21197 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235432AbiASStN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jan 2022 13:49:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642618153;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+qsGrcyTaM8HFYRYbt26Hs5PWVlx1EPqUOLucipU7Mg=;
        b=CljCLsl/LxKLLJ2O0Eqo0ks61JrNfcVBnCMXIpB6/UGZcUSqhBWrxl7darZr5psbmOUQOV
        leD0C8qCGLfDBd32CLwZEWfVDrsd0EgOi5ujMFPJ6zO8E9Yt8kMgEvQFfeOSEzi2yr5P/X
        LBLodxudeMhj2zIDpnUTb7a520Rwp4k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-ASBOd3UlN2aD4aYx94-Wzg-1; Wed, 19 Jan 2022 13:49:11 -0500
X-MC-Unique: ASBOd3UlN2aD4aYx94-Wzg-1
Received: by mail-wm1-f70.google.com with SMTP id c16-20020a1c9a10000000b0034dd409329eso1200049wme.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Jan 2022 10:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+qsGrcyTaM8HFYRYbt26Hs5PWVlx1EPqUOLucipU7Mg=;
        b=kJJ6o6hoaJgqsxSBbN506q63Ncusmc96dbrLA33KQj8mtBAje1QYxlRzhcJVUlS6EW
         hnOuq8kun3RbrExurKYvxEJMYcUvtWnEJdsazjGq4XDloC33s5/jDWDKW5c/ZXGx7CUQ
         lo8dfxeLY9fPYDwO4PfhFz5dcYQ3SqJg/c8UjtXpdbAoO5KRohSAvs/np29SqqlEL7Q+
         0g1RbiJYzYk28JSJEuU3rhAQrcrr6V/GIjwjEflwzXETS4WjZTgl5nZG3agritsJpp5h
         egM5B+KKILR7dVKdBespY4gjOT+ehQO+m+4J/yHvxe7aMzA5xzaKZt2ReZC0u3yr3PPx
         n0sg==
X-Gm-Message-State: AOAM53291X97MbjdbeDzgiJYEfQlOMYhR1+9uT2bDcXFxe4bNI9G5bpg
        U0+rDpCVloury09YilPORnmr4OEnmPhFHvUE7oBQu/FTAeGIV8TcgeU1+dlY4wOtAuFVzlwF8c2
        MaqyrorHnEs/QFNajXnH0
X-Received: by 2002:a1c:a141:: with SMTP id k62mr4869497wme.172.1642618150568;
        Wed, 19 Jan 2022 10:49:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1Kpf6+uldWTCRbZxkUHsgH8cpaLkeUTvW0fxHVDLydb9/z+nKUZFDPKeoNORBlQm9BC+hAA==
X-Received: by 2002:a1c:a141:: with SMTP id k62mr4869467wme.172.1642618150314;
        Wed, 19 Jan 2022 10:49:10 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o3sm835397wry.30.2022.01.19.10.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 10:49:09 -0800 (PST)
Message-ID: <bb01c544-66aa-b470-5b09-18f6e42d941a@redhat.com>
Date:   Wed, 19 Jan 2022 19:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 00/10] drm: Make drivers to honour the nomodeset
 parameter
Content-Language: en-US
To:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Brian Starkey <brian.starkey@arm.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Fabio Estevam <festevam@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
References: <20211222082831.196562-1-javierm@redhat.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20211222082831.196562-1-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/22/21 09:28, Javier Martinez Canillas wrote:
> The nomodeset kernel command line parameter is used to prevent the KMS/DRM
> drivers to be registered/probed. But only a few drivers implement support
> for this and most DRM drivers just ignore it.
> 
> This patch series is a v3 to make DRM drivers to honour nomodeset. It is
> posted as separate patches to make easier for drivers maintainers to ack
> or pick them independently at their own pace.
> 

I've pushed this series to drm-misc-next.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

