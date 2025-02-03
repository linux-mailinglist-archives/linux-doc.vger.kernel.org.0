Return-Path: <linux-doc+bounces-36706-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84765A26622
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 22:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E9317A1E12
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 21:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644F4210F45;
	Mon,  3 Feb 2025 21:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="ufDT/C82"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788D5210F42
	for <linux-doc@vger.kernel.org>; Mon,  3 Feb 2025 21:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738619636; cv=none; b=cHxV4KNDO+Ye3g0b+CZsbctTXMevDvqpNa/eGJEmlyTFPqxETUbiSN1HDGLweumSQd10WS/vcrfQfCUfQ7TkaYUt4aqBt9gDqkLRAGEnQjHn/iB04DXVKGVE6kx11UQW0VoESsKat17CDW4gwUy4LcLiIVkztKH/vsAURz/358E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738619636; c=relaxed/simple;
	bh=0FzYCHZ7yJs7yVFDTq1TgOBp7IOxiDA+4xJIB14C450=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HN4+55T5TDgk/7hU+ewXIVcWew+6FLiWYsjBQb0DT1LBX6NrNHPcUDOsVJyui0mMxGMLK2i7rb6TyzAmxub0BVAGg4M/yX14JlYtbGeIUvX0cZs3UC7WOanICE6Iq4bEz4OMi0K7s8HxCXRd5dwg2E1AzSQ6BJKF2higVxpUCnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=ufDT/C82; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436281c8a38so35067945e9.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2025 13:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1738619633; x=1739224433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuP2pJU8bBZXahLySdNlt2shroJTENQiUQtUnqJ4MBc=;
        b=ufDT/C82fGh8vsGSX1/L1CTS1eslXPiRqtHp+U4gNjbMyWTk9HI+MJ+fJD38kR9q+N
         Ll99d1KeuMfczy5sLpZ6g/Sa8FkEY1xx2DIQU59R6f4yMtElbYn44UepSnVlDjVfX2Br
         eid2/oE8ub6QFona2oyLVsw+jgEUniXrmtVkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738619633; x=1739224433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuP2pJU8bBZXahLySdNlt2shroJTENQiUQtUnqJ4MBc=;
        b=Gp6zReEbVWA7TBmoIOQwwN4RCKjptTPrVvbrfkmFRNm6bh7JyftVW7AbVkcOJaLcvC
         GVRvPKUmU3SoyCidSGG5UZi5iN1XL2+zbkKZ61r8xqjxC/mDo9ngqIa+TPjLTa9aEDoO
         jS5u4c6QrMudxjQQgy5/7VQnbiIxwl9H6UWz84Y4MZMXPwx6qibjRBXsjRx1NXMJOAHI
         hTMEJPMdjrWa3EMd40PS4a9SAMxqH+857UCQluY+IlARiqQ1AedqYKhh5z6lwTkcIMyu
         foSlP/gYbPcYqlgiQrYUdDLkQwIBn4AgEH5z5NEGq+5J914zbIoSdFdRxG+Ei7my37cC
         c5qw==
X-Forwarded-Encrypted: i=1; AJvYcCUxRoHe01HEktqS0Hr+f12/KjJUufSnUjuOIoEkqXxSpodrR7KwLE4leIzeuQDi4L0guj0CqqKRt+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy8ZpDEFiha/jB0GKtK5qUyfB+kjNYwJyh+kxyve8JGvqWPFIS
	S+PyDvA6u6pggCzg8EN56npffw9T86zqaiMqRLpLvbQDkeEK+GjGvWNMJ/V4eB6G/bo/VVLf40I
	EXchXABDkpaOiDAkCDainEwa0QNRUWWNkFb8LRA==
X-Gm-Gg: ASbGncs59pjz7bo1PJ4GbOCa1YMDCyoCFqLTl5cv7+jPNYIB5EzlQ8z/oo+6c2BcMFZ
	6/YVb3GcgHrzd4Ki2jM/VHJJ+i9r08vhRZ+a6tNDYpYxZAuJ++a/D5+rJAvomNIaLz5iBpxZCB/
	Q=
X-Google-Smtp-Source: AGHT+IFTT878gvRp7ddeyuzEmi6d3nVR7yt9pGw+C9SikTc7j0JfpLe79f9EX7kOwWILUEP0xX1xpi49VVK/vAEm5uc=
X-Received: by 2002:a05:6000:1445:b0:385:f573:1f78 with SMTP id
 ffacd0b85a97d-38c519744e1mr18589075f8f.24.1738619632538; Mon, 03 Feb 2025
 13:53:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131220432.17717-1-dakr@kernel.org> <20250203202410.GA3936980@joelbox2>
 <34d7a6af-5974-482e-9f70-3f92a823bd96@nvidia.com>
In-Reply-To: <34d7a6af-5974-482e-9f70-3f92a823bd96@nvidia.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Mon, 3 Feb 2025 16:53:42 -0500
X-Gm-Features: AWEUYZl0JrUywsCdCfm9saD5c0m9P2P4l5rddBjbWCr91MZ6RR70sF-I7X6sYiw
Message-ID: <CAEXW_YRpjzGo2AJLFb_eAyi03pzSVGKJywxzQNatGnQTF4me8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com, 
	cjia@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	joelagnelf@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:00=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
[..]
>
> >> +        ()
> >> +    )]
> >> +);
> >> +
> >> +impl pci::Driver for NovaCore {
> >> +    type IdInfo =3D ();
> >> +    const ID_TABLE: pci::IdTable<Self::IdInfo> =3D &PCI_TABLE;
> >> +
> >> +    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<=
Pin<KBox<Self>>> {
> >> +        dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
> >> +
> >> +        pdev.enable_device_mem()?;
> >> +        pdev.set_master();
> >> +
> >> +        let bar =3D pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("n=
ova-core"))?;
> >> +
> >> +        let this =3D KBox::pin_init(
> >> +            try_pin_init!(Self {
> >> +                gpu <- Gpu::new(pdev, bar)?,
>
> Here. Try to construct a Gpu, which tries to construct a GpuSpec, which
> fails out if Chipset is not listed, or if CardType (which should be
> renamed to Architecture) is not listed.
>
> And only Turing+ GPUs are listed. Turing is the first GPU that has a
> GSP unit.
>
> By the way, I have loaded this on a system with a Kepler GPU (pre-Turing)=
,
> and an Ampere GPU, and traced through actually loading NovaCore, and it
> behaves as described above.


Ah that makes sense, Thanks John!

 - Joel

