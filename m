Return-Path: <linux-doc+bounces-3779-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02151800EF1
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 17:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA28C281C09
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 16:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF4F4BA89;
	Fri,  1 Dec 2023 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uu8342zh"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F511B2;
	Fri,  1 Dec 2023 08:04:18 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6cdfee14c24so731528b3a.2;
        Fri, 01 Dec 2023 08:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701446658; x=1702051458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HuWRgEfB2gJpZPQw/Cwowh24P+d6lxkRX8lCOmWSQMc=;
        b=Uu8342zhG45HPWTYK1LWBpd2/qycr4aZMUIJjrRnf60N8ea5xorVmVRkmYaDxH7HtO
         XAQi/asOt+pGOC+ACyGQcEetVW4Qqo6M39ZRgsZRSkbd7yfwe70cznM+jILXpejgWJoH
         XOo/IbuqICFED7VjQRphJBC7RLYEWivrEUBNXKRQjIE4pSt7hKvugQKBCS9+AZewvD8+
         5QY8OfXce7aCjfINThIhF9pbbjt2A2Omk+S2nrzeVZxYbCDrIRhkh5fT6YJsNlVPC0qy
         LWHDNApgLzHzzeU1WBkmdZAWrmcLSBgSPzsXW/SIhqn1kl7D2KAmePSPbXBDfGCpYK7v
         1FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701446658; x=1702051458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HuWRgEfB2gJpZPQw/Cwowh24P+d6lxkRX8lCOmWSQMc=;
        b=sCIULadgTkINNIogCKIatoLPNGDq9llW2zX89Y/y1HKfi3K9juzbYfSH0aEWmTKh+G
         12/2T26cZd7XI/c8I68DwtpYa+IVKvtz2TEXf7jIPgE6p0TC7xMqHtu1MsjjmiyjPBYd
         D84aYeaUHfA3Db5Z1h7gL2/3PNBGm/npzorDBOBi6Bwro+7vj7A1EruHb4R3zYDRiWCU
         NSb0kRtLu6tKl1NExVRn7PcrRyTgKFuhbSQLWffZ7ptPpGepXWbWy8euufSsyUd2aR3N
         yRoi8ejJpZFX1EMK4gxR7yrcrRA/9NlNPuWSMdzQEqGgTvnH92MNVrfhuTANU3eZMMtn
         ++Mw==
X-Gm-Message-State: AOJu0Yw+ZpaB72c585mwprq19AIJfd7Cq/MeAS0Sz4MUCWiY6BVJQGLn
	9Jd+gA5hvllNtEyMbhkzcqU=
X-Google-Smtp-Source: AGHT+IECN4GkAeqTSyXRHp+NuMWQXhCaG8WPLtDZTVmielY2laSvJNDXvUVL7zmyn7df95YbGeBqPw==
X-Received: by 2002:a05:6a21:1a9:b0:18c:6c2:5369 with SMTP id le41-20020a056a2101a900b0018c06c25369mr27653597pzb.30.1701446655432;
        Fri, 01 Dec 2023 08:04:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t14-20020aa7938e000000b006be047268d5sm3274022pfe.174.2023.12.01.08.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 08:04:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7dc3f137-6073-4262-afb5-439d024bbbd2@roeck-us.net>
Date: Fri, 1 Dec 2023 08:04:12 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Content-Language: en-US
To: Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
 <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
 <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
 <ZWiP3i80KnVk9qyx@smile.fi.intel.com>
 <a4bd59df0c5bc1be5d0d6f11b968fd61a59ee2e0.camel@gmail.com>
 <CACRpkdYz+qi42Pz8CgeWybksC0edaVux6rcEhwzjDWnWe9Jr1g@mail.gmail.com>
 <61a8f54835c10db7a9c650ee2e3706b47382c634.camel@gmail.com>
 <CACRpkda55HzPqus5KR-t=xEBkkdND5kYZj1sHdxK+j6QwDUPRg@mail.gmail.com>
 <b761d2497462664d541779857398b2aa893cbee5.camel@gmail.com>
 <ZWoABzufPkdXnrMT@smile.fi.intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZWoABzufPkdXnrMT@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/1/23 07:47, Andy Shevchenko wrote:
> On Fri, Dec 01, 2023 at 04:24:35PM +0100, Nuno Sá wrote:
>> On Fri, 2023-12-01 at 14:40 +0100, Linus Walleij wrote:
> 
> ...
> 
>> Yes, that is the only thing we have. Meaning that there is no hw setting to set the
>> pins to open drain. Open drain is what they are. That is why I'm not seeing the point
>> in having PIN_CONFIG_DRIVE_OPEN_DRAIN implemented.
> 
> At least you have to implement error for PUSH_PULL mode and other modes,
> so from the (core) software point of view the user should be able to ask for
> anything and get an answer from the certain driver that "hey, i do support OD",
> or "hey, push-pull can't be supported with this hw".
> 

It seems to me that this is heading towards a mfd driver. I don't feel comfortable
with all that gpio specific code in the hwmon subsystem.

Maybe I should request that all hwmon chips with gpio support must be implemented
as mfd drivers. I'll have to think about that.

Guenter


