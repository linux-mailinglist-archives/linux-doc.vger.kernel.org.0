Return-Path: <linux-doc+bounces-15584-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB748B8EC2
	for <lists+linux-doc@lfdr.de>; Wed,  1 May 2024 19:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2A0E1C20A69
	for <lists+linux-doc@lfdr.de>; Wed,  1 May 2024 17:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F225117C64;
	Wed,  1 May 2024 17:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="pskqzGJO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA1A14A81
	for <linux-doc@vger.kernel.org>; Wed,  1 May 2024 17:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714583183; cv=none; b=FjvlK03kx5tOp3QEX/h7wOL+viVlSKlsDmGjs7HDkU/MtqB0fL3tVyE8zBBhJEZTgAqp5TP7tMWhP7iOXOFJKKaeHSJvkth/O4ywRBJA+p2wfqLdy7GQz3XazflBomZNbQ0yZ0e+sJ/oHdeqiu660rMZfwg744QvLHO2mNFJfig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714583183; c=relaxed/simple;
	bh=pqU7oYGJgnj9NuhHq21MW2iYlmXEJsCtkyhRbZQMx0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLWMcl9XlAGqlAiIozOXQQzu9Dkym/KBOHR0SRYiXUIaIO6EoK3I2s5Dnx7P6TVMwA3QjPKJs/F0VFU25xT18zcKz0yK/FWv1OJoClyYW38JA6BPqO9Bkdmrn9xEC0tLWzkbO326kFbeUpLgSlF8KcYb5pHQh1rbpU326FqkHI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=pskqzGJO; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5f80aa2d4a3so5773542a12.0
        for <linux-doc@vger.kernel.org>; Wed, 01 May 2024 10:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714583182; x=1715187982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ulUTnrt0/o6KrpYj4/lKXwggI1Tcz4XFzc+8cliUI0c=;
        b=pskqzGJOaoD4BIUPmMgmZijLoimhceT6AA89Byuqf5OmPWuyi2gxFvdjI3/X03PuT2
         EiwArqrECy9mcOB3xfJJ+1lze8cCIfiwxbuvkiiQsE3reif3c9wshk39vjGz7oRUyVKs
         oP7nYrbhpvOv4rAj8cgKbAcxJNF8RhsGArvXSW3vW8+IQWd4eqGw04cdmA+n8qwlJF1f
         +CDjKde9V11tnI0tbFVfymVf39gmimnXqG35VXjWnnYhkZkR+v/7u5DZKNx77prWM36C
         Gz8sN8tqZ4Tp9hB3twsSbnTOHXhUnx6MkpgfUw134PNlQ6N1Cxf+IqdBWPZZ/LSFngnU
         jn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714583182; x=1715187982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulUTnrt0/o6KrpYj4/lKXwggI1Tcz4XFzc+8cliUI0c=;
        b=qlzOzzdNvpdo3VUORuWOcjNv8WGXoU6FhRwh1NiB4J/pOfN5PwSCn37jMtbtXYQjTd
         CvazXkIe0iXyVP9AhbqGRc7uDUnFfDptCQn1hjkmswQwjEJJfUBHiDjEe/hB9aDrF7rU
         0RTb1jGXUPE1KHkICliuAmIS3J5KiXVIzOKtrhoDgCxUFKHjkWpHt8CjsBQrGj9eHCoM
         gIbWuAYA4n62UsD7Iezjsa1M6Y4Qzm0+hc8eTzveoErET1rqDmTvH5rzebjfh0qLodGw
         mHkdbxhTo/CbDRM78gTqWE71TPaPUzEr5afSF9NTWc6/4I5lDn1BAEUMSbkPnGINtdag
         dcYg==
X-Forwarded-Encrypted: i=1; AJvYcCWFLZJEK15haOPWr4+vUWMCqrHm3Jzklwk2W29MT07sayIW+NbDjNNwuN5xrodmtqDSj6ENQzXJpzf4oLg0Ii/ivJcxEdlsQ9ns
X-Gm-Message-State: AOJu0Yxce9aab8yD23Bt8MPfau2PpCKqHKUVotbtaY7Y4d+a/P9DJFSb
	5TlvAEGPvnguwzQ1yMtJTkfbuVxU4emQXGPsC9xos3g3AenKXSLG/LEH9+aj750PifVeK1HXeB3
	y
X-Google-Smtp-Source: AGHT+IGbQ99FfsOuQfbPD1HKb4OFUev7bCmbhruunbIFw2+vddc7cv9+d7D2Uj+7TUiDOOY0K6p1lQ==
X-Received: by 2002:a17:90a:f493:b0:2b2:d001:db41 with SMTP id bx19-20020a17090af49300b002b2d001db41mr2837033pjb.40.1714583181995;
        Wed, 01 May 2024 10:06:21 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id db5-20020a17090ad64500b002a53b33afa3sm1593854pjb.8.2024.05.01.10.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:06:21 -0700 (PDT)
Date: Wed, 1 May 2024 10:06:18 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <ZjJ2irS2ornhzeYc@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
 <20240501-pelican-throwaway-da84be7dac30@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501-pelican-throwaway-da84be7dac30@spud>

On Wed, May 01, 2024 at 12:19:34PM +0100, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 02:29:19PM -0700, Charlie Jenkins wrote:
> > @@ -353,6 +336,10 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
> >  		bool ext_long = false, ext_err = false;
> >  
> >  		switch (*ext) {
> > +		case 'x':
> > +		case 'X':
> > +			pr_warn_once("Vendor extensions are ignored in riscv,isa. Use riscv,isa-extensions instead.");
> > +			continue;
> 
> Yeah, so this is not right - you need to find the end of the extension
> before containing - for example if I had a system with
> rv64imafdcxconorkwe, you get something like:
> [    0.000000] CPU with hartid=0 is not available
> [    0.000000] Falling back to deprecated "riscv,isa"
> [    0.000000] Vendor extensions are ignored in riscv,isa. Use riscv,isa-extensions instead.
> [    0.000000] riscv: base ISA extensions acdefikmnorw
> [    0.000000] riscv: ELF capabilities acdfim
> 
> kwe are all pretty safe letters, but suppose one was a v..
> I think you can just yoink the code from the s/z case:

Oh right, I forgot about that.

> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 20bc9ba6b7a2..4daedba7961f 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -338,8 +338,19 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
>  		switch (*ext) {
>  		case 'x':
>  		case 'X':
> -			pr_warn_once("Vendor extensions are ignored in riscv,isa. Use riscv,isa-extensions instead.");
> -			continue;
> +			if (acpi_disabled)
> +				pr_warn_once("Vendor extensions are ignored in riscv,isa. Use riscv,isa-extensions instead.");
> +			/*
> +			 * To skip an extension, we find its end.
> +			 * As multi-letter extensions must be split from other multi-letter
> +			 * extensions with an "_", the end of a multi-letter extension will
> +			 * either be the null character or the "_" at the start of the next
> +			 * multi-letter extension.
> +			 */
> +			for (; *isa && *isa != '_'; ++isa)
> +				;
> +			ext_err = true;
> +			break;
>  		case 's':
>  			/*
>  			 * Workaround for invalid single-letter 's' & 'u' (QEMU).
> 
> You'll note that I made the dt property error dt only, this function
> gets called for ACPI too. I think the skip is pretty safe there though
> at the moment, we've not established any meanings yet for vendor stuff
> on ACPI.
> I think breaking is probably better than using continue - we get the _
> skip from outside the switch statement out of that. And ye, I am lazy
> so I kept it as a for loop.

Awesome, thanks!

- Charlie

> 
> Cheers,
> Conor.



