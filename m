Return-Path: <linux-doc+bounces-40828-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC61BA60BA8
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 09:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125CD3B862C
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 08:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BA51A3174;
	Fri, 14 Mar 2025 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="C7izBFWp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2106D19B5A7
	for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741941166; cv=none; b=SiBRvwAJvTe3lnxAkeSTLdJnp1zFMAn5WFj9DocjNkbeIeewLRulozFCRf6/ncEZa5JjbE3PscjJbELnripof+wjn0XZWlVOftHCnkeTerYxdmnAk1MsebWhxfNQqSxL0XlRXChua4ytoiHhkKSq+NHY4Dk/3HYx6rQUUfmLfKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741941166; c=relaxed/simple;
	bh=Ahax57yNYviXLl6AO/urU7xEodN1hyNgBXczDTeX2u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOgonKNuS9FgVtrhzVzA7120V3NgQ1jiLubuNIey6wACwnZyeiyuk8QwFwX4RjZHUnfO2YprSznODY+7b8LuIgifIaye9NfxByr+aOeYMZSRCGnRnokV6E2xcue5BMaxxg7NNtOM/dFNMdjVVzuf16796XZ4zNcBeLoU5OzTIdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=C7izBFWp; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85da539030eso64624239f.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 01:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741941164; x=1742545964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCEdsaw1oyyep+pTm33AMqwczcmyjWKaR0i6JEzwbws=;
        b=C7izBFWpJnWl1/Qv7eSi/99MaYpQr5SAGiONDhHWtieoe5uHTI/PJM95xQGeoNcIoA
         rAm1nPyRbjcv63u7hBD0i/fKo0gRl8QsN1/zAeBTQvJzPlLDuzLy6+k5eiC0LA+HzOIu
         Mr9SD4AjdnYhj49+UqccElGehufsCvWgeUutCqw6H56YY9PGiyTdg5ePAb4ZeWDO05wb
         ix/MpMcCSWrYeRsKW9BAsAtCesSX++FVT+hXg5GjpdA7vd+rsgvGNQO9bJLNAhXQEa1h
         s6PZFdshjo7n07VUs8f7I7JfP182EoOAYK9eChVoulBuEv6DftWUdO6Kk6VUVTsku6eS
         TB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941164; x=1742545964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCEdsaw1oyyep+pTm33AMqwczcmyjWKaR0i6JEzwbws=;
        b=XoUT1nzQFiNeV/p6OKs96IvNpsMd4n0/3BJrE3i2/54xsy9nELwSWsV1Vc3GcU77Oo
         AHKdQSOUttYYQnMpBDg5MPg6dhO17wNA3lyuc8I6fOOlaQUpoJe9TZtOgRILfGxh+H0U
         whRbczHEteWwgp5p5m9AoPN+UQkYvoYjSTuj82BhgIRHCnxsK6eBoVJArecgW/VBHubt
         ww34Em5wkHyvLUPQawuWPFLs/ajiw84OCF6ZYNOFsEwYCJaLbUrNOO5905QJss+57+hf
         8OUmkGpz16x7sG1TfUSQ5CCyl+LeDZ/NvF0oRzaU9riSimEUZnb9sGYFqbqJBk7vfck9
         VCSg==
X-Forwarded-Encrypted: i=1; AJvYcCV9+Djhx5U7DSZULEwZey7MbaAesX2MG3ru1nKa45fQ5ZPsQtPELnKEtNAwK4ib1rGz1j9menXBWbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwatM7NXB4C0gG3joeg+ZjOoUVIZmPx2GbIK3Oph/s1Eknvl34f
	xQhSEy/qX4P4HOA8VvmvoIGs+yyNxnlDdz4WLHAhAKYUOw/RMnMQC1JXDncht0HzbELLmcekoSC
	r4w51EEXMPlnU2DVyS7rrX7/CCoDbCbMbObRFjw==
X-Gm-Gg: ASbGnctkBmkocGaySi0SoGoMw9z11cOe1Phl/1zOQ44N5DxBwui78HsCa5tBP+gm7gd
	WGHa+cGrKjdZJJLHSDCMTnvwTiMAyYafl4jK/jSZcxhbUN5igRfJ2nwdpaQr5sOB2mAL8whnE3s
	ZNo0Mit6KmAck3GNybpwm11PD6AlQnRBTXQDOyOA==
X-Google-Smtp-Source: AGHT+IGKKeRG0A/9f+JHf97yjfLfnO62m5yl+Eo+sZz+dUYEVwFJcclhLB8DsFnVREzfJfzDV8kA5GzC++92Tg4ye+4=
X-Received: by 2002:a5d:9045:0:b0:85b:468a:2d0d with SMTP id
 ca18e2360f4ac-85db8453251mr488127139f.2.1741941163997; Fri, 14 Mar 2025
 01:32:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-19-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-19-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:32:33 +0800
X-Gm-Features: AQ5f1JpuAaWcQ0pYamP7IOKg48HxBlHKjlIDLSO70pqk0-vnHFKYhjS3tUoOFGI
Message-ID: <CANXhq0pXT_vJxyPPGJyVoBsBesmS642JzcmP111rDdYCzkLJaw@mail.gmail.com>
Subject: Re: [PATCH v11 19/27] riscv/hwprobe: zicfilp / zicfiss enumeration in hwprobe
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 11:42=E2=80=AFPM Deepak Gupta <debug@rivosinc.com> =
wrote:
>
> Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index c3c1cc951cb9..c1b537b50158 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -73,6 +73,8 @@ struct riscv_hwprobe {
>  #define                RISCV_HWPROBE_EXT_ZCMOP         (1ULL << 47)
>  #define                RISCV_HWPROBE_EXT_ZAWRS         (1ULL << 48)
>  #define                RISCV_HWPROBE_EXT_SUPM          (1ULL << 49)
> +#define                RISCV_HWPROBE_EXT_ZICFILP       (1ULL << 50)
> +#define                RISCV_HWPROBE_EXT_ZICFISS       (1ULL << 51)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0    5
>  #define                RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << 0)
>  #define                RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index bcd3b816306c..d802ff707913 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -108,6 +108,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pa=
ir,
>                 EXT_KEY(ZCB);
>                 EXT_KEY(ZCMOP);
>                 EXT_KEY(ZICBOZ);
> +               EXT_KEY(ZICFILP);
> +               EXT_KEY(ZICFISS);
>                 EXT_KEY(ZICOND);
>                 EXT_KEY(ZIHINTNTL);
>                 EXT_KEY(ZIHINTPAUSE);
>
LGTM.

Reviewed-by: Zong Li <zong.li@sifive.com>
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

