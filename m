Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D4E30AC2B
	for <lists+linux-doc@lfdr.de>; Mon,  1 Feb 2021 17:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbhBAP7r (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 1 Feb 2021 10:59:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:59136 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232046AbhBAP7S (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Feb 2021 10:59:18 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1612195112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nEETdCuVwVfGJZxiAb2PYpPPGynNVeuMsgxpxgU089I=;
        b=mN/lnziNrRIeDyINHbyx7IsbreLHOARh7HY2puVrEj+63LUtR/+n8glVQU3iIHu7v3HeXV
        G5VaZ0y8AVQEDAMDQQPS72c/3RymAlosz7qJiNdwDQMl0pz/F2pUZvVI6IUDG4mq9rUTC0
        0DC7cLh52rpPXXBD/oG4GOw4VhuDUzc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E13AAACB7;
        Mon,  1 Feb 2021 15:58:31 +0000 (UTC)
Date:   Mon, 1 Feb 2021 16:58:25 +0100
From:   Michal Hocko <mhocko@suse.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Oscar Salvador <osalvador@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ilya Dryomov <idryomov@gmail.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        Tom Rix <trix@redhat.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 1/2] drivers/base/memory: don't store phys_device in
 memory blocks
Message-ID: <YBglIbIGc1tTuvG5@dhcp22.suse.cz>
References: <20210201105158.6393-1-david@redhat.com>
 <20210201105158.6393-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201105158.6393-2-david@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon 01-02-21 11:51:57, David Hildenbrand wrote:
> No need to store the value for each and every memory block, as we can
> easily query the value at runtime. Reshuffle the members to optimize the
> memory layout. Also, let's clarify what the interface once was used for
> and why it's legacy nowadays.
> 
> "phys_device" was used on s390x in older versions of lsmem[2]/chmem[3],
> back when they were still part of s390x-tools. They were later replaced
> by the variants in linux-utils. For example, RHEL6 and RHEL7 contain
> lsmem/chmem from s390-utils. RHEL8 switched to versions from util-linux
> on s390x [4].
> 
> "phys_device" was added with sysfs support for memory hotplug in
> commit 3947be1969a9 ("[PATCH] memory hotplug: sysfs and add/remove
> functions") in 2005. It always returned 0.
> 
> s390x started returning something != 0 on some setups (if sclp.rzm is
> set by HW) in 2010 via commit 57b552ba0b2f ("memory hotplug/s390: set
> phys_device").
> 
> For s390x, it allowed for identifying which memory block devices belong
> to the same storage increment (RZM). Only if all memory block devices
> comprising a single storage increment were offline, the memory could
> actually be removed in the hypervisor.
> 
> Since commit e5d709bb5fb7 ("s390/memory hotplug: provide
> memory_block_size_bytes() function") in 2013 a memory block devices
> spans at least one storage increment - which is why the interface isn't
> really helpful/used anymore (except by old lsmem/chmem tools).
> 
> There were once RFC patches to make use of "phys_device" in ACPI context;
> however, the underlying problem could be solved using different
> interfaces [1].
> 
> [1] https://patchwork.kernel.org/patch/2163871/
> [2] https://github.com/ibm-s390-tools/s390-tools/blob/v2.1.0/zconf/lsmem
> [3] https://github.com/ibm-s390-tools/s390-tools/blob/v2.1.0/zconf/chmem
> [4] https://bugzilla.redhat.com/show_bug.cgi?id=1504134

Thanks for an excellent changelog!
 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Dave Hansen <dave.hansen@intel.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Ilya Dryomov <idryomov@gmail.com>
> Cc: Vaibhav Jain <vaibhav@linux.ibm.com>
> Cc: Tom Rix <trix@redhat.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  .../ABI/testing/sysfs-devices-memory          |  5 ++--
>  .../admin-guide/mm/memory-hotplug.rst         |  4 ++--
>  drivers/base/memory.c                         | 23 ++++++++-----------
>  include/linux/memory.h                        |  3 +--
>  4 files changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-memory b/Documentation/ABI/testing/sysfs-devices-memory
> index 246a45b96d22..58dbc592bc57 100644
> --- a/Documentation/ABI/testing/sysfs-devices-memory
> +++ b/Documentation/ABI/testing/sysfs-devices-memory
> @@ -26,8 +26,9 @@ Date:		September 2008
>  Contact:	Badari Pulavarty <pbadari@us.ibm.com>
>  Description:
>  		The file /sys/devices/system/memory/memoryX/phys_device
> -		is read-only and is designed to show the name of physical
> -		memory device.  Implementation is currently incomplete.
> +		is read-only;  it is a legacy interface only ever used on s390x
> +		to expose the covered storage increment.
> +Users:		Legacy s390-tools lsmem/chmem
>  
>  What:		/sys/devices/system/memory/memoryX/phys_index
>  Date:		September 2008
> diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
> index 5c4432c96c4b..245739f55ac7 100644
> --- a/Documentation/admin-guide/mm/memory-hotplug.rst
> +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
> @@ -160,8 +160,8 @@ Under each memory block, you can see 5 files:
>  
>                      "online_movable", "online", "offline" command
>                      which will be performed on all sections in the block.
> -``phys_device``     read-only: designed to show the name of physical memory
> -                    device.  This is not well implemented now.
> +``phys_device``	    read-only: legacy interface only ever used on s390x to
> +		    expose the covered storage increment.
>  ``removable``       read-only: contains an integer value indicating
>                      whether the memory block is removable or not
>                      removable.  A value of 1 indicates that the memory
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 901e379676be..16959d339172 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -290,20 +290,20 @@ static ssize_t state_store(struct device *dev, struct device_attribute *attr,
>  }
>  
>  /*
> - * phys_device is a bad name for this.  What I really want
> - * is a way to differentiate between memory ranges that
> - * are part of physical devices that constitute
> - * a complete removable unit or fru.
> - * i.e. do these ranges belong to the same physical device,
> - * s.t. if I offline all of these sections I can then
> - * remove the physical device?
> + * Legacy interface that we cannot remove: s390x exposes the storage increment
> + * covered by a memory block, allowing for identifying which memory blocks
> + * comprise a storage increment. Since a memory block spans complete
> + * storage increments nowadays, this interface is basically unused. Other
> + * archs never exposed != 0.
>   */
>  static ssize_t phys_device_show(struct device *dev,
>  				struct device_attribute *attr, char *buf)
>  {
>  	struct memory_block *mem = to_memory_block(dev);
> +	unsigned long start_pfn = section_nr_to_pfn(mem->start_section_nr);
>  
> -	return sysfs_emit(buf, "%d\n", mem->phys_device);
> +	return sysfs_emit(buf, "%d\n",
> +			  arch_get_memory_phys_device(start_pfn));
>  }
>  
>  #ifdef CONFIG_MEMORY_HOTREMOVE
> @@ -488,11 +488,7 @@ static DEVICE_ATTR_WO(soft_offline_page);
>  static DEVICE_ATTR_WO(hard_offline_page);
>  #endif
>  
> -/*
> - * Note that phys_device is optional.  It is here to allow for
> - * differentiation between which *physical* devices each
> - * section belongs to...
> - */
> +/* See phys_device_show(). */
>  int __weak arch_get_memory_phys_device(unsigned long start_pfn)
>  {
>  	return 0;
> @@ -589,7 +585,6 @@ static int init_memory_block(unsigned long block_id, unsigned long state)
>  	mem->start_section_nr = block_id * sections_per_block;
>  	mem->state = state;
>  	start_pfn = section_nr_to_pfn(mem->start_section_nr);
> -	mem->phys_device = arch_get_memory_phys_device(start_pfn);
>  	mem->nid = NUMA_NO_NODE;
>  
>  	ret = register_memory(mem);
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index 439a89e758d8..4da95e684e20 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -27,9 +27,8 @@ struct memory_block {
>  	unsigned long start_section_nr;
>  	unsigned long state;		/* serialized by the dev->lock */
>  	int online_type;		/* for passing data to online routine */
> -	int phys_device;		/* to which fru does this belong? */
> -	struct device dev;
>  	int nid;			/* NID for this memory block */
> +	struct device dev;
>  };
>  
>  int arch_get_memory_phys_device(unsigned long start_pfn);
> -- 
> 2.29.2
> 

-- 
Michal Hocko
SUSE Labs
