Return-Path: <linux-doc+bounces-7895-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D48842F23
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jan 2024 22:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC6B2289326
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jan 2024 21:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368D67D406;
	Tue, 30 Jan 2024 21:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="uwQqg/dH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6F17D40C
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 21:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706651493; cv=none; b=G3KAnCRiHfjpElMjMpKpUxj+ojDCtYPfmOEV3pdoXbM5cA59Jn/CbMGzcZMOAtK69htRBC9617n9/yux4/IHgNH6141JSSeRO/jjF8lHuGPyml+caohdfvMXczdwRRfpcYYppz6UFL/k0r0o/IfjVfK5Z3plT9Q8kmE1TWIGGw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706651493; c=relaxed/simple;
	bh=rR8SVv800/kqryt7JwIAYqxwWBoFBi/ay/0m7ds4vus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaHYFQJORcjQh8YlM6SX8CooMvixIGu7btx0HaAPpYbE73TWR6T2uueLBJIO/YLCOFcu8CfeGEsasoKaOhG3Z8ZyhFQMN2OEqGX7pKYeE10W56oYtMMYE3jJcnic/9pRGb7pxYyvtZRZ1EtWwuRAak5EOkiWDQ4d5HteO8wfC50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=uwQqg/dH; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2906bcae4feso2074232a91.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 13:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706651490; x=1707256290; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Np9jYGYfYb8N8NYn/XtRXhSjDUyxZMfM0XTBuDl+Ozs=;
        b=uwQqg/dHdGjr6VWkl+6Jgp6oEXjBon0K1PHQ+N8W89+pZ+QFOVgR04fKC62QKjr3Ek
         V3uWMjHFNEmuOeLoHD9iITvbYaYQsV7GYXe1F2k2IK14Ixh34wOlcJgTQl7Yn9ZSmQr2
         6ud7FGJu8UibFqQvYHVeeWGQas7L86ZqIYA3LlVFIIJ5LQLCpA0f1oIzdz3bVDH7VBXJ
         gXEwu5KvETqkZaHp9DTqtfTwcPI/DhtPb37HVdlZaN2aGLSojkdb5NmDnBKB482C+k41
         /7zfm79zjeY4uJ4V0LkfLpASH3C+3f3TwrVm93gbisnMRxVDsPexyECrcDTCreQ0mthc
         RwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706651490; x=1707256290;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Np9jYGYfYb8N8NYn/XtRXhSjDUyxZMfM0XTBuDl+Ozs=;
        b=u9aRcqM147E6n5Yro4gRdurvXiOrT3FGij10yDZ58UBRqwN5Ufub1vAZn9U/3TiUul
         9jZXOuOh4/LSDYpRbLgHu1OFTMIoSYkxYNqVT0wp5GfAb/vNNPpoSjc65RD/jYg+n3MV
         mFVtZIDYIKfWeuxYNtt72EOCNOKnF+2kCRbFZgaaw/SB/WatM9MJvFGO41scC4ohrqAR
         Cx2pUnb79PQRZQen+YgDBvs40mq8411tkeF5ktBng5yGoy+SF9cgAbZE9z+1dNwhPIZd
         v/fT22RH8ZJHSCdnPXTyQPpjIi3xAA35FAfnbDYCqWV9ZRkNh2LXSol8BtPukck6Icim
         S3QA==
X-Gm-Message-State: AOJu0Yyb3tptNT9PDVuhyD2VR1Kpq8rFtn61rUnL03lR5i4kA/rtx5Ia
	etDnvvtD9PR/GikbjUbMkU6AL4WQw9KlR5dd0KS0WrI4bcTt9DZ6uofianvMyg0=
X-Google-Smtp-Source: AGHT+IEwtwQoylWlOGq8TqPSvs3bul1pVTRd8p25SneMALbfVbul/65KMmvpPziXy2wknL2Wg6OzKg==
X-Received: by 2002:a17:90a:17a2:b0:28f:f1c0:3d21 with SMTP id q31-20020a17090a17a200b0028ff1c03d21mr5388368pja.41.1706651490637;
        Tue, 30 Jan 2024 13:51:30 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id nb5-20020a17090b35c500b0029464b5fcdbsm8657589pjb.42.2024.01.30.13.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 13:51:30 -0800 (PST)
Date: Tue, 30 Jan 2024 13:51:28 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] riscv: mm: Use hint address in mmap if available
Message-ID: <ZblvYH3NLfhZQt9g@ghost>
References: <20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com>
 <20240130-use_mmap_hint_address-v2-1-f34ebfd33053@rivosinc.com>
 <tencent_34680F3AAAE356C4A485103556F3F909C60A@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_34680F3AAAE356C4A485103556F3F909C60A@qq.com>

On Wed, Jan 31, 2024 at 03:15:16AM +0800, Yangyu Chen wrote:
> On Tue, 2024-01-30 at 11:04 -0800, Charlie Jenkins wrote:
> > On riscv it is guaranteed that the address returned by mmap is less
> > than
> > the hint address. Allow mmap to return an address all the way up to
> > addr, if provided, rather than just up to the lower address space.
> > 
> > This provides a performance benefit as well, allowing mmap to exit
> > after
> > checking that the address is in range rather than searching for a
> > valid
> > address.
> > 
> > It is possible to provide an address that uses at most the same
> > number
> > of bits, however it is significantly more computationally expensive
> > to
> > provide that number rather than setting the max to be the hint
> > address.
> > There is the instruction clz/clzw in Zbb that returns the highest set
> > bit
> > which could be used to performantly implement this, but it would
> > still
> > be slower than the current implementation. At worst case, half of the
> > address would not be able to be allocated when a hint address is
> > provided.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/processor.h | 22 +++++++++-------------
> >  1 file changed, 9 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/processor.h
> > b/arch/riscv/include/asm/processor.h
> > index f19f861cda54..5d966ae81a58 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -22,14 +22,12 @@
> >  ({								\
> >  	unsigned long
> > mmap_end;					\
> >  	typeof(addr) _addr = (addr);				\
> > -	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) &&
> > is_compat_task())) \
> > -		mmap_end = STACK_TOP_MAX;			\
> > -	else if ((_addr) >= VA_USER_SV57)			\
> > -		mmap_end = STACK_TOP_MAX;			\
> > -	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >=
> > VA_BITS_SV48)) \
> > -		mmap_end = VA_USER_SV48;			\
> > +	if ((_addr) == 0 ||					\
> > +	    (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
> > +	    ((_addr + len) > BIT(VA_BITS -
> > 1)))			\
> > +		mmap_end = STACK_TOP_MAX			\
> >  	else							\
> > -		mmap_end = VA_USER_SV39;			\
> > +		mmap_end = (_addr + len);			\
> >  	mmap_end;						\
> >  })
> >  
> > @@ -39,14 +37,12 @@
> >  	typeof(addr) _addr = (addr);				\
> >  	typeof(base) _base = (base);				\
> >  	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
> > -	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) &&
> > is_compat_task())) \
> > +	if ((_addr) == 0 ||					\
> > +	    (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
> > +	    ((_addr + len) > BIT(VA_BITS -
> > 1)))			\
> >  		mmap_base = (_base);				\
> > -	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >=
> > VA_BITS_SV57)) \
> > -		mmap_base = VA_USER_SV57 - rnd_gap;		\
> > -	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >=
> > VA_BITS_SV48)) \
> > -		mmap_base = VA_USER_SV48 - rnd_gap;		\
> >  	else							\
> > -		mmap_base = VA_USER_SV39 - rnd_gap;		\
> > +		mmap_base = (_addr + len) - rnd_gap;		\
> 
> Please mind that rnd_gap can be non-zero, in this case, the map will
> fail. It will be better to let mmap_base = min((_addr + len), (base) +
> TASK_SIZE - DEFAULT_MAP_WINDOW) .

Why would an rnd_gap that is non-zero cause mmap to fail? mmap will fail
if rnd_gap is greater than (_addr + len). That is expected and should be
interpreted as no address was available in the requested address space.

mmap_base is used if the hint address is not available.

I do see that I fumbled the test cases in this patch so I will fix that
in a v3.

- Charlie

> 
> >  	mmap_base;						\
> >  })
> >  
> > 
> 

