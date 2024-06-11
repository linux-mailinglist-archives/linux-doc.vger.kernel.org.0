Return-Path: <linux-doc+bounces-18296-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 299F09041FD
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 18:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C132C28DCA9
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 16:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983BA6F2EB;
	Tue, 11 Jun 2024 16:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="YD1h3oEb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48E46EB74
	for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718124855; cv=none; b=PcH8xY4RgovcYhOIqDTWjo/aPBMk57Zprnj0Shfp/ixsV4S0/ljXd0sng4/lrprhwCK8x3oyh3REleHsYVIBYea2OfYGf47MDEXCPROlz8U86+B0cklk6IOQJnpAvCXx/M5VKGMUy3t8qgQ1RCda1YqJMYqsgDI+0n0DU0G1Wbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718124855; c=relaxed/simple;
	bh=OrAb1OwSBRL1RD+bjKynk7YcqN0JqRD4WxAvQ9xdhGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKNTP2b3cS8wLg5OXTewLutfTes8/0LjLP/2vqBmH+W4s3J0CbezUK34esvD2A86V9mKFHZnDCqImTYvPURDctay8n8cfc707Bb6YtZFxJm+FDwmst2t5v4hrjk78/hjFqe4frEEPYC2yodKfHWUM03Z0XskCawLqnMHSIk4nJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=YD1h3oEb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42181803bf2so1725435e9.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1718124852; x=1718729652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hw7drFVos6OlmlZtZxQCwliUjnhCqtU/xBm51s1JLQM=;
        b=YD1h3oEbO0gZfL7PrJffs7vcTgEtMexS0PIp5d2siPYRO//aBar0WHM6MByme+nXdC
         D9/xmCy1oYLjvodVkaSjCICDWgeL0arTOtdLv52l+CsKDjWI4r7e8N6lprd3X61KdRrF
         KL956dkNv1/BDoF4vyrIRFt2OtQ5+cvMQAdF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718124852; x=1718729652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hw7drFVos6OlmlZtZxQCwliUjnhCqtU/xBm51s1JLQM=;
        b=ehY1ZKtMSz81y/XIun3c4Lw+qJeHpccgUO3Unry3O6CAUziITPgJO7jL1sQrp1lkMf
         PPvaupynfNXroObhcHd6FwR4k8Rw6GK9N9Fp5KK5KQ0L8sfvt/Okx2laTMB2cBKHKjo/
         Gk06FuKacQr+CwlLR56lINoRd7KqQ+wD1o7e5AK8SBfLue2doW7ELnpWiQUy/0BJyAk2
         ywpynHFbHJZFzySDxAgIg0Q7HUgto4gbVHyi7GFvHm149A2buAPpU9GltdlBWH6oro4t
         e3x6D/sHfC+NGvwxWlgtZjeiUD0KtGNy5RMNYx8zfvViIsm6X44thSWhk2wvpDcFLY8a
         vWTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1aTBQXcyfEW8AXmMQWYuD9ftg/pUASvJB5I4f7IVQxv0S6riN1WYoV9tqvgh0C34zhtDAti4ZuSEB7ZfOXznTRRKPT+pZ7Drc
X-Gm-Message-State: AOJu0Yz1kaSh6dc2yINvXRpvwTPgRjpoYLmfLZo6TUL3pZ44toIZVGl2
	JHyn3IF6rcqPVDwxwiNZCd0+uUfrhKs2T18X0kUcG2+/5Fgj35ME5reQyXEgOPs=
X-Google-Smtp-Source: AGHT+IFqYYsM2rMGUiy4YX7UaTF7NtCBy9ybwdgfBPKd11ZbCqkMYHqVBlUahONglj3MfDEkw3vRUg==
X-Received: by 2002:a5d:464b:0:b0:35f:247e:fbcb with SMTP id ffacd0b85a97d-35f247efda6mr4003276f8f.2.1718124852018;
        Tue, 11 Jun 2024 09:54:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4217f633f2asm111068895e9.28.2024.06.11.09.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 09:54:11 -0700 (PDT)
Date: Tue, 11 Jun 2024 18:54:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jakub Kicinski <kuba@kernel.org>, David Ahern <dsahern@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Itay Avraham <itayavr@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, linux-doc@vger.kernel.org,
	linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Aron Silverton <aron.silverton@oracle.com>,
	Christoph Hellwig <hch@infradead.org>, Jiri Pirko <jiri@nvidia.com>,
	Leonid Bloch <lbloch@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>, linux-cxl@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH 0/8] Introduce fwctl subystem
Message-ID: <ZmiBMYlJ4q2xPOEY@phenom.ffwll.local>
References: <0-v1-9912f1a11620+2a-fwctl_jgg@nvidia.com>
 <20240603114250.5325279c@kernel.org>
 <214d7d82-0916-4c29-9012-04590e77df73@kernel.org>
 <20240604070451.79cfb280@kernel.org>
 <665fa9c9e69de_4a4e62941e@dwillia2-xfh.jf.intel.com.notmuch>
 <20240605135911.GT19897@nvidia.com>
 <Zmhu8egti-URPFoB@phenom.ffwll.local>
 <20240611161702.GU19897@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611161702.GU19897@nvidia.com>
X-Operating-System: Linux phenom 6.8.9-amd64 

On Tue, Jun 11, 2024 at 01:17:02PM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 11, 2024 at 05:36:17PM +0200, Daniel Vetter wrote:
> > reliablity/health reporting. That's a lot more vendor specific in nature
> > and needs to be customized anyway per deployement. And only much higher in
> > the stack, maybe in k8s, can a technically reasonable unification even
> > happen.  So again we're much more lenient about infrastructure enabling
> > and uapi than stuff applications will use directly.
> 
> To be clear, this is the specific niche fwctl is for. It is not for
> GPU command submission or something like that, and as I said to Jiri I
> would agree to agressively block such abuses.
>  
> > Currently that's enough of a mess in drm that I feel like enforcing
> > something like fwctl is still too much. But maybe once fwctl is
> > established with other subsystems/devices we can start the conversations
> > with vendors to get this going a few years down the road.
> 
> I wouldn't say enforcing, but instead of having every GPU driver build
> their own weird vendor'd way to access their debug/diagnostic stuff
> steer them into fwctl. These data center GPUs with FW at least have
> lots of appropriate stuff and all the vendor OOT stuff has tooling to
> inspect the GPUs far more than DRM has code for (ie
> rocm-smi/nvidia-smi are have some features that are potentially good
> candidates for fwctl)

Yeah "enforcing" to the level we do with 3d/vulkan would be years down the
road, if ever. Very unlikely imo for debug/diagnostics/tuning stuff.

> > In practice, it doesn't seem to be an issue, at least not beyond the
> > intentionally pragmatic choices where we merge kernel code with known
> > sub-par/incomplete userspace. I'm not sure why, but to my knowledge all
> > attempts to break the spirit of our userspace rules while following the
> > letter die in vendor-internal discussions, at least for all the
> > established upstream driver teams.
> 
> I think the same is broadly true of RDMA as well, except we don't
> bother with the kernel trying to police the command stream - direct
> submission from userspace. I can't say it has been much of an issue.

Maybe just a bit confusion, but all modern-ish drm drivers stopped parsing
the command stream a while ago. We only ever did that to fill security
gaps, never to enforce any rules about what userspace is allowed to do
beyond that.

The rule that the open userspace needs to be complete, for some reasonably
pragmatic definition of "complete", is entirely a social contract. And I'm
not aware of any real issues with enforcing that beyond just trusting the
established vendor teams. So yeah no real issues with uabi that allows
maximal abuse because it's entirely unchecked by the kernel code.

Or put differently, I think we're trying to make the same point.

> > tldr; fwctl as I understand it feels like a bridge to far for drm today,
> > but I'd very much like someone else to make this happen so we could
> > eventually push towards adoption too.
> 
> Hahah, okay, well, I'm pushing :)

Thanks :-)
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

