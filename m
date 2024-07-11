Return-Path: <linux-doc+bounces-20473-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 498D692E204
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 10:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F350B2865FD
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 08:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D216084DFF;
	Thu, 11 Jul 2024 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QYX/9QC3"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E850152534
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686108; cv=none; b=I001+pXgFTCcNyGNoRBKLE+jt8EJSfq2F9Z5BQhHdrv9nT85FRspKOEGOUnLBt0x8zfW6Qiz/bfvzOjjYJ2gOaCg1oEf9JHDuvnRKqpKkJpb/GjIOLyMyGVoLCrc/AiK1e/hwKuBrh6mIJ/EId0qhGD+YYN8DwzQ0FkZspnnhYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686108; c=relaxed/simple;
	bh=1xxDXjpGAFXEHEahJ2l+juFbIpG4cDc0ZoITaziOE6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYKgWIa7+o6A4zUM6F00BPcn5jPLVjwchx/mGNfPVHSEjD197lB9b+7gSEsOKHk+AybvvXWJ2yQxE/6L0t+gPT1nAxiADGz8NcyFXeyU2GklBpVMr9xanOepvjof3bEzBkNkMAKP3Dg5Orjt1jtXKt9ZPwzN7hcgkhf0o0z42AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QYX/9QC3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720686106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKV/dPvVX6U52egC8PZ7aZ2NliJFdW0DzA0apscZF0I=;
	b=QYX/9QC3mXQsq8jiQ7yhUOBGf0AcuLfddEKV5bqjfHVyeak0JVdvgDQcUDsN9BrZKiss/D
	JXh0A4tLSHueRTeeaj0pqkSaVe+WvzGKdYAWAoBHLiZUUVO8pW/K39j5kvSM8tWxepRCzz
	EHONHnI74HyUfCCzGfF2RcG+OWHz6iY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-KeKBr5grMzO2RnIDZAIHxg-1; Thu, 11 Jul 2024 04:21:41 -0400
X-MC-Unique: KeKBr5grMzO2RnIDZAIHxg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52e96ca162dso539282e87.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 01:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686098; x=1721290898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kKV/dPvVX6U52egC8PZ7aZ2NliJFdW0DzA0apscZF0I=;
        b=gtzQtelnLYcJL//Heyk2d82rgGPT2+i897moX4tGY9LmCCOJc6e+ESZIjkr3UoHz9G
         t4OJmahdQW4sEDuYIDjaZS3w6IbnZrnYDTPvka5SF2OmXaMxaw9K/DqEBt40SK1+ybv2
         Ghnzz2AiG0udJOZfldqBAPoMzRjWRWvg/pTGzRmUoLuirTwCapglOLDsEZlCWpnI7b8J
         uPBc0Nqb94Hqw8+BUe2sM/fVVa8lUamn5tXcK9fhJ45mo57TysSqa25oRoh0C2jYjoao
         THAXOS3tJSQ0diCLhEY5jcjC8tsZ1ObsOa+6wKsT8vJupNz9SsRLih1phlSXM66hqSya
         d8Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUpukyUDnG9E5XReRaIpHUYMjrSa5oCzrnTPToVT2IytgUDSDsSS5dYuAig5WVQWJ28YLWlWPAO50uRCw4heApOehvxD711VP+o
X-Gm-Message-State: AOJu0YzirZqa/1rFDlWbGbF+9NhT6lHw8qPJnkC/UtE/yKxWZJODdq22
	HM6ek0/prny/G627kUKaCZsCS5Y34NS2VvNaOBRXshEaDBvzHIEeIWe58zfEPs2FJ0NWCylLiUY
	yJbqX8PwkQWmP5LGFK8y+T+7fLUAQpH5uGYGUABFHrwJiOM7PFW7x0swGuP3Lh3xcDQ==
X-Received: by 2002:a05:6512:3b82:b0:52c:fd49:d42 with SMTP id 2adb3069b0e04-52eb9990d58mr4923502e87.14.1720686098455;
        Thu, 11 Jul 2024 01:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH0rhNWoQXyAZvVPXz6Dy+zSV2dNxofBw3iBdTfkvhRQGIY/Lb1Q8H4R8Fjr+Cd7QoIGRnBw==
X-Received: by 2002:a05:6512:3b82:b0:52c:fd49:d42 with SMTP id 2adb3069b0e04-52eb9990d58mr4923470e87.14.1720686097583;
        Thu, 11 Jul 2024 01:21:37 -0700 (PDT)
Received: from ?IPV6:2003:cf:d74b:1cd5:1c4c:c09:d73b:c07d? (p200300cfd74b1cd51c4c0c09d73bc07d.dip0.t-ipconnect.de. [2003:cf:d74b:1cd5:1c4c:c09:d73b:c07d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab080sm7104914f8f.104.2024.07.11.01.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 01:21:36 -0700 (PDT)
Message-ID: <453a5eb6-204f-403a-b41d-faefdbcb8f50@redhat.com>
Date: Thu, 11 Jul 2024 10:21:35 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] virtio-fs: Add 'file' mount option
To: Josef Bacik <josef@toxicpanda.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
 Miklos Szeredi <mszeredi@redhat.com>, German Maglione
 <gmaglione@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vivek Goyal <vgoyal@redhat.com>
References: <20240709111918.31233-1-hreitz@redhat.com>
 <20240709175652.GB1040492@perftesting>
 <8ebfc48f-9a93-45ed-ba88-a4e4447d997a@redhat.com>
 <20240710184222.GA1167307@perftesting>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20240710184222.GA1167307@perftesting>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10.07.24 20:42, Josef Bacik wrote:
> On Wed, Jul 10, 2024 at 09:28:08AM +0200, Hanna Czenczek wrote:
>> On 09.07.24 19:56, Josef Bacik wrote:
>>> On Tue, Jul 09, 2024 at 01:19:16PM +0200, Hanna Czenczek wrote:
>>>> Hi,
>>>>
>>>> We want to be able to mount filesystems that just consist of one regular
>>>> file via virtio-fs, i.e. no root directory, just a file as the root
>>>> node.
>>>>
>>>> While that is possible via FUSE itself (through the 'rootmode' mount
>>>> option, which is automatically set by the fusermount help program to
>>>> match the mount point's inode mode), there is no virtio-fs option yet
>>>> that would allow changing the rootmode from S_IFDIR to S_IFREG.
>>>>
>>>> To do that, this series introduces a new 'file' mount option that does
>>>> precisely that.  Alternatively, we could provide the same 'rootmode'
>>>> option that FUSE has, but as laid out in patch 1's commit description,
>>>> that option is a bit cumbersome for virtio-fs (in a way that it is not
>>>> for FUSE), and its usefulness as a more general option is limited.
>>>>
>>> All this does is make file an alias for something a little easier for users to
>>> read, which can easily be done in libfuse.  Add the code to lib/mount.c to alias
>>> 'file' to turn it into rootmode=S_IFREG when it sends it to the kernel, it's not
>>> necessary to do this in the kernel.  Thanks,
>> This series is not about normal FUSE filesystems (file_system_type
>> fuse_fs_type, “fuse”), but about virtio-fs (file_system_type virtio_fs_type,
>> “virtiofs”), i.e. a case where libfuse and fusermount are not involved at
>> all.  As far as I’m aware, mounting a virtio-fs filesystem with a
>> non-directory root inode is currently not possible at all.
> Ok so I think I had it backwards in my head, my apologies.
>
> That being said I still don't understand why this requires a change to virtiofs
> at all.
>
> I have a virtiofs thing attached to my VM.  Inside the vm I do
>
> mount -t virtiofs <name of thing I've attached to the vm> /directory
>
> and then on the host machine, virtiofsd is a "normal" FUSE driver, except it's
> talking over the socket you setup between the guest and the host.  I assume this
> is all correct?
>
> So then the question is, why does it matter what virtiofsd is exposing?  I guess
> that's the better question.  The guest shouldn't have to care if it's a
> directory or a file right?  The mountpoint is going to be a directory, whatever
> is backing it shouldn't matter.  Could you describe the exact thing you're
> trying to accomplish?  Thanks,

The mount point needs to be of the same mode as the root node of the 
mounted filesystem, or it’ll be inaccessible after mounting[1].  In this 
case, I want to export a regular file as the root node, so the root node 
must be a regular file, too:

host$ echo foo > /tmp/bar

host$ virtiofsd --shared-dir /tmp/bar --socket-path /tmp/viofsd.sock 
--sandbox none


guest# mkdir /tmp/mnt-dir

guest# mount -t virtiofs virtiofs-tag /tmp/mnt-dir

guest# stat /tmp/mnt-dir
stat: cannot statx '/tmp/mnt-dir': Input/output error

guest# cat /tmp/mnt-dir
cat: /tmp/mnt-dir: Input/output error

guest# ls /tmp/mnt-dir
ls: cannot access '/tmp/mnt-dir': Input/output error

guest# umount /tmp/mnt-dir

(following with this series applied)

guest# touch /tmp/mnt-file

guest# mount -t virtiofs virtiofs-tag /tmp/mnt-file -o file

guest# stat /tmp/mnt-file
   File: /tmp/mnt-file
   Size: 4               Blocks: 8          IO Block: 4096   regular file
[...]

guest# cat /tmp/mnt-file
foo

guest# ls --file-type /tmp/mnt-file
/tmp/mnt-file

guest# ls --file-type /tmp
mnt-dir/
mnt-file
[...]


[1] As far as I remember, FUSE/virtio-fs will present the root node’s 
mode as 'rootmode' during mounting, and so the d_is_dir() equality 
checks in do_move_mount() and graft_tree() just check whether that 
matches the mount point’s mode.  So, like in the example above, mounting 
a filesystem whose root node is a regular file to a directory mount 
point without '-o file' succeeds.  But accessing it then fails, probably 
because the mismatch is then noticed somewhere (virtiofsd receives a 
GETATTR request, that’s it), i.e. the root node is supposed to be a 
directory, but it turns out not to be after all.

Hanna


