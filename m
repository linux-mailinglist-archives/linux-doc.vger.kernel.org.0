Return-Path: <linux-doc+bounces-28120-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA7A9A69C0
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2024 15:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1790286ECE
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2024 13:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B811E0B96;
	Mon, 21 Oct 2024 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dYyqFYI5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FAF1E9095
	for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 13:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729516255; cv=none; b=VGsK1+lrFFoNn39HTeuZfONyGCflyWPxNUGHh102Dpdp8xBjaFBI04Mc8q/mFzRz2b2OJwaPGelWLzpy8QJ7p+A0YwcFYdY6V/e8AhW/xHCLEe4MQM6bR+gPZr8s6O8bx5I9DgAN2VZ9PD0JvwCzKqRi0JKfMdjyDbidLSQq6kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729516255; c=relaxed/simple;
	bh=r+aOMV3MADphoeGOSyYy73k5f0WucUEtLuhrb3GEHIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nfByR4zzo9Up3YEV3LXFfwn4cTJUX8+6pWjkWK9ho+7iND2kmz3N1lzlARJb9l04hlJAzESeV36P2YLEsdMrvsL5k9EX1ALIM4o8iv0IiPuSemyLsxaUY3hlH8TSBkiQG5bBU3Xseodpp2fUgiXTD1H0Rj2ZMeWjKYjWdgInTLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dYyqFYI5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d51055097so3189813f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729516251; x=1730121051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hb5z7oqU7DLw6NgZCfx42d0B4py7r2L+/9jylzSGUKY=;
        b=dYyqFYI50jrvT3Qy4rxzqHiGt3x0UWM+6G3+nohCNWN4tdf5vTzCMqgLIdBQcFY62y
         4fyzevIUm+krRIRJ81cs50E/6GP0UZRaHfO33kfY5881DGIWkpFWNtSHkdY4RPa+tmAU
         twM5G0AZeYB6D5lBNZ1Q9OdbPSZaOQRyjRWnWdwTMx64Z7d63Qwbf3CSf64p2rkr40Kq
         C8M4VFHOhbuwryGzVpJNCWvln00kAfI3gCGy3GGd8oVWKTv8o93Zi1HGasYs1R/vrGQK
         2JQdhEFu9UnJpQsRBgDng31MYhFbPTbgXC1qmCyAYYjcmkOauqb6SKPp3KH6+h5hHYVw
         Mp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729516251; x=1730121051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hb5z7oqU7DLw6NgZCfx42d0B4py7r2L+/9jylzSGUKY=;
        b=ieTsSPViSUDtDuaypFk16oASrF+dW5SeZ1d4iiM8xUY7JF1zziaHdimyDZiRpHa9i0
         JCl+cSkKfHxhs6DO16icPmPp1Q3pta4HT5LVGQOT4sSF3MpJQoyrNGR4BUKDPTmsSyXH
         yjf8sMdWFvQa2nL4byoD1fpAWS2yGreBwN1dS5if82tEJ+jF8UVTQ6E4MLhVKLwGHDHp
         u7wQ/ZVpH4y8IflHgqFb1D4A65KfxgL/kegdW1JfZo8tGRzJC1z/XZ1bh5eAxP8o5njD
         3ZUlIokmQcj0AswF3k8vz6JsoeOqQl1R45Y9lOaWRPZD2FHKkssR12cS97lzQ23UL1CQ
         uANQ==
X-Forwarded-Encrypted: i=1; AJvYcCVliGPwuwgfwv9hgrTCRlHEGX4mW+w6DuYQAtpEqxrkXdmYbK0O0QX9yhpk3Cx9g6/jkPiVs1HU5tI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJiIFONOHrlEEqI+LGwS2XAbKo47K8hzBDVuxmUuIAjKOfLOU1
	X2umvvaO+1TkE1Cvo2NhaUuxk4QsNWtOgSXszCPL9AgwrE5GrASlS0BKMfL/+YmX00mFZUO7es+
	0
X-Google-Smtp-Source: AGHT+IGDnIWfxiOcEveLs2MQlDhwR4gmi9FH0MSQHpKsf+BMqQSLSH8WpoqUGsyHzwGiIA8WXTqaaQ==
X-Received: by 2002:a5d:674c:0:b0:37d:4c8f:2e1 with SMTP id ffacd0b85a97d-37ea2181ea7mr6445009f8f.22.1729516250368;
        Mon, 21 Oct 2024 06:10:50 -0700 (PDT)
Received: from ?IPV6:2a02:8428:e55b:1101:8419:4feb:c28:3b3f? (2a02-8428-e55b-1101-8419-4feb-0c28-3b3f.rev.sfr.net. [2a02:8428:e55b:1101:8419:4feb:c28:3b3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cc5adsm57103685e9.42.2024.10.21.06.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 06:10:49 -0700 (PDT)
Message-ID: <c6aeaec1-35b7-47a1-8ae2-3386e5241ad5@baylibre.com>
Date: Mon, 21 Oct 2024 15:10:48 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] Add iio backend compatibility for ad7606
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 aardelean@baylibre.com, dlechner@baylibre.com, jstephan@baylibre.com,
 nuno.sa@analog.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20241015-ad7606_add_iio_backend_support-v5-0-654faf1ae08c@baylibre.com>
 <20241019155329.500ae439@jic23-huawei>
Content-Language: en-US
From: Guillaume Stols <gstols@baylibre.com>
In-Reply-To: <20241019155329.500ae439@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/19/24 16:53, Jonathan Cameron wrote:
> On Tue, 15 Oct 2024 13:56:13 +0000
> Guillaume Stols <gstols@baylibre.com> wrote:
>
>> This series aims to add iio backend support for AD7606X ADCs.
>>
>> In a nutshell, iio backend is a paradigm to shift the logic establishing
>> the connexion between iio buffers and backend buffers into the backend's
>> driver.  This provides a more stable programming interface to the driver
>> developers, and give more flexibility in the way the hardware communicates.
>>
>> The support will be first added on AD7606B, and on next patches AD7606C16
>> and AD7606C18 will be added.  The series have been tested on a Zedboard,
>> using the latest HDL available, i.e
>> https://github.com/analogdevicesinc/hdl/commit/7d0a4cee1b5fa403f175af513d7eb804c3bd75d0
>> and an AD7606B FMCZ EKV.  This HDL handles both the conversion trigger
>> (through a PWM), and the end of conversion interruption, and is compatible
>> with axi-adc, which is "iio-backendable".
>>
>> More information about this HDL design can be found at:
>> https://wiki.analog.com/resources/eval/user-guides/ad7606x-fmc/hdl
>>
> Applied and pushed out as testing. Please check I didn't mess up the few
> minor tweaks needed.

Hi Jonathan, thank you for the fixes and the merge. Just tested it, 
didnt notice any bug.

FYI Next step is software mode enablement for IIO backend enabled devices.

Best regards,

Guillaume


