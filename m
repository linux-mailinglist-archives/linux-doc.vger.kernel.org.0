Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C9847C0BC
	for <lists+linux-doc@lfdr.de>; Tue, 21 Dec 2021 14:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238179AbhLUN1w (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 21 Dec 2021 08:27:52 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:39516 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbhLUN1w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Dec 2021 08:27:52 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A75B46153D;
        Tue, 21 Dec 2021 13:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC05C36AE2;
        Tue, 21 Dec 2021 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640093271;
        bh=qIV2JuUxfF7xJJPGRdU2Ofbb0Jt/ccEkhwRt67mWhtA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nn1GwUZD9dPkCCIjPEbrMIjflC1lILY0GFKLbBXxHDJEzabL/545hnlz78RApptHW
         7+Y3PUAZGsymJ9Pqj4DRi28RhJwimfvStg7ChDXwn8WaDlBYLo0GHYEaiqE1GaGKNj
         l0m7a7qLp6ulB0l+wJX09sM4X2hOmhMVdvnWbQF8=
Date:   Tue, 21 Dec 2021 14:27:48 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Dan Williams <dan.j.williams@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/2] nvmem: expose NVMEM cells in sysfs
Message-ID: <YcHWVMa6vjz3Gp51@kroah.com>
References: <YcA4ArALDTjUedrb@kroah.com>
 <c49f2d6d-7974-5bc7-9bc1-ac265a23c2c0@gmail.com>
 <YcF1Kizcvgqa9ZT4@kroah.com>
 <d68ba301-7877-a8d8-8700-c601a4996818@gmail.com>
 <YcF4E82M89huIbSD@kroah.com>
 <3cb1d0a4-6e20-f751-6d66-c1487ef31f30@gmail.com>
 <YcF+g0ra5tttXOQF@kroah.com>
 <0527135c-35f5-bc63-edb3-81cb03eb03f6@gmail.com>
 <YcHPGQ0FH0kTzpbq@kroah.com>
 <ab52292c-3065-789b-d5ae-ef24bab5fc90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab52292c-3065-789b-d5ae-ef24bab5fc90@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 21, 2021 at 02:05:34PM +0100, Rafał Miłecki wrote:
> On 21.12.2021 13:56, Greg Kroah-Hartman wrote:
> > On Tue, Dec 21, 2021 at 01:24:00PM +0100, Rafał Miłecki wrote:
> > > On 21.12.2021 08:13, Greg Kroah-Hartman wrote:
> > > > On Tue, Dec 21, 2021 at 07:53:32AM +0100, Rafał Miłecki wrote:
> > > > > On 21.12.2021 07:45, Greg Kroah-Hartman wrote:
> > > > > > On Tue, Dec 21, 2021 at 07:39:24AM +0100, Rafał Miłecki wrote:
> > > > > > > On 21.12.2021 07:33, Greg Kroah-Hartman wrote:
> > > > > > > > On Mon, Dec 20, 2021 at 09:39:43PM +0100, Rafał Miłecki wrote:
> > > > > > > > > Hi Greg,
> > > > > > > > > 
> > > > > > > > > On 20.12.2021 09:00, Greg Kroah-Hartman wrote:
> > > > > > > > > > On Mon, Dec 20, 2021 at 07:47:30AM +0100, Rafał Miłecki wrote:
> > > > > > > > > > >       static void nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
> > > > > > > > > > >       {
> > > > > > > > > > > +	struct device *dev = &cell->nvmem->dev;
> > > > > > > > > > > +	int err;
> > > > > > > > > > > +
> > > > > > > > > > >       	mutex_lock(&nvmem_mutex);
> > > > > > > > > > >       	list_add_tail(&cell->node, &cell->nvmem->cells);
> > > > > > > > > > >       	mutex_unlock(&nvmem_mutex);
> > > > > > > > > > > +
> > > > > > > > > > > +	sysfs_attr_init(&cell->battr.attr);
> > > > > > > > > > > +	cell->battr.attr.name = cell->name;
> > > > > > > > > > > +	cell->battr.attr.mode = 0400;
> > > > > > > > > > > +	cell->battr.read = nvmem_cell_attr_read;
> > > > > > > > > > > +	err = sysfs_add_bin_file_to_group(&dev->kobj, &cell->battr,
> > > > > > > > > > > +					  nvmem_cells_group.name);
> > > > > > > > > > 
> > > > > > > > > > Why not just use the is_bin_visible attribute instead to determine if
> > > > > > > > > > the attribute should be shown or not instead of having to add it
> > > > > > > > > > after-the-fact which will race with userspace and loose?
> > > > > > > > > 
> > > > > > > > > I'm sorry I really don't see how you suggest to get it done.
> > > > > > > > > 
> > > > > > > > > I can use .is_bin_visible() callback indeed to respect nvmem->root_only.
> > > > > > > > 
> > > > > > > > Great.
> > > > > > > > 
> > > > > > > > > I don't understand addig-after-the-fact part. How is .is_bin_visible()
> > > > > > > > > related to adding attributes for newly created cells?
> > > > > > > > 
> > > > > > > > You are adding a sysfs attribute to a device that is already registered
> > > > > > > > in the driver core, and so the creation of that attribute is never seen
> > > > > > > > by userspace.  The attribute needs to be attached to the device _BEFORE_
> > > > > > > > it is registered.
> > > > > > > > 
> > > > > > > > Also, huge hint, if a driver has to call as sysfs_*() call, something is
> > > > > > > > wrong.
> > > > > > > > 
> > > > > > > > > Do you mean I can
> > > > > > > > > avoid calling sysfs_add_bin_file_to_group()?
> > > > > > > > 
> > > > > > > > Yes.
> > > > > > > > 
> > > > > > > > > Do you recall any existing example of such solution?
> > > > > > > > 
> > > > > > > > Loads.
> > > > > > > > 
> > > > > > > > Just add this attribute group to your driver as a default attribute
> > > > > > > > group and the driver core will create it for you if needed.
> > > > > > > > 
> > > > > > > > Or if you always need it, no need to mess sith is_bin_visible() at all,
> > > > > > > > I can't really understand what you are trying to do here at all.
> > > > > > > 
> > > > > > > Thanks a lot! In nvmem_register() first there is a call to the
> > > > > > > device_register() and only later cells get added. I suppose I just have
> > > > > > > to rework nvmem_register() order so that:
> > > > > > > 1. Cells are collected earlier. For each cell I allocate group attribute
> > > > > > 
> > > > > > No, add all of the attributes to the device at the beginning before you
> > > > > > register it, there's no need to allocate anything.
> > > > > 
> > > > > If you mean static structures I can't do that, because cells almost
> > > > > never are static. They are not known in advance. nvmem allows cells to
> > > > > be:
> > > > > 1. Specified in OF
> > > > > 2. Submitted as list while registering a NVMEM device
> > > > > 
> > > > > So every cells gets its own structure allocated dynamically. My plan is
> > > > > to put bin_attribute in that struct and then create a group collecting
> > > > > all those cells.
> > > > 
> > > > A device has a driver associated with it, and that driver has default
> > > > groups associated with it.  Use that, I am not saying to use static
> > > > structures, that is not how the driver model works at all.
> > > 
> > > I'm helpless on dealing with attributes.
> > > 
> > > I tried building a list of attributes dynamically but that of course
> > > fails:
> > > 
> > > drivers/nvmem/core.c: In function ‘nvmem_register’:
> > > drivers/nvmem/core.c:930:31: error: assignment of member ‘bin_attrs’ in read-only object
> > >    930 |   nvmem_cells_group.bin_attrs = nvmem->cells_bin_attrs;
> > >        |                               ^
> > > 
> > > 
> > > What I'm trying to achieve is having
> > > /sys/bus/nvmem/devices/*/cells/*
> > > with each file being an attribute.
> > 
> > What is the full path here that you are looking to add these attributes
> > to?  Where is the struct device in play?  What .c file should I look at?
> > 
> > > Please kindly point me to a single example of "struct attribute_group"
> > > that has a variable list of attributes with each attribute having
> > > runtime set name.
> > 
> > Why would you ever want each attribute have a runtime-set name?  That's
> > not what attributes are for.  Think of them as "key/value" pairs.  The
> > "key" part is the name (i.e. filename), that is well known to everyone,
> > unique to that struct device type, and documented in Documentation/ABI/.
> > The "value" part is the value you read from the file (or write to it.)
> > 
> > That's it, it's not all that complex.
> > 
> > > Almost all cases in kernel look like:
> > > static const struct attribute_group foo_attr_group = {
> > > 	.attrs = foo_attrs,
> > > };
> > > with "foo_attrs" being a list of attributes with *predefined* names.
> > 
> > Yes, because that is what you really want.
> > 
> > Why do you feel this device is somehow unique to deserve attributes that
> > are not predefined?  And if they are not predefined, how are you going
> > to define them when you create them in the code and document them?   :)
> > 
> > > Every example of dynamic attributes (runtime created) I see in a kernel
> > > (e.g. drivers/base/node.c) uses sysfs_*().
> > 
> > drivers/base/* is not the best place to look at for how to implement
> > bus/driver logic, look at existing busses and drivers instead please.
> > We have a few hundred to choose from :)
> > 
> > So, let's break it down, what exactly are you wanting your device on
> > your bus to look like?  What will be the attributes you want to expose,
> > and what are the values of those attributes?  You have to start with
> > that, as Documentation/ABI/ is going to require you to write them down.
> 
> This patch subject / body is a basic summary. It's about
> drivers/nvmem/core.c .
> 
> 
> Let me explain it with more details:
> 
> NVMEM is a data blob.
> NVMEM consists of entries called cells.
> 
> 
> Example:
> 
> U-Boot environment variables is NVMEM. Example:
> 00000000  c4 09 30 54 62 6f 6f 74  63 6d 64 3d 74 66 74 70  |..0Tbootcmd=tftp|
> 00000010  00 62 6f 6f 74 64 65 6c  61 79 3d 35 00 65 74 68  |.bootdelay=5.eth|
> 
> A single environment variable is NVMEM cell. Example:
> bootcmd=tftp
> bootdelay=5
> 
> 
> Every NVMEM device is exposed in sysfs as:
> /sys/bus/nvmem/devices/*/
> 
> You can read NVMEM blob doing
> cat /sys/bus/nvmem/devices/*/nvmem | hexdump -C
> 
> 
> What I'm trying to do is to expose NVMEM cells in sysfs as:
> /sys/bus/nvmem/devices/cells/*

You forgot "foo" in there :)

How are nvmem devices named?

> Example:
> $ cat /sys/bus/nvmem/devices/foo/cells/bootcmd
> tftp
> $ cat /sys/bus/nvmem/devices/foo/cells/bootdelay
> 5
> 
> As you can see above NVMEM cells are not known at compilation time.

Why do you want to expose these in a way that forces the kernel to parse
these key/value pairs?  Why not just do it all in userspace like you can
today?  What forces the kernel to do it and not a perl script?

> So I believe the question is: how can I expose cells in sysfs?

You can do this by dynamically creating the attributes on the fly, but
your show function is going to be rough and it's not going to be simple
to do so.  One example will be the code that creates the
/sys/devices/system/machinecheck/machinecheckXX/bank* files.

But I will push back again, why not just do it all in userspace?  What
userspace tool is requiring the kernel to do this work for it?

And none of this is a binary attribute file, which is what you were
trying to do in your original patch.  binary attribute files treat the
kernel as a pass-through, no parsing of the data is allowed by the
kernel.  Which is fine for the "nvmem" sysfs file, but not for your
key/value pairs.

thanks,

greg k-h
