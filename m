Return-Path: <linux-doc+bounces-14032-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA5C8A3597
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 20:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA77F2844AA
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 18:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D139C14E2FE;
	Fri, 12 Apr 2024 18:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IqYYPFzH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832E214C59B
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 18:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712946376; cv=none; b=obdVm3ZLEYxmSDNKmblhIkzYhFhiM3hwsw2FpzMcgJ6h+gqH+WIywFEZD3AkFRX/AC60qOcbXnSBihdi6Z9lQDOeGyc5ZvmmgKgM0cjMFjWtqqEIV9HWyOlNxNwI/Ps8xBkGALiP5stG6Dqyp0FGjfG7lW4Z6zuphW5tWs6mSPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712946376; c=relaxed/simple;
	bh=R6+sR1n2H8lveCws8FYqyXIHci1kpgk6V6NXn8xBGM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhuDlnhJG9lEPHGqTfmripwrmS67YmRUHKoOowCavnadjjghCz4ZDIFoGs7InAs3e6lrUYofAUXh7RHun/HiFtQljX2jxYwmPanUaFdyWn4sZ9bCYXlOWAYSdvSSC21obZ7nbO2huyG8cYXfOuWMDpXQSz0UkZ9KrOldRP9sL94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IqYYPFzH; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6eaf9565e6bso989410b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 11:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712946375; x=1713551175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMxTHfwmfGngfKcHt9BB7WUlzUr2s5LaZsK/l59Ii3w=;
        b=IqYYPFzHrWkKzXyyATo8fp1XTg/P/PLzPTOf6FPbfGmOsfizXWJwHOrSTXfghPxDBS
         uZxZcMnR3zzl3bADTURz7NuYbWQOJFK0S0iNWVj69+KYaiyvyB4us/nRTbYRzAd181OT
         5a6x6qgLP7BjzcpD6OedSCRQqTCj05WGFhIV3unDBaS9tOklkVeEgfSRbgyfENiBuXPh
         wWS+fUVE7Gof7SaAcFwpTQVmxEGLDz+yGGe4AWPOLF3W64ibERCH4JQzH3jY6Cg8/Lfa
         5972KNx7SEXqYnei1rHtFEhxpLbpVQNikNaUvfhV2w9qoSDCLgJfpvAW6WcEZ/Wz8zTz
         JKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712946375; x=1713551175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMxTHfwmfGngfKcHt9BB7WUlzUr2s5LaZsK/l59Ii3w=;
        b=TRyaUR4/mFzIZSG/okMwGUqP2ieNsvHNvGkysUcyD3De768JfGohdAT/cMVzF8T1Cl
         AZeQBbwv2LJBjgZcutDAebmsXWAECMv4g6bTPAcyODtDhO49FGMI2PYlvo51M7klh/XH
         /olIeOMGezo9opq0cgcukeY8j+2abM4MaqOlQYkF0a2gGyYiBM9XqA4znbEOWD5rCpmM
         XTbE6n4w8TVWt386eNZA9oNc30Qr+Ssg8zaaVYescPuOle/6A30RkvPJy9PaGixg2rEL
         gMk6RLozC7a2ZWMWEpvlp9x+8wE5tafzuRaYLYGOaOMht+4jI14OXAbNMgJDbYz5AVf3
         8EBg==
X-Forwarded-Encrypted: i=1; AJvYcCXdjJMquLsjfBqQhscM5iE77hJbGyP9jodyDvEhJlLxWEKxizjtknBivOZzVrRDD3+LjFaGCIueR57qMrm6OZXjT8S3qgJzutlR
X-Gm-Message-State: AOJu0YxklWSqHwHWh8hmgPA2Z7OiDpeTIZ/vjcjRXMTi/avnkyVMnMYj
	/Irs5hOodriCujrgGnRJZKWIrJFf0MdApLHW2TEmkZP929PUVyCJYofkDyH7moI=
X-Google-Smtp-Source: AGHT+IF+XDdyB5UuM6N1UjqqE0/VQom0I9Op5dF9IOxOPYX/5ovaNt57ADIRPWe8tJpR7LWz5w/zoQ==
X-Received: by 2002:a05:6a20:9717:b0:1a9:8861:9e77 with SMTP id hr23-20020a056a20971700b001a988619e77mr3208395pzc.28.1712946374944;
        Fri, 12 Apr 2024 11:26:14 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id q18-20020a63d612000000b005dc9ab425c2sm3053438pgg.35.2024.04.12.11.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:26:14 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:26:10 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 15/19] riscv: hwcap: Add v to hwcap if xtheadvector
 enabled
Message-ID: <Zhl8wtc5ikM2Btjv@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-15-4af9815ec746@rivosinc.com>
 <20240412-thrill-amnesty-019897f21466@wendy>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-thrill-amnesty-019897f21466@wendy>

On Fri, Apr 12, 2024 at 12:37:08PM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:21PM -0700, Charlie Jenkins wrote:
> > xtheadvector is not vector 1.0 compatible, but it can leverage all of
> > the same save/restore routines as vector plus
> > riscv_v_first_use_handler(). vector 1.0 and xtheadvector are mutually
> > exclusive so there is no risk of overlap.
> 
> I think this not okay to do - if a program checks hwcap to see if vector
> is supported they'll get told it is on T-Head system where only the 0.7.1
> is.

That's fair. I did remove it from the hwprobe result but this is kind of
a gross way of doing it. I'll mess around with this so this isn't
necessary.

- Charlie

> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 41a4d2028428..59f628b1341c 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -647,9 +647,13 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
> >  		 * Many vendors with T-Head CPU cores which implement the 0.7.1
> >  		 * version of the vector specification put "v" into their DTs.
> >  		 * CPU cores with the ratified spec will contain non-zero
> > -		 * marchid.
> > +		 * marchid. Only allow "v" to be set if xtheadvector is present.
> >  		 */
> > -		if (acpi_disabled && this_vendorid == THEAD_VENDOR_ID &&
> > +		if (__riscv_isa_vendor_extension_available(isavendorinfo->isa,
> > +							   RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
> > +			this_hwcap |= isa2hwcap[RISCV_ISA_EXT_v];
> > +			set_bit(RISCV_ISA_EXT_v, isainfo->isa);
> > +		} else if (acpi_disabled && this_vendorid == THEAD_VENDOR_ID &&
> >  		    this_archid == 0x0) {
> >  			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
> >  			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
> > @@ -776,6 +780,15 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> >  
> >  		of_node_put(cpu_node);
> >  
> > +		/*
> > +		 * Enable kernel vector routines if xtheadvector is present
> > +		 */
> > +		if (__riscv_isa_vendor_extension_available(isavendorinfo->isa,
> > +							   RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
> > +			this_hwcap |= isa2hwcap[RISCV_ISA_EXT_v];
> > +			set_bit(RISCV_ISA_EXT_v, isainfo->isa);
> > +		}
> > +
> >  		/*
> >  		 * All "okay" harts should have same isa. Set HWCAP based on
> >  		 * common capabilities of every "okay" hart, in case they don't.
> > 
> > -- 
> > 2.44.0
> > 



