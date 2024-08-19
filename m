Return-Path: <linux-doc+bounces-23178-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E47E956735
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 11:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 351A8280CBA
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 09:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E48D15CD6E;
	Mon, 19 Aug 2024 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ihxz45Xj"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFE115C12C
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724060230; cv=none; b=AXDJy0hnVuVQm0GGvtgC6Nf0WwzM6o4HW1iXJoxmndgvJTuIGrkS6A3r5suOEivs7tQNrqf21o/WRuTyJ8pBnph+i0wVmPH0iopuBvxouROQ6P+AiC0iUJCSoC+wcfM3LFIOBqf2oBUbF95HgqOnJQZAynqk/KIA2MSJ/AVyMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724060230; c=relaxed/simple;
	bh=F+UKEmcvDsJmxXdH+lUd+EzZWpI446bz+xi6gVWh+cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmsFAe8aT+MYsSyqp2Sg1EeeTh2NfiA+WqVGZpzPXbQnFb8tu6BVzr7YboRQzbGiZN6K2XPX3y7umWVDnrARnrcAdYu70Pvdk/OwiHCmx49D9zooed5jE2UZ5EmT6+PsUm9V3NefLpi3cdrRde0Cn5MDyaxY66DZKteENo1l1Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ihxz45Xj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724060227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gyhLuQueNQMuCrXYvkTRAcV5urEhM9QfwcqzGwlpWMQ=;
	b=Ihxz45XjbJeg0q0kNqP7kAR9odv0kpmbGag7EQEx1lZ1xZW+d72oUVq/nd3QTANtd+ivb2
	srhk9jKUXYbW24GFGLh3t8llpvOmPb+FTfCZobUpg7EMB5Y0qhcE+Aeudf5lquuzolX+ql
	p13Zs+Lc41bMrZRvgrbEhQMuBLrZXg4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-170-La9A1Bm1MZWN8njVw2B94Q-1; Mon,
 19 Aug 2024 05:37:01 -0400
X-MC-Unique: La9A1Bm1MZWN8njVw2B94Q-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 949E4195608A;
	Mon, 19 Aug 2024 09:36:58 +0000 (UTC)
Received: from localhost (unknown [10.72.112.51])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE2301956054;
	Mon, 19 Aug 2024 09:36:55 +0000 (UTC)
Date: Mon, 19 Aug 2024 17:36:51 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, corbet@lwn.net,
	akpm@linux-foundation.org
Cc: Petr Tesarik <petr@tesarici.cz>, Hari Bathini <hbathini@linux.ibm.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Document/kexec: Generalize crash hotplug description
Message-ID: <ZsMSM4Hgfm7yxFdj@MiWiFi-R3L-srv>
References: <20240812041651.703156-1-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812041651.703156-1-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Add Jonathan and Andew.

On 08/12/24 at 09:46am, Sourabh Jain wrote:
> Commit 79365026f869 ("crash: add a new kexec flag for hotplug support")
> generalizes the crash hotplug support to allow architectures to update
> multiple kexec segments on CPU/Memory hotplug and not just elfcorehdr.
> Therefore, update the relevant kernel documentation to reflect the same.

Hi Jonathan and Andew,

Could any of you pick this into your tree?

Thanks
Baoquan

> 
> Cc: Petr Tesarik <petr@tesarici.cz>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: kexec@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: x86@kernel.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> 
> Changelog:
> 
> Since v1: https://lore.kernel.org/all/20240805050829.297171-1-sourabhjain@linux.ibm.com/
>   - Update crash_hotplug sysfs document as suggested by Petr T
>   - Update an error message in crash_handle_hotplug_event and
>     crash_check_hotplug_support function.
> 
> ---
>  .../ABI/testing/sysfs-devices-memory          |  6 ++--
>  .../ABI/testing/sysfs-devices-system-cpu      |  6 ++--
>  .../admin-guide/mm/memory-hotplug.rst         |  5 +--
>  Documentation/core-api/cpu_hotplug.rst        | 10 +++---
>  kernel/crash_core.c                           | 33 +++++++++++--------
>  5 files changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-memory b/Documentation/ABI/testing/sysfs-devices-memory
> index a95e0f17c35a..cec65827e602 100644
> --- a/Documentation/ABI/testing/sysfs-devices-memory
> +++ b/Documentation/ABI/testing/sysfs-devices-memory
> @@ -115,6 +115,6 @@ What:		/sys/devices/system/memory/crash_hotplug
>  Date:		Aug 2023
>  Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>  Description:
> -		(RO) indicates whether or not the kernel directly supports
> -		modifying the crash elfcorehdr for memory hot un/plug and/or
> -		on/offline changes.
> +		(RO) indicates whether or not the kernel updates relevant kexec
> +		segments on memory hot un/plug and/or on/offline events, avoiding the
> +		need to reload kdump kernel.
> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
> index 325873385b71..1a31b7c71676 100644
> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
> @@ -703,9 +703,9 @@ What:		/sys/devices/system/cpu/crash_hotplug
>  Date:		Aug 2023
>  Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>  Description:
> -		(RO) indicates whether or not the kernel directly supports
> -		modifying the crash elfcorehdr for CPU hot un/plug and/or
> -		on/offline changes.
> +		(RO) indicates whether or not the kernel updates relevant kexec
> +		segments on memory hot un/plug and/or on/offline events, avoiding the
> +		need to reload kdump kernel.
>  
>  What:		/sys/devices/system/cpu/enabled
>  Date:		Nov 2022
> diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
> index 098f14d83e99..cb2c080f400c 100644
> --- a/Documentation/admin-guide/mm/memory-hotplug.rst
> +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
> @@ -294,8 +294,9 @@ The following files are currently defined:
>  ``crash_hotplug``      read-only: when changes to the system memory map
>  		       occur due to hot un/plug of memory, this file contains
>  		       '1' if the kernel updates the kdump capture kernel memory
> -		       map itself (via elfcorehdr), or '0' if userspace must update
> -		       the kdump capture kernel memory map.
> +		       map itself (via elfcorehdr and other relevant kexec
> +		       segments), or '0' if userspace must update the kdump
> +		       capture kernel memory map.
>  
>  		       Availability depends on the CONFIG_MEMORY_HOTPLUG kernel
>  		       configuration option.
> diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
> index dcb0e379e5e8..a21dbf261be7 100644
> --- a/Documentation/core-api/cpu_hotplug.rst
> +++ b/Documentation/core-api/cpu_hotplug.rst
> @@ -737,8 +737,9 @@ can process the event further.
>  
>  When changes to the CPUs in the system occur, the sysfs file
>  /sys/devices/system/cpu/crash_hotplug contains '1' if the kernel
> -updates the kdump capture kernel list of CPUs itself (via elfcorehdr),
> -or '0' if userspace must update the kdump capture kernel list of CPUs.
> +updates the kdump capture kernel list of CPUs itself (via elfcorehdr and
> +other relevant kexec segment), or '0' if userspace must update the kdump
> +capture kernel list of CPUs.
>  
>  The availability depends on the CONFIG_HOTPLUG_CPU kernel configuration
>  option.
> @@ -750,8 +751,9 @@ file can be used in a udev rule as follows:
>   SUBSYSTEM=="cpu", ATTRS{crash_hotplug}=="1", GOTO="kdump_reload_end"
>  
>  For a CPU hot un/plug event, if the architecture supports kernel updates
> -of the elfcorehdr (which contains the list of CPUs), then the rule skips
> -the unload-then-reload of the kdump capture kernel.
> +of the elfcorehdr (which contains the list of CPUs) and other relevant
> +kexec segments, then the rule skips the unload-then-reload of the kdump
> +capture kernel.
>  
>  Kernel Inline Documentations Reference
>  ======================================
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 63cf89393c6e..c1048893f4b6 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -505,7 +505,7 @@ int crash_check_hotplug_support(void)
>  	crash_hotplug_lock();
>  	/* Obtain lock while reading crash information */
>  	if (!kexec_trylock()) {
> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> +		pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
>  		crash_hotplug_unlock();
>  		return 0;
>  	}
> @@ -520,18 +520,25 @@ int crash_check_hotplug_support(void)
>  }
>  
>  /*
> - * To accurately reflect hot un/plug changes of cpu and memory resources
> - * (including onling and offlining of those resources), the elfcorehdr
> - * (which is passed to the crash kernel via the elfcorehdr= parameter)
> - * must be updated with the new list of CPUs and memories.
> + * To accurately reflect hot un/plug changes of CPU and Memory resources
> + * (including onling and offlining of those resources), the relevant
> + * kexec segments must be updated with latest CPU and Memory resources.
>   *
> - * In order to make changes to elfcorehdr, two conditions are needed:
> - * First, the segment containing the elfcorehdr must be large enough
> - * to permit a growing number of resources; the elfcorehdr memory size
> - * is based on NR_CPUS_DEFAULT and CRASH_MAX_MEMORY_RANGES.
> - * Second, purgatory must explicitly exclude the elfcorehdr from the
> - * list of segments it checks (since the elfcorehdr changes and thus
> - * would require an update to purgatory itself to update the digest).
> + * Architectures must ensure two things for all segments that need
> + * updating during hotplug events:
> + *
> + * 1. Segments must be large enough to accommodate a growing number of
> + *    resources.
> + * 2. Exclude the segments from SHA verification.
> + *
> + * For example, on most architectures, the elfcorehdr (which is passed
> + * to the crash kernel via the elfcorehdr= parameter) must include the
> + * new list of CPUs and memory. To make changes to the elfcorehdr, it
> + * should be large enough to permit a growing number of CPU and Memory
> + * resources. One can estimate the elfcorehdr memory size based on
> + * NR_CPUS_DEFAULT and CRASH_MAX_MEMORY_RANGES. The elfcorehdr is
> + * excluded from SHA verification by default if the architecture
> + * supports crash hotplug.
>   */
>  static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
>  {
> @@ -540,7 +547,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
>  	crash_hotplug_lock();
>  	/* Obtain lock while changing crash information */
>  	if (!kexec_trylock()) {
> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> +		pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
>  		crash_hotplug_unlock();
>  		return;
>  	}
> -- 
> 2.45.2
> 


