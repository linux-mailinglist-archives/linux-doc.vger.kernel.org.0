Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446EC3CD549
	for <lists+linux-doc@lfdr.de>; Mon, 19 Jul 2021 14:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237046AbhGSMSd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 19 Jul 2021 08:18:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27357 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236929AbhGSMSd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jul 2021 08:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626699552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VKwIMLtUIXWOUz6A0C/aORHBbla/m8gO1VhTe8hiVLQ=;
        b=VhE58UDZ6Ng5LpcEs0cOqVvMDFvjIPnM8hvVBv09ObeaE4KZcdE5RtlUX4YZ2tr5NSZxhP
        3F2lfSPtvJsZYl5ChgliV0dsJNAIX3dfqK1YjRT+EhLCTILMaNd/g8s2lUxk6nrAFWKu3A
        OdRynyH/bqneTVSvRiwVK8FihANQaTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-iJxOLEcHMM6NyTHoV8EorA-1; Mon, 19 Jul 2021 08:59:11 -0400
X-MC-Unique: iJxOLEcHMM6NyTHoV8EorA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 320731800D41;
        Mon, 19 Jul 2021 12:59:07 +0000 (UTC)
Received: from localhost (ovpn-112-158.ams2.redhat.com [10.36.112.158])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A6F715D6A1;
        Mon, 19 Jul 2021 12:58:59 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        Diana Craciun <diana.craciun@oss.nxp.com>,
        dri-devel@lists.freedesktop.org,
        Eric Auger <eric.auger@redhat.com>,
        Eric Farman <farman@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        intel-gfx@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
        linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>
Cc:     "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>,
        Leon Romanovsky <leonro@nvidia.com>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Yishai Hadas <yishaih@nvidia.com>
Subject: Re: [PATCH 03/13] vfio: Provide better generic support for
 open/release vfio_device_ops
In-Reply-To: <3-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
Organization: Red Hat GmbH
References: <3-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date:   Mon, 19 Jul 2021 14:58:58 +0200
Message-ID: <87wnpma299.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 14 2021, Jason Gunthorpe <jgg@nvidia.com> wrote:

> Currently the driver ops have an open/release pair that is called once
> each time a device FD is opened or closed. Add an additional set of
> open/close_device() ops which are called when the device FD is opened for
> the first time and closed for the last time.
>
> An analysis shows that all of the drivers require this semantic. Some are
> open coding it as part of their reflck implementation, and some are just
> buggy and miss it completely.
>
> To retain the current semantics PCI and FSL depend on, introduce the idea
> of a "device set" which is a grouping of vfio_device's that share the same
> lock around opening.
>
> The device set is established by providing a 'set_id' pointer. All
> vfio_device's that provide the same pointer will be joined to the same
> singleton memory and lock across the whole set. This effectively replaces
> the oddly named reflck.
>
> After conversion the set_id will be sourced from:
>  - A struct device from a fsl_mc_device (fsl)
>  - A struct pci_slot (pci)
>  - A struct pci_bus (pci)
>  - The struct vfio_device (everything)
>
> The design ensures that the above pointers are live as long as the
> vfio_device is registered, so they form reliable unique keys to group
> vfio_devices into sets.
>
> This implementation uses xarray instead of searching through the driver
> core structures, which simplifies the somewhat tricky locking in this
> area.
>
> Following patches convert all the drivers.
>
> Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/mdev/vfio_mdev.c |  22 ++++++
>  drivers/vfio/vfio.c           | 144 ++++++++++++++++++++++++++++------
>  include/linux/mdev.h          |   2 +
>  include/linux/vfio.h          |  19 +++++
>  4 files changed, 165 insertions(+), 22 deletions(-)
>

(...)

> @@ -760,6 +829,13 @@ int vfio_register_group_dev(struct vfio_device *device)
>  	struct iommu_group *iommu_group;
>  	struct vfio_group *group;
>  
> +	/*
> +	 * If the driver doesn't specify a set then the device is added to a
> +	 * signleton set just for itself.

s/signleton/singleton/

> +	 */
> +	if (!device->dev_set)
> +		vfio_assign_device_set(device, device);
> +
>  	iommu_group = iommu_group_get(device->dev);
>  	if (!iommu_group)
>  		return -EINVAL;
> @@ -1361,7 +1437,8 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
>  {
>  	struct vfio_device *device;
>  	struct file *filep;
> -	int ret;
> +	int fdno;
> +	int ret = 0;
>  
>  	if (0 == atomic_read(&group->container_users) ||
>  	    !group->container->iommu_driver || !vfio_group_viable(group))
> @@ -1375,38 +1452,38 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
>  		return PTR_ERR(device);
>  
>  	if (!try_module_get(device->dev->driver->owner)) {
> -		vfio_device_put(device);
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto err_device_put;
>  	}
>  
> -	ret = device->ops->open(device);
> -	if (ret) {
> -		module_put(device->dev->driver->owner);
> -		vfio_device_put(device);
> -		return ret;
> +	mutex_lock(&device->dev_set->lock);
> +	device->open_count++;
> +	if (device->open_count == 1 && device->ops->open_device) {
> +		ret = device->ops->open_device(device);
> +		if (ret)
> +			goto err_undo_count;

Won't that fail for mdev devices, until the patches later in this series
have been applied? (i.e. bad for bisect)

> +	}
> +	mutex_unlock(&device->dev_set->lock);
> +
> +	if (device->ops->open) {
> +		ret = device->ops->open(device);
> +		if (ret)
> +			goto err_close_device;
>  	}

