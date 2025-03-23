Return-Path: <linux-doc+bounces-41617-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59696A6D146
	for <lists+linux-doc@lfdr.de>; Sun, 23 Mar 2025 22:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B61C7A4E10
	for <lists+linux-doc@lfdr.de>; Sun, 23 Mar 2025 21:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F4F1A5B82;
	Sun, 23 Mar 2025 21:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="nZ9Le3K9"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFC31A317A
	for <linux-doc@vger.kernel.org>; Sun, 23 Mar 2025 21:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742766275; cv=none; b=GTDE4f7+ib6C1kQVA7S67sql68nsbJSJtgCkR7Zrvpi8SRBvJ2yDSWMR1oXTEYqPvM4kkrwuiqTCPj6KAuEkyOSqZVftTAXm+TtlPaAjiFBkqcwE3FS/reLmx8bJ2J17VyadXLJLaq0L6+8NkGlEEM9DBGSWwwt27RiA38myhnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742766275; c=relaxed/simple;
	bh=Np008TJr5PK+P6vSrV7C4URKZjMVCbHKWGNlLBsimIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzxBQwz8ldJzrGnOPan+IIuitzwTkfiHTRu4Hzgg8N3gXk8K+qd5z2dhGAWEZl8MCvslUHLzR4EgHFX+i6Gru8RRYVUtXhA+kEKcCeZk4CsKW/9Fv6ihNorS4DfIcNJ4PE8LsOiOySO4SaaOSky5quCXc0CPICLLdPSuBoxCTWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=nZ9Le3K9; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Date: Sun, 23 Mar 2025 17:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1742766271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QjI5CAIKnyK0cdKaefRJI+q3uIG7lhr68HrdHr6otHQ=;
	b=nZ9Le3K9grAmT8NSqrDY7VgqawNr/XTrJxRvN1cnBj5rG5ctGZFQCbYbmgaahOqfE4y8X6
	9KiTK78LgpYvRwVN+5zFnyPVfkywDFasGxtxhKNwLwWoFJmI3aEZJwku1/EAvQL4segCBL
	GKMhFQ9tW6Sie6nKkCQzSyxkQg/G91JQl5JBVLihPfSOBgK0Rw9zfLdsp5oL61XNAM2K4y
	EOadBxaZValTGWpyOOX2ozW/iNrMvBnfzLdCp+xW/A4nUucYKeDqrqta/rfKTlhwkGNgDe
	CZGYYmPXcuH8jntdQWJIvZ7MVHpgdSGE0X7sP901OWfGmctB8KHsZb9uFe7BFA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Faith Ekstrand <faith.ekstrand@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?=22Bj=F6rn_Roy_Baron=22?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Sergio Lopez Pascual <slp@sinrega.org>,
	Ryan Houdek <sonicadvance1@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	asahi <asahi@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-doc <linux-doc@vger.kernel.org>,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v3] drm: Add UAPI for the Asahi driver
Message-ID: <Z-CAtz-D-CslvABE@blossom>
References: <20250314-agx-uapi-v3-1-3abf7e74ea2f@rosenzweig.io>
 <195b507d4b3.b25d0dad175771.7566427576910952468@collabora.com>
 <195b582682b.121ba4d5e219032.3109114844776468245@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <195b582682b.121ba4d5e219032.3109114844776468245@collabora.com>
X-Migadu-Flow: FLOW_OUT

>  >  > +struct drm_asahi_queue_create { 
>  >  > +����/** @flags: MBZ */ 
>  >  > +����__u32 flags; 
>  >  > + 
>  >  > +����/** @vm_id: The ID of the VM this queue is bound to */ 
>  >  > +����__u32 vm_id; 
>  >  > + 
>  >  > +����/** @queue_caps: Bitmask of DRM_ASAHI_QUEUE_CAP_* */ 
>  >  > +����__u32 queue_caps; 
>  >  > + 
>  >  > +����/** @priority: Queue priority, 0-3 */ 
>  >  > +����__u32 priority; 
> 
> Is one of these priorities REALTIME and only usable by privileged apps? If so, maybe document that and/or have an enum?

Actually, I've reserved realtime&high but always deny right now to make
sure Mesa doesn't assume it can use them, then we can relax in the
future once the kernel permission gating is there. (Needs rust
bindings.)

