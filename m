Return-Path: <linux-doc+bounces-95780-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kpqkNvaXTmqOQAIAu9opvQ
	(envelope-from <linux-doc+bounces-95780-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 20:33:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 020BA72986E
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 20:33:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dfa8BB6R;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95780-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-95780-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 185C33015140
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 18:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193BC4A33F9;
	Wed,  8 Jul 2026 18:33:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986094C900B
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 18:33:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535584; cv=none; b=Du8n2deVS0oYihd+qsrU/x74KH78tKMC8apc4C+u5TOQkmKwXQo8i+Q7ysPAdAZLXnnJsMXe7/k2euivFy4JbwCaxvYuauzwXVgWiITZBltpi6DEKN3+vvoO8u9Dv7A3T3dIwDagFmNN3mMH2nLkQQSPMvXkA/QXt5zHAfqROLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535584; c=relaxed/simple;
	bh=SHxjgvKIMaYBcy18nLq/RCsUZcXCbDcnAVND+PF4gh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mjAGtNv+TUw1KPfrRHkyWXaCy9SuVjaNdBut9ti7Oioe7qYomsZpo9BT7q1Y8CmiMbP2rN9SKaxYd/lKfXIgROhAQdDvuqeJ99WjAcP8dfGo9cWNIvPZ2YiOo3RRBOFyV6zjNHCtQ4MEuh53uuKl7FnWsBz0VXBhBt+jfru6ZV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfa8BB6R; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc61541f8cso2492925ad.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 11:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783535582; x=1784140382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fokS4FLPD/17BZqVqY44hxzinHKUjbRhuv13BN1UvAg=;
        b=dfa8BB6R3EE9zhZPNy15Dug9EBN6SHEBgMHAhmDen3Bp3qZqjCfyQ6OcJtFFCyKFhu
         sRge97rSauhFMcaHGe5LA8SwjCa+xh+WUpVrTWKbvgCNrHfDEI4zgopYZv/EI87r0i0V
         /vNfmFM6Bap6+NLohY99AiU/tZc+zZTrmN8H6pK3pTGyf72OKwBAUPbxtTSRAojRbnrm
         4E9pAdDhU2aibOw0+1ZeZIcY0fHAReECyXHBW15Rr+XHRTUpyfN4Fj11I8P9gwrCKnwy
         LlmiQN3gS2n3pF334IS0Gs6cKhcjZCDP8HQh4PdRaqE94/DSdzhjBgS0EF8yPTXfTJaV
         nxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535582; x=1784140382;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fokS4FLPD/17BZqVqY44hxzinHKUjbRhuv13BN1UvAg=;
        b=GKpm1C7lwtk/gaeTQXVOqK8XY4Y2xCXDmcc5pfZ/J8xCeGMdx/l/wRoRq3rnnyW6A/
         3FPAYPCa6RBaOHHagN5D3QAZyMD4iVdBQcKgbcswi0V+fEQAtrScHPKP3a/jKO1sRA3F
         F3caE+6aKaGgJ0jSOIF1OSTp6Ni+QF/B5ZI+PDLDWoVk+02z/Cs3atgVfqUBUzTYe3zd
         UJjNckf7si31U5pdWiEzssg2CZcVB4MmR9EUh3Czu/oUjkubThKCuBDjpxS+cvuQJ+S8
         jtVv135PFvM9Ynzu66vXbSE3pTzwbbqFE3gn99bc+48GyUr1INzq9z8jhw3KBlK8p54w
         JWcA==
X-Forwarded-Encrypted: i=1; AHgh+RqARFqouFrA9FMN9xdVKtDKkCjRfTf3A/FcDXlgE6SrrwvrNShdXc0F2nEaOp92Wzp/G7N7Hc7/aZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfUTCYHfqwbsehkeDBm6n4ckCJcBC62zX3FJHx1iWPeJEneTeX
	d3ehB+IcGYFr9+7koKVA71xpi3LzHVeS0OBvSP3bDyGXh3UDr+8bz1bl
X-Gm-Gg: AfdE7cmo5hoXTXRUfnxzwLzJE1NXAu6J7sCsisLcwiNrV/oFzxG++P60FLi6dExUv/2
	wLq0+hO+sXeI5e/4ix7CFofeJ0Rz1zKM7gFdhBhxvO2+ErjZPpe7WXZTbY/vHXCPnOJkBuzC3+C
	IRWMOs5tvUPRwqVF98YUaJ0/M200OHlv3JlwJmVDNsCkbiCdPj0V4lBXTg/CQlRLY4At/d5x7VK
	0VphOcJKLm7fXe7vjdCvdlHqfJrRuyj5E2Fcg8q8YURMtg8ltSCNDlb8hSTidYmMDb26Vuy+2Dl
	mPyWs8otk1IJDb+SJjTIUZ2sGubor66En5y33XCd+T5mtCUbulPo3pT24sdz0iVVA1nymQsztTG
	OBGuamAUlwz1uGuStyF4hPuUNY0vj4TUVdAW35V4EHqBrkNVF8iP7Ku0J3Q37s8flbhTbjDqwCk
	z9/uGVsesSYV9lXDRzg3QR8hTUDmbNW97JQyZFf/4g+xWGv7x0piFfuSOnj9WvBw==
X-Received: by 2002:a05:6a20:da14:b0:3bf:8230:1b71 with SMTP id adf61e73a8af0-3c09b21b139mr10359792637.25.1783535581746;
        Wed, 08 Jul 2026 11:33:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm34245609eec.29.2026.07.08.11.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 11:33:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
Date: Wed, 8 Jul 2026 11:32:58 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices MAX20912
 and MAX20916
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>,
 Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>,
 Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>,
 Antoni Pokusinski <apokusinski01@gmail.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 Abdurrahman Hussain <abdurrahman@nexthop.ai>,
 Kim Seer Paller <kimseer.paller@analog.com>, Colin Huang
 <u8813345@gmail.com>, Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net> <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll> <ak41BRQBNdsQrYww@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ak41BRQBNdsQrYww@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-95780-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:noname.nuno@gmail.com,m:krzk@kernel.org,m:fredchen.openbmc@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:Jonathan.Cameron@huawei.com,m:wenswang@yeah.net,m:Frank.Li@nxp.com,m:chiang.brian@inventec.com,m:chou.cosmo@gmail.com,m:dixitparmar19@gmail.com,m:eajames@linux.ibm.com,m:apokusinski01@gmail.com,m:thorsten.blum@linux.dev,m:ashish.yadav@infineon.com,m:alexisczezar.torreno@analog.com,m:arif.syed@hpe.com,m:tomtsai764@gmail.com,m:abdurrahman@nexthop.ai,m:kimseer.paller@analog.com,m:u8813345@gmail.com,m:Yuxi.Wang@monolithicpower.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:nonamenuno@gmail.com,m:fredchenopenbmc@gmail.com,m:conor@kernel.org,m:choucosmo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lwn.net,linuxfoundation.org,huawei.com,yeah.net,nxp.com,inventec.com,linux.ibm.com,linux.dev,infineon.com,analog.com,hpe.com,nexthop.ai,monolithicpower.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,analog.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 020BA72986E

On 7/8/26 04:32, Nuno Sá wrote:
> On Wed, Jul 08, 2026 at 12:50:25PM +0200, Krzysztof Kozlowski wrote:
>> On Wed, Jul 08, 2026 at 10:19:56AM +0100, Nuno Sá wrote:
>>> On Tue, Jul 07, 2026 at 06:52:48AM -0700, Guenter Roeck wrote:
>>>> On 7/7/26 05:26, Fred Chen wrote:
>>>>> Add support for the Analog Devices MAX20912 and MAX20916 dual-output
>>>>> multiphase voltage regulators with PMBus interfaces.
>>>>>
>>>>> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
>>>>
>>>> Please provide evidence that those chips actually exist.
>>>> Internet search comes up blank. I'll need confirmation
>>>> from someone at Analog.
>>>
>>> Hi Guenter,
>>>
>>> Well, in fact I'm in the middle of preparing a series that adds support
>>> for:
>>>
>>> "max20826"
>>> "max20855b"
>>> "max20908"
>>> "max20912"
>>> "max20916"
>>>
>>> All the above parts have the datasheet under NDA. But before we had a
>>> one page "datasheet" in analog.com but I guess that is gone! For context
>>> I mainly did the base (core) driver for max20826 and then Alexis added
>>> the other ones.
>>>
>>> Not sure how to proceed... I can wait and then work on top of what Fred
>>> has but this patch is very minimal when compared with what we have.
>>> Like:
>>>
>>> * No regulator support;
>>> * No direct mode. The chip has two ways to access registers (paging and
>>> * direct mode).
>>> * No way to count how many phases we have or if RAIL_B (func[1]) is being used at
>>> all.
>>>
>>>
>>> Some other things more intriguing is that these chips, as far as I'm
>>> aware (at least for max20826), always have bit 2 set in ON_OFF_CONFIG so
>>> a gpio vout. Also we needed some special handling to read phase current
>>> which I'm not seeing in the driver. So I would like to understand how
>>> the chip was tested?
>>>
>>> Anyways, if Fred is ok with it I can just finish what I'm doing and send
>>> the patches. It would make sense to have something more complete on
>>> submission but I don't want to just "steal" the work already done.
>>
>> Binding should be in such case posted complete, so probably not a
>> trivial device.
> 
> Yes, in my series bindings are not in trivial as we support the enable
> gpios.
> 

Same question I asked before: What is your use case ?

Thanks,
Guenter


