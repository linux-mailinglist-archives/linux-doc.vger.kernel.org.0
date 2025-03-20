Return-Path: <linux-doc+bounces-41486-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFA2A6B0B2
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 23:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 474683A9BCC
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 22:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6003420C477;
	Thu, 20 Mar 2025 22:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="gtSw6wE0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB46C207A06
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 22:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742509468; cv=none; b=exBv2rH1UZNSxOkXUfpHJfkwgXikc71ls/rR7HQwU2Wo+nfqu5pyH2FdIpQxR0Oj4e6WolFkPlT4APRuDdnzEbyAaWaz0WyFXtnpCfsAxhomD7ZcIGLXOQXdA5p5uSms+YWd/Cw5fUzdzntLvcnfWgvY8QGJAk3yIGsmNs/Tugo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742509468; c=relaxed/simple;
	bh=HT1LCekeMxYBkfwyJHDrwOJ5bsKecZWK8cF1hjzVuFw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=avzPVdOTdOFT4G8QuApsn9eSQjRzBp7+e7WRPUvDVU3XDZ6VqEUzlRvk0R6HGuUldfcT/qxYAkppwbWQZjVfVu0hJlygoLbAC9+aEck9I4y5/BMcRoCWRS8V0eo1UGldM3B9L1R309n3iJj9+dnCBQEl8Y+NwfVB+T7p+cbKHSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=gtSw6wE0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43935d1321aso1667515e9.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 15:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742509464; x=1743114264; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3HA3HoJNZW8enSnrAqrQ3Y05aO56vxfDpg3v9Wkt6M=;
        b=gtSw6wE0H/TRHYmMq3VZqTtOgTPLP1/fKSS42zjdCzwwyoeEYOo1aTEzBlQ+xr9Xtn
         NCSBE62ZYz11VYzsbQA2b/kBM+auiqNYh1LPtqSc9Z130CaETHP+yYC4ubtmJ+WPORej
         H6ULtEfCEgBd7mFC2Z+HhNJ7J3rHgY+ZaBuiwNWiUBVHSSI5ZSmwXiVoQELbgK+vbolX
         1WfRqt9JTZi7EIVuTHEG68vPfFTT1oq0PGzddJPGzpUNsApPwFY4acUj6QHX/q0ijg5n
         OlMGXQ3BYMfZ1zoXNT+SqHTXqzA06k0l3etvhqZt71ZAJhjhyWaKklTcn29dF+j31fgR
         9y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509464; x=1743114264;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M3HA3HoJNZW8enSnrAqrQ3Y05aO56vxfDpg3v9Wkt6M=;
        b=tWwu9yiQHuyzhi1ArMiehINqEinaKE/mZyDXKk4z2Ui8B3oGMaEx/f+bAsqYt+BfrO
         VShtE8hCm+IA7ObVaB51NGbGyy4zNJ0OiIzhLOi/2ViHtS0BipXHgJdu84pMFPnCLajf
         S+WgP535Njc0U2TEoF2WgQESNvM6EUE9wQsac1XKeNEsbSZbN9jJhyzPxfOOt2oL+jRi
         LBf8RAieX2VsdNtq+e5eOrV/wC4nR9pvcyS/CHevvII+AKwoxKRZNO3jB7s1lbdr2rYa
         EYlbxyEsPVqmnOobUdiGyCYCsav9dMGYDeeISScaJJgpwXwY8hMmjNaU3cf5RfkeS3oj
         G53Q==
X-Forwarded-Encrypted: i=1; AJvYcCVE4a/IYJFSaN1lNNX+1ltCJHTxf5O2DJI8l8PQMcrsBkxw4uY3XRnol9LJtFGqBBrKPFqis3z2J5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTka/yPPZVlNlspCiQ2qFITq9PLN57x531bEW+2LGdaF2+qeAY
	vhkcHZL3/rJx9qTbaMCJGVQ8aChJVUnKX8f4sGc/kNlLSoGYUgXlYLmh06JXj54=
X-Gm-Gg: ASbGncvNE7DeugE8EXVhi5WU7XlvPA2qpVsGVlU42dKjyuHpMMG5FUcOCjVqyuat8tN
	4OIRZCmsGDaGcwBQBb2xqZ3K4w6tvd35jt/NjHGMFjX6qFqdtERmZv99Q7BGCYfA1L8dRO7BT3Q
	rWKUsle1Tc2XcFuQOPozHBwQpt91iUlEbqQTYHSAO9k2S1TsR17TineJplghbaiZsc9afVIUak5
	Su7RiWi2SHJEjCJVZnRYK0Uc7HByTFNW92xAE8juIG0GKQQ8fIHgMl8ykTPawV4V18Nc9P48wWf
	DaVtDsDI+AVt27P6GS4syKmXLV4lyj4hhKeO1qzZy4PX2NUn43cmGT3Ou945bZriQhkyzY5WXvH
	kAqtS
X-Google-Smtp-Source: AGHT+IE69CkeFEj88CLeab7klKRoAawBZazbHPIMjQcfhs1Va11jKN4uP0xkM8FxO9at+ieqUDxG0A==
X-Received: by 2002:a05:600c:3110:b0:439:9a5a:d3bb with SMTP id 5b1f17b1804b1-43d509e428dmr2353095e9.2.1742509463811;
        Thu, 20 Mar 2025 15:24:23 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9decbsm9222955e9.27.2025.03.20.15.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Mar 2025 23:24:17 +0100
Message-Id: <D8LG1TTBMPWX.3MKAEM8X1WYAX@ventanamicro.com>
Subject: Re: [PATCH v12 19/28] riscv/ptrace: riscv cfi status and state via
 ptrace and in core files
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov"
 <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>, "Eric Biederman"
 <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann Horn"
 <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-19-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-19-e51202b53138@rivosinc.com>

2025-03-14T14:39:38-07:00, Deepak Gupta <debug@rivosinc.com>:
> Expose a new register type NT_RISCV_USER_CFI for risc-v cfi status and
> state. Intentionally both landing pad and shadow stack status and state
> are rolled into cfi state. Creating two different NT_RISCV_USER_XXX would
> not be useful and wastage of a note type. Enabling or disabling of featur=
e
> is not allowed via ptrace set interface. However setting `elp` state or
> setting shadow stack pointer are allowed via ptrace set interface. It is
> expected `gdb` might have use to fixup `elp` state or `shadow stack`
> pointer.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/uapi/asm/ptrace.h | 18 ++++++++
>  arch/riscv/kernel/ptrace.c           | 83 ++++++++++++++++++++++++++++++=
++++++
>  include/uapi/linux/elf.h             |  1 +
>  3 files changed, 102 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/ua=
pi/asm/ptrace.h
> index 659ea3af5680..e6571fba8a8a 100644
> --- a/arch/riscv/include/uapi/asm/ptrace.h
> +++ b/arch/riscv/include/uapi/asm/ptrace.h
> @@ -131,6 +131,24 @@ struct __sc_riscv_cfi_state {
>  	unsigned long ss_ptr;   /* shadow stack pointer */
>  };
> =20
> +struct __cfi_status {
> +	/* indirect branch tracking state */
> +	__u64 lp_en : 1;
> +	__u64 lp_lock : 1;
> +	__u64 elp_state : 1;
> +
> +	/* shadow stack status */
> +	__u64 shstk_en : 1;
> +	__u64 shstk_lock : 1;

I remember there was deep hatred towards bitfields in the Linux
community, have things changes?

> +	__u64 rsvd : sizeof(__u64) - 5;

I think you meant "64 - 5".

> +};
> +
> +struct user_cfi_state {
> +	struct __cfi_status	cfi_status;
> +	__u64 shstk_ptr;
> +};
> +
>  #endif /* __ASSEMBLY__ */
> =20
>  #endif /* _UAPI_ASM_RISCV_PTRACE_H */
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> @@ -224,6 +297,16 @@ static const struct user_regset riscv_user_regset[] =
=3D {
>  		.set =3D tagged_addr_ctrl_set,
>  	},
>  #endif
> +#ifdef CONFIG_RISCV_USER_CFI
> +	[REGSET_CFI] =3D {
> +		.core_note_type =3D NT_RISCV_USER_CFI,
> +		.align =3D sizeof(__u64),
> +		.n =3D sizeof(struct user_cfi_state) / sizeof(__u64),
> +		.size =3D sizeof(__u64),

Why not `size =3D sizeof(struct user_cfi_state)` and `n =3D 1`?

> +		.regset_get =3D riscv_cfi_get,
> +		.set =3D riscv_cfi_set,
> +	},
> +#endif

[I haven't yet reviewed if a new register is the right thing to do nor
 looked at the rest of the patch.]

