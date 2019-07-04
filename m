Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA2265F546
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jul 2019 11:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfGDJPm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Jul 2019 05:15:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:47754 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727304AbfGDJPl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 4 Jul 2019 05:15:41 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jul 2019 02:15:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,450,1557212400"; 
   d="scan'208";a="169397368"
Received: from hao-dev.bj.intel.com (HELO localhost) ([10.238.157.65])
  by orsmga006.jf.intel.com with ESMTP; 04 Jul 2019 02:15:38 -0700
Date:   Thu, 4 Jul 2019 16:58:55 +0800
From:   Wu Hao <hao.wu@intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Moritz Fischer <mdf@kernel.org>, linux-fpga@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Zhang Yi Z <yi.z.zhang@intel.com>,
        Xu Yilun <yilun.xu@intel.com>, Alan Tull <atull@kernel.org>
Subject: Re: [PATCH 06/15] fpga: dfl: fme: add
 DFL_FPGA_FME_PORT_RELEASE/ASSIGN ioctl support.
Message-ID: <20190704085855.GB7391@hao-dev>
References: <20190628004951.6202-1-mdf@kernel.org>
 <20190628004951.6202-7-mdf@kernel.org>
 <20190703180753.GA24723@kroah.com>
 <20190703233058.GA15825@hao-dev>
 <20190704053927.GB347@kroah.com>
 <20190704063106.GA24777@hao-dev>
 <20190704082013.GE6438@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704082013.GE6438@kroah.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 04, 2019 at 10:20:13AM +0200, Greg KH wrote:
> On Thu, Jul 04, 2019 at 02:31:06PM +0800, Wu Hao wrote:
> > On Thu, Jul 04, 2019 at 07:39:27AM +0200, Greg KH wrote:
> > > On Thu, Jul 04, 2019 at 07:30:58AM +0800, Wu Hao wrote:
> > > > On Wed, Jul 03, 2019 at 08:07:53PM +0200, Greg KH wrote:
> > > > > On Thu, Jun 27, 2019 at 05:49:42PM -0700, Moritz Fischer wrote:
> > > > > > From: Wu Hao <hao.wu@intel.com>
> > > > > > 
> > > > > > In order to support virtualization usage via PCIe SRIOV, this patch
> > > > > > adds two ioctls under FPGA Management Engine (FME) to release and
> > > > > > assign back the port device. In order to safely turn Port from PF
> > > > > > into VF and enable PCIe SRIOV, it requires user to invoke this
> > > > > > PORT_RELEASE ioctl to release port firstly to remove userspace
> > > > > > interfaces, and then configure the PF/VF access register in FME.
> > > > > > After disable SRIOV, it requires user to invoke this PORT_ASSIGN
> > > > > > ioctl to attach the port back to PF.
> > > > > > 
> > > > > >  Ioctl interfaces:
> > > > > >  * DFL_FPGA_FME_PORT_RELEASE
> > > > > >    Release platform device of given port, it deletes port platform
> > > > > >    device to remove related userspace interfaces on PF, then
> > > > > >    configures PF/VF access mode to VF.
> > > > > > 
> > > > > >  * DFL_FPGA_FME_PORT_ASSIGN
> > > > > >    Assign platform device of given port back to PF, it configures
> > > > > >    PF/VF access mode to PF, then adds port platform device back to
> > > > > >    re-enable related userspace interfaces on PF.
> > > > > 
> > > > > Why are you not using the "generic" bind/unbind facility that userspace
> > > > > already has for this with binding drivers to devices?  Why a special
> > > > > ioctl?
> > > > 
> > > > Hi Greg,
> > > > 
> > > > Actually we think it should be safer that making the device invisble than
> > > > just unbinding its driver. Looks like user can try to rebind it at any
> > > > time and we don't have any method to stop them.
> > > 
> > > Why do you want to "stop" the user from doing something?  They asked to
> > > do it, why prevent it?  If they ask to do something foolish, well, they
> > > get to keep the pieces :)
> > 
> > Actually this is for SRIOV support, as we are moving FPGA accelerator from
> > PF to VF, so we don't want users to see the FPGA accelerator from PF any
> > more. We can't allow user to touch same FPGA accelerator from both PF and
> > VF side (it leads to hardware erros).
> 
> Ick, ok, this needs to be documented really well then.

Yes, we have add relateded descriptions for virtualization support in that
documentation patch.

[PATCH 05/15] Documentation: fpga: dfl: add descriptions for virtualization
and new interfaces.

> 
> > > > > > --- a/include/uapi/linux/fpga-dfl.h
> > > > > > +++ b/include/uapi/linux/fpga-dfl.h
> > > > > > @@ -176,4 +176,36 @@ struct dfl_fpga_fme_port_pr {
> > > > > >  
> > > > > >  #define DFL_FPGA_FME_PORT_PR	_IO(DFL_FPGA_MAGIC, DFL_FME_BASE + 0)
> > > > > >  
> > > > > > +/**
> > > > > > + * DFL_FPGA_FME_PORT_RELEASE - _IOW(DFL_FPGA_MAGIC, DFL_FME_BASE + 1,
> > > > > > + *					struct dfl_fpga_fme_port_release)
> > > > > > + *
> > > > > > + * Driver releases the port per Port ID provided by caller.
> > > > > > + * Return: 0 on success, -errno on failure.
> > > > > > + */
> > > > > > +struct dfl_fpga_fme_port_release {
> > > > > > +	/* Input */
> > > > > > +	__u32 argsz;		/* Structure length */
> > > > > > +	__u32 flags;		/* Zero for now */
> > > > > > +	__u32 port_id;
> > > > > > +};
> > > > > 
> > > > > meta-comment, why do all of your structures for ioctls have argsz?  You
> > > > > "know" the size of the structure already, it's part of the ioctl
> > > > > definition.  You shouldn't need to also set it again, right?  Otherwise
> > > > > ALL Linux ioctls would need something crazy like this.
> > > > 
> > > > Actually we followed the same method as vfio.
> > > 
> > > vfio is a protocol on "the wire", right?  Not an ioctl.
> > > 
> > > > The major purpose should be extendibility, as we really need this to
> > > > be sth long term maintainable.
> > > 
> > > You can't change ioctl structure sizes at any time.
> > > 
> > > > It really helps, if we add some new members for extentions/enhancement
> > > > under the same ioctl.
> > > 
> > > You don't do that.
> > > 
> > > > I don't think everybody needs this, but my consideration here is if
> > > > newer generations of hardware/specs come with some extentions, I still
> > > > hope we can resue these IOCTLs as much as we could, instead of
> > > > creating more new ones.
> > > 
> > > You create new ones, like everyone else does, as you can not change old
> > > code.  By trying to "version" structures like this, it's just going to
> > > be a nightmare.
> > 
> > Actually i learned this from vfio code here, it's not trying to "version"
> > structures, let me copy the comments from vfio header file. It should be
> > more clear than above short description from me.
> > 
> >  "include/uapi/linux/vfio.h"
> > 
> >  /*
> >   * The IOCTL interface is designed for extensibility by embedding the
> >   * structure length (argsz) and flags into structures passed between
> >   * kernel and userspace.  We therefore use the _IO() macro for these
> >   * defines to avoid implicitly embedding a size into the ioctl request.
> >   * As structure fields are added, argsz will increase to match and flag
> >   * bits will be defined to indicate additional fields with valid data.
> >   * It's *always* the caller's responsibility to indicate the size of
> >   * the structure passed by setting argsz appropriately.
> >   */
> > 
> >  For example.
> > 
> >  struct vfio_device_info {
> >         __u32   argsz;
> >         __u32   flags;
> >  #define VFIO_DEVICE_FLAGS_RESET (1 << 0)        /* Device supports reset */
> >  #define VFIO_DEVICE_FLAGS_PCI   (1 << 1)        /* vfio-pci device */
> >  #define VFIO_DEVICE_FLAGS_PLATFORM (1 << 2)     /* vfio-platform device */
> >  #define VFIO_DEVICE_FLAGS_AMBA  (1 << 3)        /* vfio-amba device */
> >  #define VFIO_DEVICE_FLAGS_CCW   (1 << 4)        /* vfio-ccw device */
> >  #define VFIO_DEVICE_FLAGS_AP    (1 << 5)        /* vfio-ap device */
> >         __u32   num_regions;    /* Max region index + 1 */
> >         __u32   num_irqs;       /* Max IRQ index + 1 */
> > 
> > Hope things could be more clear now. :)
> 
> That's nice for the vfio stuff, but you are just a "normal" driver here.
> You want an ioctl that just does one thing, no arguments, no flags, no
> anything.  No need for a size argument then at all.  These ioctls don't
> even need a structure for them!
> 
> Don't try to be fancy, it's not needed, it's not like you are running
> out of ioctl space...

Thanks a lot for the comments and suggestions.

That's true, it's a "normal" driver, maybe I overly considered the
extensibility of it. OK, Let me rework this patch to remove argsz from
these two ioctls.

What about the existing ioctls for this driver, they have argsz too.
shall I prepare another patch to remove them as well?

Hao

> 
> thanks,
> 
> greg k-h
