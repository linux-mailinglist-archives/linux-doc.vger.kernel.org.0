Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415243A7C83
	for <lists+linux-doc@lfdr.de>; Tue, 15 Jun 2021 12:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbhFOK47 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Jun 2021 06:56:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50247 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231609AbhFOK47 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Jun 2021 06:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623754494;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZqntZMQGa2bhFYJFHzlo20p/iZVUpQp6FB0MmKPlUSA=;
        b=ifyOloiuHCbq+xpaw0LoIbqY8F0AOWqOo059dbH8i6xzGPnkS/juz4Bk1XoP2hKLNf/WjX
        dbx5Is+a7SDxS3r3FYyTG8+wxqkyHsnvl33msT4gJYrRiBiCWoYH8B4ujLuzNML+KXng9R
        38l94gAFc15AA6X4l2eqBhFnD45kmdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-MzAsXP33NpemjdQ5dDKulw-1; Tue, 15 Jun 2021 06:54:51 -0400
X-MC-Unique: MzAsXP33NpemjdQ5dDKulw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFFEB10C1ADC;
        Tue, 15 Jun 2021 10:54:46 +0000 (UTC)
Received: from localhost (ovpn-113-156.ams2.redhat.com [10.36.113.156])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1010419C66;
        Tue, 15 Jun 2021 10:54:43 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Christoph Hellwig <hch@lst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Kirti Wankhede <kwankhede@nvidia.com>
Cc:     David Airlie <airlied@linux.ie>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Vasily Gorbik <gor@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        intel-gfx@lists.freedesktop.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-s390@vger.kernel.org, Halil Pasic <pasic@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 07/10] vfio/mdev: Allow the mdev_parent_ops to specify
 the device driver to bind
In-Reply-To: <20210614150846.4111871-8-hch@lst.de>
Organization: Red Hat GmbH
References: <20210614150846.4111871-1-hch@lst.de>
 <20210614150846.4111871-8-hch@lst.de>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date:   Tue, 15 Jun 2021 12:54:41 +0200
Message-ID: <875yyfxury.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 14 2021, Christoph Hellwig <hch@lst.de> wrote:

> From: Jason Gunthorpe <jgg@nvidia.com>
>
> This allows a mdev driver to opt out of using vfio_mdev.c, instead the
> driver will provide a 'struct mdev_driver' and register directly with the
> driver core.
>
> Much of mdev_parent_ops becomes unused in this mode:
> - create()/remove() are done via the mdev_driver probe()/remove()
> - mdev_attr_groups becomes mdev_driver driver.dev_groups
> - Wrapper function callbacks are replaced with the same ones from
>   struct vfio_device_ops
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/vfio/mdev/mdev_core.c   | 30 ++++++++++++++++++++++--------
>  drivers/vfio/mdev/mdev_driver.c | 10 ++++++++++
>  include/linux/mdev.h            |  2 ++
>  3 files changed, 34 insertions(+), 8 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

