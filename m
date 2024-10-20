Return-Path: <linux-doc+bounces-28062-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 480CE9A5533
	for <lists+linux-doc@lfdr.de>; Sun, 20 Oct 2024 18:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC7B8B21968
	for <lists+linux-doc@lfdr.de>; Sun, 20 Oct 2024 16:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82B0194141;
	Sun, 20 Oct 2024 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="XjPAGumF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6EA193419
	for <linux-doc@vger.kernel.org>; Sun, 20 Oct 2024 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729441632; cv=none; b=PuwPxehHm2eHKJPDvR994Lf1m0FJAY2ETXV8LrpxKyksg04cTiHmGtD7sGusNKKGwSv2G4V+0OWJhpWbUcqbxqeBtDD6UA+1kGiAFfOl7wZp6ZON5Afu4kOblBoxadiEvmGUAJZo1i9fMMIUhHul2d4/GIkYOnO/T5sYARrrU1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729441632; c=relaxed/simple;
	bh=ZJWn3/ME7/PKMVdnFU/59dN2zZj9ws4GTRkgqj3wGV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5iG8l8hxY4qiSJceyDg3fDdduZi8EIyXxkKAS0p7xU0lpsPum9AB/BFhh2oLZLgfyA8bmfWzvyBXIURIf2Z6o/yZrfaabHTbZryawQj1N02ze6ys/C4PJ76jSJCitAaMcnoRBU1k6s5UkbEfMX+QOlztlx4kC6gyZ96f1+Ak9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=XjPAGumF; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a3a7b80447so13296235ab.1
        for <linux-doc@vger.kernel.org>; Sun, 20 Oct 2024 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1729441630; x=1730046430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlJnZ2dnH0yKZQoVb1MYW1Cw6i1APoJ7tUtFkvOa8R4=;
        b=XjPAGumFjzgOouOvI19TBHCSzJZmvD8s1d2a8pm/9QmXxxLP0mpSHXJBpqG4e6MV0e
         89F5IhQQocXqa3miw2TSzrawL+wu/gSOxbX8+WLleKs3qgzUwRaN0fZsG/kL15uxl2f2
         VxA0hOtQuFVQpH8Nu/0pE+eRDmKsu8meobqWOhadkJqBD/DPoSU7USwSk97w+/CaIpQV
         YxS/rZwL5iEHe6Jm+ESyUBFjCbALjL/lKPM3VC3ZCpuhwk9KpU2lqljVqSIGYiUDiax9
         xqbM55EdIXIEd7BaSQZL6o1rv7AAsMF9URg6xWa1hFiF3i3gGHcyT2jHhHrLqawRJ96s
         cdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729441630; x=1730046430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlJnZ2dnH0yKZQoVb1MYW1Cw6i1APoJ7tUtFkvOa8R4=;
        b=PEm0ueTVwgoLEnUxHGHihHn/TataqTytvKcZ+iVlHvutLJqxMWqJmSSIyPhJcElmuh
         VJVy0WrQHyM2LxvW/aK9zuTKqTCwjLHVdFXVQO862TSpp20GwmmCPd13VsuceF1ChJ6s
         MEGedq2PXjiJr++MTebjJ7GhE8s4FxqXC98n0P4Yj7xOYgutx0xfQq2Wh/BM4YcvKuXK
         DOtuWodeuPLGMagUjGSQDLtS5vzGfJLhKEdry4nHBBdH8SFeKRB/69T8W3qCX3vkr824
         dnoRRx0tqIjbdqYq8690/xzMi0lVYXwhXQBjzBt0FhMNHJDrV6bOdrAyBfhOZ80UL4BO
         PhFw==
X-Forwarded-Encrypted: i=1; AJvYcCX58+2imBgv8eGlYardGJ8kzZDNkk3XT8kJgCi4HKmP7LQe18tKrizDkmDy/dmuIjpXQDtc6FpWLic=@vger.kernel.org
X-Gm-Message-State: AOJu0YznBcqSpLwcotqK2yUX/3uRnMoe4GXG4m3ScXaJLKWj/U+vH34D
	YAPObc0+z8N6PfnUTsXTcpui3DqyYZ9h804jy5h9VzAcJsq4asySBeV9ZrlWEGuH3Du57PIBDLZ
	6xcDIihUw12UhucthdpKqttLqtEwJPfXS8COeFQ==
X-Google-Smtp-Source: AGHT+IHut51aPnA4HRNe+5sFOzWqMYIfb+uEzsIdOlVQy40Ze9JNhMPONaOQfYNIMN+UGYB+CfdjzsYqyLXhrhld8kI=
X-Received: by 2002:a92:cd83:0:b0:3a3:96c4:29bc with SMTP id
 e9e14a558f8ab-3a3f406fe98mr81302935ab.11.1729441629798; Sun, 20 Oct 2024
 09:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016202814.4061541-1-samuel.holland@sifive.com> <20241016202814.4061541-10-samuel.holland@sifive.com>
In-Reply-To: <20241016202814.4061541-10-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 20 Oct 2024 21:56:58 +0530
Message-ID: <CAAhSdy3FTjVUDBJtbsFwj6+DWjrQh3nWwvsm_1edDUO9SkXB2A@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions
 for guests
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, 
	linux-kselftest@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Shuah Khan <shuah@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, kvm-riscv@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	Evgenii Stepanov <eugenis@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 1:58=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> The interface for controlling pointer masking in VS-mode is henvcfg.PMM,
> which is part of the Ssnpm extension, even though pointer masking in
> HS-mode is provided by the Smnpm extension. As a result, emulating Smnpm
> in the guest requires (only) Ssnpm on the host.
>
> The guest configures Smnpm through the SBI Firmware Features extension,
> which KVM does not yet implement, so currently the ISA extension has no
> visible effect on the guest, and thus it cannot be disabled. Ssnpm is
> configured using the senvcfg CSR within the guest, so that extension
> cannot be hidden from the guest without intercepting writes to the CSR.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
> Changes in v5:
>  - Do not allow Smnpm to be disabled, as suggested by Anup
>
> Changes in v2:
>  - New patch for v2
>
>  arch/riscv/include/uapi/asm/kvm.h | 2 ++
>  arch/riscv/kvm/vcpu_onereg.c      | 4 ++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index e97db3296456..4f24201376b1 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -175,6 +175,8 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_ZCF,
>         KVM_RISCV_ISA_EXT_ZCMOP,
>         KVM_RISCV_ISA_EXT_ZAWRS,
> +       KVM_RISCV_ISA_EXT_SMNPM,
> +       KVM_RISCV_ISA_EXT_SSNPM,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index b319c4c13c54..5b68490ad9b7 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -34,9 +34,11 @@ static const unsigned long kvm_isa_ext_arr[] =3D {
>         [KVM_RISCV_ISA_EXT_M] =3D RISCV_ISA_EXT_m,
>         [KVM_RISCV_ISA_EXT_V] =3D RISCV_ISA_EXT_v,
>         /* Multi letter extensions (alphabetically sorted) */
> +       [KVM_RISCV_ISA_EXT_SMNPM] =3D RISCV_ISA_EXT_SSNPM,
>         KVM_ISA_EXT_ARR(SMSTATEEN),
>         KVM_ISA_EXT_ARR(SSAIA),
>         KVM_ISA_EXT_ARR(SSCOFPMF),
> +       KVM_ISA_EXT_ARR(SSNPM),
>         KVM_ISA_EXT_ARR(SSTC),
>         KVM_ISA_EXT_ARR(SVINVAL),
>         KVM_ISA_EXT_ARR(SVNAPOT),
> @@ -127,8 +129,10 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsig=
ned long ext)
>         case KVM_RISCV_ISA_EXT_C:
>         case KVM_RISCV_ISA_EXT_I:
>         case KVM_RISCV_ISA_EXT_M:
> +       case KVM_RISCV_ISA_EXT_SMNPM:
>         /* There is not architectural config bit to disable sscofpmf comp=
letely */
>         case KVM_RISCV_ISA_EXT_SSCOFPMF:
> +       case KVM_RISCV_ISA_EXT_SSNPM:
>         case KVM_RISCV_ISA_EXT_SSTC:
>         case KVM_RISCV_ISA_EXT_SVINVAL:
>         case KVM_RISCV_ISA_EXT_SVNAPOT:
> --
> 2.45.1
>

