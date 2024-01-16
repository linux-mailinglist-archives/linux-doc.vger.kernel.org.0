Return-Path: <linux-doc+bounces-6890-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B51FF82F36F
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jan 2024 18:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39B441F2450E
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jan 2024 17:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F051CD24;
	Tue, 16 Jan 2024 17:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XNGXZN4I"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2454F1CD15
	for <linux-doc@vger.kernel.org>; Tue, 16 Jan 2024 17:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705427186; cv=none; b=U78VAOeKB11rjXnqE+XbOWE+yllD2crIhncq+BVKm2PkwJGu4SPGcOcZ3ahgURi4DKAk8WsTg1TfsgEHqmDtycWGFNlMD4Bw4jkAIMcjqW2JzToR0B24/dDewUOMwu64DlpDbv0uk3tSzZXWrMU+IT19TA50yv5/tDva+1xYRw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705427186; c=relaxed/simple;
	bh=LodwqaOsEDUEHn0GKKC1oEvO5NRvdIMf0U6PDs0WXF0=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:Received:From:To:Cc:
	 Subject:References:X-PGP-KeyID:X-PGP-CertKey:Date:Message-ID:
	 User-Agent:MIME-Version:Content-Type:X-Scanned-By; b=aTLPxYlLeTaXvPwEgX+01o4tYA1TGzsxf6f0ExuF5EO1IXPVdWmGWTHSch2NvNQI8jeF3mTn8ukJYdYhPK0eccT6M7acSDp3o8jQBxTEkyLgYQWZNyOv+Gv8ZxsDppJ0sRy2/HPMgPnIJrwSRfSf4fivYriG7bUCkQnr5AUt6o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XNGXZN4I; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705427184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Ial15Kpu3oyTf3h0mGFWe+pDzqBiZ9qg/SywZ2peWIk=;
	b=XNGXZN4I56VKlgBIMiVnpRQ60VcYsTq2oOGPM3sqEe1V2w9Vo8R5duXW+fA7Hdg50wZHwU
	7UnzAvGmNzaAUbqM8g/D8g/jKfL8Zq4awZjwia757rSqzihSqVWsSFdMQqDASuoO41wIdq
	180//4CpqJL0IF4ognwF7cP25k4i12o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-ueyID-MnNlmR_njneFCvvA-1; Tue, 16 Jan 2024 12:46:15 -0500
X-MC-Unique: ueyID-MnNlmR_njneFCvvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C952383B8E8;
	Tue, 16 Jan 2024 17:46:14 +0000 (UTC)
Received: from segfault.usersys.redhat.com (unknown [10.22.17.253])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3EFA2026D6F;
	Tue, 16 Jan 2024 17:46:13 +0000 (UTC)
From: Jeff Moyer <jmoyer@redhat.com>
To: Subramanya Swamy <subramanya.swamy.linux@gmail.com>
Cc: corbet@lwn.net,  axboe@kernel.dk,  asml.silence@gmail.com,
  ribalda@chromium.org,  rostedt@goodmis.org,  bhe@redhat.com,
  akpm@linux-foundation.org,  matteorizzo@google.com,  ardb@kernel.org,
  alexghiti@rivosinc.com,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  io-uring@vger.kernel.org
Subject: Re: [PATCH] iouring:added boundary value check for io_uring_group
 systl
References: <20240115124925.1735-1-subramanya.swamy.linux@gmail.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Tue, 16 Jan 2024 12:46:13 -0500
Message-ID: <x49edeh5fyy.fsf@segfault.usersys.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Subramanya Swamy <subramanya.swamy.linux@gmail.com> writes:

> /proc/sys/kernel/io_uring_group takes gid as input
> added boundary value check to accept gid in range of
> 0<=gid<=4294967294 & Documentation is updated for same

Thanks for the patch.  You're right, the current code artificially
limits the maximum group id.

> Signed-off-by: Subramanya Swamy <subramanya.swamy.linux@gmail.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 9 ++++-----
>  io_uring/io_uring.c                         | 8 ++++++--
>  2 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index 6584a1f9bfe3..3f96007aa971 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -469,11 +469,10 @@ shrinks the kernel's attack surface.
>  io_uring_group
>  ==============
>  
> -When io_uring_disabled is set to 1, a process must either be
> -privileged (CAP_SYS_ADMIN) or be in the io_uring_group group in order
> -to create an io_uring instance.  If io_uring_group is set to -1 (the
> -default), only processes with the CAP_SYS_ADMIN capability may create
> -io_uring instances.
> +When io_uring_disabled is set to 1, only processes with the
> +CAP_SYS_ADMIN may create io_uring instances or process must be in the
> +io_uring_group group in order to create an io_uring_instance.
> +io_uring_group is set to 0.This is the default setting.

You are changing the default from an invalid group to the root group.  I
guess that's ok, but I'd rather keep it the way it is.  The text is a
bit repetitive.  Why not just this?

"When io_uring_disabled is set to 1, a process must either be
 privileged (CAP_SYS_ADMIN) or be in the io_uring_group group in order
 to create an io_uring instance."

> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> index 09b6d860deba..0ed91b69643d 100644
> --- a/io_uring/io_uring.c
> +++ b/io_uring/io_uring.c
> @@ -146,7 +146,9 @@ static void io_queue_sqe(struct io_kiocb *req);
>  struct kmem_cache *req_cachep;
>  
>  static int __read_mostly sysctl_io_uring_disabled;
> -static int __read_mostly sysctl_io_uring_group = -1;
> +static unsigned int __read_mostly sysctl_io_uring_group;
> +static unsigned int min_gid;
> +static unsigned int max_gid  = 4294967294;  /*4294967294 is the max guid*/

Right, INVALID_GID is -1.

>  #ifdef CONFIG_SYSCTL
>  static struct ctl_table kernel_io_uring_disabled_table[] = {
> @@ -164,7 +166,9 @@ static struct ctl_table kernel_io_uring_disabled_table[] = {
>  		.data		= &sysctl_io_uring_group,
>  		.maxlen		= sizeof(gid_t),
>  		.mode		= 0644,
> -		.proc_handler	= proc_dointvec,
> +		.proc_handler	= proc_douintvec_minmax,
> +		.extra1         = &min_gid,

This should be SYSCTL_ZERO.

> +		.extra2         = &max_gid,
>  	},
>  	{},
>  };

Thanks!
Jeff


