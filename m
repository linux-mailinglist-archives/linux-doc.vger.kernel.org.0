Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACC0552883
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jun 2022 02:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240353AbiFUAOh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Jun 2022 20:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241831AbiFUAOg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Jun 2022 20:14:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 369EC19286
        for <linux-doc@vger.kernel.org>; Mon, 20 Jun 2022 17:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655770471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YVrVeKPAQSI4AB4vZ7MyOJPPx0q5Q+PSH+24GSNfDdk=;
        b=AuB9LtRBzVHe4ONsU+OjiLEooVfZeGqG/wdPilMPon9xPjaAKs5fVmrZi5oFqdTY4VmbUQ
        B+HEDKpdhkm9/tez23xN4X3Ene3ctDs9qfuvFkM0RA6BLzJqybJoTAllJBXulgXDqBEtam
        O7zi5NO1q7Vzjp9Pmma4vEKUqSFXbus=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-IunaL_hUMAG9An4BVQTvZA-1; Mon, 20 Jun 2022 20:14:30 -0400
X-MC-Unique: IunaL_hUMAG9An4BVQTvZA-1
Received: by mail-wm1-f71.google.com with SMTP id n15-20020a05600c4f8f00b0039c3e76d646so5624681wmq.7
        for <linux-doc@vger.kernel.org>; Mon, 20 Jun 2022 17:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YVrVeKPAQSI4AB4vZ7MyOJPPx0q5Q+PSH+24GSNfDdk=;
        b=bSkOMSNnhccO2Cvk5GsV08DUPWvYRUdY9eLcEMxV1c5BCmoiyKaVTTEreg8fl1l4Sw
         9CZAOZph/HzN27+ibEQE2UAcAbVEN1aHlOdpma3TDmvae2Mf+OP0CCTajAysR1H4vy8T
         /GF0lpd/pCpS/ILsxJafdj711+STpbaxO/zX9KPWnpgiIDukZuw9a9xfuad8pgxW6QwR
         PaUShjn/QrUL6JvHjsAA1WpAwWmezx0+sNp2/xt5o8UZzIB3kplkpOulW3D2/CMjpt/8
         AMBvBae3ZrAgMUBifwTN4aqT/+GMAoQsRDpEs2GXq4a0jZpOjqCPWtt8JKTtb/DvkOpG
         VJTA==
X-Gm-Message-State: AOAM533sSq10gdb6mL9NFWYNCyEb+X7/TrFIiS8nrJD8c1c8aWm+Xzgt
        Ty8yszJutuT3iU4gPdYIGBdS/gAhsXjkSJE3jQYsdo7533jya8lU1QgNqREQwegIEpa2IQpSf0+
        1qbHW/Uj7ALD271B6ttew
X-Received: by 2002:a1c:7318:0:b0:39c:7ab9:934c with SMTP id d24-20020a1c7318000000b0039c7ab9934cmr37918726wmb.200.1655770469029;
        Mon, 20 Jun 2022 17:14:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+niHvOlBzhdAVy81+ewTZLfHJj94jM8s0LNLjY3ov8z2Zpwsyks99Njqzq1zWmToWQYxOWg==
X-Received: by 2002:a1c:7318:0:b0:39c:7ab9:934c with SMTP id d24-20020a1c7318000000b0039c7ab9934cmr37918708wmb.200.1655770468669;
        Mon, 20 Jun 2022 17:14:28 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y16-20020a5d6150000000b0021b932de5d6sm2877092wrt.39.2022.06.20.17.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 17:14:28 -0700 (PDT)
Message-ID: <e1fd76ae-a865-889f-b4f0-878c00837368@redhat.com>
Date:   Tue, 21 Jun 2022 02:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] drm: Implement DRM aperture helpers under video/
Content-Language: en-US
To:     Alex Williamson <alex.williamson@redhat.com>, corbet@lwn.net,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        deller@gmx.de, gregkh@linuxfoundation.org
Cc:     kvm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org
References: <165541020563.1955826.16350888595945658159.stgit@omen>
 <165541192621.1955826.6848784198896919390.stgit@omen>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <165541192621.1955826.6848784198896919390.stgit@omen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/16/22 22:38, Alex Williamson wrote:
> From: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Implement DRM's aperture helpers under video/ for sharing with other
> sub-systems. Remove DRM-isms from the interface. The helpers track
> the ownership of framebuffer apertures and provide hand-over from
> firmware, such as EFI and VESA, to native graphics drivers.
> 
> Other subsystems, such as fbdev and vfio, also have to maintain ownership
> of framebuffer apertures. Moving DRM's aperture helpers to a more public
> location allows all subsystems to interact with each other and share a
> common implementation.
> 
> The aperture helpers are selected by the various firmware drivers within
> DRM and fbdev, and the VGA text-console driver.
>

Thanks a lot for working on this.
 
> The original DRM interface is kept in place for use by DRM drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---

[...]

> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 427a993c7f57..c69b45f8c427 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -5,6 +5,12 @@
>  
>  menu "Graphics support"
>  
> +config APERTURE_HELPERS
> +	bool
> +	help
> +	  Support tracking and hand-over of aperture ownership. Required
> +	  for firmware graphics drivers.
> +

Maybe "graphics drivers using a firmware-provided framebuffer" is more clear?

[...]

> +++ b/drivers/video/aperture.c
> @@ -0,0 +1,340 @@
> +// SPDX-License-Identifier: MIT
> +
> +#include <linux/aperture.h>
> +#include <linux/device.h>
> +#include <linux/fb.h> /* for old fbdev helpers */
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/vgaarb.h>
> +
> +/**
> + * DOC: overview
> + *
> + * A graphics device might be supported by different drivers, but only one
> + * driver can be active at any given time. Many systems load a generic
> + * graphics drivers, such as EFI-GOP or VESA, early during the boot process.
> + * During later boot stages, they replace the generic driver with a dedicated,
> + * hardware-specific driver. To take over the device the dedicated driver
> + * first has to remove the generic driver. Aperture functions manage
> + * ownership of framebuffer memory and hand-over between drivers.
> + *
> + * Graphics drivers should call remove_conflicting_devices()
> + * at the top of their probe function. The function removes any generic
> + * driver that is currently associated with the given framebuffer memory.
> + * If the framebuffer is located at PCI BAR 0, the rsp code looks as in the

s/rsp/respective 

> + * example given below. The cod assumes a DRM driver.
> + *

s/cod/code

> + * .. code-block:: c
> + *
> + *	static const struct drm_driver example_driver = {
> + *		.name = "exampledrm",
> + *		...
> + *	};
> + *
> + *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
> + *	{
> + *		bool primary = false;
> + *		resource_size_t base, size;
> + *		int ret;
> + *
> + *		base = pci_resource_start(pdev, 0);
> + *		size = pci_resource_len(pdev, 0);
> + *	#ifdef CONFIG_X86
> + *		primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
> + *	#endif

This example seems to be copied from drivers/gpu/drm/ast/ast_drv.c and I
don't see any other driver that has its framebuffer located in PCI BAR 0
or at least having a similar code.

So I wonder if we really want to have this example for such a corner case ? 

Also, remove_conflicting_pci_framebuffers() seems to already at least check
for the IORESOURCE_ROM_SHADOW flag so it would be better to grow that and
support this special case of PCI BAR 0 (maybe adding another param that is
passed through remove_conflicting_pci_devices() ?

In any case, it seems to me that it is something that ast shouldn't really
have to open code it and instead the helpers should be fixed to cover that
case for drivers not to care. I would really not add the snippet in the doc.

Since we are talking about remove_conflicting_devices() here, a better code
example could be for a platform device instead of a PCI device, like this:

*	static const struct platform_driver example_driver = {
*		.name = "example",
*		...
*	};
*
*	static int probe(struct platform_device *pdev)
*	{
*		struct resource *mem;
*		resource_size_t base, size;
*
*		mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
*		if (!mem)
*			return -EINVAL;
*		base = mem->start;
*		size = resource_size(mem);
*
*		ret = remove_conflicting_devices(base, size, false, &example_driver->name);
*		if (ret)
*			return ret;
*
*		// ... and initialize the hardware.
*		...
*
*		return 0;
*	}

> + *	static int probe(struct pci_dev *pdev)
> + *	{
> + *		int ret;
> + *
> + *		// Remove any generic drivers...
> + *		ret = remove_conflicting_framebuffers(pdev);

And here we can just use remove_conflicting_pci_devices(pdev) without the
unnecessary level of indirection. It makes the example more clear IMO and
it could be moved as an example for the remove_conflicting_pci_devices().

Another option is to have here an example for platform devices instead of
a PCI device (and move this example when talking about remove

[...]

> + * PCI device drivers can also call remove_conflicting_pci_devices() and let the
> + * function detect the apertures automatically. Device drivers without knowledge of
> + * the framebuffer's location shall call remove_all_conflicting_devices(),
> + * which removes all known devices.
> + *

Can we get all the public aperture functions be in the aperture namespace? i.e:
aperture_remove_conflicting_devices(), aperture_remove_all_conflicting_devices()
and so on. That makes easier to grep, ftrace and also read the drivers' code.

> + * Drivers that are susceptible to being removed by other drivers, such as
> + * generic EFI or VESA drivers, have to register themselves as owners of their
> + * framebuffer apertures. Ownership of the framebuffer memory is achieved
> + * by calling devm_acquire_aperture_of_platform_device(). On success, the driver

AFAICT the aperture infrastructure only allows to remove platform devices, even
when it can check if the requested I/O resource overlaps with a PCI BAR range,
so maybe all functions also should use _platform_device() as suffix instead of
just _device() ? Or maybe the _platform is just verbose but I think that the
functions should be named consistently and only use either _device or _platform.

[...]

> + *	static int acquire_framebuffers(struct drm_device *dev, struct platform_device *pdev)
> + *	{
> + *		resource_size_t base, size;
> + *

This example is missing a struct resource *mem declaration.

> + * The generic driver is now subject to forced removal by other drivers. This
> + * only works for platform drivers that support hot unplugging.
> + * When a driver calls remove_conflicting_devices() et al
> + * for the registered framebuffer range, the aperture helpers call
> + * platform_device_unregister() and the generic driver unloads itself. It
> + * may not access the device's registers, framebuffer memory, ROM, etc
> + * afterwards.
> + */
> +
> +struct dev_aperture {
> +	struct device *dev;

And here we could just use a struct platform_device *pdev since currently we
only support platform devices. It seems to me that this is a DRM-ism that we
are carrying since for DRM drivers made sense to use struct device.

Doing that would also allow get rid of indirections like the need of both a
devm_acquire_aperture_of_platform_device() and devm_aperture_acquire() just
to do a &pdev->dev.

And also some to_platform_device() in drm_aperture_detach_firmware() and
detach_platform_device().

If we ever support non-platform devices then we can refactor it, but I don't
think that is worth to complicate just in case we ever support struct device.

> +	resource_size_t base;
> +	resource_size_t size;
> +	struct list_head lh;
> +	void (*detach)(struct device *dev);

Same here, just	void (*detach)(struct platform_device *pdev) if you agree with
that I mentioned above.

> +};
> +
> +static LIST_HEAD(apertures);
> +static DEFINE_MUTEX(apertures_lock);
> +
> +static bool overlap(resource_size_t base1, resource_size_t end1,
> +		    resource_size_t base2, resource_size_t end2)
> +{
> +	return (base1 < end2) && (end1 > base2);
> +}

There's a resource_overlaps() helper in include/linux/ioport.h, I wonder if it
could just be used, maybe declaring and filling a struct resource just to call
that helper. Later as an optimization a resource_range_overlap() or something
could be proposed for include/linux/ioport.h.

Also, I noticed that resource_overlaps() uses <= and >= but this helper uses
< and >. It seems there's an off-by-one error here but maybe I'm wrong on this.

[...]

> +static void detach_platform_device(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +
> +	/*
> +	 * Remove the device from the device hierarchy. This is the right thing
> +	 * to do for firmware-based DRM drivers, such as EFI, VESA or VGA. After
> +	 * the new driver takes over the hardware, the firmware device's state
> +	 * will be lost.
> +	 *
> +	 * For non-platform devices, a new callback would be required.
> +	 *

I wonder if we ever are going to need this. AFAICT the problem only happens for
platform devices. Or do you envision a case when some a bus could need this and
the aperture unregister the device instead of the Linux kernel device model ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

