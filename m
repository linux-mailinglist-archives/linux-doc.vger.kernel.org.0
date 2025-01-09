Return-Path: <linux-doc+bounces-34616-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1852AA07F93
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 19:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE44B1889D74
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 18:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF77F18C337;
	Thu,  9 Jan 2025 18:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AM1tnNEz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A40F192D66
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 18:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736446176; cv=none; b=WNSSxe32i6CA/oD0sMmqi9vNPfrmaiA2N+GunYiD/QCFrR2EY92U5y36YGe2aJI/5HRUvp67UNIQHOy0m2qnv+sUyf1cmZYmbk+8ykSHLIO9nDD+1iOPI1Urd/bG53b9UPJCapxZwV/MVGC6NydB5GIovONFQNCeve+35ffWrZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736446176; c=relaxed/simple;
	bh=pboeUnDKyK9RDqJtDO3vdnh2Jn6PSti48EJgBkXJnFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U44s7Gch5x5bIdu+q6dXdxzVx/JB3xtHZR58MJp1jkQAw+HDAMVmf8wX8EXHlXSVQaQbe76n2DysLr0BFkllYDBUFJyLGdzVFYgUTI2Be7wRKzfwcB7nn5G8E+QFfUqFnoIiTbReNAYaLHEELX6lF6RLUp511aG/BfTtXzVFUYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AM1tnNEz; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862d6d5765so737976f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 10:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736446173; x=1737050973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYMOkbyCw3mmiJczNiCxdbchNVG2L0oHU9VVND5+2fg=;
        b=AM1tnNEzX5yoZJy8CQlF1P+FIm0AoVc1QxUAUNg9BTcx4hozYOQ0gT+uHCVKZ3gj+N
         94OBkc+wzQUdh5Zf+AC6kSQTIoHYQpcs6VQNUpoLqicrCpH+zs7gQ7Ihg0G64MoNVWNW
         f9p7qlsDvxyMUI1SNbNgXeFvrnsbSN+ujgsx31D41Ywn1M79BnVevxAeJs09PodOJk0Y
         j++JKlxKvA+5lbj+9DY3W7+QRkEXVjUd5fg9unwdXz+Nj9jmV58jwROBkP5UObrih1o9
         A3VnfXObXkP0Ddre9O1MxaruvFwJ8gF34uTjINjDGLSUsbIUOK4UTwkUbLgYKR8Ihxf0
         DSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736446173; x=1737050973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYMOkbyCw3mmiJczNiCxdbchNVG2L0oHU9VVND5+2fg=;
        b=oohFb9FOFut/f0FQvYqgLAsmg5lzDluWdXCOQTR2jZK3BENBD7SNm5uEnc++ErkG5i
         ROwVIO+swx5tRFErUl9l3ewiQTkiHGKoErKo/KKHM6pfqKJlh3lUv6/RNlOmxN25+uVN
         ZB59xsTE6TVFVoZfAU7xBeY6SJcccgwCv5LtZnprx6ogtIdDKEdfWv7Qnbg79gX3d5kR
         EZBoovTqoM51sCQ620v2tK0geUYVbUG6RpnVDlGvZMfFjEgeW2QYRVQpMCElI29VJMvX
         OmKBuL5TLa4ho6t/Pt6A7D/aIuzRGV3QzEELKSFj7clpC3mGnvIpSCm3CFfgjONPe9zR
         D+bw==
X-Forwarded-Encrypted: i=1; AJvYcCXbyGHagXSFM8c4Zcmn3um6fGVVT7LknB1/mo7mLRjkyTkm9j1Dwsf5iVdxGLbHhROL+PaUOe/udt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwULY1YQVCYiI7JIubae7lcViTYSf5hg+pYylZRBEysLO2oHOwE
	QBOiEOuPCWKwRTOl4NPviJU23CUK+RJhYhRrwucwLYY3VjNmty8lYmUXaQeNn1M=
X-Gm-Gg: ASbGncum8GznmHnl1oB33xhA4MBPt97/XX/7K5RkyQqNaJQTLxPRNiNvzKWMstL2eYn
	z0bYna/M/hiZZ0F/E0uWR2u4zmE32rMXasdYwZinMkIpjW0GAb4fCKYC+i0M2ziwb3SM8crNNyN
	xxoSfCnwnmvypSdQoIBnK89LGDhGVfLR5JA48VEG1pRV+1AZ9PzcPmh6n9a6XWDiTidtYNJLw/u
	MoG3/JLUq9VK7DqN/UwpbXdPSJUEcsL/SXexR+PV5TLtYAGW8fCkJItbFMy/gZl9QV6X326W9t3
	puIiVxCpI+JD5JDxPMIywYCV
X-Google-Smtp-Source: AGHT+IE/VQjrCXrh54ZaSKPWQM+gD3HJe5NAUbp82swjVVvauHwuYqz9SVvPoAwmmh+DgafmcQcfbQ==
X-Received: by 2002:a5d:64ad:0:b0:386:2ebe:7aeb with SMTP id ffacd0b85a97d-38a8730de7amr6991541f8f.44.1736446172686;
        Thu, 09 Jan 2025 10:09:32 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b81d7sm2422575f8f.73.2025.01.09.10.09.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 10:09:32 -0800 (PST)
Message-ID: <33509253-b633-46a5-a760-2a6416d835ee@baylibre.com>
Date: Thu, 9 Jan 2025 13:09:29 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] iio: adc: ad4695: add oversampling support
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241217-ad4695-oversampling-v1-0-0b045d835dac@baylibre.com>
 <20241219154614.321c1d32@jic23-huawei>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20241219154614.321c1d32@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024-12-19 10:46, Jonathan Cameron wrote:
> On Tue, 17 Dec 2024 16:47:27 -0500
> Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
>> Add driver logic and documentation for the oversampling feature of the
>> AD469x parts from Analog Devices. For now, this only works with offload
>> support, and takes advantage of that mode's higher performance to make
>> oversampling possible on multiple channels with varying sampling
>> frequencies. Some significant rework of the driver had to be done in
>> order to conditionally support this feature, including use of
>> iio_scan_types to help determine the appropriate spi message
>> configurations depending on oversampling ratio.
>>
>> A dilemma that came up during development of this feature was whether or
>> not the implementation of oversampling ratios against sampling frequency
>> was actually correct. More specifically, it's unclear if the sampling
>> frequency attribute is supposed to be the conversion rate or the data
>> read rate (according to the IIO subsystem).
Hi Jonathan,
> Intent was it's the rate at which the reading becomes available to the
> software (which I think you are calling data read rate).
>
> In global schemes, it's all of the scan (normally they are
> self clocked with delays between scans) in per channel schemes intent
> was to provide the sampling rate at which that channel was sampled
> if no others were being read (assuming the times sum up in a linear
> way etc).
>
>> If it's the former, then
>> this implementation is probably incorrect. David Lechner pointed out
>> during review that it would be easier if it were defined as the
>> conversion rate and that it was userspace's responsibility to handle
>> oversampling ratio, but that might also require more work in the IIO
>> subsystem.
> IIRC there are devices out there were oversampling rate is on top of
> their controlled read out rate (which is more about delays between
> starting sampling than about how long it takes).  I think one of those
> drove the implementation of oversampling in the first place.
> It's also not the case that an oversampling rate of x4 always means
> that the time to data availability is necessarily 1/4 (can pipeline
> some stages depending on the sensor design).
>
> My thinking (it was a long time ago) was that userspace wouldn't want
> to deal with the scaling.  We only fairly recently defined the
> clear concept of per channel sampling frequencies. Before that they
> were (almost?) all global.
>
> Another aspect is that when we originally added this, it was new to userspace
> so having defined sampling frequency, we couldn't have it's meaning
> changing because oversampling was say a minimum of 2 on a device.
>
>> Two other ADC drivers that were referenced for inspiration
>> when working through this were the ad7380 and the rtq6056. The ad7380
>> has a global oversampling setting rather than per-channel, and the
> I'm not sure it being global matters a lot for question of whether
> it takes into account oversampling or not.
>
>> rtq6056 seems at least partially broken because it only takes
>> oversampling ratio into account when getting the sampling frequency (but
>> not when setting it).
> That is definitely broken and could do with a fix.  We should always
> read back more or less the same value written (subject to rounding
> etc in some cases).
>
>
>> Instead of per-driver implementation, these three
>> drivers might serve as inspiration for changes to how oversampling is
>> handled in IIO?
> It is very tricky to make any modifications (other than the fix above)
> without making a mess of the ABI.
>
> Or are you suggesting we could so something in the IIO core?  Maybe
> some helper functions are appropriate (similar to Matti's GTS stuff
> for gains where they are a mixture of various factors on light sensors
> and similar.).

Thanks for providing all of the info above. I think that clears things 
up enough for this series (i.e. that the current implementation is the 
right way to do it). I will take a note about adding some helper 
functions for this, and about updating rtq6056, although I don't have 
access to hardware to test for the latter case. v2 should be coming soon.

- Trevor


