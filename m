Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF22357FE7
	for <lists+linux-doc@lfdr.de>; Thu,  8 Apr 2021 11:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhDHJus (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 8 Apr 2021 05:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbhDHJus (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 05:50:48 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14667C061760
        for <linux-doc@vger.kernel.org>; Thu,  8 Apr 2021 02:50:37 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id 12so1425766wrz.7
        for <linux-doc@vger.kernel.org>; Thu, 08 Apr 2021 02:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XT6Uvr6QxDSjDPt6uf2/aqkiGCAGwLiMoyrjM1HFV1k=;
        b=ewZibRRwK495FacAf3sa9RYv2FlsuUOYMcPv8IK3dalmsr76Zjbf6gBRyqKZ5wmcSH
         Qwsz52Tm/BmfqfDy1VLbAlC2SAEFSX0KStNfA7I+l8iilgVqTBohToRwlFJ86JjJd3HL
         lHnv/NV37spEQ86MWEQbmhLuB6iNBMIDmdLhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XT6Uvr6QxDSjDPt6uf2/aqkiGCAGwLiMoyrjM1HFV1k=;
        b=aC2qOAHsCcI01sdYIm3lhm58Cm+lgdE8ZV19uLOIvIUQtwzD4arSiAmGgdX1OG0mgE
         scVAxIJzD352hXwRmOgY4o4O3r4HVrb5pD0EdvHPqF9m0vE+1lIHLaW422LqQTbuOFqg
         H5mwDrzTTRfhhmH3odlSZUFS3OuMfjvLK0N+i5B0CTZy0wuvd3byxWJvPK7xciIauX/x
         8vdUgYb9Ux5I9J9SzxfHBJ3b847j4J+pA9dDP8m4ZBT35IAeUE6jqukglo91LMiZ9S4F
         o7yxbUsFBpr3pKmNMN/QQ4/wkttzId772BO5MPOvRKtBtwxs4WHrcKDuNyJK6HXoNlOS
         hMFA==
X-Gm-Message-State: AOAM531AFwOIoIWRFQWvY1u8W2zAXrbxcC7lKTm4FmrAySs43PFxwULH
        ZPyqT6q2NhWM6AO9IaFcAY8RJQ==
X-Google-Smtp-Source: ABdhPJxffYDZUd9071tZ4d+tqTzCVAunQxs0iLn8FQb+kLIa1NQUkLsX04goCXfhBdGiY7Cqviqvlw==
X-Received: by 2002:adf:84e6:: with SMTP id 93mr9469514wrg.376.1617875435720;
        Thu, 08 Apr 2021 02:50:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k3sm25768727wrc.67.2021.04.08.02.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 02:50:35 -0700 (PDT)
Date:   Thu, 8 Apr 2021 11:50:33 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
        broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
        emil.l.velikov@gmail.com, geert+renesas@glider.be,
        hdegoede@redhat.com, bluescreen_avenger@verizon.net,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 03/10] drm/aperture: Move fbdev conflict helpers into
 drm_aperture.h
Message-ID: <YG7R6ZkVNwrYaUWX@phenom.ffwll.local>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318102921.21536-4-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 18, 2021 at 11:29:14AM +0100, Thomas Zimmermann wrote:
> Fbdev's helpers for handling conflicting framebuffers are related to
> framebuffer apertures, not console emulation. Therefore move them into a
> drm_aperture.h, which will contain the interfaces for the new aperture
> helpers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
> ---
>  Documentation/gpu/drm-internals.rst |  6 +++
>  include/drm/drm_aperture.h          | 60 +++++++++++++++++++++++++++++
>  include/drm/drm_fb_helper.h         | 56 ++-------------------------
>  3 files changed, 69 insertions(+), 53 deletions(-)
>  create mode 100644 include/drm/drm_aperture.h
> 
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index 12272b168580..4c7642d2ca34 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -75,6 +75,12 @@ update it, its value is mostly useless. The DRM core prints it to the
>  kernel log at initialization time and passes it to userspace through the
>  DRM_IOCTL_VERSION ioctl.
>  
> +Managing Ownership of the Framebuffer Aperture
> +----------------------------------------------
> +
> +.. kernel-doc:: include/drm/drm_aperture.h
> +   :internal:
> +
>  Device Instance and Driver Handling
>  -----------------------------------
>  
> diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
> new file mode 100644
> index 000000000000..13766efe9517
> --- /dev/null
> +++ b/include/drm/drm_aperture.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef _DRM_APERTURE_H_
> +#define _DRM_APERTURE_H_
> +
> +#include <linux/fb.h>
> +#include <linux/vgaarb.h>
> +
> +/**
> + * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-configured framebuffers

Annoying bikeshed, but I'd give them drm_aperture_ prefixes, for ocd
consistency. Also make them real functions, they're quite big and will
grow more in the next patch.

I'm also not super happy about the naming here but oh well.

Either way: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> + * @a: memory range, users of which are to be removed
> + * @name: requesting driver name
> + * @primary: also kick vga16fb if present
> + *
> + * This function removes framebuffer devices (initialized by firmware/bootloader)
> + * which use memory range described by @a. If @a is NULL all such devices are
> + * removed.
> + */
> +static inline int
> +drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
> +					      const char *name, bool primary)
> +{
> +#if IS_REACHABLE(CONFIG_FB)
> +	return remove_conflicting_framebuffers(a, name, primary);
> +#else
> +	return 0;
> +#endif
> +}
> +
> +/**
> + * drm_fb_helper_remove_conflicting_pci_framebuffers - remove firmware-configured
> + *                                                     framebuffers for PCI devices
> + * @pdev: PCI device
> + * @name: requesting driver name
> + *
> + * This function removes framebuffer devices (eg. initialized by firmware)
> + * using memory range configured for any of @pdev's memory bars.
> + *
> + * The function assumes that PCI device with shadowed ROM drives a primary
> + * display and so kicks out vga16fb.
> + */
> +static inline int
> +drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
> +						  const char *name)
> +{
> +	int ret = 0;
> +
> +	/*
> +	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> +	 * otherwise the vga fbdev driver falls over.
> +	 */
> +#if IS_REACHABLE(CONFIG_FB)
> +	ret = remove_conflicting_pci_framebuffers(pdev, name);
> +#endif
> +	if (ret == 0)
> +		ret = vga_remove_vgacon(pdev);
> +	return ret;
> +}
> +
> +#endif
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 3b273f9ca39a..d06a3942fddb 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -30,13 +30,13 @@
>  #ifndef DRM_FB_HELPER_H
>  #define DRM_FB_HELPER_H
>  
> -struct drm_fb_helper;
> -
> +#include <drm/drm_aperture.h>
>  #include <drm/drm_client.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <linux/kgdb.h>
> -#include <linux/vgaarb.h>
> +
> +struct drm_fb_helper;
>  
>  enum mode_set_atomic {
>  	LEAVE_ATOMIC_MODE_SET,
> @@ -451,54 +451,4 @@ drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
>  
>  #endif
>  
> -/**
> - * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-configured framebuffers
> - * @a: memory range, users of which are to be removed
> - * @name: requesting driver name
> - * @primary: also kick vga16fb if present
> - *
> - * This function removes framebuffer devices (initialized by firmware/bootloader)
> - * which use memory range described by @a. If @a is NULL all such devices are
> - * removed.
> - */
> -static inline int
> -drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
> -					      const char *name, bool primary)
> -{
> -#if IS_REACHABLE(CONFIG_FB)
> -	return remove_conflicting_framebuffers(a, name, primary);
> -#else
> -	return 0;
> -#endif
> -}
> -
> -/**
> - * drm_fb_helper_remove_conflicting_pci_framebuffers - remove firmware-configured framebuffers for PCI devices
> - * @pdev: PCI device
> - * @name: requesting driver name
> - *
> - * This function removes framebuffer devices (eg. initialized by firmware)
> - * using memory range configured for any of @pdev's memory bars.
> - *
> - * The function assumes that PCI device with shadowed ROM drives a primary
> - * display and so kicks out vga16fb.
> - */
> -static inline int
> -drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
> -						  const char *name)
> -{
> -	int ret = 0;
> -
> -	/*
> -	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> -	 * otherwise the vga fbdev driver falls over.
> -	 */
> -#if IS_REACHABLE(CONFIG_FB)
> -	ret = remove_conflicting_pci_framebuffers(pdev, name);
> -#endif
> -	if (ret == 0)
> -		ret = vga_remove_vgacon(pdev);
> -	return ret;
> -}
> -
>  #endif
> -- 
> 2.30.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
