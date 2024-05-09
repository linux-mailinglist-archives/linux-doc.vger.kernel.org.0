Return-Path: <linux-doc+bounces-16069-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E0E8C084B
	for <lists+linux-doc@lfdr.de>; Thu,  9 May 2024 02:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99F082816E9
	for <lists+linux-doc@lfdr.de>; Thu,  9 May 2024 00:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999BD4A29;
	Thu,  9 May 2024 00:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="quGCd96A"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6F44C6C
	for <linux-doc@vger.kernel.org>; Thu,  9 May 2024 00:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715213454; cv=none; b=ensetPDBtIG+iJDmnYw55Ze2ydVwZtwZfjqtxYoMHmtpShXZK2d7V0wlOaOuXTrOao76nWheyePBiTNNL4ocXeyRYd9jt8O6/zXNRRzZiGuB8pwca0nhBn9zG3K7ps3Y7r5yD//B/OMclmZzNtmOH8AGiWQ9HyDzGo7V7+cXBRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715213454; c=relaxed/simple;
	bh=qBebSFGe23qXNHpRvKnwFwAJnPuYEpMUnskY0mHPUrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUuxYzBjPSUqEnuJCHo1yAn2jmQZilgzzc01Ec/1nKJ4NmImJhdyFOanHELeu4OJEsL2umMzTKQr93LyoVSCWQJoFdAKPft9MOlOM6NLVikY1caEUUWqnD7qKzYbS2rQrX//0M8QscqeLwHu/weiZ7NUMJIameJczOZBSmx+2tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=quGCd96A; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5b21e393debso185892eaf.2
        for <linux-doc@vger.kernel.org>; Wed, 08 May 2024 17:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715213450; x=1715818250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LZqIlWMGzBPFcGrSBngkQrJzMqDGPG9IZxXHGwlwCwA=;
        b=quGCd96ArelnOE/6jR2PICNWYL+yjgcpBQTWGRz8858h7zcLdHpD4yPsXyGkceVeFx
         6ZEZu31weRy09C/x775rqVrhKNRbS5J7WEgKuSAk+xS+90tVAj1uwO01MMPhQWiHAD7+
         0w3ruqsIAVLJwZluydzAyxLMgTsqnGILCEDQQhYMcU3S50PlbiAGgJ3fUWMz2OdkE4L6
         ZRBH/b+5SYIOVlbtRzQIhv7mPSgpfBFJ6fxvLzEw6yZWDON4Y9ukBqs2GjL3HbCzDP52
         bFo8GOOsYRTVUTetLDgiUyv1Wt5Y5biG3p3u+GimpT6WhrwwZ7MsWXuLBdvmrWTwiELM
         7XDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715213450; x=1715818250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZqIlWMGzBPFcGrSBngkQrJzMqDGPG9IZxXHGwlwCwA=;
        b=xOT+QPBFBhAN6TnTrtFFB4SE3wsmnBT8ydZF+UpIev+2ZNdGllV/eZ6/GidJkMzgDu
         T7HxUI8BbyIBg/uiQZUb0DMX2Ok/MplSG2y+TF7MlNv9+bo2r2TCKrjq/qTX/qAgb5Ra
         iam9/GX/dD5dj2m5F2MuXynKuM+bfMgP2FM4KahMRhaA/FpR2Cds+OQmvLu2mZDb3R15
         7w/Z0k+ziQUDO953zoEOaNWQz5lyxyM0FT9KaBAOp/48FVZLVvKm2f0sObOGgW0r6q/T
         QJUleQ/II9QJbUsbIWB/4O5oL/QuEGrfE5uenEvpCFp6cWBHvdyKmiuoJ8Of4KIB3jE7
         p9OQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9nFLzhdrOQUjLLeztftKDQRtMJOZo3SvDAtwYx+wQw0DHzW690/MiyaPYmMsnjGodb+uHyLbRLrf0aTztzM0fik678zoI4B8X
X-Gm-Message-State: AOJu0Yxk6op2awVwv9UZed8HoWfJ0wFU6+vJTpmmqK9faikTssvmcj68
	12MbRnGmXcok3CR/XzX9xdaj6TOFnWJfLIba0kF19vrQZvIeSxg99aq0n4cEHEo=
X-Google-Smtp-Source: AGHT+IGf3JRzZDV8fYaLM87bNAbWYV5rWVExMXqYWMFb1yCMw/X1461/R98MMrR2NY4Y0ojK0sDDKw==
X-Received: by 2002:a05:6358:785:b0:18d:9114:eb1e with SMTP id e5c5f4694b2df-192d3778875mr506366755d.22.1715213450408;
        Wed, 08 May 2024 17:10:50 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:4144:6911:574f:fec1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-634103f727dsm81409a12.72.2024.05.08.17.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 17:10:49 -0700 (PDT)
Date: Wed, 8 May 2024 17:10:46 -0700
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
Subject: Re: [PATCH v3 01/29] riscv: envcfg save and restore on task switching
Message-ID: <ZjwUhvLBv13qi77a@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-2-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403234054.2020347-2-debug@rivosinc.com>

On Wed, Apr 03, 2024 at 04:34:49PM -0700, Deepak Gupta wrote:
> envcfg CSR defines enabling bits for cache management instructions and
> soon will control enabling for control flow integrity and pointer
> masking features.
> 
> Control flow integrity enabling for forward cfi and backward cfi are
> controlled via envcfg and thus need to be enabled on per thread basis.
> 
> This patch creates a place holder for envcfg CSR in `thread_info` and
> adds logic to save and restore on task switching.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/switch_to.h   | 10 ++++++++++
>  arch/riscv/include/asm/thread_info.h |  1 +
>  2 files changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 7efdb0584d47..2d9a00a30394 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -69,6 +69,15 @@ static __always_inline bool has_fpu(void) { return false; }
>  #define __switch_to_fpu(__prev, __next) do { } while (0)
>  #endif
>  
> +static inline void __switch_to_envcfg(struct task_struct *next)
> +{
> +	register unsigned long envcfg = next->thread_info.envcfg;

This doesn't need the register storage class.

> +
> +	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0", 0,
> +							  RISCV_ISA_EXT_XLINUXENVCFG, 1)
> +							  :: "r" (envcfg) : "memory");
> +}
> +

Something like:

static inline void __switch_to_envcfg(struct task_struct *next)
{
	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
		csr_write(CSR_ENVCFG, next->thread_info.envcfg);
}

would be easier to read, but the alternative you have written doesn't
have the jump that riscv_has_extension_unlikely has so what you have
will be more performant.

Does envcfg need to be save/restored always or just with
CONFIG_RISCV_USER_CFI?

- Charlie

>  extern struct task_struct *__switch_to(struct task_struct *,
>  				       struct task_struct *);
>  
> @@ -80,6 +89,7 @@ do {							\
>  		__switch_to_fpu(__prev, __next);	\
>  	if (has_vector())					\
>  		__switch_to_vector(__prev, __next);	\
> +	__switch_to_envcfg(__next);				\
>  	((last) = __switch_to(__prev, __next));		\
>  } while (0)
>  
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 5d473343634b..a503bdc2f6dd 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -56,6 +56,7 @@ struct thread_info {
>  	long			user_sp;	/* User stack pointer */
>  	int			cpu;
>  	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
> +	unsigned long envcfg;
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  	void			*scs_base;
>  	void			*scs_sp;
> -- 
> 2.43.2
> 

