Return-Path: <linux-doc+bounces-42811-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F0AA83FB9
	for <lists+linux-doc@lfdr.de>; Thu, 10 Apr 2025 11:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF2661891394
	for <lists+linux-doc@lfdr.de>; Thu, 10 Apr 2025 09:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9759D26B2BB;
	Thu, 10 Apr 2025 09:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="AL5ylmJn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F126B2A3
	for <linux-doc@vger.kernel.org>; Thu, 10 Apr 2025 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279009; cv=none; b=kjJAGat98xtcoYi7+ddyB3+8K017INXwIqSOKRJwiU8tG3ZX44jMbeqwR2OiGZK4ykM6UVyI2z1H9x6409nZeOSzfkXhyXfu+1tBHHCLBxHwUi9j9alCCqvL9VYKMRfIvof/VEaASvUp05aZXyhhTyuafLAd4zJ7X8dP1UYJf7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279009; c=relaxed/simple;
	bh=xS47vOnBOl+2Wgh/X17ml36azQPBKEMDbkQQ9axrYJM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=TvWtWJ3DUYjb+zOYBgbFxRnFSyCTHjK45xKSUEcTkraTmSqUw0KH1OlC7N1guJaQ2o/r4kfZT1Paf+IU3N3gA/erWEWFsfG/kzOjCg4uPVrqxmrcFXUDWfN6PzXlEjKlfEgOC0MxzsOJm1as4GJeql4CLpmC0QFaA4V4D/m87oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=AL5ylmJn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso670735e9.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Apr 2025 02:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744279006; x=1744883806; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PsTek2iG0P9gXerP0u/dhkc6G7oyliO6C0xZFmP/8A=;
        b=AL5ylmJnAqGE1DSAt91SDPd06EgEFCW/rKrEf11c2uGbdyGhpE/70pOzslFN8ACDzw
         8RYHtcvL4sOFhjMcQFKWF9lz11TgoeuR19XsBNM3iPIHEyOEGJCj501fV3UXs7Zw+f9Z
         eoW+/nJxn9u3JQnYtC0xXjjc1ZsnLY6X57EOgpvP6pDuWVz57h6aVHnsG5taGdRnQqsg
         9JOLN2SUURmUj0JCUGoK9gbdIx3g4beEK5Peq/IHR8kxQF1f1RW7PKCayMaLmC1pGZ0K
         +OASt33X2wvMS1NI6NrjxPNtkq7vtv1TxfJ8cylpqg0DXFw098Y06K6Fw2HfpGO3Xl3A
         vN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279006; x=1744883806;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0PsTek2iG0P9gXerP0u/dhkc6G7oyliO6C0xZFmP/8A=;
        b=FddgHMyTVxYmCk8D66NbfiRB2fig7thw1oaGV3dov9GDHZ3YBsPLy2tEPPi188fqt0
         Etqg1Mr9u76M97v/Y18SfL8fcb2qPzFVSdH3VBAHSUH5oCB2S9RsXKGnEbDzSV/mLHKa
         55AKTLl4X8OLOh13niIZd4pw4zNIsYwHFQ+juCp9kqc+KUu/XyIhOMFmoc875PH+4bwK
         rW8puYkDxD+lNOs262VgNyWbunktkOqmyGTWkxLEM49sx0Bwc/4cnLueWvplw2nL2czd
         xeafb5PEL2kbESDQw14FcPotwJIzZHI3XbTcKuF0YTdXMvbiWvtgC6t1dbpQjzMO96uE
         VSDw==
X-Forwarded-Encrypted: i=1; AJvYcCWvfL6Lo2Vu9JQz3jwlDTZK5+4bCDsx4KDIzYVYFUYD1wIw8tVBGMG7fVeMRP7HOvPTzyZxeqa/ssI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJVBOUimEb4/205fDjrYCWUmnv05ShmLkpgpmVk/MKyz/IXdWp
	Tcr29QfzzsiDmAnuZ22+g2zuu7Rsgu7aoZkQVlRztHivAMdeAwkNjO9vDTZKz8E=
X-Gm-Gg: ASbGncvQtoWPSus5NxGy91hZp2+wKFN8nB5f30vEhtsLIb/latiBs3nz0xM07S1oU33
	FUCfuntgVbMNuptpgQQSQXLnh4YyTuE2r4BELceHDlW2REvK/PyfQI6nlUu17cY++rUE2eAGhcM
	zkIu5gmXzmgPjkqO02LJzYK/GbvBU2ao9DV46GXhmwY4rCiHeFvDGrd7aFSDln8bS+QjCoQ/krj
	2ohvkfAVjpmkxi01dFvy1QB8j4w19LAntedeRo2aePsX2nVGAl39fdbp4O4ZD9rUSPgbqAdsGro
	6qLzGn0+SziIGf5KcZsBCVCpzQGaDz+XX4TybYctqKzsaoV+
X-Google-Smtp-Source: AGHT+IHBsekVmgMMcd9frJRGybN0tNs9jfPFgV6X7l6TgORlz7EkCuYcLx9G1wBU1KIlE1VBTkos1Q==
X-Received: by 2002:a5d:6d8a:0:b0:39b:f12c:3862 with SMTP id ffacd0b85a97d-39d87aa7badmr2003379f8f.2.1744279005675;
        Thu, 10 Apr 2025 02:56:45 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:7d22:13bb:e539:15ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89362fd6sm4349691f8f.16.2025.04.10.02.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Apr 2025 11:56:44 +0200
Message-Id: <D92VAWLM8AGD.3CF1VH6NYHCYV@ventanamicro.com>
Subject: Re: [PATCH v12 10/28] riscv/mm: Implement map_shadow_stack()
 syscall
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
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-10-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-10-e51202b53138@rivosinc.com>

2025-03-14T14:39:29-07:00, Deepak Gupta <debug@rivosinc.com>:
> As discussed extensively in the changelog for the addition of this
> syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
> existing mmap() and madvise() syscalls do not map entirely well onto the
> security requirements for shadow stack memory since they lead to windows
> where memory is allocated but not yet protected or stacks which are not
> properly and safely initialised. Instead a new syscall map_shadow_stack()
> has been defined which allocates and initialises a shadow stack page.
>
> This patch implements this syscall for riscv. riscv doesn't require token
> to be setup by kernel because user mode can do that by itself. However to
> provide compatibility and portability with other architectues, user mode
> can specify token set flag.

RISC-V shadow stack could use mmap() and madvise() perfectly well.
Userspace can always initialize the shadow stack properly and the shadow
stack memory is never protected from other malicious threads.

I think that the compatibility argument is reasonable.  We'd need to
modify the other syscalls to allow a write-only mapping anyway.

> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> +static noinline unsigned long amo_user_shstk(unsigned long *addr, unsign=
ed long val)
> +{
> +	/*
> +	 * Never expect -1 on shadow stack. Expect return addresses and zero
> +	 */
> +	unsigned long swap =3D -1;
> +	__enable_user_access();
> +	asm goto(
> +		".option push\n"
> +		".option arch, +zicfiss\n"

Shouldn't compiler accept ssamoswap.d opcode even without zicfiss arch?

> +		"1: ssamoswap.d %[swap], %[val], %[addr]\n"
> +		_ASM_EXTABLE(1b, %l[fault])
> +		RISCV_ACQUIRE_BARRIER

Why is the barrier here?

> +		".option pop\n"
> +		: [swap] "=3Dr" (swap), [addr] "+A" (*addr)
> +		: [val] "r" (val)
> +		: "memory"
> +		: fault
> +		);
> +	__disable_user_access();
> +	return swap;
> +fault:
> +	__disable_user_access();
> +	return -1;

I think we should return 0 and -EFAULT.
We can ignore the swapped value, or return it through a pointer.

> +}
> +
> +static unsigned long allocate_shadow_stack(unsigned long addr, unsigned =
long size,
> +					   unsigned long token_offset, bool set_tok)
> +{
> +	int flags =3D MAP_ANONYMOUS | MAP_PRIVATE;

Is MAP_GROWSDOWN pointless?

> +	struct mm_struct *mm =3D current->mm;
> +	unsigned long populate, tok_loc =3D 0;
> +
> +	if (addr)
> +		flags |=3D MAP_FIXED_NOREPLACE;
> +
> +	mmap_write_lock(mm);
> +	addr =3D do_mmap(NULL, addr, size, PROT_READ, flags,

PROT_READ implies VM_READ, so won't this select PAGE_COPY in the
protection_map instead of PAGE_SHADOWSTACK?

Wouldn't avoiding VM_READ also allow us to get rid of the ugly hack in
pte_mkwrite?  (VM_WRITE would naturally select the right XWR flags.)

> +		       VM_SHADOW_STACK | VM_WRITE, 0, &populate, NULL);
> +	mmap_write_unlock(mm);
> +
> +SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, si=
ze, unsigned int, flags)
> +{
> [...]
> +	if (addr && (addr & (PAGE_SIZE - 1)))

if (!PAGE_ALIGNED(addr))

