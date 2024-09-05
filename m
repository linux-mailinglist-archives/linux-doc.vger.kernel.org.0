Return-Path: <linux-doc+bounces-24618-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EFB96DFD1
	for <lists+linux-doc@lfdr.de>; Thu,  5 Sep 2024 18:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAEBC28CE4E
	for <lists+linux-doc@lfdr.de>; Thu,  5 Sep 2024 16:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150B53BBEA;
	Thu,  5 Sep 2024 16:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ip5oX0CT"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EE31A0734
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 16:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725553951; cv=none; b=d4/rc6wPkjsKl0nEPkrFcv4QPJvAH9p4mKmlmHIlHbWKW91cEDdb5/3RsEYcvZC6Z4EUSqU1Wji/CN1ixk9KPBEFNBinv45HNWrjR/Oh8r8H1tN1+hywqFXpGULdO5lZUCoqIuHj+YlwOfiK1X3UmRhMWVUqll40jpw8/0yqoBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725553951; c=relaxed/simple;
	bh=LJxf2I+qDEKWcF/MHgukLX50wTfnukOCB0ZkYL4/G7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMMNy8ul2ECmtxweSFSOu4aerZRhfWnx0wqM82MCwiBKzCq+GGm+m9EBUSG6ph0FW+NjF4LTCj+9k+jWQCp5YtvmTFqCD0rhwZngdXkprF4SftJfbXM9wdvaSP7N83LTeL3YmMCFcnvEDMoLktApPIByBkM5siqgTRCYGYgLnwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ip5oX0CT; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-82a35ea3edaso44661239f.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Sep 2024 09:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725553948; x=1726158748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LJxf2I+qDEKWcF/MHgukLX50wTfnukOCB0ZkYL4/G7w=;
        b=ip5oX0CTQai1QHiEqVhFIdHFsZb6qf1FDLp9vEtJZziouIxA6LSUWMdQ3PwozvC8/x
         Bljb2DcuHe/2AaR7UZClmu52ImTbAyWYYHgdMSeSSX+aHNjdPertdCQWOij3+jl7+bGm
         abcftyfjdZ/D5aX7oiaSrS3agGXcsbSqklgQkPqESlIMXAZ8jUEWRFc0Igx5TsRBfoRy
         8Y3WDP+SUR7OZQ8W8wBOcd2sd8apnw348Ru4zXaWpr0DJ9CURgNhjO3T7A/wVzFyU8cr
         FAn6W8ieyaGQ+LQ7iCpmFDMFTODXmfQwU/MOI4RhvjUaAAIf+kWUBSg9YETScXnnJcBK
         N3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725553948; x=1726158748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJxf2I+qDEKWcF/MHgukLX50wTfnukOCB0ZkYL4/G7w=;
        b=FYFbJQXJHfBvFkt8oZw5UTc0v/cZ2/ZkWuW+HuQQ4WhH8QNkxcJCs/5s2+hSnHj62p
         ejJaCs7ai22tujwtz7xLorCuQleadhdOAHYsNqM7QElwU/Mw/a/mbxo46ffoEITpGogr
         +Sm5CoMh4IP/r68cE8u4JUO/v85XCo6C+Wa09f4ng9wPZ7FGxvX3/FAmnBEQDeKfv2tj
         8xoH0Jngoj34VAKACmLgFx7q0isnXI+yPJCPheLOp0ylNatguIqjK4gRPseNCTUjdMqe
         pJ8B244HzOV/FJ0W04g0O5TdAj65QmBxgzni6VkUPpNDbul7mNHjHCt7uDmloBuyF+tM
         hz5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgf8Cc1BT17Vlv2gWIXN6fSjrHqgEbURFB7HAhF0Tu/kp801fFNE/vlt6M9tXf9lvyTM+TqygjD/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv5cX7/17u+8p0rXbr8R4BVfrssoibdOF8T6+P5I3itkEp0kGL
	lalI89VzEtLL/KYUjTRSYBXKkKq0IcFrSbucGBTNJG9+EuAUQmEUaNqUx/RVjMk=
X-Google-Smtp-Source: AGHT+IHLXHN533tm5TH7tUvxq+IeFjjRqnOq284J4kEiNtv3uK/fJkUwLvtz9f9jhxc51r33P1fF3A==
X-Received: by 2002:a05:6602:1595:b0:82a:3dc3:cfc6 with SMTP id ca18e2360f4ac-82a88ca2f9bmr345501939f.8.1725553948029;
        Thu, 05 Sep 2024 09:32:28 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-82a1a42664esm411072739f.19.2024.09.05.09.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 09:32:27 -0700 (PDT)
Message-ID: <37535a4e-e121-4824-aad6-f169b2442e0f@baylibre.com>
Date: Thu, 5 Sep 2024 12:32:26 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] iio: adc: add new ad7625 driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Lechner <dlechner@baylibre.com>,
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20240904-ad7625_r1-v4-0-78bc7dfb2b35@baylibre.com>
 <123c8bff-6623-4a3b-a49e-69b3ab6f8ab5@baylibre.com>
 <4d156c5a-daea-4e9a-8623-8042b5fe7911@kernel.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <4d156c5a-daea-4e9a-8623-8042b5fe7911@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024-09-05 4:01 a.m., Krzysztof Kozlowski wrote:
> On 04/09/2024 21:16, Trevor Gamblin wrote:
>> On 2024-09-04 3:14 p.m., Trevor Gamblin wrote:
>>> This series adds a new driver for the Analog Devices Inc. AD7625,
>>> AD7626, AD7960, and AD7961. These chips are part of a family of
>>> LVDS-based SAR ADCs. The initial driver implementation does not support
>>> the devices' self-clocked mode, although that can be added later.
>>>
>>> The devices make use of two offset PWM signals, one to trigger
>>> conversions and the other as a burst signal for transferring data to the
>>> host. These rely on the new PWM waveform functionality being
>>> reviewed in [1] and also available at [2].
>>>
>>> This work is being done by BayLibre and on behalf of Analog Devices
>>> Inc., hence the maintainers are @analog.com.
>>>
>>> Special thanks to David Lechner for his guidance and reviews.
>>>
>>> [1]: https://lore.kernel.org/linux-pwm/cover.1722261050.git.u.kleine-koenig@baylibre.com
>>> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git/log/?h=pwm/chardev
>>>
>>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> Realizing that I forgot to pick up Conor's Reviewed-by on the v3 binding
>> before sending. Can that be picked up?
> Only you can run `b4 ty -u`. We cannot.
My mistake. I'll make sure they're there for the next revision.
>
> Best regards,
> Krzysztof
>

