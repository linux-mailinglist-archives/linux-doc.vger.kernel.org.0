Return-Path: <linux-doc+bounces-38683-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E49B0A3C015
	for <lists+linux-doc@lfdr.de>; Wed, 19 Feb 2025 14:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85CAB3B754B
	for <lists+linux-doc@lfdr.de>; Wed, 19 Feb 2025 13:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1A61E2842;
	Wed, 19 Feb 2025 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ncbIjqGi"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BA61E378C;
	Wed, 19 Feb 2025 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972124; cv=none; b=D41oIR93tfM8TUtMs7DOGJxjlNej0AmckAg7besaySEZJ1+wfyg5tWy6nzRGcxla+MO3dxJbqstllNJuOHzjD5hPyEulTaLF2ZqRp3SuSeQ9XgiIvi5iOop4//ZygUf41xV8PLdbiW5Sh2Vy0Y8kLSLwoTA0f8OCr5PbwEC16Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972124; c=relaxed/simple;
	bh=A/dckfyquWQps4kYztwWINKs+R6MQVvGU5K9COsP9Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VR5rh3/q88AM/orCusS6RZlrYoVO1lMVTH84FgsEOWpaOZTghrmBquiWy7JkQaKZSNOb6J35AinGSw7DiUZhZ9/lgL6POXl5rl+Rli7O4s1e3qsTgr3tqzGLPzuxMTy8NrYOMwV5YhwE6m9ydir1I9fodik3+bPULGLeQcTIWyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ncbIjqGi; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2F6E204D1;
	Wed, 19 Feb 2025 13:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739972119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BatAYY4Q/qo6xTguZ+6kbDWPJ2CAwSm7b4xhPetFDR4=;
	b=ncbIjqGivyenB+N+qbvpXVXRFGmmOvvlsJyBW/GkAcSi1hdMpCV2q0yFpEDlQI7NV3mCF3
	Xa6EM3FDKq7u46PoNQwJC0INLghZs/2pyQI2jgEL+/QTndn0tlKNl4uRwTfDqsl5RTsGO5
	6k02sj5XKJxp9qAnc/+ChDV05sGavLBm/6t5+KhhuVzrCDevYocXnNcLeLF8goWHYqzYdJ
	9plDOOeX86qac7zUoaXYz6jwyGnfONExWe3Cc/l0nW5Wpmet7mqStsJWckkiK6g2qJ+hcl
	A6pOo+sr6FmRSWB9vXhCTFr4LeplDC6doFAtXV/SAr4Ab5KQxsU7CGVRib7yTQ==
Message-ID: <ce5fb86d-f3bc-4196-9cfd-8af41a83beb1@bootlin.com>
Date: Wed, 19 Feb 2025 14:35:14 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
To: Maxime Ripard <mripard@kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 rdunlap@infradead.org, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, linux-doc@vger.kernel.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
 <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
 <qwym5wty72f6o4dfz2iduamkpuom6jt5txskknovqxzagruusx@zuytk7awe2uw>
 <Z5dkd3npNtzPWCrP@louis-chauvet-laptop>
 <20250205-pristine-perch-of-abundance-7abac1@houat>
 <Z6OEd329pDNRrL5v@louis-chauvet-laptop>
 <20250219-inventive-micro-parrot-c24846@houat>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250219-inventive-micro-parrot-c24846@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuvdetgeevkefhiedugfekveejieeiveeigeeiveduffehfffhgeffffetheekgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhoughrihhgohhsihhquhgvihhrrghmvghlohesghhmrghilhdrtghomhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrihhrrggtrghnrghlsehrihhsvghuphdrnhgvthdprhgtphhtt
 hhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com



Le 19/02/2025 à 11:15, Maxime Ripard a écrit :
> On Wed, Feb 05, 2025 at 04:32:07PM +0100, Louis Chauvet wrote:
>> On 05/02/25 - 09:55, Maxime Ripard wrote:
>>> On Mon, Jan 27, 2025 at 11:48:23AM +0100, Louis Chauvet wrote:
>>>> On 26/01/25 - 18:06, Maxime Ripard wrote:
>>>>> On Tue, Jan 21, 2025 at 11:48:06AM +0100, Louis Chauvet wrote:
>>>>>> +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>>>>>> +	/*
>>>>>> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
>>>>>> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
>>>>>> +	 *                     in_bits = 16,
>>>>>> +	 *                     in_legal = False,
>>>>>> +	 *                     in_int = True,
>>>>>> +	 *                     out_bits = 8,
>>>>>> +	 *                     out_legal = False,
>>>>>> +	 *                     out_int = True)
>>>>>> +	 *
>>>>>> +	 * Test cases for conversion between YUV BT601 full range and RGB
>>>>>> +	 * using the ITU-R BT.601 weights.
>>>>>> +	 */
>>>>>
>>>>> What are the input and output formats?
>>>>>
>>>>> Ditto for all the other tests.
>>>>
>>>> There is no really "input" and "output" format, they are reference values
>>>> for conversion, you should be able to use it in both direction. They are
>>>> generated by RGB_to_YCbCr (RGB input, YUV output) just because it was
>>>> easier to create the colors from RGB values.
>>>
>>> RGB and YUV aren't formats, they are color models. XRGB8888 is a format.
>>> NV12 is a format.
>>>
>>>> If you think we should specify what is was used as input and output to
>>>> generate those values, I can modify the comment to:
>>>>
>>>> 	Tests cases for color conversion generated by converting RGB
>>>> 	values to YUV BT601 full range using the ITU-R BT.601 weights.
>>>
>>> My point is that those comments should provide a way to reimplement the
>>> test from scratch, and compare to the actual implementation. It's useful
>>> when you have a test failure and start to wonder if the implementation
>>> or the test is at fault.
>>>
>>> By saying only RGB and YUV, you can't possibly do that.
>>
>> I understand your concern, but I believe there might be a slight
>> misunderstanding. The table in question stores reference values for
>> specific color models, not formats. Therefore, it doesn't specify any
>> particular format like XRGB8888 or NV12.
>>
>> To clarify this, I can rename the format_pair struct to value_pair. This
>> should make it clearer that we are dealing with color model values rather
>> than formats.
>>
>> If you want to test a specific format conversion, such as
>> YUV420_to_argbu16, you would need to follow a process like this:
>>
>> 	// Recreate a YUV420 data
>> 	plane_1[0] = test_case.yuv.y
>> 	plane_2[0] = test_case.yuv.u
>> 	plane_2[1] = test_case.yuv.v
>>
>> 	// convertion to test from YUV420 format to argb_u16
>> 	rgb_u16 = convert_YUV420_to_argbu16(plane_1, plane_2)
>>
>> 	// ensure the conversion is valid
>> 	assert_eq(rgb_u16, test_case.rgb)
>>
>> The current test is not performing this kind of format conversion.
>> Instead, it verifies that for given (y, u, v) values, the correct (r, g,
>> b, a) values are obtained.
> 
> You already stated that you check for the A, R, G, and B components. On
> how many bits are the values you are comparing stored? The YUV values
> you are comparing are stored on how many bits for each channel? With
> subsampling?
> 
> If you want to compare values, you need to encode a given color into
> bits, and the way that encoding is done is what the format is about.
> 
> You might not compare the memory layout but each component individually,
> but it's still a format.

Sorry, I think I misunderstood what a format really is. But even with 
this explanation, I don't understand well what you ask me to change. Is 
this better:

The values are computed by converting RGB values, with each component 
stored as u16, to YUV values, with each component stored as u8. The 
conversion is done from RGB full range to YUV BT601 full range using the 
ITU-R BT.601 weights.

TBH, I do not understand what you are asking for exactly. Can you please 
give the sentence you expect directly?

Thanks,
Louis Chauvet

> And then, you have the extra fun on top, like are you comparing
> full-range or limited-range colors?
> 
>> In other words, it tests color model conversion, not format conversion.
> 
> No, you are testing color encoding, format and model conversions, all at
> once.
> 
> Maxime

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


