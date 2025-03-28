Return-Path: <linux-doc+bounces-41884-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6CA75265
	for <lists+linux-doc@lfdr.de>; Fri, 28 Mar 2025 23:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C3821736BE
	for <lists+linux-doc@lfdr.de>; Fri, 28 Mar 2025 22:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27ED71EFF84;
	Fri, 28 Mar 2025 22:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UvsBsNtA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A711DDC20
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743200101; cv=none; b=GyjzePSzMM4ULBJRUCnQqXoM2yW+Ddb+ex29NADc/H1TioKEEb7JV1Aag9XyuXc44fLjTP11e2j5ojNwxLPvEwsiJQVXQ3ZQ0vYLGHtW3jaHDLBhD7FZSUfDP5a5eSYPsbumxhA2qznotFXlUT+Y9Vrui0naTNXpwsmALqUb2jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743200101; c=relaxed/simple;
	bh=3LhOBh1if/G4lc3HsqhYB39Qdkno2Qt5JqUSH0+F/e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSzZ6bB7xRSk3n1FJVgeoxcVNY15Eyg30GukFJ8ZJlJVcIyf0KvrpYyjGpURsDXCSb3XK5mK8oze4JSUpDtXbGYFxUhAwDbcAUI8Do27pJacC9b5a2ccgby8jNvjWoE+mVbnANjOdtcssk/GgkgKSPeNRjdTUSdGV8/W1AvYT6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UvsBsNtA; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3cf8e017abcso9715965ab.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 15:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743200098; x=1743804898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
        b=UvsBsNtArvRdDUeYA8UGU7XjwlDQbEMdhhEvZBr3aX3UOeuHbcWFDMVauG2NjQSEIH
         I65xsCKMykFCD6ZMgGOL7Ke6isQ3ZoNtt7/hyQ26RocNyWRImmT2UXRad6HULRG0QhTD
         F0KplDBlDAJ7+ptEMXg1rxs++Dwd3d75kQr00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743200098; x=1743804898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
        b=v/JgpMrtLvy8WtdlkZc5IDsC8zzVmTAKWlmEmmehDjjYURsKU+6pOazg0H30++X36x
         9UF+B5ze4lmCmoIptFoUgmvz8PUjRVskw7UWO+moEXtleVhwf+YKqCgS/J8MDX+JYbg/
         jtTbkrBipqIBDoln8qCSZfT5ZMAVN06wXj3z3Z9GbxIM9uDHswb8dZqOZMqPvS+BMH6z
         OJO17mGwrsLADd132RFytgNonMKmDhlCCEWghCRBOyjXJCQG5hAh0sAwAPKre5DcQx3L
         OsAPnaoewub5IFnizc6p8qkxSNCy96TDhm7VEsAjhpA8Pw5ZM86bBBMlY9xHozOdJjbO
         MahA==
X-Forwarded-Encrypted: i=1; AJvYcCWpQ2vbzrXTUK5j/+j8zYDdQyfRwHIlcDPmUykB0HxTcHhX9ryRX+RjuOOsnM0ktvPImsqn91xpAdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YypJ5NNj6WlpAL4qhvA8KgGqUnahPcG0taoRSyU5FqEzE84JNJQ
	8k0+BwTrrMddSGrl1D0Ik9hl+gVp/XMqy0AQjn4yB7CXC/5RAt3zkxoPAlclN0c=
X-Gm-Gg: ASbGnct/u+1x9NeE9/KWchbdFw4tjWMwKtANklpEAU2Zzt+h21mgpHJTw9urmBpxsz5
	e/9baTFgRDNaA2uMcGV8g+bbOClTTCfQUez9GR5d4/B9+iaiJELV79yzwMq1xwvG/yq6iBOXz6T
	lvDP4/zp9JQhlX0bc+qfOEo66CyqyHHlO2V1AaMX9UMsysQXFl3KNnUFiUmrvhWDY2koBpNCjd6
	pxtekzFxeSbmUi1Rnpap6uhLr7gF2af+mYtmuy/nWO9nCUZoGKdfvoAKFzEc7RI3Qs62ee+K/38
	5O0R3QP3jrPZRnOyVzu9wksWh6TSCLqNztW4FMnFKfmUtklGHJwtmLE=
X-Google-Smtp-Source: AGHT+IHAgQaNQm7V/HQ9xhZOQz/Fs6tsLI4+HRU2b6hOJkb/FR7IJnx7J0M2QjLjv4gsNmH0eGf+NQ==
X-Received: by 2002:a05:6e02:3807:b0:3d0:47cf:869c with SMTP id e9e14a558f8ab-3d5e0a004a5mr11036025ab.19.1743200097993;
        Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464751ebasm643215173.57.2025.03.28.15.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Message-ID: <a998f3fa-495c-4165-884a-a11c5cb61e96@linuxfoundation.org>
Date: Fri, 28 Mar 2025 16:14:55 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
To: Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: Maxime Ripard <mripard@kernel.org>, Kees Cook <kees@kernel.org>,
 Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, Arthur Grillo
 <arthurgrillo@riseup.net>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
 <20250313-abiding-vivid-robin-159dfa@houat>
 <c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
 <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/25 16:05, Andrew Morton wrote:
> On Thu, 13 Mar 2025 11:31:12 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
>>>>
>>>> Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
>>>> very noisy tests much easier to deal with.
>>>
>>> And for the record, we're also affected by this in DRM and would very
>>> much like to get it merged in one shape or another.
>>>
>>
>> I was unable to get maintainers of major architectures interested enough
>> to provide feedback, and did not see a path forward. Maybe Alessandro
>> has more success than me.
> 
> I'll put them into mm.git, to advance things a bit.

I haven't heard from kunit maintainers yet. This thread got lost
in inbox due to travel.

David/Brendan/Rae, Okay to take this series?

Andrew, Okay to take this through your tree - this needs merging.

thanks,
-- Shuah


