Return-Path: <linux-doc+bounces-16219-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BACAB8C2CAD
	for <lists+linux-doc@lfdr.de>; Sat, 11 May 2024 00:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AA5A1F20CD3
	for <lists+linux-doc@lfdr.de>; Fri, 10 May 2024 22:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC2F635;
	Fri, 10 May 2024 22:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="k12AqZ/B"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67621514D3
	for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 22:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715380617; cv=none; b=j6hDQcsz1OstxazUpI1HcWsTTU7v+HMd3Bf/gv8X/mFSySU4XrLHPMquVfb+oyJCijdhW9AGxwsliw9IbbQUzfhlgngdYdXXQ6Rsdgslthel+xPfu1J7O/Ar7HSRLC31BhSAUp+kcvBsm+obyuJGBMf8qGl06BLNIiaZkMvopyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715380617; c=relaxed/simple;
	bh=yoVhvIbXtXjAXXbTeoK/ZDLeEQzQ/4+EhbyXgPPnC74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRTIXJ7d7ugZcY8U65ZBhWHA3JJxffVcOHNJBZ7xJ1Dq0ef8+oztEGkRHknGuK08Ky+nPZtc0yMcNqUdSFPPqQyu9o7KqLq+PbILi960hBc3sa/zm9zpOE1pe1MSUBCcBpPFDDU5SZeRYrjEDsgk+5RcSEDBtrKDfRBXoQ9UMZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=k12AqZ/B; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f472d550cbso2006673b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 15:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715380615; x=1715985415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zS7lCbzZkns2fdQ69wn4m037nt1gQxHyRlvOKblzJbQ=;
        b=k12AqZ/Bq0Z+cHO6rimHqBAFFXB4mSIfmE8UdZggLlEgmkr+khlydOldPXDim6nMTx
         FRvQmSpiVUlYESYUziCy/pZ0o0hB6IH4Vv8de5ZGIM7p6rh6aum/Lhkq2y5nvoJC7/YO
         cmqaLm9Fw7xT9qUzFcpK4IfzV9F7gRGBf3nIPQGyuBOf89a3VltX3DRiqZ9kyc8DijBX
         OvS2gz1n687nO+f5aBbk2O1dtI9BIsVJ0VmVnLgPVTDTXqXH3L2xEkEbd3vJ5GD6liMZ
         HvEnV0dpii2FIgo6/LoIkoPEBujpKPngyylN9RIXTLKyIcXkLTGImyvAEYRkmImgD9Ra
         RgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715380615; x=1715985415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS7lCbzZkns2fdQ69wn4m037nt1gQxHyRlvOKblzJbQ=;
        b=TIVOx9dlyfHZHf3d6CIG5gVrLoyxHpnR191ZrFiGvCpHyFpOAh0FExY45Int893Okl
         Y2RimQ83FC+jp/pW88CwFiKR8RKmsAjElqXYu9voDhWmp0FFkNQvY6BwesV1rPtbIuLS
         359VazdDd05o9HAt9uEGefnG2nXDM0zAK4r/kGXmcsmxNWlQ9LxfFpr8iv1bCG0ozDvQ
         4C5qXffoPiI2oS8cme3ghK/430HhHkzQDe8VJD1UAY7UpV2X2FINx1z0SXDvtY1/bncp
         pyNai+rYPYRTmGtgaFlLEnvRijY9B5RDJMLuenCoD/y9bq+cPYXEYxtVzftovDP9tz1R
         DDNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd5ER1DhOOqmbZILap+DdkwhAbKPQPQelOD1u/F3qWArewg5zhKbJomJ/r/6kzpwsBaRasOpY9IFpKWXkFqeNgImADglfNGrFx
X-Gm-Message-State: AOJu0YzeEAE1xBrK4l3PPyZS6HXpn5xet2o9KGuZQ6Q+eBm2O5M4ERRH
	rEBueC/b/psDWUWvzG/UY2mMNIJ8P/E4wFe9kL8tD5MC+PeXHbq6k4dzPjHkkBk=
X-Google-Smtp-Source: AGHT+IECyJ3HLUBNJc9MInaH+TnpeoZ9uVPxr9owDU+2eCIW7wv4pKs78C2KGMvMq9oXNwmWHlzw3Q==
X-Received: by 2002:a05:6a20:3206:b0:1aa:5a22:5eca with SMTP id adf61e73a8af0-1afde0ecc61mr4558503637.31.1715380615067;
        Fri, 10 May 2024 15:36:55 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:629e:3f2:f321:6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a83d3dsm3438933b3a.65.2024.05.10.15.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 15:36:54 -0700 (PDT)
Date: Fri, 10 May 2024 15:36:50 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 03/29] riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
Message-ID: <Zj6hgrXzuxFdr3sl@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-4-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403234054.2020347-4-debug@rivosinc.com>

On Wed, Apr 03, 2024 at 04:34:51PM -0700, Deepak Gupta wrote:
> riscv will need an implementation for exit_thread to clean up shadow stack
> when thread exits. If current thread had shadow stack enabled, shadow
> stack is allocated by default for any new thread.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/Kconfig          | 1 +
>  arch/riscv/kernel/process.c | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e3142ce531a0..7e0b2bcc388f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -149,6 +149,7 @@ config RISCV
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>  	select HAVE_STACKPROTECTOR
>  	select HAVE_SYSCALL_TRACEPOINTS
> +	select HAVE_EXIT_THREAD
>  	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index d3109557f951..ce577cdc2af3 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -200,6 +200,11 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
>  	return 0;
>  }
>  
> +void exit_thread(struct task_struct *tsk)
> +{
> +
> +}
> +
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  {
>  	unsigned long clone_flags = args->flags;
> -- 
> 2.43.2
> 

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


