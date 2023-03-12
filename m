Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB9B56B679E
	for <lists+linux-doc@lfdr.de>; Sun, 12 Mar 2023 16:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjCLPre (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 12 Mar 2023 11:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjCLPrd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 12 Mar 2023 11:47:33 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0953F32527
        for <linux-doc@vger.kernel.org>; Sun, 12 Mar 2023 08:47:32 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id cy23so39220617edb.12
        for <linux-doc@vger.kernel.org>; Sun, 12 Mar 2023 08:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678636050;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v06rTjtysizk3dYCZcIUf1KvlS398ZKl4+/CAT/kS9s=;
        b=iRISoVV8Bpkzo5XBe3YglS/r/o2V3CnHOgvfpYeVIqu47OH+39HRNimnWye5ZYxzGg
         m2AesnWsr6oosg0kI7V/09MDBkT2vXH5t6mTK7wilMk4XTRpsEm7a2gHawrQny7GqmFi
         Jd3cvvG5C01lsUtB/WMKusrwVdANlqthSUKmTBSFrGFeB7bI044lRfjFKZx4jHdTfTCl
         0e6+UOVnI52EnESnl1iuLVj7r5jdxnxn9rSBViisqVgR/8jZyySWBkJbWPyB9Y8CEd2y
         EqWifTcAxsoqnZONaO0sCov/Cw28N5Ox0HZCHz98W+e4V5WiWLscJjVdYlEoa8ddkKwq
         IfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678636050;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v06rTjtysizk3dYCZcIUf1KvlS398ZKl4+/CAT/kS9s=;
        b=s318pb5nr5xbaANovaSgn8XM+pZJP0vxaKxGuyscQ8++1yL4dvqBe90ETHlLu6zUcM
         Q5tIfNoHRcQmq23QkJ452tHg+EMrO03xfZdCizidYSBkTmNiPg2Y1hPh98SHvEIHQKub
         TxNz/GrjUF184XXlS1nfcbSpb4LYNrH6fiaTcsPzhMAF1xgl81HXmM1/32l3MrO/BRmU
         n++ORRKoEDdUUQ58FVkBdne6hNTqyQhh+eBHWtkweKdt4BjmN3a+xeaNZcgMG4YAOpuB
         Zfp/5ixMNZdyo1O5XqBf+nVSWX9f39ObtiSYImoTEDzjlzBYBR/LThFna4QCd1NEOZvq
         lpEw==
X-Gm-Message-State: AO0yUKVEINRVpyF3aRW2sSPA1tKSHKeU5VlB203PWSYanLwrnTZReK+8
        lZKGkFH8LRL8szz99V1YJr5D1w==
X-Google-Smtp-Source: AK7set/8mnKxkBnVmeDGbrLKovb7mhQG1E1trFhSe8qzJNLReFB/XjWSIhrw/2G+mxb+U/KIS4YVkQ==
X-Received: by 2002:a17:907:a686:b0:902:874:9c31 with SMTP id vv6-20020a170907a68600b0090208749c31mr7146528ejc.35.1678636050540;
        Sun, 12 Mar 2023 08:47:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id t7-20020a50ab47000000b004cbe45d2db5sm2302101edc.37.2023.03.12.08.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 08:47:30 -0700 (PDT)
Message-ID: <f6d9c84a-1c75-d9b4-59ed-39d6c5b310a9@linaro.org>
Date:   Sun, 12 Mar 2023 16:47:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V3 2/6] dt-bindings: timestamp: Add Tegra234 support
Content-Language: en-US
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
References: <20230310190634.5053-1-dipenp@nvidia.com>
 <20230310190634.5053-3-dipenp@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230310190634.5053-3-dipenp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/03/2023 20:06, Dipen Patel wrote:
> Added timestamp provider support for the Tegra234 in devicetree
> bindings. In addition, it addresses review comments from the
> previous review round as follows:
> - Removes nvidia,slices property. This was not necessary as it
> is a constant value and can be hardcoded inside the driver code.
> - Adds nvidia,gpio-controller property. This simplifies how GTE driver
> retrieves GPIO controller instance, see below explanation.
> 
> Without this property code would look like:
> if (of_device_is_compatible(dev->of_node, "nvidia,tegra194-gte-aon"))
> 	hte_dev->c = gpiochip_find("tegra194-gpio-aon",
> 				   tegra_get_gpiochip_from_name);
> else if (of_device_is_compatible(dev->of_node, "nvidia,tegra234-gte-aon"))
> 	hte_dev->c = gpiochip_find("tegra234-gpio-aon",
> 				   tegra_get_gpiochip_from_name);
> else
> 	return -ENODEV;
> 
> This means for every future addition of the compatible string, if else
> condition statements have to be expanded.
> 
> With the property:
> gpio_ctrl = of_parse_phandle(dev->of_node, "nvidia,gpio-controller", 0);
> ....
> hte_dev->c = gpiochip_find(gpio_ctrl, tegra_get_gpiochip_from_of_node);
> 
> We haven't technically started making use of these bindings, so
> backwards-compatibility shouldn't be an issue yet.

Unfortunately, I don't understand this statement. The
nvidia,tegra194-gte-aon with removed property is in a released kernel
v6.2. What does it mean "technically"? It's a released kernel thus it is
a released ABI.

And since DTS always go to separate branch, your patch #4 breaks
existing DTS (return -ENODEV;) - it is not bisectable.

> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---


Best regards,
Krzysztof

