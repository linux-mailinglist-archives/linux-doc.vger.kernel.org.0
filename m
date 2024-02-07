Return-Path: <linux-doc+bounces-8576-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CA084CAE6
	for <lists+linux-doc@lfdr.de>; Wed,  7 Feb 2024 13:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B8391F2213B
	for <lists+linux-doc@lfdr.de>; Wed,  7 Feb 2024 12:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB89E59B70;
	Wed,  7 Feb 2024 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="il5d45Sw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6476359B76
	for <linux-doc@vger.kernel.org>; Wed,  7 Feb 2024 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707310274; cv=none; b=rmUYf6GJ1u+Lb8/kSK97hmvnL2QTXfTSfZO9z+o02NLMWLbPWIXzc2wehd4ThQ3Xu5bMW825Jk74Gx8htJN+ngulMA7p+SBEYsgkmo6lFaYfGTjkB13V9hWwUUeu7GhhicWKuufVG0Q+d0l6SrAronCa3eLw0O4XWHaZQ7Uc3/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707310274; c=relaxed/simple;
	bh=sYcieujEmpCxgF5vEXlSj2YXE88YgC2yaNOOs13MyUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUgP+i3Xv8AeR3720t5r4Ek/6IHePUawnF7Jgieuy0gZQ4yBXPwd1pYQQhrf9GpbCHd/AQalEVBKS/PXd2ujJa91eYwnovXrYNY0dms7QnFLyOl9MreWRXph0nlmgNmlSg13JHugNzoDwNEQvhZKKzmbGbZrO1OIDGYjzQOuMvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=il5d45Sw; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso376385a12.2
        for <linux-doc@vger.kernel.org>; Wed, 07 Feb 2024 04:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707310273; x=1707915073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mGfm1xndWnQeszFHqTdhl74zkXV/pi66GxLhja0pVm4=;
        b=il5d45SwMp/Q/1QGLW53fO4mQxBTg10wDXCLU0h/zMSK9xRCabIJ1iHcGPGO49wKvn
         P4s/G+bcVk0b2KTxYXGcE4hBzSXGQDT41N7M3MfxuQrFXsIsY0oYXV/If4fjx5j3iEPq
         rxVZ5BjguJmwfsrX7b6Wpa7fyUMXZ4UObYExk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707310273; x=1707915073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGfm1xndWnQeszFHqTdhl74zkXV/pi66GxLhja0pVm4=;
        b=QI1yzMQiaiI73oPBuOMhenWTVapPjvi/c+JYpCep3e9iEEeKE1ONWDOIg1DuZvs8Rq
         eBYlU/GyOdjEke+1KwUZaRFUIIcENRD43y+3Fv/Uif1roE2JkwOHlbHjTT0Jc31EsVcR
         C0L48rHfxU1KBjeTaAyGd/CAWEH/s4p6IKjp8+MTvKMtke+9M3X+ldZxTWCUosHcCPAI
         hXqL1pLo02LXOdxnSyjmP4dazFTLIwSmwNwLaBTEBvzCNg7zQIE2r2ZoxWEnmh82ok3Q
         2gJFHWYevvbLQN93SZqmJQlMA/FGqOOc2r1okG0F46dpUQT+XQXJA273o7MmwhckuU90
         NC1Q==
X-Gm-Message-State: AOJu0YwJ1tEAclQPFGoqYEKYEXmP4PQtjfhDQxJhjaSeh36TRZrcr0Ud
	Sqotp1ZDX4zKq1iI2CTwTT5DYtDCz3fbk2X55Gn79AUjcw3nmMY4GqKeeiq+Lw==
X-Google-Smtp-Source: AGHT+IFiAEQfYEZQmtJtDPS0B85ifzT72QtVqlGF7ZCR4IuJ4YQhdGm/j6VyZX3n+Jpl9Mdn02Plnw==
X-Received: by 2002:a05:6a21:3944:b0:19e:a271:ea8d with SMTP id ac4-20020a056a21394400b0019ea271ea8dmr2427775pzc.26.1707310272711;
        Wed, 07 Feb 2024 04:51:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjD0ku5e7Ty8OVFD5O38jvQ3+ALpPMfFBkjeDGHvXQk2FfuMIPKPES3cNIMYKjDLbKMucPf6ZwdKCTzuI+ueRmSqDG83mCuteoQshD+KnLD0iEsvRR78v6YIJxfEVFWRl8uHDb48LStWS//I9UeinArKefbdI+SRJJQZ1A9obzP4JzwuW2peOCdeSkjFfttoEix9ZqLphcqQNW/izeDGPAk8GMxSC6WuGjAGaM7031qbbkScQsX+HeVG8Rst4KXTWJ3T1kn/unw52rXNGqjRkYG3Cb1Y0c1J/ooJbkcPNftX1TaSNf/ybMap8bTy36wbT2d0fDdzQVeNdy
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id si9-20020a17090b528900b00296a7abe2aasm1550265pjb.8.2024.02.07.04.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:51:12 -0800 (PST)
Date: Wed, 7 Feb 2024 04:51:11 -0800
From: Kees Cook <keescook@chromium.org>
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: tony.luck@intel.com, gpiccoli@igalia.com, shuah@kernel.org,
	corbet@lwn.net, xlpang@linux.alibaba.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation: adjust pstore backend related document
Message-ID: <202402070449.3EFCB80700@keescook>
References: <20240207021921.206425-1-xiangzao@linux.alibaba.com>
 <20240207021921.206425-3-xiangzao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207021921.206425-3-xiangzao@linux.alibaba.com>

On Wed, Feb 07, 2024 at 10:19:20AM +0800, Yuanhe Shu wrote:
> Pstore now supports multiple backends, adjust related document.
> 
> Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
> ---
>  Documentation/ABI/testing/pstore                | 8 ++++----
>  Documentation/admin-guide/kernel-parameters.txt | 4 +++-
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/pstore b/Documentation/ABI/testing/pstore
> index d3cff4a7ee10..2cd67b502f11 100644
> --- a/Documentation/ABI/testing/pstore
> +++ b/Documentation/ABI/testing/pstore
> @@ -41,7 +41,7 @@ Description:	Generic interface to platform dependent persistent storage.
>  		persistent storage until at least this amount is reached.
>  		Default is 10 Kbytes.
>  
> -		Pstore only supports one backend at a time. If multiple
> -		backends are available, the preferred backend may be
> -		set by passing the pstore.backend= argument to the kernel at
> -		boot time.
> +		Pstore now supports multiple backends at a time. If multiple

I'd drop "now"

> +		backends are available, the registrable backends may be
> +		set by passing the pstore.backend= argument1, argument2...
> +		or pstore.backend= all to the kernel at boot time.

I think dropping the cases of " " after the "=" and "," above would make
this more readable (and syntactically correct).

> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 31b3a25680d0..a8a109b822a9 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4748,7 +4748,9 @@
>  			[HW,MOUSE] Controls Logitech smartscroll autorepeat.
>  			0 = disabled, 1 = enabled (default).
>  
> -	pstore.backend=	Specify the name of the pstore backend to use
> +	pstore.backend=backend1,...,backendN
> +			Specify the names of the pstore backends to use
> +			or =all for all available backends
>  
>  	pti=		[X86-64] Control Page Table Isolation of user and
>  			kernel address spaces.  Disabling this feature
> -- 
> 2.39.3
> 

Otherwise looks good.

-- 
Kees Cook

