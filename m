Return-Path: <linux-doc+bounces-20353-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3C92CBE9
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jul 2024 09:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A44E1C22540
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jul 2024 07:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09867839F7;
	Wed, 10 Jul 2024 07:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ixmd3HwV"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5966B8248C
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 07:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720596497; cv=none; b=ehrTzlqOovB0ug3d8tg04p4d0LEvlFeDh1T8Knq0zWQ0ncQCh8wdXIFOp01Yc+h4xaazhs681BDjD5QSqYPOSoJa1nmFnHnPg3qtpp2HE4Q0U4cjbwTeBN4yclFj9MYP1YAeK3/QhpUlz20cIgwxSr8+1vPJ8EhpKKT7Qm5oEIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720596497; c=relaxed/simple;
	bh=t0iU2Z6LXaDVQOAsEZaNjePxzLrEKQENdJp9p5vZ130=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rH8bpBBMmRipUC9PikKplq4r08xXJC80nLlYouDe+1/PA+vnFtzRI+1LDHECwiZ8CoDadCllzEbX48FmXDqUzGesily8yERYN1X4jPYfglj0VANmg9zoB4w6LmTGVd8hellgex5n3g2qHNSvEvEdtINDfys2MKQ55c3uXf+sce8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ixmd3HwV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720596495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n95TDK+RqtiwdgfYUckpkFIosjWztnGEOG4KxdP5hZk=;
	b=ixmd3HwVY+7wqxg+3o3mIS3iMwAxGbCgwHtpa6M44nYoEUrQkeoX2Bw/GRIgDd1dkEPWO6
	UiZmSceA3b+UntMMmDUVyjTOYNfLzFpmwGawxnOgfTvSJgI+26/wEjYHZxX8KfLwZSSg5c
	YResy9C9w2yITmjJoxksRX8h+ovxMM4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-MK76cbRKPhy-54hm0Z7dGA-1; Wed, 10 Jul 2024 03:28:13 -0400
X-MC-Unique: MK76cbRKPhy-54hm0Z7dGA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4266edc9c85so14908705e9.2
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 00:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720596492; x=1721201292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n95TDK+RqtiwdgfYUckpkFIosjWztnGEOG4KxdP5hZk=;
        b=rg+eb1Y8nEjR146YRG4TtvRUWqG3XkqfqptapscVJq/T4/duqmXKzvnmQrsLNDhYQp
         XDNnH5zlYBLP205nAYrlH8ntDQrTxU1W+Ff0Fs6VjD25VtpKkbxO2VsBnyxBsofE/EAv
         Jjj4t4BymHrCeVzDGF/UBqb3ktDtMvV7gbS1aO3+W+KJWfWWd9bChrkDriJzD40kv7dd
         phP/7dSE7Qy5U2vnoPZvGNiYR+zpaMs4ilN1cuQdw+HMQ60F0Xm3MREQk/jzk44leE+P
         cLucWeX3I4jpLrkkQhVraofXxZNdxmGfFdpaoqcmz7ONOjlOb8sSWMtOMsEiJEF/No/4
         DwBg==
X-Forwarded-Encrypted: i=1; AJvYcCX9z2ura4VoioKoY90i1bJoJIFaHG98/oiDU3ZYpajNor76zjYXe6yqew72sx4GrhKcyUyamzfLxfV7pM569bj/0ssKTR5NvC5d
X-Gm-Message-State: AOJu0YxYAxXgERsQ5boFV7U2DMpEi0KRvAOBaEm/sQ8BEGgNzJQQvCBl
	J4Qe6ruu0paeGSLWD+9bmQ5iOWupeiC+25wk3ImfRoZerAJASrOlHD1HR7mN8FGkLXGmlXZIEJn
	9Om4/KV5H0QYnK4+dICxMDIq35oOH/phH/A6e4cG7ryUg6bxsNZqQznPRig==
X-Received: by 2002:a05:600c:1c99:b0:426:6921:e3e5 with SMTP id 5b1f17b1804b1-426707e1b09mr30936555e9.24.1720596492069;
        Wed, 10 Jul 2024 00:28:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwrcVA7uKWc1/M59Kozuw/Yvh6ebknkoW2lkhMKRk/kGZKnKiNQoeiG2NF73aLG23n5KNAxQ==
X-Received: by 2002:a05:600c:1c99:b0:426:6921:e3e5 with SMTP id 5b1f17b1804b1-426707e1b09mr30936325e9.24.1720596491435;
        Wed, 10 Jul 2024 00:28:11 -0700 (PDT)
Received: from ?IPV6:2003:cf:d74b:1ce0:c033:e72e:9d5f:f8c4? (p200300cfd74b1ce0c033e72e9d5ff8c4.dip0.t-ipconnect.de. [2003:cf:d74b:1ce0:c033:e72e:9d5f:f8c4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266e6478d7sm88212165e9.31.2024.07.10.00.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 00:28:10 -0700 (PDT)
Message-ID: <8ebfc48f-9a93-45ed-ba88-a4e4447d997a@redhat.com>
Date: Wed, 10 Jul 2024 09:28:08 +0200
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
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20240709175652.GB1040492@perftesting>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.07.24 19:56, Josef Bacik wrote:
> On Tue, Jul 09, 2024 at 01:19:16PM +0200, Hanna Czenczek wrote:
>> Hi,
>>
>> We want to be able to mount filesystems that just consist of one regular
>> file via virtio-fs, i.e. no root directory, just a file as the root
>> node.
>>
>> While that is possible via FUSE itself (through the 'rootmode' mount
>> option, which is automatically set by the fusermount help program to
>> match the mount point's inode mode), there is no virtio-fs option yet
>> that would allow changing the rootmode from S_IFDIR to S_IFREG.
>>
>> To do that, this series introduces a new 'file' mount option that does
>> precisely that.  Alternatively, we could provide the same 'rootmode'
>> option that FUSE has, but as laid out in patch 1's commit description,
>> that option is a bit cumbersome for virtio-fs (in a way that it is not
>> for FUSE), and its usefulness as a more general option is limited.
>>
> All this does is make file an alias for something a little easier for users to
> read, which can easily be done in libfuse.  Add the code to lib/mount.c to alias
> 'file' to turn it into rootmode=S_IFREG when it sends it to the kernel, it's not
> necessary to do this in the kernel.  Thanks,

This series is not about normal FUSE filesystems (file_system_type 
fuse_fs_type, “fuse”), but about virtio-fs (file_system_type 
virtio_fs_type, “virtiofs”), i.e. a case where libfuse and fusermount 
are not involved at all.  As far as I’m aware, mounting a virtio-fs 
filesystem with a non-directory root inode is currently not possible at all.

Hanna


