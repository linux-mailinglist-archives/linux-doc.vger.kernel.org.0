Return-Path: <linux-doc+bounces-20507-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C37BD92EAD1
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 16:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A488281FC1
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 14:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F0D167272;
	Thu, 11 Jul 2024 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b="khnrtDm6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C9A166317
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720708469; cv=none; b=q+4T1n5tzCe9FYdwaHtLPS29hCQB/RksCVcALiGgAFR+XZAKHkh7FSZk1X/AGQh7nzN5NikBMLbaz+AAUNE5pLsNfGcYfH0/EIB4zjEAJLuoYWkFkT1c3MUU/pwdJy+dMQqJGOQTPdhE09Vtxle0swk9MKgP7LzRzaJeJDTjOcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720708469; c=relaxed/simple;
	bh=+uj/tTAq4TA7NjaayLC8BtNVkrmTjLc5am/0QT0gO4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFpXnoH++Xz5qW61BXsZiw1PEdUid5kg72Hvarx2H4kIyoz6EPSID0D1PRTSxFiujpTt9b4OX5sShmcELA+znXtIByeG3HQz1VxuUSLLZRj7QvPnvG3MowwpjHH8aGrW/iB1Yfm42Nl+rOqNJ+hUk0i8VqN4W01nUxucrSFUOr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=none smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b=khnrtDm6; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toxicpanda.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfdb6122992so895808276.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 07:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1720708466; x=1721313266; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Isnu2P2XZ4vyjhu09NFK9mxLGYDcc9SLvRNtCtPllw=;
        b=khnrtDm6SH9jdckQiHu9LdoMGHhECCvNTilNNh4CsbN0tym7xZnHnBJYYFUwqFzsX/
         hR3rWem4gG6a7KhVcGtSm7/F9+MkV+sROOgCL/5vqgGXs1RVGdkUnhlzkO6CwlNd7IU7
         OIgYA51vq/XfS+sp3EDwWvm4b6PHbkVDzbyJbyQkYL2L4vNw/weNBfGlLDs10z9AGvn6
         pnnph/h8a7+5AxGJVe3HxoeclB6R8u/NXrWT3GdefH3g9/cwowwT4JZ52zOjlJ5hYf94
         AJGQku4fzrU46WZXYMT9e1CODTz84hYrSvHkZq1poSVjkIXbdNV/sUqY5E4Ao6AopZXn
         6HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720708466; x=1721313266;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Isnu2P2XZ4vyjhu09NFK9mxLGYDcc9SLvRNtCtPllw=;
        b=f3ly8db19RmOkT4+Jj/mH0Eypt7/Vm6lG6ps1rmt4FtMOnI4BeLYeV682FGaPcs8OJ
         8IBdEwffdhc+c7KLYUDWwgNBXw14hUKNeO2RovkFt/rw/xq7ggoqGQfwxkJQOkfKchYE
         /0/t8bbcOC8uM2E1m+oV20qsH+yy1vOEennweRN1UUb+DenIEftPhmCurhkponqQgWLc
         Q2mD5kHDkDfTJs4t47K8/IHE0fK/Y4z7Vk5/gh8DYcOZp4UHlenNYSp+2wotVRWQ3F6y
         rAqBc9n39M4Y54G7npXB+Lbn5XK/2IsV+P4iD02HoPw6ShPQW1ha9oydaLxV/d0nWrPi
         OmOA==
X-Forwarded-Encrypted: i=1; AJvYcCVhSo7AxE2Iv9ZzsH3Jm/d+lRKN/wmDwX6iJ00mD9HeJ1J7LgYqb5qNGnwhP+r0wKG/Ye/4DfwAi/8sa7vIiSGbc/f3eS0t7j4/
X-Gm-Message-State: AOJu0YyYVD/Dzvp+q1WfvE9pd7d5vdqulapVD2e3hrXZbWvLWSjzG24m
	rx51mKa1K7fsnEVU951XieRck+oaM7K8HQIqbKUkG/sqwL67rtad9uFrMduXIuk=
X-Google-Smtp-Source: AGHT+IHoDuERbfhsAd+ku6w/nNTteOIDJ8Hw6KBq9ZuJ4kA+BHwmpNrzHWd6szaaePbvGqJyOdH8hQ==
X-Received: by 2002:a5b:605:0:b0:e03:645f:2099 with SMTP id 3f1490d57ef6-e041b043182mr9883441276.8.1720708466582;
        Thu, 11 Jul 2024 07:34:26 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e041a8aca8csm979701276.10.2024.07.11.07.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 07:34:26 -0700 (PDT)
Date: Thu, 11 Jul 2024 10:34:25 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
	Miklos Szeredi <mszeredi@redhat.com>,
	German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 0/2] virtio-fs: Add 'file' mount option
Message-ID: <20240711143425.GA1235314@perftesting>
References: <20240709111918.31233-1-hreitz@redhat.com>
 <20240709175652.GB1040492@perftesting>
 <8ebfc48f-9a93-45ed-ba88-a4e4447d997a@redhat.com>
 <20240710184222.GA1167307@perftesting>
 <453a5eb6-204f-403a-b41d-faefdbcb8f50@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <453a5eb6-204f-403a-b41d-faefdbcb8f50@redhat.com>

On Thu, Jul 11, 2024 at 10:21:35AM +0200, Hanna Czenczek wrote:
> On 10.07.24 20:42, Josef Bacik wrote:
> > On Wed, Jul 10, 2024 at 09:28:08AM +0200, Hanna Czenczek wrote:
> > > On 09.07.24 19:56, Josef Bacik wrote:
> > > > On Tue, Jul 09, 2024 at 01:19:16PM +0200, Hanna Czenczek wrote:
> > > > > Hi,
> > > > > 
> > > > > We want to be able to mount filesystems that just consist of one regular
> > > > > file via virtio-fs, i.e. no root directory, just a file as the root
> > > > > node.
> > > > > 
> > > > > While that is possible via FUSE itself (through the 'rootmode' mount
> > > > > option, which is automatically set by the fusermount help program to
> > > > > match the mount point's inode mode), there is no virtio-fs option yet
> > > > > that would allow changing the rootmode from S_IFDIR to S_IFREG.
> > > > > 
> > > > > To do that, this series introduces a new 'file' mount option that does
> > > > > precisely that.  Alternatively, we could provide the same 'rootmode'
> > > > > option that FUSE has, but as laid out in patch 1's commit description,
> > > > > that option is a bit cumbersome for virtio-fs (in a way that it is not
> > > > > for FUSE), and its usefulness as a more general option is limited.
> > > > > 
> > > > All this does is make file an alias for something a little easier for users to
> > > > read, which can easily be done in libfuse.  Add the code to lib/mount.c to alias
> > > > 'file' to turn it into rootmode=S_IFREG when it sends it to the kernel, it's not
> > > > necessary to do this in the kernel.  Thanks,
> > > This series is not about normal FUSE filesystems (file_system_type
> > > fuse_fs_type, “fuse”), but about virtio-fs (file_system_type virtio_fs_type,
> > > “virtiofs”), i.e. a case where libfuse and fusermount are not involved at
> > > all.  As far as I’m aware, mounting a virtio-fs filesystem with a
> > > non-directory root inode is currently not possible at all.
> > Ok so I think I had it backwards in my head, my apologies.
> > 
> > That being said I still don't understand why this requires a change to virtiofs
> > at all.
> > 
> > I have a virtiofs thing attached to my VM.  Inside the vm I do
> > 
> > mount -t virtiofs <name of thing I've attached to the vm> /directory
> > 
> > and then on the host machine, virtiofsd is a "normal" FUSE driver, except it's
> > talking over the socket you setup between the guest and the host.  I assume this
> > is all correct?
> > 
> > So then the question is, why does it matter what virtiofsd is exposing?  I guess
> > that's the better question.  The guest shouldn't have to care if it's a
> > directory or a file right?  The mountpoint is going to be a directory, whatever
> > is backing it shouldn't matter.  Could you describe the exact thing you're
> > trying to accomplish?  Thanks,
> 
> The mount point needs to be of the same mode as the root node of the mounted
> filesystem, or it’ll be inaccessible after mounting[1].  In this case, I
> want to export a regular file as the root node, so the root node must be a
> regular file, too:
> 
> host$ echo foo > /tmp/bar
> 
> host$ virtiofsd --shared-dir /tmp/bar --socket-path /tmp/viofsd.sock
> --sandbox none
> 
> 
> guest# mkdir /tmp/mnt-dir
> 
> guest# mount -t virtiofs virtiofs-tag /tmp/mnt-dir
> 
> guest# stat /tmp/mnt-dir
> stat: cannot statx '/tmp/mnt-dir': Input/output error
> 
> guest# cat /tmp/mnt-dir
> cat: /tmp/mnt-dir: Input/output error
> 
> guest# ls /tmp/mnt-dir
> ls: cannot access '/tmp/mnt-dir': Input/output error
> 
> guest# umount /tmp/mnt-dir
> 
> (following with this series applied)
> 
> guest# touch /tmp/mnt-file
> 
> guest# mount -t virtiofs virtiofs-tag /tmp/mnt-file -o file
> 
> guest# stat /tmp/mnt-file
>   File: /tmp/mnt-file
>   Size: 4               Blocks: 8          IO Block: 4096   regular file
> [...]
> 
> guest# cat /tmp/mnt-file
> foo
> 
> guest# ls --file-type /tmp/mnt-file
> /tmp/mnt-file
> 
> guest# ls --file-type /tmp
> mnt-dir/
> mnt-file
> [...]
> 

Got it, this makes sense, thanks for explaining it to me.  You can add

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

