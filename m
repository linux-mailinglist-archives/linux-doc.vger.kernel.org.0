Return-Path: <linux-doc+bounces-20569-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F243692F2B3
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jul 2024 01:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91611B21B20
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 23:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E349816D4F3;
	Thu, 11 Jul 2024 23:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IB6uPHY9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61D8158DD4
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720741286; cv=none; b=LMNx/cMx3PWebFeJSscsxm+YAIxEjLCCbA6HKSE99ng9uQ7QdNXbtUhBY2bHSILMIcWKsBI7LfyNSYVCAxw3St5UVxH9ZHIIldxNLPQeiGaXXhQ8JzlJomJBwU7RNfif6GJgACKW0Xfuc4wTbF7V0ClxyXfZ39wUFE4b9lWx3js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720741286; c=relaxed/simple;
	bh=ZdwiAaNOEcsQ1iawVne670iRqDXG2wC8RCl2vG0f8s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqK2HzdtjgESvHoqeG9ucX86D4sF6r2MUAsb0phNdc2iKG2vviu+6z3zS9cYbQA6axtI+CQHpCuf4oyiLd9o9eupo+pcAfm3b9hIW/I5s6jBUl8Ys+AP+ey4ThIxs4LlDmIPBfs74EDbZcjw+ybOb86+elrmzOilrj3tDsqrsxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IB6uPHY9; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7527afa23cso185687566b.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 16:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720741283; x=1721346083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfuHNi5R9KMj0UxFnDquGekhSFTlViomrJL3yZ6eHpI=;
        b=IB6uPHY9b3oD5sCw2UHcPFkbTlKmi4/7xOElYQ8683WO3DaPYW2eSl7j0xLwm7Rt8V
         MQxnsZXhMYO0X42+P9zjHyFXVBvCNlFybjPHGijzQb3dpwPqx1/fISZQyeT9ROE1t7DN
         cly7UhAEE2irDxu9+vEfzlhFvQHt8euTxRCKE/VS1MDcieh35mL9ph5m1rHp4O3uyaIg
         UdQ33LbDBZZQg4GosPxXYQ9s2WTZgj2myGFFEqBvA7PTpF8tpT2fLyZQq+3yl/CcSUOK
         64jzmYVsKdcFyxYm83i54rUY2z2NjLeOsGbEW8ZHhhq8Ufnm+F1gcy3s41I1andsrITP
         Ja7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720741283; x=1721346083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfuHNi5R9KMj0UxFnDquGekhSFTlViomrJL3yZ6eHpI=;
        b=mUSuP/jbjDD35dbuDZq+pr+185uv60XNQtzsX8mWdEswLA9TPszsb2/cFveEoqjIvx
         H2qGOOt+mrz7yfSCvC2tzF7b5Mk468YTvfrlo3q2YCaxlTlyGRDcdIVwCQyBNlmfEvGH
         ehHtoJ1cWUj7dxAKx1mmuy4Wygc21SH9vL0UB6bhKAdyTWD+AajLa7ewhXpv3KwyaiO7
         mHF0GIc8E+MTRKhIq3SRStIkfSBhb4UI6J6p62Y7WZ9jyLnEwaK2ae0Rox7xyVBW7OT7
         SyGyT7aq8h51tQeAAABftiOFy4m8EQfjjrQBX58dBfgh0Ew8G18CAS51oxURVIInESMa
         tJIA==
X-Forwarded-Encrypted: i=1; AJvYcCWyyarmvyZHuoQ/ijmVw1JW6mvBv7XpHnT/0BdVehTSSKUV5WJR4/oLLXI5u5RFHw4O11z3v0Wl3vJ6L+iU7BvRjccW6+wKzi1X
X-Gm-Message-State: AOJu0YwlsfUq6PBr7joinqA7mEXG17vFy9qkLzkBborMdqVoaBNo+5FE
	DCsX1Bjdi8TcZ3bCbIjKIwPfEECiwRFmQ+D1MqS30D3WlaSbjh9Rc2kgV7137fTLC696fzoKx4i
	e8GU16n4Fvw4plD+GHsjOT3PGxamDtfPfffUN
X-Google-Smtp-Source: AGHT+IFND8OJ4Hc6Luty4DujmFBUJFFOnOhkbf4bXVfGHjmUWdjIMHEqzQfgESAoCPprxuNTe9hiEGwJ28pFonfz9vc=
X-Received: by 2002:a17:907:d93:b0:a75:20f7:2c71 with SMTP id
 a640c23a62f3a-a780b6ff667mr1002583166b.38.1720741282837; Thu, 11 Jul 2024
 16:41:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com> <20240710234222.2333120-5-jthoughton@google.com>
In-Reply-To: <20240710234222.2333120-5-jthoughton@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 11 Jul 2024 16:40:54 -0700
Message-ID: <CALzav=dfpy=BSZD4hOVMFSrfxgc5OhDjZHek7CzMDYRqTBALwg@mail.gmail.com>
Subject: Re: [RFC PATCH 04/18] KVM: Fail __gfn_to_hva_many for userfault gfns.
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Peter Xu <peterx@redhat.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 4:42=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
>
> Add gfn_has_userfault() that (1) checks that KVM Userfault is enabled,
> and (2) that our particular gfn is a userfault gfn.
>
> Check gfn_has_userfault() as part of __gfn_to_hva_many to prevent
> gfn->hva translations for userfault gfns.
>
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>  include/linux/kvm_host.h | 12 ++++++++++++
>  virt/kvm/kvm_main.c      |  3 +++
>  2 files changed, 15 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index c1eb59a3141b..4cca896fb44a 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -140,6 +140,7 @@ static inline bool is_noslot_pfn(kvm_pfn_t pfn)
>
>  #define KVM_HVA_ERR_BAD                (PAGE_OFFSET)
>  #define KVM_HVA_ERR_RO_BAD     (PAGE_OFFSET + PAGE_SIZE)
> +#define KVM_HVA_ERR_USERFAULT  (PAGE_OFFSET + 2 * PAGE_SIZE)
>
>  static inline bool kvm_is_error_hva(unsigned long addr)
>  {
> @@ -2493,4 +2494,15 @@ static inline bool kvm_userfault_enabled(struct kv=
m *kvm)
>  #endif
>  }
>
> +static inline bool gfn_has_userfault(struct kvm *kvm, gfn_t gfn)
> +{
> +#ifdef CONFIG_KVM_USERFAULT
> +       return kvm_userfault_enabled(kvm) &&
> +               (kvm_get_memory_attributes(kvm, gfn) &
> +                KVM_MEMORY_ATTRIBUTE_USERFAULT);
> +#else
> +       return false;
> +#endif
> +}
> +
>  #endif
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index ffa452a13672..758deb90a050 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2686,6 +2686,9 @@ static unsigned long __gfn_to_hva_many(const struct=
 kvm_memory_slot *slot, gfn_t
>         if (memslot_is_readonly(slot) && write)
>                 return KVM_HVA_ERR_RO_BAD;
>
> +       if (gfn_has_userfault(slot->kvm, gfn))
> +               return KVM_HVA_ERR_USERFAULT;

You missed the "many" part :)

Speaking of, to do this you'll need to convert all callers that pass
in nr_pages to actually set the number of pages they need. Today KVM
just checks from gfn to the end of the slot and returns the total
number of pages via nr_pages. i.e. We could end up checking (and async
fetching) the entire slot!

> +
>         if (nr_pages)
>                 *nr_pages =3D slot->npages - (gfn - slot->base_gfn);
>
> --
> 2.45.2.993.g49e7a77208-goog
>

