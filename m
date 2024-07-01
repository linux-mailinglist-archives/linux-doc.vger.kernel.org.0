Return-Path: <linux-doc+bounces-19827-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5B091E4EC
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jul 2024 18:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF74DB24321
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jul 2024 16:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5391EB2A;
	Mon,  1 Jul 2024 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jO0vKBMF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2688A16D4DE
	for <linux-doc@vger.kernel.org>; Mon,  1 Jul 2024 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719850321; cv=none; b=ikF9JPkZzVplAVE2aN6O3rgvicWmxjDzLnAjmsEfTWzpN0L59HyIKBqaDmEFYXuSeOycgKcYXn2lqVICuE64JC5nHmDPfKhn+JXy+b4FesAee4QlZUOtEbcTJ5PGPYFV8V6NB75fCkKhnnRdWQiyH08/lcHcSeUYvjqeoo8bgV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719850321; c=relaxed/simple;
	bh=qYf/mW8GGKN3S8wALYWRK3HzT9T7phHBWlVg81HJQ/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LbTaWsighDAgCbqDThamr+62Cn2kylhjuoBo6XXWD1YGYGeT9BvHfAhNpGtDGCmOmM4IkegvQyDlPKNUWBFD28/cAd3Xfv57VYW9Mssz9Kequ5fXi1plYstYCDoWzqEaxlaK3uPszmIfyt9ylYvGu2aNc8+d5XspUbu4s7u4UPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=jO0vKBMF; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3d562882f4cso1856858b6e.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Jul 2024 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719850319; x=1720455119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gf3a5Pnrja8AHiv3n1YZ7CSp9kh7PHpbQf65ENC5dlQ=;
        b=jO0vKBMF+2eV8p/oeVk0qY5HQmOPf2VAclbZDfo1675Yyh56BMHoK4RuPQ2GLSBu8N
         d4TY6LYmFtb74yz3FeCX7acFeBMP2887ultwrfJTY1N05y9slHnjjgMEYeDWPhowRG7e
         qKKBbocg+iomeIYspc05Pbaw/xv+ZNgnKCFcskDaSse+GD1xGqH7ikw+WhVGPD0zUkyT
         1mEoK4IkY6pw+8BX6b3GIbB7umde4ZZlSmzzLaSfF4n4ptVxKj/6oN9I2bbyNpnccVlB
         FHRqWEwxUF2k9kIby8Lc1tczzkpB7LNRCtPIgkhugqcE5awhCtJxgwajDE2noVcgAC4L
         CHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850319; x=1720455119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf3a5Pnrja8AHiv3n1YZ7CSp9kh7PHpbQf65ENC5dlQ=;
        b=st38PR0oovJKf6s6QeO0dqUG5NcN2SE0ITu4w1vtRtSMDIV0q+IawjVf02bZjjgrAh
         FaC1THFAXsfiMOSCPGSZY2NlDnbBrRp+fGCFV22Gb1NgvUJD/UPRIGiIP1B7B51fTccI
         QNZhaQDFy/if/lOH2zCpxcret1legzO6mYUdvlM5W695rXi6Z05jHd8Q0g2P2m4/TSp4
         EOxwDLSsDr+r55XjahFeld3Wfcozb2EiDU9EDTiIuxui/Wn54ayA1GQuovFJZtefP81M
         AeI9q+m187o476Ibp4BKvm9655KQCikPANIOBZtWKCYJSSBQGSVgPrxiFkUlhaPiPSrW
         6Z0w==
X-Forwarded-Encrypted: i=1; AJvYcCVsAYZZCwcGk0yF6AFqtQu8LEbocf8Va63/mZ8GYPr0sdtRddMD40DBRwfzbw5CLo7F2htwuIyqmJO9J4scKSTIvSBOPvwwvjx+
X-Gm-Message-State: AOJu0YwT2O60XeYK/39y1lIbRRKGOGrbq30py+FxXoK1K/J/Hqn8+AkC
	dxEgZdUwPLRdJYYIN/oWIVJUySg3A29uLr8Gk74nBTjexwP6VTYAfvYphxBMeeY=
X-Google-Smtp-Source: AGHT+IEwPAYueYsYBU7iXqBEMRFmuAd1MLK051xLXmuVq1c5N6cvZaOPH+qJWxXVW1W7c7sUfLOy2Q==
X-Received: by 2002:a05:6808:211b:b0:3d2:16c6:651a with SMTP id 5614622812f47-3d6b568709cmr9465278b6e.53.1719850318992;
        Mon, 01 Jul 2024 09:11:58 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79d692945b4sm357969185a.57.2024.07.01.09.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 09:11:58 -0700 (PDT)
Message-ID: <7ab7d629-6993-4cad-b5b7-62bddfc74a49@sifive.com>
Date: Mon, 1 Jul 2024 11:11:55 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
To: Conor Dooley <conor@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>,
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, peterlin@andestech.com
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
 <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
 <0cc13581-5cc4-4a25-a943-7a896f42da4c@sifive.com>
 <20240701-prancing-outpost-3cbce791c554@spud>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240701-prancing-outpost-3cbce791c554@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Conor, Charlie,

On 2024-07-01 11:07 AM, Conor Dooley wrote:
> On Mon, Jul 01, 2024 at 10:27:01AM -0500, Samuel Holland wrote:
>> On 2024-06-19 6:57 PM, Charlie Jenkins wrote:
>>> The D1/D1s SoCs support xtheadvector so it can be included in the
>>> devicetree. Also include vlenb for the cpu.
>>>
>>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
>>
>> The other C906/C910/C920-based SoCs need devicetree updates as well, although
>> they don't necessarily need to be part of this series:
>>
>>  - sophgo/cv18xx.dtsi
>>  - sophgo/sg2042-cpus.dtsi
>>  - thead/th1520.dtsi
> 
> Yeah, I think I pointed that out before with the same "escape hatch" of
> it not needing to be in the same series.
> 
>>
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>>> index 64c3c2e6cbe0..6367112e614a 100644
>>> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>>> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>>> @@ -27,7 +27,8 @@ cpu0: cpu@0 {
>>>  			riscv,isa = "rv64imafdc";
>>
>> The ISA string should be updated to keep it in sync with riscv,isa-extensions.
> 
> This probably looks like this cos I said that the kernel shouldn't parse
> vendor extensions from "riscv,isa". My rationale was that we have
> basically no control of what a vendor extension means in riscv,isa so 
> we shouldn't parse them from it (so marginally worse than standard
> extensions, where it means what the spec says except when it doesn't).
> 
> Given how we implement the parsing, it also meant we weren't implying
> meanings for vendor extensions ACPI-land, where we also can't ensure the
> meanings or that they remain stable. That change is in a different
> series:
> https://patchwork.kernel.org/project/linux-riscv/patch/20240609-support_vendor_extensions-v2-1-9a43f1fdcbb9@rivosinc.com/
> 
> Although now that I think about it, this might break xandespmu... I
> dunno if the Andes guys switched over to using the new property outside
> of the single dts in the kernel tree using their SoC. We could
> potentially special-case that extension if they haven't - but my
> position on this mostly is that if you want to use vendor extensions you
> should not be using riscv,isa (even if the regex doesn't complain if you
> add them). I'd like to leave the code in the other patch as-is if we can
> help it.
> 
> I added Yu Chien Peter Lin here, maybe they can let us know what they're
> doing.

OK, that makes sense to me. Then please ignore my original comment.

Regards,
Samuel


