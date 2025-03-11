Return-Path: <linux-doc+bounces-40512-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC37A5C19A
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 13:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC52167C27
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 12:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B869C2566C0;
	Tue, 11 Mar 2025 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="iOqEUJgv"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C21256C8F
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741697215; cv=none; b=droRs0f34xsn5lV8vB3kexDqKvJS4tDf2fEBhIrXp6z2+qyjt9ZR3A7nSyIsWujXHgd9ytKMNqwZAU6Ja9a+uzzPtAHmMUru7J4+j7BCfJMewpaEPm6U7oBCu/WxZQuV66TRQEta7tukSr3vbzE+5/hDdHu14EPLQqk0hhDUSEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741697215; c=relaxed/simple;
	bh=hIuzAPv8x7HdhF3kOYgKUE08BcmIV4Tk3xoim98ixEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqqkZfVjqTndpTn8cBTz/vbpW0hG9mf+vqrnrfAQxdcFOtNQ2SRoraa8g7afnjgJqHJDM+4FnDSVG6S/2x5YFzUWTA4E2Kt/YCONs84ITETYo/RXQ3k9tQIPzY0QIB+EtoYvzGgQhv8/uAUBGjipOtFPSacM7YmwT5qCuzNF3rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=iOqEUJgv; arc=none smtp.client-ip=95.215.58.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Date: Tue, 11 Mar 2025 08:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741697201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mOG0CEw3FP2FlG0epn5X7Xw21NWLyIUELyR5vBonHPk=;
	b=iOqEUJgvADrMU0rIWuG0Ruc7Rtt8IZl+4o95HtRzhUdZyQGFZ1JqrK6ZYGRItGhaB/i6vx
	SUKlcXNM56cjtmk6uLgcFTxRSu13CBv7gM8RK/UHtKCdvpIuuoCKgOg2ZyE5WaPzY26G76
	uyHRVJJ+1DwdlUYaed7Wflte4dOcoRNxcMzYlo6FIlE42eXoaGrJVauc3xcB5jmYo5XCcD
	BUXc+bXEclIcJh9ZSiUkawPEsyTzJaoUtop39EGchJ3EqbnbnlWjQvuj3E3YGsIrgGFuaL
	uZv6bDGFaxw6XdeG2kdrdBdFkuQ7+IJDK/zThbDQLqxqGNj8xUbEJQw7INmUrA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Rob Clark <robdclark@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Faith Ekstrand <faith.ekstrand@collabora.com>,
	Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH] drm: Add UAPI for the Asahi driver
Message-ID: <Z9Awpj5Avh0rx_fq@blossom>
References: <20250310-agx-uapi-v1-1-86c80905004e@rosenzweig.io>
 <CAF6AEGukrBzwwdDWX5jUXDKqj7+kn7LBRy6NocE4=bw1D9WjcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGukrBzwwdDWX5jUXDKqj7+kn7LBRy6NocE4=bw1D9WjcQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

> > +/**
> > + * struct drm_asahi_gem_bind - Arguments passed to
> > + * DRM_IOCTL_ASAHI_GEM_BIND
> > + */
> > +struct drm_asahi_gem_bind {
> > +       /** @op: Bind operation (enum drm_asahi_bind_op) */
> > +       __u32 op;
> > +
> > +       /** @flags: One or more of ASAHI_BIND_* (BIND only) */
> > +       __u32 flags;
> > +
> > +       /** @handle: GEM object to bind/unbind (BIND or UNBIND_ALL) */
> > +       __u32 handle;
> > +
> > +       /** @vm_id: The ID of the VM to operate on */
> > +       __u32 vm_id;
> > +
> > +       /** @offset: Offset into the object (BIND only) */
> > +       __u64 offset;
> > +
> > +       /**
> > +        * @range: Number of bytes to bind/unbind to addr (BIND or UNBIND only)
> > +        */
> > +       __u64 range;
> > +
> > +       /** @addr: Address to bind to (BIND or UNBIND only) */
> > +       __u64 addr;
> > +};
> 
> No in/out syncobj/fences?  This seems to diverge from xe/nouveau/panthor..

Async vm_bind is useful mainly as an optimization, it's not (as far as I
know) required for correctness - you can always wait/signal from a
userspace submit thread with sync vm_bind. It's my understanding (from
when I chatted with Faith about this when bringing up sparse) that this
is how sparse was implemented historically and maybe still is on
Windows?

> > +/**
> > + * enum drm_asahi_sync_type - Sync item type
> > + */
> > +enum drm_asahi_sync_type {
> > +       /** @DRM_ASAHI_SYNC_SYNCOBJ: Binary sync object */
> > +       DRM_ASAHI_SYNC_SYNCOBJ = 0,
> > +
> > +       /** @DRM_ASAHI_SYNC_TIMELINE_SYNCOBJ: Timeline sync object */
> > +       DRM_ASAHI_SYNC_TIMELINE_SYNCOBJ = 1,
> > +};
> 
> IMHO it would still be worthwhile to also support fence fd's, since it
> would avoid a couple extra ioctls to convert btwn fence fds and
> syncobj for virtgpu native context..

Ditto for this as an optimization. Both of these can be added in a
straightforward backwards-compat way later, so I'm inclined to not add
any extra functionality beyond what we already have (and know works),
rather than commit prematurely to new features and risk getting
something wrong.

(and then it means more rust bindings...)

