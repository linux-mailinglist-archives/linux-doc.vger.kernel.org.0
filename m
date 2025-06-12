Return-Path: <linux-doc+bounces-48862-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C33AD71B6
	for <lists+linux-doc@lfdr.de>; Thu, 12 Jun 2025 15:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB174173156
	for <lists+linux-doc@lfdr.de>; Thu, 12 Jun 2025 13:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055A324061F;
	Thu, 12 Jun 2025 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="USL7PAmy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBE823D285
	for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734696; cv=none; b=cHCMTvR57a6390cf1iCcKGsHb0mEU6wkE4YYI/gAIq7MNNSQOdPQyfog9cjWTIVQp/mv96I22g6KKZ85MUA4aZkdJcCTXLnkpinJMDEGVlHXF6TCDIXwV6ovD4sQcVS+zjkm10q3xUAb7MeVBVruQzmM2zD/FgEl0ZmPT0z6Kfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734696; c=relaxed/simple;
	bh=nSjx51XwsDM238FSIikQC+yI/Iljj0NBnR2BVO64huc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZQiY6FFUk73U6yAABFkxGmbTkWSuCgovNBnF7Np8mZA2obZlh4388V3ZV9IMRURZBQATqXGUWPJX9RcMYps0M7Bt9ZbZLojypNPiLHOlsZNxggn0GLE1KEdjf0ukNX22V7iZwoy533/Kji4MavT72b9gDozwG5BIKq46xNTVqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=USL7PAmy; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fad8b4c927so8693036d6.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 06:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749734694; x=1750339494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yO42KCFFAU1JaE5snqlMD+WeNGQUfTluFPre84YIRbg=;
        b=USL7PAmyjBqjvLTTZ0N7ITv/cMyLL/ILxBJdSWH5hw0LBRwJik1N7ohefT3h/drDIg
         mIeL1iWWS4F4aTMqLU+BEp2/Z3bOzTQf9inqk8cZhqM5dNRNwjBbNnEmNSuQAQ+9S9YH
         q1pzlGs5zBKIt8wiEr3qvX3LmaXqh4KlTN87e+7gO+f1ZbtP8f3u94iwBZ6dxNEZvsQz
         3MPGVksFhtrDEyZtnJXSEVZmxsMUzuJDecfyxsX0hZK64xii5W2/FjMQJOqOOLIYdqEJ
         mP7byCXZwyA7yFAbdp/u/DSOU4dAdeHW1XAnwvkHg6Wq7rJcfX4BEPt7vNbnjNXwnDAm
         A+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734694; x=1750339494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yO42KCFFAU1JaE5snqlMD+WeNGQUfTluFPre84YIRbg=;
        b=bdf+5V/eVt+B7te0Vd+PdiH0/HNwM3kNeVABqZl+SQcQ4xGWZic7tA0FHyj9ae0VHl
         1oNHQ/Z1qY72EEdCDSyK8NocJAGlGBVzmnjLwnZczkVgy7Gap7EQlmxM6hgb/lhLohZ/
         /ZpIyvSY9ezpdqe3JK6vgJMhFPAlFavBd1hz3Uu49ndzeeHkx30ajZNjiPyal9KQacr6
         r2tg4AFuq5TX8dkiasWaqfncGb6iJZnoTwO/t80EIMiwu9qOCMGfBOt7Wpb9jDzv1kLB
         agn+2DIVw/2mBT3IoNKvveohxTtlTj8c7xn3a5ae2x7iditNe7CwgK1aF+KUdydWzixh
         Zzhw==
X-Forwarded-Encrypted: i=1; AJvYcCVZGFStzyASfZBvA5juCnGVv+eA4Ne684jl+spvpw8Y93vhtLp56C1PDqPlRn6MACVTV2U9JWPtXPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnxFaKZRVvIMo56Hbhg2CnHQUD18veiBF5wnk9+ONbEqlQ+8xJ
	hv7bwcjLH7hg0GGOPzGiwsADPoyV6eOeYgZa8sC6h+RK5rRGwTuBodtgKgRTBroF4NtmGQ6JUd5
	qr1NgKPHNRNURZ+LQ23gV1X4JJWSSK1Ir+bMXMFwTdS97MSZq8PYk
X-Gm-Gg: ASbGncusOZhASiM9aQQThVX4mA7cbNZYxlL2Sth5qhDq3RYEqeIietg80WudDqvydei
	yXkZxvZ64yo5It31vHj8SWRP0zXEs9Elh8HKoSlDfwJFhhlnd0xNfNdBkdyTSSHimjZovx+XZqI
	QtlA76766Y5c4RC5H/zW8S/T6cqdqnQZ6aFij6WhNh8iu1VEzhe1isXhs=
X-Google-Smtp-Source: AGHT+IEQ8/gBtL0M7nfyYdA1Q09mRUvmfJss0qUxYGME0df67gFne3lBmXn745akWi2zsvhSTtgFKgn2YK7q1n6XKl8=
X-Received: by 2002:a05:6e02:2783:b0:3dd:c40d:787e with SMTP id
 e9e14a558f8ab-3ddfa80be5fmr50613855ab.2.1749734681937; Thu, 12 Jun 2025
 06:24:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523101932.1594077-1-cleger@rivosinc.com> <20250523101932.1594077-12-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-12-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 Jun 2025 18:54:30 +0530
X-Gm-Features: AX0GCFu-M1pG9OAlM2fvsx7DbIa0rvE-jQkn0nAnykhBaLvlREw8Qci06BqSqC4
Message-ID: <CAAhSdy10FcQxWR3PCA0502AAEQ7S=TxkX-Jtuh+yVDh5ZgNnSg@mail.gmail.com>
Subject: Re: [PATCH v8 11/14] RISC-V: KVM: add SBI extension init()/deinit() functions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Deepak Gupta <debug@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 3:52=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> The FWFT SBI extension will need to dynamically allocate memory and do
> init time specific initialization. Add an init/deinit callbacks that
> allows to do so.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for Linux-6.17

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  9 +++++++++
>  arch/riscv/kvm/vcpu.c                 |  2 ++
>  arch/riscv/kvm/vcpu_sbi.c             | 26 ++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/a=
sm/kvm_vcpu_sbi.h
> index 4ed6203cdd30..bcb90757b149 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -49,6 +49,14 @@ struct kvm_vcpu_sbi_extension {
>
>         /* Extension specific probe function */
>         unsigned long (*probe)(struct kvm_vcpu *vcpu);
> +
> +       /*
> +        * Init/deinit function called once during VCPU init/destroy. The=
se
> +        * might be use if the SBI extensions need to allocate or do spec=
ific
> +        * init time only configuration.
> +        */
> +       int (*init)(struct kvm_vcpu *vcpu);
> +       void (*deinit)(struct kvm_vcpu *vcpu);
>  };
>
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *r=
un);
> @@ -69,6 +77,7 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_=
ext(
>  bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
>  int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)=
;
>  void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
> +void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
>
>  int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long =
reg_num,
>                                    unsigned long *reg_val);
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 02635bac91f1..2259717e3b89 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -187,6 +187,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
>
>  void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
>  {
> +       kvm_riscv_vcpu_sbi_deinit(vcpu);
> +
>         /* Cleanup VCPU AIA context */
>         kvm_riscv_vcpu_aia_deinit(vcpu);
>
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index d1c83a77735e..3139f171c20f 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -508,5 +508,31 @@ void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
>                 scontext->ext_status[idx] =3D ext->default_disabled ?
>                                         KVM_RISCV_SBI_EXT_STATUS_DISABLED=
 :
>                                         KVM_RISCV_SBI_EXT_STATUS_ENABLED;
> +
> +               if (ext->init && ext->init(vcpu) !=3D 0)
> +                       scontext->ext_status[idx] =3D KVM_RISCV_SBI_EXT_S=
TATUS_UNAVAILABLE;
> +       }
> +}
> +
> +void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_vcpu_sbi_context *scontext =3D &vcpu->arch.sbi_context=
;
> +       const struct kvm_riscv_sbi_extension_entry *entry;
> +       const struct kvm_vcpu_sbi_extension *ext;
> +       int idx, i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(sbi_ext); i++) {
> +               entry =3D &sbi_ext[i];
> +               ext =3D entry->ext_ptr;
> +               idx =3D entry->ext_idx;
> +
> +               if (idx < 0 || idx >=3D ARRAY_SIZE(scontext->ext_status))
> +                       continue;
> +
> +               if (scontext->ext_status[idx] =3D=3D KVM_RISCV_SBI_EXT_ST=
ATUS_UNAVAILABLE ||
> +                   !ext->deinit)
> +                       continue;
> +
> +               ext->deinit(vcpu);
>         }
>  }
> --
> 2.49.0
>

