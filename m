Return-Path: <linux-doc+bounces-41487-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77470A6B0C1
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 23:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77FA916D9F6
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 22:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8591921C17B;
	Thu, 20 Mar 2025 22:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="oR5yI+dS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857B52222DD
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 22:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742509812; cv=none; b=G8OZRds5dGpmdv6TwtexRA+pw4t0XgNiHYL6hsv3KGyG7goebYtWAibHzUtXTi2xR/xs/N1cLjY6BVKqHZ4jFOYw356NLByo7iAZiAXvY9zJf4H1A9vReOnQAGDGejl6c8JVsMBHCnXEDNVDuz7f1c/YKNp8HMcCPPrhUDj+j7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742509812; c=relaxed/simple;
	bh=vflRrrsnCM79fxzO5pPrxOluLycregqyFFnGs8AHfO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUGijhHISJdfRsrkuecIVQtHSpaS7nS7hPF9DOsJ0mZM4DCOUPeTe2ZxIqWHWZCspP2sIDDszQf/eh5YHvYXxUeXDVM3QDNHsC0cbTbgLRcR0A7+ikyQ8BkcTiR70HJ17/GFK12DL1prjC+JUGNmnWpnYp94ebCbTm1V7PJARb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=oR5yI+dS; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e63a159525bso926387276.2
        for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 15:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742509809; x=1743114609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhKgSRxm2mNSCqvm5Zj9K3Ods9oUsUl94h74lzVe+vg=;
        b=oR5yI+dSS8gh9QJrj8stngfC1e1E+6lVfe9TLaT3inCCOBF3VX6n58nK5RDgnn6BRb
         7MKRyLq6HR550oLR2qcCUp/q5oiA3n9Q6S6eiG0kdyuarGJ9f40VCcozgr/FlwGGCfIk
         1uB+RNnwakW+ZBanEjgi8uwcGmwgFjZuFRVzKpofpSiJJ/Oncb3mK29RR5+/0F6OaZ8Y
         Hzrm9wWB9AvqSSeQU4JLTP/ipfZHBirhxZzl3uEnEQjod6dXsbOMKrkgnB0RjLy0TCX6
         ufznOfCg1JmEfdpOIbAm8+BopF7TPAd64traBoIIjVm7CCUS5MQ+lJMy2sde1Kwk61bu
         UIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509809; x=1743114609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhKgSRxm2mNSCqvm5Zj9K3Ods9oUsUl94h74lzVe+vg=;
        b=mIxv4uvy/Rt11J0t+3sPM3VDD4QnUzLadHyVJPkqgyQR6s97HtX8vjb7su5l2OEYz2
         RHiJPQHm+zQVUM6OM7HkCs/HPVGo35nHKBU28nHvn9m7aN+CWOUhlgFli5jedqzvaHIX
         5G5iz+CPPFeIbeasEk37wrs1rCuG6IuAW1fqeTuQkXD15878jxNeSkLvZngj7eNMvUHE
         zzTT9+Dy27uirOPhYIY2Rvpzy7H4PM9B3vkg5piJclORDgFqH0Wr6mJyLWbxJpiO3F6S
         t70ODZjx1gMLK2a8E71y4wvpAfP0yE0Nv5VySGXwBkril3cSoRvrHuNTM80WV7AKYxA4
         m0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVrZfWW2g0ayDjByNZ/MLw4HwJmGhRkEXIJ4Sjz9M7oV9d4ChOjxM1DzppAk8KWNuvJT9EFdDnjDCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrtH4Y+6Hmf86pQEkMz80SIE4bU0I+f/7Z32qHjv404KN/M8SU
	oXUDRFgDYozArvEObG4lKWgjucvmn/tAknoXeAiILyLdeVeww18IPdqrQeebGjnDLlzU4aN47RL
	OR3y1Y6cpkO8sR0JZ0r8s4u9pu9QJr8PR0kHJRA==
X-Gm-Gg: ASbGncuGL5zTJhxv6GbkRhGaX/D5/TpdNvwhEVSm/ZXKia+5ZZhvOmNP6Qlmv9ExlYz
	hU04BXUvuTYFXWqWP6PmYZCu03r9EUcVf5YODBNpU+lqnaKeBJ76+lYZgasCQobXZefZQLWGL/T
	dUS6mTLscr/dOEPOKZwR8jwjqn/Gw=
X-Google-Smtp-Source: AGHT+IEQPzBHifdPzQrM8MhMztEZK/jnjn8OcNor9KhvI4hEsyHN6f7exl2vjGFEVUFZVWt5FCpCyI9kZub1gEwdZzk=
X-Received: by 2002:a05:6902:a05:b0:e60:99d2:cbc2 with SMTP id
 3f1490d57ef6-e66a4db6ba8mr1114497276.25.1742509809144; Thu, 20 Mar 2025
 15:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-25-e51202b53138@rivosinc.com> <D8LESTM58PV0.7F6M6XYSL4BU@ventanamicro.com>
In-Reply-To: <D8LESTM58PV0.7F6M6XYSL4BU@ventanamicro.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 20 Mar 2025 15:29:55 -0700
X-Gm-Features: AQ5f1JpPoZ6b9vZ5xwZpI2oxEH4zoWU0U5E6Pfiy0DThCuNWaEl3L1CWR9SNfKo
Message-ID: <CAKC1njQHu1UeSSApWHXedEURBezuQL1BDcrpsSfi=D0JmDFX8A@mail.gmail.com>
Subject: Re: [PATCH v12 25/28] riscv: create a config for shadow stack and
 landing pad instr support
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
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
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	Zong Li <zong.li@sifive.com>, linux-riscv <linux-riscv-bounces@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 2:25=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcma=
r@ventanamicro.com> wrote:
>
> 2025-03-14T14:39:44-07:00, Deepak Gupta <debug@rivosinc.com>:
> > This patch creates a config for shadow stack support and landing pad in=
str
> > support. Shadow stack support and landing instr support can be enabled =
by
> > selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wi=
res
> > up path to enumerate CPU support and if cpu support exists, kernel will
> > support cpu assisted user mode cfi.
> >
> > If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`=
,
> > `ARCH_HAS_USER_SHADOW_STACK` and DYNAMIC_SIGFRAME for riscv.
> >
> > Reviewed-by: Zong Li <zong.li@sifive.com>
> > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > ---
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > @@ -250,6 +250,26 @@ config ARCH_HAS_BROKEN_DWARF5
> > +config RISCV_USER_CFI
> > +     def_bool y
> > +     bool "riscv userspace control flow integrity"
> > +     depends on 64BIT && $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zic=
fiss)
> > +     depends on RISCV_ALTERNATIVE
> > +     select ARCH_HAS_USER_SHADOW_STACK
> > +     select ARCH_USES_HIGH_VMA_FLAGS
> > +     select DYNAMIC_SIGFRAME
> > +     help
> > +       Provides CPU assisted control flow integrity to userspace tasks=
.
> > +       Control flow integrity is provided by implementing shadow stack=
 for
> > +       backward edge and indirect branch tracking for forward edge in =
program.
> > +       Shadow stack protection is a hardware feature that detects func=
tion
> > +       return address corruption. This helps mitigate ROP attacks.
> > +       Indirect branch tracking enforces that all indirect branches mu=
st land
> > +       on a landing pad instruction else CPU will fault. This mitigate=
s against
> > +       JOP / COP attacks. Applications must be enabled to use it, and =
old user-
> > +       space does not get protection "for free".
> > +       default y
>
> A high level question to kick off my review:
>
> Why are landing pads and shadow stacks merged together?
>
> Apart from adding build flexibility, we could also split the patches
> into two isolated series, because the features are independent.

Strictly from CPU extensions point of view they are independent features.
Although from a usability point of view they complement each other. A user
wanting to enable support for control flow integrity wouldn't be enabling
only landing pad and leaving return flow open for an attacker and vice-vers=
a.
That's why I defined a single CONFIG for CFI.

From organizing patches in the patch series, shadow stack and landing
pad patches do not cross into each other and are different from each
other except dt-bindings, hwprobe, csr definitions. I can separate them
out as well if that's desired.

Furthermore, I do not see an implementation only implementing zicfilp
while not implementing zicfiss. There is a case of a nommu case where
only zicfilp might be implemented and no zicfiss. However that's the case
which is anyways riscv linux kernel is not actively being tested. IIRC,
it was (nommu linux) considered to be phased out/not supported as well.

We could have two different configs but I don't see what would serve
apart from the ability to build support for landing pad and shadow stack
differently. As I said from a usability point of view both features
are complimenting
to each other rather than standing out alone and providing full protection.

A kernel is built with support for enabling both features or none. Sure use=
r
can use either of the prctl to enable either of the features in whatever
combination they see fit.

