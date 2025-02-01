Return-Path: <linux-doc+bounces-36574-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C3DA247C5
	for <lists+linux-doc@lfdr.de>; Sat,  1 Feb 2025 09:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A8C21885968
	for <lists+linux-doc@lfdr.de>; Sat,  1 Feb 2025 08:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543B812A177;
	Sat,  1 Feb 2025 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="i9MwJaHi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fSZZwkri"
X-Original-To: linux-doc@vger.kernel.org
Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CE517BA5;
	Sat,  1 Feb 2025 08:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738398875; cv=none; b=jI53oCbpL+XuYzeKT1CwtwcPcdb3ivGAGvSHNjr2U/+H8iIYXR8qbhQg+525RbcJwTpAFNt2Ct7Qui96CPoAV8xodbwz0tWjLIyo+RwlRCSyCZ/mKEo97Prq2hgqdFUaiTDdZyGQKce5MRFghNO1YrO77ROqr3fw/rCQNNNlHl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738398875; c=relaxed/simple;
	bh=m4ugyGeTmJ1Hdww6iOC1KT8NE1PSpQ2Mfgq5XItdfjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHSLIbNBm1vjnN3fLZs+ZAnB8aPeUuJUleTmFiVjnSBjPt/jC7QvhNhbne5EHCF1S0MNZDWMymBXr8/vJjdZklJ1Sq6vRXD/fDvkgZhmnCsve73WBt5bePv7K1KwoiaixLghPYwgkY30G5Z73JbaK2/KEu+ISfp47yZdxb7OpVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=i9MwJaHi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fSZZwkri; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailflow.stl.internal (Postfix) with ESMTP id 03BEA1D40825;
	Sat,  1 Feb 2025 03:34:29 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sat, 01 Feb 2025 03:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1738398869; x=1738406069; bh=Gr1zB5yYMG
	S0lw6CixbzKQ92pbAY2oNwMe6gTZbPNcY=; b=i9MwJaHiU7BS8OwND65BDCuieH
	Je4EZAznyUtwb3hROr93pSf9g7g/bIjny5Ev0iZpVCQdqIM9nWi93DxVjwsgSilw
	Pq8GgqSJcEbJoPqvXTGtXIWcvp0ulE4Nw2r5SIzqEVHVo2zY3WPIGISUxDZ5qZzd
	CNPWHKUUBqoGMZcZmsdPvxw5mBVzqNyuncS02X+QEoA18xIyS608uiQGSYnoGxqL
	KlskeOXTsZb5jRB0EsRcS45X91noS3aw04Jl0Hzh3QxeNwCJ/6pj0RXha3xwVozD
	OG/vlzCvsXr1jdCoTKIjfeLYobAluwfUTKawNY6wA+ckYY0ECfLAeNp9SrTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738398869; x=1738406069; bh=Gr1zB5yYMGS0lw6CixbzKQ92pbAY2oNwMe6
	gTZbPNcY=; b=fSZZwkri4RoubdcowJKUZVZZwmyYKScJkeX8j9LdwmT13tlpWzG
	7rdd28P3o5Ajvs7zmUZ8atuyN2VjZvDHmqwEOJtTEPQESWfERZDacGQ6m+rPTpls
	HWgw0Yz8JX5RN9zmzEHq734wzxefAU6RDzmzZsfUDC2ybSg7vlXVXgkMD89x8Adi
	Q/ZFpZxo065p75FUG7LyLs8S6bMtNZFfYOOG8iWfPOSjbMjBrXF7N2MlOfZUF9CQ
	CbMEYWuyfxsLKAC3feQygULogfIw8J0A9PcQQSIb3yJULzmbhz/HcGdAm1s71Mjl
	iKJ9nZ/oN8xMEG7iBFruFgif9mep32UcAxA==
X-ME-Sender: <xms:lNydZ_rucv1AleRp3RIuYHvTKQ6IuU6SxIEraEcRusl2KuEHtZUIlw>
    <xme:lNydZ5p4Eo-NhN1TA2k5NixpXEtM9IpmDjrZSJXmYja9tS7F4zCgfbnbA-SxWZMvE
    CkUL3dFGp9UCw>
X-ME-Received: <xmr:lNydZ8MNkDTcoRxF0Uan_FsFk10WP7eieh37AvYJJga2JJUu96RnA1Un9dqgwg-rYYXLBFKggK0aXYZngH2xEA3XpBs3qw7zCoLyEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepheekpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrges
    fhhffihllhdrtghhpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpth
    htohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtgho
    mhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    htiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghjrghnuhhlghhu
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:lNydZy56WtzRwe-LifRB7XkftVcyAIN7XhYDMysNV6xCmdY4FXZzmA>
    <xmx:lNydZ-4d9956HWSr2XCZlcW3Lo2vGuZ2I9VjVFb_ooxDuZbcPyzcxw>
    <xmx:lNydZ6guanCULnn6Wm7H__JB-w1DrI4ez0jXFuJG2DJadKjLJQQMcA>
    <xmx:lNydZw5fnmiRKQ2UGkv0s3lPZ8uFtoyKCVn5KuBsKbjjEs4zcIRAgg>
    <xmx:ldydZxwtE5Kr-H2vdblUI6jw1Ynv8pyDRN28ZrocygcY6bOZWc-zjqs6>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 1 Feb 2025 03:34:27 -0500 (EST)
Date: Sat, 1 Feb 2025 09:33:28 +0100
From: Greg KH <greg@kroah.com>
To: Danilo Krummrich <dakr@kernel.org>
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
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
Message-ID: <2025020151-leverage-unadorned-fb05@gregkh>
References: <20250131220432.17717-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131220432.17717-1-dakr@kernel.org>

On Fri, Jan 31, 2025 at 11:04:24PM +0100, Danilo Krummrich wrote:
> +impl Gpu {
> +    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<Self>> {
> +        let spec = GpuSpec::new(&bar)?;
> +        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
> +
> +        dev_info!(
> +            pdev.as_ref(),
> +            "NVIDIA {:?} ({:#x})",
> +            spec.chipset,
> +            spec.boot0
> +        );

When drivers work properly, they should be quiet, so can you move this
to dev_dbg()?

thanks,

greg k-h

