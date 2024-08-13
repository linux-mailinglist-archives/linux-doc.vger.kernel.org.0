Return-Path: <linux-doc+bounces-22694-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A37394FF2E
	for <lists+linux-doc@lfdr.de>; Tue, 13 Aug 2024 09:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C58881F24F16
	for <lists+linux-doc@lfdr.de>; Tue, 13 Aug 2024 07:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B8455884;
	Tue, 13 Aug 2024 07:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5iF+mAk"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BE5D531;
	Tue, 13 Aug 2024 07:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723535803; cv=none; b=EErRoJPvsevaozI4s1houDbUB/ml+wqdpKDHt57veb3S0GmQwGBXrWgZpIIiG6NYyOnKeceZFDq2uMfzd66e9pYnoFk0mypvxbe540wRBgdNl6Thxs+iGjE9mf48JnPB2KN75pNrsPq2FR6G3/CMR5x0l5fPs6frtm06RcTMgWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723535803; c=relaxed/simple;
	bh=KYijDMxWTruxUOHeIXuSweAvO2AIcNRXv9pQTHmdND4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hcF6ZOsPWfHmrJohvnI0ZotVyo5PmzILwrFGZmeRyGF2qyvyujezyIDhPofIrWJShTFyTuMgCbpbBQDLa6ZSkUsgzhqmIIjPUIydcyU5uFlsj1d+RFV9t4JAULUhTq7PZokyBfek5iiJSp81uVzF/ah0Ie7k6II0pOu19sJ4Cts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5iF+mAk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723535800; x=1755071800;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=KYijDMxWTruxUOHeIXuSweAvO2AIcNRXv9pQTHmdND4=;
  b=l5iF+mAkHJ8O6704NkawDsDOkhCf/ZgC6w57SwuCdrkLFwAKnktObs4/
   wCU0zW7MG/1ltHEk1aKcw8FyXziaPyDnC8Kk5DGZJEtxqwj4Hd2vMzCz+
   hZSkRjo5ujyzskQ2Piw216/49F4Oozool//mJmEeUQG6gwxgy55cwv58a
   Vg+AP/H5Z0gHH+IyWk4MJRKe+5NwePSYjVOTa6xstAg4/FsEYiir4fovK
   bfK5B8zlHmVa5tmDjkEgqwjb7qSETl2GqAxS2wvz1oE+QghFarnKRk9g6
   zOYGjnIkfTqvvlhWcSEGZO0Q1P592v2JFuSFuzvb1c1RfHftdB76OXI46
   g==;
X-CSE-ConnectionGUID: rr+6QuegRUmbXfP3dIm97w==
X-CSE-MsgGUID: uyrk4iu1TXCR4loK6taZ4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25546395"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="25546395"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 00:56:39 -0700
X-CSE-ConnectionGUID: lG7mVi4oRlqiqUXf6sr6fg==
X-CSE-MsgGUID: kpoadPFQSNGgFJblkarbew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="63438975"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.234])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 00:56:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Harry
 Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Matt Hartley <matt.hartley@gmail.com>, Kieran
 Levin <ktl@framework.net>, Hans de Goede <hdegoede@redhat.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 linux-doc@vger.kernel.org, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Subject: Re: [PATCH v4 1/3] drm: Add panel backlight quirks
In-Reply-To: <20240812-amdgpu-min-backlight-quirk-v4-1-56a63ff897b7@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240812-amdgpu-min-backlight-quirk-v4-0-56a63ff897b7@weissschuh.net>
 <20240812-amdgpu-min-backlight-quirk-v4-1-56a63ff897b7@weissschuh.net>
Date: Tue, 13 Aug 2024 10:56:30 +0300
Message-ID: <878qx026vl.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Aug 2024, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:
> Panels using a PWM-controlled backlight source without an do not have a
> standard way to communicate their valid PWM ranges.
> On x86 the ranges are read from ACPI through driver-specific tables.
> The built-in ranges are not necessarily correct, or may grow stale if an
> older device can be retrofitted with newer panels.
>
> Add a quirk infrastructure with which the minimum valid backlight value
> can be maintained as part of the kernel.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  Documentation/gpu/drm-kms-helpers.rst        |  3 ++
>  drivers/gpu/drm/Kconfig                      |  4 ++
>  drivers/gpu/drm/Makefile                     |  1 +
>  drivers/gpu/drm/drm_panel_backlight_quirks.c | 69 ++++++++++++++++++++++=
++++++
>  include/drm/drm_utils.h                      |  3 ++
>  5 files changed, 80 insertions(+)
>
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/dr=
m-kms-helpers.rst
> index 8435e8621cc0..a26989500129 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -230,6 +230,9 @@ Panel Helper Reference
>  .. kernel-doc:: drivers/gpu/drm/drm_panel_orientation_quirks.c
>     :export:
>=20=20
> +.. kernel-doc:: drivers/gpu/drm/drm_panel_backlight_quirks.c
> +   :export:
> +
>  Panel Self Refresh Helper Reference
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 6b2c6b91f962..9ebb8cdb535e 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -454,6 +454,10 @@ config DRM_HYPERV
>  config DRM_EXPORT_FOR_TESTS
>  	bool
>=20=20
> +# Separate option as not all DRM drivers use it
> +config DRM_PANEL_BACKLIGHT_QUIRKS
> +	tristate
> +
>  config DRM_LIB_RANDOM
>  	bool
>  	default n
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 68cc9258ffc4..adf85999aee2 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -92,6 +92,7 @@ drm-$(CONFIG_DRM_PANIC) +=3D drm_panic.o
>  obj-$(CONFIG_DRM)	+=3D drm.o
>=20=20
>  obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) +=3D drm_panel_orientation_qu=
irks.o
> +obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) +=3D drm_panel_backlight_quirks=
.o
>=20=20
>  #
>  # Memory-management helpers
> diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/d=
rm/drm_panel_backlight_quirks.c
> new file mode 100644
> index 000000000000..a88e77db97c5
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/array_size.h>
> +#include <linux/dmi.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <drm/drm_utils.h>
> +
> +struct drm_panel_min_backlight_quirk {
> +	struct {
> +		enum dmi_field field;
> +		const char * const value;
> +	} dmi_match;
> +	struct drm_edid_ident ident;
> +	u8 min_brightness;
> +};
> +
> +static const struct drm_panel_min_backlight_quirk drm_panel_min_backligh=
t_quirks[] =3D {
> +};
> +
> +static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel=
_min_backlight_quirk *quirk,
> +						  const struct drm_edid *edid)
> +{
> +	if (!dmi_match(quirk->dmi_match.field, quirk->dmi_match.value))
> +		return false;
> +
> +	if (!drm_edid_match(edid, &quirk->ident))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * drm_get_panel_min_brightness_quirk - Get minimum supported brightness=
 level for a panel.
> + * @edid: EDID of the panel to check
> + *
> + * This function checks for platform specific (e.g. DMI based) quirks
> + * providing info on the minimum backlight brightness for systems where =
this
> + * cannot be probed correctly from the hard-/firm-ware.
> + *
> + * Returns:
> + * A negative error value or
> + * an override value in the range [0, 255] representing 0-100% to be sca=
led to
> + * the drivers target range.
> + */
> +int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid)
> +{
> +	const struct drm_panel_min_backlight_quirk *quirk;
> +	size_t i;
> +
> +	if (!IS_ENABLED(CONFIG_DMI))
> +		return -ENODATA;
> +
> +	if (!edid)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(drm_panel_min_backlight_quirks); i++) {
> +		quirk =3D &drm_panel_min_backlight_quirks[i];
> +
> +		if (drm_panel_min_backlight_quirk_matches(quirk, edid))
> +			return quirk->min_brightness;
> +	}
> +
> +	return -ENODATA;
> +}
> +EXPORT_SYMBOL(drm_get_panel_min_brightness_quirk);
> +
> +MODULE_DESCRIPTION("Quirks for panel backlight overrides");
> +MODULE_LICENSE("GPL");
> diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
> index 70775748d243..267711028dd4 100644
> --- a/include/drm/drm_utils.h
> +++ b/include/drm/drm_utils.h
> @@ -11,9 +11,12 @@
>  #define __DRM_UTILS_H__
>=20=20
>  #include <linux/types.h>
> +#include <drm/drm_edid.h>

Please prefer forward declarations over includes where possible.

Here,

struct drm_edid;

is sufficient.

BR,
Jani.

>=20=20
>  int drm_get_panel_orientation_quirk(int width, int height);
>=20=20
> +int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid);
> +
>  signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec);
>=20=20
>  #endif

--=20
Jani Nikula, Intel

