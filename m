Return-Path: <linux-doc+bounces-14569-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 219F88A9B22
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 15:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5324A1C227BA
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 13:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3493161319;
	Thu, 18 Apr 2024 13:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="gUTmnMoj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B7815F405
	for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713446491; cv=none; b=b1LreQTABrn4Bn5V1V5vnngLlVB4R3u4CUgBDJ7LFYtbjRCOGsp0fw8Iz4k7zShIkXP7YcHzVaVLnWsnGFhnXEOb1wHy/DnLf+hMp4Lj0kMW1rr/OQO5CiEExhuYLCjM8wa20ZBXOdinYQcjxyyTsNfoPGH8KP440ZUvayqbX7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713446491; c=relaxed/simple;
	bh=xCkZWZsd5MbyA9NOc8fkXFwd6tpKTJgqXPaccDVFJJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fpqa3v6lxy3fz0rl/HZBsf3htsc9aatN8RFVGrs/bHO0uzzIoh+aVtn/7K42Y2NTW2cTWquvvLRkcBf+/LBmhd8mMwFUcUiYvZRc/y6N1G8Di5cOIY1aKLGdTNZdgIGeAhKh9GQOc0swSnQZ6Lty0Z1xUMiwDCyX7UU+mPvwEDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=gUTmnMoj; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-36b30909b01so3067115ab.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 06:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713446488; x=1714051288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JO0ozNsqTpxBsROn3x3SanAr//Rutf3lUig74CS14aw=;
        b=gUTmnMojQcAZ+zR440uQFQcsuAARj0DB1VvGNV3zfZfs6KmN/un01BR93KkxEVK86b
         Yy2I/YRMBjV0P065f6RFwCj+HAT2J8VWhJUkAdFDFu2LQ0S7M7AtUOD3Snw1yDt/C8Rl
         hVIUXUW5+JosBkUvozfCGSpFuL0tKjcg35iSDM44XTsv8Q5Dg1YJTYdaq8tK8Ph9GtbV
         ITw9lBGrsyEkmdf0s0lORQuHWvz6crD3QduRWDhDNdHivK/9RyyOE6Y3U6qvOq+5dGkM
         JEs0Bk9b6VwLGXavabelFkzHaS3ZEysoXLLvjhD8BpdOUVzgDKpr9uBUdohcudRZvX8Q
         Px3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446488; x=1714051288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JO0ozNsqTpxBsROn3x3SanAr//Rutf3lUig74CS14aw=;
        b=KYsipgeQC6QFIm9uTygO4au2xpT/BB/2rc0Hky+fUjjBOpFkaTx5Gy7NKGcWC/A8o0
         X6deHGUIUhsf2f5n0Lxy7f9mmdbP5Wt1Uby5sQKmxF5rGpkjBEnUX00rCnE0L420jcGn
         Ul5+xkTsWD6k6tVGJz9UBFlKpft2Izwxb5TX0Ypo4WllzDV8reLa4oiU6kZCShm6q6KJ
         hmxUrz1hvf600mwfYMvHFAyntnC/CTsqFwjmLD9hnnWDI0sAlpS4Hnm9huvLv7a5eRsK
         iXnXsqDqyRKqqqHEpEiVLL01EeUkufftUy5dw0lP5LXRMQmX6GM2wdXn8jI4qwf8ZiuK
         Ny8A==
X-Forwarded-Encrypted: i=1; AJvYcCV7Uu9gyh2qtYiZa7V2hUQd2LAB/2j+uTjRdZKdkCF/1/ooTNujTCheXwD1JRgy4iTKehTVp7IUsKitfidNperPGeDL6rMxKbhf
X-Gm-Message-State: AOJu0YxTKm45ajMbFfCrS30MsmlGVxcx9+5rHoYATSWq4d/1ns8fTCRw
	aW/UDlCkWiw6SAvuvhR3VCQVXxOAo1fTc8GvlLJsmSeLO0W7yK7nKc8PjbfKMDIMMOG1tq28LSG
	TZr2Mvtdc/6lltZXng4k476VirVIenNnSso4Jcw==
X-Google-Smtp-Source: AGHT+IFYxMvNR0jXCZIG1KPR1/WCDVRMgUDvpXntlv1WYC3zuUPdvb9LjVkJtYSDV5Al2WTKHOMIUCYgVBtJncbys6A=
X-Received: by 2002:a05:6e02:219c:b0:36a:3ef4:aa0a with SMTP id
 j28-20020a056e02219c00b0036a3ef4aa0amr3216818ila.24.1713446488311; Thu, 18
 Apr 2024 06:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418124300.1387978-1-cleger@rivosinc.com> <20240418124300.1387978-12-cleger@rivosinc.com>
In-Reply-To: <20240418124300.1387978-12-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Apr 2024 18:51:16 +0530
Message-ID: <CAAhSdy3bjKQhRRFLhNtCGNG=f9cj=LHhr0sPWdeFFR9KpC3RVw@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] RISC-V: KVM: Allow Zcmop extension for Guest/VM
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 6:14=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zcmop extension for Guest/VM.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index 57db3fea679f..0366389a0bae 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -172,6 +172,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_ZCB,
>         KVM_RISCV_ISA_EXT_ZCD,
>         KVM_RISCV_ISA_EXT_ZCF,
> +       KVM_RISCV_ISA_EXT_ZCMOP,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index a2747a6dbdb6..77a0d337faeb 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -52,6 +52,7 @@ static const unsigned long kvm_isa_ext_arr[] =3D {
>         KVM_ISA_EXT_ARR(ZCB),
>         KVM_ISA_EXT_ARR(ZCD),
>         KVM_ISA_EXT_ARR(ZCF),
> +       KVM_ISA_EXT_ARR(ZCMOP),
>         KVM_ISA_EXT_ARR(ZFA),
>         KVM_ISA_EXT_ARR(ZFH),
>         KVM_ISA_EXT_ARR(ZFHMIN),
> @@ -136,6 +137,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsign=
ed long ext)
>         case KVM_RISCV_ISA_EXT_ZCB:
>         case KVM_RISCV_ISA_EXT_ZCD:
>         case KVM_RISCV_ISA_EXT_ZCF:
> +       case KVM_RISCV_ISA_EXT_ZCMOP:
>         case KVM_RISCV_ISA_EXT_ZFA:
>         case KVM_RISCV_ISA_EXT_ZFH:
>         case KVM_RISCV_ISA_EXT_ZFHMIN:
> --
> 2.43.0
>

