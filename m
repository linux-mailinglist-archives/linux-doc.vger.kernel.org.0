Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEB03E8EC5
	for <lists+linux-doc@lfdr.de>; Wed, 11 Aug 2021 12:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237154AbhHKKdp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Aug 2021 06:33:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36097 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237116AbhHKKdo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Aug 2021 06:33:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628678001;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FClcYxsTNaJelqEsbQtnRJdqr/jkyNvyq3Av2pw8Tzg=;
        b=MaYQUXaAZRD3/gUfAAnZNFVEwTdvSoE8L4Yfu8MlI79Q0fb2oihheet6wx9RusF1M5MmiH
        sRHpbaF018bhHjfJgPhD6jDbfGubv7adpxrnx45kLkXOXuBQDtvtf/CgkTv/dD2eL8uGKF
        XmX2YxL1mOtHF2TbJuqYO3oy7/BYNrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-n3jWRGIjODO2LnxMXrJU7g-1; Wed, 11 Aug 2021 06:33:20 -0400
X-MC-Unique: n3jWRGIjODO2LnxMXrJU7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E6DC1008062;
        Wed, 11 Aug 2021 10:33:16 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C56495C25A;
        Wed, 11 Aug 2021 10:33:02 +0000 (UTC)
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
        Zhi Wang <zhi.a.wang@intel.com>
Cc:     "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>,
        Leon Romanovsky <leonro@nvidia.com>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Yishai Hadas <yishaih@nvidia.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v4 10/14] vfio/pci: Reorganize VFIO_DEVICE_PCI_HOT_RESET
 to use the device set
In-Reply-To: <10-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
Organization: Red Hat GmbH
References: <10-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date:   Wed, 11 Aug 2021 12:33:01 +0200
Message-ID: <87tujwuv8i.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 05 2021, Jason Gunthorpe <jgg@nvidia.com> wrote:

> Like vfio_pci_dev_set_try_reset() this code wants to reset all of the
> devices in the "reset group" which is the same membership as the device
> set.
>
> Instead of trying to reconstruct the device set from the PCI list go
> directly from the device set's device list to execute the reset.
>
> The same basic structure as vfio_pci_dev_set_try_reset() is used. The
> 'vfio_devices' struct is replaced with the device set linked list and we
> simply sweep it multiple times under the lock.
>
> This eliminates a memory allocation and get/put traffic and another
> improperly locked test of pci_dev_driver().
>
> Reviewed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci.c | 213 +++++++++++++++---------------------
>  1 file changed, 89 insertions(+), 124 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

