Return-Path: <linux-doc+bounces-16728-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F768CBD61
	for <lists+linux-doc@lfdr.de>; Wed, 22 May 2024 10:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BA3F281344
	for <lists+linux-doc@lfdr.de>; Wed, 22 May 2024 08:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6ABB7E583;
	Wed, 22 May 2024 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="LwjrOOpI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF8C7F470
	for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716368297; cv=none; b=GyCJnPlYUgQpoxtDS1gyhWhbBdf2sPIBDExWYRXczATIV9LmSsV5z+uaone6C4bddv5nPf1D7gAMCPG25VxrqQwAcW5+QEUOtwjl41U0+/M4X7fKxuoKGwVKO0v68wsS5kiglBgCdkbqa2cu5RbiBpWVpZxJqgIhsHrO58b94tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716368297; c=relaxed/simple;
	bh=5drciXMGAdYELysmjzz3Rf4LK6AJOqcEGCFERe2XB+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNfw7broXyUvNJj+xWgTreANkMOJvz7Fsp2OfhIkdIZrbivmT5e1vJq87F3VIB1DXmIi+J8jSb9Ai+bkhF99zOy2NHv8Riiksmixwo00a994TuVawMofJyYQi2efYQ/BFrBh0VdZxeivrzNBH/IRmJVo+RG+1myH74w597ODGko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=LwjrOOpI; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a5a5cb0e6b7so987342166b.1
        for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 01:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1716368293; x=1716973093; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LjTE4WfHhoeXUwUqEwrecuarcFt+4f9tVsycy9v4ZlE=;
        b=LwjrOOpIS/usGDwNKQHzZp/tdFO4on8C5ttwUFgWhkhf2WArpAyDZ+ySx9oUZrKaVr
         IOK4R3OkLXjV9f8cqsJOAb71/NaDCnFAs4teLXQNmEvbEAKFLTA6HD7HCguEI5K89aKe
         tKUY3GCsPBSXLDpqEHXztADX+whM8oTbx9kjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716368293; x=1716973093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjTE4WfHhoeXUwUqEwrecuarcFt+4f9tVsycy9v4ZlE=;
        b=Qrf6CSNIUSqi4cify5Pl1Dn+VaA3E8YqcIhyYduSY/oAPwIJFSZUf9mgiuGOO7cJvr
         NUcu4Td7puzheshKPVz/pnpFLsYHKVoa86gf4/EpbhZdhDnWwdqYzGOSgkD1Fc+SbCS+
         Qv7gHmPyHFwgIg6f2CE1SJlErTY24zphzwF60+kir44RHReL0PMqS9wYkd8nlCmmvhGO
         t0muxgOJm2IocwsMz2DL5ZOEw6R5ZTzxiuRdlSDZVNjpJjtLJsYLGFHLw4i5vC3Jyy0C
         diqVI5LnG5ygO4l2HhqI8k+TJI5HMAmS+tt5sY4X8/6C8iOIOedP/ApghFX3UUMA6h2z
         GPkA==
X-Forwarded-Encrypted: i=1; AJvYcCXqd/9crv5BmPuYP2fc+WhUPq+vy5MNQiTCOsk7opk44ifDioXWW4uBhMQ8RhquukH3nuvcLPn2BPiochLFQcuRTl4tboLRuP8G
X-Gm-Message-State: AOJu0YyoUJo7Jb55Pk5UAzGAuY2xngDvBiKG8cNIGxteXsj9/JBGiYlB
	buP1+93FgXJIbaHoffjDXe6ExGe4wEQCl9mMVMY0tO8Y7I7q3CInohe7HlAbROi6oUYC2dLfS93
	DaAYU2p3QDEMhv6+Jvc7X9UtSbkAEpy9euq7YnA==
X-Google-Smtp-Source: AGHT+IGgLmVa8nGFRuH2lLvEoDTQ6Rj2QgnH8O/MrBxes++zUajUrC9MH9ZOGLxZV91yfG+FjV6yMUJtua3Xpybi24I=
X-Received: by 2002:a17:906:4086:b0:a5a:6367:7186 with SMTP id
 a640c23a62f3a-a62281910e7mr77367066b.70.1716368293170; Wed, 22 May 2024
 01:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1708709155.git.john@groves.net> <CAOQ4uxiPc5ciD_zm3jp5sVQaP4ndb40mApw5hx2DL+8BZNd==A@mail.gmail.com>
 <CAJfpegv8XzFvty_x00UehUQxw9ai8BytvGNXE8SL03zfsTN6ag@mail.gmail.com>
 <CAOQ4uxg9WyQ_Ayh7Za_PJ2u_h-ncVUafm5NZqT_dt4oHBMkFQg@mail.gmail.com> <kejfka5wyedm76eofoziluzl7pq3prys2utvespsiqzs3uxgom@66z2vs4pe22v>
In-Reply-To: <kejfka5wyedm76eofoziluzl7pq3prys2utvespsiqzs3uxgom@66z2vs4pe22v>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 22 May 2024 10:58:01 +0200
Message-ID: <CAJfpegvQefgKOKMWC8qGTDAY=qRmxPvWkg2QKzNUiag1+q5L+Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/20] Introduce the famfs shared-memory file system
To: John Groves <John@groves.net>
Cc: Amir Goldstein <amir73il@gmail.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Dan Williams <dan.j.williams@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Matthew Wilcox <willy@infradead.org>, linux-cxl@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, john@jagalactic.com, 
	Dave Chinner <david@fromorbit.com>, Christoph Hellwig <hch@infradead.org>, dave.hansen@linux.intel.com, 
	gregory.price@memverge.com, Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 May 2024 at 04:05, John Groves <John@groves.net> wrote:
> I'm happy to help with that if you care - ping me if so; getting a VM running
> in EFI mode is not necessary if you reserve the dax memory via memmap=, or
> via libvirt xml.

Could you please give an example?

I use a raw qemu command line with a -kernel option and a root fs
image (not a disk image with a bootloader).


> More generally, a famfs file extent is [daxdev, offset, len]; there may
> be multiple extents per file, and in the future this definitely needs to
> generalize to multiple daxdev's.
>
> Disclaimer: I'm still coming up to speed on fuse (slowly and ignorantly,
> I think)...
>
> A single backing device (daxdev) will contain extents of many famfs
> files (plus metadata - currently a superblock and a log). I'm not sure
> it's realistic to have a backing daxdev "open" per famfs file.

That's exactly what I was saying.

The passthrough interface was deliberately done in a way to separate
the mapping into two steps:

 1) registering the backing file (which could be a device)

 2) mapping from a fuse file to a registered backing file

Step 1 can happen at any time, while step 2 currently happens at open,
but for various other purposes like metadata passthrough it makes
sense to allow the mapping to happen at lookup time and be cached for
the lifetime of the inode.

> In addition there is:
>
> - struct dax_holder_operations - to allow a notify_failure() upcall
>   from dax. This provides the critical capability to shut down famfs
>   if there are memory errors. This is filesystem- (or technically daxdev-
>   wide)

This can be hooked into fuse_is_bad().

> - The pmem or devdax iomap_ops - to allow the fsdax file system (famfs,
>   and [soon] famfs_fuse) to call dax_iomap_rw() and dax_iomap_fault().
>   I strongly suspect that famfs_fuse can't be correct unless it uses
>   this path rather than just the idea of a single backing file.

Agreed.

> - the dev_dax_iomap portion of the famfs patchsets adds iomap_ops to
>   character devdax.

You'll need to channel those patches through the respective
maintainers, preferably before the fuse parts are merged.

> - Note that dax devices, unlike files, don't support read/write - only
>   mmap(). I suspect (though I'm still pretty ignorant) that this means
>   we can't just treat the dax device as an extent-based backing file.

Doesn't matter, it'll use the iomap infrastructure instead of the
passthrough infrastructure.

But the interfaces for regular passthrough and fsdax could be shared.
Conceptually they are very similar:  there's a backing store indexable
with byte offsets.

What's currently missing from the API is an extent list in
fuse_open_out.   The format could be:

  [ {backing_id, offset, length}, ... ]

allowing each extent to map to a different backing device.

> A dax device to famfs is a lot more like a backing device for a "filesystem"
> than a backing file for another file. And, as previously mentioned, there
> is the iomap_ops interface and the holder_ops interface that deal with
> multiple file tenants on a dax device (plus error notification,
> respectively)
>
> Probably doable, but important distinctions...

Yeah, that's why I suggested to create a new source file for this
within fs/fuse.  Alternatively we could try splitting up fuse into
modules (core, virtiofs, cuse, fsdax) but I think that can be left as
a cleanup step.

> First question: can you suggest an example fuse file pass-through
> file system that I might use as a jumping-off point? Something that
> gets the basic pass-through capability from which to start hacking
> in famfs/dax capabilities?

An example is in Amir's libfuse repo at

   https://github.com/libfuse/libfuse

> I'm confused by the last item. I would think there would be a fuse
> inode per famfs file, and that multiple of those would map to separate
> extent lists of one or more backing dax devices.

Yeah.

> Or maybe I misunderstand the meaning of "fuse inode". Feel free to
> assign reading...

I think Amir meant that each open file could in theory have a
different mapping.  This is allowed by the fuse interface, but is
disallowed in practice.

I'm in favor of caching the extent map so it only has to be given on
the first open (or lookup).

Thanks,
Miklos

