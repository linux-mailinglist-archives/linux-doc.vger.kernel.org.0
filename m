Return-Path: <linux-doc+bounces-2042-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D21FC7E66B1
	for <lists+linux-doc@lfdr.de>; Thu,  9 Nov 2023 10:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E1ACB20CAD
	for <lists+linux-doc@lfdr.de>; Thu,  9 Nov 2023 09:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAE711C8D;
	Thu,  9 Nov 2023 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GI+99Eeo"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D33C111B2;
	Thu,  9 Nov 2023 09:25:44 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D098F2139;
	Thu,  9 Nov 2023 01:25:43 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53de0d1dc46so940607a12.3;
        Thu, 09 Nov 2023 01:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699521942; x=1700126742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ddej5Z7ryYHDYb4qxJnL2aZwUgy5ZEhIdMI6qR7wpaw=;
        b=GI+99Eeo8UFqvGatQqkUdBlK4oDA3WEJVOmEwYVcHYhSKN3OkfyYsjW7tv3TJf424R
         6wsppVltyUrCBUAzQVYnYkJxLatEzUyZ+M6JhjLmwB9izhyO6fEa8dyJEMXS+gfu2YIu
         vdbngpLVll1imsCkZf9zARFKFoz1cT8ra2FW+ugX6uVBZSUmajO/I/sp2EhwGBMCDyRP
         ixaKgb72Hx18WTWVTA7PCvXUAdtk1j+5vc+XRcPT9EBMH3bngC3KnWs+gcXnxwwCNbdH
         NFqm7tQ/YX34Krq7zoXeuBu1sS/XJ5ryQ1I6PID4kdPqrNqhZwEQyqKnL1eHqpDfPx6v
         BItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699521942; x=1700126742;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddej5Z7ryYHDYb4qxJnL2aZwUgy5ZEhIdMI6qR7wpaw=;
        b=PrQc0ChdHbYVQmd3qx13Wff5f+R2ovrAHcfMvFBkGk+f3M4rDf++1lbSDiyepeJ600
         lTdWn5DIeu4X/gXVblLFMQTKo00x6h+8Dcei16t82cbkbbOQ2OJVi/gy99O1UTEgaviZ
         r6CFyl5sFRl5NtTfjIZFoxnagIuCyxdFJU7yZ3U4cNXNjCLoKsFfdfsh1cAcK70fg374
         pGPkq4HteaAqYBCupdNzLgFLd4huVJVs0vkpzTT3k//V5CXAhdV58633wYK3y1Ys08uu
         3ud76ajZFKE5mZstckHn6OZLJZTtcBO6LOPSjVvg1sog8BcOgUks08Sess0v7hUoZ1xA
         GPEw==
X-Gm-Message-State: AOJu0Yw9IO2gvRk834hfaE2EeKcXAuTBgNQgylXOHUdRovyt0WlX+05D
	ryWHUarPhhxI7/IWIDfIfLw=
X-Google-Smtp-Source: AGHT+IHZdY3pka+WKekBvYUW5O/rL60aoxPkmRMx8rYdYWSm08uUzEWUZ9oizBi2QAqpAcbVdrb2lg==
X-Received: by 2002:a17:907:97cd:b0:9be:562:a44a with SMTP id js13-20020a17090797cd00b009be0562a44amr3421131ejc.23.1699521941746;
        Thu, 09 Nov 2023 01:25:41 -0800 (PST)
Received: from [192.168.100.74] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id m9-20020a1709060d8900b0099cd1c0cb21sm2249008eji.129.2023.11.09.01.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 01:25:41 -0800 (PST)
Message-ID: <b39e0a17-0a9a-482d-a584-db8bb79c75dc@gmail.com>
Date: Thu, 9 Nov 2023 10:25:39 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] dt-bindings: hwmon: Add Amphenol ChipCap 2
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20231020-topic-chipcap2-v2-0-f5c325966fdb@gmail.com>
 <20231020-topic-chipcap2-v2-4-f5c325966fdb@gmail.com>
 <008715d1-de4a-47dd-955c-e2fb7af36a25@linaro.org>
 <0b103837-54e7-430f-8a01-94b620b84f89@gmail.com>
 <9fb14ef2-ee2e-41c6-a080-01df2e947091@linaro.org>
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <9fb14ef2-ee2e-41c6-a080-01df2e947091@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09.11.23 10:20, Krzysztof Kozlowski wrote:
> On 09/11/2023 10:02, Javier Carrasco wrote:
>>
>>
>> On 09.11.23 09:53, Krzysztof Kozlowski wrote:
>>> On 08/11/2023 16:37, Javier Carrasco wrote:
>>>> Add device tree bindings and an example for the ChipCap 2 humidity
>>>> and temperature sensor.
>>>>
>>>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>>>> ---
>>>>  .../bindings/hwmon/amphenol,chipcap2.yaml          | 68 ++++++++++++++++++++++
>>>>  1 file changed, 68 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>>>> new file mode 100644
>>>> index 000000000000..8bb6daa293d3
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>>>> @@ -0,0 +1,68 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/hwmon/amphenol,chipcap2.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: ChipCap 2 humidity and temperature iio sensor
>>>> +
>>>> +maintainers:
>>>> +  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
>>>> +
>>>> +description: |
>>>> +  Relative humidity and temperature sensor on I2C bus.
>>>> +
>>>> +  Datasheets:
>>>> +    https://www.amphenol-sensors.com/en/telaire/humidity/527-humidity-sensors/3095-chipcap-2
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - amphenol,cc2dxx
>>>> +      - amphenol,cc2dxxs
>>>> +
>>>
>>> Nothing improved.
>>>
>>> Really, you just ignored the review.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> I am sorry if I missed something from your first review. I changed the
>> interrupt description to have one per item as you suggested and removed
>> the empty line. I did not change the compatible enum to add all part
>> numbers because it was still under discussion, but now that I know that
>> I have to add all of them, I will change for the next version.
> 
> And a new patch should not be sent while discussion happens. Literally I
> had no chances to respond to your comment and v2 appears.
> 
> Best regards,
> Krzysztof
> 
You are right, there is a lot to review and I should have gathered more
feedback. I will wait a few days to receive more input and in the
meantime I will add all part numbers (there is eight of them, which is
manageable) to the documentation and the device tables. Wildcards and
families will be dropped.

Thank for your feedback and best regards,
Javier Carrasco

