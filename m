Return-Path: <linux-doc+bounces-1924-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE67E567C
	for <lists+linux-doc@lfdr.de>; Wed,  8 Nov 2023 13:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC5252812F0
	for <lists+linux-doc@lfdr.de>; Wed,  8 Nov 2023 12:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1612EDF61;
	Wed,  8 Nov 2023 12:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Psu9YFrV"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDE363C1;
	Wed,  8 Nov 2023 12:44:57 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D171BF0;
	Wed,  8 Nov 2023 04:44:56 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9d10f94f70bso1038202566b.3;
        Wed, 08 Nov 2023 04:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699447495; x=1700052295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfIYw/eqVYS+oY4d930Rw+98Y2voJ1fI6YN4DdZy5xw=;
        b=Psu9YFrVuMTSGQu1GTHajw6CvqGbu7OQL/Ouqkq4R9O4EOAaJTSaYN2GW2+HPmEeb+
         70QOeL9k+b/eAzJFPYvEbn8HonlWjP8O6nI1Owa8SXnnVA1nQCbwfZ5pzRihXh/uCryC
         ZizHsnr1lJuYamdErkb/+Yw7BkvRDK3wIfhKJmzm9C3tN5lgkq9p1nqA/Dl/+deSlBjK
         kNDSs7JGQjMBu9xon1GadH4qzUVkmgsC3WE2shAHvQLjyo08CYLVv00/wuY+2khiRfi5
         Z5l/+3Tcj1G3w6poHwKd5saFMF0XGOSvKDrIv+mtjcgDcbRp40m4e7yc3YL25lneq11Z
         X6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699447495; x=1700052295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bfIYw/eqVYS+oY4d930Rw+98Y2voJ1fI6YN4DdZy5xw=;
        b=ZZn/w80VTWHedGYW691sFvd4WIpS4PHx4aeHQBXEtdNlUqyPHfmzcNwuN0sQ/PUut2
         wi9gd2WqLi1+w8xMoKqYSUMlo3Qr/M5q4vkW3gDDpohEk342797yhyT0SsmFOzCtsHXP
         Xcf5vfXwFvGc+bFPYCh8G8jFOfDVW/REvQq7vi4mQ9K8Hdl1tkzKmI/gMUwvHjF/eQ5Q
         iJ+CClefaG7YTAyy79AOk5zBSlCKuLuYG7H3vNQ2VotqpSsJ+JMkALzewWhIDWCO1Re9
         rM8Rmakysx6pbSjioJrqt1WEckw7UEvEnoFge9IDxQVXzyP5B8QjUwUbUyTHXe38S3zm
         2ZZA==
X-Gm-Message-State: AOJu0YwCD8cp1GdhujnDYadqHnshC8OR9aUdG16RYy6E6YblgMV2hqsA
	m8YhbpNvJBqff7/SuAm3x5k=
X-Google-Smtp-Source: AGHT+IHpd7EMYPwzVeWvMT/QxCTbAiO3+AWFKUFV0YS7L4f+kzaa4xw/++1WEvWsaPebdQlm/g8/ow==
X-Received: by 2002:a17:907:934b:b0:9c4:67f:3ef5 with SMTP id bv11-20020a170907934b00b009c4067f3ef5mr1448237ejc.50.1699447495312;
        Wed, 08 Nov 2023 04:44:55 -0800 (PST)
Received: from ?IPV6:2a02:8389:41cf:e200:8f74:d45a:3701:5b6? (2a02-8389-41cf-e200-8f74-d45a-3701-05b6.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:8f74:d45a:3701:5b6])
        by smtp.gmail.com with ESMTPSA id gz11-20020a170906f2cb00b009b2d46425absm989612ejb.85.2023.11.08.04.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 04:44:54 -0800 (PST)
Message-ID: <269222d8-b72f-4c7a-a19e-a82964e29ec8@gmail.com>
Date: Wed, 8 Nov 2023 13:44:52 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dt-bindings: hwmon: Add Amphenol ChipCap 2
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20231020-topic-chipcap2-v1-0-087e21d4b1ed@gmail.com>
 <20231020-topic-chipcap2-v1-4-087e21d4b1ed@gmail.com>
 <5a35f02d-31d0-4cef-9b46-f231d0611c7a@linaro.org>
Content-Language: en-US
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <5a35f02d-31d0-4cef-9b46-f231d0611c7a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 08.11.23 13:34, Krzysztof Kozlowski wrote:
> On 08/11/2023 13:29, Javier Carrasco wrote:
>> Add device tree bindings and an example for the ChipCap 2 humidity
>> and temperature sensor.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
> 
> ...
> 
>> +maintainers:
>> +  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> +
>> +description: |
>> +  Relative humidity and temperature sensor on I2C bus.
>> +
>> +  Datasheets:
>> +    https://www.amphenol-sensors.com/en/telaire/humidity/527-humidity-sensors/3095-chipcap-2
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amphenol,cc2dxx
>> +      - amphenol,cc2dxxs
> 
> What does xx stand for? Wildcard? I do not see cc2dxx in part numbers.
> We expect specific compatibles, not generic. What are the differences
> between all parts?
> 
There are two device families: cc2dxx and cc2dxxs, where xx indicates
the voltage and the accuracy. That does not change how the devices works
and it is not relevant for the driver. The 's' indicates that it is a
sleep device, and that modifies how it works.
I listed the supported part numbers in the hwmon documentation, where
they are also divided into these two families.
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 3
>> +    description: |
>> +      The device provides three optional interrupts. READY indicates that
>> +      a measurement was finished. LOW indicates a low humidity alarm and
>> +      HIGH a high humidity alarm.
>> +      All interrupts must be IRQ_TYPE_RISING_EDGE.
> 
> Instead use items: with description: for each item.
> 
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: READY
>> +      - const: LOW
>> +      - const: HIGH
> 
> Lowercase names
> 
>> +
>> +  vdd-supply:
>> +    description:
>> +      Dedicated, controllable supply-regulator to reset the device and
>> +      enter in command mode. If defined, it must provide a GPIO for its
>> +      control.
> 
> I don't understand what GPIO has anything to do with power supply.
> 
>> +      If not defined, no alarms will be available.
>> +
>> +
> 
> Only one blank line.
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
> 
> Best regards,
> Krzysztof
> 
Thanks for your review.

Best regards,
Javier Carrasco

