Return-Path: <linux-doc+bounces-2840-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AAC7F3E38
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 07:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C8B92814DF
	for <lists+linux-doc@lfdr.de>; Wed, 22 Nov 2023 06:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB9B46BB;
	Wed, 22 Nov 2023 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZgHBQmr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B83B9;
	Tue, 21 Nov 2023 22:35:23 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5cca712b715so491847b3.1;
        Tue, 21 Nov 2023 22:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700634923; x=1701239723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2hd1Zq/k/Ryf9wFcKS5fdo6xT3mq9vfnmVd+Mv4TFts=;
        b=NZgHBQmrBzZsEnpgDBh0poPGdJnQddYl7iddEI2YXgJSQFp5qf5kXmOmizc4+Me3HX
         q/wjzmo2C7tD8BZruKjrAGQ4gIN5TPntq4Yw680KesdQswlK55bQPcRLTExHAbnRPgUr
         VvNwR03/ipoTgQR3sSpVm7jvD/YvfUma0SeYTBCD756KMCYMqLmxpiGH9Y64KmIDd+ru
         FiPD8lvldi2rVgq+vp8nsb8foYERarEoU0N+7zEYv3FKP02rNPTgwTyIve0NUeCUnRqr
         vawE+rbfek8kk6A1O+SK0emlNlZcmXKN2FzSbfakn0VEthB0eyT0hRHwZsH6RtVt70Sb
         LjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700634923; x=1701239723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hd1Zq/k/Ryf9wFcKS5fdo6xT3mq9vfnmVd+Mv4TFts=;
        b=F388FcAKEBNCuJ1sxEVFVrDvbZu2s03CqYdf4kLyiHkdkkG4bYTrcWnIxYAQCtDTdJ
         HACmjj1lCDu2/nt2/91I+sby/F/fZLS62FZEWf13VgVJZf57M86W80Uz8WxO2E94eFPk
         blh5dVmFkKxDcl/EdHfYRK4FHe+LbA2n/D7We/ZWWbk2wHpt/sN7dG9YPPFgFHDcu2ht
         3a7+cpCAO5lcwogkNHoidEk1UTbyrWUYtvbjdxMHIOEyvgxVOukDMmGDVcAM38dCX3nX
         MmGBXRsNikLNb7W7Cyqz1WKpSmUFP4gnvQiJR/bDkMA5TVPten2UWKDyULpnouF7WsnV
         KXdA==
X-Gm-Message-State: AOJu0Ywio/BOFEBtrEqky0UT0X7eiX/dv49h65gHYwv5E7Ag/dXYWjtu
	H/tyigFwIVMi59I9avZdTQI=
X-Google-Smtp-Source: AGHT+IHkQGhD2tzW6STYSWSP3lfwFAkGHoWOT84cZkqUrHPWgxtYXhS1Xsgol/4iG/PyhIytmp0hMg==
X-Received: by 2002:a81:a091:0:b0:5c4:61b5:5ac6 with SMTP id x139-20020a81a091000000b005c461b55ac6mr1269540ywg.7.1700634922828;
        Tue, 21 Nov 2023 22:35:22 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x19-20020a0dd513000000b0059f4f30a32bsm3507691ywd.24.2023.11.21.22.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 22:35:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d3790e91-d7c9-4b8d-9871-1765d693707e@roeck-us.net>
Date: Tue, 21 Nov 2023 22:35:19 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] hwmon: pmbus: Add adm1281 support
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20231122032343.2794903-1-Delphine_CC_Chiu@wiwynn.com>
 <20231122032343.2794903-2-Delphine_CC_Chiu@wiwynn.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231122032343.2794903-2-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/23 19:23, Delphine CC Chiu wrote:
> Add device type support for adm1281
> 

s/device type/chip/

> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>   Documentation/hwmon/adm1275.rst | 8 ++++++++
>   drivers/hwmon/pmbus/adm1275.c   | 8 ++++++--
>   2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.rst
> index 804590eeabdc..47a13b56e086 100644
> --- a/Documentation/hwmon/adm1275.rst
> +++ b/Documentation/hwmon/adm1275.rst
> @@ -43,6 +43,14 @@ Supported chips:
>   
>       Datasheet: www.analog.com/static/imported-files/data_sheets/ADM1278.pdf
>   
> +  * Analog Devices ADM1281
> +
> +    Prefix: 'adm1281'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +

Another undocumented / unpublished chip ?

If so, at say something like "Not publicly available".

>     * Analog Devices ADM1293/ADM1294
>   
>       Prefix: 'adm1293', 'adm1294'
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index e2c61d6fa521..979474ba6bd3 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -18,7 +18,7 @@
>   #include <linux/log2.h>
>   #include "pmbus.h"
>   
> -enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
> +enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1281, adm1293, adm1294 };
>   
>   #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
>   #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
> @@ -362,6 +362,7 @@ static int adm1275_read_word_data(struct i2c_client *client, int page,
>   		ret = -ENODATA;
>   		break;
>   	}
> +

Please refrain from making cosmetic changes like this.

Thanks,
Guenter

>   	return ret;
>   }
>   


