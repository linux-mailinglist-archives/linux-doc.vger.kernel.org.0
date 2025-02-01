Return-Path: <linux-doc+bounces-36572-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72173A247AE
	for <lists+linux-doc@lfdr.de>; Sat,  1 Feb 2025 09:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 378BD3A843B
	for <lists+linux-doc@lfdr.de>; Sat,  1 Feb 2025 08:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7A613AA53;
	Sat,  1 Feb 2025 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YXzqRUvM"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645C425A621
	for <linux-doc@vger.kernel.org>; Sat,  1 Feb 2025 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738397737; cv=none; b=eQUDppWr+RzqfOQzVmi9OZhggLFn1Z2tkjBUKxaZLajwKqww3CoDrt2tuJeEQGi8fuQqkvSMcIknlP8Gb7BHi/Pj1S9Csd83W0g/E98tUyvPLbVXU6xlkDvq0QRUoLGIuTy6w/VzGVmtDebNp6C71qS+kq9k02/7QODNCJMwXPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738397737; c=relaxed/simple;
	bh=jo9ZKK3HjsZQNRNUO5sqj6ic+di0NLphdzUICVlb4YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RlJm8SkBNRW9BJKRCR4Hkr0C2SZ1SHRzVI9rY+mmn3TejTmjTkk354aArNRDvli3D24/pJJcxIjHSsLdqbd4AZCIFhJF+THi16Sqrsb9iIp0qyQRwMRD3XSZtikruqLjDGNaLUAZh1P0b5BFaepC8WYHaaUXwWS0vfoUBASwQPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YXzqRUvM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738397734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9PTNq5NA6doxz/Sut4LN71qEqjdjP05Vfd5MRiz5lI=;
	b=YXzqRUvMI+jB8I4AWBulKg4KG0hLtW9VdMl0JU5QmC2THHEyFQ1kwK9GlgMfhCnrZEb3tg
	fDC5TOXA42cCesacZmI/MpKlGHbD6R7RuwsAFPtQrheR2lCWE+GHJLdYqapP7a9vSqZ8aV
	3OPnBLd+GSuv3VCRi6XXRrJIg6ATaI4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-ZlWHM1zdM7e-yP3a9gDYKw-1; Sat, 01 Feb 2025 03:15:31 -0500
X-MC-Unique: ZlWHM1zdM7e-yP3a9gDYKw-1
X-Mimecast-MFC-AGG-ID: ZlWHM1zdM7e-yP3a9gDYKw
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ab6d6a9bda9so292282766b.2
        for <linux-doc@vger.kernel.org>; Sat, 01 Feb 2025 00:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738397726; x=1739002526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9PTNq5NA6doxz/Sut4LN71qEqjdjP05Vfd5MRiz5lI=;
        b=cG/ivAn5zIvppOyMN7RRYpAAtGx/dw0ZYdD0GLT/HcNIMEMP1HI0IC4bMObnx1+U7O
         PCTrFxK9/AyL3L05FdGpF3cZE9zbA/WJzde4cHATAyCFn1y2DiCAILReyGZYUF2HPedj
         7HCJBCaexZvsDSHey9bbaY82vkQBlEUO9DH3dJxVjXNvEMJJ3B1XS2kQNGMvauCUYOqP
         qkl3SEPWCREwcg5eia9cFgxFbEDKLijHtDiVNSSen4erVh9CjeswVUGY4p9SbLlrUdQ+
         K8a+PtyHvNFy9LklA9ZT9CevbWl1ueOTsf7kIaiWQWABhA3nqm08pijXlxxc4oVfOMs3
         LPAw==
X-Forwarded-Encrypted: i=1; AJvYcCXaEChpYztf4mb+AmsDEaVYtWVboneI8TWn2CYMTBqGMApN+3deZ4goUwXEwSA+uY6M5/HIy7sE1Pk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxev/pDyLQLPcMgq55MH54WMbJ5GsdO5O0PRyb/mNM5lx6dIFcR
	cAZwkaHietQwyXJNVPQ+sQr0csPbMhpEtbfaREQ0/eZmca1UD0/YAnnyypoQ8CXuniQ7Fh4TwZu
	/Qib/3ANQOmwS/W7mCVjRXck47ya9nIBrXxlbf05c2kMGJpC1dzisUms2xt37AyA6OxhyY6LGGx
	v0bc9tR8nIyoPxEVW5OAp8GUJ+gFwjYOAM
X-Gm-Gg: ASbGncuiu9/TAf/16Q16qDqHcZiWFd/se6LHo6zlkKSBRI0IzzB3rL5I17tYmu2MJvx
	jhe1574gzdytQPaOU/wH/FHnaK0okjo/KXLBBd1kyYxAd9fzMbPQD/8w7L2zM9uc=
X-Received: by 2002:a17:907:c28:b0:ab3:7720:d87c with SMTP id a640c23a62f3a-ab6cfdbddafmr1705943466b.35.1738397725489;
        Sat, 01 Feb 2025 00:15:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvw59MvsCR/saef9kmafJdPRgmO86SyAS4QEe5KJPzMmgsSd3Xl41TCfNYNWS4+X/yKsN7a5K9KDIS7mQAICY=
X-Received: by 2002:a17:907:c28:b0:ab3:7720:d87c with SMTP id
 a640c23a62f3a-ab6cfdbddafmr1705938266b.35.1738397725010; Sat, 01 Feb 2025
 00:15:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131220432.17717-1-dakr@kernel.org>
In-Reply-To: <20250131220432.17717-1-dakr@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 1 Feb 2025 09:14:48 +0100
X-Gm-Features: AWEUYZmnhQhtBuN2Vrv0jf6GxYbPVi3S-OxOkPSFYDEKU5w3tNCocFsamzrLM50
Message-ID: <CACO55ttSTGTEV7_OTAGXft0JKV7o2DzSYX89ZWKS_+mZRgjEKg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com, 
	cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 11:04=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> Add the initial nova-core driver stub.
>
> nova-core is intended to serve as a common base for nova-drm (the
> corresponding DRM driver) and the vGPU manager VFIO driver, serving as a
> hard- and firmware abstraction layer for GSP-based NVIDIA GPUs.
>
> The Nova project, including nova-core and nova-drm, in the long term,
> is intended to serve as the successor of Nouveau for all GSP-based GPUs.
>
> The motivation for both, starting a successor project for Nouveau and
> doing so using the Rust programming language, is documented in detail
> through a previous post on the mailing list [1], an LWN article [2] and a
> talk from LPC '24.
>
> In order to avoid the chicken and egg problem to require a user to
> upstream Rust abstractions, but at the same time require the Rust
> abstractions to implement the driver, nova-core kicks off as a driver
> stub and is subsequently developed upstream.
>
> Link: https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u=
 [1]
> Link: https://lwn.net/Articles/990736/ [2]
> Link: https://youtu.be/3Igmx28B3BQ?si=3DsBdSEer4tAPKGpOs [3]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS                        |  10 ++
>  drivers/gpu/Makefile               |   1 +
>  drivers/gpu/nova-core/Kconfig      |  13 +++
>  drivers/gpu/nova-core/Makefile     |   3 +
>  drivers/gpu/nova-core/driver.rs    |  47 ++++++++
>  drivers/gpu/nova-core/gpu.rs       | 171 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |  14 +++
>  drivers/video/Kconfig              |   1 +
>  8 files changed, 260 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/Kconfig
>  create mode 100644 drivers/gpu/nova-core/Makefile
>  create mode 100644 drivers/gpu/nova-core/driver.rs
>  create mode 100644 drivers/gpu/nova-core/gpu.rs
>  create mode 100644 drivers/gpu/nova-core/nova_core.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1086e53a317..f7ddca7de0ef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7446,6 +7446,16 @@ T:       git https://gitlab.freedesktop.org/drm/no=
uveau.git
>  F:     drivers/gpu/drm/nouveau/
>  F:     include/uapi/drm/nouveau_drm.h
>
> +CORE DRIVER FOR NVIDIA GPUS [RUST]
> +M:     Danilo Krummrich <dakr@kernel.org>
> +L:     nouveau@lists.freedesktop.org
> +S:     Supported
> +Q:     https://patchwork.freedesktop.org/project/nouveau/
> +B:     https://gitlab.freedesktop.org/drm/nova/-/issues
> +C:     irc://irc.oftc.net/nouveau
> +T:     git https://gitlab.freedesktop.org/drm/nova.git nova-next
> +F:     drivers/gpu/nova-core/
> +
>  DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
>  M:     Stefan Mavrodiev <stefan@olimex.com>
>  S:     Maintained
> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> index 8997f0096545..36a54d456630 100644
> --- a/drivers/gpu/Makefile
> +++ b/drivers/gpu/Makefile
> @@ -5,3 +5,4 @@
>  obj-y                  +=3D host1x/ drm/ vga/
>  obj-$(CONFIG_IMX_IPUV3_CORE)   +=3D ipu-v3/
>  obj-$(CONFIG_TRACE_GPU_MEM)            +=3D trace/
> +obj-$(CONFIG_NOVA_CORE)                +=3D nova-core/
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfi=
g
> new file mode 100644
> index 000000000000..33ac937b244a
> --- /dev/null
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -0,0 +1,13 @@
> +config NOVA_CORE
> +       tristate "Nova Core GPU driver"
> +       depends on PCI
> +       depends on RUST
> +       depends on RUST_FW_LOADER_ABSTRACTIONS
> +       default n
> +       help
> +         Choose this if you want to build the Nova Core driver for Nvidi=
a
> +         GSP-based GPUs.
> +
> +         This driver is work in progress and may not be functional.
> +
> +         If M is selected, the module will be called nova-core.
> diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makef=
ile
> new file mode 100644
> index 000000000000..2d78c50126e1
> --- /dev/null
> +++ b/drivers/gpu/nova-core/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_NOVA_CORE) +=3D nova_core.o
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> new file mode 100644
> index 000000000000..2a2aa9b0630b
> --- /dev/null
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{bindings, c_str, pci, prelude::*};
> +
> +use crate::gpu::Gpu;
> +
> +#[pin_data]
> +pub(crate) struct NovaCore {
> +    #[pin]
> +    pub(crate) gpu: Gpu,
> +}
> +
> +const BAR0_SIZE: usize =3D 8;
> +pub(crate) type Bar0 =3D pci::Bar<BAR0_SIZE>;
> +
> +kernel::pci_device_table!(
> +    PCI_TABLE,
> +    MODULE_PCI_TABLE,
> +    <NovaCore as pci::Driver>::IdInfo,
> +    [(
> +        pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_NVIDIA, bindings:=
:PCI_ANY_ID as _),
> +        ()
> +    )]
> +);
> +
> +impl pci::Driver for NovaCore {
> +    type IdInfo =3D ();
> +    const ID_TABLE: pci::IdTable<Self::IdInfo> =3D &PCI_TABLE;
> +
> +    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin=
<KBox<Self>>> {
> +        dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
> +
> +        pdev.enable_device_mem()?;
> +        pdev.set_master();
> +
> +        let bar =3D pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova=
-core"))?;

I'm curious about the c_str! macro here. Since rust 1.78 one can do
c"nova-core" to get a &CStr, is this not available in the r4l project
yet or other reasons why this can't be used? Might make sense to clean
it up kernel wide (outside this patch set) if it's guaranteed to be
available.

> +
> +        let this =3D KBox::pin_init(
> +            try_pin_init!(Self {
> +                gpu <- Gpu::new(pdev, bar)?,
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        Ok(this)
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> new file mode 100644
> index 000000000000..cf62390e72eb
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{
> +    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude:=
:*, str::CString,
> +};
> +
> +use crate::driver::Bar0;
> +use core::fmt::Debug;
> +
> +/// Enum representation of the GPU chipset.
> +#[derive(Debug)]
> +pub(crate) enum Chipset {
> +    TU102 =3D 0x162,
> +    TU104 =3D 0x164,
> +    TU106 =3D 0x166,
> +    TU117 =3D 0x167,
> +    TU116 =3D 0x168,
> +    GA102 =3D 0x172,
> +    GA103 =3D 0x173,
> +    GA104 =3D 0x174,
> +    GA106 =3D 0x176,
> +    GA107 =3D 0x177,
> +    AD102 =3D 0x192,
> +    AD103 =3D 0x193,
> +    AD104 =3D 0x194,
> +    AD106 =3D 0x196,
> +    AD107 =3D 0x197,
> +}
> +
> +/// Enum representation of the GPU generation.
> +#[derive(Debug)]
> +pub(crate) enum CardType {
> +    /// Turing
> +    TU100 =3D 0x160,
> +    /// Ampere
> +    GA100 =3D 0x170,
> +    /// Ada Lovelace
> +    AD100 =3D 0x190,
> +}
> +
> +/// Structure holding the metadata of the GPU.
> +#[allow(dead_code)]
> +pub(crate) struct GpuSpec {
> +    /// Contents of the boot0 register.
> +    boot0: u64,
> +    card_type: CardType,
> +    chipset: Chipset,
> +    /// The revision of the chipset.
> +    chiprev: u8,
> +}
> +
> +/// Structure encapsulating the firmware blobs required for the GPU to o=
perate.
> +#[allow(dead_code)]
> +pub(crate) struct Firmware {
> +    booter_load: firmware::Firmware,
> +    booter_unload: firmware::Firmware,
> +    gsp: firmware::Firmware,
> +}
> +
> +/// Structure holding the resources required to operate the GPU.
> +#[allow(dead_code)]
> +#[pin_data]
> +pub(crate) struct Gpu {
> +    spec: GpuSpec,
> +    /// MMIO mapping of PCI BAR 0
> +    bar: Devres<Bar0>,
> +    fw: Firmware,
> +}
> +
> +// TODO replace with something like derive(FromPrimitive)
> +impl Chipset {
> +    fn from_u32(value: u32) -> Option<Chipset> {
> +        match value {
> +            0x162 =3D> Some(Chipset::TU102),
> +            0x164 =3D> Some(Chipset::TU104),
> +            0x166 =3D> Some(Chipset::TU106),
> +            0x167 =3D> Some(Chipset::TU117),
> +            0x168 =3D> Some(Chipset::TU116),
> +            0x172 =3D> Some(Chipset::GA102),
> +            0x173 =3D> Some(Chipset::GA103),
> +            0x174 =3D> Some(Chipset::GA104),
> +            0x176 =3D> Some(Chipset::GA106),
> +            0x177 =3D> Some(Chipset::GA107),
> +            0x192 =3D> Some(Chipset::AD102),
> +            0x193 =3D> Some(Chipset::AD103),
> +            0x194 =3D> Some(Chipset::AD104),
> +            0x196 =3D> Some(Chipset::AD106),
> +            0x197 =3D> Some(Chipset::AD107),
> +            _ =3D> None,
> +        }
> +    }
> +}
> +
> +// TODO replace with something like derive(FromPrimitive)
> +impl CardType {
> +    fn from_u32(value: u32) -> Option<CardType> {
> +        match value {
> +            0x160 =3D> Some(CardType::TU100),
> +            0x170 =3D> Some(CardType::GA100),
> +            0x190 =3D> Some(CardType::AD100),
> +            _ =3D> None,
> +        }
> +    }
> +}
> +
> +impl GpuSpec {
> +    fn new(bar: &Devres<Bar0>) -> Result<GpuSpec> {
> +        let bar =3D bar.try_access().ok_or(ENXIO)?;
> +        let boot0 =3D u64::from_le(bar.readq(0));
> +        let chip =3D ((boot0 & 0x1ff00000) >> 20) as u32;
> +
> +        if boot0 & 0x1f000000 =3D=3D 0 {
> +            return Err(ENODEV);
> +        }
> +
> +        let Some(chipset) =3D Chipset::from_u32(chip) else {
> +            return Err(ENODEV);
> +        };
> +
> +        let Some(card_type) =3D CardType::from_u32(chip & 0x1f0) else {
> +            return Err(ENODEV);
> +        };
> +
> +        Ok(Self {
> +            boot0,
> +            card_type,
> +            chipset,
> +            chiprev: (boot0 & 0xff) as u8,
> +        })
> +    }
> +}
> +
> +impl Firmware {
> +    fn new(dev: &device::Device, spec: &GpuSpec, ver: &str) -> Result<Fi=
rmware> {
> +        let mut chip_name =3D CString::try_from_fmt(fmt!("{:?}", spec.ch=
ipset))?;
> +        chip_name.make_ascii_lowercase();
> +
> +        let fw_booter_load_path =3D
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_load-{}.bin=
", &*chip_name, ver))?;
> +        let fw_booter_unload_path =3D
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_unload-{}.b=
in", &*chip_name, ver))?;
> +        let fw_gsp_path =3D
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/gsp-{}.bin", &*chi=
p_name, ver))?;
> +
> +        let booter_load =3D firmware::Firmware::request(&fw_booter_load_=
path, dev)?;
> +        let booter_unload =3D firmware::Firmware::request(&fw_booter_unl=
oad_path, dev)?;
> +        let gsp =3D firmware::Firmware::request(&fw_gsp_path, dev)?;
> +
> +        Ok(Firmware {
> +            booter_load,
> +            booter_unload,
> +            gsp,
> +        })
> +    }
> +}
> +
> +impl Gpu {
> +    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<i=
mpl PinInit<Self>> {
> +        let spec =3D GpuSpec::new(&bar)?;
> +        let fw =3D Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
> +
> +        dev_info!(
> +            pdev.as_ref(),
> +            "NVIDIA {:?} ({:#x})",
> +            spec.chipset,
> +            spec.boot0
> +        );
> +
> +        Ok(pin_init!(Self { spec, bar, fw }))
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> new file mode 100644
> index 000000000000..b130d9ca6a0f
> --- /dev/null
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Nova Core GPU Driver
> +
> +mod driver;
> +mod gpu;
> +
> +kernel::module_pci_driver! {
> +    type: driver::NovaCore,
> +    name: "NovaCore",
> +    author: "Danilo Krummrich",
> +    description: "Nova Core GPU driver",
> +    license: "GPL v2",
> +}
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 44c9ef1435a2..5df981920a94 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -39,6 +39,7 @@ source "drivers/gpu/vga/Kconfig"
>
>  source "drivers/gpu/host1x/Kconfig"
>  source "drivers/gpu/ipu-v3/Kconfig"
> +source "drivers/gpu/nova-core/Kconfig"
>
>  source "drivers/gpu/drm/Kconfig"
>
>
> base-commit: 69b8923f5003664e3ffef102e73333edfa2abdcf
> --
> 2.48.1
>


