Return-Path: <linux-doc+bounces-55425-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95408B1E9C1
	for <lists+linux-doc@lfdr.de>; Fri,  8 Aug 2025 16:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A628817C866
	for <lists+linux-doc@lfdr.de>; Fri,  8 Aug 2025 14:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D6127B4EE;
	Fri,  8 Aug 2025 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="fYzyli9L"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD3C279355
	for <linux-doc@vger.kernel.org>; Fri,  8 Aug 2025 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754661648; cv=none; b=F4AFeGLDXLuEOZnziHqZTCJ4vd9wryIDBsAjxb9ca9CpY8IPqnsxE1eAfK3hExHx4Gy9Fez+rULhyo9KUNN++NTY3GOJHG3IgzguzmiQXvMlRgSHMBGQbAh/mRxETPbGLbOSVFgtDzCo7mh7O2osWhdet468v/tZLZs1ORyYLFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754661648; c=relaxed/simple;
	bh=x4ha9INZKS3qtde5fpadJaWJod/g+Zi1d0xN7YAlf3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4JiUnOV2H42Hf5pEfV/5ITmr7uesubG1izYABdXHCtTQ81789P9vdIhWhM+vF4btxhCzxx6Iub5TLivab5B8xePg8WmdEDzTWbUjA+CMYLxMYdm18ijzu7IhWu6LDcqP1tPxL2R0MCY2BVRV4n/7ku3POpcNJfp6bQxR7YVA4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=fYzyli9L; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b07275e0a4so25412221cf.3
        for <linux-doc@vger.kernel.org>; Fri, 08 Aug 2025 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754661645; x=1755266445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqINGqOAKkihtWhqv8aP2ZlDWCyF3eZIl3dlPcJlrEs=;
        b=fYzyli9LeJhZI3OL2lOmQmUB/2hupW00LWygDlRVwGMxBR6yau6SZv2gOz0tzUT4ea
         snHxd+H9EFl1H+/X1Kuw/Ay6esXEphiIW0Wea0tYgDRhnyH80AU1JlRrdlnyQFGH5nHQ
         qBXOAOTE7nE66vqCtARk4xwfHgLypH8vftFTfMPNHT+4rD0HNyW2CCJB7skOr4/pZtNV
         r5h6moz4C1iZV/8WF/H2qJoMGWJHm10+N2EdNBQ2C5BLDovti2qlpQwWWf4LSWkFatbg
         CktxOs8XWJC4y8m4FEB8cFeqpPOvpFk4O7UwXT6V0ihyQxWLHFJ25SXcpb9rfinl3Gs7
         AMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754661645; x=1755266445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqINGqOAKkihtWhqv8aP2ZlDWCyF3eZIl3dlPcJlrEs=;
        b=r4TaHtWzVfGCFYhoupTEvOcqKBm09+nMsRpHHtJNPGAgQZoKIyCmUswrvYXV0brOIU
         diOAotqxWwy2BhZU1eHY9l07FxQjVMFQLjtSSvi5rSshnG5aRxGLixWwUn/MyeYE7ITA
         y10BsJ5soybzGsEcMT21AB7Twem0SDbyX8cyVuKolxc9N+8nznte72T2NZTF9uHeuRzd
         yqcJ+3axsQwCUa1K3auIamRHOH3harRsLitdOSrhWWCENb7uAjdbYHT0jZ6FlNaAQ6Gx
         HOw8BkNkPDIru960Ylh/VdXIO8pQaILJ/CT30SgnmZrY/88OQTnfwYPjPR5AfC2BJf/Z
         pz8w==
X-Forwarded-Encrypted: i=1; AJvYcCX1dv4C2ksCDet+F2hzHxpNFW/33SF5uxHHFS6ViEWAqv9gZWGeETLo2bhidIeNMkmwWQMVEZBIhfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzISwVnl6y9NPeFB8Lu1jQPz3etIVdRhmwYkIZWF16LefvTYWYY
	zx3YPi2V5vayiFXLbWLFx8tpKm4eh6jII3uUEP7TDPRwIwEXsRnYYF3asimUbYhdGbPMh9Tp1IF
	zmI9NLRuHGaeCKtrT/8uEsdTkfESTyXuvHiOc5Le+Qw==
X-Gm-Gg: ASbGncv4qFW8q74ORJr9nw1WrdfU07OOPQX9aV8s+UXgRFf/x9GPupnv8k2xpcxxIY+
	DAvaKDwRg7NYgdPLIYhFzbCK3b2nViBMPlBQy0eyFlmBisgEpaS7K4hKguwHHQXDEzkgC8yHw4G
	PkVBDlXhU2JCTDr4fExKvgk+64/wbPIjK+2F0+4ommawgQvkXhRL36ubGG5JjJbmU1j+l08g/Oq
	sNK
X-Google-Smtp-Source: AGHT+IGU7X5qeX8OS2DQuYKdpYSGfIFno/a95GYTX1d6NB06BqBHy2416czan27fZPJSukzaA24gTw9e0PS+96Ajhto=
X-Received: by 2002:a05:622a:5a0f:b0:4af:4bac:e523 with SMTP id
 d75a77b69052e-4b0aed0f0e9mr39963141cf.8.1754661645094; Fri, 08 Aug 2025
 07:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-2-pasha.tatashin@soleen.com> <mafs0o6sqavkx.fsf@kernel.org>
 <mafs0bjoqav4j.fsf@kernel.org>
In-Reply-To: <mafs0bjoqav4j.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 8 Aug 2025 14:00:08 +0000
X-Gm-Features: Ac12FXyA0-d-njVDnQIR5bUTLVyM1KEOMfZexHnLlS_vPOyE1wA5_qbuL5SMqTM
Message-ID: <CA+CK2bBoMNEfyFKgvKR0JvECpZrGKP1mEbC_fo8SqystEBAQUA@mail.gmail.com>
Subject: Re: [PATCH v3 01/30] kho: init new_physxa->phys_bits to fix lockdep
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 11:52=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Fri, Aug 08 2025, Pratyush Yadav wrote:
> [...]
> >> @@ -144,14 +144,35 @@ static int __kho_preserve_order(struct kho_mem_t=
rack *track, unsigned long pfn,
> >>                              unsigned int order)
> >>  {
> >>      struct kho_mem_phys_bits *bits;
> >> -    struct kho_mem_phys *physxa;
> >> +    struct kho_mem_phys *physxa, *new_physxa;
> >>      const unsigned long pfn_high =3D pfn >> order;
> >>
> >>      might_sleep();
> >>
> >> -    physxa =3D xa_load_or_alloc(&track->orders, order, sizeof(*physxa=
));
> >> -    if (IS_ERR(physxa))
> >> -            return PTR_ERR(physxa);
> >> +    physxa =3D xa_load(&track->orders, order);
> >> +    if (!physxa) {
> >> +            new_physxa =3D kzalloc(sizeof(*physxa), GFP_KERNEL);
> >> +            if (!new_physxa)
> >> +                    return -ENOMEM;
> >> +
> >> +            xa_init(&new_physxa->phys_bits);
> >> +            physxa =3D xa_cmpxchg(&track->orders, order, NULL, new_ph=
ysxa,
> >> +                                GFP_KERNEL);
> >> +            if (xa_is_err(physxa)) {
> >> +                    int err =3D xa_err(physxa);
> >> +
> >> +                    xa_destroy(&new_physxa->phys_bits);
> >> +                    kfree(new_physxa);
> >> +
> >> +                    return err;
> >> +            }
> >> +            if (physxa) {
> >> +                    xa_destroy(&new_physxa->phys_bits);
> >> +                    kfree(new_physxa);
> >> +            } else {
> >> +                    physxa =3D new_physxa;
> >> +            }
> >
> > I suppose this could be simplified a bit to:
> >
> >       err =3D xa_err(physxa);
> >         if (err || physxa) {
> >               xa_destroy(&new_physxa->phys_bits);
> >                 kfree(new_physxa);
> >
> >               if (err)
> >                       return err;
> >       } else {
> >               physxa =3D new_physxa;
> >       }
>
> My email client completely messed the whitespace up so this is a bit
> unreadable. Here is what I meant:
>
>         err =3D xa_err(physxa);
>         if (err || physxa) {
>                 xa_destroy(&new_physxa->phys_bits);
>                 kfree(new_physxa);
>
>                 if (err)
>                         return err;
>         } else {
>                 physxa =3D new_physxa;
>         }
>
> [...]

Thanks Pratyush, I will make this simplification change if Andrew does
not take this patch in before the next revision.

Pasha

