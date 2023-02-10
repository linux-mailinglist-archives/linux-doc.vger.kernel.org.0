Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D90D692562
	for <lists+linux-doc@lfdr.de>; Fri, 10 Feb 2023 19:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbjBJSeK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 10 Feb 2023 13:34:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233005AbjBJSeJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Feb 2023 13:34:09 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA2E6C7C8
        for <linux-doc@vger.kernel.org>; Fri, 10 Feb 2023 10:34:06 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id o18so5945074wrj.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Feb 2023 10:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=itUHF+gJAOR68gNrNXTOhv2YTwp1LN4BGzGEfAiI2PA=;
        b=OaHJvANNeMAGzvf2uYI2xzLCi6qVzIoIMRJNUMUHlzvdQB4946tyfjwuc64G0AuREt
         YuNu/sR7FoiaVytT1wVaU5lS9eCpEu+2qZzqFTXe8g0PKYQ8cn7vuhmv1w2DLp6+rjPA
         VwOA/5nkkyxSNWkLJwLwBdi4zTMzi2yWNOmuPS3e0bp1oXuv0KGwifRBRdkJDANIcHba
         R3SJAVIxCBohLDCUmxIZjPJ21/NShmd2frAAkS2VIIGuJGHBcjEwfjIq9x3inxKTiZ9g
         VG+SmLQxhW1N+uckd3zByXCY+rK10AxGZ+y40dNt15bf8dXcveDzkzi962Xg7HQX+XtT
         EisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=itUHF+gJAOR68gNrNXTOhv2YTwp1LN4BGzGEfAiI2PA=;
        b=Joh5GrrPRdiezJzCsD1TUhmioJWpcUalH6D2MpU/F3wndT08dK3YqeJBRKfLl9dD7E
         pqoUM6G7nqbIkydxDniu1aAt7SWW61jgtV3vxZcEL9jodgnGulygzr59wRdBrVwDneNq
         E2XOc9QjRUVZNjdyAaoIQl1bBWjZE/fVMJ9Z6RS+dl9UlqyZKPBR2tzPvwSc/fTHEqsJ
         +lobMnph1/kL2Onrzfz5f8Z7p2dnjIDHvXPiERzW1/LZiTLgi/DYAd4K5pyUOkX42lqO
         zdwkqICBEWlF0sgPOb7/xcwp4k3few34tit4GM8Ukmd8EI6U+rLEgedXCK/IYUVxXyl1
         P0hA==
X-Gm-Message-State: AO0yUKULOr9O/8kqFisED3t64UeXk75gY9DFRklsVl7Efc6CPOu2GeAa
        I/+MSLZmYHGZIJXvJlwGVHqbrg==
X-Google-Smtp-Source: AK7set+sfAI5v+pm+Ta+c+I585wZnYR7ZKSMkHtr+epDPjtPngGn8hHOvj4Pt1bfuGTly/qfkXFNSg==
X-Received: by 2002:adf:f80c:0:b0:2c3:cdcd:f0b3 with SMTP id s12-20020adff80c000000b002c3cdcdf0b3mr13276955wrp.9.1676054045329;
        Fri, 10 Feb 2023 10:34:05 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id i12-20020a5d438c000000b002c512f56859sm4135084wrq.70.2023.02.10.10.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 10:34:04 -0800 (PST)
Message-ID: <8f557084-e185-6bf5-ab2b-4e1ebf4fc516@linaro.org>
Date:   Fri, 10 Feb 2023 19:34:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/11] thermal/drivers/st: remove syscfg based driver
Content-Language: en-US
To:     Alain Volmat <avolmat@me.com>, Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230209091659.1409-1-avolmat@me.com>
 <20230209091659.1409-7-avolmat@me.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230209091659.1409-7-avolmat@me.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/02/2023 10:16, Alain Volmat wrote:
> The syscfg based thermal driver is only supporting STiH415
> STiH416 and STiD127 platforms which are all no more supported.
> We can thus safely remove this driver since the remaining STi
> platform STiH407/STiH410 and STiH418 are all using the memmap
> based thermal driver.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

