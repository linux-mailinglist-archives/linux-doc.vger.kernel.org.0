Return-Path: <linux-doc+bounces-2538-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E99457EED93
	for <lists+linux-doc@lfdr.de>; Fri, 17 Nov 2023 09:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B2BE1F2602F
	for <lists+linux-doc@lfdr.de>; Fri, 17 Nov 2023 08:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D7ED285;
	Fri, 17 Nov 2023 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SU3UIyeb"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B30B0;
	Fri, 17 Nov 2023 00:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700209995; x=1731745995;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LadFFOa9cUtU7ECOTPF5KVOGh+N1azQgLZ4EmevYVpc=;
  b=SU3UIyebWj6jGxHRvX05dBpekQ3zEExgY9zDPj9Cza05QwwJa/uFxuKk
   Xu0VPEg53DQ9vX3zskiOb7rCVhXDKlL96mIrpWuuaCgdTJD4v4IF15/E1
   uEiLLzSYU+0Vmj0NGR5RdHW0DMVZdlShBQXsOWHBDLJzgNqTzL84Nx0zx
   sYhfnC8BRaHYSaIlESiNxNuS/5Z2eVnltb9N/h1nOSvo/qaqJlh+GXDWm
   qRkTBBJKgopU5+5yuChI7WzHWU+yXkGOVSyYpR1Lir8efG2XT0Z2YTARd
   aRP6b2gCmHTlYdCQR5FaWUdi8E5XYrspDa1lqYb7R25jBQLULBhm4pE5z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="422355776"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="422355776"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 00:33:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="13846915"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.136]) ([10.249.254.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 00:33:11 -0800
Message-ID: <a1cbe3e8-2b2c-150a-7919-65bdd38f75be@linux.intel.com>
Date: Fri, 17 Nov 2023 09:33:08 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] Documentation/gpu: VM_BIND locking document
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Oak Zeng <oak.zeng@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <ZVYVk8KutkQE0RDU@archie.me>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZVYVk8KutkQE0RDU@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


On 11/16/23 14:13, Bagas Sanjaya wrote:
> On Wed, Nov 15, 2023 at 01:49:37PM +0100, Thomas Hellström wrote:
>> +TODO: Pointer to the gpuvm code implementation if this iteration and
> "... implementation of this iteration ..."
>
>> +Using a MMU notifier for device DMA (and other methods) is described in
>> +`this document
>> +<https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-notifier-registration-with-or-without-page-faulting-hardware>`_.
> You can use internal linking instead:
>
> ---- >8 ----
> diff --git a/Documentation/core-api/pin_user_pages.rst b/Documentation/core-api/pin_user_pages.rst
> index d3c1f6d8c0e0ec..6b5f7e6e7155fb 100644
> --- a/Documentation/core-api/pin_user_pages.rst
> +++ b/Documentation/core-api/pin_user_pages.rst
> @@ -153,6 +153,8 @@ NOTE: Some pages, such as DAX pages, cannot be pinned with longterm pins. That's
>   because DAX pages do not have a separate page cache, and so "pinning" implies
>   locking down file system blocks, which is not (yet) supported in that way.
>   
> +.. _mmu-notifier-registration-case:
> +
>   CASE 3: MMU notifier registration, with or without page faulting hardware
>   -------------------------------------------------------------------------
>   Device drivers can pin pages via get_user_pages*(), and register for mmu
> diff --git a/Documentation/gpu/drm-vm-bind-locking.rst b/Documentation/gpu/drm-vm-bind-locking.rst
> index bc701157cb3414..08b6a47a6e592f 100644
> --- a/Documentation/gpu/drm-vm-bind-locking.rst
> +++ b/Documentation/gpu/drm-vm-bind-locking.rst
> @@ -366,8 +366,7 @@ need to care about, but so far it has proven difficult to exclude
>   certain notifications.
>   
>   Using a MMU notifier for device DMA (and other methods) is described in
> -`this document
> -<https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-notifier-registration-with-or-without-page-faulting-hardware>`_.
> +:ref:`pin_user_pages() documentation <mmu-notifier-registration-case>`.
>   
>   Now the method of obtaining struct page references using
>   get_user_pages() unfortunately can't be used under a dma_resv lock
>
> Thanks.
>
Thanks. I'll take a look at doing this as well.

Thomas




