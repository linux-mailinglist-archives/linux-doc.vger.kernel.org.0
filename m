Return-Path: <linux-doc+bounces-17016-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D00B8D002E
	for <lists+linux-doc@lfdr.de>; Mon, 27 May 2024 14:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94EFBB224BE
	for <lists+linux-doc@lfdr.de>; Mon, 27 May 2024 12:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDD315E5A2;
	Mon, 27 May 2024 12:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cSOTj1+6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F9238FA6
	for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716813522; cv=none; b=SaPx/eNZtfdMBky9j3xBytDAPvbVq0yhbq240SxBC9OP5tHBuhAxwxV7w28gmUhz880ZMnLa8yYtRHpchyKQNFRPUlMpxYzjwglgmp3J7rftMZ+rHC7SmkVM3ZC1vUI+kgc0QYwC5fXZxtdrSbFuha3B4yJnDJVrKM7Hd1SF/wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716813522; c=relaxed/simple;
	bh=KUPmkaVNi0PLQviM9npC6+ISIfhFnQySeRNyLrPRQXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GfPl/+O38yTIxbs9/qGV10+EvcFff1QoEUtVsOubRYWHrLepAQ+S/lDkaJPP/1DHUNlhMfHUKeSGHvnNno+HQfh4NjIGHqdS3gwq7dqvBCr8rqjWRc1yiGDD3YJ1h2He81IK/C12Xbql/Vcdisq4pwasAWpDyZpyi0Ub4ARX88o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cSOTj1+6; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-529644ec0ebso4199577e87.3
        for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716813519; x=1717418319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U0MksHKwBICLwuSG6OgSnqATRY+MnKcyIIXC1UuoUb4=;
        b=cSOTj1+6tgggUjBV+F0I/iX9/C7/h5mRFTUWEaHczTBlPedAmFhH9/HhLde6D2s5yb
         CpjoEvD2hdnHecfwb88IpdMYmGpfpuH6j23Q+9MarOkkgnYFqwelGfe7HXuUfMWoclUF
         NaML2RsFSS36ZuAy2Dp4ppQmHETjJ+UPDbTa7OohaJVRkhdYgeEmWVqKq5JL7Ps3C2Zv
         d9IYyCVVSXpr9YTUt4csDcEP3D5Ij1h3DNH6W4xW2Vvf7ZO3O4E8Reg3bhdwqsQgVZaW
         IZmo0D4u9L2Ry7+dyxQJDgDBYGRmqYSmkH8Dho/T+euE8YEP14bQjket9kNpHk7C0YDz
         oCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716813519; x=1717418319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0MksHKwBICLwuSG6OgSnqATRY+MnKcyIIXC1UuoUb4=;
        b=gU76kykzoGhiys741xpZUzRlsZGFuVs0J+MmE17Mbh1hId4nfxCiAUCc+TZruGQ56w
         h+/p9rCQ+NGUk6ucsSZSaF5VstyIgIidwBRY4lJnVYx7Nc3wUdtt22QqEOgI530pfnS4
         LErhWhgCA456hT0jYc5FK46SyfOF1S8LJNJGp9cz5qQiD89czDUet4NzO3jYV/61ifJ+
         dkRRk5RDSlofo58aWull7UzODj+6Y9nWcAoG5IcHr29vjxfpUKWOTzFVOJkd0gQDNfO5
         Nh4CgW57YECh3NPKAWtwZR67C8iOVhnsGbu3Vwyj6mDmHtCZUJuTdoFMHIh+xz0O+tA3
         gD0w==
X-Gm-Message-State: AOJu0YwvjWwoLM8WyRGYefRHMpF837d7FOZEFZLW9eJvx7APJlJtB/xc
	eT6FcHS+IzKnLbl0zjsz0dKMk4mK0exQ48+9yHn7s57GDFUkwQntxAf4oyDixXw=
X-Google-Smtp-Source: AGHT+IG1nhVnExbK4ShBNQp8AOL1BeyHFQcVZ25huQqTJip9CI8Tg0co5jAULq+rDZ4Vc1qdUlRr3g==
X-Received: by 2002:ac2:43b9:0:b0:523:ae99:b333 with SMTP id 2adb3069b0e04-52967a26df9mr6335447e87.64.1716813519261;
        Mon, 27 May 2024 05:38:39 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c818139sm491740266b.35.2024.05.27.05.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 05:38:38 -0700 (PDT)
Message-ID: <e3cc1552-4f96-4aa0-a375-a5582094c1ae@linaro.org>
Date: Mon, 27 May 2024 14:38:36 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: Implement ieee754 NAN2008 emulation mode
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Jonathan Corbet <corbet@lwn.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20240507-mips_ieee754_emul-v1-1-1dc7c0d13cac@flygoat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240507-mips_ieee754_emul-v1-1-1dc7c0d13cac@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/5/24 14:34, Jiaxun Yang wrote:
> Implement ieee754 NAN2008 emulation mode.
> 
> When this mode is enabled, kernel will accept ELF file
> compiled for both NaN 2008 and NaN legacy, but if hardware
> does not have capability to match ELF's NaN mode, __own_fpu
> will fail for corresponding thread and fpuemu will then kick
> in.
> 
> This mode trade performance for corretness, while maintaining

"correctness"

> support for both NaN mode regardless of hardware capability.
> It is useful for multilib installation that have both types
> of binary exist in system.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt |  4 +++-
>   arch/mips/include/asm/fpu.h                     | 15 +++++++++++++++
>   arch/mips/kernel/elf.c                          |  4 ++++
>   arch/mips/kernel/fpu-probe.c                    | 10 +++++++++-
>   4 files changed, 31 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


