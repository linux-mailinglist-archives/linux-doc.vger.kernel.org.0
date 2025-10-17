Return-Path: <linux-doc+bounces-63675-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3856EBE95AE
	for <lists+linux-doc@lfdr.de>; Fri, 17 Oct 2025 16:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 586F1500837
	for <lists+linux-doc@lfdr.de>; Fri, 17 Oct 2025 14:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C461288A2;
	Fri, 17 Oct 2025 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Umdbr1dz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CFB337110
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712867; cv=none; b=SPpbyVIgIA+CnIvRRgJOjIc5Ymt5R4EwRbNrTxN6+Vmf0DJd91QOxp5D4uBLS8ZpJ9vkVogVxNvesqu7eQ2kfNrraEPX98CPjV2X4LpOmSh/czmuL6YyMaUKI3Ksx+VLMOsYmvVcElxoIkISonL5q3spS46RFOM31dInMRpSAg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712867; c=relaxed/simple;
	bh=1CN8V4IYUapjtF5d+iKuX/N07Olqi9IbdptFhw0Y7F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+we7CWr5LP23VS04T/VxIvEDnNLAnmdl4ddTXBNXKfGrt3Ghdty3qXsmubR/ZyhSQhJYONskenjaf9b7l4AUfy6sC+rxArhGsbN8oOGCc6uw4zdsYoKzaYoxx2VW1n7KZVVNQzd67dds3kj25XFZ79LF4PEFBCUCMVoUHzWrvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Umdbr1dz; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so1227449a12.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 07:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760712865; x=1761317665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6MITZP3UBCSDgkjpJTN26O/+6s10AmHQJ5xOxENBbXc=;
        b=Umdbr1dzMNQMAIbS8xc0BbokeiH30okk8Hm480NqZMEhx4iTcaiRux8QND9WYIC3BV
         UxJ7Tt7eCx6uy6NvFadnYN9Ik+6I1c4Op1XUV1SmD+48YwRkn9aQSZ0+tUfOAtgywrpw
         9kS7ioSuCZuW8MVrIbJ1eZoL9yxY33U90xyJPdok4EHSPG0kRC/Mr0/Gqz7hQmS+aLbz
         tSMI0w0O2c73K0Zty70RagaJxJARmzcewjrF6bMZDyZpadUvHsgPMUcuTlDgFBR8FTVp
         LTyWB2xFDMZFZKLxwK2V+j9Zym4aiCl9G9GTy/g1WF01m7eBtZoCns0Ta3mZtQWZ/QKZ
         zgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760712865; x=1761317665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MITZP3UBCSDgkjpJTN26O/+6s10AmHQJ5xOxENBbXc=;
        b=bzWt9CVF/kXYQILO+tE4mqXQs6zgyD454bM+Z+iZbtovPwnfEnp6ULbXoHqflopToE
         nTNmAf/qED4CSZR52bmiKPTKe89cOgxZLZkdhY5HDgkACBQaj+6Hb9pXHXRNY8dJ3dTu
         6L3m2hR5Qsr5wTXpwEqaWWDSRtvjup3VrUyzx3pNWAqopAG1yx0Q2lhqkZuSLPsRRyWN
         IrgIda7y/I2Gnk8m6q1dDJ6eoC99s54d0mGBEouOXZkiPwcI5lT1sfwCi6y3XV8TQnyc
         aaMBM5LcvW+4lcw/F86WEN1w89HjBJIDx6J3pyksbu6Ggn8QgxkT3q/tEu/leYFuuuVM
         DvGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8EziIZL9qhmwpYB6XWMe6ho666F+U5MhlXEBvHEnIKDOg7rZe+nZeHzWgytz1fTTGKY4kQBQh120=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8t9eyYLiQqgA/egp5zKH0aeVx6C6gNAHeSIzXX+hOzTVyM9GA
	J2FNcM+isMvjXBW8jn4L9aFVookrSwJ6xCxurGzXTOFzkWjPvf1zys+S
X-Gm-Gg: ASbGncue8Qc8FK3vCsOkI2XVAfWOhq4eoBUAmSMncUc+RvY7u3V6oOPmJBsYVmH3Ucy
	trN/YnK0jYbBNqCDVz1NQaSvZwX/tCKuLhsw7swaNDJST8n7u1m1lG105x/3C0q05NlrWmEHrMz
	CJGqnykDVDzZ2b8/XnaAm8/jiwPcG5MXxUP0nmEAGH8GLPZkSeERCax2fMGMg4IwR+2DXK6q5bE
	SM1qtovERj4kDh+/1/9+KxwudMP3JV676JYoCGtgTO+uJZJTV2lwy5KeustZR1eEl+ugYuGfpA6
	oNwlRnBwoRYmleSMfMS5SmT2R3lHSLQjsrGrAqBq7ai3wmLpUlkgyzVPmptI4lkcUWA8Hl3icS8
	s+Gl52Eq1+QLvgLDzZ/Ftn84UJGO/M5I60O+O/Xqghw6aq2ujvVdiSx1IqfOgEk0/z1/fHVdml/
	ypA/CRjofp+CKLBNiuy3WIUCjl/LSQu9VL7GhfyA1b3qLq/+drFLw=
X-Google-Smtp-Source: AGHT+IH6QqRz3mfPjaQBbXxb7ph4nl5wlCoo/JoHB1uOn3BkPCRIYZvSAQeHrnmDe+NhW9DJoW3G9g==
X-Received: by 2002:a17:903:2345:b0:269:a2bc:799f with SMTP id d9443c01a7336-290caf831aamr50579065ad.29.1760712864562;
        Fri, 17 Oct 2025 07:54:24 -0700 (PDT)
Received: from ?IPV6:2405:201:8000:a149:4670:c55c:fe13:754d? ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bd7b3da78sm3137414a91.19.2025.10.17.07.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 07:54:24 -0700 (PDT)
Message-ID: <3f154ad5-af3c-40fe-b696-e7157b87d66e@gmail.com>
Date: Fri, 17 Oct 2025 20:24:19 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] docs/hwmon: Add missing datasheet links for Maxim
 chips
To: Guenter Roeck <linux@roeck-us.net>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
 david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017105740.17646-3-spyjetfayed@gmail.com>
 <bfbbbf63-bd7d-4b2c-9e03-a3d3c3db04b3@roeck-us.net>
Content-Language: en-US
From: Ankan Biswas <spyjetfayed@gmail.com>
Autocrypt: addr=spyjetfayed@gmail.com; keydata=
 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
 TRpGew2ozniUMliyaLH9UH6/e9Us
In-Reply-To: <bfbbbf63-bd7d-4b2c-9e03-a3d3c3db04b3@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/25 6:22 PM, Guenter Roeck wrote:
> On Fri, Oct 17, 2025 at 04:27:17PM +0530, Ankan Biswas wrote:
>> In 2021, Maxim Integrated was acquired by Analog Devices.
>> maxim-ic.com & maximintegrated.com links redirect to analog.com.
>>
>> Missing datasheets now available at Analog Devices added.
>>
>> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
>> ---
>>   Documentation/hwmon/ds1621.rst   | 20 +++++++++++++++-----
>>   Documentation/hwmon/lm75.rst     | 13 ++++++++-----
>>   Documentation/hwmon/max15301.rst |  8 ++++++--
>>   Documentation/hwmon/max31827.rst |  5 +++++
>>   Documentation/hwmon/max77705.rst |  4 +++-
>>   Documentation/hwmon/pmbus.rst    |  4 ++--
>>   6 files changed, 39 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/hwmon/ds1621.rst b/Documentation/hwmon/ds1621.rst
>> index 552b37e9dd34..415d4c3043a7 100644
>> --- a/Documentation/hwmon/ds1621.rst
>> +++ b/Documentation/hwmon/ds1621.rst
>> @@ -9,7 +9,9 @@ Supported chips:
>>   
>>       Addresses scanned: none
>>   
>> -    Datasheet: Publicly available from www.maximintegrated.com
>> +    Datasheet: Publicly available at the Analog Devices website
> 
> The "Publicly available... " text is intended to identify the web site
> if a direct link is not provided. Either the text or a link, but not both.
> 
> Guenter


Sorry about that I did not realize the intention behind the line 
"Publicly avalible.. ". Thanks for explaining.

Will send a v2.

Best Regards
Ankan Biswas

