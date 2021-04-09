Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC41359936
	for <lists+linux-doc@lfdr.de>; Fri,  9 Apr 2021 11:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbhDIJaA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 9 Apr 2021 05:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231920AbhDIJaA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Apr 2021 05:30:00 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DF7C061760
        for <linux-doc@vger.kernel.org>; Fri,  9 Apr 2021 02:29:46 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5-20020a05600c0245b029011a8273f85eso2618167wmj.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Apr 2021 02:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fT9oV4BN+fP8OtAhEYl3wA5q5d+nVpDfBhmHiic/Ebo=;
        b=Of0eQXVIqqyCFGTthOVZrcSwN/PcdYd0tqWQSxgxB/HX3Q07xPyvMLrDEU1g1rRQka
         bqFGykObnzRBTAM1rXkhxA4mVZQtYo9OvxCpClHIkdcKL6m7t1pP6K7wAmX6nCYBrcKc
         cxzNnHp9IUHUAc+mMGlD8cfSDUg4zk9HX+qNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fT9oV4BN+fP8OtAhEYl3wA5q5d+nVpDfBhmHiic/Ebo=;
        b=sA/QI5EtfABf42gFQ4nQc06nfrWXui8nRYjbZC3m1Kfch66gVvWAx2HGvC7qK8f9eU
         kST7L7cppHGLK6LaIQffmou/tz6IShEYmMbec2N15LQQ7dmqD78RQwOq7VSyExgFfqM1
         DU5aQPfpLIx7xcAIMbZ541w0Q7nCFP6ATLRy3kb3p3NJBbZlYl9Sa/V7dXZIYKFH3TVc
         18NXkUKzdr1CtatDbLNAZunHPlnQPV5ixYqtDImqtdlMX1qX66CMhmvJX6Gn8uTV5zp0
         G2CCt/pHW5g4/56LD22sAA41JuaWxmpaj1aA0riQP0tVwUyI7hZMwrB5EQ6wEdj0r684
         L+uw==
X-Gm-Message-State: AOAM532pvV2Lx6MpU30ysoliwLnMf/SPf6lklo1+1Y6Au5JmEq2fFaXO
        WGSZcId9iuURxRm91AhpCatb2w==
X-Google-Smtp-Source: ABdhPJxQae+DEM70O7kM/JNRFdzYQvhSYAMN59+W7b1iruQWhDQIYfA7RGhe3W0rKAyPUD3QGqduIA==
X-Received: by 2002:a7b:c312:: with SMTP id k18mr13169376wmj.89.1617960584649;
        Fri, 09 Apr 2021 02:29:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l14sm3547851wrm.77.2021.04.09.02.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 02:29:44 -0700 (PDT)
Date:   Fri, 9 Apr 2021 11:29:42 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, bluescreen_avenger@verizon.net,
        geert+renesas@glider.be, corbet@lwn.net, airlied@linux.ie,
        emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, lgirdwood@gmail.com,
        virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
        broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Subject: Re: [PATCH v2 04/10] drm/aperture: Add infrastructure for aperture
 ownership
Message-ID: <YHAehnkNy9ZZBXhV@phenom.ffwll.local>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-5-tzimmermann@suse.de>
 <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
 <a9d65fa8-6b10-d738-366d-c8254300cb7b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9d65fa8-6b10-d738-366d-c8254300cb7b@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 09, 2021 at 09:54:03AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.04.21 um 11:48 schrieb Daniel Vetter:
> > On Thu, Mar 18, 2021 at 11:29:15AM +0100, Thomas Zimmermann wrote:
> > > Platform devices might operate on firmware framebuffers, such as VESA or
> > > EFI. Before a native driver for the graphics hardware can take over the
> > > device, it has to remove any platform driver that operates on the firmware
> > > framebuffer. Aperture helpers provide the infrastructure for platform
> > > drivers to acquire firmware framebuffers, and for native drivers to remove
> > > them later on.
> > > 
> > > It works similar to the related fbdev mechanism. During initialization, the
> > > platform driver acquires the firmware framebuffer's I/O memory and provides
> > > a callback to be removed. The native driver later uses this information to
> > > remove any platform driver for it's framebuffer I/O memory.
> > > 
> > > The aperture removal code is integrated into the existing code for removing
> > > conflicting framebuffers, so native drivers use it automatically.
> > > 
> > > v2:
> > > 	* rename plaform helpers to aperture helpers
> > > 	* tie to device lifetime with devm_ functions
> > > 	* removed unsued remove() callback
> > > 	* rename kickout to detach
> > > 	* make struct drm_aperture private
> > > 	* rebase onto existing drm_aperture.h header file
> > > 	* use MIT license only for simplicity
> > > 	* documentation
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
> > 
> > Bunch of bikesheds for your considerations below, but overall lgtm.
> > 
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > Cheers, Daniel
> > 
> > > ---
> > >   Documentation/gpu/drm-internals.rst |   6 +
> > >   drivers/gpu/drm/Kconfig             |   7 +
> > >   drivers/gpu/drm/Makefile            |   1 +
> > >   drivers/gpu/drm/drm_aperture.c      | 287 ++++++++++++++++++++++++++++
> > >   include/drm/drm_aperture.h          |  38 +++-
> > >   5 files changed, 338 insertions(+), 1 deletion(-)
> > >   create mode 100644 drivers/gpu/drm/drm_aperture.c
> > > 
> > > diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> > > index 4c7642d2ca34..06af044c882f 100644
> > > --- a/Documentation/gpu/drm-internals.rst
> > > +++ b/Documentation/gpu/drm-internals.rst
> > > @@ -78,9 +78,15 @@ DRM_IOCTL_VERSION ioctl.
> > >   Managing Ownership of the Framebuffer Aperture
> > >   ----------------------------------------------
> > > +.. kernel-doc:: drivers/gpu/drm/drm_aperture.c
> > > +   :doc: overview
> > > +
> > >   .. kernel-doc:: include/drm/drm_aperture.h
> > >      :internal:
> > > +.. kernel-doc:: drivers/gpu/drm/drm_aperture.c
> > > +   :export:
> > > +
> > >   Device Instance and Driver Handling
> > >   -----------------------------------
> > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > index 1461652921be..b9d3fb91d22d 100644
> > > --- a/drivers/gpu/drm/Kconfig
> > > +++ b/drivers/gpu/drm/Kconfig
> > > @@ -221,6 +221,13 @@ config DRM_SCHED
> > >   	tristate
> > >   	depends on DRM
> > > +config DRM_APERTURE
> > > +	bool
> > > +	depends on DRM
> > > +	help
> > > +	  Controls ownership of graphics apertures. Required to
> > > +	  synchronize with firmware-based drivers.
> > 
> > Uh I'm not a big fan of Kconfig and .ko modules for every little helper
> > code. Imo just stuff this into the drm kms helpers and done. Or stuff it
> > into drm core code, I think either is a good case for this. Everything is
> > its own module means we need to EXPORT_SYMBOL more stuff, and then drivers
> > get funny ideas about using these internals ...
> 
> The code lives in the DRM core module. There's no extra ko file. But I'd
> like to keep the Kconfig option. The aperture helpers will only be required
> if there are generic drivers in the kernel and for many systems this is not
> the case.

Imo this kind of optimization is what LTO is for. Having hundreds of
Kconfig symbols just to shave of 2 functions, or something like that, in
each case just doesn't feel like it's justified spending of effort and
complexity. Configuring out entire subsystems, sure, but not individual
pieces like this.

So minimally a new Kconfig like this needs to show in a a) real world
config b) actual relevant savings in terms of bytes. Otherwise it's really
just cargo culting. I also feel like Kconfig symbols for everything is an
appeasement tactic to sneak code int that has seen some resistance about
potential overhead and all that. The cost in maintenance and complexity in
keeping all the combinations working is much, much bigger though. Just
look at the absolute endless amounts of pain that disabling
CONFIG_BACKLIGHT is causing drm drivers. We do not want more of that,
except if it's really solidly justified.

And for the "this saves memory" justification, we've done that for i915 to
kick out support code for old platforms. LTO is what gives you actual
real-world benefits here, since anything else means a bazillion of Kconfig
options, each for minimal gain, resulting in an overall unmaintainable
mess.

</rant>

Cheers, Daniel

> 
> Best regards
> Thomas
> 
> > 
> > > +
> > >   source "drivers/gpu/drm/i2c/Kconfig"
> > >   source "drivers/gpu/drm/arm/Kconfig"
> > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > index 5eb5bf7c16e3..c9ecb02df0f3 100644
> > > --- a/drivers/gpu/drm/Makefile
> > > +++ b/drivers/gpu/drm/Makefile
> > > @@ -32,6 +32,7 @@ drm-$(CONFIG_AGP) += drm_agpsupport.o
> > >   drm-$(CONFIG_PCI) += drm_pci.o
> > >   drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
> > >   drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
> > > +drm-$(CONFIG_DRM_APERTURE) += drm_aperture.o
> > >   drm_vram_helper-y := drm_gem_vram_helper.o
> > >   obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
> > > diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
> > > new file mode 100644
> > > index 000000000000..4b02b5fed0a1
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/drm_aperture.c
> > > @@ -0,0 +1,287 @@
> > > +// SPDX-License-Identifier: MIT
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/list.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/types.h>
> > > +
> > > +#include <drm/drm_aperture.h>
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_print.h>
> > > +
> > > +/**
> > > + * DOC: overview
> > > + *
> > > + * A graphics device might be supported by different drivers, but only one
> > > + * driver can be active at any given time. Many systems load a generic
> > > + * graphics drivers, such as EFI-GOP or VESA, early during the boot process.
> > > + * During later boot stages, they replace the generic driver with a dedicated,
> > > + * hardware-specific driver. To take over the device the dedicated driver
> > > + * first has to remove the generic driver. DRM aperture functions manage
> > > + * ownership of DRM framebuffer memory and hand-over between drivers.
> > > + *
> > > + * DRM drivers should call drm_fb_helper_remove_conflicting_framebuffers()
> > > + * at the top of their probe function. The function removes any generic
> > > + * driver that is currently associated with the given framebuffer memory.
> > > + * If the framebuffer is located at PCI BAR 0, the rsp code looks as in the
> > > + * example given below.
> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
> > > + *	{
> > > + *		struct apertures_struct *ap;
> > > + *		bool primary = false;
> > > + *		int ret;
> > > + *
> > > + *		ap = alloc_apertures(1);
> > > + *		if (!ap)
> > > + *			return -ENOMEM;
> > > + *
> > > + *		ap->ranges[0].base = pci_resource_start(pdev, 0);
> > > + *		ap->ranges[0].size = pci_resource_len(pdev, 0);
> > > + *
> > > + *	#ifdef CONFIG_X86
> > > + *		primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
> > > + *	#endif
> > > + *		ret = drm_fb_helper_remove_conflicting_framebuffers(ap, "example driver", primary);
> > > + *		kfree(ap);
> > > + *
> > > + *		return ret;
> > > + *	}
> > > + *
> > > + *	static int probe(struct pci_dev *pdev)
> > > + *	{
> > > + *		int ret;
> > > + *
> > > + *		// Remove any generic drivers...
> > > + *		ret = remove_conflicting_framebuffers(pdev);
> > > + *		if (ret)
> > > + *			return ret;
> > > + *
> > > + *		// ... and initialize the hardware.
> > > + *		...
> > > + *
> > > + *		drm_dev_register();
> > > + *
> > > + *		return 0;
> > > + *	}
> > > + *
> > > + * For PCI devices it is often sufficient to use drm_fb_helper_remove_conflicting_pci_framebuffers()
> > > + * and let it detect the framebuffer apertures automatically.
> > 
> > Maybe just me, but to avoid overstretching the attention spawn of doc
> > readers I'd avoid this example here. And maybe make the recommendation
> > stronger, e.g. "PCI device drivers can avoid open-coding
> > remove_conflicting_framebuffers() by calling
> > drm_fb_helper_remove_conflicting_pci_framebuffers()."
> > 
> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *	static int probe(struct pci_dev *pdev)
> > > + *	{
> > > + *		int ret;
> > > + *
> > > + *		// Remove any generic drivers...
> > > + *		ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "example driver");
> > > + *		if (ret)
> > > + *			return ret;
> > > + *
> > > + *		// ... and initialize the hardware.
> > > + *		...
> > > + *
> > > + *		drm_dev_register();
> > > + *
> > > + *		return 0;
> > > + *	}
> > > + *
> > > + * Drivers that are susceptible to being removed be other drivers, such as
> > > + * generic EFI or VESA drivers, have to register themselves as owners of their
> > > + * given framebuffer memory. Ownership of the framebuffer memory is achived
> > > + * by calling devm_aperture_acquire(). On success, the driver is the owner
> > > + * of the framebuffer range. The function fails if the framebuffer is already
> > > + * by another driver. See below for an example.
> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *	static struct drm_aperture_funcs ap_funcs = {
> > > + *		.detach = ...
> > 
> > Is there really value in allowing/forcing drivers to set up their own
> > detach ops? You already make this specific to struct drm_device, an
> > implementation that just calls drm_dev_unplug feels like the right thing
> > to do?
> > 
> > Or maybe we should tie this more into the struct device mode and force an
> > unload that way? That way devm cleanup would work as one expects, and
> > avoid the need for anything specific (hopefully) in this detach callback.
> > 
> > Just feels a bit like we're reinventing half of the driver model here,
> > badly.
> > 
> > > + *	};
> > > + *
> > > + *	static int acquire_framebuffers(struct drm_device *dev, struct pci_dev *pdev)
> > > + *	{
> > > + *		resource_size_t start, len;
> > > + *		struct drm_aperture *ap;
> > > + *
> > > + *		base = pci_resource_start(pdev, 0);
> > > + *		size = pci_resource_len(pdev, 0);
> > > + *
> > > + *		ap = devm_acquire_aperture(dev, base, size, &ap_funcs);
> > > + *		if (IS_ERR(ap))
> > > + *			return PTR_ERR(ap);
> > > + *
> > > + *		return 0;
> > > + *	}
> > > + *
> > > + *	static int probe(struct pci_dev *pdev)
> > > + *	{
> > > + *		struct drm_device *dev;
> > > + *		int ret;
> > > + *
> > > + *		// ... Initialize the device...
> > > + *		dev = devm_drm_dev_alloc();
> > > + *		...
> > > + *
> > > + *		// ... and acquire ownership of the framebuffer.
> > > + *		ret = acquire_framebuffers(dev, pdev);
> > > + *		if (ret)
> > > + *			return ret;
> > > + *
> > > + *		drm_dev_register();
> > > + *
> > > + *		return 0;
> > > + *	}
> > > + *
> > > + * The generic driver is now subject to forced removal by other drivers. This
> > > + * is when the detach function in struct &drm_aperture_funcs comes into play.
> > > + * When a driver calls drm_fb_helper_remove_conflicting_framebuffers() et al
> > > + * for the registered framebuffer range, the DRM core calls struct
> > > + * &drm_aperture_funcs.detach and the generic driver has to onload itself. It
> > > + * may not access the device's registers, framebuffer memory, ROM, etc after
> > > + * detach returned. If the driver supports hotplugging, detach can be treated
> > > + * like an unplug event.
> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *	static void detach_from_device(struct drm_device *dev,
> > > + *				       resource_size_t base,
> > > + *				       resource_size_t size)
> > > + *	{
> > > + *		// Signal unplug
> > > + *		drm_dev_unplug(dev);
> > > + *
> > > + *		// Maybe do other clean-up operations
> > > + *		...
> > > + *	}
> > > + *
> > > + *	static struct drm_aperture_funcs ap_funcs = {
> > > + *		.detach = detach_from_device,
> > > + *	};
> > > + */
> > > +
> > > +/**
> > > + * struct drm_aperture - Represents a DRM framebuffer aperture
> > > + *
> > > + * This structure has no public fields.
> > > + */
> > > +struct drm_aperture {
> > > +	struct drm_device *dev;
> > > +	resource_size_t base;
> > > +	resource_size_t size;
> > > +
> > > +	const struct drm_aperture_funcs *funcs;
> > > +
> > > +	struct list_head lh;
> > > +};
> > > +
> > > +static LIST_HEAD(drm_apertures);
> > > +
> > > +static DEFINE_MUTEX(drm_apertures_lock);
> > > +
> > > +static bool overlap(resource_size_t base1, resource_size_t end1,
> > > +		    resource_size_t base2, resource_size_t end2)
> > > +{
> > > +	return (base1 < end2) && (end1 > base2);
> > > +}
> > > +
> > > +static void devm_aperture_acquire_release(void *data)
> > > +{
> > > +	struct drm_aperture *ap = data;
> > > +	bool detached = !ap->dev;
> > > +
> > > +	if (!detached)
> > 
> > Uh this needs a comment that if ap->dev is NULL then we're called from
> > drm_aperture_detach_drivers() and hence the lock is already held.
> > 
> > > +		mutex_lock(&drm_apertures_lock);
> > 
> > and an
> > 
> > 	else
> > 		locdep_assert_held(&drm_apertures_lock);
> > 
> > here to check that. I was scratching my head first quite a bit how you'd
> > solve the deadlock, this is a neat solution (much simpler than anything I
> > came up with in my head). But needs comments.
> > 
> > > +
> > > +	list_del(&ap->lh);
> > > +
> > > +	if (!detached)
> > > +		mutex_unlock(&drm_apertures_lock);
> > > +}
> > > +
> > > +/**
> > > + * devm_aperture_acquire - Acquires ownership of a framebuffer on behalf of a DRM driver.
> > > + * @dev:	the DRM device to own the framebuffer memory
> > > + * @base:	the framebuffer's byte offset in physical memory
> > > + * @size:	the framebuffer size in bytes
> > > + * @funcs:	callback functions
> > > + *
> > > + * Installs the given device as the new owner. The function fails if the
> > > + * framebuffer range, or parts of it, is currently owned by another driver.
> > > + * To evict current owners, callers should use
> > > + * drm_fb_helper_remove_conflicting_framebuffers() et al. before calling this
> > > + * function. Acquired apertures are released automatically if the underlying
> > > + * device goes away.
> > > + *
> > > + * Returns:
> > > + * An instance of struct &drm_aperture on success, or a pointer-encoded
> > > + * errno value otherwise.
> > > + */
> > > +struct drm_aperture *
> > > +devm_aperture_acquire(struct drm_device *dev,
> > > +		      resource_size_t base, resource_size_t size,
> > > +		      const struct drm_aperture_funcs *funcs)
> > > +{
> > > +	size_t end = base + size;
> > > +	struct list_head *pos;
> > > +	struct drm_aperture *ap;
> > > +	int ret;
> > > +
> > > +	mutex_lock(&drm_apertures_lock);
> > > +
> > > +	list_for_each(pos, &drm_apertures) {
> > > +		ap = container_of(pos, struct drm_aperture, lh);
> > > +		if (overlap(base, end, ap->base, ap->base + ap->size))
> > > +			return ERR_PTR(-EBUSY);
> > > +	}
> > > +
> > > +	ap = devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
> > > +	if (!ap)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	ap->dev = dev;
> > > +	ap->base = base;
> > > +	ap->size = size;
> > > +	ap->funcs = funcs;
> > > +	INIT_LIST_HEAD(&ap->lh);
> > > +
> > > +	list_add(&ap->lh, &drm_apertures);
> > > +
> > > +	mutex_unlock(&drm_apertures_lock);
> > > +
> > > +	ret = devm_add_action_or_reset(dev->dev, devm_aperture_acquire_release, ap);
> > > +	if (ret)
> > > +		return ERR_PTR(ret);
> > > +
> > > +	return ap;
> > > +}
> > > +EXPORT_SYMBOL(devm_aperture_acquire);
> > > +
> > > +void drm_aperture_detach_drivers(resource_size_t base, resource_size_t size)
> > > +{
> > > +	resource_size_t end = base + size;
> > > +	struct list_head *pos, *n;
> > > +
> > > +	mutex_lock(&drm_apertures_lock);
> > > +
> > > +	list_for_each_safe(pos, n, &drm_apertures) {
> > > +		struct drm_aperture *ap =
> > > +			container_of(pos, struct drm_aperture, lh);
> > > +		struct drm_device *dev = ap->dev;
> > > +
> > > +		if (!overlap(base, end, ap->base, ap->base + ap->size))
> > > +			continue;
> > > +
> > > +		ap->dev = NULL; /* detach from device */
> > > +		if (drm_WARN_ON(dev, !ap->funcs->detach))
> > > +			continue;
> > > +		ap->funcs->detach(dev, ap->base, ap->size);
> > > +	}
> > > +
> > > +	mutex_unlock(&drm_apertures_lock);
> > > +}
> > > +EXPORT_SYMBOL(drm_aperture_detach_drivers);
> > 
> > Is this just exported because of the inline functions in the headers? Imo
> > better to make them proper functions (they're big after your patch&not
> > perf critical, so not good candidates for inlining anyway).
> > 
> > > diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
> > > index 13766efe9517..696cec75ef78 100644
> > > --- a/include/drm/drm_aperture.h
> > > +++ b/include/drm/drm_aperture.h
> > > @@ -4,8 +4,30 @@
> > >   #define _DRM_APERTURE_H_
> > >   #include <linux/fb.h>
> > > +#include <linux/pci.h>
> > >   #include <linux/vgaarb.h>
> > > +struct drm_aperture;
> > > +struct drm_device;
> > > +
> > > +struct drm_aperture_funcs {
> > > +	void (*detach)(struct drm_device *dev, resource_size_t base, resource_size_t size);
> > > +};
> > > +
> > > +struct drm_aperture *
> > > +devm_aperture_acquire(struct drm_device *dev,
> > > +		      resource_size_t base, resource_size_t size,
> > > +		      const struct drm_aperture_funcs *funcs);
> > > +
> > > +#if defined(CONFIG_DRM_APERTURE)
> > > +void drm_aperture_detach_drivers(resource_size_t base, resource_size_t size);
> > > +#else
> > > +static inline void
> > > +drm_aperture_detach_drivers(resource_size_t base, resource_size_t size)
> > > +{
> > > +}
> > > +#endif
> > > +
> > >   /**
> > >    * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-configured framebuffers
> > >    * @a: memory range, users of which are to be removed
> > > @@ -20,6 +42,11 @@ static inline int
> > >   drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
> > >   					      const char *name, bool primary)
> > >   {
> > > +	int i;
> > > +
> > > +	for (i = 0; i < a->count; ++i)
> > > +		drm_aperture_detach_drivers(a->ranges[i].base, a->ranges[i].size);
> > > +
> > >   #if IS_REACHABLE(CONFIG_FB)
> > >   	return remove_conflicting_framebuffers(a, name, primary);
> > >   #else
> > > @@ -43,7 +70,16 @@ static inline int
> > >   drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
> > >   						  const char *name)
> > >   {
> > > -	int ret = 0;
> > > +	resource_size_t base, size;
> > > +	int bar, ret = 0;
> > > +
> > > +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
> > > +		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
> > > +			continue;
> > > +		base = pci_resource_start(pdev, bar);
> > > +		size = pci_resource_len(pdev, bar);
> > > +		drm_aperture_detach_drivers(base, size);
> > > +	}
> > >   	/*
> > >   	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> > > -- 
> > > 2.30.1
> > > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N�rnberg, Germany
> (HRB 36809, AG N�rnberg)
> Gesch�ftsf�hrer: Felix Imend�rffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
