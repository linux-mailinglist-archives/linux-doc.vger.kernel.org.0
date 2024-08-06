Return-Path: <linux-doc+bounces-22248-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F26948FDD
	for <lists+linux-doc@lfdr.de>; Tue,  6 Aug 2024 15:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E16A5B25838
	for <lists+linux-doc@lfdr.de>; Tue,  6 Aug 2024 13:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6AB1C4626;
	Tue,  6 Aug 2024 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="i76UqWAq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD021C3F22
	for <linux-doc@vger.kernel.org>; Tue,  6 Aug 2024 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722949311; cv=none; b=RJwUNs79lTu3sSDQ8vEj5yKY8XKYRTdT5+4tVnUcfOV/0T3AJbQoRimAiSPHO4lgqz4Mp0sn9exUZjS84A+5y7lmpKi/juZODP2si9B4j9j9UVCCgD4G87qK7MoZw2D3pztrcuOEMSEbP92JrduGLc97DmlR6SU3dqKjxe5SOYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722949311; c=relaxed/simple;
	bh=XGHVtA53ndm8tu52HB2cm7xGUUoAVG2gnIVZD/zuSXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CI2NiHlk2bgWiWTs1Pe4JZyWi8osJWTpWPYzkWhffQqd9xkqwZDg7LMU1xqNF3MCfqHc41vCnQ4Bs86L3y7R7lWQjSje8OSy4uJ51WleeU/uediGBFgTjhSTzJlAxHqJ6TfbLZxurcXIOG6WddgjPdHIpW2U06wC91sWf1Yw+qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=i76UqWAq; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef247e8479so1162491fa.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Aug 2024 06:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1722949307; x=1723554107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWaPqrk0Ji9UdhOsGVUggVZW2Ffw4bKnDm4+9jC3vKo=;
        b=i76UqWAqEs2KeYCdDz8sPsJrKAkI5MHczuEDwKbHgwMFULeNGbCYsjp14xtyWHD9R2
         a8Y9ZSep2m4GD3YHQdZNXuJdlK966VijFv+f5Qnr5RM5HQNdXGYRS3oEgmeKHFY7NzYS
         OFKH7B5R+l9BnowGdbahAjnCFkQ4+ByhY8wfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722949307; x=1723554107;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWaPqrk0Ji9UdhOsGVUggVZW2Ffw4bKnDm4+9jC3vKo=;
        b=mJvRxX7nUZZvHSxFR/nW69lVF5Jn+NNA/unosPbSqUpt0sz8LkyYISnoUFjwgSkIIS
         JV2jdbC0PUnTS+bcV1owrM4DDdA6bXWpXuGtLFBs/SgFD3tY0LQBKEk4lzZ6K5CBWm/o
         ZcUjvKLRFJSXZLwJTFKD0CPScC072Rre5JDfuz8cxLBFi7YE4DzbTQgxq/5GmPyW3V6E
         T7jH++/DHb2UlaaUa+8wjJpeA3Bdp/bVtvJPjD6aBQQw7R50HL9XbwsPS3BeYeDYZR7V
         8zC96TIA4B9tY28/wKnDKnbi5dXz6qz/I2iPHBcenpX09r2dEHd7heFL9QZWwt41Cd8J
         MC5w==
X-Forwarded-Encrypted: i=1; AJvYcCXSbHYAZJfFjc03Rd3JB5iBolsQd7ZTblfhF7rflQhkVl7pdpn+sCfb/Dr2a/ZzRTgP+ePcOCocxLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt5DZ8ri/Mbs1DSInPWa8oKH8wtNrTr9Bao05l9Y+62dJQ7B7y
	aP5ePVNWqU+3q6ZSJZkMpXhCQ1Vq4hqlnpA38oKDUkP2oegcwWWsP8GZtHR65i4=
X-Google-Smtp-Source: AGHT+IGBILqIWLNLhTGm47B+BmFPkDFKRX0XFMxi6y7ZZfWYiY/LEw2NnlFOMQ1ijpWL3jroPbc9qA==
X-Received: by 2002:a2e:3313:0:b0:2ef:2405:ff63 with SMTP id 38308e7fff4ca-2f15aafc20bmr51509691fa.5.1722949307034;
        Tue, 06 Aug 2024 06:01:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bb884cddf4sm2712126a12.66.2024.08.06.06.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 06:01:46 -0700 (PDT)
Date: Tue, 6 Aug 2024 15:01:44 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 2/6] drm/cgroup: Add memory accounting DRM cgroup
Message-ID: <ZrIeuLi88jqbQ0FH@phenom.ffwll.local>
Mail-Followup-To: Tvrtko Ursulin <tursulin@ursulin.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org
References: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
 <20240627154754.74828-3-maarten.lankhorst@linux.intel.com>
 <20240627-paper-vicugna-of-fantasy-c549ed@houat>
 <6cb7c074-55cb-4825-9f80-5cf07bbd6745@linux.intel.com>
 <20240628-romantic-emerald-snake-7b26ca@houat>
 <70289c58-7947-4347-8600-658821a730b0@linux.intel.com>
 <40ef0eed-c514-4ec1-9486-2967f23824be@ursulin.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40ef0eed-c514-4ec1-9486-2967f23824be@ursulin.net>
X-Operating-System: Linux phenom 6.9.10-amd64 

On Mon, Jul 01, 2024 at 06:01:41PM +0100, Tvrtko Ursulin wrote:
> 
> On 01/07/2024 10:25, Maarten Lankhorst wrote:
> > Den 2024-06-28 kl. 16:04, skrev Maxime Ripard:
> > > Hi,
> > > 
> > > On Thu, Jun 27, 2024 at 09:22:56PM GMT, Maarten Lankhorst wrote:
> > > > Den 2024-06-27 kl. 19:16, skrev Maxime Ripard:
> > > > > Hi,
> > > > > 
> > > > > Thanks for working on this!
> > > > > 
> > > > > On Thu, Jun 27, 2024 at 05:47:21PM GMT, Maarten Lankhorst wrote:
> > > > > > The initial version was based roughly on the rdma and misc cgroup
> > > > > > controllers, with a lot of the accounting code borrowed from rdma.
> > > > > > 
> > > > > > The current version is a complete rewrite with page counter; it uses
> > > > > > the same min/low/max semantics as the memory cgroup as a result.
> > > > > > 
> > > > > > There's a small mismatch as TTM uses u64, and page_counter long pages.
> > > > > > In practice it's not a problem. 32-bits systems don't really come with
> > > > > > > =4GB cards and as long as we're consistently wrong with units, it's
> > > > > > fine. The device page size may not be in the same units as kernel page
> > > > > > size, and each region might also have a different page size (VRAM vs GART
> > > > > > for example).
> > > > > > 
> > > > > > The interface is simple:
> > > > > > - populate drmcgroup_device->regions[..] name and size for each active
> > > > > >     region, set num_regions accordingly.
> > > > > > - Call drm(m)cg_register_device()
> > > > > > - Use drmcg_try_charge to check if you can allocate a chunk of memory,
> > > > > >     use drmcg_uncharge when freeing it. This may return an error code,
> > > > > >     or -EAGAIN when the cgroup limit is reached. In that case a reference
> > > > > >     to the limiting pool is returned.
> > > > > > - The limiting cs can be used as compare function for
> > > > > >     drmcs_evict_valuable.
> > > > > > - After having evicted enough, drop reference to limiting cs with
> > > > > >     drmcs_pool_put.
> > > > > > 
> > > > > > This API allows you to limit device resources with cgroups.
> > > > > > You can see the supported cards in /sys/fs/cgroup/drm.capacity
> > > > > > You need to echo +drm to cgroup.subtree_control, and then you can
> > > > > > partition memory.
> > > > > > 
> > > > > > Signed-off-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
> > > > > > Co-developed-by: Friedrich Vock<friedrich.vock@gmx.de>
> > > > > I'm sorry, I should have wrote minutes on the discussion we had with TJ
> > > > > and Tvrtko the other day.
> > > > > 
> > > > > We're all very interested in making this happen, but doing a "DRM"
> > > > > cgroup doesn't look like the right path to us.
> > > > > 
> > > > > Indeed, we have a significant number of drivers that won't have a
> > > > > dedicated memory but will depend on DMA allocations one way or the
> > > > > other, and those pools are shared between multiple frameworks (DRM,
> > > > > V4L2, DMA-Buf Heaps, at least).
> > > > > 
> > > > > This was also pointed out by Sima some time ago here:
> > > > > https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll.local/
> > > > > 
> > > > > So we'll want that cgroup subsystem to be cross-framework. We settled on
> > > > > a "device" cgroup during the discussion, but I'm sure we'll have plenty
> > > > > of bikeshedding.
> > > > > 
> > > > > The other thing we agreed on, based on the feedback TJ got on the last
> > > > > iterations of his series was to go for memcg for drivers not using DMA
> > > > > allocations.
> > > > > 
> > > > > It's the part where I expect some discussion there too :)
> > > > > 
> > > > > So we went back to a previous version of TJ's work, and I've started to
> > > > > work on:
> > > > > 
> > > > >     - Integration of the cgroup in the GEM DMA and GEM VRAM helpers (this
> > > > >       works on tidss right now)
> > > > > 
> > > > >     - Integration of all heaps into that cgroup but the system one
> > > > >       (working on this at the moment)
> > > > 
> > > > Should be similar to what I have then. I think you could use my work to
> > > > continue it.
> > > > 
> > > > I made nothing DRM specific except the name, if you renamed it the device
> > > > resource management cgroup and changed the init function signature to take a
> > > > name instead of a drm pointer, nothing would change. This is exactly what
> > > > I'm hoping to accomplish, including reserving memory.
> > > 
> > > I've started to work on rebasing my current work onto your series today,
> > > and I'm not entirely sure how what I described would best fit. Let's
> > > assume we have two KMS device, one using shmem, one using DMA
> > > allocations, two heaps, one using the page allocator, the other using
> > > CMA, and one v4l2 device using dma allocations.
> > > 
> > > So we would have one KMS device and one heap using the page allocator,
> > > and one KMS device, one heap, and one v4l2 driver using the DMA
> > > allocator.
> > > 
> > > Would these make different cgroup devices, or different cgroup regions?
> > 
> > Each driver would register a device, whatever feels most logical for that device I suppose.
> > 
> > My guess is that a prefix would also be nice here, so register a device with name of drm/$name or v4l2/$name, heap/$name. I didn't give it much thought and we're still experimenting, so just try something. :)
> > 
> > There's no limit to amount of devices, I only fixed amount of pools to match TTM, but even that could be increased arbitrarily. I just don't think there is a point in doing so.
> 
> Do we need a plan for top level controls which do not include region names?
> If the latter will be driver specific then I am thinking of ease of
> configuring it all from the outside. Especially considering that one cgroup
> can have multiple devices in it.
> 
> Second question is about double accounting for shmem backed objects. I think
> they will be seen, for drivers which allocate backing store at buffer
> objects creation time, under the cgroup of process doing the creation, in
> the existing memory controller. Right?

We currently don't set __GFP_ACCOUNT respectively use GFP_KERNEL_ACCOUNT,
so no. Unless someone allocates them with GFP_USER ...

> Is there a chance to exclude those from there and only have them in this new
> controller? Or would the opposite be a better choice? That is, not see those
> in the device memory controller but only in the existing one.

I missed this, so jumping in super late. I think guidance from Tejun was
to go the other way around: Exclude allocations from normal system
memory from device cgroups and instead make sure it's tracked in the
existing memcg.

Which might mean we need memcg shrinkers and the assorted pain ...

Also I don't think we ever reached some agreement on where things like cma
allocations should be accounted for in this case.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

