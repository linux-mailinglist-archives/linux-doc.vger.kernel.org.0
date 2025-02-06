Return-Path: <linux-doc+bounces-37180-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15296A2AA50
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 14:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4CAB188923C
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 13:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CCB1C6FE8;
	Thu,  6 Feb 2025 13:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="sKJ7CCc+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBD61624E8
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849758; cv=none; b=JzA8sGmatYdBy1k2imKJMrucoqRLrDzBPUjDuFljpMbJrSEh+n/WoTKzOxwnqyfLqzvxi7g0TYm300pN0a7D5UE3DwHzuWsaYbv6FtB6qPI+B5wdN+5V0ibFzeY3E3c91ApsWpJ5NYJBvwJawTBP1sJ6mSVsyBj9bZqmM3GICRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849758; c=relaxed/simple;
	bh=A6EvT/ybkDjxMJqnUueaONdHJGupkcrjgBVTOvJY/gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SWnv+mJxgocTRGn0BLTTke+UVxpViQkpUw07+J+N7/6mkdgGE8siI4UAmHOhIPUzmjqnsNiy2dPn1gqYFkmoNsfjfsETV3ke13nJYC1AWogic1ivpDhDYURBoLVaBjcTfE5xe+SCujwqaoO+GRshkwLhb6ZZjKHV6ZWitVEzR5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=sKJ7CCc+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43621d27adeso6136585e9.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 05:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738849754; x=1739454554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+yUQpAX+o3b8spnwV7aqw1/aYSKStgrXep4Af2rWXQ=;
        b=sKJ7CCc+Ke7igbp9Zqh/1l/RKZ6s5Qgzn7A6U+tcOo1kxHyJ8Yjj0+Da0pWmibj/zH
         1CCyaGvcg1OaoF9J3LYWsR5yv4+ryyxMxREMmE3FIZlpUduq4AGhN0EzXkRDJxfl3NMw
         CSeLRWClwUqE1TJUIA5oo+tsTB8LxDl/0wgaar/tTo3t3+NuVKxw4HrvfyjMs6HX8AFl
         ZHwpnvPSAgJJA0XVvSP0t1HVMRRIwVJgU3BDrrfAs+8IPJrCtw0kB9CM0KhGk80eCj4X
         OWyx/2AutlcfxRs1RervbX8yVC+ZKWEgGB8Z6jHXKHxLwcEvY6UXPax4cb8707wbagmN
         3pmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738849754; x=1739454554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+yUQpAX+o3b8spnwV7aqw1/aYSKStgrXep4Af2rWXQ=;
        b=FXzjHmIqri/e03CVxib/MCO3DZPTC/llnBaPditE+pctLlwik4tQuKYelxxvGitxon
         TM0D3Py00acV4md49MGDLv28IJkCgcYoKFDw18rrv9Oyz5ojNyl8UOw+wxwavVyGp9+k
         4gmb2gLrZ2FnkTrRq9STaOloHvm/rJ+/TwViKAXOtyuOBSCjukCOOU3dkwTxqIFy10Rw
         DoXZCiAp+Es6pyZZHrbvOMCuEmdoJ2nJ0LLx1FNHVSKAiIcZ8+EYonDhatuzbV+0njsP
         6s6BLEJREfpWJWPFCWJjLpNijnTZmjlMXh1mDi7mmki97roGDztWKQPCEfL6GZsra6un
         gSWA==
X-Forwarded-Encrypted: i=1; AJvYcCVYGkgxR4kN91vrK8ZuRqFRZ63ZM6BdbOgutxZRq9JWOvTsEVZP+jJh8VvO+Ajw9bePFT680efGjdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9wi5bS4ONrLln+1xRez9Ho0vgpGhm9wfMjhf5VU8mU0eCehbt
	+3N7iTtRjvlEomOPiJ/emJC4Vfbv3VnaDh0gVA8//FPRkioebBIH7hN3wl62xeM=
X-Gm-Gg: ASbGncvP7ndKZSgtgvnim61pZ0QZIBXFo8zMn4YcC4QxMMldSBMf+svegOmcI03CHvQ
	sTqYDHBa0e1bB7B0RIKQuyEs0jOhiBDH7thkM08e9gtREMyE22t3TSxJ/sVA4uxd6o9nFQ66xF5
	LXrciFgdzE0KozjeYiwy5Vg5ee6OwdqGRJyQhr4k5lC9ouG1TpbWUUJ21ZXkda2FSfrr3rIE8Js
	2QVVIaJ1ZuHbSSxKA+lUqnbVuif5nan4a9qYshGRvceKFek0EDBjYsBtqlpQhVGxEbf4A9EoFBt
	LxgjWZSWu492WyV/VSO1hyHlRmDCxpxTDnl9ku1vhlohqn16zoEoGbFi9Z6Y
X-Google-Smtp-Source: AGHT+IGg4Oxn/it/Gfzbb+ERjhH8cdtxBySZuTwU5SUr81Aju5a+rmMa6q+7lfy94Mm7DhC9V1Q64g==
X-Received: by 2002:a05:600c:4452:b0:434:f82b:c5e6 with SMTP id 5b1f17b1804b1-4390d42cd07mr47760125e9.1.1738849753707;
        Thu, 06 Feb 2025 05:49:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd368bdsm1831411f8f.33.2025.02.06.05.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 05:49:13 -0800 (PST)
Message-ID: <fec3b7be-4259-4eef-87f9-b2cee5718cae@rivosinc.com>
Date: Thu, 6 Feb 2025 14:49:09 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/26] riscv/traps: Introduce software check exception
To: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian Brauner <brauner@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com,
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
 atishp@rivosinc.com, evan@rivosinc.com, alexghiti@rivosinc.com,
 samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-14-b37a49c5205c@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-14-b37a49c5205c@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 05/02/2025 02:22, Deepak Gupta wrote:
> zicfiss / zicfilp introduces a new exception to priv isa `software check
> exception` with cause code = 18. This patch implements software check
> exception.

Hey Deepak,

While not directly related to this patch, is the exception 18 delegation
documented in the SBI doc ? I mean, should we specify that it is always
delegated when implementing FWFT LANDING_PAD/SHADOW_STACK ?

Thanks,

Clément

> 
> Additionally it implements a cfi violation handler which checks for code
> in xtval. If xtval=2, it means that sw check exception happened because of
> an indirect branch not landing on 4 byte aligned PC or not landing on
> `lpad` instruction or label value embedded in `lpad` not matching label
> value setup in `x7`. If xtval=3, it means that sw check exception happened
> because of mismatch between link register (x1 or x5) and top of shadow
> stack (on execution of `sspopchk`).
> 
> In case of cfi violation, SIGSEGV is raised with code=SEGV_CPERR.
> SEGV_CPERR was introduced by x86 shadow stack patches.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/asm-prototypes.h |  1 +
>  arch/riscv/include/asm/entry-common.h   |  2 ++
>  arch/riscv/kernel/entry.S               |  3 +++
>  arch/riscv/kernel/traps.c               | 43 +++++++++++++++++++++++++++++++++
>  4 files changed, 49 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
> index cd627ec289f1..5a27cefd7805 100644
> --- a/arch/riscv/include/asm/asm-prototypes.h
> +++ b/arch/riscv/include/asm/asm-prototypes.h
> @@ -51,6 +51,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_u);
>  DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
>  DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
>  DECLARE_DO_ERROR_INFO(do_trap_break);
> +DECLARE_DO_ERROR_INFO(do_trap_software_check);
>  
>  asmlinkage void handle_bad_stack(struct pt_regs *regs);
>  asmlinkage void do_page_fault(struct pt_regs *regs);
> diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
> index b28ccc6cdeea..34ed149af5d1 100644
> --- a/arch/riscv/include/asm/entry-common.h
> +++ b/arch/riscv/include/asm/entry-common.h
> @@ -40,4 +40,6 @@ static inline int handle_misaligned_store(struct pt_regs *regs)
>  }
>  #endif
>  
> +bool handle_user_cfi_violation(struct pt_regs *regs);
> +
>  #endif /* _ASM_RISCV_ENTRY_COMMON_H */
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 00494b54ff4a..9c00cac3f6f2 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -472,6 +472,9 @@ SYM_DATA_START_LOCAL(excp_vect_table)
>  	RISCV_PTR do_page_fault   /* load page fault */
>  	RISCV_PTR do_trap_unknown
>  	RISCV_PTR do_page_fault   /* store page fault */
> +	RISCV_PTR do_trap_unknown /* cause=16 */
> +	RISCV_PTR do_trap_unknown /* cause=17 */
> +	RISCV_PTR do_trap_software_check /* cause=18 is sw check exception */
>  SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
>  
>  #ifndef CONFIG_MMU
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 8ff8e8b36524..3f7709f4595a 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -354,6 +354,49 @@ void do_trap_ecall_u(struct pt_regs *regs)
>  
>  }
>  
> +#define CFI_TVAL_FCFI_CODE	2
> +#define CFI_TVAL_BCFI_CODE	3
> +/* handle cfi violations */
> +bool handle_user_cfi_violation(struct pt_regs *regs)
> +{
> +	bool ret = false;
> +	unsigned long tval = csr_read(CSR_TVAL);
> +
> +	if ((tval == CFI_TVAL_FCFI_CODE && cpu_supports_indirect_br_lp_instr()) ||
> +	    (tval == CFI_TVAL_BCFI_CODE && cpu_supports_shadow_stack())) {
> +		do_trap_error(regs, SIGSEGV, SEGV_CPERR, regs->epc,
> +			      "Oops - control flow violation");
> +		ret = true;
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * software check exception is defined with risc-v cfi spec. Software check
> + * exception is raised when:-
> + * a) An indirect branch doesn't land on 4 byte aligned PC or `lpad`
> + *    instruction or `label` value programmed in `lpad` instr doesn't
> + *    match with value setup in `x7`. reported code in `xtval` is 2.
> + * b) `sspopchk` instruction finds a mismatch between top of shadow stack (ssp)
> + *    and x1/x5. reported code in `xtval` is 3.
> + */
> +asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *regs)
> +{
> +	if (user_mode(regs)) {
> +		irqentry_enter_from_user_mode(regs);
> +
> +		/* not a cfi violation, then merge into flow of unknown trap handler */
> +		if (!handle_user_cfi_violation(regs))
> +			do_trap_unknown(regs);
> +
> +		irqentry_exit_to_user_mode(regs);
> +	} else {
> +		/* sw check exception coming from kernel is a bug in kernel */
> +		die(regs, "Kernel BUG");
> +	}
> +}
> +
>  #ifdef CONFIG_MMU
>  asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
>  {
> 


