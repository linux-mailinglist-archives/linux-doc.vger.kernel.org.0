Return-Path: <linux-doc+bounces-88646-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DQzE4XHDWr93AUAu9opvQ
	(envelope-from <linux-doc+bounces-88646-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 16:39:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA71558FC51
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 16:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F388730ECB15
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 14:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E8B3EB80D;
	Wed, 20 May 2026 14:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="FPTjsQ3c"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A73EA94B
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286764; cv=none; b=FkQ9L3eqrKA+dsembFdp1oCdmUwcNoQ1fUpz6MWmOcGJ7+xs83Q359y7BQXPxlNkyCL7ft8IUmgLQD9uSkWFnZvOIGhLcPhr4Lcspff4IbLH6Y9Wwntk5IlbGoEOJtIYGGNuHEcPKHjJ9Vzy+4nNuvkp82INrMowfLyo12nXJk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286764; c=relaxed/simple;
	bh=0J8R0ffMp8trkw+kzNuZJw7MEyir0pdYlyWuS1J9rd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHVeawfHIyVPmnfoVUENTNEvJba4FVXm/rvSwAhCptPf8uNY3suJsuGSKktYHUTgQZxXMWFOYwbUo4sBMq9uW5N0OVvThdb87hBYOtIOsxQBf3+PdDRW4gXlEnI9qKccbpK27hqzm+qrk7u7SVTXi+SxAZ/2mYHsLbEZ9Qbl5Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=FPTjsQ3c; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so1898903f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1779286753; x=1779891553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQD7vCF/AAogkfSUfkAhoWgZAchGIS/4X+2z2vWNOMk=;
        b=FPTjsQ3cMxSZzM94jYZwWZmbhwRHxc5iMNr3fOkeDlFatJsKHvGw//gXGFHBDfPHDf
         irZvyYNzYh934pVSuHqF5ZgkpXVfxmaSFKwuy3aanDYEPpscaLNA6Qg8QdWO91tvCe9F
         y6C7W7X8WXgVwyJW3Nw/Zx6TsiI2/trfDYcbRlh4gp+dxPBmwZNmV7Rs4MeqhAxO6V7l
         7EL7u+KXX39sPVRVleMhdYV2tTMLtVUIN9IYvr8UN0Ge1PJ+EwY0iw9osabqpTJzH4Bc
         //VIb+u443QjIq3IJw93o/EZeqtZKmvgzMhA0xHWCMnorjMiqxCHd+rVw2Fg+zgVi4tM
         oeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286753; x=1779891553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQD7vCF/AAogkfSUfkAhoWgZAchGIS/4X+2z2vWNOMk=;
        b=TmDcuE+isO22HO6BTj8FegkPxZVf7Bcrax562iJb8E9vPGCyOeIJqL0Vjm5Nu8Rpsa
         lycBGzkWq9q4xefKIcOJq6A7f1CCGNZ1VVt9yUO2IkgSnQSk2m83pObrvhffl+/qLzc8
         ZaF6r+lfuipP9xkFKWki47fgrcdFiNi3sQyLH5MtaPbF2c/cbz1Vbpy+mi95wOIaQsiF
         AbN3DkGE+x1oZlxm8VVw/fNDF/TOIRB69AisghBaJoSmSqtXD8TAx2OgCHX2SMwfduPk
         xrwWF4KRENVg66Nkd2teEsOStPS+UIR5EBcZPH0kLGxpZDDPDxhiw7c8g/eze5cBs9pS
         aRMA==
X-Forwarded-Encrypted: i=1; AFNElJ8RDWYJxQ/DEJsV4dqrCNkdwURFYxLtelX30ugjErglZXQdeqPPCokx2Yp6/Iqd8lH4FV33eAvmoiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YykwiCGKApO/Me5FfNK9yQ2Rgg+FFNbg5sFYuztN6aSPiZMcE15
	h+a0mC1ip8sX0weqJ5ngSCsHTSRfOgvOE8enWPxAAVyId8aFlsZCBUb5jEn/1TOP8LU=
X-Gm-Gg: Acq92OEdfVQv1pQBOjw68H+p7pl6qM+6/WEXTm0141cVI4/Xfo1nRq/0uoeXanbKxhU
	dlKFTl2uUHYmFA/BVFjMxq3sutkELBQz9R/2pzMJNkNPq+oIzb46jtc1J/a1qmbs+ObkezB5V4N
	b9ass5ZtQdB/rAjaPr8ipFcnAnq11iiGLBnqvBo0nmCbuxCR60d1ruSijOAmgaSjjhP2Gm9GQbX
	LYiXFzp0GwfJwaeumeaFmzPBtIzpYrart7GvTdnzaX5cdQSlu2XiZ4m95FAraUZCf62kEAR3MHd
	o6ATvFIhlzxBYNGbLmi4wXV/EBbVb6sfij5mNFt9WUVPdXKSoManNSrBE+ImdoX36fUVeHKC1cg
	lbSp89ill8vkU9i3HG304zH8kC8LPIcf6ndh2uA7kFDZoMkwWLivljp6+yi+V9Ly5ba6M0G+lcx
	oBlYYtuE383fIUkiRj7K/VUBuFVZMTM4cKs4eON5NzduqeOmRGWyyTGNI=
X-Received: by 2002:a05:6000:2503:b0:43f:e43a:f4a6 with SMTP id ffacd0b85a97d-45e5c35e7bdmr38999826f8f.6.1779286753206;
        Wed, 20 May 2026 07:19:13 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17a22sm54932291f8f.22.2026.05.20.07.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 07:19:12 -0700 (PDT)
Message-ID: <7c7242b8-eb22-41b1-8f04-f7abda62bb28@ursulin.net>
Date: Wed, 20 May 2026 15:19:12 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/fdinfo: Add "evicted" memory accounting
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, linux-doc@vger.kernel.org
References: <20260520-panthor-bo-reclaim-observability-v4-0-a47ab61cb80d@collabora.com>
 <20260520-panthor-bo-reclaim-observability-v4-1-a47ab61cb80d@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260520-panthor-bo-reclaim-observability-v4-1-a47ab61cb80d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-88646-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ursulin.net];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ursulin.net:mid,ursulin.net:dkim,arm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:email]
X-Rspamd-Queue-Id: BA71558FC51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 20/05/2026 14:04, Nicolas Frattaroli wrote:
> Currently, there's no way to know for certain how much GPU memory was
> swapped out. The difference between total and resident memory would
> include newly allocated pages, which are not resident, but also aren't
> swapped out.
> 
> Add a new drm_gem_object_status so drivers can signal when an object has
> been evicted to swap, and add a new "evicted" counter to
> drm_memory_stats.
> 
> Due to how the supported_flags bitmask is determined, the "evicted"
> count won't be printed to fdinfo if there's no swapped out pages.
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 6 ++++++
>   drivers/gpu/drm/drm_file.c            | 8 ++++++++
>   include/drm/drm_file.h                | 2 ++
>   include/drm/drm_gem.h                 | 2 ++
>   4 files changed, 18 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 70b7cfcc194f..ac1dbf52d96d 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -202,6 +202,12 @@ One practical example of this could be the presence of unsignaled fences in a
>   GEM buffer reservation object. Therefore, the active category is a subset of the
>   resident category.
>   
> +- drm-evicted-<region>: <uint> [KiB|MiB]
> +
> +The total size of buffers that have been evicted and are no longer pinned by the
> +device. Only present if there are buffers that are currently evicted, and if the
> +driver implements reporting of this type of memory.

The semantics as tricky to make work in an obvious way.

On one hand the text above is almost exactly the semantics of 'total' - 
'resident'. Almost meaning it was resident at some point, but isn't any 
more. Whereas raw 'total' - 'resident' can also mean it never has been 
instantiated.

You could even have a "workaround" where you report a 'swap' memory 
region and then don't need to add anything new to the spec.

Next problem - on paper evicted could be useful to replace driver legacy 
keys such as 'amd-evicted-ram'. But that "evicted" is defined as "not in 
a the preferred placement". While your evicted is more like "no current 
placement" (as in, no GPU accessible backing storage).

Is it possible to find a definition of this new category which makes 
sense for different GPUs/drivers, be it integrated or discrete.

Or would simply going for 'drm-total-swap:' (or resident?) work for 
panthor? Advantage being it would also work unambiguously for discrete 
drivers.

Like the ones which support multiple TTM placements, for example VRAM + 
SYSTEM and then next step is swapping out so an extreme example on a 
16GiB GPU + 16GiB RAM machine with a 32GiB gfx workload could be like:

drm-total-vram:		32GiB
drm-resident-vram:	16GiB
drm-resident-system:	15GiB
drm-total-swap:		1GiB

Does this look clear enough? Whereas with the "evicted" category it 
would be:

drm-total-vram:		32GiB
drm-resident-vram:	16GiB
drm-evicted-vram:	16GiB # portion which got demoted to system RAM
drm-resident-system:	15GiB
drm-evicted-system:	1GiB  # portion which got demoted to swap

Where drm-evicted-vram is redundant to "total - resident". And it is 
overloaded semantics as it where does evicted go depending on the 
GPU/driver/region.

Thoughts, opinions?

Regards,

Tvrtko

> +
>   Implementation Details
>   ======================
>   
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index ec820686b302..5078172976c0 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -868,6 +868,7 @@ int drm_memory_stats_is_zero(const struct drm_memory_stats *stats)
>   		stats->private == 0 &&
>   		stats->resident == 0 &&
>   		stats->purgeable == 0 &&
> +		stats->evicted == 0 &&
>   		stats->active == 0);
>   }
>   EXPORT_SYMBOL(drm_memory_stats_is_zero);
> @@ -901,6 +902,10 @@ void drm_print_memory_stats(struct drm_printer *p,
>   	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
>   		drm_fdinfo_print_size(p, prefix, "purgeable", region,
>   				      stats->purgeable);
> +
> +	if (supported_status & DRM_GEM_OBJECT_EVICTED)
> +		drm_fdinfo_print_size(p, prefix, "evicted", region,
> +				      stats->evicted);
>   }
>   EXPORT_SYMBOL(drm_print_memory_stats);
>   
> @@ -954,6 +959,9 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>   
>   		if (s & DRM_GEM_OBJECT_PURGEABLE)
>   			status.purgeable += add_size;
> +
> +		if (s & DRM_GEM_OBJECT_EVICTED)
> +			status.evicted += add_size;
>   	}
>   	spin_unlock(&file->table_lock);
>   
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 6ee70ad65e1f..7e4cb45a52c3 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -500,6 +500,7 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
>    * @resident: Total size of GEM objects backing pages
>    * @purgeable: Total size of GEM objects that can be purged (resident and not active)
>    * @active: Total size of GEM objects active on one or more engines
> + * @evicted: Total size of GEM objects that have been evicted
>    *
>    * Used by drm_print_memory_stats()
>    */
> @@ -509,6 +510,7 @@ struct drm_memory_stats {
>   	u64 resident;
>   	u64 purgeable;
>   	u64 active;
> +	u64 evicted;
>   };
>   
>   enum drm_gem_object_status;
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 86f5846154f7..799588a2762a 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -53,6 +53,7 @@ struct drm_gem_object;
>    * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
>    * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
>    * @DRM_GEM_OBJECT_ACTIVE: object is currently used by an active submission
> + * @DRM_GEM_OBJECT_EVICTED: object is evicted and no longer pinned by driver
>    *
>    * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
>    * and drm_show_fdinfo().  Note that an object can report DRM_GEM_OBJECT_PURGEABLE
> @@ -67,6 +68,7 @@ enum drm_gem_object_status {
>   	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
>   	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
>   	DRM_GEM_OBJECT_ACTIVE    = BIT(2),
> +	DRM_GEM_OBJECT_EVICTED   = BIT(3),
>   };
>   
>   /**
> 


