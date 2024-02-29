Return-Path: <linux-doc+bounces-11114-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E586D3A7
	for <lists+linux-doc@lfdr.de>; Thu, 29 Feb 2024 20:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C7D31F20FDF
	for <lists+linux-doc@lfdr.de>; Thu, 29 Feb 2024 19:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B72B13F439;
	Thu, 29 Feb 2024 19:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c7aAcmYm"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC5D13F427
	for <linux-doc@vger.kernel.org>; Thu, 29 Feb 2024 19:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709236058; cv=none; b=P1IwCmnzo7dNyTTtjBoa4HOTe1vy/64TOFwmKYX1mtsFmFfrHq26dW30b/+6nKIZ06iXZ2Cv8ZLv1a6IfiGzOJCCD9K4MRTdiQ6wRLC1TVPhZsdv4JhKY9H7b84/KXDvUrNFrtuMm6cP9EeTymtyRObKTG6dUxso4gRWB9DKmSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709236058; c=relaxed/simple;
	bh=+wSzFyYwkbZT5cJTUJC8S2ECyGqqpa3s9UeTu/mMwNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRDHYU3kAD/jU2AZw3P/VYQMUDloSSEostbeBNYBKGoYHbVtqGDovs9dQAtFbWQ/QYWAZxR/GPcLrF3e580B5iPrt+rxZjO2AJTebecHQ9qdrWWeeddq964MLqlK0LG7MPoP3h27srTi+1oImd96JhUrpKMVfmaVdlRcPyDVhqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c7aAcmYm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709236054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i8CFu40DFfKt/7absHIijkD0GmZEEf3/hT+uC0K0lLU=;
	b=c7aAcmYmaZR71GlH+iCYsJHjeYY+e1Qqi8Oqc6dfEZV+UtDauR+M2BPDNO2xzDdQPrCY4S
	EGEr5bAAimwx488JzKQ2j5fHiz4ZmA0MaIpGunLOIoIUfal2WvEq+OOAFrf2jtItjZSndO
	8B6I6Jt0zsmMveYcq8uGy3JBwnbqrhw=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-YhaOVsDpP4O_Hhf7yAMPcg-1; Thu, 29 Feb 2024 14:47:31 -0500
X-MC-Unique: YhaOVsDpP4O_Hhf7yAMPcg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5131c91bbc3so1002774e87.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Feb 2024 11:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709236049; x=1709840849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i8CFu40DFfKt/7absHIijkD0GmZEEf3/hT+uC0K0lLU=;
        b=TpdrH5TCGSmIsZHqKK40yv86mgeYgWx5OALwd4EENuMCjQqMJgLiEZ5XPchOhU+JOi
         GhYethpDDI32nwRgSIX7l1l7G5mlqIGYMpWdqWuNm10MaDH6j/dh29ugUSBxk53Pz258
         mq2FGU+Se84JdVYDBg1B5mPwtKb6hmLle4VVv1ADLlPiIJVX/DkxLXWvvitn6o/EJPfm
         mOHRaPEiFE7IHp7zwn7niw1v0T9mzNMTrBmglp9lgrKVobLj64U8yH/7LY4+qkuz5ur2
         ruvWwqDpx2UvSlD1V/A+6+50j4kYz3k/AXfqLHQLUtkzDZXrvqzB4phfQ/X1lsil2QOx
         b0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWINE5N11oCNY6QfBm5thURPmwsLvM5uN3xMiklxd4U4WpOLqWYPsn++tzyqRpP6/VDGLPkWWjQIOuOBTIahAF3KsvDH5qmwM7u
X-Gm-Message-State: AOJu0YxoEHY9O2TtQUR8IOcv1SzS9qbXHVlI9mHOUnS0Um63PTI2WOAZ
	inCzwxWL7WYgd+mQdiKgDCh5cxbXstuYwWZwaKxtRtwYFMBXIs+rZYSwMYsO0P3gv0APLR5TOSz
	encI1OPnLzB/ndkPrmw57mjyd0yncnIBj5YWjSY4a2meDNx0euWcS+xTdVQ==
X-Received: by 2002:ac2:4942:0:b0:511:a4c9:a010 with SMTP id o2-20020ac24942000000b00511a4c9a010mr1875422lfi.38.1709236049005;
        Thu, 29 Feb 2024 11:47:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPN4L9UvKtXdDp+10SmqEhaEX3/3TztuqqO4Vqc9XcT8yBYiju8dOjrnSHOMo8esXKgPcF0A==
X-Received: by 2002:ac2:4942:0:b0:511:a4c9:a010 with SMTP id o2-20020ac24942000000b00511a4c9a010mr1875404lfi.38.1709236048539;
        Thu, 29 Feb 2024 11:47:28 -0800 (PST)
Received: from toolbox ([2001:9e8:8984:bd00:2340:7b35:5e60:4abd])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906a39300b00a3fb7cafad8sm978656ejz.39.2024.02.29.11.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 11:47:28 -0800 (PST)
Date: Thu, 29 Feb 2024 20:47:26 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v7 21/36] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240229194726.GB166694@toolbox>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>

On Thu, Feb 22, 2024 at 07:14:07PM +0100, Maxime Ripard wrote:
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
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/kms-properties.csv      |  1 -
>  drivers/gpu/drm/drm_atomic.c              |  2 +
>  drivers/gpu/drm/drm_atomic_state_helper.c |  4 +-
>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
>  drivers/gpu/drm/drm_connector.c           | 89 +++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h               | 36 +++++++++++++
>  6 files changed, 134 insertions(+), 2 deletions(-)
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
> index 26f9e525c0a0..3e57d98d8418 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1145,6 +1145,8 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
>  
>  	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
>  	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
> +		drm_printf(p, "\tbroadcast_rgb=%s\n",
> +			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
>  		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
>  		drm_printf(p, "\toutput_format=%s\n",
>  			   drm_hdmi_connector_get_output_format_name(state->hdmi.output_format));
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 9f517599f117..0e8fb653965a 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -589,6 +589,7 @@ void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
>  
>  	new_state->max_bpc = max_bpc;
>  	new_state->max_requested_bpc = max_bpc;
> +	new_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
>  
> @@ -913,7 +914,8 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>  	if (ret)
>  		return ret;
>  
> -	if (old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
> +	if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
> +	    old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
>  	    old_state->hdmi.output_format != new_state->hdmi.output_format) {
>  		struct drm_crtc *crtc = new_state->crtc;
>  		struct drm_crtc_state *crtc_state;
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 29d4940188d4..2b415b4ed506 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -776,6 +776,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  		state->max_requested_bpc = val;
>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		state->privacy_screen_sw_state = val;
> +	} else if (property == connector->broadcast_rgb_property) {
> +		state->hdmi.broadcast_rgb = val;
>  	} else if (connector->funcs->atomic_set_property) {
>  		return connector->funcs->atomic_set_property(connector,
>  				state, property, val);
> @@ -859,6 +861,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		*val = state->max_requested_bpc;
>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		*val = state->privacy_screen_sw_state;
> +	} else if (property == connector->broadcast_rgb_property) {
> +		*val = state->hdmi.broadcast_rgb;
>  	} else if (connector->funcs->atomic_get_property) {
>  		return connector->funcs->atomic_get_property(connector,
>  				state, property, val);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 591d2d500f61..6ffe59d01698 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1212,6 +1212,29 @@ static const u32 dp_colorspaces =
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
>  static const char * const output_format_str[] = {
>  	[HDMI_COLORSPACE_RGB]		= "RGB",
>  	[HDMI_COLORSPACE_YUV420]	= "YUV 4:2:0",
> @@ -1708,6 +1731,39 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
>  /**
>   * DOC: HDMI connector properties
>   *
> + * Broadcast RGB (HDMI specific)
> + *      Indicates the Quantization Range (Full vs Limited) used. The color
> + *      processing pipeline will be adjusted to match the value of the
> + *      property, and the Infoframes will be generated and sent accordingly.
> + *
> + *      This property is only relevant if the HDMI output format is RGB. If
> + *      it's one of the YCbCr variant, it will be ignored and the output will
> + *      use a limited quantization range.

Uh, maybe just say that the quantization range is selected automatically
in case a YCbCr output format is in use. I'm not sure every YCbCr
variant requires limited and even if it does, new formats could change
this.

With this changed, this patch is

Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>

> + *
> + *      The CRTC attached to the connector must be configured by user-space to
> + *      always produce full-range pixels.
> + *
> + *      The value of this property can be one of the following:
> + *
> + *      Automatic:
> + *              The quantization range is selected automatically based on the
> + *              mode according to the HDMI specifications (HDMI 1.4b - Section
> + *              6.6 - Video Quantization Ranges).
> + *
> + *      Full:
> + *              Full quantization range is forced.
> + *
> + *      Limited 16:235:
> + *              Limited quantization range is forced. Unlike the name suggests,
> + *              this works for any number of bits-per-component.
> + *
> + *      Property values other than Automatic can result in colors being off (if
> + *      limited is selected but the display expects full), or a black screen
> + *      (if full is selected but the display expects limited).
> + *
> + *      Drivers can set up this property by calling
> + *      drm_connector_attach_broadcast_rgb_property().
> + *
>   * content type (HDMI specific):
>   *	Indicates content type setting to be used in HDMI infoframes to indicate
>   *	content type for the external device, so that it adjusts its display
> @@ -2570,6 +2626,39 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
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
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8cda902934cd..bb6b6a36ade3 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -369,6 +369,29 @@ enum drm_panel_orientation {
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
>  const char *
>  drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt);
>  
> @@ -1041,6 +1064,12 @@ struct drm_connector_state {
>  	 * @drm_atomic_helper_connector_hdmi_check().
>  	 */
>  	struct {
> +		/**
> +		 * @broadcast_rgb: Connector property to pass the
> +		 * Broadcast RGB selection value.
> +		 */
> +		enum drm_hdmi_broadcast_rgb broadcast_rgb;
> +
>  		/**
>  		 * @output_bpc: Bits per color channel to output.
>  		 */
> @@ -1753,6 +1782,12 @@ struct drm_connector {
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
> @@ -2092,6 +2127,7 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
>  					       u32 scaling_mode_mask);
>  int drm_connector_attach_vrr_capable_property(
>  		struct drm_connector *connector);
> +int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector);
>  int drm_connector_attach_colorspace_property(struct drm_connector *connector);
>  int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
>  bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
> 
> -- 
> 2.43.2
> 


