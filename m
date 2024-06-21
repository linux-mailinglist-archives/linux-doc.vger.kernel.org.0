Return-Path: <linux-doc+bounces-19084-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F289115E9
	for <lists+linux-doc@lfdr.de>; Fri, 21 Jun 2024 00:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 850AF1C22008
	for <lists+linux-doc@lfdr.de>; Thu, 20 Jun 2024 22:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A81142E62;
	Thu, 20 Jun 2024 22:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="j17AFsNe"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA202140378
	for <linux-doc@vger.kernel.org>; Thu, 20 Jun 2024 22:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718923970; cv=none; b=JscFPYp8Lns0GVdXWtnnLQnaEXPlV/HFlSIWlLSXPaEnh1Q4in2nCI11cfjzTmcHVLoT5+fQTOVKecVydnelQX6EXM+c31xiYbRVNnLI+W8yQhoWh/pKTgnfIy0QGgGn6chr0dcMXazrdUK2v8AELnltrwO+8df694uleyF5L+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718923970; c=relaxed/simple;
	bh=b4OU7ew9TNZmH+SM+NlNs4apyxJrTNMEMMgy/KhMBoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPfPgsN4eFhI7rcrn7tSGAcl28zkDx5Dxxg088Rbxtc25P413K7U1E5o6XzL3ELUIMxCgAsTBXJYIYkEKhnqYqiSaE2QiU3DB3NN+V50xqi6tSnwBy5DdEsfXuw4LVv83J6dEtpuuwKfDPIJIK5lTLjr869jc8jG65IsMQhGPEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=j17AFsNe; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f4c7b022f8so13019015ad.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Jun 2024 15:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718923968; x=1719528768; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HpVIY4+aAbkXXiS+A3JdTJqHYqpOhUBTuW6XcJDBl9k=;
        b=j17AFsNeaRVfBj7I4u4dAU9JkhNTGwczsMZHOhvQYDEwfW6MMtAIl37Tas/N81RkY/
         lovnENL+gCaquaG++zZt9eSGqVacuWcC58Yi+rLsm4AociFialMkvPduLgRAJkj3oJoj
         bNrbDEEurJD6t+PrnlqDCabTVfHzCWt3/EEyqL+zdulMljxHeeuOHqH9VwEJgQlGq/Be
         OTHhA2CU7JiV2ufee6DXzKkZUyg0ulGkp2JKDwSyr9va4xGJe3LQDLNvFQRGAw8f5LTG
         YgKmiLQujL2tAMqek/hu6uxV2Y/6ExtUXo0hXb2YgaBZekxmOJSvOd6xlpbCXn+J2jUr
         ALQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718923968; x=1719528768;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpVIY4+aAbkXXiS+A3JdTJqHYqpOhUBTuW6XcJDBl9k=;
        b=uVwOZreVaRswRa8Slzsk2bGw0K/M6DjCBep6emkJnwO2OLVzJEL2lOyUXwfKTagArU
         EcHn38UFq5rNxJpL8V8WuGz+Mwrf/dmTfEqMvrnveIxQi90k1ZINZTn1IK/uA7Rp6A9n
         FQrygSXq/o7IvvclCSzOeXKcX2Y3FmANXVDrPRe7Ec1WIlSmyYDp7bOvNhalgeyvv7Sa
         VuHwT1CSSLXwU506btiufYXKD4wQ5A2YmfoNQh3cJzdwMjxxJRUI59x3CF5ypIUDeOYP
         gx/ZDcyqmRN0n4ujfxteenPwd6FxgnkIKI/TmlchkGWSYi+G86A0zp2co92stqMV8Rkl
         LryQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Bzj7MBQ3uVzEDShyw8mXFUKPRI9ifqdn+FsQG/TGmxiaBvWEi0zki2IqczEISPj+hHEiR+1cNiH23iczyBC0Xd/UmNBVsz78
X-Gm-Message-State: AOJu0YxhJpr+RtJXsMWu4NOGQ3payXr6RIEs5wEWFMPa1fsXUI2uwKCm
	d4DfrDJpaXf9e9/Pv7N9aErL4H2GKQkGpRUT55yFR99F/cdikL5GgW54IZ/eCvw=
X-Google-Smtp-Source: AGHT+IF+zqZ+Lx0RC6ue/poxgqOnOX1TFmx08Oct1RZJyaZY/hmhQDmLsojlT/WUXfCqsCQxo77OvQ==
X-Received: by 2002:a17:902:7447:b0:1f7:c56:58a3 with SMTP id d9443c01a7336-1f9aa3e980bmr64928225ad.26.1718923967881;
        Thu, 20 Jun 2024 15:52:47 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb2a0esm1331205ad.254.2024.06.20.15.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 15:52:47 -0700 (PDT)
Date: Thu, 20 Jun 2024 15:52:44 -0700
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
Subject: Re: [PATCH 3/5] riscv: hwprobe: export Zaamo and Zalrsc extensions
Message-ID: <ZnSyvLKC+xXlW1i+@ghost>
References: <20240619153913.867263-1-cleger@rivosinc.com>
 <20240619153913.867263-4-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619153913.867263-4-cleger@rivosinc.com>

On Wed, Jun 19, 2024 at 05:39:10PM +0200, Cl�ment L�ger wrote:
> Export the Zaamo and Zalrsc extensions to userspace using hwprobe.
> 
> Signed-off-by: Cl�ment L�ger <cleger@rivosinc.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 8 ++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 2 ++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 25d783be2878..6836a789a9b1 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -235,6 +235,14 @@ The following keys are defined:
>         supported as defined in the RISC-V ISA manual starting from commit
>         c732a4f39a4 ("Zcmop is ratified/1.0").
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZAAMO`: The Zaamo extension is supported as
> +       defined in the in the RISC-V ISA manual starting from commit e87412e621f1
> +       ("integrate Zaamo and Zalrsc text (#1304)").
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZALRSC`: The Zalrsc extension is supported as
> +       defined in the in the RISC-V ISA manual starting from commit e87412e621f1
> +       ("integrate Zaamo and Zalrsc text (#1304)").
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>    information about the selected set of processors.
>  
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 920fc6a586c9..52cd161e9a94 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -71,6 +71,8 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 45)
>  #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
>  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
> +#define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 48)
> +#define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 49)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 3d1aa13a0bb2..e09f1bc3af17 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -116,6 +116,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		EXT_KEY(ZCA);
>  		EXT_KEY(ZCB);
>  		EXT_KEY(ZCMOP);
> +		EXT_KEY(ZAAMO);
> +		EXT_KEY(ZALRSC);
>  
>  		/*
>  		 * All the following extensions must depend on the kernel
> -- 
> 2.45.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


