Return-Path: <linux-doc+bounces-38197-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29269A36E35
	for <lists+linux-doc@lfdr.de>; Sat, 15 Feb 2025 13:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68E813AF747
	for <lists+linux-doc@lfdr.de>; Sat, 15 Feb 2025 12:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59551C6FF3;
	Sat, 15 Feb 2025 12:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0F1UOJg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6901953BD
	for <linux-doc@vger.kernel.org>; Sat, 15 Feb 2025 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739623455; cv=none; b=LmlSUJBy6xd6kqv0EmP/wfg8WfUxfq04szWKp+qheSI4L1ceNZTIR8rbuAuBxv9zr+zKDyj56aMQAWesNjuEUYiQj9+Jt8frvedlYYQ/8fGavDFqRCIOr1rQ9+qyCfhplLUpspErflkjfvjUjLzkovX9ShDdO1U96nnJCshh78w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739623455; c=relaxed/simple;
	bh=KFlNeML0hcxjm+hdvWIGm4NG8m/nSoc68OSgTfMvGsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rb2Yo8QwCsbuoSUZ8BlkxjMkeo877y+62eP7VJyStvXhuMwn0OF4LRtBGFzVBwYETblQ4RPB4kKIZFZ+DM1//iKBBh5fu1TMx7s546Vux8ivJhyVLMy8jDqUCphJ2vTmhX1tJ7KaKrzuECb5rcswvR0Ur2ejf2UNGbSApCDiOdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g0F1UOJg; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dc5a32c313so535344a12.3
        for <linux-doc@vger.kernel.org>; Sat, 15 Feb 2025 04:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739623452; x=1740228252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+B7I6TUpdM4PsxD/neBUbK4/bhJwkNrIuTN9cb5z76E=;
        b=g0F1UOJgH8SnEA0pN17lpjx9hXzt/at2vgzFS/9OWaoE5kBWRHi22Rs8XcyN7Iecv/
         TPK3rQK3o64mT26LrgVuhUvFZj/qfqClV3J+F3lcPbgOLUW97AZEJ/Zg6jwmm80Pio+y
         rCSku0gnv54F9evYCNOhys4HomZRkvDvery45UqTcvVTPvkzFWr0z3lP5i9YJCzBFz5X
         MdO9qqXPA3rR2qs9NR9jpIgtKRfnu7wfsnxzziCJ/7v4qFFLL4heBWapD4fBqRpQTK0B
         aJgcOSEijBPFHdH/blAPkZLf4yd5kTyhQP5GWcMRWXdQTf1T7k+JXCKVKJXzjL16bdDY
         lhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739623452; x=1740228252;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+B7I6TUpdM4PsxD/neBUbK4/bhJwkNrIuTN9cb5z76E=;
        b=oNQwC/DgIVDLfoDyDk3sBDr342m7bS8HJr9OBQOgrIzNkn0LOL+mkxRIsCQDKSSydC
         Z2gvPgfJyagcpIh9ubZvFoZIXMUgdkONS8VzuDzY+5Kyq+UmkA8mfPjS9iMmLTtaCoaq
         TKbo1hv0M4wccbv+wBzxFc45X6JGhKreqIoYsWMweaU9RqxjAgFwO0bMbn0zaNzgCeE3
         KNVfSqiAfRAYLVaoR/Y7pr54RRp/qDbZfhFCDHESNcT2RjT3v/FgVVfUx8H1bH4wF3pL
         CCVKVT+nkS2PNgXcQVkV1bUzIMLEIXxz8as+vPuUYes7tY8z/4avLEHNo12rk7k/Z6hq
         0Dag==
X-Forwarded-Encrypted: i=1; AJvYcCXhExSbWp8qEVb6CkmJ6ii3jU8zNiJbB+bC8igcL9fAL1mDWLKe6Vs6rLSTXoxO+oYIHwNMOvsJ0wc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrt5aikeIXYSj3xmZPRft3hyNLKi+JGKGEfZUbZpD6pvkRgxgz
	9ZK5X6dPGJNbYx5+6nhMpmvYuveiwTlrEJenHPodNRzQbi7QluyxUALFzYBGtqQ=
X-Gm-Gg: ASbGncuCq/j+UJQQNyyPyt1UxB/3zHj2mN8lB21xLhAQYmrIpSB0ZHtBqUxVQGf3ngV
	XsTynWk1PKMowk4yVhHqGhpkdo14VXMAWVD+9q5bzLPxvzGXOIJWTu7DUN0dV36azEqO9jd3rEo
	LafdaDm7RTHtfzG36+FnfYtjctJuyEQWF49Mb5mOAwjTLkgjdQeXJGXREreJGCMnoRXnOqfO6GQ
	KJU1jwNiG6HylfSK9hZZ06rEDV4fcqokJfI2BA75udnM6RMhBZmY8kzIaA2QRMb/Gw7dzGE7tIr
	pyHiPfFtru95EfsYP9WZci7Qt9l3inWdbCM=
X-Google-Smtp-Source: AGHT+IElpLcwNQ6u1JakahPoc0t00IfbsjrSKY7uK59j4jK7wab+Pj+IpLpfpGCYq3y3shibvBY/eA==
X-Received: by 2002:a05:6402:50c6:b0:5de:a8bd:a231 with SMTP id 4fb4d7f45d1cf-5e03604fbf9mr1035345a12.1.1739623452138;
        Sat, 15 Feb 2025 04:44:12 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270cbcsm4641325a12.49.2025.02.15.04.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2025 04:44:11 -0800 (PST)
Message-ID: <c95582e4-9ac3-4636-8a4b-3d27ebcb28ee@linaro.org>
Date: Sat, 15 Feb 2025 13:44:09 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kconfig: Mention IS_REACHABLE as way for optional
 dependency
To: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
References: <20250215114223.140688-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250215114223.140688-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/02/2025 12:42, Krzysztof Kozlowski wrote:
> @@ -580,10 +582,15 @@ Some drivers are able to optionally use a feature from another module
>  or build cleanly with that module disabled, but cause a link failure
>  when trying to use that loadable module from a built-in driver.
>  
> -The most common way to express this optional dependency in Kconfig logic
> -uses the slightly counterintuitive::
> +There are two ways to express this optional dependency:
>  
> -  config FOO
> +1. If pre-processor can discard entire optional code or module FOO does not
> +   provide !FOO stubs then in the C code :ref:`IS_REACHABLE<is_reachable>`
> +
> +2. Otherwise (and module FOO must provide all !FOO stubs) use the slightly

Obviously this should be "module BAR", similarly above.

I will send a v2.

> +   counterintuitive Kconfig syntax::
> +
> +     config FOO
>  	tristate "Support for foo hardware"
>  	depends on BAR || !BAR
>  


Best regards,
Krzysztof

