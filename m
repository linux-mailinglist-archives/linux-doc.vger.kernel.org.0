Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB0CA798392
	for <lists+linux-doc@lfdr.de>; Fri,  8 Sep 2023 09:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbjIHHxb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 8 Sep 2023 03:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjIHHxa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Sep 2023 03:53:30 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE591997;
        Fri,  8 Sep 2023 00:53:25 -0700 (PDT)
Received: from [192.168.1.23] (unknown [171.76.82.102])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: vignesh)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id DEF3566072A2;
        Fri,  8 Sep 2023 08:53:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694159603;
        bh=1Be9Ga17gksJsOil0d5EZoQWNEzJGykPqruhkf331P8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=AZ8K5q+HuIaaU6/G04eKJSX0xrkxKxQB3FT9sj7Ftu3/eZFbcjcUuN0wZDB1Uru/+
         SRRAaZZY9CpqexRRTVJwqqy2gLir7pE2gZVNT1DV4X/m0nKY7UEX8kzAk1oZgSXQdL
         Lmq3zfkiEKO5O28VvgFGJu7mu2A9LXIHs4XR/1wUMTNnQo25S7RIs7xdl152ZM7Lwk
         lZi/4cDySYL16Pemg1Mc/OnqIxALgeq5SLlrMVZt/Gj/AY3Xl27NJXEHwaFZnjvpyL
         DFbNN+wBQgmXV+uLAfoCeQfeyyzzPlysSiOmAuLvMu3+DuB7yAYXGyUnQUfJlUSQrX
         Oj81GmCXY/TKg==
Message-ID: <ff99380a-cb0d-dc6c-0442-7aa60d14cec2@collabora.com>
Date:   Fri, 8 Sep 2023 13:23:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/6] drm: ci: Enable configs to fix mt8173 boot hang issue
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        dri-devel@lists.freedesktop.org,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     helen.koike@collabora.com, guilherme.gallo@collabora.com,
        sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
        daniels@collabora.com, emma@anholt.net, robclark@freedesktop.org,
        gustavo.padovan@collabora.com, robdclark@google.com,
        anholt@google.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        daniel@ffwll.ch, corbet@lwn.net, neil.armstrong@linaro.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, heiko@sntech.de,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-rockchip@lists.infradead.org
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
 <20230825122435.316272-5-vignesh.raman@collabora.com>
 <6da8136b-be1f-6867-b2af-c636877ef189@collabora.com>
From:   Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <6da8136b-be1f-6867-b2af-c636877ef189@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Angelo,

On 07/09/23 16:16, AngeloGioacchino Del Regno wrote:
> Il 25/08/23 14:24, Vignesh Raman ha scritto:
>> Enable regulator
>> Enable MT6397 RTC driver
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>   drivers/gpu/drm/ci/arm64.config | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ci/arm64.config 
>> b/drivers/gpu/drm/ci/arm64.config
>> index 817e18ddfd4f..ea7a6cceff40 100644
>> --- a/drivers/gpu/drm/ci/arm64.config
>> +++ b/drivers/gpu/drm/ci/arm64.config
>> @@ -184,6 +184,8 @@ CONFIG_HW_RANDOM_MTK=y
>>   CONFIG_MTK_DEVAPC=y
>>   CONFIG_PWM_MTK_DISP=y
>>   CONFIG_MTK_CMDQ=y
>> +CONFIG_REGULATOR_DA9211=y
>> +CONFIG_RTC_DRV_MT6397=y
> 
> I wonder if it'd be a better idea to simply add those to the defconfig 
> instead as
> 
> CONFIG_REGULATOR_DA9211=m
> CONFIG_RTC_DRV_MT6397=m
> 
> Any opinion on this? Matthias? Anyone else?

CONFIG_RTC_DRV_MT6397=m is already present in defconfig.
We can also add CONFIG_REGULATOR_DA9211=m to defconfig.

Regards,
Vignesh
