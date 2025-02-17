Return-Path: <linux-doc+bounces-38308-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF737A3810A
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 12:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72C007A65EF
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 11:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1CC218585;
	Mon, 17 Feb 2025 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OQa3vEUO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84420217713
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739790027; cv=none; b=L1+3WiteN8zvFO7w2AY+r/eB+97di3x/Ki1k93iwDbfPGHIp4y/I2uIbSFVVdeISli6oHps7zlDczoBTxvJkpyBQ35cFo3FtT8w+IzuFA7H4kEz1xpL+0VrC0eKYGSQW98ZnLOxUjgr2zndgOXXDhFhSlKq6DZ6eQD7hb20hXHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739790027; c=relaxed/simple;
	bh=Fqcakq8Z4dK0KW6FqfXsROW5Ca3rxcnHIn+rj3eCIe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bDG4nA1m6rJy6rChs5RGkat+hSlgNXbgMRUl3Vm2QXCw0i3JBD0xhMl9Z7nJ0m/hhd7XMgJtAx8VkEBqs4lgfu8OUFCCGvavTq2HMBuJA8jueOqDv5rq4syh/uYBynJfMLAxxZCyeLG1SDSdeduhjjATcT8dKzRZmRDuSbUHbRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OQa3vEUO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394944f161so3009935e9.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 03:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739790023; x=1740394823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SaV2pSSvbrWhPVnao95hj5C2ZKd6wNQfe6jtbM1LUYU=;
        b=OQa3vEUOABZ8AHxsXHJfuBGLIipPYlV4CETqi7Ykg+QW7xZHgGdBo9Cm0hdRogUnxV
         AlsDJ5e6hYethiIfIrr5yAgsPo9j4WRgSzgAABTyisSfd6mDwxH7HB/g0foQ5g/ssya+
         ku1Q1Or4v6FBzqsyJQZbuhsFSGnkeFL2rYPp+JFkEvD1u5g/OAgUKsjuqYpv9Qdour1M
         d7fLBgVddCrXweECZ8pVLKJRxNXvJsCuoMIgexCbHPsOzmDGkgepOWukcBPn6RxCsrg3
         6D1U8bUW8wjPsY0BlSKM9NWJqjBS0815s8PHfksZjNkUfi1sH3G5BNUVeJT5Zoa4RWdV
         6vaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739790023; x=1740394823;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SaV2pSSvbrWhPVnao95hj5C2ZKd6wNQfe6jtbM1LUYU=;
        b=H7QRC4Zcg6hdr3JeZjNFDqwUgqBu3rfFFJXfBNS6bvSRXhlPPEO3170Lqk06xhtn+R
         2i3T9VB0DDdibiAtcdkDfkMHJWY32WQqKYMH86/cJDDLYFtxIk4Qi4Jwnodp+zfJTJnr
         hVg9hDzDT7DKLBVZAaD4ZxVPbJJUaNrOgjLPYops/nAIBXhsNBjNjNdlLzacysBJYIJy
         FLVOutzz4dQe9BeYYB7lLRmdByQ+usz8RsgvtL9JSJ6b4icDCQQu/owUWCen+If/aj+k
         0LPuxo1A32uZT65d8CKyKKgHkelY65Wk3nzyBXDKQVQdFXcklXwYOmKIOP0ZVP2Sj71a
         AwmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFQzvwVeNaCYasJm+LTssNYmq5EHjD/1v1h581X6Qf9mNsyo0AAx4PCesP7n0Y5lAZjyk2OVJrtWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBuf7cc2KbfIEuIYNu1Yp28dbdEdOYzVHIriwTDySsz6L98q4L
	CujccS2fmwkgHQvmDTBqvyJGmkkAgC5vOPCXoSJbfd5NE6/Rtjqqw5BhqKflGJs=
X-Gm-Gg: ASbGnctRR5jFt2seJSxLGARQ4YMt9atDnq9RkxIqm66Qn5GgOEPqLsMoPeeNkUugctI
	IzYCM2CEZ1p9cLrZFJe+bRZoL0NcLlkkXQpR3zlAbbcPjlHPlK+p2LK00Y1f8IQxNEGlyCorN20
	H//P3w1cKFwdJj2OWIf5An0HJloEiiEu98DCGQZCZjP/XNseFwBmjU50bjJAJ5kXBUAqYJEQ+k8
	FV3sKrkWS1n0QhgB07Vgh2Wvw01thlZyMwZ6s8OP1GdkKITxGoYMVKGnCOsrHGVaJ5FHTaeEE6i
	8cA39Tdv47nEnJJN+bCbdGrwdyegYDSPBek=
X-Google-Smtp-Source: AGHT+IFZ19beHrXuXE+3JKJUMi/evXHnARTOJfyIdfMhErwnEvP2mj3vLMi08stQSyqfnrfgDg2CXw==
X-Received: by 2002:a05:600c:4611:b0:439:8c80:6af3 with SMTP id 5b1f17b1804b1-4398c806dcamr3468915e9.8.1739790022762;
        Mon, 17 Feb 2025 03:00:22 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5655sm11902818f8f.77.2025.02.17.03.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 03:00:21 -0800 (PST)
Message-ID: <e7d33579-d58e-48b7-b0c4-bb77ea1bd788@linaro.org>
Date: Mon, 17 Feb 2025 12:00:19 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: kconfig: Mention IS_REACHABLE as way for
 optional dependency
To: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250215131739.220629-1-krzysztof.kozlowski@linaro.org>
 <eda7d555-d34d-4418-8fc4-a874dcca91fa@app.fastmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <eda7d555-d34d-4418-8fc4-a874dcca91fa@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2025 08:51, Arnd Bergmann wrote:
> On Sat, Feb 15, 2025, at 14:17, Krzysztof Kozlowski wrote:
>> Several drivers express optional Kconfig dependency with FOO || !FOO,
>> but for many choices this is neither suitable (lack of stubs for !FOO
>> like in HWMON) nor really needed and driver can be built in even if FOO
>> is the module.  This is achieved with IS_REACHABLE, so move earlier
>> section from "imply" chapter to "Optional dependencies" and grow the
>> description.
>>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I think this needs to be more strongly worded to heavy discourage
> the use of IS_REACHABLE(). In most cases, anyone trying this has
> just given up on writing correct dependencies and works around
> it in a user-hostile way.
> 

Ack

>> +1. If pre-processor can discard entire optional code or module BAR does not
>> +   provide !BAR stubs then call can be guarded with IS_REACHABLE()::
>> +
>> +	foo_init()
>> +	{
>> +		if (IS_REACHABLE(CONFIG_BAR))
>> +			bar_register(&foo);
>> +		...
>> +	}
>> +
>> +   Drawback: this might lead to run-time debugging, when looking why
>> +   bar_register() was not called.
> 
> From this description, I wouldn't expect most readers to understand
> what you mean with "run-time debugging". The behavior that users
> are going to see is just a bug -- they turned on CONFIG_BAR=m because
> they wanted to use BAR, but then it doesn't work.

Ack


Best regards,
Krzysztof

