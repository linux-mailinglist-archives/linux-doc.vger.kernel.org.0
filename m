Return-Path: <linux-doc+bounces-40051-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C31E2A53F8D
	for <lists+linux-doc@lfdr.de>; Thu,  6 Mar 2025 02:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DAB97A45CE
	for <lists+linux-doc@lfdr.de>; Thu,  6 Mar 2025 01:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24ED52E40B;
	Thu,  6 Mar 2025 01:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtqYTxcm"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D87376;
	Thu,  6 Mar 2025 01:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741223083; cv=none; b=pDgwF8esngEKBUresmRAjME455t9x1ClcEl7RA9XMrsiKcw8u8oeywQ/CC69ex/DD1U4aAwpbf6Ap08no9UKXCRdLmK5opRLNminbMv4NBjO9eA3qYy4M8aFaFbXmRUU3g5oSIPrP5B6QRZ41pTFEA8ibponSfVCl5pD/fn9kDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741223083; c=relaxed/simple;
	bh=MG8qD6EbxcKVc0A7pj1N1I8F4g6Nc+3vpshMYLH2lVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ebt8mggaqYnzgXAlHlcsZg92mHP7ghRU2PmI4vxq487L8S6pRPgyU1Deo0Ao5cw/M6NXDMJq53tRP3g/R9WHImllOvIQ6fq4267i5k+J+ThOcpJrepd4NfuJyrjJFBvPGQr/6uvtIaIOZ2xZTGeDZGVWdsgOpaNadztM/Z6NlYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtqYTxcm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4CAC4CED1;
	Thu,  6 Mar 2025 01:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741223082;
	bh=MG8qD6EbxcKVc0A7pj1N1I8F4g6Nc+3vpshMYLH2lVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtqYTxcmheUPDrEtsUCTqUqsElt6JsFHh92ayvSWAiqmKI9q3Jm+B35Ff5BLbZ96c
	 NPsr4urjWCY+xH6yc3rTA8CXJbpwvK3ovFiVvm5zI+jY28YSKj3AxIJxXXt0eOkqhi
	 8z+iZCrJ/S4EPfBo+QKyHEKwWVCrwuWk2II8A5F+qfpLm+PGu20O1+OA4WQBMCXu7H
	 5Mb8nP81aes/CXKjJBK97hd5//LKY967+krR8St9v7NWf/4MZeQTxGfB/lsSxFhs97
	 9z0xWU9aVyAfZ/DAYWVZ6yWR82beP1B0ELz6+M1yavI1Obq9esQRqWcqsb/izV07CD
	 1/K2hnFbpDNSg==
Date: Thu, 6 Mar 2025 02:04:34 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
	pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
	jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
	mcgrof@kernel.org, russ.weight@linux.dev,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 3/5] rust: firmware: add `module_firmware!` macro
Message-ID: <Z8j0otfkVtnMXIRQ@pollux>
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-4-dakr@kernel.org>
 <D88RCQTNVD7B.3RIN253F8LODY@proton.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D88RCQTNVD7B.3RIN253F8LODY@proton.me>

On Thu, Mar 06, 2025 at 12:31:14AM +0000, Benno Lossin wrote:
> On Tue Mar 4, 2025 at 6:34 PM CET, Danilo Krummrich wrote:
> 
> > +#[macro_export]
> > +macro_rules! module_firmware {
> > +    ($($builder:tt)*) => {
> 
> This should probably be `$builder:expr` instead.

That doesn't work, the compiler then complains, since it's not an expression:

193  |         static __MODULE_FIRMWARE: [u8; $builder::create(__module_name()).build_length()] =
     |                                                ^^ expected one of `.`, `?`, `]`, or an operator

`ty` doesn't work either, since then the compiler expects the caller to add the
const generic, which we want the macro to figure out instead.

> 
> > +
> > +        #[cfg(not(MODULE))]
> > +        const fn __module_name() -> &'static kernel::str::CStr {
> > +            <LocalModule as kernel::ModuleMetadata>::NAME
> 
> Please either use `::kernel::` or `$crate::` instead of `kernel::`.

Good catch, thanks.

> 
> Hmm, I am not 100% comfortable with the `LocalModule` way of accessing
> the current module for some reason, no idea if there is a rational
> argument behind that, but it just doesn't sit right with me.
> 
> Essentially you're doing this for convenience, right? So you don't want
> to have to repeat the name of the module type every time?

No, it's really that I can't know the type name here, please see the previous
patch commit message that introduces `LocalModule` for explanation.

> 
> > +        }
> > +
> > +        #[cfg(MODULE)]
> > +        const fn __module_name() -> &'static kernel::str::CStr {
> > +            kernel::c_str!("")
> 
> Ditto.
> 
> > +        }
> 
> Are these two functions used outside of the `static` below? If no, then
> you can just move them into the static? You can also probably use a
> `const` instead of a function, that way you only have 4 lines instead
> of 8.

Is this what you're proposing?

	#[macro_export]
	macro_rules! module_firmware {
	    ($($builder:tt)*) => {
	        const __MODULE_FIRMWARE_PREFIX: &'static $crate::str::CStr = if cfg!(MODULE) {
	            $crate::c_str!("")
	        } else {
	            <LocalModule as $crate::ModuleMetadata>::NAME
	        };
	
	        #[link_section = ".modinfo"]
	        #[used]
	        static __MODULE_FIRMWARE: [u8; $($builder)*::create(__MODULE_FIRMWARE_PREFIX)
	            .build_length()] = $($builder)*::create(__MODULE_FIRMWARE_PREFIX).build();
	    };
	}

