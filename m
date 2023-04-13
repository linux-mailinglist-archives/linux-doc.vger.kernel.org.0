Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B06BC6E0831
	for <lists+linux-doc@lfdr.de>; Thu, 13 Apr 2023 09:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjDMHtf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Apr 2023 03:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbjDMHtd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 03:49:33 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F4C93D1
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 00:49:06 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-94a34e3526fso328855066b.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 00:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681372144; x=1683964144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0c4wLhFBCiAcjjbeOa5jABwRP5DFI69Pbg7hP6byo5Y=;
        b=BceMhjYoTf/jVj4ZdOfZAmdXc1J1JKQQg2gDJBriG6HwIgqQa+TXhTrSgKSZqoDwGB
         fxxNkkFJzz3+LPIPCcTrTXKUzkxMJKM15KMVbrHVfbNBhCLcgfhYV1M10c+aUBsJSiCt
         6By92BXEHv2K4uCb2yNV5AQowESEtaDAb106riHjBqPBR5dXnbMbxbS2R65tGyqVEUrI
         yhvp/oQ2CTyQUzXofZPoMMGkZTiH398qKqWOrfWU5M2rj8Cj/GGsudekAFQtnto+GRWt
         B7nJbvo5WYPQQjH38U2tCqAOXitUQPyyxU36VtV8LtG4it4DbZL5PnPdj6iIg8vvKzNJ
         vE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681372144; x=1683964144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0c4wLhFBCiAcjjbeOa5jABwRP5DFI69Pbg7hP6byo5Y=;
        b=IVChl3v85Mw0FpFjivX8J7GMVsM2ydBs9ynUElK5+4oKpaXaTkXE+DlieL3J3aUC8n
         AdlvzIs2iIVnNWAndRlwuSD6z/b7HA4lQbvm6z9LLh71mVrzWm7Ps6bf4/JBp1rDh5+r
         jvk1Ut24Q9B/GD+w0/92s7AR7nQO9y2HtseVoSDK37cs/eNzxxKoT2x5FI3aZ84dD3DX
         zA8x0qDW4dWskejcK7WXbIAr5klKcJyqO6jZOxQJW9pkIWV4GcJpwSz0IUQXHFfcJIbd
         Tk1CM+S2vgbsV2hCRKxGsCQ9fFnTuyNH57M8SvwwBY9N9CgKcv4tiOg3iM4o2Pja3FU0
         dVxA==
X-Gm-Message-State: AAQBX9dZKFhnZ+WC2tGLiwvQGq/liMf4Xgut3jyICjUJRBX4SNZb1wqa
        vspaDlBs6EwdFlMGEyOgKLezUg==
X-Google-Smtp-Source: AKy350YbuGbPy57eqcdQLbG1h6GrL64vwjvVuJuqM/r/TYOQUCL0VheUuXgUL2yMgaNE1GwSq69GUA==
X-Received: by 2002:aa7:c2d4:0:b0:501:fe52:d301 with SMTP id m20-20020aa7c2d4000000b00501fe52d301mr1684934edp.23.1681372144162;
        Thu, 13 Apr 2023 00:49:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7? ([2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7])
        by smtp.gmail.com with ESMTPSA id s2-20020aa7cb02000000b004bd6e3ed196sm463252edt.86.2023.04.13.00.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 00:49:03 -0700 (PDT)
Message-ID: <342b3e6c-fd1b-d256-bcc2-2b9bda206b60@linaro.org>
Date:   Thu, 13 Apr 2023 09:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] [PATCH v1 1/2] dt-bindings: hwmon: add MAX31827
Content-Language: en-US
To:     Daniel Matyas <daniel.matyas@analog.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230412153334.181852-1-daniel.matyas@analog.com>
 <20230412153334.181852-2-daniel.matyas@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412153334.181852-2-daniel.matyas@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/04/2023 17:33, Daniel Matyas wrote:
> MAX31827 is a low-power temperature switch with I2C interface.
> 
> The device is a ±1°C accuracy from -40°C to +125°C
> (12 bits) local temperature switch and sensor with I2C/SM-
> Bus interface. The combination of small 6-bump wafer-lev-
> el package (WLP) and high accuracy makes this temper-
> ature sensor/switch ideal for a wide range of applications.
> 
> Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
> ---
>  .../bindings/hwmon/adi,max31827.yaml          | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
> new file mode 100644
> index 000000000000..37177eb9c039
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/adi,max31827.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices MAX31827, MAX31828, MAX31829 Low-Power Temperature Switch
> +
> +maintainers:
> +  - Daniel Matyas <daniel.matyas@analog.com>
> +
> +description: |
> +  Analog Devices MAX31827, MAX31828, MAX31829 Low-Power Temperature Switch with
> +  I2C Interface
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,max31827
> +      - adi,max31828
> +      - adi,max31829

Why suddenly these are all incompatible? This is not what I suggested.

> +
> +  reg:
> +    maxItems: 1
> +

Best regards,
Krzysztof

