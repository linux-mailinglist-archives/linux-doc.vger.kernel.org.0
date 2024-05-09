Return-Path: <linux-doc+bounces-16067-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7688C0838
	for <lists+linux-doc@lfdr.de>; Thu,  9 May 2024 02:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4707282D25
	for <lists+linux-doc@lfdr.de>; Thu,  9 May 2024 00:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0FD1361;
	Thu,  9 May 2024 00:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yM7jBjC4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203D738C
	for <linux-doc@vger.kernel.org>; Thu,  9 May 2024 00:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715213258; cv=none; b=HW4aavvuuEixszh9/kA63g5RN1F6nPOINuG2rDTe4QV/E8tEavuShv7t99PE+AirY6Gr+jITJxjOqzn7MfuKZqRhI19+Ce0jIIZGOCUjVE9iOpwRCcQxeQ2ZkrGoMwJ5iB9iqQLh8oOtVPnFUOCTwVu/ZeYz8wk9Efgdw0oe9x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715213258; c=relaxed/simple;
	bh=CVVPS5HjCzkgTDal/E2Bn1omFhWFdSvXRO7h38NDeN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvwuhMSTKzUefqozcw4viFsel2eJoZ2ssLvmyfLzHmtgplaC9ndQ1/JDdJHFuTdxvSMIyIO0sjEG8IUedzcqaxshiar24ECvjZ8658uxGc2udXsT+76zxRnJINPT1ZUB6qKq60VCKYldKKGpGTMNSoMWtCk9Wsis4M0kOnUBem8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yM7jBjC4; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f4496af4cdso360395b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 08 May 2024 17:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715213255; x=1715818055; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6412VEZicQnkZugSEnbJnR1wa1jdzb6p/Jx7cOdB8xk=;
        b=yM7jBjC48AgmrO92piN+jWzhzfOhDeJT6N3qy1zpQJAgSoJjeujxOd50DQtiRM6AHw
         Fvnztjdb5Dka2n3u+SCZYbs4usha5iFQXA69D68T+Y7DoNUDEtP+gfWWJDVE/XOudb0r
         WUEQNzLw+pc6RMC/9AoBt6mxTYia5S68k4psHK7lZe0a9fbYKVOUs8wGQqK54+00BuMT
         w9cnlHhFxZQnFxXfg2hSbazPT3s2Tlx1UNeJwK/VMH+eegla2+bHQePKHbZHu5U7J9do
         hLgu221gm0yvVnbUqUXqCL6kscMSLyujuX7c98nT+dL2FiRQK/fuZPT1fAOj/4dOKSeo
         nGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715213255; x=1715818055;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6412VEZicQnkZugSEnbJnR1wa1jdzb6p/Jx7cOdB8xk=;
        b=LL7jp+6leNdJgcyHNo+yQk6kVg8nhBd2g6m2XMhgiIFkmS3SVnz48kg3H4CZw5YBdN
         qXbL0mw9aDpRb7ibu/cBiPn2Ax0O/SzpTfYs2WwitEaqMM9oJ+jWiHMMQ8AKxPbiLeoo
         yWcsY15DpM3fi3Y1A9gF2/FpS8B48KbJfL3N4ALJmLxigo3fiPrZWhrX+OrLf0UNQG4Z
         UeZHvLDNH472KbexQLv8r/SIpc+RQcZEZhXEvh3hrovBu9gmnvdvO+roLL1mFivU8vZy
         XMjskVz0Upd83c4t2uZadMIp9+NVPxIzT1wE6iqGkQxY/qWmaapqTq2JnfG3wK+6nVgG
         bung==
X-Forwarded-Encrypted: i=1; AJvYcCVWNdoXcKat/i/CGR3TdKGG6s1TgKMsg0j7q2vw69QQu8CMp18eHC7hc8MG0XwBYBYoIRqpZMYIc2hUoPTflwpnUi8lAJbfzoE3
X-Gm-Message-State: AOJu0YxRrJEudpGN9EbRezILYHSi49J0JpnTPO7kcelDUYerAND5Srqj
	94cSS8yz68XWp2f8Gz+rNamxv27wk3uCyGLloXaKlotsF75pQCa+APmds+VWyz8=
X-Google-Smtp-Source: AGHT+IFn88bAR8FRppjVpxx4Li1DASVwJ1zF7Yvk7MQzB0h8bmxFN5sOCIHGIBoohUfrAWiBfqn16Q==
X-Received: by 2002:aa7:8b11:0:b0:6f0:be31:8577 with SMTP id d2e1a72fcca58-6f49c280ad8mr4602857b3a.22.1715213255357;
        Wed, 08 May 2024 17:07:35 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:4144:6911:574f:fec1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2b2fe07sm137325b3a.216.2024.05.08.17.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 17:07:34 -0700 (PDT)
Date: Wed, 8 May 2024 17:07:30 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Deepak Gupta <debug@rivosinc.com>, paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com, broonie@kernel.org,
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	cleger@rivosinc.com, atishp@atishpatra.org, alex@ghiti.fr,
	bjorn@rivosinc.com, alexghiti@rivosinc.com,
	samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, jerry.shih@sifive.com,
	hankuan.chen@sifive.com, greentime.hu@sifive.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org,
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
Subject: Re: [PATCH v3 05/29] riscv: zicfiss / zicfilp enumeration
Message-ID: <ZjwTwvaYSFAuB1qr@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-6-debug@rivosinc.com>
 <CABgGipX3vXeJ_RKnV17pE-NH6=L0XUF2sdKea7hZHbuq4skh_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgGipX3vXeJ_RKnV17pE-NH6=L0XUF2sdKea7hZHbuq4skh_A@mail.gmail.com>

On Thu, May 09, 2024 at 08:00:00AM +0800, Andy Chiu wrote:
> Hi Deepak,
> 
> On Thu, Apr 4, 2024 at 7:41 AM Deepak Gupta <debug@rivosinc.com> wrote:
> >
> > This patch adds support for detecting zicfiss and zicfilp. zicfiss and
> > zicfilp stands for unprivleged integer spec extension for shadow stack
> > and branch tracking on indirect branches, respectively.
> >
> > This patch looks for zicfiss and zicfilp in device tree and accordinlgy
> > lights up bit in cpu feature bitmap. Furthermore this patch adds detection
> > utility functions to return whether shadow stack or landing pads are
> > supported by cpu.
> >
> > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/cpufeature.h | 13 +++++++++++++
> >  arch/riscv/include/asm/hwcap.h      |  2 ++
> >  arch/riscv/include/asm/processor.h  |  1 +
> >  arch/riscv/kernel/cpufeature.c      |  2 ++
> >  4 files changed, 18 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > index 0bd11862b760..f0fb8d8ae273 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -8,6 +8,7 @@
> >
> >  #include <linux/bitmap.h>
> >  #include <linux/jump_label.h>
> > +#include <linux/smp.h>
> >  #include <asm/hwcap.h>
> >  #include <asm/alternative-macros.h>
> >  #include <asm/errno.h>
> > @@ -137,4 +138,16 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
> >
> >  DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
> >
> > +static inline bool cpu_supports_shadow_stack(void)
> > +{
> > +       return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
> > +                   riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICFISS));
> > +}
> > +
> > +static inline bool cpu_supports_indirect_br_lp_instr(void)
> > +{
> > +       return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
> > +                   riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICFILP));
> > +}
> > +
> >  #endif
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 1f2d2599c655..74b6c727f545 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -80,6 +80,8 @@
> >  #define RISCV_ISA_EXT_ZFA              71
> >  #define RISCV_ISA_EXT_ZTSO             72
> >  #define RISCV_ISA_EXT_ZACAS            73
> nit: two tabs for alignment
> 

Deepak, I think you might be using tabs with a display size of 4 spaces
that causes a couple of places to have incorrect alignment but would
look correct with 4 spaces. Linux uses 8 spaces for tabs.

- Charlie

> 
> > +#define RISCV_ISA_EXT_ZICFILP  74
> > +#define RISCV_ISA_EXT_ZICFISS  75
> >
> >  #define RISCV_ISA_EXT_XLINUXENVCFG     127
> >
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index a8509cc31ab2..6c5b3d928b12 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -13,6 +13,7 @@
> >  #include <vdso/processor.h>
> >
> >  #include <asm/ptrace.h>
> > +#include <asm/hwcap.h>
> >
> >  #ifdef CONFIG_64BIT
> >  #define DEFAULT_MAP_WINDOW     (UL(1) << (MMAP_VA_BITS - 1))
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 79a5a35fab96..d052cad5b82f 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -263,6 +263,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >         __RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
> >         __RISCV_ISA_EXT_SUPERSET(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts),
> >         __RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts),
> > +       __RISCV_ISA_EXT_SUPERSET(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts),
> > +       __RISCV_ISA_EXT_SUPERSET(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts),
> >         __RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
> >         __RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
> >         __RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> > --
> > 2.43.2
> >
> 
> Thanks,
> Andy

