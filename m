Return-Path: <linux-doc+bounces-40822-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2D7A60B83
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 09:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC3EF19C2D33
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 08:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3541A23B1;
	Fri, 14 Mar 2025 08:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SU205fhP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A731A3160
	for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 08:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940962; cv=none; b=mFJhj2mFCXNTKhWV/4aVqOFL11K7j6CBogGL/nznlKN3Iajo/pkBpQYHIYJ96I+j2HofHWDlf4BLYc4AVunJovQ5IKNlQsUigaPPomQ+J8d92Jy3ezoTs6n7PJLG1UeYUokF74SEQIxyf54H1Kpj1U7HLUUWfFZ0kAeCEanN++0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940962; c=relaxed/simple;
	bh=pypCEmHo/IWtdClRxjE17LRHg2z6Czxw9DUeOBzQgpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TAmXG0vOepE8KgdXYJxK046LcLCCsSUYgjmF0eTSkCnKkNMYuqx0OQJ706leVWDNsZxVSjOYlYhzfhD9emsf++50kIDe9jdThz/H6OLpjJ5HBdmnV/VM/2FgMcShX2mAeWOdxOAVxjpdnMQ7seecbnR3bjG2ghCXaaEWrpLncDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=SU205fhP; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3cda56e1dffso10242715ab.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 01:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741940959; x=1742545759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxVr83p2rf+5dCw7Lw8LcBlDRmjGebAKjjwwOziVPbk=;
        b=SU205fhP9JgTz9il5zSQQO0x5AwH6bwSeLrGgtUR7wkk1VmE+gJcqlGyNTutljv+VB
         3ssGHiQQlbBits+0qMcgCH55YHX/9mbXIMz3QLIiLwd1e4/0GJeDkciMfc8flV5jCzhn
         RyG9ncI8aEScg6EBJpB81HlGU8htZWLYbIQKapzD3LfUbJH/ux4X+WfHEABFxbjnpN9K
         gugntbDEtpHT3zxZ6Iu1cQuHQVwbAEPW48w8o+q5ux8XpfEXboHA0R9lx94LfR3Q0GOE
         NqCCmxSaCyQ5GEG0Vf7+Qv8ZdqyBlJQ9RwLZ9UAI7yQrQx4hJ2OV6oN+RiF6nWU6wKQZ
         AT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940959; x=1742545759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxVr83p2rf+5dCw7Lw8LcBlDRmjGebAKjjwwOziVPbk=;
        b=Fd/DQLIQdUZmf/q5BHIVzNYSAvY1SOZbv2uHkZWYjS/euWlAO1tGLCXI7MfFqNrSt3
         ZNloMn5e28SDS2DCzouwcleQcpXsIy0SGvY1mJ7/IgTtkhZdEzb9zcGoZcXnetyAfKVp
         FlEdNJKNo7TsTI6y7FNRRF/U5u3nO5FuVFMUvwXeYCMNzWebxHkY+S1VPVBU0Rmpsp9t
         ekOI+rHcgbxWoPxLJBB52/GmeUtNIXFCd50pOjGY71DFAPXfg72pWZl0jqFnlnJnWqu+
         3an6GSf3jqtBQyXKrOCpvUoesPVrxMNpOwGlsqhie6KMnBRScG3TW00D4SiJ4tRqi6Ih
         4BkA==
X-Forwarded-Encrypted: i=1; AJvYcCVOadx2p1JRLRkF0jK1Ps/O4D4q5VcNC30cUJ1wKcb9Ucw2xpOLqyHnTuIsArlzjHTWaUhStkiQ4xM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKD95PzkgQSUFWI6AW5WxK4bs46otPZwAepbnNBguKXXx7NZWO
	ltrdU2yvDBEQugDAPMzIyAbxdQud5v9sL8fYF0IP/9pKUVsCYlZgc3V62fGyVS4mpaj8S+7+fYb
	zadTOGg312YsJX4rntAy5VjV14JxGnL1H9wRmNg==
X-Gm-Gg: ASbGncthpy6b1IdCU39QTUBOiEmm896PkHpDJvVzjphnJD9NbptSctj147i4ui/XnuN
	TtW4UIZy6Q7sU2zFF9DEfOy6do+QDBsXQmBUduKgvCVn3q2XKdF1oLrCYcYp6SSuaT031kJbSOK
	M0bQ7EHNANfH/Ew/VghKQMTRYux8w=
X-Google-Smtp-Source: AGHT+IGlDdFi6Vpd7s4QLdbvi8Cqhy34taRkBd3D9zjPXIBtVOW0CW6f58wdIjt5/hLNpuPREwmdcymeJrMO3NiULz8=
X-Received: by 2002:a05:6602:474a:b0:85b:3e32:9afb with SMTP id
 ca18e2360f4ac-85dc4886c82mr172686839f.14.1741940958777; Fri, 14 Mar 2025
 01:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-7-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-7-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:29:07 +0800
X-Gm-Features: AQ5f1JoNjzFrXdaav0OHMQixLYEkQuo_9iZghJLJMBKa9dQ7-q72vtSQTfgooYI
Message-ID: <CANXhq0pAwwcKW_0Pxj_M5rtdGwuhrCO1=428y2aHgRBc60N2eQ@mail.gmail.com>
Subject: Re: [PATCH v11 07/27] riscv mm: manufacture shadow stack pte
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
> This patch implements creating shadow stack pte (on riscv). Creating
> shadow stack PTE on riscv means that clearing RWX and then setting W=3D1.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index 8c528cd7347a..ede43185ffdf 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -421,6 +421,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
>         return __pte(pte_val(pte) | _PAGE_WRITE);
>  }
>
> +static inline pte_t pte_mkwrite_shstk(pte_t pte)
> +{
> +       return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
> +}
> +
>  /* static inline pte_t pte_mkexec(pte_t pte) */
>
>  static inline pte_t pte_mkdirty(pte_t pte)
> @@ -749,6 +754,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
>         return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
>  }
>
> +static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
> +{
> +       return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
> +}
> +
>  static inline pmd_t pmd_wrprotect(pmd_t pmd)
>  {
>         return pte_pmd(pte_wrprotect(pmd_pte(pmd)));
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

