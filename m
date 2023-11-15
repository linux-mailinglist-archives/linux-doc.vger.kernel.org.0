Return-Path: <linux-doc+bounces-1964-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCD87E5D19
	for <lists+linux-doc@lfdr.de>; Wed,  8 Nov 2023 19:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E02BB20BC4
	for <lists+linux-doc@lfdr.de>; Wed,  8 Nov 2023 18:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C00D358A2;
	Wed,  8 Nov 2023 18:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F1332C67;
	Wed,  8 Nov 2023 18:21:38 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6404ED4F;
	Wed,  8 Nov 2023 10:21:38 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6ce2cf67be2so4300335a34.2;
        Wed, 08 Nov 2023 10:21:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699467697; x=1700072497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8YDEMLMN/UPwuHPhRNHU6MkX7vnIvjMYf9zFqGmA3g=;
        b=X2SdbRg0il2O4Perq5BRn9QXzs/ucXLuNAhMbAib+hqb9+OpmK2YQyNjFSTtjen5FO
         eFEWuHBlgkU5lvQrBW2QsIlh5T9ePLvHD8p4xgj/Lh3ufLEPkIHyb2aoa62MU3PaR4aY
         Jt/2uzh10mDZDO/zDP90G0eMf5WyYQQrxnVZBt8pUVGPu/3FNDsYINY9bMakuQQozT0w
         a7wJK/vZ5VaoMaFhpxb+LCxILZvijnWTV/T69MMxiEvEzwoItr3Betl/5TmzMjuA9pO/
         ku3mNxYAM9I9IfykAzUO/mdF7bSLgHt6PqPud9QCh9r+8OaZ+mpbqG5PLb6nzx5pE3bl
         FGWw==
X-Gm-Message-State: AOJu0Yybz8/58MZqyK6SB6p3vwL0vRxD/Teiluh0ilG7G7oSzXew0v6b
	uaLciGZ5dQourXiZaJ8pfw==
X-Google-Smtp-Source: AGHT+IH936tksBL7gMvhFH0Cu8Ga+1XdgbOvw2iCgQmNwYAwBNf4BgvoX3nEqEXZcFtRnb72jnyg2w==
X-Received: by 2002:a9d:4801:0:b0:6d3:194f:f132 with SMTP id c1-20020a9d4801000000b006d3194ff132mr2370150otf.30.1699467697587;
        Wed, 08 Nov 2023 10:21:37 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id dw1-20020a05683033a100b006ce46212341sm1966690otb.54.2023.11.08.10.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 10:21:37 -0800 (PST)
Received: (nullmailer pid 2703586 invoked by uid 1000);
	Wed, 08 Nov 2023 18:21:35 -0000
Date: Wed, 8 Nov 2023 12:21:35 -0600
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, krzysztof.kozlowski+dt@linaro.org, joel@jms.id.au, andrew@aj.id.au, corbet@lwn.net, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, p.zabel@pengutronix.de, naresh.solanki@9elements.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org, BMC-SW@aspeedtech.com, patrick@stwcx.xyz
Subject: Re: [PATCH RESEND v10 2/3] dt-bindings: hwmon: Support Aspeed g6 PWM
 TACH Control
Message-ID: <20231108182135.GA2698015-robh@kernel.org>
References: <20231107105025.1480561-1-billy_tsai@aspeedtech.com>
 <20231107105025.1480561-3-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107105025.1480561-3-billy_tsai@aspeedtech.com>

On Tue, Nov 07, 2023 at 06:50:24PM +0800, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-pwm-tach device, which can
> support up to 16 PWM outputs and 16 fan tach input.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> new file mode 100644
> index 000000000000..c615fb10705c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2023 Aspeed, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/aspeed,g6-pwm-tach.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED G6 PWM and Fan Tach controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |
> +  The ASPEED PWM controller can support up to 16 PWM outputs.
> +  The ASPEED Fan Tacho controller can support up to 16 fan tach input.
> +  They are independent hardware blocks, which are different from the
> +  previous version of the ASPEED chip.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-pwm-tach
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +patternProperties:
> +  "^fan-[0-9]+$":
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +    required:
> +      - tach-ch
> +
> +required:
> +  - reg
> +  - clocks
> +  - resets
> +  - "#pwm-cells"
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    pwm_tach: pwm-tach-controller@1e610000 {
> +      compatible = "aspeed,ast2600-pwm-tach";
> +      reg = <0x1e610000 0x100>;
> +      clocks = <&syscon ASPEED_CLK_AHB>;
> +      resets = <&syscon ASPEED_RESET_PWM>;
> +      #pwm-cells = <3>;
> +
> +      fan-0 {

I assume there's a PWM connection here? How do you know which PWM? You 
said the tach channel is independent, so it is not that.

It should not be 0 from 'fan-0' because that's just a meaningless index. 

You either need 'pwms' here or you can use 'reg' and the reg value is 
the PWM channel.

> +        tach-ch = /bits/ 8 <0x0>;
> +      };
> +
> +      fan-1 {
> +        tach-ch = /bits/ 8 <0x1 0x2>;
> +      };
> +    };
> -- 
> 2.25.1
> 

