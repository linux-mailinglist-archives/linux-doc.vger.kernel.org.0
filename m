Return-Path: <linux-doc+bounces-754-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E504E7D1BEE
	for <lists+linux-doc@lfdr.de>; Sat, 21 Oct 2023 11:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74FF9B213F7
	for <lists+linux-doc@lfdr.de>; Sat, 21 Oct 2023 09:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83EBD281;
	Sat, 21 Oct 2023 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sut9WGxK"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92139653
	for <linux-doc@vger.kernel.org>; Sat, 21 Oct 2023 09:08:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A75D6B
	for <linux-doc@vger.kernel.org>; Sat, 21 Oct 2023 02:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697879308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Duv/vRzaqiVheQFpKN6BpeiI42/H7vnpG0VOqBtei/A=;
	b=Sut9WGxKNnUJeWOehrgyL4Wpp9vd/ak9PMxuqIkCYU69qMjC/pzUhzvXtPzDx/12qbSQAq
	V1H0mcoubQE9AMbYSIwhou1VBPfZ4Pws8ZeKDigT2VnXf8N5pOqn7MO/dZj+mlAJ6duJiw
	QyP+HvVWpVVDRIm8NT89vuqUuXVArDQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-vK2JazjrOKOd-z-D35--0A-1; Sat, 21 Oct 2023 05:08:26 -0400
X-MC-Unique: vK2JazjrOKOd-z-D35--0A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9c7558b7b85so102583966b.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Oct 2023 02:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697879305; x=1698484105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Duv/vRzaqiVheQFpKN6BpeiI42/H7vnpG0VOqBtei/A=;
        b=cCQ7o/Tm+Kvvlhu1q4klDtdMQ9JtdLgxsV6zSM1VeoF/fL3N/0+kBjC1+r5xQcahFQ
         4R1zyY/ty+rZlSPiVCHCu6c1yI59axpvXzQadEMr0be400nJjqPrzqU1uhjx38mCta4e
         QOy+coK4J/ml9Ewp8y5ETkrm59u2+Iizw3YhK1cCJe0kGZ6V3IouDV9ak1OPlvr907ZA
         422B1mmRJ8WxGzFWVX4klsBW3Nm2Zr2DaAGxXLut2X7BVqg83Q+VbJrxgEt9WekY6Ew+
         LSRUQmnFVeYDcmK4XnvwF3hIFNyYtReRgXWM0BtfB/5YX1c+I/vZMKq+yRq35OQXhqAU
         Q95w==
X-Gm-Message-State: AOJu0YylgOfGTPXmMSglz7aezzd8JR9AbPzPNpYQbHdW4yvZnuaVb68o
	TtXRo0B0uAnJun9CqHUWWnRhgy0PlK1XCZJCQ8umYcS+sNxr8qL7hGMAunb87Og2LjvFYHgUi+A
	m3mCvACC43ZzLMmObV64J
X-Received: by 2002:a17:907:2cc4:b0:9c3:d356:ad0c with SMTP id hg4-20020a1709072cc400b009c3d356ad0cmr3284640ejc.24.1697879305124;
        Sat, 21 Oct 2023 02:08:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNqtW+MndTr+TWmmj2VbzRQsCnDbztAGvz9JDMu9I4Oq15U8bQsUZjmiRgthR6bMx8lB0Nzg==
X-Received: by 2002:a17:907:2cc4:b0:9c3:d356:ad0c with SMTP id hg4-20020a1709072cc400b009c3d356ad0cmr3284603ejc.24.1697879304753;
        Sat, 21 Oct 2023 02:08:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k9-20020a1709061c0900b0099ce025f8ccsm3201413ejg.186.2023.10.21.02.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 02:08:23 -0700 (PDT)
Message-ID: <01a505ac-320f-3819-a58d-2b82c1bf2a86@redhat.com>
Date: Sat, 21 Oct 2023 11:08:22 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] pwm: make it possible to apply pwm changes in
 atomic context
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <cover.1697534024.git.sean@mess.org>
 <a7fcd19938d5422abc59c968ff7b3d5c275577ed.1697534024.git.sean@mess.org>
 <90728c06-4c6c-b3d2-4723-c24711be2fa5@redhat.com>
 <20231019105118.64gdzzixwqrztjir@pengutronix.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231019105118.64gdzzixwqrztjir@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Uwe,

On 10/19/23 12:51, Uwe Kleine-König wrote:
> On Wed, Oct 18, 2023 at 03:57:48PM +0200, Hans de Goede wrote:
>> Hi Sean,
>>
>> On 10/17/23 11:17, Sean Young wrote:
>>> Some drivers require sleeping, for example if the pwm device is connected
>>> over i2c. The pwm-ir-tx requires precise timing, and sleeping causes havoc
>>> with the generated IR signal when sleeping occurs.
>>>
>>> This patch makes it possible to use pwm when the driver does not sleep,
>>> by introducing the pwm_can_sleep() function.
>>>
>>> Signed-off-by: Sean Young <sean@mess.org>
>>
>> I have no objection to this patch by itself, but it seems a bit
>> of unnecessary churn to change all current callers of pwm_apply_state()
>> to a new API.
> 
> The idea is to improve the semantic of the function name, see
> https://lore.kernel.org/linux-pwm/20231013180449.mcdmklbsz2rlymzz@pengutronix.de
> for more context.

Hmm, so the argument here is that the GPIO API has this, but GPIOs
generally speaking can be set atomically, so there not being able
to set it atomically is special.

OTOH we have many many many other kernel functions which may sleep
and we don't all postfix them with _can_sleep.

And for PWM controllers pwm_apply_state is IMHO sorta expected to
sleep. Many of these are attached over I2C so things will sleep,
others have a handshake to wait for the current dutycycle to
end before you can apply a second change on top of an earlier
change during the current dutycycle which often also involves
sleeping.

So the natural/expeected thing for pwm_apply_state() is to sleep
and thus it does not need a postfix for this IMHO.

> I think it's very subjective if you consider this
> churn or not.

I consider it churn because I don't think adding a postfix
for what is the default/expected behavior is a good idea
(with GPIOs not sleeping is the expected behavior).

I agree that this is very subjective and very much goes
into the territory of bikeshedding. So please consider
the above my 2 cents on this and lets leave it at that.

> While it's nice to have every caller converted in a single
> step, I'd go for
> 
> 	#define pwm_apply_state(pwm, state) pwm_apply_cansleep(pwm, state)
> 
> , keep that macro for a while and convert all users step by step. This
> way we don't needlessly break oot code and the changes to convert to the
> new API can go via their usual trees without time pressure.

I don't think there are enough users of pwm_apply_state() to warrant
such an exercise.

So if people want to move ahead with the _can_sleep postfix addition
(still not a fan) here is my acked-by for the drivers/platform/x86
changes, for merging this through the PWM tree in a single commit:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



