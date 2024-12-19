Return-Path: <linux-doc+bounces-33271-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F5A9F7730
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 09:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 454CA7A22F6
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 08:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269C3217F2C;
	Thu, 19 Dec 2024 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jkNL0f40"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D4E217642
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734596628; cv=none; b=OsjlSRS7GX274jB4QlMWOIwXejwVulnfHAVMwTJ5eeG+E873RpUKsmCLY8N6gUevW5OmzYUtNFlQP4SZEVyTCH18ZXwNA/g/5V9RKmuyCr8Cbbo5FHBDvQVIiSF/S1UaNYkrp3lWUm++A2Zprr5BTRKvHUlblBXHusW7pYgwrTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734596628; c=relaxed/simple;
	bh=SYnECCsIqZtY59W4mgzTbCLCQSSWGE9TuSX8NlHcwk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I7gdM3S20CZQecTTnNZDnBSNzyY80Cr5C8RAvzT6g+CySo8ER6FehOAD2D6LMrPloZOiiOrYYQ4aZRT/jJZhZ84dJZgEcf7JvSyOM8JypiHtq3dTuQvEL+2u8W25zk5aTu4CkkCVeHaXsQnx3gD7SaEzslJMnRW+n3VJuHZz4cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jkNL0f40; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361e82e3c3so840635e9.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 00:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734596624; x=1735201424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZhWQPVqIkAZjYF1Lest5sd+4whqHXleakyxliNBakmU=;
        b=jkNL0f40NZm7VkKZtHZu308OVVB7I7bWpfnfUbDRE0QXCzLXviC0dzuMvSkDx5UcZH
         JcjPF8gPNL8IwHKkvdPSPregcNCaG1cQJeDFk1Jv3GjmrjEjLwAO7fJiNP2X7T/iZwT1
         hFd/8pVEIgbGUEQl9ou0R4AnwvtjLfO95Bq5UnilcPBMvtsLjfUYydG5J8ZnLF/V2s0x
         BDa1bh2d+K9JClc2Mrhr7xfvKepuPX3ftzyHqxrIbcVRJzagFk+WDF5jAj5RYRfkgMHl
         YTO4jVlbsUugY2RsFyAbKzkuTGY9lbxt+9ndIzJKTFyM757s2CBY64UM+tx8QEznkBO0
         nmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734596624; x=1735201424;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhWQPVqIkAZjYF1Lest5sd+4whqHXleakyxliNBakmU=;
        b=vef07gehdym/N583NnQR1VW93nXE849aEAioISPus8sotSUnENEwWuNzU3UzaLhp2V
         JYd84FW0MzW6g8Q6PlPl7sAiiQIqGYweIl2wq0MguHcelmPNc8EHLrnSHetYwFOxPqTJ
         rf+nbef+6xbeocibVj2gn7CS4gFEGxj+53FmLiQwKlL4h3UttCKQZcl9uOtBvPCyx5e4
         8+4qJ77iMoqPtXa5P/gD5i6DDnC2/USXA2L/0io6BnYCIqIkyAhDo3kGj+vO2feBFtyE
         2UVG5TratMlE86jeAvuTfjro1hOuKL+tekn0aB5vSdt6WDtYnZ8oo1K7cYpJyKFutuJP
         0H2A==
X-Forwarded-Encrypted: i=1; AJvYcCWHfNY2Wjlbdtvi+xD2SJM0PkMNMikts/NCTN4ytdP6BOwGG4YXkkp01/e8YS4d8WRJ9SIaSEWiO5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQLSsX/Q1qa6CTYhS4Clyu7zl4Q5Il7/fkR3efHKfOqbiPHc8D
	PrjAbHTz/anpFj4J+HXgVrLgUmsv5edPHE7+r56/WCt5J9PKuspmahgGRduruUI=
X-Gm-Gg: ASbGncv+YomNsiB59YEs3xDBXGDgA/X8M9ZcZtS3LJlbt6Ll4TZ+1/eWHFom+DNAhtn
	Q8+tOQeRAAZNEaOPB1G59HsDbphR7WBUVZsxxPByiZ00RJxWOErX0mDnjgReG20aCXyDFlsCnSs
	2b8hdJljArb3fgQdfCganzUAIx42WPewHqh9wrwngFraSVnMH6UQfWs59cSCBSOpZTzWfPz1igi
	MniHoNrpL43NYa/hB0xsV06nUSFXuPv9IxFHiiyY6TfIV3lXNnUiF+Bl1PxeLtIh6Th6z35AGMX
X-Google-Smtp-Source: AGHT+IFZl2uun/13rola6ti6dCUDltByS/wYtTiPlDn2whacOYLHjMLnRwmDCZFqBKw1iSVoPLGm3Q==
X-Received: by 2002:a05:6000:480d:b0:385:dc3b:da71 with SMTP id ffacd0b85a97d-388e4d835a7mr1984485f8f.8.1734596624600;
        Thu, 19 Dec 2024 00:23:44 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829297sm989010f8f.4.2024.12.19.00.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 00:23:44 -0800 (PST)
Message-ID: <c93c89c2-7188-4b17-ab3f-a3d2f1972a21@linaro.org>
Date: Thu, 19 Dec 2024 09:23:42 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] dt-bindings: leds: Add LED1202 LED Controller
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241218182001.41476-3-vicentiu.galanopulo@remote-tech.co.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241218182001.41476-3-vicentiu.galanopulo@remote-tech.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/12/2024 19:19, Vicentiu Galanopulo wrote:
> The LED1202 is a 12-channel low quiescent current LED driver with:
>   * Supply range from 2.6 V to 5 V
>   * 20 mA current capability per channel
>   * 1.8 V compatible I2C control interface
>   * 8-bit analog dimming individual control
>   * 12-bit local PWM resolution
>   * 8 programmable patterns
> 
> If the led node is present in the controller then the channel is
> set to active.
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Stop sending the same 5 times to people.

Best regards,
Krzysztof

