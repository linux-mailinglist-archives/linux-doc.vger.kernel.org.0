Return-Path: <linux-doc+bounces-40056-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66981A54016
	for <lists+linux-doc@lfdr.de>; Thu,  6 Mar 2025 02:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BBE11632A3
	for <lists+linux-doc@lfdr.de>; Thu,  6 Mar 2025 01:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4A2188A3A;
	Thu,  6 Mar 2025 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="fUeAuUK8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207B618DB20
	for <linux-doc@vger.kernel.org>; Thu,  6 Mar 2025 01:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741225367; cv=none; b=ArL9s+9UKodLT9ylCMS4Co1+P1DmwQ4K44yq4E2pxGrwaPX9Trgt5xPu27tApxQcM26z16cMSYGzZl7KwhxlBxVtLxVDAF4PQ7Sj/VtAqnhQW/9Cl+73m/J2ZpTX2dK7v7M+prgYVGU2PBiZkDvO02kgT/Imqh64B5coLBixyhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741225367; c=relaxed/simple;
	bh=rYgMDAH5nCCXIqosdgoXUJ8vWWm75Pq1UHp9JPPvPQk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tkKjQrptVIhe0RwDGxkPX4VksnOAc3aDUJL1KxR+v6Q1qcOWdE1EsOAJrjKpBjJYqaWsesWI4NhQaewDtfKp0zEl4cZW0vBDMKZHmR4FSdQECxQ7bdunbIDPCe+8re0TviTGT06CKzxZ3nxe+rqkjCT9Tdd9UGSYaAlFDaBY2UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=fUeAuUK8; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741225363; x=1741484563;
	bh=zLAhGikI9OQ7l6Nb3S58CqrDpZ/7yBEMUaeGn554uPg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=fUeAuUK8+bL+N03w5z8JwfxekjYrDbWfBbPfvtBjBtZY8C7ItqBN8WrRgi8dcc4xk
	 zDbo8O2ngikPqLldpGRa+27xLAU4ZK5YAdJMMKYR/UHSXjLtCyYzLQMGMFqa/H6g1R
	 TC5E4AHk0OJDYQ1gkEtGQ6kthn2sWkcgyy37Nhe1BAyIVDJ6Z/e8j8cxxyJhf4qYx5
	 wt+TyurSZ8GgtF0RYYSzc+ko9gl1ezZenfBLM22uLy+MnvlncCZF4Ztr2wvP5HzbHG
	 HF425rCpDGXo153bFkgsNrq6KOMwbUbow33DhmDH3ZVyEpQikj9qWjEXYWLTOcTlQ+
	 peCoK77RTQJGg==
Date: Thu, 06 Mar 2025 01:42:38 +0000
To: Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 3/5] rust: firmware: add `module_firmware!` macro
Message-ID: <D88SVF4SV464.1WALI436PKCDB@proton.me>
In-Reply-To: <Z8j8gwvnmKF9ZymM@pollux>
References: <20250304173555.2496-1-dakr@kernel.org> <20250304173555.2496-4-dakr@kernel.org> <D88RCQTNVD7B.3RIN253F8LODY@proton.me> <Z8j0otfkVtnMXIRQ@pollux> <D88SJOTH9GN4.3OVO4JFYAF9R2@proton.me> <Z8j8gwvnmKF9ZymM@pollux>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 4858ce176deb9419af4eaf1a034e80329ae63e6f
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Mar 6, 2025 at 2:38 AM CET, Danilo Krummrich wrote:
> On Thu, Mar 06, 2025 at 01:27:19AM +0000, Benno Lossin wrote:
>> On Thu Mar 6, 2025 at 2:04 AM CET, Danilo Krummrich wrote:
>> > On Thu, Mar 06, 2025 at 12:31:14AM +0000, Benno Lossin wrote:
>> >> On Tue Mar 4, 2025 at 6:34 PM CET, Danilo Krummrich wrote:
>> >>
>> >> > +#[macro_export]
>> >> > +macro_rules! module_firmware {
>> >> > +    ($($builder:tt)*) =3D> {
>> >>
>> >> This should probably be `$builder:expr` instead.
>> >
>> > That doesn't work, the compiler then complains, since it's not an expr=
ession:
>> >
>> > 193  |         static __MODULE_FIRMWARE: [u8; $builder::create(__modul=
e_name()).build_length()] =3D
>> >      |                                                ^^ expected one =
of `.`, `?`, `]`, or an operator
>>
>> Does `<$builder>::create` work (with the `expr` fragment)?
>
> No, the compiler then explicitly complains that it expects a type.

Aw well, can't have em all... Probably would be useful if you add a
comment saying that `expr` and `ty` can't be used.

>> > `ty` doesn't work either, since then the compiler expects the caller t=
o add the
>> > const generic, which we want the macro to figure out instead.
>> >
>> >>
>> >> > +
>> >> > +        #[cfg(not(MODULE))]
>> >> > +        const fn __module_name() -> &'static kernel::str::CStr {
>> >> > +            <LocalModule as kernel::ModuleMetadata>::NAME
>> >>
>> >> Please either use `::kernel::` or `$crate::` instead of `kernel::`.
>> >
>> > Good catch, thanks.
>> >
>> >>
>> >> Hmm, I am not 100% comfortable with the `LocalModule` way of accessin=
g
>> >> the current module for some reason, no idea if there is a rational
>> >> argument behind that, but it just doesn't sit right with me.
>> >>
>> >> Essentially you're doing this for convenience, right? So you don't wa=
nt
>> >> to have to repeat the name of the module type every time?
>> >
>> > No, it's really that I can't know the type name here, please see the p=
revious
>> > patch commit message that introduces `LocalModule` for explanation.
>>
>> Gotcha.
>>
>> >> > +        }
>> >> > +
>> >> > +        #[cfg(MODULE)]
>> >> > +        const fn __module_name() -> &'static kernel::str::CStr {
>> >> > +            kernel::c_str!("")
>> >>
>> >> Ditto.
>> >>
>> >> > +        }
>> >>
>> >> Are these two functions used outside of the `static` below? If no, th=
en
>> >> you can just move them into the static? You can also probably use a
>> >> `const` instead of a function, that way you only have 4 lines instead
>> >> of 8.
>> >
>> > Is this what you're proposing?
>> >
>> > =09#[macro_export]
>> > =09macro_rules! module_firmware {
>> > =09    ($($builder:tt)*) =3D> {
>> > =09        const __MODULE_FIRMWARE_PREFIX: &'static $crate::str::CStr =
=3D if cfg!(MODULE) {
>> > =09            $crate::c_str!("")
>> > =09        } else {
>> > =09            <LocalModule as $crate::ModuleMetadata>::NAME
>> > =09        };
>> >
>> > =09        #[link_section =3D ".modinfo"]
>> > =09        #[used]
>> > =09        static __MODULE_FIRMWARE: [u8; $($builder)*::create(__MODUL=
E_FIRMWARE_PREFIX)
>> > =09            .build_length()] =3D $($builder)*::create(__MODULE_FIRM=
WARE_PREFIX).build();
>>
>> I meant to also move the `const` into the expression, but I guess that
>> leads to duplication:
>>
>>     #[link_section =3D ".modinfo"]
>>     #[used]
>>     static __MODULE_FIRMWARE: [u8; {
>>         const PREFIX: &'static $crate::str::CStr =3D if cfg!(MODULE) {
>>             $crate::c_str!("")
>>         } else {
>>             <LocalModule as $crate::ModuleMetadata>::NAME
>>         };
>>         <$builder>::create(PREFIX).build_length()
>>     }] =3D {
>>         const PREFIX: &'static $crate::str::CStr =3D if cfg!(MODULE) {
>>             $crate::c_str!("")
>>         } else {
>>             <LocalModule as $crate::ModuleMetadata>::NAME
>>         };
>>         <$builder>::create(PREFIX)
>>     };
>>
>> But then the advantage is that only the `__MODULE_FIRMWARE` static will
>> be in-scope.
>>
>> Do you think that its useful to have the static be accessible? I.e. do
>> users need to access it (I would think they don't)? If they don't, then
>> we could put all of those things into a `const _: () =3D { /* ... */ };`=
.
>> But then people can invoke `module_firmware!` multiple times in the same
>> module, is that a problem?
>
> Didn't know that's possible (const _; () =3D { ... };). That's pretty nic=
e, I will
> go with my above proposal wrapped into the anonymous const. Thanks.

Sounds good.

---
Cheers,
Benno


