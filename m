Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4564D3335CD
	for <lists+linux-doc@lfdr.de>; Wed, 10 Mar 2021 07:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbhCJGYq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Mar 2021 01:24:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:36786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232299AbhCJGYk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 10 Mar 2021 01:24:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C46AF64FE8;
        Wed, 10 Mar 2021 06:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615357479;
        bh=gN/UyopJfYDI1ugvGUMSUdpLzW66JmC3JP8K+pDV8cw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uzi7Qu5+1v6QHqTL0bKnHGoY/QnozE0d4Hdgb1QN6xo/qx7ewdvtgnc8LX61dvAHc
         c/NMDQ11KBYEJhRaDOV3OhbSrZXpeO4u/rGeeeaocBqyAbv8ceRRKrFGpU7HWPPdGj
         iR8QoRWBvlFIgM9csRaukJ1PNR80hnKLhsnns6XIZN92i6bZSMihW8+Eaukm4za+6B
         6xLSHHx95R7lDscN6TQNJBGanCTom6LWxhcsPaz4EOKjnfLAyhebJaea5MJL+rn1ip
         agAF1iTCuGYsHOtKc9ITo3tPT6uzqL5UAqJHyDk75AKu0yKEETM9njkWE3Ar5ZZnvY
         iHipYy1iP9JuQ==
Date:   Wed, 10 Mar 2021 08:24:35 +0200
From:   Leon Romanovsky <leon@kernel.org>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Diana Craciun <diana.craciun@oss.nxp.com>,
        Eric Auger <eric.auger@redhat.com>,
        KVM list <kvm@vger.kernel.org>,
        Kirti Wankhede <kwankhede@nvidia.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Raj, Ashok" <ashok.raj@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christoph Hellwig <hch@lst.de>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 08/10] vfio: Make vfio_device_ops pass a 'struct
 vfio_device *' instead of 'void *'
Message-ID: <YEhmI27kqo9CxcnZ@unreal>
References: <0-v1-7355d38b9344+17481-vfio1_jgg@nvidia.com>
 <8-v1-7355d38b9344+17481-vfio1_jgg@nvidia.com>
 <CAPcyv4hqALoBpH-yir4WNPj4+z1n-zj4o_6bfOMBRmd5sOCMNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4hqALoBpH-yir4WNPj4+z1n-zj4o_6bfOMBRmd5sOCMNw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 09, 2021 at 09:52:30PM -0800, Dan Williams wrote:
> On Tue, Mar 9, 2021 at 1:39 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > This is the standard kernel pattern, the ops associated with a struct get
> > the struct pointer in for typesafety. The expected design is to use
> > container_of to cleanly go from the subsystem level type to the driver
> > level type without having any type erasure in a void *.
>
> This patch alone is worth the price of admission.
>
> Seems like it would be worth adding
> to_vfio_{pci,platform,fsl_mc}_device() helpers in this patch as well.
>
> I've sometimes added runtime type safety to to_* helpers for early
> warning of mistakes that happen when refactoring...
>
> static inline struct vfio_pci_device *
> to_vfio_pci_device(struct vfio_device *core_dev)
> {
>         if (dev_WARN_ONCE(core_dev->dev, core_dev->ops != &vfio_pci_ops,
>                           "not a vfio_pci_device!\n"))
>                 return NULL;

I personally didn't see any bug related to the problem presented by you.
For this discussion let's assume that the extra check can be sometimes useful,
however the "return NULL" construction is extremely harmful. This requires callers
to check if it is not NULL, which is wrong for container_of(..) callers. Such checks
are sort of wrong assumptions later.

Just as an example of this bad behaviour, I have series in progress that fixes it:
https://elixir.bootlin.com/linux/v5.12-rc2/source/drivers/infiniband/hw/bnxt_re/ib_verbs.c#L1100
	srq = container_of(init_attr->srq, struct bnxt_re_srq, ib_srq);
	if (!srq) {
		ibdev_err(&rdev->ibdev, "SRQ not found");
		return -EINVAL;
	}

>         return container_of(core_vdev, struct vfio_pci_device, vdev);
> }
>
> ...but typed ops is already a significant idiomatic improvement.

Everything here is an improvement, in-kernel vfio implementation is too far
from canonical kernel code and I'm glad that Jason proposes way to improve
this situation.

Thanks

>
>
> >
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  Documentation/driver-api/vfio.rst            | 18 ++++----
> >  drivers/vfio/fsl-mc/vfio_fsl_mc.c            | 36 +++++++++------
> >  drivers/vfio/mdev/vfio_mdev.c                | 33 +++++++-------
> >  drivers/vfio/pci/vfio_pci.c                  | 47 ++++++++++++--------
> >  drivers/vfio/platform/vfio_platform_common.c | 33 ++++++++------
> >  drivers/vfio/vfio.c                          | 20 ++++-----
> >  include/linux/vfio.h                         | 16 +++----
> >  7 files changed, 117 insertions(+), 86 deletions(-)
> >
> > diff --git a/Documentation/driver-api/vfio.rst b/Documentation/driver-api/vfio.rst
> > index d3a02300913a7f..3337f337293a32 100644
> > --- a/Documentation/driver-api/vfio.rst
> > +++ b/Documentation/driver-api/vfio.rst
> > @@ -269,20 +269,22 @@ ready before calling it. The driver provides an ops structure for callbacks
> >  similar to a file operations structure::
> >
> >         struct vfio_device_ops {
> > -               int     (*open)(void *device_data);
> > -               void    (*release)(void *device_data);
> > -               ssize_t (*read)(void *device_data, char __user *buf,
> > +               int     (*open)(struct vfio_device *vdev);
> > +               void    (*release)(struct vfio_device *vdev);
> > +               ssize_t (*read)(struct vfio_device *vdev, char __user *buf,
> >                                 size_t count, loff_t *ppos);
> > -               ssize_t (*write)(void *device_data, const char __user *buf,
> > +               ssize_t (*write)(struct vfio_device *vdev,
> > +                                const char __user *buf,
> >                                  size_t size, loff_t *ppos);
> > -               long    (*ioctl)(void *device_data, unsigned int cmd,
> > +               long    (*ioctl)(struct vfio_device *vdev, unsigned int cmd,
> >                                  unsigned long arg);
> > -               int     (*mmap)(void *device_data, struct vm_area_struct *vma);
> > +               int     (*mmap)(struct vfio_device *vdev,
> > +                               struct vm_area_struct *vma);
> >         };
> >
> > -Each function is passed the device_data that was originally registered
> > +Each function is passed the vdev that was originally registered
> >  in the vfio_register_group_dev() call above.  This allows the bus driver
> > -an easy place to store its opaque, private data.  The open/release
> > +to obtain its private data using container_of().  The open/release
> >  callbacks are issued when a new file descriptor is created for a
> >  device (via VFIO_GROUP_GET_DEVICE_FD).  The ioctl interface provides
> >  a direct pass through for VFIO_DEVICE_* ioctls.  The read/write/mmap
> > diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> > index ddee6ed20c4523..74a5de1b791934 100644
> > --- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> > +++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> > @@ -135,9 +135,10 @@ static void vfio_fsl_mc_regions_cleanup(struct vfio_fsl_mc_device *vdev)
> >         kfree(vdev->regions);
> >  }
> >
> > -static int vfio_fsl_mc_open(void *device_data)
> > +static int vfio_fsl_mc_open(struct vfio_device *core_vdev)
> >  {
> > -       struct vfio_fsl_mc_device *vdev = device_data;
> > +       struct vfio_fsl_mc_device *vdev =
> > +               container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
> >         int ret;
> >
> >         if (!try_module_get(THIS_MODULE))
> > @@ -161,9 +162,10 @@ static int vfio_fsl_mc_open(void *device_data)
> >         return ret;
> >  }
> >
> > -static void vfio_fsl_mc_release(void *device_data)
> > +static void vfio_fsl_mc_release(struct vfio_device *core_vdev)
> >  {
> > -       struct vfio_fsl_mc_device *vdev = device_data;
> > +       struct vfio_fsl_mc_device *vdev =
> > +               container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
> >         int ret;
> >
> >         mutex_lock(&vdev->reflck->lock);
> > @@ -197,11 +199,12 @@ static void vfio_fsl_mc_release(void *device_data)
> >         module_put(THIS_MODULE);
> >  }
> >
> > -static long vfio_fsl_mc_ioctl(void *device_data, unsigned int cmd,
> > -                             unsigned long arg)
> > +static long vfio_fsl_mc_ioctl(struct vfio_device *core_vdev,
> > +                             unsigned int cmd, unsigned long arg)
> >  {
> >         unsigned long minsz;
> > -       struct vfio_fsl_mc_device *vdev = device_data;
> > +       struct vfio_fsl_mc_device *vdev =
> > +               container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
> >         struct fsl_mc_device *mc_dev = vdev->mc_dev;
> >
> >         switch (cmd) {
> > @@ -327,10 +330,11 @@ static long vfio_fsl_mc_ioctl(void *device_data, unsigned int cmd,
> >         }
> >  }
> >
> > -static ssize_t vfio_fsl_mc_read(void *device_data, char __user *buf,
> > +static ssize_t vfio_fsl_mc_read(struct vfio_device *core_vdev, char __user *buf,
> >                                 size_t count, loff_t *ppos)
> >  {
> > -       struct vfio_fsl_mc_device *vdev = device_data;
> > +       struct vfio_fsl_mc_device *vdev =
> > +               container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
> >         unsigned int index = VFIO_FSL_MC_OFFSET_TO_INDEX(*ppos);
> >         loff_t off = *ppos & VFIO_FSL_MC_OFFSET_MASK;
> >         struct fsl_mc_device *mc_dev = vdev->mc_dev;
> > @@ -404,10 +408,12 @@ static int vfio_fsl_mc_send_command(void __iomem *ioaddr, uint64_t *cmd_data)
> >         return 0;
> >  }
> >
> > -static ssize_t vfio_fsl_mc_write(void *device_data, const char __user *buf,
> > -                                size_t count, loff_t *ppos)
> > +static ssize_t vfio_fsl_mc_write(struct vfio_device *core_vdev,
> > +                                const char __user *buf, size_t count,
> > +                                loff_t *ppos)
> >  {
> > -       struct vfio_fsl_mc_device *vdev = device_data;
> > +       struct vfio_fsl_mc_device *vdev =
> > +               container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
> >         unsigned int index = VFIO_FSL_MC_OFFSET_TO_INDEX(*ppos);
> >         loff_t off = *ppos & VFIO_FSL_MC_OFFSET_MASK;
> >         struct fsl_mc_device *mc_dev = vdev->mc_dev;
> > @@ -468,9 +474,11 @@ static int vfio_fsl_mc_mmap_mmio(struct vfio_fsl_mc_region region,
> >                                size, vma->vm_page_prot);
> >  }
> >
> > -static int vfio_fsl_mc_mmap(void *device_data, struct vm_area_struct *vma)
> > +static int vfio_fsl_mc_mmap(struct vfio_device *core_vdev,
> > +                           struct vm_area_struct *vma)
> >  {
> > -       struct vfio_fsl_mc_device *vdev = device_data;
> > +       struct vfio_fsl_mc_device *vdev =
> > +               container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
> >         struct fsl_mc_device *mc_dev = vdev->mc_dev;
> >         unsigned int index;
> >
> > diff --git a/drivers/vfio/mdev/vfio_mdev.c b/drivers/vfio/mdev/vfio_mdev.c
> > index 4469aaf31b56cb..e7309caa99c71b 100644
> > --- a/drivers/vfio/mdev/vfio_mdev.c
> > +++ b/drivers/vfio/mdev/vfio_mdev.c
> > @@ -25,10 +25,11 @@ struct mdev_vfio_device {
> >         struct vfio_device vdev;
> >  };
> >
> > -static int vfio_mdev_open(void *device_data)
> > +static int vfio_mdev_open(struct vfio_device *core_vdev)
> >  {
> > -       struct mdev_device *mdev = device_data;
> > +       struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
> >         struct mdev_parent *parent = mdev->parent;
> > +
> >         int ret;
> >
> >         if (unlikely(!parent->ops->open))
> > @@ -44,9 +45,9 @@ static int vfio_mdev_open(void *device_data)
> >         return ret;
> >  }
> >
> > -static void vfio_mdev_release(void *device_data)
> > +static void vfio_mdev_release(struct vfio_device *core_vdev)
> >  {
> > -       struct mdev_device *mdev = device_data;
> > +       struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
> >         struct mdev_parent *parent = mdev->parent;
> >
> >         if (likely(parent->ops->release))
> > @@ -55,10 +56,10 @@ static void vfio_mdev_release(void *device_data)
> >         module_put(THIS_MODULE);
> >  }
> >
> > -static long vfio_mdev_unlocked_ioctl(void *device_data,
> > +static long vfio_mdev_unlocked_ioctl(struct vfio_device *core_vdev,
> >                                      unsigned int cmd, unsigned long arg)
> >  {
> > -       struct mdev_device *mdev = device_data;
> > +       struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
> >         struct mdev_parent *parent = mdev->parent;
> >
> >         if (unlikely(!parent->ops->ioctl))
> > @@ -67,10 +68,10 @@ static long vfio_mdev_unlocked_ioctl(void *device_data,
> >         return parent->ops->ioctl(mdev, cmd, arg);
> >  }
> >
> > -static ssize_t vfio_mdev_read(void *device_data, char __user *buf,
> > +static ssize_t vfio_mdev_read(struct vfio_device *core_vdev, char __user *buf,
> >                               size_t count, loff_t *ppos)
> >  {
> > -       struct mdev_device *mdev = device_data;
> > +       struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
> >         struct mdev_parent *parent = mdev->parent;
> >
> >         if (unlikely(!parent->ops->read))
> > @@ -79,10 +80,11 @@ static ssize_t vfio_mdev_read(void *device_data, char __user *buf,
> >         return parent->ops->read(mdev, buf, count, ppos);
> >  }
> >
> > -static ssize_t vfio_mdev_write(void *device_data, const char __user *buf,
> > -                              size_t count, loff_t *ppos)
> > +static ssize_t vfio_mdev_write(struct vfio_device *core_vdev,
> > +                              const char __user *buf, size_t count,
> > +                              loff_t *ppos)
> >  {
> > -       struct mdev_device *mdev = device_data;
> > +       struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
> >         struct mdev_parent *parent = mdev->parent;
> >
> >         if (unlikely(!parent->ops->write))
> > @@ -91,9 +93,10 @@ static ssize_t vfio_mdev_write(void *device_data, const char __user *buf,
> >         return parent->ops->write(mdev, buf, count, ppos);
> >  }
> >
> > -static int vfio_mdev_mmap(void *device_data, struct vm_area_struct *vma)
> > +static int vfio_mdev_mmap(struct vfio_device *core_vdev,
> > +                         struct vm_area_struct *vma)
> >  {
> > -       struct mdev_device *mdev = device_data;
> > +       struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
> >         struct mdev_parent *parent = mdev->parent;
> >
> >         if (unlikely(!parent->ops->mmap))
> > @@ -102,9 +105,9 @@ static int vfio_mdev_mmap(void *device_data, struct vm_area_struct *vma)
> >         return parent->ops->mmap(mdev, vma);
> >  }
> >
> > -static void vfio_mdev_request(void *device_data, unsigned int count)
> > +static void vfio_mdev_request(struct vfio_device *core_vdev, unsigned int count)
> >  {
> > -       struct mdev_device *mdev = device_data;
> > +       struct mdev_device *mdev = to_mdev_device(core_vdev->dev);
> >         struct mdev_parent *parent = mdev->parent;
> >
> >         if (parent->ops->request)
> > diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> > index fae573c6f86bdf..af5696a96a76e0 100644
> > --- a/drivers/vfio/pci/vfio_pci.c
> > +++ b/drivers/vfio/pci/vfio_pci.c
> > @@ -553,9 +553,10 @@ static void vfio_pci_vf_token_user_add(struct vfio_pci_device *vdev, int val)
> >         vfio_device_put(pf_dev);
> >  }
> >
> > -static void vfio_pci_release(void *device_data)
> > +static void vfio_pci_release(struct vfio_device *core_vdev)
> >  {
> > -       struct vfio_pci_device *vdev = device_data;
> > +       struct vfio_pci_device *vdev =
> > +               container_of(core_vdev, struct vfio_pci_device, vdev);
> >
> >         mutex_lock(&vdev->reflck->lock);
> >
> > @@ -581,9 +582,10 @@ static void vfio_pci_release(void *device_data)
> >         module_put(THIS_MODULE);
> >  }
> >
> > -static int vfio_pci_open(void *device_data)
> > +static int vfio_pci_open(struct vfio_device *core_vdev)
> >  {
> > -       struct vfio_pci_device *vdev = device_data;
> > +       struct vfio_pci_device *vdev =
> > +               container_of(core_vdev, struct vfio_pci_device, vdev);
> >         int ret = 0;
> >
> >         if (!try_module_get(THIS_MODULE))
> > @@ -797,10 +799,11 @@ struct vfio_devices {
> >         int max_index;
> >  };
> >
> > -static long vfio_pci_ioctl(void *device_data,
> > +static long vfio_pci_ioctl(struct vfio_device *core_vdev,
> >                            unsigned int cmd, unsigned long arg)
> >  {
> > -       struct vfio_pci_device *vdev = device_data;
> > +       struct vfio_pci_device *vdev =
> > +               container_of(core_vdev, struct vfio_pci_device, vdev);
> >         unsigned long minsz;
> >
> >         if (cmd == VFIO_DEVICE_GET_INFO) {
> > @@ -1402,11 +1405,10 @@ static long vfio_pci_ioctl(void *device_data,
> >         return -ENOTTY;
> >  }
> >
> > -static ssize_t vfio_pci_rw(void *device_data, char __user *buf,
> > +static ssize_t vfio_pci_rw(struct vfio_pci_device *vdev, char __user *buf,
> >                            size_t count, loff_t *ppos, bool iswrite)
> >  {
> >         unsigned int index = VFIO_PCI_OFFSET_TO_INDEX(*ppos);
> > -       struct vfio_pci_device *vdev = device_data;
> >
> >         if (index >= VFIO_PCI_NUM_REGIONS + vdev->num_regions)
> >                 return -EINVAL;
> > @@ -1434,22 +1436,28 @@ static ssize_t vfio_pci_rw(void *device_data, char __user *buf,
> >         return -EINVAL;
> >  }
> >
> > -static ssize_t vfio_pci_read(void *device_data, char __user *buf,
> > +static ssize_t vfio_pci_read(struct vfio_device *core_vdev, char __user *buf,
> >                              size_t count, loff_t *ppos)
> >  {
> > +       struct vfio_pci_device *vdev =
> > +               container_of(core_vdev, struct vfio_pci_device, vdev);
> > +
> >         if (!count)
> >                 return 0;
> >
> > -       return vfio_pci_rw(device_data, buf, count, ppos, false);
> > +       return vfio_pci_rw(vdev, buf, count, ppos, false);
> >  }
> >
> > -static ssize_t vfio_pci_write(void *device_data, const char __user *buf,
> > +static ssize_t vfio_pci_write(struct vfio_device *core_vdev, const char __user *buf,
> >                               size_t count, loff_t *ppos)
> >  {
> > +       struct vfio_pci_device *vdev =
> > +               container_of(core_vdev, struct vfio_pci_device, vdev);
> > +
> >         if (!count)
> >                 return 0;
> >
> > -       return vfio_pci_rw(device_data, (char __user *)buf, count, ppos, true);
> > +       return vfio_pci_rw(vdev, (char __user *)buf, count, ppos, true);
> >  }
> >
> >  /* Return 1 on zap and vma_lock acquired, 0 on contention (only with @try) */
> > @@ -1646,9 +1654,10 @@ static const struct vm_operations_struct vfio_pci_mmap_ops = {
> >         .fault = vfio_pci_mmap_fault,
> >  };
> >
> > -static int vfio_pci_mmap(void *device_data, struct vm_area_struct *vma)
> > +static int vfio_pci_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma)
> >  {
> > -       struct vfio_pci_device *vdev = device_data;
> > +       struct vfio_pci_device *vdev =
> > +               container_of(core_vdev, struct vfio_pci_device, vdev);
> >         struct pci_dev *pdev = vdev->pdev;
> >         unsigned int index;
> >         u64 phys_len, req_len, pgoff, req_start;
> > @@ -1714,9 +1723,10 @@ static int vfio_pci_mmap(void *device_data, struct vm_area_struct *vma)
> >         return 0;
> >  }
> >
> > -static void vfio_pci_request(void *device_data, unsigned int count)
> > +static void vfio_pci_request(struct vfio_device *core_vdev, unsigned int count)
> >  {
> > -       struct vfio_pci_device *vdev = device_data;
> > +       struct vfio_pci_device *vdev =
> > +               container_of(core_vdev, struct vfio_pci_device, vdev);
> >         struct pci_dev *pdev = vdev->pdev;
> >
> >         mutex_lock(&vdev->igate);
> > @@ -1830,9 +1840,10 @@ static int vfio_pci_validate_vf_token(struct vfio_pci_device *vdev,
> >
> >  #define VF_TOKEN_ARG "vf_token="
> >
> > -static int vfio_pci_match(void *device_data, char *buf)
> > +static int vfio_pci_match(struct vfio_device *core_vdev, char *buf)
> >  {
> > -       struct vfio_pci_device *vdev = device_data;
> > +       struct vfio_pci_device *vdev =
> > +               container_of(core_vdev, struct vfio_pci_device, vdev);
> >         bool vf_token = false;
> >         uuid_t uuid;
> >         int ret;
> > diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
> > index 6eb749250ee41c..f5f6b537084a67 100644
> > --- a/drivers/vfio/platform/vfio_platform_common.c
> > +++ b/drivers/vfio/platform/vfio_platform_common.c
> > @@ -218,9 +218,10 @@ static int vfio_platform_call_reset(struct vfio_platform_device *vdev,
> >         return -EINVAL;
> >  }
> >
> > -static void vfio_platform_release(void *device_data)
> > +static void vfio_platform_release(struct vfio_device *core_vdev)
> >  {
> > -       struct vfio_platform_device *vdev = device_data;
> > +       struct vfio_platform_device *vdev =
> > +               container_of(core_vdev, struct vfio_platform_device, vdev);
> >
> >         mutex_lock(&driver_lock);
> >
> > @@ -244,9 +245,10 @@ static void vfio_platform_release(void *device_data)
> >         module_put(vdev->parent_module);
> >  }
> >
> > -static int vfio_platform_open(void *device_data)
> > +static int vfio_platform_open(struct vfio_device *core_vdev)
> >  {
> > -       struct vfio_platform_device *vdev = device_data;
> > +       struct vfio_platform_device *vdev =
> > +               container_of(core_vdev, struct vfio_platform_device, vdev);
> >         int ret;
> >
> >         if (!try_module_get(vdev->parent_module))
> > @@ -293,10 +295,12 @@ static int vfio_platform_open(void *device_data)
> >         return ret;
> >  }
> >
> > -static long vfio_platform_ioctl(void *device_data,
> > +static long vfio_platform_ioctl(struct vfio_device *core_vdev,
> >                                 unsigned int cmd, unsigned long arg)
> >  {
> > -       struct vfio_platform_device *vdev = device_data;
> > +       struct vfio_platform_device *vdev =
> > +               container_of(core_vdev, struct vfio_platform_device, vdev);
> > +
> >         unsigned long minsz;
> >
> >         if (cmd == VFIO_DEVICE_GET_INFO) {
> > @@ -455,10 +459,11 @@ static ssize_t vfio_platform_read_mmio(struct vfio_platform_region *reg,
> >         return -EFAULT;
> >  }
> >
> > -static ssize_t vfio_platform_read(void *device_data, char __user *buf,
> > -                                 size_t count, loff_t *ppos)
> > +static ssize_t vfio_platform_read(struct vfio_device *core_vdev,
> > +                                 char __user *buf, size_t count, loff_t *ppos)
> >  {
> > -       struct vfio_platform_device *vdev = device_data;
> > +       struct vfio_platform_device *vdev =
> > +               container_of(core_vdev, struct vfio_platform_device, vdev);
> >         unsigned int index = VFIO_PLATFORM_OFFSET_TO_INDEX(*ppos);
> >         loff_t off = *ppos & VFIO_PLATFORM_OFFSET_MASK;
> >
> > @@ -531,10 +536,11 @@ static ssize_t vfio_platform_write_mmio(struct vfio_platform_region *reg,
> >         return -EFAULT;
> >  }
> >
> > -static ssize_t vfio_platform_write(void *device_data, const char __user *buf,
> > +static ssize_t vfio_platform_write(struct vfio_device *core_vdev, const char __user *buf,
> >                                    size_t count, loff_t *ppos)
> >  {
> > -       struct vfio_platform_device *vdev = device_data;
> > +       struct vfio_platform_device *vdev =
> > +               container_of(core_vdev, struct vfio_platform_device, vdev);
> >         unsigned int index = VFIO_PLATFORM_OFFSET_TO_INDEX(*ppos);
> >         loff_t off = *ppos & VFIO_PLATFORM_OFFSET_MASK;
> >
> > @@ -573,9 +579,10 @@ static int vfio_platform_mmap_mmio(struct vfio_platform_region region,
> >                                req_len, vma->vm_page_prot);
> >  }
> >
> > -static int vfio_platform_mmap(void *device_data, struct vm_area_struct *vma)
> > +static int vfio_platform_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma)
> >  {
> > -       struct vfio_platform_device *vdev = device_data;
> > +       struct vfio_platform_device *vdev =
> > +               container_of(core_vdev, struct vfio_platform_device, vdev);
> >         unsigned int index;
> >
> >         index = vma->vm_pgoff >> (VFIO_PLATFORM_OFFSET_SHIFT - PAGE_SHIFT);
> > diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> > index 2d6d7cc1d1ebf9..01de47d1810b6b 100644
> > --- a/drivers/vfio/vfio.c
> > +++ b/drivers/vfio/vfio.c
> > @@ -832,7 +832,7 @@ static struct vfio_device *vfio_device_get_from_name(struct vfio_group *group,
> >                 int ret;
> >
> >                 if (it->ops->match) {
> > -                       ret = it->ops->match(it->device_data, buf);
> > +                       ret = it->ops->match(it, buf);
> >                         if (ret < 0) {
> >                                 device = ERR_PTR(ret);
> >                                 break;
> > @@ -893,7 +893,7 @@ void vfio_unregister_group_dev(struct vfio_device *device)
> >         rc = try_wait_for_completion(&device->comp);
> >         while (rc <= 0) {
> >                 if (device->ops->request)
> > -                       device->ops->request(device->device_data, i++);
> > +                       device->ops->request(device, i++);
> >
> >                 if (interrupted) {
> >                         rc = wait_for_completion_timeout(&device->comp,
> > @@ -1379,7 +1379,7 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
> >         if (IS_ERR(device))
> >                 return PTR_ERR(device);
> >
> > -       ret = device->ops->open(device->device_data);
> > +       ret = device->ops->open(device);
> >         if (ret) {
> >                 vfio_device_put(device);
> >                 return ret;
> > @@ -1391,7 +1391,7 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
> >          */
> >         ret = get_unused_fd_flags(O_CLOEXEC);
> >         if (ret < 0) {
> > -               device->ops->release(device->device_data);
> > +               device->ops->release(device);
> >                 vfio_device_put(device);
> >                 return ret;
> >         }
> > @@ -1401,7 +1401,7 @@ static int vfio_group_get_device_fd(struct vfio_group *group, char *buf)
> >         if (IS_ERR(filep)) {
> >                 put_unused_fd(ret);
> >                 ret = PTR_ERR(filep);
> > -               device->ops->release(device->device_data);
> > +               device->ops->release(device);
> >                 vfio_device_put(device);
> >                 return ret;
> >         }
> > @@ -1558,7 +1558,7 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
> >  {
> >         struct vfio_device *device = filep->private_data;
> >
> > -       device->ops->release(device->device_data);
> > +       device->ops->release(device);
> >
> >         vfio_group_try_dissolve_container(device->group);
> >
> > @@ -1575,7 +1575,7 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
> >         if (unlikely(!device->ops->ioctl))
> >                 return -EINVAL;
> >
> > -       return device->ops->ioctl(device->device_data, cmd, arg);
> > +       return device->ops->ioctl(device, cmd, arg);
> >  }
> >
> >  static ssize_t vfio_device_fops_read(struct file *filep, char __user *buf,
> > @@ -1586,7 +1586,7 @@ static ssize_t vfio_device_fops_read(struct file *filep, char __user *buf,
> >         if (unlikely(!device->ops->read))
> >                 return -EINVAL;
> >
> > -       return device->ops->read(device->device_data, buf, count, ppos);
> > +       return device->ops->read(device, buf, count, ppos);
> >  }
> >
> >  static ssize_t vfio_device_fops_write(struct file *filep,
> > @@ -1598,7 +1598,7 @@ static ssize_t vfio_device_fops_write(struct file *filep,
> >         if (unlikely(!device->ops->write))
> >                 return -EINVAL;
> >
> > -       return device->ops->write(device->device_data, buf, count, ppos);
> > +       return device->ops->write(device, buf, count, ppos);
> >  }
> >
> >  static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
> > @@ -1608,7 +1608,7 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
> >         if (unlikely(!device->ops->mmap))
> >                 return -EINVAL;
> >
> > -       return device->ops->mmap(device->device_data, vma);
> > +       return device->ops->mmap(device, vma);
> >  }
> >
> >  static const struct file_operations vfio_device_fops = {
> > diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> > index 4995faf51efeae..784c34c0a28763 100644
> > --- a/include/linux/vfio.h
> > +++ b/include/linux/vfio.h
> > @@ -44,17 +44,17 @@ struct vfio_device {
> >   */
> >  struct vfio_device_ops {
> >         char    *name;
> > -       int     (*open)(void *device_data);
> > -       void    (*release)(void *device_data);
> > -       ssize_t (*read)(void *device_data, char __user *buf,
> > +       int     (*open)(struct vfio_device *vdev);
> > +       void    (*release)(struct vfio_device *vdev);
> > +       ssize_t (*read)(struct vfio_device *vdev, char __user *buf,
> >                         size_t count, loff_t *ppos);
> > -       ssize_t (*write)(void *device_data, const char __user *buf,
> > +       ssize_t (*write)(struct vfio_device *vdev, const char __user *buf,
> >                          size_t count, loff_t *size);
> > -       long    (*ioctl)(void *device_data, unsigned int cmd,
> > +       long    (*ioctl)(struct vfio_device *vdev, unsigned int cmd,
> >                          unsigned long arg);
> > -       int     (*mmap)(void *device_data, struct vm_area_struct *vma);
> > -       void    (*request)(void *device_data, unsigned int count);
> > -       int     (*match)(void *device_data, char *buf);
> > +       int     (*mmap)(struct vfio_device *vdev, struct vm_area_struct *vma);
> > +       void    (*request)(struct vfio_device *vdev, unsigned int count);
> > +       int     (*match)(struct vfio_device *vdev, char *buf);
> >  };
> >
> >  extern struct iommu_group *vfio_iommu_group_get(struct device *dev);
> > --
> > 2.30.1
> >
