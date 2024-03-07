Return-Path: <linux-doc+bounces-11783-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9287596F
	for <lists+linux-doc@lfdr.de>; Thu,  7 Mar 2024 22:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75BB528838A
	for <lists+linux-doc@lfdr.de>; Thu,  7 Mar 2024 21:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC5F13B2BD;
	Thu,  7 Mar 2024 21:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KLjC1Cia"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2323E13A279
	for <linux-doc@vger.kernel.org>; Thu,  7 Mar 2024 21:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709847293; cv=none; b=qgu1jOb4v4Ez/az1G+bRaesr+A2UbJm3dIUM5B0mRLtavaapjA9Ezq8Btuxr6QgeIEKnkBu5etC7MOWRsmMj5uLEr5Ss+Pea22B6Cb9GwnZvAxIhiKUNYOnWJp39vAbl1ZHaLeHN3CzsTt7u8WfaPsxxzt0lQlwFgY3yjoUUzDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709847293; c=relaxed/simple;
	bh=ZioWa3O8UVzZn0tNvYNeFl7zVXQskY5zX1fsE0UKFgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2M4HeNaR5yszZFNMU/46iAplqwKD0Bqes3evOu8j7dSyIGLyo5GPHQ53fxoxTTgIg9MLMFUkcxzcEAbt2KyH15ghwu6vtZvjCW6mpqXkiGDCwpZ3NW8ed7lbSCqw4JAbz6CzwIQKH+Fsn82udinuKR1f226212hjim57o9COPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KLjC1Cia; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so1362340276.1
        for <linux-doc@vger.kernel.org>; Thu, 07 Mar 2024 13:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709847289; x=1710452089; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0/2XvFuAiyvZaIMiYL4oAu/qZ6xeRptB5Yl+Q3YU0fY=;
        b=KLjC1CiasoEfsvnVvZ9K0YlJGJrqTqdSTGn0X3YOQHu4d1MePDNtg84yOt3pLzjvEt
         1LQh1+jzLHvyeveiRcab1DuYTQdBOtgi2D/c4I1WgiNEerlraQUszLZGVOIAAKfzqbVo
         i3vZHN/duX4L/HTdDLpcoghNYxhFaPbb5Dk7ErH+uvNOnRRjrp8Kjx3UZDNNeiGoPa8T
         a3g+J2DD6P3q44VJU3au2mP5+EKUEiH76A4IoekHWUXu/k6Xt3NpUh92CDGb7dPGMRz0
         Sp5ckzku2SZ4svExICjUUICoO7mOlw1T9d3CZtwqua9Fs2OBrq0FecBmfDWkjRlzPgfq
         CWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709847289; x=1710452089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/2XvFuAiyvZaIMiYL4oAu/qZ6xeRptB5Yl+Q3YU0fY=;
        b=BSY67KgCgwdioq+0h9Yy1Tc43OeI1HXmzm/5TC02MZH3DCeV6/j0jnwZFWMaXLQE+w
         cvHDRYjszXRHUJO6JYQdOMxnkveBGst2AD/uFXBGGe5enbsD8wKnF5O6iul0PlRGx/JB
         xA7FbbAZ9o+eNJuWeu1+jk4erxDCucxkdFGsJ6j7CAgmJlKZg1S3Ns8S1oqUjts9hecs
         jCe3frYxKusl9hBQkaE3LVumLQbJtK3YpjF+7ttulrmje3wIED3NGBL0gPKyJC6cqCyA
         TO0r96uVCI3uh1eqSTx2fDjh8TybEuGZTWTDrUF7F1p7OVcrNiPge4SsQNW0wAilIAQZ
         vx7A==
X-Forwarded-Encrypted: i=1; AJvYcCX1/068aIsCLFQjJ8KCcr5TX8P7owYXIhVIllrjZbdS7YCJ1hsZ71ohhYHFYvMz4PltDlb3taRh2S8HQeZ2SrRK5IgT8fJvF1Ln
X-Gm-Message-State: AOJu0Yxj7BBL1XM06sciUDug3lbP847Mclb18jjtroCqfOLnA+aLmlvQ
	x3JcAJ8PM8IUutVu0WNPeM70pSTNISR4ju1NT+pNdqtTJtZaRrn2yqrpHpc4EdUHosBwr3iJObp
	5xZpwtsgXtWjLy7y1LjFlH0VRlUr/A2ciaaKiyw==
X-Google-Smtp-Source: AGHT+IGeTs1Ho4xT1vD0AtG1sUcXcPWckpX387Tbnox2NYhxA3B6vjqm2iUu6bzzPI7K/Q1ZanJhhYZPMa4ypePWBOs=
X-Received: by 2002:a25:14d7:0:b0:dc2:65f4:1541 with SMTP id
 206-20020a2514d7000000b00dc265f41541mr15310765ybu.41.1709847288971; Thu, 07
 Mar 2024 13:34:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307-kms-hdmi-connector-state-v8-0-ef6a6f31964b@kernel.org> <20240307-kms-hdmi-connector-state-v8-20-ef6a6f31964b@kernel.org>
In-Reply-To: <20240307-kms-hdmi-connector-state-v8-20-ef6a6f31964b@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 23:34:37 +0200
Message-ID: <CAA8EJprSAzov9p92gscTxaKv+5Lc3rzm1NguqEeCKCArrEeV0A@mail.gmail.com>
Subject: Re: [PATCH v8 20/27] drm/connector: hdmi: Add Infoframes generation
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Wick <sebastian.wick@redhat.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 15:39, Maxime Ripard <mripard@kernel.org> wrote:
>
> Infoframes in KMS is usually handled by a bunch of low-level helpers
> that require quite some boilerplate for drivers. This leads to
> discrepancies with how drivers generate them, and which are actually
> sent.
>
> Now that we have everything needed to generate them in the HDMI
> connector state, we can generate them in our common logic so that
> drivers can simply reuse what we precomputed.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/Kconfig                            |   1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c          | 327 +++++++++++++++++++++
>  drivers/gpu/drm/drm_connector.c                    |  14 +
>  .../gpu/drm/tests/drm_atomic_state_helper_test.c   |   1 +
>  drivers/gpu/drm/tests/drm_connector_test.c         |  12 +
>  include/drm/drm_atomic_state_helper.h              |   8 +
>  include/drm/drm_connector.h                        | 133 +++++++++
>  7 files changed, 496 insertions(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 872edb47bb53..ad9c467e20ce 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -97,10 +97,11 @@ config DRM_KUNIT_TEST
>           If in doubt, say "N".
>
>  config DRM_KMS_HELPER
>         tristate
>         depends on DRM
> +       select DRM_DISPLAY_HDMI_HELPER
>         help
>           CRTC helpers for KMS drivers.
>
>  config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>          bool "Enable refcount backtrace history in the DP MST helpers"
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index e66272c0d006..46d9fd2ea8fa 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -36,10 +36,12 @@
>  #include <drm/drm_plane.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_writeback.h>
>
> +#include <drm/display/drm_hdmi_helper.h>
> +
>  #include <linux/slab.h>
>  #include <linux/dma-fence.h>
>
>  /**
>   * DOC: atomic state reset and initialization
> @@ -912,10 +914,146 @@ hdmi_compute_config(const struct drm_connector *connector,
>         }
>
>         return -EINVAL;
>  }
>
> +static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
> +                                      struct drm_connector_state *state)
> +{
> +       const struct drm_display_mode *mode =
> +               connector_state_get_mode(state);
> +       struct drm_connector_hdmi_infoframe *infoframe =
> +               &state->hdmi.infoframes.avi;
> +       struct hdmi_avi_infoframe *frame =
> +               &infoframe->data.avi;
> +       bool is_full_range = state->hdmi.is_full_range;
> +       enum hdmi_quantization_range rgb_quant_range =
> +               is_full_range ? HDMI_QUANTIZATION_RANGE_FULL : HDMI_QUANTIZATION_RANGE_LIMITED;
> +       int ret;
> +
> +       ret = drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
> +       if (ret)
> +               return ret;
> +
> +       frame->colorspace = state->hdmi.output_format;
> +
> +       drm_hdmi_avi_infoframe_quant_range(frame, connector, mode, rgb_quant_range);
> +       drm_hdmi_avi_infoframe_colorimetry(frame, state);
> +       drm_hdmi_avi_infoframe_bars(frame, state);
> +
> +       infoframe->set = true;
> +
> +       return 0;
> +}
> +
> +static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
> +                                      struct drm_connector_state *state)
> +{
> +       struct drm_connector_hdmi_infoframe *infoframe =
> +               &state->hdmi.infoframes.spd;
> +       struct hdmi_spd_infoframe *frame =
> +               &infoframe->data.spd;
> +       int ret;
> +
> +       ret = hdmi_spd_infoframe_init(frame,
> +                                     connector->hdmi.vendor,
> +                                     connector->hdmi.product);
> +       if (ret)
> +               return ret;
> +
> +       frame->sdi = HDMI_SPD_SDI_PC;
> +
> +       infoframe->set = true;
> +
> +       return 0;
> +}
> +
> +static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
> +                                      struct drm_connector_state *state)
> +{
> +       struct drm_connector_hdmi_infoframe *infoframe =
> +               &state->hdmi.infoframes.hdr_drm;
> +       struct hdmi_drm_infoframe *frame =
> +               &infoframe->data.drm;
> +       int ret;
> +
> +       if (connector->max_bpc < 10)
> +               return 0;
> +
> +       if (!state->hdr_output_metadata)
> +               return 0;
> +
> +       ret = drm_hdmi_infoframe_set_hdr_metadata(frame, state);
> +       if (ret)
> +               return ret;
> +
> +       infoframe->set = true;
> +
> +       return 0;
> +}
> +
> +static int hdmi_generate_hdmi_vendor_infoframe(const struct drm_connector *connector,
> +                                              struct drm_connector_state *state)
> +{
> +       const struct drm_display_mode *mode =
> +               connector_state_get_mode(state);
> +       struct drm_connector_hdmi_infoframe *infoframe =
> +               &state->hdmi.infoframes.hdmi;
> +       struct hdmi_vendor_infoframe *frame =
> +               &infoframe->data.vendor.hdmi;
> +       int ret;
> +
> +       ret = drm_hdmi_vendor_infoframe_from_display_mode(frame, connector, mode);
> +       if (ret) {
> +               if (ret == -EINVAL)
> +                       return 0;
> +
> +               return ret;
> +       }
> +
> +       infoframe->set = true;
> +
> +       return 0;
> +}
> +
> +static int
> +hdmi_generate_infoframes(const struct drm_connector *connector,
> +                        struct drm_connector_state *state)
> +{
> +       const struct drm_display_info *info = &connector->display_info;
> +       int ret;
> +
> +       if (!info->is_hdmi)
> +               return 0;
> +
> +       if (!info->has_hdmi_infoframe)
> +               return 0;
> +
> +       ret = hdmi_generate_avi_infoframe(connector, state);
> +       if (ret)
> +               return ret;
> +
> +       ret = hdmi_generate_spd_infoframe(connector, state);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * Audio Infoframes will be generated by ALSA, and updated by
> +        * drm_atomic_helper_connector_hdmi_update_audio_infoframe().
> +        */
> +
> +       ret = hdmi_generate_hdr_infoframe(connector, state);
> +       if (ret)
> +               return ret;
> +
> +       ret = hdmi_generate_hdmi_vendor_infoframe(connector, state);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
>  /**
>   * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
>   * @connector: DRM Connector
>   * @state: the DRM State object
>   *
> @@ -941,10 +1079,14 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>
>         ret = hdmi_compute_config(connector, new_state, mode);
>         if (ret)
>                 return ret;
>
> +       ret = hdmi_generate_infoframes(connector, new_state);
> +       if (ret)
> +               return ret;
> +
>         if (old_state->hdmi.broadcast_rgb != new_state->hdmi.broadcast_rgb ||
>             old_state->hdmi.output_bpc != new_state->hdmi.output_bpc ||
>             old_state->hdmi.output_format != new_state->hdmi.output_format) {
>                 struct drm_crtc *crtc = new_state->crtc;
>                 struct drm_crtc_state *crtc_state;
> @@ -958,10 +1100,195 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>
>         return 0;
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
>
> +#define HDMI_MAX_INFOFRAME_SIZE                29
> +
> +static int clear_device_infoframe(struct drm_connector *connector,
> +                                 enum hdmi_infoframe_type type)
> +{
> +       const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
> +
> +       if (!funcs || !funcs->clear_infoframe)
> +               return 0;
> +
> +       return funcs->clear_infoframe(connector, type);
> +}
> +
> +static int clear_infoframe(struct drm_connector *connector,
> +                          struct drm_connector_hdmi_infoframe *conn_frame,
> +                          struct drm_connector_hdmi_infoframe *old_frame)
> +{
> +       int ret;
> +
> +       ret = clear_device_infoframe(connector, old_frame->data.any.type);
> +       if (ret)
> +               return ret;
> +
> +       memset(old_frame, 0, sizeof(*old_frame));
> +
> +       return 0;
> +}
> +
> +static int write_device_infoframe(struct drm_connector *connector,
> +                                 union hdmi_infoframe *frame)
> +{
> +       const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
> +       u8 buffer[HDMI_MAX_INFOFRAME_SIZE];
> +       int len;
> +
> +       if (!funcs || !funcs->write_infoframe)
> +               return -ENOSYS;
> +
> +       len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
> +       if (len < 0)
> +               return len;
> +
> +       return funcs->write_infoframe(connector, frame->any.type, buffer, len);
> +}
> +
> +static int write_infoframe(struct drm_connector *connector,
> +                          struct drm_connector_hdmi_infoframe *conn_frame,
> +                          struct drm_connector_hdmi_infoframe *new_frame)
> +{
> +       int ret;
> +
> +       ret = write_device_infoframe(connector, &new_frame->data);
> +       if (ret)
> +               return ret;
> +
> +       if (conn_frame)
> +               memcpy(conn_frame, new_frame, sizeof(*conn_frame));
> +
> +       return 0;
> +}
> +
> +static int write_or_clear_infoframe(struct drm_connector *connector,
> +                                   struct drm_connector_hdmi_infoframe *conn_frame,
> +                                   struct drm_connector_hdmi_infoframe *old_frame,
> +                                   struct drm_connector_hdmi_infoframe *new_frame)
> +{
> +       if (new_frame->set)
> +               return write_infoframe(connector, conn_frame, new_frame);
> +
> +       if (old_frame->set && !new_frame->set)
> +               return clear_infoframe(connector, conn_frame, old_frame);
> +
> +       return 0;
> +}
> +
> +#define UPDATE_INFOFRAME(c, os, ns, i)                         \
> +       write_or_clear_infoframe(c,                             \
> +                                &(c)->hdmi.infoframes.i,       \
> +                                &(os)->hdmi.infoframes.i,      \
> +                                &(ns)->hdmi.infoframes.i)
> +
> +/**
> + * drm_atomic_helper_connector_hdmi_update_infoframes - Update the Infoframes
> + * @connector: A pointer to the HDMI connector
> + * @state: The HDMI connector state to generate the infoframe from
> + *
> + * This function is meant for HDMI connector drivers to write their
> + * infoframes. It will typically be used in a
> + * @drm_connector_helper_funcs.atomic_enable implementation.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
> +                                                      struct drm_atomic_state *state)
> +{
> +       struct drm_connector_state *old_state =
> +               drm_atomic_get_old_connector_state(state, connector);
> +       struct drm_connector_state *new_state =
> +               drm_atomic_get_new_connector_state(state, connector);
> +       struct drm_display_info *info = &connector->display_info;
> +       int ret;
> +
> +       if (!info->is_hdmi)
> +               return 0;
> +
> +       if (!info->has_hdmi_infoframe)
> +               return 0;
> +
> +       mutex_lock(&connector->hdmi.infoframes.lock);
> +
> +       ret = UPDATE_INFOFRAME(connector, old_state, new_state, avi);
> +       if (ret)
> +               goto out;
> +
> +       if (connector->hdmi.infoframes.audio.set) {
> +               ret = write_infoframe(connector,
> +                                     NULL,
> +                                     &connector->hdmi.infoframes.audio);
> +               if (ret)
> +                       goto out;
> +       }
> +
> +       ret = UPDATE_INFOFRAME(connector, old_state, new_state, hdr_drm);
> +       if (ret)
> +               goto out;
> +
> +       ret = UPDATE_INFOFRAME(connector, old_state, new_state, spd);
> +       if (ret)
> +               goto out;
> +
> +       ret = UPDATE_INFOFRAME(connector, old_state, new_state, hdmi);
> +       if (ret)
> +               goto out;
> +
> +out:
> +       mutex_unlock(&connector->hdmi.infoframes.lock);
> +       return ret;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_infoframes);
> +
> +#undef UPDATE_INFOFRAME
> +#undef UPDATE_INFOFRAME_TOGGLE
> +
> +/**
> + * drm_atomic_helper_connector_hdmi_update_audio_infoframe - Update the Audio Infoframe
> + * @connector: A pointer to the HDMI connector
> + * @frame: A pointer to the audio infoframe to write
> + *
> + * This function is meant for HDMI connector drivers to update their
> + * audio infoframe. It will typically be used in one of the ALSA hooks
> + * (most likely prepare).
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int
> +drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
> +                                                       struct hdmi_audio_infoframe *frame)
> +{
> +       struct drm_connector_hdmi_infoframe infoframe = {};
> +       struct drm_display_info *info = &connector->display_info;
> +       int ret;
> +
> +       if (!info->is_hdmi)
> +               return 0;
> +
> +       if (!info->has_hdmi_infoframe)
> +               return 0;
> +
> +       memcpy(&infoframe.data, frame, sizeof(infoframe.data));
> +       infoframe.set = true;
> +
> +       mutex_lock(&connector->hdmi.infoframes.lock);
> +
> +       ret = write_infoframe(connector,
> +                             &connector->hdmi.infoframes.audio,
> +                             &infoframe);
> +
> +       mutex_unlock(&connector->hdmi.infoframes.lock);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_audio_infoframe);
> +
>  /**
>   * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
>   * @connector: connector object
>   * @state: atomic connector state
>   *
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 0272e1d05cc6..427816239038 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -276,10 +276,11 @@ static int __drm_connector_init(struct drm_device *dev,
>         INIT_LIST_HEAD(&connector->global_connector_list_entry);
>         INIT_LIST_HEAD(&connector->probed_modes);
>         INIT_LIST_HEAD(&connector->modes);
>         mutex_init(&connector->mutex);
>         mutex_init(&connector->edid_override_mutex);
> +       mutex_init(&connector->hdmi.infoframes.lock);
>         connector->edid_blob_ptr = NULL;
>         connector->epoch_counter = 0;
>         connector->tile_blob_ptr = NULL;
>         connector->status = connector_status_unknown;
>         connector->display_info.panel_orientation =
> @@ -454,10 +455,12 @@ EXPORT_SYMBOL(drmm_connector_init);
>
>  /**
>   * drmm_connector_hdmi_init - Init a preallocated HDMI connector
>   * @dev: DRM device
>   * @connector: A pointer to the HDMI connector to init
> + * @vendor: HDMI Controller Vendor name
> + * @product: HDMI Controller Product name
>   * @funcs: callbacks for this connector
>   * @hdmi_funcs: HDMI-related callbacks for this connector
>   * @connector_type: user visible type of the connector
>   * @ddc: optional pointer to the associated ddc adapter
>   * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
> @@ -474,19 +477,27 @@ EXPORT_SYMBOL(drmm_connector_init);
>   * Returns:
>   * Zero on success, error code on failure.
>   */
>  int drmm_connector_hdmi_init(struct drm_device *dev,
>                              struct drm_connector *connector,
> +                            const char *vendor, const char *product,
>                              const struct drm_connector_funcs *funcs,
>                              const struct drm_connector_hdmi_funcs *hdmi_funcs,
>                              int connector_type,
>                              struct i2c_adapter *ddc,
>                              unsigned long supported_formats,
>                              unsigned int max_bpc)
>  {
>         int ret;
>
> +       if (!vendor || !product)
> +               return -EINVAL;
> +
> +       if ((strlen(vendor) > DRM_CONNECTOR_HDMI_VENDOR_LEN) ||
> +           (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
> +               return -EINVAL;
> +
>         if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
>               connector_type == DRM_MODE_CONNECTOR_HDMIB))
>                 return -EINVAL;
>
>         if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
> @@ -498,10 +509,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>         ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
>         if (ret)
>                 return ret;
>
>         connector->hdmi.supported_formats = supported_formats;
> +       strtomem_pad(connector->hdmi.vendor, vendor, 0);
> +       strtomem_pad(connector->hdmi.product, product, 0);
>
>         /*
>          * drm_connector_attach_max_bpc_property() requires the
>          * connector to have a state.
>          */
> @@ -650,10 +663,11 @@ void drm_connector_cleanup(struct drm_connector *connector)
>         WARN_ON(connector->state && !connector->funcs->atomic_destroy_state);
>         if (connector->state && connector->funcs->atomic_destroy_state)
>                 connector->funcs->atomic_destroy_state(connector,
>                                                        connector->state);
>
> +       mutex_destroy(&connector->hdmi.infoframes.lock);
>         mutex_destroy(&connector->mutex);
>
>         memset(connector, 0, sizeof(*connector));
>
>         if (dev->registered)
> diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> index dcc0f7486f49..b28409fe65dd 100644
> --- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
> @@ -201,10 +201,11 @@ drm_atomic_helper_connector_hdmi_init(struct kunit *test,
>
>         enc->possible_crtcs = drm_crtc_mask(priv->crtc);
>
>         conn = &priv->connector;
>         ret = drmm_connector_hdmi_init(drm, conn,
> +                                      "Vendor", "Product",
>                                        &dummy_connector_funcs,
>                                        &dummy_connector_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
>                                        NULL,
>                                        formats,
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
> index d5320a089887..c3f7a3ba6808 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -187,10 +187,11 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
>  {
>         struct drm_connector_init_priv *priv = test->priv;
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
>                                        &priv->ddc,
>                                        BIT(HDMI_COLORSPACE_RGB),
> @@ -206,10 +207,11 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
>  {
>         struct drm_connector_init_priv *priv = test->priv;
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
>                                        NULL,
>                                        BIT(HDMI_COLORSPACE_RGB),
> @@ -225,10 +227,11 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
>  {
>         struct drm_connector_init_priv *priv = test->priv;
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
>                                        &priv->ddc,
>                                        BIT(HDMI_COLORSPACE_RGB),
> @@ -244,10 +247,11 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
>  {
>         struct drm_connector_init_priv *priv = test->priv;
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
>                                        &priv->ddc,
>                                        BIT(HDMI_COLORSPACE_RGB),
> @@ -267,10 +271,11 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
>         struct drm_property *prop;
>         uint64_t val;
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
>                                        &priv->ddc,
>                                        BIT(HDMI_COLORSPACE_RGB),
> @@ -302,10 +307,11 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
>         struct drm_property *prop;
>         uint64_t val;
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
>                                        &priv->ddc,
>                                        BIT(HDMI_COLORSPACE_RGB),
> @@ -337,10 +343,11 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
>         struct drm_property *prop;
>         uint64_t val;
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
>                                        &priv->ddc,
>                                        BIT(HDMI_COLORSPACE_RGB),
> @@ -368,10 +375,11 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
>  {
>         struct drm_connector_init_priv *priv = test->priv;
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
>                                        &priv->ddc,
>                                        0,
> @@ -387,10 +395,11 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
>  {
>         struct drm_connector_init_priv *priv = test->priv;
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
>                                        &priv->ddc,
>                                        BIT(HDMI_COLORSPACE_YUV422),
> @@ -407,10 +416,11 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
>         struct drm_connector_init_priv *priv = test->priv;
>         unsigned int connector_type = *(unsigned int *)test->param_value;
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        connector_type,
>                                        &priv->ddc,
>                                        BIT(HDMI_COLORSPACE_RGB),
> @@ -441,10 +451,11 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
>         struct drm_connector_init_priv *priv = test->priv;
>         unsigned int connector_type = *(unsigned int *)test->param_value;
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        connector_type,
>                                        &priv->ddc,
>                                        BIT(HDMI_COLORSPACE_RGB),
> @@ -706,10 +717,11 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
>         struct drm_connector *connector = &priv->connector;
>         struct drm_property *prop;
>         int ret;
>
>         ret = drmm_connector_hdmi_init(&priv->drm, connector,
> +                                      "Vendor", "Product",
>                                        &dummy_funcs,
>                                        &dummy_hdmi_funcs,
>                                        DRM_MODE_CONNECTOR_HDMIA,
>                                        &priv->ddc,
>                                        BIT(HDMI_COLORSPACE_RGB),
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index d59d2b3aef9a..22f083968aa8 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -38,10 +38,12 @@ struct drm_connector_state;
>  struct drm_private_obj;
>  struct drm_private_state;
>  struct drm_modeset_acquire_ctx;
>  struct drm_device;
>
> +struct hdmi_audio_infoframe;
> +
>  void __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *state,
>                                           struct drm_crtc *crtc);
>  void __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
>                                     struct drm_crtc_state *state);
>  void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc);
> @@ -86,10 +88,16 @@ struct drm_connector_state *
>  drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector);
>  void
>  __drm_atomic_helper_connector_destroy_state(struct drm_connector_state *state);
>  void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
>                                           struct drm_connector_state *state);
> +
> +int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
> +                                                           struct hdmi_audio_infoframe *frame);
> +int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
> +                                                      struct drm_atomic_state *state);
> +
>  void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj,
>                                                      struct drm_private_state *state);
>
>  void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
>                                                 struct drm_bridge_state *state);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 3eaf4d54364d..5964ef283022 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -912,10 +912,25 @@ struct drm_tv_connector_state {
>         unsigned int overscan;
>         unsigned int saturation;
>         unsigned int hue;
>  };
>
> +/**
> + * struct drm_connector_hdmi_infoframe - HDMI Infoframe container
> + */
> +struct drm_connector_hdmi_infoframe {
> +       /**
> +        * @data: HDMI Infoframe structure
> +        */
> +       union hdmi_infoframe data;
> +
> +       /**
> +        * @set: Is the content of @data valid?
> +        */
> +       bool set;
> +};
> +
>  /**
>   * struct drm_connector_state - mutable connector state
>   */
>  struct drm_connector_state {
>         /** @connector: backpointer to the connector */
> @@ -1068,10 +1083,39 @@ struct drm_connector_state {
>                  * @broadcast_rgb: Connector property to pass the
>                  * Broadcast RGB selection value.
>                  */
>                 enum drm_hdmi_broadcast_rgb broadcast_rgb;
>
> +               /**
> +                * @infoframes: HDMI Infoframes matching that state
> +                */
> +               struct {
> +                       /**
> +                        * @avi: AVI Infoframes structure matching our
> +                        * state.
> +                        */
> +                       struct drm_connector_hdmi_infoframe avi;
> +
> +                       /**
> +                        * @hdr_drm: DRM (Dynamic Range and Mastering)
> +                        * Infoframes structure matching our state.
> +                        */
> +                       struct drm_connector_hdmi_infoframe hdr_drm;
> +
> +                       /**
> +                        * @spd: SPD Infoframes structure matching our
> +                        * state.
> +                        */
> +                       struct drm_connector_hdmi_infoframe spd;
> +
> +                       /**
> +                        * @vendor: HDMI Vendor Infoframes structure
> +                        * matching our state.
> +                        */
> +                       struct drm_connector_hdmi_infoframe hdmi;
> +               } infoframes;
> +
>                 /**
>                  * @is_full_range: Is the output supposed to use a full
>                  * RGB Quantization Range or not?
>                  */
>                 bool is_full_range;
> @@ -1113,10 +1157,45 @@ struct drm_connector_hdmi_funcs {
>          */
>         enum drm_mode_status
>         (*tmds_char_rate_valid)(const struct drm_connector *connector,
>                                 const struct drm_display_mode *mode,
>                                 unsigned long long tmds_rate);
> +
> +       /**
> +        * @clear_infoframe:
> +        *
> +        * This callback is invoked through
> +        * @drm_atomic_helper_hdmi_connector_update_infoframes during a

Nit: drm_atomic_helper_connector_hdmi_update_infoframes

> +        * commit to clear the infoframes into the hardware. It will be
> +        * called multiple times, once for every disabled infoframe
> +        * type.
> +        *
> +        * The @clear_infoframe callback is optional.
> +        *
> +        * Returns:
> +        * 0 on success, a negative error code otherwise
> +        */
> +       int (*clear_infoframe)(struct drm_connector *connector,
> +                              enum hdmi_infoframe_type type);
> +
> +       /**
> +        * @write_infoframe:
> +        *
> +        * This callback is invoked through
> +        * @drm_atomic_helper_hdmi_connector_update_infoframes during a

And here

> +        * commit to program the infoframes into the hardware. It will
> +        * be called multiple times, once for every updated infoframe
> +        * type.
> +        *
> +        * The @write_infoframe callback is mandatory.
> +        *
> +        * Returns:
> +        * 0 on success, a negative error code otherwise
> +        */
> +       int (*write_infoframe)(struct drm_connector *connector,
> +                              enum hdmi_infoframe_type type,
> +                              const u8 *buffer, size_t len);
>  };
>
>  /**
>   * struct drm_connector_funcs - control connectors on a given device
>   *
> @@ -1984,20 +2063,73 @@ struct drm_connector {
>
>         /**
>          * @hdmi: HDMI-related variable and properties.
>          */
>         struct {
> +#define DRM_CONNECTOR_HDMI_VENDOR_LEN  8
> +               /**
> +                * @vendor: HDMI Controller Vendor Name
> +                */
> +               unsigned char vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] __nonstring;
> +
> +#define DRM_CONNECTOR_HDMI_PRODUCT_LEN 16
> +               /**
> +                * @product: HDMI Controller Product Name
> +                */
> +               unsigned char product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] __nonstring;
> +
>                 /**
>                  * @supported_formats: Bitmask of @hdmi_colorspace
>                  * supported by the controller.
>                  */
>                 unsigned long supported_formats;
>
>                 /**
>                  * @funcs: HDMI connector Control Functions
>                  */
>                 const struct drm_connector_hdmi_funcs *funcs;
> +
> +               /**
> +                * @infoframes: Current Infoframes output by the connector
> +                */
> +               struct {
> +                       /**
> +                        * @lock: Mutex protecting against concurrent access to
> +                        * the infoframes, most notably between KMS and ALSA.
> +                        */
> +                       struct mutex lock;
> +
> +                       /**
> +                        * @audio: Current Audio Infoframes structure. Protected
> +                        * by @lock.
> +                        */
> +                       struct drm_connector_hdmi_infoframe audio;
> +
> +                       /**
> +                        * @avi: Current AVI Infoframes structure. Protected by
> +                        * @lock.
> +                        */
> +                       struct drm_connector_hdmi_infoframe avi;
> +
> +                       /**
> +                        * @hdr_drm: Current DRM (Dynamic Range and Mastering)
> +                        * Infoframes structure. Protected by @lock.
> +                        */
> +                       struct drm_connector_hdmi_infoframe hdr_drm;
> +
> +                       /**
> +                        * @spd: Current SPD Infoframes structure. Protected by
> +                        * @lock.
> +                        */
> +                       struct drm_connector_hdmi_infoframe spd;
> +
> +                       /**
> +                        * @vendor: Current HDMI Vendor Infoframes structure.
> +                        * Protected by @lock.
> +                        */
> +                       struct drm_connector_hdmi_infoframe hdmi;
> +               } infoframes;
>         } hdmi;
>  };
>
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)
>
> @@ -2015,10 +2147,11 @@ int drmm_connector_init(struct drm_device *dev,
>                         const struct drm_connector_funcs *funcs,
>                         int connector_type,
>                         struct i2c_adapter *ddc);
>  int drmm_connector_hdmi_init(struct drm_device *dev,
>                              struct drm_connector *connector,
> +                            const char *vendor, const char *product,
>                              const struct drm_connector_funcs *funcs,
>                              const struct drm_connector_hdmi_funcs *hdmi_funcs,
>                              int connector_type,
>                              struct i2c_adapter *ddc,
>                              unsigned long supported_formats,
>
> --
> 2.43.2
>


-- 
With best wishes
Dmitry

