Return-Path: <linux-doc+bounces-34603-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F07A07E94
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 18:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D0F3188CA88
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 17:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A393189528;
	Thu,  9 Jan 2025 17:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="h/D1DK2/"
X-Original-To: linux-doc@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683751885BE;
	Thu,  9 Jan 2025 17:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736443077; cv=pass; b=IlUyWjuYYGsmu7cWjv4kmG97Fz8+cern9hBkPLXe53j9F1nfluJ74EIRFr9q0x8d1VsMRsPzfR0iYg0lo1yxV1tdWlwyFRlhCvqfT6bHMcgZZqBe0z5K6uLMIOjb6mPubMEQvesYcDfiY6C3DuODz6oy13ETgny1xEq7dJpYWGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736443077; c=relaxed/simple;
	bh=W1QfxSWHxU+vFr0Jc1oCufSw4DUSXCg4WvMOvv2keNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5fWj0VmPP8HJ1qtP+sVs92gzyu4O7b1mvOX9b+JF1nw6FQi1cVO0QqwxFx3o3LZPFEOhlxwvy6NF2UF5KbCMn8T9SsD0G5CbMQpzJWY2SnNaUS4hXqW2J+RQd1r0cyGQB/Q37pV+0W8u8HKZQwYMRaSFUpjRGxNq98AEThBlp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=h/D1DK2/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1736443057; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FMpUXLC1XrWffqWGQYxHhGkgkmqBZu2gQwKEDs/gaU/44dE8/dvRMyn0JjmL1XBMFzw10N7VgX2WqMq8h0Pwy27iPJEQ7OZsPZsD4Z4IHU2dtvYwIL3PG1hJ43hGUct9w2+Nt2TswFk0Hf3EwFSF1YcLyNirEm13t1877ztmtsc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736443057; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+yG4OPAZpwIkncDT1rYy9OAueHzOXEav9rjjTgZquuo=; 
	b=f/SVc2ZysbCWixcukR+OmomYl5cUBboXuvbEt9BjaDjcb6hlHcaU8Zuu+8fK5+OkFWX0d5bXF81PB9CRZmrBZ2EhU0ajMTl93KEZhlIBCDMt7mG93XJAyMYsK+VVXiXb6gbcq7I9DMfGLX9HFwYHpH08gfbkSPQGNztLRNgEFDs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736443057;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=+yG4OPAZpwIkncDT1rYy9OAueHzOXEav9rjjTgZquuo=;
	b=h/D1DK2/sEp3O4fYtPnOcu6U7Qt2MZ/NFxcO3KiGLsuKYXpP1GnPRjG+K8SxqTbb
	Fsx/C3z9hGYki0tV5S24WzXgWVHyivk+jPE2DJiGgWdT2LBEec/tvYJSrFwF9f+fZvy
	TxjTtErNOvO4FbW9oyEyjoEA/boTP/cFfs/glKok=
Received: by mx.zohomail.com with SMTPS id 1736443055727574.1082045890414;
	Thu, 9 Jan 2025 09:17:35 -0800 (PST)
Date: Thu, 9 Jan 2025 17:17:31 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] drm/file: Add driver-specific memory region key
 printing helper
Message-ID: <x5ywvy7nimvbdhuag67zrex6tjvkx2qzmepziyh2uj5fxpomjy@mpbxdpsjg6hf>
References: <20250108210259.647030-1-adrian.larumbe@collabora.com>
 <20250108210259.647030-3-adrian.larumbe@collabora.com>
 <a4775792-f193-4694-82c2-c5c4c13e3cea@ursulin.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4775792-f193-4694-82c2-c5c4c13e3cea@ursulin.net>

On 09.01.2025 13:05, Tvrtko Ursulin wrote:
> On 08/01/2025 21:02, Adrián Larumbe wrote:
> > This is motivated by the desire of some dirvers (eg. Panthor) to print the
> > size of internal memory regions with a prefix that reflects the driver
> > name, as suggested in the previous documentation commit.
> > 
> > That means a minor refactoring of print_size() was needed so as to make it
> > more generic in the format of key strings it takes as input.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > ---
> >   drivers/gpu/drm/drm_file.c | 60 +++++++++++++++++++++++++++++++++-----
> >   include/drm/drm_file.h     |  2 ++
> >   2 files changed, 54 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index cb5f22f5bbb6..5deae4cffa79 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -830,8 +830,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
> >   }
> >   EXPORT_SYMBOL(drm_send_event);
> > -static void print_size(struct drm_printer *p, const char *stat,
> > -		       const char *region, u64 sz)
> > +static void print_size(struct drm_printer *p, const char *key, u64 sz)
> >   {
> >   	const char *units[] = {"", " KiB", " MiB"};
> >   	unsigned u;
> > @@ -842,9 +841,54 @@ static void print_size(struct drm_printer *p, const char *stat,
> >   		sz = div_u64(sz, SZ_1K);
> >   	}
> > -	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
> > +	drm_printf(p, "%s:\t%llu%s\n", key, sz, units[u]);
> >   }
> > +#define KEY_LEN 1024
> > +#define DRM_PREFIX "drm"
> > +
> > +static void
> > +print_size_region(struct drm_printer *p, const char *stat,
> > +		  const char *region, u64 sz)
> > +{
> > +	char key[KEY_LEN+1] = {0};
> 
> A kilobyte of stack makes me a bit uneasy.
> 
> Would it not work to make print_size take a prefix and also avoid string
> operations? Something like, not compile tested:

This looks good to me, I had insisted we mandate a maximum key length, but
like you said on IRC there's truly no need for this.

> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 2289e71e2fa2..efa4593babbc 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -830,8 +830,12 @@ void drm_send_event(struct drm_device *dev, struct
> drm_pending_event *e)
>  }
>  EXPORT_SYMBOL(drm_send_event);
> 
> -static void print_size(struct drm_printer *p, const char *stat,
> -		       const char *region, u64 sz)
> +static void
> +drm_fdinfo_print_size(struct drm_printer *p,
> +		      const char *prefix,
> +		      const char *stat,
> +		      const char *region,
> +		      u64 sz)
>  {
>  	const char *units[] = {"", " KiB", " MiB"};
>  	unsigned u;
> @@ -842,8 +846,10 @@ static void print_size(struct drm_printer *p, const char
> *stat,
>  		sz = div_u64(sz, SZ_1K);
>  	}
> 
> -	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
> +	drm_printf(p, "%s-%s-%s:\t%llu%s\n",
> +		   prefix, stat, region, sz, units[u]);
>  }
> +EXPORT_SYMBOL(drm_fdinfo_print_size);
> 
>  int drm_memory_stats_is_zero(const struct drm_memory_stats *stats)
>  {
> @@ -868,17 +874,23 @@ void drm_print_memory_stats(struct drm_printer *p,
>  			    enum drm_gem_object_status supported_status,
>  			    const char *region)
>  {
> -	print_size(p, "total", region, stats->private + stats->shared);
> -	print_size(p, "shared", region, stats->shared);
> +	const char *prefix = "drm";
> +
> +	drm_fdinfo_print_size(p, prefix, "total", region,
> +			      stats->private + stats->shared);
> +	drm_fdinfo_print_size(p, prefix, "shared", region, stats->shared);
> 
>  	if (supported_status & DRM_GEM_OBJECT_ACTIVE)
> -		print_size(p, "active", region, stats->active);
> +		drm_fdinfo_print_size(p, prefix, "active", region,
> +				      stats->active);
> 
>  	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
> -		print_size(p, "resident", region, stats->resident);
> +		drm_fdinfo_print_size(p, prefix, "resident", region,
> +				      stats->resident);
> 
>  	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
> -		print_size(p, "purgeable", region, stats->purgeable);
> +		drm_fdinfo_print_size(p, prefix, "purgeable", region,
> +				      stats->purgeable);
>  }
>  EXPORT_SYMBOL(drm_print_memory_stats);
> 
> ?
> 
> Regards,
> 
> Tvrtko
> 
> > +
> > +	if (strnlen(stat, KEY_LEN) + strnlen(region, KEY_LEN) +
> > +	    strlen(DRM_PREFIX) + 2 > KEY_LEN)
> > +		return;
> > +
> > +	snprintf(key, sizeof(key), "%s-%s-%s", DRM_PREFIX, stat, region);
> > +	print_size(p, key, sz);
> > +}
> > +
> > +/**
> > + * drm_driver_print_size - A helper to print driver-specific k:v pairs
> > + * @p: The printer to print output to
> > + * @file: DRM file private data
> > + * @subkey: Name of the key minus the driver name
> > + * @sz: Size value expressed in bytes
> > + *
> > + * Helper to display key:value pairs where the value is a numerical
> > + * size expressed in bytes. It's useful for driver-internal memory
> > + * whose objects aren't exposed to UM through a DRM handle.
> > + */
> > +void drm_driver_print_size(struct drm_printer *p, struct drm_file *file,
> > +			   const char *subkey, u64 sz)
> > +{
> > +	char key[KEY_LEN+1] = {0};
> > +	char *drv_name = file->minor->dev->driver->name;
> > +
> > +	if (strnlen(subkey, KEY_LEN) + strlen(drv_name) + 1 > KEY_LEN)
> > +		return;
> > +
> > +	snprintf(key, sizeof(key), "%s-%s", drv_name, subkey);
> > +	print_size(p, key, sz);
> > +}
> > +EXPORT_SYMBOL(drm_driver_print_size);
> > +
> > +#undef DRM_PREFIX
> > +#undef KEY_LEN
> > +
> >   /**
> >    * drm_print_memory_stats - A helper to print memory stats
> >    * @p: The printer to print output to
> > @@ -858,15 +902,15 @@ void drm_print_memory_stats(struct drm_printer *p,
> >   			    enum drm_gem_object_status supported_status,
> >   			    const char *region)
> >   {
> > -	print_size(p, "total", region, stats->private + stats->shared);
> > -	print_size(p, "shared", region, stats->shared);
> > -	print_size(p, "active", region, stats->active);
> > +	print_size_region(p, "total", region, stats->private + stats->shared);
> > +	print_size_region(p, "shared", region, stats->shared);
> > +	print_size_region(p, "active", region, stats->active);
> >   	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
> > -		print_size(p, "resident", region, stats->resident);
> > +		print_size_region(p, "resident", region, stats->resident);
> >   	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
> > -		print_size(p, "purgeable", region, stats->purgeable);
> > +		print_size_region(p, "purgeable", region, stats->purgeable);
> >   }
> >   EXPORT_SYMBOL(drm_print_memory_stats);
> > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > index f0ef32e9fa5e..07da14859289 100644
> > --- a/include/drm/drm_file.h
> > +++ b/include/drm/drm_file.h
> > @@ -494,6 +494,8 @@ struct drm_memory_stats {
> >   enum drm_gem_object_status;
> > +void drm_driver_print_size(struct drm_printer *p, struct drm_file *file,
> > +			   const char *subkey, u64 sz);
> >   void drm_print_memory_stats(struct drm_printer *p,
> >   			    const struct drm_memory_stats *stats,
> >   			    enum drm_gem_object_status supported_status,

Adrian Larumbe

