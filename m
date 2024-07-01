Return-Path: <linux-doc+bounces-19824-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AFD91E490
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jul 2024 17:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 233A9280CFD
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jul 2024 15:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA3116D327;
	Mon,  1 Jul 2024 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TxpvVahb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4238716D330
	for <linux-doc@vger.kernel.org>; Mon,  1 Jul 2024 15:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719848968; cv=none; b=mMbHLqm9gBV17qKwIueM9zk/U5uTMNYsCGpmU2S2v50YgtrlralTcm6sQIDiIlbJTQV9aNf1cgPciEPwEJTLtflLxZvOASCClRu0a2a37BL5/Q1UtW1t2wiSxUW9VndweY++8o6kH5w6CxKadYZpmutLUrV52FCs1hJko8uJGt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719848968; c=relaxed/simple;
	bh=7wpTDCYkfM0h9G8p58hcJdgXA+PbS7WdaAYXL72gy+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hu9yjz2xKbB1CGbMDAD2G9txIpiH7bUYOoO6IdoshZuqGoMTtiijbuR5ySNabLg93TL2GmBXZPLjLCqg0Bogxlk/u9cLRiXvhHwLNb3nlEfEcYS/C0eZW3E848lV1nepHlnvfGiczlCdAd5c/Ygz9MM9iE8y66TOhd6rcX0Eeoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=TxpvVahb; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-630640c1e14so29581427b3.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Jul 2024 08:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719848965; x=1720453765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umkqtCJW3Dg9JtpfzIAAg1v5vJehmts33cJFqn8dvR8=;
        b=TxpvVahbrreOtYqdLCGsduPIeatSSJqrD0sRe9SrSNMVR4h1EfRwr2T8C+/TXTphey
         1BvOTolUqFbaRFbJ3vB5fzv996sDKqXyIF4LHe8w/C+bfwwojFnWtd63R3dxhoW+LSUL
         xDA1jnAK69sfslASgvaXKar/FVcP9oCchikDH9PKqlwdfIZ6jeI4c8PiDIdw9SKlbGPQ
         nlt8KYun7Gp1zjHEC4JDa2huokwqPfoqTXWOuwFPT/J5LXbYer1i8aSIxhLsWcpW1VWN
         9M48huni+ruHOgpD8eIlBQSX8sTaL0RBGMKzYRqziilz/VWdIlBiZgpUv8y30Y++hxtL
         whww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848965; x=1720453765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umkqtCJW3Dg9JtpfzIAAg1v5vJehmts33cJFqn8dvR8=;
        b=PJImIrIjpGgrYSpqhM7PnHnlZ8vraf2rjj9CLNj6BMw/we2vPteemQnssYtZxDW1Mi
         ptrQHk2wUiURbQ2PaID6Aw53P7ofK2AffMf1cBBCIVv2ZocQNwgb6ZzclXI4EiD7T3p8
         b3oX0ON1QWRBvz88rfpGZ9Q1syEhClAjf6OGKkCJsr+NU2FwyUwduJaCGdm+L1Y+V01C
         Ho4KmyeZM6cPaTAkqSElVn81HCC1RbNZbSTkhYu7+GCyUxuUG2dfk23e0yuFCLClJDxA
         cZMM5JQmYbnuLYOMy7nCbSKmido3HQSHSm0buRJfFPX8MFRdLAgQKWygCfjonKVY8fnx
         59Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVi8PkL5yaCzrgJBre1NpQ+71RulCZv5w7Yz8dR62cNE6IWSxEFTPfhGcNa+OunzdIzDx93Dq8LCEWySAnqXjuM4TgInPANxDAg
X-Gm-Message-State: AOJu0YwJsZ5w56/8jVDzY2kwPSHkKiVGR2WQURo+jN6ajoDqGxFdRpN1
	NfkA2HkDM5brUu8HqN/F1Mbio9IL1LWAKyz10NEcOr3/puzrZJsMDtOdDfjhbBiew3osmOp13T2
	t
X-Google-Smtp-Source: AGHT+IGu9I2wc2U8NTdlZqwI73pTcvt2JvT2wJhK92JWQZzopvjsvNausRGAk2vO9Al2yPEEKQkmTw==
X-Received: by 2002:a05:690c:710:b0:64b:8e82:1f9 with SMTP id 00721157ae682-64c7123bf4amr65310827b3.18.1719848965244;
        Mon, 01 Jul 2024 08:49:25 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9c405c9csm14034647b3.128.2024.07.01.08.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 08:49:24 -0700 (PDT)
Message-ID: <54232f3e-4fea-4996-a90b-6de51e1c51e0@sifive.com>
Date: Mon, 1 Jul 2024 10:49:23 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>,
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
 Jessica Clarke <jrtc27@jrtc27.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
 <20240619-xtheadvector-v3-7-bff39eb9668e@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240619-xtheadvector-v3-7-bff39eb9668e@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Charlie,

On 2024-06-19 6:57 PM, Charlie Jenkins wrote:
> The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
> has an encoding of 0x9.
> 
> Co-developed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 18e178d83401..9086639a3dde 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -220,6 +220,8 @@
>  #define VCSR_VXRM_MASK			3
>  #define VCSR_VXRM_SHIFT			1
>  #define VCSR_VXSAT_MASK			1
> +#define VCSR_VXSAT			0x9
> +#define VCSR_VXRM			0xa

These are normal CSR indexes, so the prefix should be just "CSR_".

Regards,
Samuel

>  
>  /* symbolic CSR names: */
>  #define CSR_CYCLE		0xc00
> 


