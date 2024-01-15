Return-Path: <linux-doc+bounces-6829-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1500F82DB55
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jan 2024 15:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5062DB2146B
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jan 2024 14:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B46175AD;
	Mon, 15 Jan 2024 14:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MuUx/7hH"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C251759C
	for <linux-doc@vger.kernel.org>; Mon, 15 Jan 2024 14:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705329194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=28ByMKhxREBk/TWcgDByOFvaCc0zqNnOfSlV0PATldA=;
	b=MuUx/7hHrgA/8HcAnH2xuh+MtMvhDmKd92+qOl7Iw7KpG49uNw05Rq91spIppbBXbUDKSG
	vEbKfAT1T1bGHrJV/6vygM+KXKCn5Wg+zsNG9hABdamt+Q3pwwKGRJIiXXLvPGqf/K2Z2Z
	GI64f23MKFoJnvcHJNY55c+P8mtc3lw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-T3HaujCsOw-pwf_FFsSmoQ-1; Mon, 15 Jan 2024 09:33:12 -0500
X-MC-Unique: T3HaujCsOw-pwf_FFsSmoQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40e5769e2deso39981355e9.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Jan 2024 06:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705329191; x=1705933991;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28ByMKhxREBk/TWcgDByOFvaCc0zqNnOfSlV0PATldA=;
        b=Kev98Br/ErRdlQ5MgEqJpOzPHTG52gzfuy8/Vielf5lgYzxWPRdffynkWmt7EnxBcT
         QzxH4BXyuTa3Urw5uH9JBWVc+hPsxf2K8Wig/Jbtae8IKODv8SjvI8Jfis4E9AtvP08i
         x0f7p3RtV28agdsiJ86ATkVmn4J4Xqym85akH4VyoNBap6g6IQLG8CBN/a5oUvZlMWj4
         LaMPds0oEc0bnqWas42P4O7Og31gGxIHcJCf8unXhm64nmFRb6ykdC67sIlz2FSqmh7d
         FEROxzCfW0V5jrcvDGdiP83qoXT+C3WA7U2GXyNSOnE4xsarCVJGytRB4MdZRXAnclJR
         +RmQ==
X-Gm-Message-State: AOJu0YxIRGaIxIEr1DV5XC+MataAKvAp6jPKXHe/jTpGBeDJOHtj2T82
	C2Kro1Vrl7doDn18w7entxShUDRzsLXobAWx3zVBwjQEO88Rk7getdN37jr0SYqR72R8/BliBPM
	ks7nPmAyyeNrGwNNX7GeaPQwV/FTP
X-Received: by 2002:a7b:cc81:0:b0:40e:3f90:3920 with SMTP id p1-20020a7bcc81000000b0040e3f903920mr2035180wma.230.1705329191023;
        Mon, 15 Jan 2024 06:33:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnFpNvbECPYnHXUb6ozmA7yyk68z6lU24Rulo6C/Itudf1qtyIV6rA40/SMTmfGJac297SBQ==
X-Received: by 2002:a7b:cc81:0:b0:40e:3f90:3920 with SMTP id p1-20020a7bcc81000000b0040e3f903920mr2035169wma.230.1705329190506;
        Mon, 15 Jan 2024 06:33:10 -0800 (PST)
Received: from toolbox ([2001:9e8:8996:a800:5fa3:a411:5e47:8fe5])
        by smtp.gmail.com with ESMTPSA id o8-20020a05600c4fc800b0040e549c77a1sm20056078wmq.32.2024.01.15.06.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 06:33:10 -0800 (PST)
Date: Mon, 15 Jan 2024 15:33:08 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240115143308.GA159345@toolbox>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>

On Thu, Dec 07, 2023 at 04:49:31PM +0100, Maxime Ripard wrote:
> The i915 driver has a property to force the RGB range of an HDMI output.
> The vc4 driver then implemented the same property with the same
> semantics. KWin has support for it, and a PR for mutter is also there to
> support it.
> 
> Both drivers implementing the same property with the same semantics,
> plus the userspace having support for it, is proof enough that it's
> pretty much a de-facto standard now and we can provide helpers for it.
> 
> Let's plumb it into the newly created HDMI connector.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/kms-properties.csv               |   1 -
>  drivers/gpu/drm/drm_atomic.c                       |   5 +
>  drivers/gpu/drm/drm_atomic_state_helper.c          |  17 +
>  drivers/gpu/drm/drm_atomic_uapi.c                  |   4 +
>  drivers/gpu/drm/drm_connector.c                    |  76 +++++
>  drivers/gpu/drm/tests/Makefile                     |   1 +
>  .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 376 +++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_connector_test.c         | 117 ++++++-
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 106 ++++++
>  include/drm/drm_connector.h                        |  36 ++
>  10 files changed, 737 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
> index 0f9590834829..caef14c532d4 100644
> --- a/Documentation/gpu/kms-properties.csv
> +++ b/Documentation/gpu/kms-properties.csv
> @@ -17,7 +17,6 @@ Owner Module/Drivers,Group,Property Name,Type,Property Values,Object attached,De
>  ,Virtual GPU,“suggested X”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an X offset for a connector
>  ,,“suggested Y”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an Y offset for a connector
>  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Connector,TDB
> -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Limited 16:235"" }",Connector,"When this property is set to Limited 16:235 and CTM is set, the hardware will be programmed with the result of the multiplication of CTM by the limited range matrix to ensure the pixels normally in the range 0..1.0 are remapped to the range 16/255..235/255."
>  ,,“audio”,ENUM,"{ ""force-dvi"", ""off"", ""auto"", ""on"" }",Connector,TBD
>  ,SDVO-TV,“mode”,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC_443"", ""PAL_B"" } etc.",Connector,TBD
>  ,,"""left_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index c31fc0b48c31..1465a7f09a0b 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1142,6 +1142,11 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
>  	drm_printf(p, "\tmax_requested_bpc=%d\n", state->max_requested_bpc);
>  	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
>  
> +	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
> +		drm_printf(p, "\tbroadcast_rgb=%s\n",
> +			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
> +
>  	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
>  		if (state->writeback_job && state->writeback_job->fb)
>  			drm_printf(p, "\tfb=%d\n", state->writeback_job->fb->base.id);
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index e69c0cc1c6da..10d98620a358 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -583,6 +583,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
>  void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
>  					      struct drm_connector_state *new_state)
>  {
> +	new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
>  
> @@ -650,6 +651,22 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
>  int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>  					   struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *old_state =
> +		drm_atomic_get_old_connector_state(state, connector);
> +	struct drm_connector_state *new_state =
> +		drm_atomic_get_new_connector_state(state, connector);
> +
> +	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb) {
> +		struct drm_crtc *crtc = new_state->crtc;
> +		struct drm_crtc_state *crtc_state;
> +
> +		crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +		if (IS_ERR(crtc_state))
> +			return PTR_ERR(crtc_state);
> +
> +		crtc_state->mode_changed = true;
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index aee4a65d4959..3eb4f4bc8b71 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -818,6 +818,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  		state->max_requested_bpc = val;
>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		state->privacy_screen_sw_state = val;
> +	} else if (property == connector->broadcast_rgb_property) {
> +		state->hdmi.broadcast_rgb = val;
>  	} else if (connector->funcs->atomic_set_property) {
>  		return connector->funcs->atomic_set_property(connector,
>  				state, property, val);
> @@ -901,6 +903,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		*val = state->max_requested_bpc;
>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		*val = state->privacy_screen_sw_state;
> +	} else if (property == connector->broadcast_rgb_property) {
> +		*val = state->hdmi.broadcast_rgb;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index d9961cce8245..929b0a911f62 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1183,6 +1183,29 @@ static const u32 dp_colorspaces =
>  	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
>  	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
>  
> +static const struct drm_prop_enum_list broadcast_rgb_names[] = {
> +	{ DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic" },
> +	{ DRM_HDMI_BROADCAST_RGB_FULL, "Full" },
> +	{ DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235" },
> +};
> +
> +/*
> + * drm_hdmi_connector_get_broadcast_rgb_name - Return a string for HDMI connector RGB broadcast selection
> + * @broadcast_rgb: Broadcast RGB selection to compute name of
> + *
> + * Returns: the name of the Broadcast RGB selection, or NULL if the type
> + * is not valid.
> + */
> +const char *
> +drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb)
> +{
> +	if (broadcast_rgb > DRM_HDMI_BROADCAST_RGB_LIMITED)
> +		return NULL;
> +
> +	return broadcast_rgb_names[broadcast_rgb].name;
> +}
> +EXPORT_SYMBOL(drm_hdmi_connector_get_broadcast_rgb_name);
> +
>  /**
>   * DOC: standard connector properties
>   *
> @@ -1655,6 +1678,26 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
>  /**
>   * DOC: HDMI connector properties
>   *
> + * Broadcast RGB
> + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> + *      Infoframes will be generated according to that value.
> + *
> + *      The value of this property can be one of the following:
> + *
> + *      Automatic:
> + *              RGB Range is selected automatically based on the mode
> + *              according to the HDMI specifications.
> + *
> + *      Full:
> + *              Full RGB Range is forced.
> + *
> + *      Limited 16:235:
> + *              Limited RGB Range is forced. Unlike the name suggests,
> + *              this works for any number of bits-per-component.
> + *
> + *      Drivers can set up this property by calling
> + *      drm_connector_attach_broadcast_rgb_property().
> + *

This is a good time to document this in more detail. There might be two
different things being affected:

1. The signalling (InfoFrame/SDP/...)
2. The color pipeline processing

All values of Broadcast RGB always affect the color pipeline processing
such that a full-range input to the CRTC is converted to either full- or
limited-range, depending on what the monitor is supposed to accept.

When automatic is selected, does that mean that there is no signalling,
or that the signalling matches what the monitor is supposed to accept
according to the spec? Also, is this really HDMI specific?

When full or limited is selected and the monitor doesn't support the
signalling, what happens?

>   * content type (HDMI specific):
>   *	Indicates content type setting to be used in HDMI infoframes to indicate
>   *	content type for the external device, so that it adjusts its display
> @@ -2517,6 +2560,39 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
>  }
>  EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
>  
> +/**
> + * drm_connector_attach_broadcast_rgb_property - attach "Broadcast RGB" property
> + * @connector: connector to attach the property on.
> + *
> + * This is used to add support for forcing the RGB range on a connector
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop;
> +
> +	prop = connector->broadcast_rgb_property;
> +	if (!prop) {
> +		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
> +						"Broadcast RGB",
> +						broadcast_rgb_names,
> +						ARRAY_SIZE(broadcast_rgb_names));
> +		if (!prop)
> +			return -EINVAL;
> +
> +		connector->broadcast_rgb_property = prop;
> +	}
> +
> +	drm_object_attach_property(&connector->base, prop,
> +				   DRM_HDMI_BROADCAST_RGB_AUTO);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_connector_attach_broadcast_rgb_property);
> +
>  /**
>   * drm_connector_attach_colorspace_property - attach "Colorspace" property
>   * @connector: connector to attach the property on.
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index d6183b3d7688..b29ddfd90596 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST_HELPERS) += \
>  	drm_kunit_helpers.o
>  
>  obj-$(CONFIG_DRM_KUNIT_TEST) += \
> +	drm_atomic_state_helper_test.o \
>  	drm_buddy_test.o \
>  	drm_cmdline_parser_test.o \
>  	drm_connector_test.o \
> diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> new file mode 100644
> index 000000000000..21e6f796ee13
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> @@ -0,0 +1,376 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Kunit test for drm_atomic_state_helper functions
> + */
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_kunit_helpers.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <drm/drm_print.h>
> +#include "../drm_crtc_internal.h"
> +
> +#include <kunit/test.h>
> +
> +#include "drm_kunit_edid.h"
> +
> +struct drm_atomic_helper_connector_hdmi_priv {
> +	struct drm_device drm;
> +	struct drm_plane *plane;
> +	struct drm_crtc *crtc;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +
> +	const char *current_edid;
> +	size_t current_edid_len;
> +};
> +
> +#define connector_to_priv(c) \
> +	container_of_const(c, struct drm_atomic_helper_connector_hdmi_priv, connector)
> +
> +static struct drm_display_mode *find_preferred_mode(struct drm_connector *connector)
> +{
> +	struct drm_device *drm = connector->dev;
> +	struct drm_display_mode *mode, *preferred;
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
> +	list_for_each_entry(mode, &connector->modes, head)
> +		if (mode->type & DRM_MODE_TYPE_PREFERRED)
> +			preferred = mode;
> +	mutex_unlock(&drm->mode_config.mutex);
> +
> +	return preferred;
> +}
> +
> +static int light_up_connector(struct kunit *test,
> +			      struct drm_device *drm,
> +			      struct drm_crtc *crtc,
> +			      struct drm_connector *connector,
> +			      struct drm_display_mode *mode,
> +			      struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct drm_atomic_state *state;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	int ret;
> +
> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	conn_state = drm_atomic_get_connector_state(state, connector);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +
> +	ret = drm_atomic_set_mode_for_crtc(crtc_state, mode);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	crtc_state->enable = true;
> +	crtc_state->active = true;
> +
> +	ret = drm_atomic_commit(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	return 0;
> +}
> +
> +static int set_connector_edid(struct kunit *test, struct drm_connector *connector,
> +			      const char *edid, size_t edid_len)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv =
> +		connector_to_priv(connector);
> +	struct drm_device *drm = connector->dev;
> +	int ret;
> +
> +	priv->current_edid = edid;
> +	priv->current_edid_len = edid_len;
> +
> +	mutex_lock(&drm->mode_config.mutex);
> +	ret = connector->funcs->fill_modes(connector, 4096, 4096);
> +	mutex_unlock(&drm->mode_config.mutex);
> +	KUNIT_ASSERT_GT(test, ret, 0);
> +
> +	return 0;
> +}
> +
> +static int dummy_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv =
> +		connector_to_priv(connector);
> +	const struct drm_edid *edid;
> +	unsigned int num_modes;
> +
> +	edid = drm_edid_alloc(priv->current_edid, priv->current_edid_len);
> +	if (!edid)
> +		return -EINVAL;
> +
> +	drm_edid_connector_update(connector, edid);
> +	num_modes = drm_edid_connector_add_modes(connector);
> +
> +	drm_edid_free(edid);
> +
> +	return num_modes;
> +}
> +
> +static const struct drm_connector_helper_funcs dummy_connector_helper_funcs = {
> +	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
> +	.get_modes	= dummy_connector_get_modes,
> +};
> +
> +static void dummy_hdmi_connector_reset(struct drm_connector *connector)
> +{
> +	drm_atomic_helper_connector_reset(connector);
> +	__drm_atomic_helper_connector_hdmi_reset(connector, connector->state);
> +}
> +
> +static const struct drm_connector_funcs dummy_connector_funcs = {
> +	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> +	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
> +	.fill_modes		= drm_helper_probe_single_connector_modes,
> +	.reset			= dummy_hdmi_connector_reset,
> +};
> +
> +static
> +struct drm_atomic_helper_connector_hdmi_priv *
> +drm_atomic_helper_connector_hdmi_init(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector *conn;
> +	struct drm_encoder *enc;
> +	struct drm_device *drm;
> +	struct device *dev;
> +	int ret;
> +
> +	dev = drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	priv = drm_kunit_helper_alloc_drm_device(test, dev,
> +						 struct drm_atomic_helper_connector_hdmi_priv, drm,
> +						 DRIVER_MODESET | DRIVER_ATOMIC);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
> +	test->priv = priv;
> +
> +	drm = &priv->drm;
> +	priv->plane = drm_kunit_helper_create_primary_plane(test, drm,
> +							    NULL,
> +							    NULL,
> +							    NULL, 0,
> +							    NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->plane);
> +
> +	priv->crtc = drm_kunit_helper_create_crtc(test, drm,
> +						  priv->plane, NULL,
> +						  NULL,
> +						  NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->crtc);
> +
> +	enc = &priv->encoder;
> +	ret = drmm_encoder_init(drm, enc, NULL, DRM_MODE_ENCODER_TMDS, NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	enc->possible_crtcs = drm_crtc_mask(priv->crtc);
> +
> +	conn = &priv->connector;
> +	ret = drmm_connector_hdmi_init(drm, conn,
> +				       &dummy_connector_funcs,
> +				       DRM_MODE_CONNECTOR_HDMIA,
> +				       NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	drm_connector_helper_add(conn, &dummy_connector_helper_funcs);
> +	drm_connector_attach_encoder(conn, enc);
> +
> +	drm_mode_config_reset(drm);
> +
> +	ret = set_connector_edid(test, conn,
> +				 test_edid_hdmi_1080p_rgb_max_200mhz,
> +				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	return priv;
> +}
> +
> +/*
> + * Test that if we change the RGB quantization property to a different
> + * value, we trigger a mode change on the connector's CRTC, which will
> + * in turn disable/enable the connector.
> + */
> +static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx *ctx;
> +	struct drm_connector_state *old_conn_state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_atomic_state *state;
> +	struct drm_display_mode *preferred;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	priv = drm_atomic_helper_connector_hdmi_init(test);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +	conn = &priv->connector;
> +	preferred = find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	drm = &priv->drm;
> +	crtc = priv->crtc;
> +	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	new_conn_state = drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +	new_conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_FULL;
> +
> +	KUNIT_ASSERT_NE(test,
> +			old_conn_state->hdmi.broadcast_rgb,
> +			new_conn_state->hdmi.broadcast_rgb);
> +
> +	ret = drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +	KUNIT_EXPECT_EQ(test, new_conn_state->hdmi.broadcast_rgb, DRM_HDMI_BROADCAST_RGB_FULL);
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +	KUNIT_EXPECT_TRUE(test, crtc_state->mode_changed);
> +}
> +
> +/*
> + * Test that if we set the RGB quantization property to the same value,
> + * we don't trigger a mode change on the connector's CRTC and leave the
> + * connector unaffected.
> + */
> +static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_modeset_acquire_ctx *ctx;
> +	struct drm_connector_state *old_conn_state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_atomic_state *state;
> +	struct drm_display_mode *preferred;
> +	struct drm_connector *conn;
> +	struct drm_device *drm;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	priv = drm_atomic_helper_connector_hdmi_init(test);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +	conn = &priv->connector;
> +	preferred = find_preferred_mode(conn);
> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
> +
> +	drm = &priv->drm;
> +	crtc = priv->crtc;
> +	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	new_conn_state = drm_atomic_get_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +	new_conn_state->hdmi.broadcast_rgb = old_conn_state->hdmi.broadcast_rgb;
> +
> +	ret = drm_atomic_check_only(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	KUNIT_EXPECT_EQ(test,
> +			old_conn_state->hdmi.broadcast_rgb,
> +			new_conn_state->hdmi.broadcast_rgb);
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +	KUNIT_EXPECT_FALSE(test, crtc_state->mode_changed);
> +}
> +
> +static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
> +	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_changed),
> +	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_atomic_helper_connector_hdmi_check_test_suite = {
> +	.name		= "drm_atomic_helper_connector_hdmi_check",
> +	.test_cases	= drm_atomic_helper_connector_hdmi_check_tests,
> +};
> +
> +/*
> + * Test that the value of the Broadcast RGB property out of reset is set
> + * to auto.
> + */
> +static void drm_test_check_broadcast_rgb_value(struct kunit *test)
> +{
> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
> +	struct drm_connector_state *conn_state;
> +	struct drm_connector *conn;
> +
> +	priv = drm_atomic_helper_connector_hdmi_init(test);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	conn = &priv->connector;
> +	conn_state = conn->state;
> +	KUNIT_EXPECT_EQ(test, conn_state->hdmi.broadcast_rgb, DRM_HDMI_BROADCAST_RGB_AUTO);
> +}
> +
> +static struct kunit_case drm_atomic_helper_connector_hdmi_reset_tests[] = {
> +	KUNIT_CASE(drm_test_check_broadcast_rgb_value),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_atomic_helper_connector_hdmi_reset_test_suite = {
> +	.name		= "drm_atomic_helper_connector_hdmi_reset",
> +	.test_cases 	= drm_atomic_helper_connector_hdmi_reset_tests,
> +};
> +
> +kunit_test_suites(
> +	&drm_atomic_helper_connector_hdmi_check_test_suite,
> +	&drm_atomic_helper_connector_hdmi_reset_test_suite,
> +);
> +
> +MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
> index 8f070cacab3b..41d33dea30af 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -12,6 +12,8 @@
>  
>  #include <kunit/test.h>
>  
> +#include "../drm_crtc_internal.h"
> +
>  struct drm_connector_init_priv {
>  	struct drm_device drm;
>  	struct drm_connector connector;
> @@ -357,10 +359,123 @@ static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
>  	.test_cases = drm_get_tv_mode_from_name_tests,
>  };
>  
> +struct drm_hdmi_connector_get_broadcast_rgb_name_test {
> +	unsigned int kind;
> +	const char *expected_name;
> +};
> +
> +#define BROADCAST_RGB_TEST(_kind, _name)	\
> +	{					\
> +		.kind = _kind,			\
> +		.expected_name = _name,		\
> +	}
> +
> +static void drm_test_drm_hdmi_connector_get_broadcast_rgb_name(struct kunit *test)
> +{
> +	const struct drm_hdmi_connector_get_broadcast_rgb_name_test *params =
> +		test->param_value;
> +
> +	KUNIT_EXPECT_STREQ(test,
> +			   drm_hdmi_connector_get_broadcast_rgb_name(params->kind),
> +			   params->expected_name);
> +}
> +
> +static const
> +struct drm_hdmi_connector_get_broadcast_rgb_name_test
> +drm_hdmi_connector_get_broadcast_rgb_name_valid_tests[] = {
> +	BROADCAST_RGB_TEST(DRM_HDMI_BROADCAST_RGB_AUTO, "Automatic"),
> +	BROADCAST_RGB_TEST(DRM_HDMI_BROADCAST_RGB_FULL, "Full"),
> +	BROADCAST_RGB_TEST(DRM_HDMI_BROADCAST_RGB_LIMITED, "Limited 16:235"),
> +};
> +
> +static void
> +drm_hdmi_connector_get_broadcast_rgb_name_valid_desc(const struct drm_hdmi_connector_get_broadcast_rgb_name_test *t,
> +						     char *desc)
> +{
> +	sprintf(desc, "%s", t->expected_name);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_hdmi_connector_get_broadcast_rgb_name_valid,
> +		  drm_hdmi_connector_get_broadcast_rgb_name_valid_tests,
> +		  drm_hdmi_connector_get_broadcast_rgb_name_valid_desc);
> +
> +static void drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid(struct kunit *test)
> +{
> +	KUNIT_EXPECT_NULL(test, drm_hdmi_connector_get_broadcast_rgb_name(3));
> +};
> +
> +static struct kunit_case drm_hdmi_connector_get_broadcast_rgb_name_tests[] = {
> +	KUNIT_CASE_PARAM(drm_test_drm_hdmi_connector_get_broadcast_rgb_name,
> +			 drm_hdmi_connector_get_broadcast_rgb_name_valid_gen_params),
> +	KUNIT_CASE(drm_test_drm_hdmi_connector_get_broadcast_rgb_name_invalid),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_hdmi_connector_get_broadcast_rgb_name_test_suite = {
> +	.name = "drm_hdmi_connector_get_broadcast_rgb_name",
> +	.test_cases = drm_hdmi_connector_get_broadcast_rgb_name_tests,
> +};
> +
> +static void drm_test_drm_connector_attach_broadcast_rgb_property(struct kunit *test)
> +{
> +	struct drm_connector_init_priv *priv = test->priv;
> +	struct drm_connector *connector = &priv->connector;
> +	struct drm_property *prop;
> +	int ret;
> +
> +	ret = drmm_connector_init(&priv->drm, connector,
> +				  &dummy_funcs,
> +				  DRM_MODE_CONNECTOR_HDMIA,
> +				  &priv->ddc);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret = drm_connector_attach_broadcast_rgb_property(connector);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	prop = connector->broadcast_rgb_property;
> +	KUNIT_ASSERT_NOT_NULL(test, prop);
> +	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +}
> +
> +static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(struct kunit *test)
> +{
> +	struct drm_connector_init_priv *priv = test->priv;
> +	struct drm_connector *connector = &priv->connector;
> +	struct drm_property *prop;
> +	int ret;
> +
> +	ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +				       &dummy_funcs,
> +				       DRM_MODE_CONNECTOR_HDMIA,
> +				       &priv->ddc);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	ret = drm_connector_attach_broadcast_rgb_property(connector);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	prop = connector->broadcast_rgb_property;
> +	KUNIT_ASSERT_NOT_NULL(test, prop);
> +	KUNIT_EXPECT_NOT_NULL(test, drm_mode_obj_find_prop_id(&connector->base, prop->base.id));
> +}
> +
> +static struct kunit_case drm_connector_attach_broadcast_rgb_property_tests[] = {
> +	KUNIT_CASE(drm_test_drm_connector_attach_broadcast_rgb_property),
> +	KUNIT_CASE(drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_connector_attach_broadcast_rgb_property_test_suite = {
> +	.name = "drm_connector_attach_broadcast_rgb_property",
> +	.init = drm_test_connector_init,
> +	.test_cases = drm_connector_attach_broadcast_rgb_property_tests,
> +};
> +
>  kunit_test_suites(
>  	&drmm_connector_hdmi_init_test_suite,
>  	&drmm_connector_init_test_suite,
> -	&drm_get_tv_mode_from_name_test_suite
> +	&drm_connector_attach_broadcast_rgb_property_test_suite,
> +	&drm_get_tv_mode_from_name_test_suite,
> +	&drm_hdmi_connector_get_broadcast_rgb_name_test_suite
>  );
>  
>  MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
> diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tests/drm_kunit_edid.h
> new file mode 100644
> index 000000000000..2bba316de064
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
> @@ -0,0 +1,106 @@
> +#ifndef DRM_KUNIT_EDID_H_
> +#define DRM_KUNIT_EDID_H_
> +
> +/*
> + * edid-decode (hex):
> + *
> + * 00 ff ff ff ff ff ff 00 31 d8 2a 00 00 00 00 00
> + * 00 21 01 03 81 a0 5a 78 02 00 00 00 00 00 00 00
> + * 00 00 00 20 00 00 01 01 01 01 01 01 01 01 01 01
> + * 01 01 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
> + * 45 00 40 84 63 00 00 1e 00 00 00 fc 00 54 65 73
> + * 74 20 45 44 49 44 0a 20 20 20 00 00 00 fd 00 32
> + * 46 1e 46 0f 00 0a 20 20 20 20 20 20 00 00 00 10
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 92
> + *
> + * 02 03 1b 81 e3 05 00 20 41 10 e2 00 4a 6d 03 0c
> + * 00 12 34 00 28 20 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 d0
> + *
> + * ----------------
> + *
> + * Block 0, Base EDID:
> + *   EDID Structure Version & Revision: 1.3
> + *   Vendor & Product Identification:
> + *     Manufacturer: LNX
> + *     Model: 42
> + *     Made in: 2023
> + *   Basic Display Parameters & Features:
> + *     Digital display
> + *     DFP 1.x compatible TMDS
> + *     Maximum image size: 160 cm x 90 cm
> + *     Gamma: 2.20
> + *     Monochrome or grayscale display
> + *     First detailed timing is the preferred timing
> + *   Color Characteristics:
> + *     Red  : 0.0000, 0.0000
> + *     Green: 0.0000, 0.0000
> + *     Blue : 0.0000, 0.0000
> + *     White: 0.0000, 0.0000
> + *   Established Timings I & II:
> + *     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
> + *   Standard Timings: none
> + *   Detailed Timing Descriptors:
> + *     DTD 1:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (1600 mm x 900 mm)
> + *                  Hfront   88 Hsync  44 Hback  148 Hpol P
> + *                  Vfront    4 Vsync   5 Vback   36 Vpol P
> + *     Display Product Name: 'Test EDID'
> + *     Display Range Limits:
> + *       Monitor ranges (GTF): 50-70 Hz V, 30-70 kHz H, max dotclock 150 MHz
> + *     Dummy Descriptor:
> + *   Extension blocks: 1
> + * Checksum: 0x92
> + *
> + * ----------------
> + *
> + * Block 1, CTA-861 Extension Block:
> + *   Revision: 3
> + *   Underscans IT Video Formats by default
> + *   Native detailed modes: 1
> + *   Colorimetry Data Block:
> + *     sRGB
> + *   Video Data Block:
> + *     VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
> + *   Video Capability Data Block:
> + *     YCbCr quantization: No Data
> + *     RGB quantization: Selectable (via AVI Q)
> + *     PT scan behavior: No Data
> + *     IT scan behavior: Always Underscanned
> + *     CE scan behavior: Always Underscanned
> + *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
> + *     Source physical address: 1.2.3.4
> + *     Maximum TMDS clock: 200 MHz
> + *     Extended HDMI video details:
> + * Checksum: 0xd0  Unused space in Extension Block: 100 bytes
> + */
> +const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] = {
> +  0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
> +  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
> +  0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> +  0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a, 0x80, 0x18, 0x71, 0x38,
> +  0x2d, 0x40, 0x58, 0x2c, 0x45, 0x00, 0x40, 0x84, 0x63, 0x00, 0x00, 0x1e,
> +  0x00, 0x00, 0x00, 0xfc, 0x00, 0x54, 0x65, 0x73, 0x74, 0x20, 0x45, 0x44,
> +  0x49, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x32,
> +  0x46, 0x00, 0x00, 0xc4, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +  0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x41, 0x02, 0x03, 0x1b, 0x81,
> +  0xe3, 0x05, 0x00, 0x20, 0x41, 0x10, 0xe2, 0x00, 0x4a, 0x6d, 0x03, 0x0c,
> +  0x00, 0x12, 0x34, 0x00, 0x28, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +  0x00, 0x00, 0x00, 0xd0
> +};
> +
> +#endif // DRM_KUNIT_EDID_H_
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 000a2a156619..3867a4c01b78 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -368,6 +368,30 @@ enum drm_panel_orientation {
>  	DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
>  
> +/**
> + * enum drm_hdmi_broadcast_rgb - Broadcast RGB Selection for an HDMI @drm_connector
> + */
> +enum drm_hdmi_broadcast_rgb {
> +	/**
> +	 * @DRM_HDMI_BROADCAST_RGB_AUTO: The RGB range is selected
> +	 * automatically based on the mode.
> +	 */
> +	DRM_HDMI_BROADCAST_RGB_AUTO,
> +
> +	/**
> +	 * @DRM_HDMI_BROADCAST_RGB_FULL: Full range RGB is forced.
> +	 */
> +	DRM_HDMI_BROADCAST_RGB_FULL,
> +
> +	/**
> +	 * @DRM_HDMI_BROADCAST_RGB_LIMITED: Limited range RGB is forced.
> +	 */
> +	DRM_HDMI_BROADCAST_RGB_LIMITED,
> +};
> +
> +const char *
> +drm_hdmi_connector_get_broadcast_rgb_name(enum drm_hdmi_broadcast_rgb broadcast_rgb);
> +
>  /**
>   * struct drm_monitor_range_info - Panel's Monitor range in EDID for
>   * &drm_display_info
> @@ -1037,6 +1061,11 @@ struct drm_connector_state {
>  	 * @drm_atomic_helper_connector_hdmi_check().
>  	 */
>  	struct {
> +		/**
> +		 * @broadcast_rgb: Connector property to pass the
> +		 * Broadcast RGB selection value.
> +		 */
> +		enum drm_hdmi_broadcast_rgb broadcast_rgb;
>  	} hdmi;
>  };
>  
> @@ -1706,6 +1735,12 @@ struct drm_connector {
>  	 */
>  	struct drm_property *privacy_screen_hw_state_property;
>  
> +	/**
> +	 * @broadcast_rgb_property: Connector property to set the
> +	 * Broadcast RGB selection to output with.
> +	 */
> +	struct drm_property *broadcast_rgb_property;
> +
>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> @@ -2026,6 +2061,7 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
>  					       u32 scaling_mode_mask);
>  int drm_connector_attach_vrr_capable_property(
>  		struct drm_connector *connector);
> +int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector);
>  int drm_connector_attach_colorspace_property(struct drm_connector *connector);
>  int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
>  bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
> 
> -- 
> 2.43.0
> 


