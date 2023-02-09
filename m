Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15E086903B6
	for <lists+linux-doc@lfdr.de>; Thu,  9 Feb 2023 10:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjBIJan (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Feb 2023 04:30:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbjBIJam (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 04:30:42 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED8C611D1
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 01:30:40 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id bg26so1021170wmb.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Feb 2023 01:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4feielQWuDIt1pW+0VIzkBUGQbtqwZGLuVccBda76iw=;
        b=ELRGeaICPjKmIFb0rFTLQceXoPsB4DjfxsSuePte8ZV4Cbnl4mPNLuHj5fm/gUguEG
         VDW4+19up5meaYBbMzPWCdAM7GW8WexAzOQrVfLNXvi4yhi3DO9bQE9B04hkHBoUjjNM
         vwQVXsLiiRM3p9mzwdwKrOLuFd0NhC9vSD1IwpsPy6J8T5AAV4M6YwB14xYPnNpumdOP
         hRcCQummzTuQt/NlCWPoRX8QZWvmNPZ8zb8Mi+ZOlcSZ6/hR63CMFPNNOkhnmBnqVS01
         xwuTWCFkQl0OEaqXg8UIG4Uam8EtS1+tokTzucSTMtRwB/9Kzfe+wxn+7xBctWp1Axn0
         TwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4feielQWuDIt1pW+0VIzkBUGQbtqwZGLuVccBda76iw=;
        b=Nb74xAI3Tcqn17dWhFs8ATxCra54jTIsC6G4LqumaHYRr2s8v9reSiE9jv950iHs5Z
         vwqhpxws/vmcdkwWM8XGiSrVHeGT+UGOaBj1I3fs6dvjmlwN6mDU42QEkJRAu90i1zvV
         LOPoQaRDroaP09XyDRmLK1cYFBpLRFvfldhfXPDAjtUTLS+JgPSP13g2PJVdvajyMcsh
         cYnigTIiYFBHhqX0YJJt8Oq/0e4mHgRzMRKmrFM5CrrEnMSfBg8BGo5jqzGIcpAiPugz
         /S+kKZYrswdJ8E6lDB5RBaZonkZ950g28zdv7owISA/kxkE5vlv7EytpC70ThepWp7pC
         L/Pg==
X-Gm-Message-State: AO0yUKVa007cgiNFd5/5Kqfa4y/fwcxqewKM8VaKEVOdDCG5H6G5oGr6
        9fkH71Mc7QsP6Qvt1Dxg1Va4pw==
X-Google-Smtp-Source: AK7set9zzTouo5DuxZavthCwhJ9UzxeJ3yZkjlwz0rAqtPF4TRq1WAJN5o/OdoY3L3ra+uZf2gp6QA==
X-Received: by 2002:a05:600c:180f:b0:3dc:557f:6126 with SMTP id n15-20020a05600c180f00b003dc557f6126mr12404547wmp.4.1675935039001;
        Thu, 09 Feb 2023 01:30:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c450700b003dc42d48defsm1511532wmo.6.2023.02.09.01.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 01:30:38 -0800 (PST)
Message-ID: <5512bd3a-f4b5-1f65-c9eb-b5c8bcac7514@linaro.org>
Date:   Thu, 9 Feb 2023 10:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/11] dt-bindings: arm: sti: remove bindings for stih415
 and stih416
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
        Daniel Lezcano <daniel.lezcano@linaro.org>,
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
 <20230209091659.1409-6-avolmat@me.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209091659.1409-6-avolmat@me.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/02/2023 10:16, Alain Volmat wrote:
> STiH415 and STiH416 platforms are no more supported hence remove
> the bindings for those two platforms.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

