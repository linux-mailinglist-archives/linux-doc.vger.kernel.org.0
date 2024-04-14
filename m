Return-Path: <linux-doc+bounces-14135-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1118A44FD
	for <lists+linux-doc@lfdr.de>; Sun, 14 Apr 2024 22:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B1511C20C67
	for <lists+linux-doc@lfdr.de>; Sun, 14 Apr 2024 20:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B436136676;
	Sun, 14 Apr 2024 20:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9taQmLM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D1F13666D
	for <linux-doc@vger.kernel.org>; Sun, 14 Apr 2024 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713125200; cv=none; b=XxCSab8V6DjH4JBSK776/ts58lqe2j9RjurH0Mu2MDVfxJF1xjOdB1nLD3BjXwdXqNFO73L7cUIGHPiUdgWWFYLWx8duBd61MesNhGWX0SGzjxU0zRd3rc+hlb6LT30dj1lgjUHTkLV6bSxyeGcm0rqQOXhUfHrgPO3TWmvYmnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713125200; c=relaxed/simple;
	bh=hzkgcZA9rBCEReGXZ1BToaXOkkZ7G0AlopjcOW1W828=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WRWQleViik3/b4vkXI1KnuAbmImMh+F2XF3x/K2HVO1lOio6aXPWooyb0lndSlhIpGdGW94Z2TenByzEkqWOCcve4JtjgZBNZgfBdrfQ/Tu35MmSBfjjJHa6GvwR7XexpvcaUyfeD8xxwJFwWGqzWlsqXIGExNC1hKVTgv+1Hyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p9taQmLM; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7c8ad87b2acso69095639f.3
        for <linux-doc@vger.kernel.org>; Sun, 14 Apr 2024 13:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713125198; x=1713729998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kGfHknOus/9GyhBjzld26etB6pXH4O6fe07dtnoZtJ8=;
        b=p9taQmLMAbweGVGw2WbKZCQH+F4zxzErR/7ExCSFyL3BzXCcsikiKLb2/30kj09EV9
         QTysgWThyhDyOxbp4OHO5CQd1EM++jv4Zrd2AkTd6woJketYxe6gve9O5KMSAKvNPoZq
         88ygNnVJ84PSU7OpaI+EHzLGnj8LXwkKtlaYF5M6Fg2gffLoF0FFtX+qIRKf1ZYo3sBT
         FDFOxPkQVXd1wNjHOIEddZmu1Su89+NOsN1xWteFfkAg1MQYMByKvosTduwk+g0h4lhl
         JmVnjR6kQ7q7ulUmR/lECOC3NgoR/DeRSWwPvfMGh8B47wJYnE6uU/PddkG98+RcLxEm
         Lh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713125198; x=1713729998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kGfHknOus/9GyhBjzld26etB6pXH4O6fe07dtnoZtJ8=;
        b=PeKl8wG6OsodhI6b0i89/MSeDsl7/D0BZfvRdaj2CDfcqyD0gd2a205AELyYQkRdXr
         4ISe+Nx0c+MA6bWxxplwyTwfHdbGsUaPb3cKU4c3xqlxpy2l9Tjto4ooe1KF8POZoBax
         6U4izZg2NqjVKBEPEcPfNGKBGLzu66dQRlU9Me54BGNgevEP93S3lsWOAY7RE+N15Wq9
         /za7FBaagBKAHUDIfGNvGuTnk5r/WKTCOOB9ylsn2M3LsaIwrcmLgKRCnMqsksKHX3+/
         jfMEn7og/gxCO+WmE0ZJ38RzP19VWKPwpHV1Vc8x7KpvD/mHfoq1jxyjIakAcmbj+Gu7
         sFKg==
X-Forwarded-Encrypted: i=1; AJvYcCVRAuvIKQ6taNOUYUf8/aGtPEQpxRltHzgk3Jt9Q/gdWpp0K1iUVWPB3QPDuqBw3h1vKIdQpY0dQPOBOR0MzodVpyDmWC2feZlA
X-Gm-Message-State: AOJu0Yy4m+VDPgXnMD7FIhSKN2x0lW683N+Fiuz9z9sJzBsdIXk+ZC1z
	umKQ+wFAWHKukGumorzEI6GZ+NbkBvf8f+kDdmvYsvahKv6uSH8XfqY1Gg6787c=
X-Google-Smtp-Source: AGHT+IFYXBbtD/IOrHO3NdgNVg838YIoDuvznQyBmKua3T+35A6viwq+2YM1ZoNyhKdqyzpbde7pFg==
X-Received: by 2002:a05:6602:3942:b0:7d6:8f9:107f with SMTP id bt2-20020a056602394200b007d608f9107fmr12803844iob.12.1713125198204;
        Sun, 14 Apr 2024 13:06:38 -0700 (PDT)
Received: from [10.211.55.3] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id v6-20020a056638250600b00482fa014961sm767397jat.138.2024.04.14.13.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Apr 2024 13:06:37 -0700 (PDT)
Message-ID: <ddb55ce5-59ca-4d95-b9a7-196bd583903c@linaro.org>
Date: Sun, 14 Apr 2024 15:06:36 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: coding-style: don't encourage WARN*()
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alex Elder <elder@linaro.org>
Cc: corbet@lwn.net, gregkh@linuxfoundation.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240414170850.148122-1-elder@linaro.org>
 <20240414194835.GA12561@pendragon.ideasonboard.com>
From: Alex Elder <alex.elder@linaro.org>
In-Reply-To: <20240414194835.GA12561@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/24 2:48 PM, Laurent Pinchart wrote:
> Hi Alex,
> 
> Thank you for the patch.
> 
> On Sun, Apr 14, 2024 at 12:08:50PM -0500, Alex Elder wrote:
>> Several times recently Greg KH has admonished that variants of WARN()
>> should not be used, because when the panic_on_warn kernel option is set,
>> their use can lead to a panic. His reasoning was that the majority of
>> Linux instances (including Android and cloud systems) run with this option
>> enabled. And therefore a condition leading to a warning will frequently
>> cause an undesirable panic.
>>
>> The "coding-style.rst" document says not to worry about this kernel
>> option.  Update it to provide a more nuanced explanation.
>>
>> Signed-off-by: Alex Elder <elder@linaro.org>
>> ---
>>   Documentation/process/coding-style.rst | 21 +++++++++++----------
>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
>> index 9c7cf73473943..bce43b01721cb 100644
>> --- a/Documentation/process/coding-style.rst
>> +++ b/Documentation/process/coding-style.rst
>> @@ -1235,17 +1235,18 @@ example. Again: WARN*() must not be used for a condition that is expected
>>   to trigger easily, for example, by user space actions. pr_warn_once() is a
>>   possible alternative, if you need to notify the user of a problem.
>>   
>> -Do not worry about panic_on_warn users
>> -**************************************
>> +The panic_on_warn kernel option
>> +********************************
>>   
>> -A few more words about panic_on_warn: Remember that ``panic_on_warn`` is an
>> -available kernel option, and that many users set this option. This is why
>> -there is a "Do not WARN lightly" writeup, above. However, the existence of
>> -panic_on_warn users is not a valid reason to avoid the judicious use
>> -WARN*(). That is because, whoever enables panic_on_warn has explicitly
>> -asked the kernel to crash if a WARN*() fires, and such users must be
>> -prepared to deal with the consequences of a system that is somewhat more
>> -likely to crash.
>> +Note that ``panic_on_warn`` is an available kernel option. If it is enabled,
>> +a WARN*() call whose condition holds leads to a kernel panic.  Many users
>> +(including Android and many cloud providers) set this option, and this is
>> +why there is a "Do not WARN lightly" writeup, above.
>> +
>> +The existence of this option is not a valid reason to avoid the judicious
>> +use of warnings. There are other options: ``dev_warn*()`` and ``pr_warn*()``
>> +issue warnings but do **not** cause the kernel to crash. Use these if you
>> +want to prevent such panics.
> 
> Those options are not equivalent, they print a single message, which is
> much easier to ignore. WARN() is similar to -Werror in some sense, it
> pushes vendors to fix the warnings. I have used WARN() in the past to
> indicate usage of long-deprecated APIs that we were getting close to
> removing for instance. dev_warn() wouldn't have had the same effect.

Honestly, I feel somewhat the same way--that WARN() has a use
that differs from dev_warn().  E.g., in places where something
"won't happen" (but conceivably could if someone was developing
a future change and violated an assumption).

Nevertheless, if panic_on_warn is used in Android and cloud
scenarios as Greg says, he's right that it affects many, many
systems.  Perhaps it's better to more strongly discourage the
use of that option?

I saw this "don't worry about it" message and felt it at least
ought to be toned down. The broader question of whether WARN()
should generally not be used might need some more discussion.

					-Alex

>>   Use BUILD_BUG_ON() for compile-time assertions
>>   **********************************************
> 


