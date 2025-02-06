Return-Path: <linux-doc+bounces-37191-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EB5A2ABD3
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 15:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3563F7A140F
	for <lists+linux-doc@lfdr.de>; Thu,  6 Feb 2025 14:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E9432C85;
	Thu,  6 Feb 2025 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dil55C2w"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD123644D;
	Thu,  6 Feb 2025 14:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738853358; cv=none; b=I7lceZ3y8fFw6OcHoUEJPD6jRaEVlEPyVABkNL3lPgH1b+NNR4AOzP/TBbqypeQwuioAXCycAzWJ1iY66qB+KxAov12DvLaRvK2MfQjzyBpKpyBuPFUXZmOxah5XgdPqW2d5YsVvv0bhabEcEmPD4fb7Of0DCuio4WJQpV9pSn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738853358; c=relaxed/simple;
	bh=cO9xv/pgkriWpvpU7X8se6LkKHWu8m6H7ZLMTtebHOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7WpoeaGis1MWEE/x8fQcMtz+h9lpqKLfhUhSxofxIXibqK34uw1ojbulnq/0bFimsX9VGSP0WmR48+EtJ2XfZUjoqCmlea2vJxBQQrwIxiQapjy9jfUR7H/b45hRd6SSTEFOseA7XU9bo8V+Hs//0g6bpbCahxXm86gIpWQjYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dil55C2w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64EAC4CEE2;
	Thu,  6 Feb 2025 14:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738853357;
	bh=cO9xv/pgkriWpvpU7X8se6LkKHWu8m6H7ZLMTtebHOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dil55C2wPV6WwA5bRmSX6PDp1N2edfxKwYV1n42K/UoFdcBNA4nPrhMaadior8tu3
	 tdq+m5zvIJ4BYU5kFKlFfs2zQSlzjZHNME6xCEXsAWuoD6oUYFsJ8LRV4+Vo1JGWjI
	 rXyD1IcWnu8QdfAib3+OM315k7cUtfC3YdVFc1TOPNYaKlUExZPKhAEYyNIqs39mRA
	 BAUTw7VzppECtPNUfxnLGvfhJNUfdgFHxyuknoOey7RKQJjMTYsVynuBvOIx22eBeN
	 Td9SBYYEKvVGX1sRBfCcIEKnrh7UNHuMDU7gHbqNvJNejvvPtc0AdYnBXkTagl1hiZ
	 51iHWqVTbhJUg==
Date: Thu, 6 Feb 2025 15:49:09 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
	pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
	jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] gpu: nova-core: add initial driver stub
Message-ID: <Z6TL5a5SCZoVq8Zt@cassiopeiae>
References: <20250204190400.2550-1-dakr@kernel.org>
 <D7LF554L2J0N.JRPHDUCHVKP3@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7LF554L2J0N.JRPHDUCHVKP3@nvidia.com>

Hi Alexandre,

On Thu, Feb 06, 2025 at 11:05:37PM +0900, Alexandre Courbot wrote:
> > +
> > +/// Enum representation of the GPU chipset.
> > +#[derive(fmt::Debug)]
> 
> I suspect you will eventually want to also derive Copy and Clone, as
> well as PartialEq and Eq (so the assigned values can be used), but it's
> of course fine to postpone this until we actually need them.

Indeed, the idea is to add it as needed.

> 
> Note that the usage made of Debug suggests that you actually want
> Display - but I understand that implementing Display would be more
> cumbersome.
> 
> > +
> > +// TODO replace with something like derive(FromPrimitive)
> > +impl Chipset {
> > +    fn from_u32(value: u32) -> Option<Chipset> {
> > +        match value {
> > +            0x162 => Some(Chipset::TU102),
> > +            0x164 => Some(Chipset::TU104),
> > +            0x166 => Some(Chipset::TU106),
> > +            0x167 => Some(Chipset::TU117),
> > +            0x168 => Some(Chipset::TU116),
> > +            0x172 => Some(Chipset::GA102),
> > +            0x173 => Some(Chipset::GA103),
> > +            0x174 => Some(Chipset::GA104),
> > +            0x176 => Some(Chipset::GA106),
> > +            0x177 => Some(Chipset::GA107),
> > +            0x192 => Some(Chipset::AD102),
> > +            0x193 => Some(Chipset::AD103),
> > +            0x194 => Some(Chipset::AD104),
> > +            0x196 => Some(Chipset::AD106),
> > +            0x197 => Some(Chipset::AD107),
> > +            _ => None,
> > +        }
> > +    }
> > +}
> 
> Shouldn't this be an implementation of TryFrom<u32>? By doing so you can
> return ENODEV as the error and simplify the caller code below.

Yes, it should be. I wanted to change that, but forgot about it. Thanks for the
reminder.

But ultimately, as the comment says, I'd like to have some kind of FromPrimitive
implementation for that.

> 
> > +
> > +// TODO:
> > +// - replace with something like derive(FromPrimitive)
> > +// - consider to store within Chipset, if arbitrary_enum_discriminant becomes stable
> > +impl Architecture {
> > +    fn from_u32(value: u32) -> Option<Architecture> {
> > +        match value {
> > +            0x16 => Some(Architecture::Turing),
> > +            0x17 => Some(Architecture::Ampere),
> > +            0x19 => Some(Architecture::Ada),
> > +            _ => None,
> > +        }
> > +    }
> > +}
> > +
> > +impl Revision {
> > +    fn new(major: u8, minor: u8) -> Self {
> > +        Self { major, minor }
> > +    }
> 
> Suggestion: add a version that takes a Boot0 as argument and call the
> right methods directly in the method instead of relying on the caller to
> do that for us, e.g:
> 
>     fn from_boot0(boot0: &regs::Boot0) -> Self {
>         Self::new(boot0.major_rev(), boot0.minor_rev())
>     }
> 
> 
> Then new() can also be removed if Boot0 is the only sensible source of
> Revision.

That's a good suggestion, I'll pick that up.

> 
> (I'd argue that Boot0 should also implement Copy, that way this method
> can take it by value directly)
> 
> > +}
> > +
> > +impl fmt::Display for Revision {
> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > +        write!(f, "{:x}.{:x}", self.major, self.minor)
> > +    }
> > +}
> > +
> > +impl Spec {
> > +    fn new(bar: &Devres<Bar0>) -> Result<Spec> {
> > +        let bar = bar.try_access().ok_or(ENXIO)?;
> > +        let boot0 = regs::Boot0::read(&bar);
> > +
> > +        let Some(chipset) = Chipset::from_u32(boot0.chipset()) else {
> > +            return Err(ENODEV);
> > +        };
> > +
> > +        let Some(arch) = Architecture::from_u32(boot0.arch()) else {
> > +            return Err(ENODEV);
> > +        };
> 
> Technically the Architecture is already known if the Chipset has been
> built successfully, so there should be no need to build it again (and
> test for a failure that cannot happen at this point).
> 
> Since the architecture information is already embedded in Chipset, maybe
> we can have an arch() method there?
> 
> Something like:
> 
>     impl Chipset {
>         pub(crate) fn arch(self) -> Architecture {
>             match self as u32 & !0xf {
>                 0x160 => Architecture::Turing,
>                 0x170 => Architecture::Ampere,
>                 0x190 => Architecture::Ada,
>                 _ => unreachable!(),
>             }
>         }
>     }

I thought about this, which is also why the comment above says: "consider to
store within Chipset, if arbitrary_enum_discriminant becomes stable".

I did not go with what you suggest because it leaves us with either
Chipset::arch() returning a Result, which is annoying, or with Chipset::arch()
being able to panic the kernel, which I'd dislike even more.

There's also a third option, which would be to have some kind of unknown
architecture, which we could catch later on, but that's just a worse variation
of returning a Result.

Another reason was that I did not want to encode register specific masks into
the Chipset type.

> 
> 
> This would also enable us to remove Architecture::from_u32() and
> Spec::arch, which is redundant with Spec::chipset anyway.
> 
> A better (but more verbose) implementation of Chipset::arch() might be
> to match every possible variant, so we get a build error if we forget to
> handle a new chipset instead of hitting the unreachable!() at runtime...

I think that would indeed be a reasonable option.

> 
> > +
> > +        let revision = Revision::new(boot0.major_rev(), boot0.minor_rev());
> > +
> > +        Ok(Self {
> > +            arch,
> > +            chipset,
> > +            revision,
> > +        })
> > +    }
> > +}
> > +
> > +impl Firmware {
> > +    fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmware> {
> > +        let mut chip_name = CString::try_from_fmt(fmt!("{:?}", spec.chipset))?;
> > +        chip_name.make_ascii_lowercase();
> > +
> > +        let fw_booter_load_path =
> > +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_load-{}.bin", &*chip_name, ver))?;
> > +        let fw_booter_unload_path =
> > +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_unload-{}.bin", &*chip_name, ver))?;
> > +        let fw_bootloader_path =
> > +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/bootloader-{}.bin", &*chip_name, ver))?;
> > +        let fw_gsp_path =
> > +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/gsp-{}.bin", &*chip_name, ver))?;
> > +
> > +        let booter_load = firmware::Firmware::request(&fw_booter_load_path, dev)?;
> > +        let booter_unload = firmware::Firmware::request(&fw_booter_unload_path, dev)?;
> > +        let bootloader = firmware::Firmware::request(&fw_bootloader_path, dev)?;
> > +        let gsp = firmware::Firmware::request(&fw_gsp_path, dev)?;
> > +
> > +        Ok(Firmware {
> > +            booter_load,
> > +            booter_unload,
> > +            bootloader,
> > +            gsp,
> > +        })
> 
> This looks like a good opportunity to use a closure and avoid
> repeating the code:
> 
>     let request_fw = |type_| {
>         CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", type_, &*chip_name, ver))
>             .and_then(|path| firmware::Firmware::request(&path, dev))
>     };
> 
> It is also short enough that you can directly invoke it when building
> the Firmware object, without using temporary variables:
> 
>     Ok(Firmware {
>         booter_load: request_fw("booter_load")?,
>         booter_unload: request_fw("booter_unload")?,
>         bootloader: request_fw("bootloader")?,
>         gsp: request_fw("gsp")?,
>     })
> 
> IMHO this has the benefit of being more concise and keeping related
> operations closer.

I agree, that's pretty clean.

> 
> Thanks!
> Alex.
> 

