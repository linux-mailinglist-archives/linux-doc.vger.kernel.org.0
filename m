Return-Path: <linux-doc+bounces-17245-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B058D4127
	for <lists+linux-doc@lfdr.de>; Thu, 30 May 2024 00:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E0231C2180E
	for <lists+linux-doc@lfdr.de>; Wed, 29 May 2024 22:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69EE51C9EC8;
	Wed, 29 May 2024 22:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gsCkJM17"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149861C9EA7
	for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 22:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717020637; cv=none; b=nQfYI/KzTtDBK/5069p0a3BDKNNQYZBmM6gR9nLLjSXr+kLc4/vrCqg9XtWgkTGU6zMKZzGyBZf7JnWu+KNc0Fi/ig0UD0EGQQMtXhDE/OmN1DI1DCgWB9QqeafnDOajLJG8QmTUaefjJZuOMY5XzZKYVr9ndescYD3D6JjJuD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717020637; c=relaxed/simple;
	bh=QuEnVBRxaxmVOCS92xgH+2N6PGcTBUbaO5iCtxsNXWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfK0CbTA3Tk9MT687awblX/8r3ddycLw53PnyMIMFS5kgP7fEoNJyC1NY8e4QXJmoEF31JeV7v+TLu72IfzweMASKpGrXQC2aPyet2IXNHjaumXNunoD9xCE7+ikpsDrXqTw2ybMYv2KyiqV7gYyRxC5/8yQyrgwTkUInuxKoWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gsCkJM17; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2bff7b9503aso171854a91.1
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 15:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717020635; x=1717625435; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e+fbNuxAx3WZmFzqMqAqWViMBWTStqdh1s3mW/5wrdE=;
        b=gsCkJM17dTeR4HLzJEl1hY3G4Za79ziIIH9UDG0/LTJieq+lvLhOtnNKJhKYNVCAoX
         ya/Xgpiu645VexBKar/ZqGQbwo7M1+mCTxGepOjY7tE9Gt3ZSp9DIQMTy6mdukjh+SII
         I2IWVHJOmVRVBsQ1IbwAPPdFGuN9STcC5lB1l/3iyjYazazpG0Eb6MSUbbO9B3yGLcAz
         M3ImXgAFaH3bZhKSGj0VTPrnTGwozCRQolbkyu6WxNWHiB0dKeeAh0kDGQsDWf/5rfYY
         P0u7PdpjYgrdne0pUVWdOAuFPBszSt0LIuv7yURgTfCfWmxes1JZfH8TYxtweZpmPqHE
         lCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717020635; x=1717625435;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e+fbNuxAx3WZmFzqMqAqWViMBWTStqdh1s3mW/5wrdE=;
        b=Mjrp0038wPSQ1z04m6Z4TJy5Ngo93DzZuI0L2Hy3Gy/qz00kPL2oS3fSbYgVX8gD90
         Y/86xjmeWteaAlwX6Cq5AJyHn0FRVJIqmWw4IxiYXLhdGL8HvnBIBc2TJkvccIiU45CM
         Qrfji3a+pPEO+sh2uYLa7v6qzcKMbdhPXHcHwro+k+oJcf+0hGXuT2xGOPqqlweCH5BX
         RkcNWYw61OPtEwa7XVP50StxArNAwUhhTZaiF4ncOILl1raz2/INYvSKAtSezd0oOpxu
         vs4fzqul+rRXYHAABIvoGX5o26KSa+i9xKiohI44WDp5SP2vkOP3avHwuwMRZI9oM0Eb
         Yd2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUX2pqi8v1QXVkNOypx6OT1W5rzoS2KVWyilw3u7UfKRnE77fAf4Z/w1cEPujzUXJvOzlLZb4dRpVDXTP2SYv5u7K/bRIrzG+Ww
X-Gm-Message-State: AOJu0YzqVKbLeRrPLZQ3NsQ2UDtTMO0gQRs2tmpcB10JdliGXVkSlFN7
	gKV5p4vFfGiCi3qK9BF8G7bLFU8tcV8hQbmvzkP4XDTywqzkP+bBHyphUPZaGvo=
X-Google-Smtp-Source: AGHT+IGB2IuW8qeBair3I30nTxYXl3h2Wp+x/ksnoaod2z/+/aYYn9Gy8Js/qgGb7n5+xXapJsQdmQ==
X-Received: by 2002:a17:90a:c798:b0:2ae:7f27:82cd with SMTP id 98e67ed59e1d1-2c1ab9e39a3mr414491a91.7.1717020635249;
        Wed, 29 May 2024 15:10:35 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:32f9:8d5b:110a:1952])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1abebfbdbsm121966a91.55.2024.05.29.15.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 15:10:34 -0700 (PDT)
Date: Wed, 29 May 2024 15:10:32 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 01/16] dt-bindings: riscv: add Zimop ISA extension
 description
Message-ID: <Zlen2LmttEdaqAGm@ghost>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-2-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240517145302.971019-2-cleger@rivosinc.com>

On Fri, May 17, 2024 at 04:52:41PM +0200, Cl�ment L�ger wrote:
> Add description for the Zimop (May-Be-Operations) ISA extension which
> was ratified in commit 58220614a5f of the riscv-isa-manual.
> 
> Signed-off-by: Cl�ment L�ger <cleger@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 99d2a9e8c52d..b9100addeb90 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -363,6 +363,11 @@ properties:
>              ratified in the 20191213 version of the unprivileged ISA
>              specification.
>  
> +        - const: zimop
> +          description:
> +            The standard Zimop extension version 1.0, as ratified in commit
> +            58220614a5f ("Zimop is ratified/1.0") of the riscv-isa-manual.
> +
>          - const: ztso
>            description:
>              The standard Ztso extension for total store ordering, as ratified
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


