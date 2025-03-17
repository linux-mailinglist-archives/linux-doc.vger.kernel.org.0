Return-Path: <linux-doc+bounces-41046-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D39A65144
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 14:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92F6E3AC06E
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 13:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9189023F296;
	Mon, 17 Mar 2025 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YE5VhhCt"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D09E7DA8C
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218283; cv=none; b=rz7IbLkg5ruDikdLkkSr6+wlYjtf5Gjk8k6HqUXNFOq0igR2z8IoNDdCF/WuLE4kyz6vczbO8yoTlZnAchPyafqdR5EA0MnCqHkLLMDV2idXatE2aPomwhBQEUoQcFtmXmuNh1yLXhbY/U80qTTfy1HGAS2rjSOIKEk+NIXmsnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218283; c=relaxed/simple;
	bh=GYJVMbQZ7uiqaYWMnpndV0P0ZAxM8Qmrf0bBSZB8jWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZwuSQoz+hUOQgulAZ49HJDzMJulhY1+Uht8FoOXS2DD3Xd4D/HC9KKXhgcTFod3ISH/FwUJN7ZCUNoNcHN0kG/U/ee4maFR/W7O88EzISDksB+hIm28Tw99p3/Dc7vtwSRpY9o3GP1+70VzE86wfxRVWkkU+Nfn1Vhh/Ua32QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YE5VhhCt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742218280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XicbyQCxRSNC4G7MmnFYTtssAxXR5/Ky4MMYhuVTNrE=;
	b=YE5VhhCtnVIwkcZd/NoU6ebbvD/D2QMR961ocrV2S0Y0WpfYDVz1xsV+t2ia5OnFv60boG
	Wd8Vd9q1vWHeUpF+cnL7PKC7XwONUItlDBCrDK4iY8uLERxbTflvoMHtoXQ7YLzv6Hjx+0
	9oU2TVTch1ZudXwRoDmaLzXdxQixSso=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-q4kJAffqOa-tz4PBfSTQzg-1; Mon, 17 Mar 2025 09:31:18 -0400
X-MC-Unique: q4kJAffqOa-tz4PBfSTQzg-1
X-Mimecast-MFC-AGG-ID: q4kJAffqOa-tz4PBfSTQzg_1742218277
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-abb9b2831b7so580240966b.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 06:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742218277; x=1742823077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XicbyQCxRSNC4G7MmnFYTtssAxXR5/Ky4MMYhuVTNrE=;
        b=SyPLFSZ6XV2795mtyz3SBUv+6EWNt6fJ7WZkGzooJq0YadO7PS/bd7D1/LqzkUZqUH
         AU8uVsFezV/78i1djDgE8n0vCzzFEgV+NAV/mBezgI/oe5Ufjizv1WHVAMBQY0xm/UpI
         s+cJr9Kxf+4IycZVPeclSnFx7WNVQryC2EDFpcVWdtwiOoQ+Iak7z1fkbyqoXjuHiHuk
         fhgO7u/FiiNTFtHlLk9oKqDpjSqVkDFQkvaGQecNSnIIIBUyfgy61uiKROX87VQKl/Vi
         ZDh57hNh0MVcOIbPCo2y2GdN5qD4SiAB+XsKoApotP7Qm+iX2FuS/vjUyx7k4zAVHlf1
         k6Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXHtND842GyzaHkMmP/Q9GMdwiAM3uY/vUF+PVk4rAOhxxTPeOb+vLyiyCViYgkyyh73v17Uvn9ouQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP/ZnfOvUn7KM1i664SjWNTx+AVOi+l3+EAHglDUCPxg1+fsba
	nbHdaCCR+FbBkbx1NBih8a2ksL2dEWwb2RMV4rG1YAX4ePH+fZ432KY4NQyKwyoNdE/jgCLo7ZS
	2410aTj3MgjNc2T0f5Y5bNULhbrVllYbNM6Hgx1ZDkN2Rl7zf6vxPgxlyLg==
X-Gm-Gg: ASbGncv1G2whqJtA5e5zFHYvqTAmKR72QzE6Q3nmoiYZ96+8f6E7W8GfVO7biKRYhDn
	FFEiPeL7bu1NDp8QYKqhzXwlbQ4khuswHkq9hQg1nLyhoAZSDRRCGSItk5TyxJQ/3QdV/vcPAba
	yZ6JLw+59Z7JXhViOQHKGBfxvyJorQQoaD4QSit2yNsmdAsxBEWfcQ/Ym/DkBUus0taQfljqgkU
	feeCxnhwmegIqC0S3UrWpp7PaALhkamWIco0YSP3AIq4cZWJdKWJBLi75jZ+g2VKqDn3XZW3sAQ
	NaLjEKgT4U/+f9+Xbgg=
X-Received: by 2002:a05:6402:13c7:b0:5db:e88c:914f with SMTP id 4fb4d7f45d1cf-5e8b02242c4mr11890282a12.4.1742218277334;
        Mon, 17 Mar 2025 06:31:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhZiaJYx30uK3+q9vUUtAFQDkx1k1IDJZJR9UYxtCzYRPH7G5wkGZMkjI62F2gMmOFEuwo9g==
X-Received: by 2002:a05:6402:13c7:b0:5db:e88c:914f with SMTP id 4fb4d7f45d1cf-5e8b02242c4mr11890206a12.4.1742218276779;
        Mon, 17 Mar 2025 06:31:16 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b1602sm6056505a12.42.2025.03.17.06.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 06:31:16 -0700 (PDT)
Message-ID: <82e27f38-f951-4e6f-babd-81890d590a04@redhat.com>
Date: Mon, 17 Mar 2025 14:31:15 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/13] power: supply: add inhibit-charge-s0 to
 charge_behaviour
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Joaquin Ignacio Aramendia <samsagax@gmail.com>,
 Derek J Clark <derekjohn.clark@gmail.com>,
 Kevin Greenberg <kdgreenberg234@protonmail.com>,
 Joshua Tam <csinaction@pm.me>, Parth Menon <parthasarathymenon@gmail.com>,
 Eileen <eileen@one-netbook.com>
References: <20250311165406.331046-1-lkml@antheas.dev>
 <20250311165406.331046-6-lkml@antheas.dev>
 <b1ac8a33-06ed-482a-b5f6-ca88eb3802a1@redhat.com>
 <CAGwozwGESTw2DJsqr3uAhEymXxH4O5EXDw6O91i8CzCT0=yC1Q@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAGwozwGESTw2DJsqr3uAhEymXxH4O5EXDw6O91i8CzCT0=yC1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Mar-25 13:38, Antheas Kapenekakis wrote:
> On Mon, 17 Mar 2025 at 13:27, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Antheas,
>>
>> On 11-Mar-25 17:53, Antheas Kapenekakis wrote:
>>> OneXPlayer devices have a charge bypass
>>
>> The term "charge bypass" is typically used for the case where the
>> external charger gets directly connected to the battery cells,
>> bypassing the charge-IC inside the device, in making
>> the external charger directly responsible for battery/charge
>> management.
>>
>> Yet you name the feature inhibit charge, so I guess it simply
>> disables charging of the battery rather then doing an actual
>> chaerger-IC bypass ?
>>
>> Assuming I have this correct, please stop using the term
>> charge-bypass as that has a specific (different) meaning.
> 
> Unfortunately, this is how the feature is called in Windows. On both
> OneXPlayer and Ayaneo. Manufacturers are centralizing around that
> term.

Ok, so I just did a quick duckduckgo for this and it looks like
you are right.

> Under the hood, it should be bypassing the charger circuitry, but it
> is not obvious during use.

Ack reading up on this it seems the idea is not to connect the external
charger directly to the battery to allow fast-charging without
the charge-IC inside the device adding heat, which is the traditional
bypass mode.

Instead the whole battery + charging-IC are cut out of the circuit
(so bypassed) and the charger is now directly powering the device
without the battery acting as a buffer if the power-draw superseeds
what the external charger can deliver.

> The user behavior mirrors `inhibit-charge`,
> as the battery just stops charging, so the endpoint is appropriate.

Hmm this new bypass mode indeed does seem to mirror inhibit charge
from a user pov, but it does more. It reminds me of the battery disconnect
option which some charge-ICs have which just puts the battery FET in
high impedance mode effectively disconnecting the battery. Now that
feature is intended for long term storage of devices with a builtin
battery and it typically also immediately powers off the device ...

Still I wonder if it would make sense to add a new "disconnect"
charge_behaviour or charge_types enum value for this ?




<snip>

>>> diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
>>> index 2a5c1a09a28f..4a187ca11f92 100644
>>> --- a/Documentation/ABI/testing/sysfs-class-power
>>> +++ b/Documentation/ABI/testing/sysfs-class-power
>>> @@ -508,11 +508,12 @@ Description:
>>>               Access: Read, Write
>>>
>>>               Valid values:
>>> -                     ================ ====================================
>>> -                     auto:            Charge normally, respect thresholds
>>> -                     inhibit-charge:  Do not charge while AC is attached
>>> -                     force-discharge: Force discharge while AC is attached
>>> -                     ================ ====================================
>>> +                     ================== =====================================
>>> +                     auto:              Charge normally, respect thresholds
>>> +                     inhibit-charge:    Do not charge while AC is attached
>>> +                     inhibit-charge-s0: same as inhibit-charge but only in S0
>>
>> Only in S0 suggests that charging gets disabled when the device is on / in-use,
>> I guess this is intended to avoid generating extra heat while the device is on?
>>
>> What about when the device is suspended, should the battery charge then ?
>>
>> On x86 we've 2 sorts of suspends S3, and the current name suggests that the
>> device will charge (no inhibit) then. But modern hw almost always uses
>> s0i3 / suspend to idle suspend and the name suggests charging would then
>> still be inhibited?
>>
>> Also s0 is an ACPI specific term, so basically 2 remarks here:
>>
>> 1. The name should probably be "inhibit-charge-when-on" since the power_supply
>>    calls is platform agnositic and "S0" is not.
> 
> I tried to be minimal. If we want to make the name longer, I vote for
> "inhibit-charge-awake". I can spin a v5 with that.
> 
> The device does not charge while asleep. Only when it is off.

Is suspend awake though ? 

>> 2. We need to clearly define what happens when the device is suspended and then
>>    make sure that the driver matches this (e.g. if we want to *not* inhibit during
>>    suspend we may need to turn this feature off during suspend).
> 
> This is handled by the device when it comes to OneXPlayer. No driver
> changes are needed.

Well you say no charging is done when suspended, the question also is what
behavior do we want here?  I'm fine with the default behaviour, but a case
could be made that charging while suspended might be desirable (dependent on
the use case) in which case we would need to disable the inhibit when
suspending to get the desired behavior.

Also what if other firmware interfaces with a bypass^W inhibit option work
differently and do charge during suspend ?

It is important that we clearly define the expected behavior now so that
future devices can be made to behave the same.

Regards,

Hans



