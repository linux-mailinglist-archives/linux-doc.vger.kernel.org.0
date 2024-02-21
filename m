Return-Path: <linux-doc+bounces-10232-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6213F85E3C2
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 17:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 989E4B211BB
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 16:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DD682D97;
	Wed, 21 Feb 2024 16:53:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AC08120C;
	Wed, 21 Feb 2024 16:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708534382; cv=none; b=qtyPUCYLQxibNCong3Uyrjo2T58boEy3SKgdFvYcLhmhHxQ3N1aW2yFWyXnbiReGalaLIA6brXxsAOf3dqzQcBPJ/N6H+EPOnEqsnLqNN7hRQDgO72oDA0otTV/u6hPAK0Xq6jjqKcgbUOKUmV62jYQCA8eOyQjUofssUtr2SDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708534382; c=relaxed/simple;
	bh=o61T7sI+EdvEVRgEuniHGTa4LNVV7kd7KCrs+ItmIv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YF1Du+tziqxbR7LvUY2qCjmb7YtwcDDNx6RTC2XqzsPr8+hSD7mSvj/tCE1XRvKfIzk2nR6rSac5AX0WDjl1+8a9WVNs8PvcgW8PwRaIQt0whqdslv32jvgz3ctFzt+FqUTjhDRXgVy6LA2u9AQ/ZlOGNgvgESHxkxdGx0mjZbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A5AF1007;
	Wed, 21 Feb 2024 08:53:37 -0800 (PST)
Received: from [10.1.39.40] (e122027.cambridge.arm.com [10.1.39.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 667143F73F;
	Wed, 21 Feb 2024 08:52:56 -0800 (PST)
Message-ID: <3769e867-64a8-4862-9791-da106eaa8501@arm.com>
Date: Wed, 21 Feb 2024 16:52:54 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Replace fdinfo's profiling debugfs knob
 with sysfs
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20240221161237.2478193-1-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240221161237.2478193-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/02/2024 16:12, Adrián Larumbe wrote:
> Debugfs isn't always available in production builds that try to squeeze
> every single byte out of the kernel image, but we still need a way to
> toggle the timestamp and cycle counter registers so that jobs can be
> profiled for fdinfo's drm engine and cycle calculations.
> 
> Drop the debugfs knob and replace it with a sysfs file that accomplishes
> the same functionality, and document its ABI in a separate file.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  .../testing/sysfs-driver-panfrost-profiling   | 10 +++
>  Documentation/gpu/panfrost.rst                |  9 +++
>  drivers/gpu/drm/panfrost/Makefile             |  5 +-
>  drivers/gpu/drm/panfrost/panfrost_debugfs.c   | 21 ------
>  drivers/gpu/drm/panfrost/panfrost_debugfs.h   | 14 ----
>  drivers/gpu/drm/panfrost/panfrost_device.h    |  5 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       | 14 ++--
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_sysfs.c     | 74 +++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_sysfs.h     | 15 ++++
>  10 files changed, 124 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-panfrost-profiling
>  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
>  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_sysfs.c
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_sysfs.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-panfrost-profiling b/Documentation/ABI/testing/sysfs-driver-panfrost-profiling
> new file mode 100644
> index 000000000000..ce54069714f3
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-panfrost-profiling
> @@ -0,0 +1,10 @@
> +What:		/sys/bus/.../drivers/panfrost/.../drm/../profiling/status
> +Date:		February 2024
> +KernelVersion:	6.8.0
> +Contact:	Adrian Larumbe <adrian.larumbe@collabora.com>
> +Description:
> +                Get/set drm fdinfo's engine and cycles profiling status.
> +                Valid values are:
> +		0: Disable fdinfo job profiling sources. This disables both the GPU's
> +                timestamp and cycle counter registers.
> +		1: Enable the above.

Minor point, but if we're going to eventually come up with a generic way
of doing this, then we're going to have to think about backwards
compatibility for this sysfs file. I would expect in this new world '0'
would mean "default behaviour; off unless the new-fangled thing enables
profiling" and '1' means "force on".

In which case perhaps wording like the below would be clearer:

0: Don't enable fdinfo job profiling sources.
1: Enable fdinfo job profiling sources, this enables both the GPU's
   timestamp and cycle counter registers.

Or am I being too picky over the wording ;)

One other small issue below...

> diff --git a/Documentation/gpu/panfrost.rst b/Documentation/gpu/panfrost.rst
> index b80e41f4b2c5..be4ac282ef63 100644
> --- a/Documentation/gpu/panfrost.rst
> +++ b/Documentation/gpu/panfrost.rst
> @@ -38,3 +38,12 @@ the currently possible format options:
>  
>  Possible `drm-engine-` key names are: `fragment`, and  `vertex-tiler`.
>  `drm-curfreq-` values convey the current operating frequency for that engine.
> +
> +Users must bear in mind that engine and cycle sampling are disabled by default,
> +because of power saving concerns. `fdinfo` users and benchmark applications which
> +query the fdinfo file must make sure to toggle the job profiling status of the
> +driver by writing into the appropriate sysfs node::
> +
> +    echo <N> > /sys/bus/platform/drivers/panfrost/[a-f0-9]*.gpu/drm/card1/profiling
> +
> +Where `N` is either `0` or `1`, depending on the desired enablement status.
> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
> index 2c01c1e7523e..6e718595d8a6 100644
> --- a/drivers/gpu/drm/panfrost/Makefile
> +++ b/drivers/gpu/drm/panfrost/Makefile
> @@ -10,8 +10,7 @@ panfrost-y := \
>  	panfrost_job.o \
>  	panfrost_mmu.o \
>  	panfrost_perfcnt.o \
> -	panfrost_dump.o
> -
> -panfrost-$(CONFIG_DEBUG_FS) += panfrost_debugfs.o
> +	panfrost_dump.o \
> +	panfrost_sysfs.o
>  
>  obj-$(CONFIG_DRM_PANFROST) += panfrost.o
> diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.c b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
> deleted file mode 100644
> index 72d4286a6bf7..000000000000
> --- a/drivers/gpu/drm/panfrost/panfrost_debugfs.c
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/* Copyright 2023 Collabora ltd. */
> -/* Copyright 2023 Amazon.com, Inc. or its affiliates. */
> -
> -#include <linux/debugfs.h>
> -#include <linux/platform_device.h>
> -#include <drm/drm_debugfs.h>
> -#include <drm/drm_file.h>
> -#include <drm/panfrost_drm.h>
> -
> -#include "panfrost_device.h"
> -#include "panfrost_gpu.h"
> -#include "panfrost_debugfs.h"
> -
> -void panfrost_debugfs_init(struct drm_minor *minor)
> -{
> -	struct drm_device *dev = minor->dev;
> -	struct panfrost_device *pfdev = platform_get_drvdata(to_platform_device(dev->dev));
> -
> -	debugfs_create_atomic_t("profile", 0600, minor->debugfs_root, &pfdev->profile_mode);
> -}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.h b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
> deleted file mode 100644
> index c5af5f35877f..000000000000
> --- a/drivers/gpu/drm/panfrost/panfrost_debugfs.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright 2023 Collabora ltd.
> - * Copyright 2023 Amazon.com, Inc. or its affiliates.
> - */
> -
> -#ifndef PANFROST_DEBUGFS_H
> -#define PANFROST_DEBUGFS_H
> -
> -#ifdef CONFIG_DEBUG_FS
> -void panfrost_debugfs_init(struct drm_minor *minor);
> -#endif
> -
> -#endif  /* PANFROST_DEBUGFS_H */
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 62f7e3527385..56c8e5551335 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -130,7 +130,10 @@ struct panfrost_device {
>  	struct list_head scheduled_jobs;
>  
>  	struct panfrost_perfcnt *perfcnt;
> -	atomic_t profile_mode;
> +	struct kobj_profiling {
> +		struct kobject base;
> +		atomic_t profile_mode;
> +	} profiling;
>  
>  	struct mutex sched_lock;
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index a926d71e8131..6db1ea453514 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -20,7 +20,7 @@
>  #include "panfrost_job.h"
>  #include "panfrost_gpu.h"
>  #include "panfrost_perfcnt.h"
> -#include "panfrost_debugfs.h"
> +#include "panfrost_sysfs.h"
>  
>  static bool unstable_ioctls;
>  module_param_unsafe(unstable_ioctls, bool, 0600);
> @@ -600,10 +600,6 @@ static const struct drm_driver panfrost_drm_driver = {
>  
>  	.gem_create_object	= panfrost_gem_create_object,
>  	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
> -
> -#ifdef CONFIG_DEBUG_FS
> -	.debugfs_init		= panfrost_debugfs_init,
> -#endif
>  };
>  
>  static int panfrost_probe(struct platform_device *pdev)
> @@ -663,8 +659,14 @@ static int panfrost_probe(struct platform_device *pdev)
>  	if (err)
>  		goto err_out2;
>  
> +	err = panfrost_sysfs_init(pfdev);
> +	if (err)
> +		goto err_out3;
> +
>  	return 0;
>  
> +err_out3:
> +	panfrost_gem_shrinker_cleanup(ddev);
>  err_out2:
>  	drm_dev_unregister(ddev);
>  err_out1:
> @@ -681,6 +683,8 @@ static void panfrost_remove(struct platform_device *pdev)
>  	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
>  	struct drm_device *ddev = pfdev->ddev;
>  
> +	panfrost_sysfs_cleanup(pfdev);
> +
>  	drm_dev_unregister(ddev);
>  	panfrost_gem_shrinker_cleanup(ddev);
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 0c2dbf6ef2a5..49413dfda2ea 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -243,7 +243,7 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  	subslot = panfrost_enqueue_job(pfdev, js, job);
>  	/* Don't queue the job if a reset is in progress */
>  	if (!atomic_read(&pfdev->reset.pending)) {
> -		if (atomic_read(&pfdev->profile_mode)) {
> +		if (atomic_read(&pfdev->profiling.profile_mode)) {
>  			panfrost_cycle_counter_get(pfdev);
>  			job->is_profiled = true;
>  			job->start_time = ktime_get();
> diff --git a/drivers/gpu/drm/panfrost/panfrost_sysfs.c b/drivers/gpu/drm/panfrost/panfrost_sysfs.c
> new file mode 100644
> index 000000000000..072d3bf349d2
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_sysfs.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2023 Collabora ltd. */
> +/* Copyright 2023 Amazon.com, Inc. or its affiliates. */
> +
> +#include <linux/platform_device.h>
> +#include <drm/drm_file.h>
> +#include <drm/panfrost_drm.h>
> +
> +#include "panfrost_device.h"
> +#include "panfrost_gpu.h"
> +#include "panfrost_sysfs.h"
> +
> +static ssize_t
> +profiling_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	atomic_t *profile_mode =
> +		&container_of(kobj, struct {
> +			struct kobject base;
> +			atomic_t profile_mode; },
> +			base)->profile_mode;

Yuck! ;) That's likely to catch people out if they modify the struct in
the header file.

Why not "struct kobj_profiling" rather than that inline struct. I'd also
argue that kobj_profiling isn't a great name and I'd suggest something
with 'panfrost' in the name. Or you could just use the parent struct
panfrost_device and not bother naming this sub-struct, e.g.

&container_of(kobj, struct panfrost_device,
              profiling.base)->profiling.profile_mode;

Thanks,
Steve

> +
> +	return sysfs_emit(buf, "%d\n", atomic_read(profile_mode));
> +}
> +
> +static ssize_t
> +profiling_store(struct kobject *kobj, struct kobj_attribute *attr,
> +	       const char *buf, size_t count)
> +{
> +	atomic_t *profile_mode =
> +		&container_of(kobj, struct {
> +			struct kobject base;
> +			atomic_t profile_mode; },
> +			base)->profile_mode;
> +	int err, value;
> +
> +	err = kstrtoint(buf, 0, &value);
> +	if (err)
> +		return err;
> +
> +	atomic_set(profile_mode, !!value);
> +
> +	return count;
> +}
> +
> +static const struct kobj_attribute profiling_status =
> +__ATTR(status, 0644, profiling_show, profiling_store);
> +
> +static const struct kobj_type kobj_profile_type = {
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +int panfrost_sysfs_init(struct panfrost_device *pfdev)
> +{
> +	struct device *kdev = pfdev->ddev->primary->kdev;
> +	int err;
> +
> +	kobject_init(&pfdev->profiling.base, &kobj_profile_type);
> +
> +	err = kobject_add(&pfdev->profiling.base, &kdev->kobj, "%s", "profiling");
> +	if (err)
> +		return err;
> +
> +	err = sysfs_create_file(&pfdev->profiling.base, &profiling_status.attr);
> +	if (err)
> +		kobject_del(&pfdev->profiling.base);
> +
> +	return err;
> +}
> +
> +void panfrost_sysfs_cleanup(struct panfrost_device *pfdev)
> +{
> +	sysfs_remove_file(&pfdev->profiling.base, &profiling_status.attr);
> +	kobject_del(&pfdev->profiling.base);
> +}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_sysfs.h b/drivers/gpu/drm/panfrost/panfrost_sysfs.h
> new file mode 100644
> index 000000000000..5fc9c8c1091a
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_sysfs.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2023 Collabora ltd.
> + * Copyright 2023 Amazon.com, Inc. or its affiliates.
> + */
> +
> +#ifndef PANFROST_SYSFS_H
> +#define PANFROST_SYSFS_H
> +
> +struct panfrost_device;
> +
> +int panfrost_sysfs_init(struct panfrost_device *pfdev);
> +void panfrost_sysfs_cleanup(struct panfrost_device *pfdev);
> +
> +#endif  /* PANFROST_SYSFS_H */


