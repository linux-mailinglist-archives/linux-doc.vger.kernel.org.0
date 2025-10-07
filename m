Return-Path: <linux-doc+bounces-62536-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C64B2BC10E4
	for <lists+linux-doc@lfdr.de>; Tue, 07 Oct 2025 12:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 44F424F4AE6
	for <lists+linux-doc@lfdr.de>; Tue,  7 Oct 2025 10:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041492D94B5;
	Tue,  7 Oct 2025 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sR15f379"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA5C2D9497
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759834621; cv=none; b=dz5aSKJTdHv16IlsfKUFx2GF7CnEJWW71WHu9Ju+nwCTiK0DhIb0dYwFBqsken5xpiqDLLxVIeOBC8lvDqmmAh2MnqP99G2fsr0jy11tvZbTka5RcZCASTQcDy1c00yPwBwkK5w0v0Eq9LshxRmiLwvovoRCAYkSOl/pV9//70w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759834621; c=relaxed/simple;
	bh=vUkY0LBxAjC+01n8OpO7QSDbN37dvum9xul2QzmKHpo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lvzxzbfYFpzdIircDS2D2WSGuoVwr/OQfbSuxQnU5a1xNGv06C7rLaPHO5TJw+K8DzFWRnofuB4Xfg04accoEGKW+rKHH0RkySHFFbYik+/pLBr/FhwHEtb5OAhGTr5OAiGirVB1O0N4Ni+isfIT1SWSusLTzNPmwtF1GBxR264=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sR15f379; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46e473e577eso31941265e9.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 03:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759834618; x=1760439418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQQAIlxYbdWuvuYTPGUIT4drPlYe0TwcyAZ7bEOHsPc=;
        b=sR15f37995rv7vXZavVI9s6XLhUo+Suau2wUL5oW6vm2NQgmgvOgRZWMNNs9i1FHoP
         Po0/CiyVufDWMB9eqWuwPz6i66bisCis+rXysh0unre4nOkq2QHj9bMagRuSre+QEOre
         +uQVhHmhUhaCLVIRVR+ASjmF/+lcgmsWAXJN3x+8Iq237oXFWtf58YGBK1YZp21NCOKy
         3vx4iLPT2up5tYnyhGg4pBeHKeVenYsOSmCi1VQOuOkvCoRimhqjIq3MmFjwWuyb67it
         8Mg9xgQNr6XBwE8qfizomyQTx4+SWkZXh0sQ52nPl4qgo0jgRUaxnGu1ZmzqUvYIg1Lo
         6vHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759834618; x=1760439418;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TQQAIlxYbdWuvuYTPGUIT4drPlYe0TwcyAZ7bEOHsPc=;
        b=AEEQ4RThKjCc3/XiFJbHo/vkekCCor7vUYxT6+d+xQDZmYlfymmxXdgfDI4CAiMviy
         n4/PxcG/7+Ti2PuNIwXT6m0qNAIzyjm+urSbBV0+fy8y52d6jaC7O2fWbv05yueKxKe4
         xAuMhomJkHOwWyIPS7pCd4OsNF9RndMVjE/nmWfp+BfaTaRAEbWhw7MOfK3CcLtaOV+Z
         phg4KJeFkTEMq00Ju1M3Uy59Tm5/mGcXrriUxI7hxt44cWQfNvZTAPq2OlHKikbC62Qa
         oXkdecNJkoKKmVNvh323FCz18NOgmUpfv6RF+o+t+QdRfdpgpF78Cia++IaD7CUQx8nT
         hX0g==
X-Forwarded-Encrypted: i=1; AJvYcCVLJDB4K0D9Cd6sDrPaSHLLlVYe/Lx+z+6Fl7QjONgwW5/OeVyPQwwkURdHT00Ts88Ps7OTuXQFx/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLeu2x5HFKasMPlQFLnezYQZg65xlDxHbntvBf/RGqu7LPSejn
	8rSGddFBFewAxzQdGRt+Ll65FD04O0lCyi2RP5VhMkYp5Dfdfep3hnZyVVo518qDj0mfeXsqGOj
	H3JnFYq6bTNFuhFpFkg==
X-Google-Smtp-Source: AGHT+IElIwg1aSS1OnCndwEEVrqrYBTpVUjbbOKp+wuEHxYn6Q0yHYCleycgScMtGRMAnWQ4U5k/Dz3Y9aV1s5w=
X-Received: from wmoh10.prod.google.com ([2002:a05:600c:314a:b0:45f:28dd:87d9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:4392:b0:46e:74bb:6bc with SMTP id 5b1f17b1804b1-46e74bb07ecmr73042095e9.5.1759834618591;
 Tue, 07 Oct 2025 03:56:58 -0700 (PDT)
Date: Tue, 7 Oct 2025 10:56:56 +0000
In-Reply-To: <20251006163024.18473-3-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251006163024.18473-1-work@onurozkan.dev> <20251006163024.18473-3-work@onurozkan.dev>
Message-ID: <aOTx-Oj_VN6fVV_s@google.com>
Subject: Re: [PATCH 2/3] rust: xarray: abstract `xa_alloc_cyclic`
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, corbet@lwn.net, lyude@redhat.com, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2025 at 07:30:23PM +0300, Onur =C3=96zkan wrote:
> Implements `alloc_cyclic` function to `XArray<T>` that
> wraps `xa_alloc_cyclic` safely.
>=20
> Resolves a task from the nova/core task list under the "XArray
> bindings [XARR]" section in "Documentation/gpu/nova/core/todo.rst"
> file.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/xarray.rs | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>=20
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index 1b882cd2f58b..4c2fdf53c7af 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -305,6 +305,49 @@ pub fn alloc(
>=20
>          Ok(id)
>      }
> +
> +    /// Allocates an empty slot within the given `limit`, storing `value=
` and cycling from `*next`.
> +    ///
> +    /// May drop the lock if needed to allocate memory, and then reacqui=
re it afterwards.
> +    ///
> +    /// On success, returns the allocated id.
> +    ///
> +    /// On failure, returns the element which was attempted to be stored=
.
> +    pub fn alloc_cyclic(
> +        &mut self,
> +        limit: bindings::xa_limit,

Could we use a Range<u32> type or similar here? I don't think we want a
bindings type.

> +        next: &mut u32,

So this is a mutable reference because it writes `*id + 1` to next,
taking wrap-around into account? The docs should probably explain that.

> +        value: T,
> +        gfp: alloc::Flags,
> +    ) -> Result<u32, StoreError<T>> {
> +        build_assert!(
> +            T::FOREIGN_ALIGN >=3D 4,
> +            "pointers stored in XArray must be 4-byte aligned"
> +        );

It should be enough to have this in the constructor. I don't think it's
needed here.

Alice

