Return-Path: <linux-doc+bounces-1311-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 162597D9C2E
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 16:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45C9D1C20FF6
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 14:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D31220307;
	Fri, 27 Oct 2023 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bp8dJBCF"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB1918654
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 14:51:47 +0000 (UTC)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3E5116;
	Fri, 27 Oct 2023 07:51:46 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a7c95b8d14so16596137b3.3;
        Fri, 27 Oct 2023 07:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698418305; x=1699023105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gqSTgMpjvwjEG6zX4EYuoKDbHRWrHJZpU1DU8ot3yTA=;
        b=bp8dJBCFxpQKgA7AEUzxKNyf5kJwgB71NVxw/WnpzXkm+TjCIVjxwHLX6lYESSYrgU
         FzdG1iJbwX8sckdzaf+LaKtXqurw4xEnpUQt9kpiC795DXT9iq841WftRQlAd0cr3bxV
         7G1fjGwIkONyfQ59XT45KfzvsaMwFAshWUZ99Vf8LvHOkBjhq10jUjS9n6HvvwK10Iqb
         gOc/vozfrqUiyl540hA0YJFlmBhMS9e35mi6x6bGfJqGwj4NyR6Kevlrr3YsE4j9qX9N
         kiXCKpy9DyXAUtEVCdNxVzmwqIiOuosMSX9vp/zYN3jI9E0sWU+xX3Yco3J0E4xUjwKr
         dYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698418305; x=1699023105;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqSTgMpjvwjEG6zX4EYuoKDbHRWrHJZpU1DU8ot3yTA=;
        b=iGHiYy2QG0PCtC6/zR/voLWUA6VgRQ5mOaS66vMPfGAQR78AdCDatt/WyH3j8jGYvk
         ygYH0+bBnz2qM/3EcytSfluQj48cdyQfrXEpTw+kSiCCoI2+S7mRVhZJ6GPhT/5ddrbX
         +dwenVRLH1ww7kZTRlDJpBE4V9BE6zW8E9e6XMTL/WCirv9499YpcSpJaQ3Yra+dfFuY
         XvJQdnzSloTU1VXZDhAM+kJeYyPvLbKuPyCuAP0uwxqu2VnjJP+Qsv374+D8S8oLkKQD
         vmcY1wuB+jVBFFO5oCHKBafqTg5NXOyIrXVn1vE0Bw1zOHdbflGN7eylP3jbjE2mS2Kq
         1S6Q==
X-Gm-Message-State: AOJu0YzNRBjb2GvW8VokZmD+eXkb63I6sgc6wxWqJm/6tSwOTaU6KehV
	CqERv3DB54AhEjEpEkb7I3LLHE7d1Wg=
X-Google-Smtp-Source: AGHT+IEjV4qlaspuKf6rNulZMVRtxtprMb9GLsOfhHcPpCXq76DKC6+9nMUXFE75JKPbeu/WlhFEFw==
X-Received: by 2002:a05:690c:ed0:b0:5af:f026:a27 with SMTP id cs16-20020a05690c0ed000b005aff0260a27mr1558420ywb.50.1698418305060;
        Fri, 27 Oct 2023 07:51:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r64-20020a819a43000000b00586108dd8f5sm764616ywg.18.2023.10.27.07.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 07:51:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <84252c5e-9a39-91bd-b7da-2bdea1b2aff6@roeck-us.net>
Date: Fri, 27 Oct 2023 07:51:43 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "Matyas, Daniel" <Daniel.Matyas@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20231026144405.546822-1-daniel.matyas@analog.com>
 <20231026144405.546822-2-daniel.matyas@analog.com>
 <fe99431e-3245-484c-bf26-928048500ec6@roeck-us.net>
 <PH0PR03MB67712B3C063B794442F6D58A89DCA@PH0PR03MB6771.namprd03.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 2/4] hwmon: max31827: Add support for max31828 and
 max31829
In-Reply-To: <PH0PR03MB67712B3C063B794442F6D58A89DCA@PH0PR03MB6771.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/23 06:00, Matyas, Daniel wrote:
[ ... ]

>> I also don't understand why that would be chip specific. I don't see
>> anything along that line in the datasheet.
>>
>> Ah, wait ... I guess that is supposed to reflect the chip default.
>> I don't see why the chip default makes a difference - a well defined default
>> must be set either way. Again, there is no guarantee that the chip is in its
>> default state when the driver is loaded.
> 
> The well defined default was set in v4, but I deleted it, because the default value in hex for max31827 and max31828 alarm polarity, and max31827 fault queue is 0x0. I had 2 #defines for these values, but you said:
> " Since MAX31827_ALRM_POL_LOW is 0, this code doesn't really do anything and just pollutes the code."
> 
> So, I thought I should remove it altogether, since res is set to 0 in the beginning and the default value of these chips (i.e. 0) is implicitly set.
> 
>>
>> Also, why are the default values added in this patch and not in the
>> previous patch ?
>>
> 
> In v4 these default values were set in the previous patch.
>   

I asked you (or meant to ask you) to stop overwriting 0 with 0
in a variable. I didn't mean to ask you (if I did) to stop writing
the default value into the chip. Sorry if I did; if so, that was
a misunderstanding.

Guenter


