Return-Path: <linux-doc+bounces-41482-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E297A6AFCA
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 22:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5185189D4A3
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 21:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0128226D14;
	Thu, 20 Mar 2025 21:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="id1O5h57"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89EE1EA7DE
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 21:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742505935; cv=none; b=Lse65l6a0C9yBvEjDj69BEMEgNjVH3yG3c+VGIbpkC6EOik+tx7Jr335i0JEFtqm4o3Yv44wYx7YIkydDI3eKYnlFcQ3Mx64Q1jyrEQunGRl6viSd/dPsreJ/km4PnVsb71Mt6riXTGrWRtxGQ20/zhkXwJxlASDgGOOEprcjlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742505935; c=relaxed/simple;
	bh=vI1BPqRdoy10g+WgmlSAf2KikeZLxUqHEVWTLCbIm9w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=ot8wwrjzrT8JQU86f1AkWpScXKBv7471XQ9vF3Whq/Sw7DLAbhIUr8Ckm9NKHnfgfxFLOxtmLDi4rAQP7ReXzfA/9+hEK4b9/of6BPQ70KjLNThFs7zH8w3LlYJNp8DVAmR+XDEqThMhkleoRXjYHN2tCkLrkPUbDVX+pPdVtQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=id1O5h57; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf861f936so1526875e9.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742505932; x=1743110732; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BM8p6OTMwPELuLuoM3O1JzZA7D2mDcWqh6aQhebe2w=;
        b=id1O5h57dAQjiDasqV2/7bP8JCx+7wK0qTWvGUFZIikYjPdQhH440cY1WkFWuPLj3E
         Wp7ELiRUOwLbv5xP26jsNv+e+z5qxeEWZEMtqgt6f3YuPZQ7GnRgkJbiDOFgVLYwjdiq
         /IrpNJBwrDRmcHHY327m6kexMF28rtSydbs07mSXy9UtxD0wR5Vf9pRUPX2f3H1F/X17
         BLbBNEnL9EBL4C4F6lnyA2w5DxOzdHlFTzNg/JFLzYwN5q59FOdRGCBMtAwJoJROJ/mb
         bJzdsa09nUyagj+fGusJD4w9365g5eMjbI/lVbEVJ2yfgG+zA5kvI99zIvRdbfFbUWQ5
         k9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742505932; x=1743110732;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/BM8p6OTMwPELuLuoM3O1JzZA7D2mDcWqh6aQhebe2w=;
        b=lbuH1XkFnsTqzTmVTTx/lcMNVhYvFw97MoSRIveR4ZD72X80IkXbuMwMNBIF7WN45U
         P/9Fy2TFkv/6dkG9uJK2LaOcp+366Ih6v5UHAEg8LmrTgJwuX9bs580MM40srabbQ8v5
         7RBEdXYYFIhdvLxTTnIh+G9mU+/5ro8/Xt6Be3uSgDzUuhsjNWmEW2zbbKy+ikzCI98v
         L+LKHE5+WSvT50fHJccW3dm6gH6lBMtLEmLujZA+NT1EkiO9K7SlHifcjqZcMPOPMAlC
         N9sEDKlL/Lf7a7a+H9AcutxKyRcIBfekMma928KnHR40z+YN31YHjm+R3Tmc/uaRLPiN
         49JA==
X-Forwarded-Encrypted: i=1; AJvYcCWG0Y8KPDF1HCl9RC8z1d23K4Urfb6nz76WjzMz+YYNEKhFC6mpo+joOsGlHXrZL47WKMnXhIMmk0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuVBT5w8geJ5bj7EKn3QjZZmx+mtRuUbSJDAR/mARLaEiq/qGU
	39EyWKi08t9N52xHr4TebbU5jYb6UDAh+HWMOLCAbVHEr9KGRUzgBEAUc7fzi5Q=
X-Gm-Gg: ASbGncsDowcF4ps4xsNJrieEnJCXuYI22x2tXgcTsRUVGHh55Wm22qZ6GuujvOWOKwd
	oKHxQ6kT/EfNSlpD0X6j34uZ2AkKD/f+QDK6ggyqk4LsKttWcAJR46OflfBOKMZhxvh4aqpAG/P
	yQZCYbvS39mespNwb4lL21e0pAc+X1vCiIO/aKegZv3l9obtWG66YZis4qXxEkXTLO6+NK12OMq
	F4MjUdxQbNsSQOtX3D0wZ9Nvb0YaEjaVYPpuYBW+dLPOh3xuIvRqn4a9y7VLxZTCCYynE6Mf2uz
	aPOCDBXGNhy8fYLgbbLfvC62DpiqzMPpfgFulV9vXp5OE/ptqPj7OZk0nviKjto60rG2Yx67fv2
	eO3LL
X-Google-Smtp-Source: AGHT+IENUyr/tuJjthynG7pDAFWYzf7OBnXUo8NpuhgchW3KTo0PDxUCxZfCqwEA5Mqzg2/ebVjxow==
X-Received: by 2002:a05:600c:46c3:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-43d50a53d12mr2494095e9.8.1742505931793;
        Thu, 20 Mar 2025 14:25:31 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efe55sm579763f8f.88.2025.03.20.14.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 14:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Mar 2025 22:25:30 +0100
Message-Id: <D8LESTM58PV0.7F6M6XYSL4BU@ventanamicro.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "Zong Li"
 <zong.li@sifive.com>, "linux-riscv"
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
Subject: Re: [PATCH v12 25/28] riscv: create a config for shadow stack and
 landing pad instr support
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-25-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-25-e51202b53138@rivosinc.com>

2025-03-14T14:39:44-07:00, Deepak Gupta <debug@rivosinc.com>:
> This patch creates a config for shadow stack support and landing pad inst=
r
> support. Shadow stack support and landing instr support can be enabled by
> selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wire=
s
> up path to enumerate CPU support and if cpu support exists, kernel will
> support cpu assisted user mode cfi.
>
> If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`,
> `ARCH_HAS_USER_SHADOW_STACK` and DYNAMIC_SIGFRAME for riscv.
>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> @@ -250,6 +250,26 @@ config ARCH_HAS_BROKEN_DWARF5
> +config RISCV_USER_CFI
> +	def_bool y
> +	bool "riscv userspace control flow integrity"
> +	depends on 64BIT && $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zicfiss)
> +	depends on RISCV_ALTERNATIVE
> +	select ARCH_HAS_USER_SHADOW_STACK
> +	select ARCH_USES_HIGH_VMA_FLAGS
> +	select DYNAMIC_SIGFRAME
> +	help
> +	  Provides CPU assisted control flow integrity to userspace tasks.
> +	  Control flow integrity is provided by implementing shadow stack for
> +	  backward edge and indirect branch tracking for forward edge in progra=
m.
> +	  Shadow stack protection is a hardware feature that detects function
> +	  return address corruption. This helps mitigate ROP attacks.
> +	  Indirect branch tracking enforces that all indirect branches must lan=
d
> +	  on a landing pad instruction else CPU will fault. This mitigates agai=
nst
> +	  JOP / COP attacks. Applications must be enabled to use it, and old us=
er-
> +	  space does not get protection "for free".
> +	  default y

A high level question to kick off my review:

Why are landing pads and shadow stacks merged together?

Apart from adding build flexibility, we could also split the patches
into two isolated series, because the features are independent.

