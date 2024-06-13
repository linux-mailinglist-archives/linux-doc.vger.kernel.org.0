Return-Path: <linux-doc+bounces-18497-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A427D907473
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 15:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8EFB1C24957
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 13:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB15144D21;
	Thu, 13 Jun 2024 13:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nWQeNOir"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992AE1422DD
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718287071; cv=none; b=jkWv6L0FtMmcl/UKISVx/MZWjpSE6FfxnpAKE6qQt9baFgkDoGWgWGw98Ed5kHXuSOqyZh3ZPO9xuFgtpmdwQSv9v8yybRzjeVS+rMxiCbw2svYRsLTNfrwU35fF4UX1SeECWfQ3Uuc3Cps6Hu1hYcDjfNcBfGP31nXFEOYxMyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718287071; c=relaxed/simple;
	bh=GrIGi5Raom3cBopM6onz7enFC19BTnxh+2SvPTD5iMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FrO9ThLC4thiCsDwN5BAe14BkrAYiYPsLnYvtfR9h5b872mkpM62Lgucqdvu+dhrivTtiSwmFKO6p2aAIVwXEjm1FjjeWZPXa3Y4beMQwes9eJbVp2sM9DlGe8atooAb+0sJKcFAVFtBmIH3Iz2jW2etc1WIkDb3P9OXkINXISM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nWQeNOir; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d21c4eec2dso530343b6e.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 06:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718287069; x=1718891869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAF//HO0SkiGruVZH/oa4D5CEEiCpOQwdcWhLFwGOe4=;
        b=nWQeNOirVscLswJy1r0TNhO6laI+1c2Mq2JR2ZUjoyZm61LK44eYujABKkF47ZifkN
         h0Dl7dMrKQp8m6ER5oymN4q2RIBkgXCHAnCMrkqlvyFgmNbxeo+ZRwsAOC/NGGPWj/i8
         9C0aMZffQcar89f2mTSTOZ0ucmwJozP72SEUlgzXsUA9nNxQDxIM0OnwksPdBDq7F0aT
         q4NTe3PxzgRrFMFJ60zh56IV+1Mne7pv8ZKEtpeXao3jVVFKbb6ocCMe8eV+sy6X1IsO
         MUPThPVxNozvZFT88bHVNK9xkVXVvxXNgMjqbcq1UjYCWFOM+3j5dmluSgcdgBWWUcGM
         aE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718287069; x=1718891869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAF//HO0SkiGruVZH/oa4D5CEEiCpOQwdcWhLFwGOe4=;
        b=J1B5fPXAnAz0HzfJsgboyYsvA8QyQfSWPtD9qUDP0xmsHGItgMHNhgYy0Y3KrQFrpw
         u5TLMjAc1JIgcZUHEJkdCvt2zPXC3exIB32b/zz+mStYABti4GZT1LiyZrF239NZqUcq
         TnJhyz8A5UH51J0elAj6+2guB4JYT/naJpxtEs+gwdySnBqxfu2ui+oiCstXtQUIZbE/
         BbPPySPZMMa6e4bD7/VkO2L2+Xav97uG2E0TrSO0N9Va7H+tc9C56FolQWa/v4mbOWSs
         4KYQSJKSZxy/Ie9doBzGYh957SFyziAf2pK47JY6yMOhyD/YvhjH3U3ZeNw0N3c1J9j9
         RKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3IxRAffrcrLzcLt39jzJ8dWGwqj5J6P8z4V46JtUshmEIp7cQlNY7RBxBLfjZqosfoliEy5EB5jKhN1Swcn045lU+zWknIdXZ
X-Gm-Message-State: AOJu0YwK7XOV2hK2Fg6fmy9xlP5Nw2kc5XU9uNYrBQgg5nnV0skVR8rB
	vt7Hg4Aj/cA/Dva1F+XCn/PHf31rPfPKAfVkxpTZDqvAmDLWealbTAJEEtfOOko=
X-Google-Smtp-Source: AGHT+IF6bjcZSnWMyEtkHan92hgo9U9vcd8IIa+fICj/3epkw5ppZ2rEbJOtmgyzeuASqb04o0vNwg==
X-Received: by 2002:a05:6808:d49:b0:3d2:1a26:8a43 with SMTP id 5614622812f47-3d23dfd87d4mr5716375b6e.9.1718287068043;
        Thu, 13 Jun 2024 06:57:48 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d2476e31cbsm194695b6e.50.2024.06.13.06.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 06:57:47 -0700 (PDT)
Message-ID: <f765ef30-a777-4dfc-8f93-0f15b46f91ae@baylibre.com>
Date: Thu, 13 Jun 2024 08:57:46 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: add AD4695 and similar ADCs
To: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Cameron
 <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20240612-iio-adc-ad4695-v1-0-6a4ed251fc86@baylibre.com>
 <20240612-iio-adc-ad4695-v1-1-6a4ed251fc86@baylibre.com>
 <94448c2c-e7b2-4191-858c-529b254994f1@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <94448c2c-e7b2-4191-858c-529b254994f1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/13/24 2:11 AM, Krzysztof Kozlowski wrote:
> On 12/06/2024 21:20, David Lechner wrote:
>> Add device tree bindings for AD4695 and similar ADCs.
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
>>  .../devicetree/bindings/iio/adc/adi,ad4695.yaml    | 297 +++++++++++++++++++++
>>  MAINTAINERS                                        |   9 +
>>  2 files changed, 306 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4695.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad4695.yaml
>> new file mode 100644
>> index 000000000000..8ff5bbbbef9f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4695.yaml
>> @@ -0,0 +1,297 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/adi,ad4695.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Analog Devices Easy Drive Multiplexed SAR Analog to Digital Converters
>> +
>> +maintainers:
>> +  - Michael Hennerich <Michael.Hennerich@analog.com>
>> +  - Nuno Sá <nuno.sa@analog.com>
>> +
>> +description: |
>> +  A family of similar multi-channel analog to digital converters with SPI bus.
>> +
>> +  * https://www.analog.com/en/products/ad4695.html
>> +  * https://www.analog.com/en/products/ad4696.html
>> +  * https://www.analog.com/en/products/ad4697.html
>> +  * https://www.analog.com/en/products/ad4698.html
>> +
>> +$ref: /schemas/spi/spi-peripheral-props.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +          - adi,ad4695
>> +          - adi,ad4697
>> +      # same chips in WLCSP package with more pins
>> +      - items:
>> +          - const: adi,ad4695-wlcsp
> 
> Usually we do not add compatibles for such differences. Programming
> model is the same. Same for all other wlcsp. Unless something differs?

OK, I will drop all of the -wlcsp stuff. It made the .dts validation
catch more stuff, but wasn't being used in the driver because there
really isn't a difference other than some of the pins not being there.

> 
>> +          - const: adi,ad4695
>> +      - items:
>> +          - const: adi,ad4697-wlcsp
>> +          - const: adi,ad4697
>> +      # same chips with higher max sample rate

I suppose one could make the argument that the programming model is
the same on these too, but the maximum sampling frequency does seem
like an important bit of information so that you don't try to set
the conversion trigger rate too high.

>> +      - items:
>> +          - const: adi,ad4696
> 
> Anyway, keep all fallbacked variants in one entry, so enum with const
> fallback.
> 
>> +          - const: adi,ad4695
>> +      - items:
>> +          - const: adi,ad4698
>> +          - const: adi,ad4697
>> +      # same chips with higher max sample rate in WLCSP package
>> +      - items:
>> +          - const: adi,ad4696-wlcsp
>> +          - const: adi,ad4696
> 
> That's wrong. ad4696 is compatible with 4695 as stated before. It is not
> compatible with ad4695-wlcsp.
> 
>> +          - const: adi,ad4695-wlcsp
>> +          - const: adi,ad4695
>> +      - items:
>> +          - const: adi,ad4698-wlcsp
>> +          - const: adi,ad4698
>> +          - const: adi,ad4697-wlcsp
>> +          - const: adi,ad4697
>> +

