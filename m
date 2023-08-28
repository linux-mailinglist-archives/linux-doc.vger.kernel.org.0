Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDA678B299
	for <lists+linux-doc@lfdr.de>; Mon, 28 Aug 2023 16:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjH1OID (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Aug 2023 10:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbjH1OH4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Aug 2023 10:07:56 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA1BC7;
        Mon, 28 Aug 2023 07:07:51 -0700 (PDT)
Received: from xpredator (unknown [IPv6:2a02:2f08:4c00:5d00:7656:3cff:fe3f:7ce9])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: mvlad)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B5F6660719F;
        Mon, 28 Aug 2023 15:07:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1693231669;
        bh=Ng4szc0m7uekGnq4xBvQlJ/ABNCUFGp7+7rzcJBxFqc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MBq3Q1pMU44t+9GEoIRQPgqyh8HKjx3JfpRT2w4cF5n64TiiBUtD3o0jwLW9XDG0A
         7pmlb+iKsN/tXDhbBMdOEazPup7pfqj8vB30CEJ4lVGvATwxRFnUNQVNa47FHf88D+
         WA2fXFNn36nr0qxszlEpaca14PG4sxJRgMRC8kiPpj7qtymgdGT380Pj5pm/q7aMrv
         xAx12A8wyqDZdOEaHwopKMKz6EITQS5L0WImDOSbwjsNPHxdTN3+4lnRUafyEL/uyA
         X0tYa5HVEyWVq3ZkAgJzAFVeAb7jBxHiiOM+v4UCH54eQFKuEj3OwImUO4KWyUX/je
         ESCPQkpu/KiGQ==
Date:   Mon, 28 Aug 2023 17:07:45 +0300
From:   Marius Vlad <marius.vlad@collabora.com>
To:     Brandon Pollack <brpol@chromium.org>
Cc:     mairacanal@riseup.net, jshargo@chromium.org, corbet@lwn.net,
        dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        melissa.srw@gmail.com, mripard@kernel.org,
        rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de,
        airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mduggan@chromium.org,
        hirono@chromium.org
Subject: Re: [PATCH v5 2/7] drm/vkms: Support multiple DRM objects (crtcs,
 etc.) per VKMS device
Message-ID: <ZOyqMZzHjMI/a8Gs@xpredator>
References: <20230828081929.3574228-1-brpol@chromium.org>
 <20230828081929.3574228-3-brpol@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q3B6CuiNNRy3fiNg"
Content-Disposition: inline
In-Reply-To: <20230828081929.3574228-3-brpol@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--Q3B6CuiNNRy3fiNg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Brandon,

See a bottom comment about writeback connectors creation/initalization.

On Mon, Aug 28, 2023 at 08:17:04AM +0000, Brandon Pollack wrote:
> From: Jim Shargo <jshargo@chromium.org>
>=20
> This change supports multiple CRTCs, encoders, connectors instead of one
> of each per device.
>=20
> Since ConfigFS-based devices will support multiple crtcs, it's useful to
> move all of the writeback/composition data from being per-"output" to
> being per-CRTC.
>=20
> Since there's still only ever one CRTC, this should be a no-op refactor.
>=20
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> Signed-off-by: Brandon Pollack <brpol@chromium.org>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c  |  30 +++----
>  drivers/gpu/drm/vkms/vkms_crtc.c      | 100 ++++++++++++---------
>  drivers/gpu/drm/vkms/vkms_drv.c       |  12 +--
>  drivers/gpu/drm/vkms/vkms_drv.h       |  70 +++++++++------
>  drivers/gpu/drm/vkms/vkms_output.c    | 122 ++++++++++++++++++--------
>  drivers/gpu/drm/vkms/vkms_plane.c     |  38 ++++++--
>  drivers/gpu/drm/vkms/vkms_writeback.c |  31 +++----
>  7 files changed, 256 insertions(+), 147 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index d5d4f642d367..a59eb75a21c4 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -300,13 +300,13 @@ void vkms_composer_worker(struct work_struct *work)
>  						composer_work);
>  	struct drm_crtc *crtc =3D crtc_state->base.crtc;
>  	struct vkms_writeback_job *active_wb =3D crtc_state->active_writeback;
> -	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *vkms_crtc =3D drm_crtc_to_vkms_crtc(crtc);
>  	bool crc_pending, wb_pending;
>  	u64 frame_start, frame_end;
>  	u32 crc32 =3D 0;
>  	int ret;
> =20
> -	spin_lock_irq(&out->composer_lock);
> +	spin_lock_irq(&vkms_crtc->composer_lock);
>  	frame_start =3D crtc_state->frame_start;
>  	frame_end =3D crtc_state->frame_end;
>  	crc_pending =3D crtc_state->crc_pending;
> @@ -330,7 +330,7 @@ void vkms_composer_worker(struct work_struct *work)
>  		crtc_state->gamma_lut.base =3D NULL;
>  	}
> =20
> -	spin_unlock_irq(&out->composer_lock);
> +	spin_unlock_irq(&vkms_crtc->composer_lock);
> =20
>  	/*
>  	 * We raced with the vblank hrtimer and previous work already computed
> @@ -348,10 +348,10 @@ void vkms_composer_worker(struct work_struct *work)
>  		return;
> =20
>  	if (wb_pending) {
> -		drm_writeback_signal_completion(&out->wb_connector, 0);
> -		spin_lock_irq(&out->composer_lock);
> +		drm_writeback_signal_completion(&vkms_crtc->wb_connector, 0);
> +		spin_lock_irq(&vkms_crtc->composer_lock);
>  		crtc_state->wb_pending =3D false;
> -		spin_unlock_irq(&out->composer_lock);
> +		spin_unlock_irq(&vkms_crtc->composer_lock);
>  	}
> =20
>  	/*
> @@ -401,30 +401,30 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, c=
onst char *src_name,
>  	return 0;
>  }
> =20
> -void vkms_set_composer(struct vkms_output *out, bool enabled)
> +void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled)
>  {
>  	bool old_enabled;
> =20
>  	if (enabled)
> -		drm_crtc_vblank_get(&out->crtc);
> +		drm_crtc_vblank_get(&vkms_crtc->base);
> =20
> -	mutex_lock(&out->enabled_lock);
> -	old_enabled =3D out->composer_enabled;
> -	out->composer_enabled =3D enabled;
> +	mutex_lock(&vkms_crtc->enabled_lock);
> +	old_enabled =3D vkms_crtc->composer_enabled;
> +	vkms_crtc->composer_enabled =3D enabled;
> =20
>  	/* the composition wasn't enabled, so unlock the lock to make sure the =
lock
>  	 * will be balanced even if we have a failed commit
>  	 */
> -	if (!out->composer_enabled)
> -		mutex_unlock(&out->enabled_lock);
> +	if (!vkms_crtc->composer_enabled)
> +		mutex_unlock(&vkms_crtc->enabled_lock);
> =20
>  	if (old_enabled)
> -		drm_crtc_vblank_put(&out->crtc);
> +		drm_crtc_vblank_put(&vkms_crtc->base);
>  }
> =20
>  int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>  {
> -	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *out =3D drm_crtc_to_vkms_crtc(crtc);
>  	bool enabled =3D false;
>  	int ret =3D 0;
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index 3c5ebf106b66..74bbd675464b 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
> =20
> +#include "linux/mutex.h"
>  #include <linux/dma-fence.h>
> =20
>  #include <drm/drm_atomic.h>
> @@ -11,17 +12,16 @@
> =20
>  static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>  {
> -	struct vkms_output *output =3D container_of(timer, struct vkms_output,
> -						  vblank_hrtimer);
> -	struct drm_crtc *crtc =3D &output->crtc;
> +	struct vkms_crtc *vkms_crtc =3D timer_to_vkms_crtc(timer);
> +	struct drm_crtc *crtc =3D &vkms_crtc->base;
>  	struct vkms_crtc_state *state;
>  	u64 ret_overrun;
>  	bool ret, fence_cookie, composer_enabled;
> =20
>  	fence_cookie =3D dma_fence_begin_signalling();
> =20
> -	ret_overrun =3D hrtimer_forward_now(&output->vblank_hrtimer,
> -					  output->period_ns);
> +	ret_overrun =3D hrtimer_forward_now(&vkms_crtc->vblank_hrtimer,
> +					  vkms_crtc->period_ns);
>  	if (ret_overrun !=3D 1)
>  		pr_warn("%s: vblank timer overrun\n", __func__);
> =20
> @@ -29,9 +29,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct=
 hrtimer *timer)
>  	if (!ret)
>  		DRM_ERROR("vkms failure on handling vblank");
> =20
> -	state =3D output->composer_state;
> -	composer_enabled =3D output->composer_enabled;
> -	mutex_unlock(&output->enabled_lock);
> +	state =3D vkms_crtc->composer_state;
> +	composer_enabled =3D vkms_crtc->composer_enabled;
> +	mutex_unlock(&vkms_crtc->enabled_lock);
> =20
>  	if (state && composer_enabled) {
>  		u64 frame =3D drm_crtc_accurate_vblank_count(crtc);
> @@ -39,7 +39,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct=
 hrtimer *timer)
>  		/* update frame_start only if a queued vkms_composer_worker()
>  		 * has read the data
>  		 */
> -		spin_lock(&output->composer_lock);
> +		spin_lock(&vkms_crtc->composer_lock);
>  		if (!state->crc_pending)
>  			state->frame_start =3D frame;
>  		else
> @@ -47,9 +47,10 @@ static enum hrtimer_restart vkms_vblank_simulate(struc=
t hrtimer *timer)
>  					 state->frame_start, frame);
>  		state->frame_end =3D frame;
>  		state->crc_pending =3D true;
> -		spin_unlock(&output->composer_lock);
> +		spin_unlock(&vkms_crtc->composer_lock);
> =20
> -		ret =3D queue_work(output->composer_workq, &state->composer_work);
> +		ret =3D queue_work(vkms_crtc->composer_workq,
> +				 &state->composer_work);
>  		if (!ret)
>  			DRM_DEBUG_DRIVER("Composer worker already queued\n");
>  	}
> @@ -62,25 +63,27 @@ static enum hrtimer_restart vkms_vblank_simulate(stru=
ct hrtimer *timer)
>  static int vkms_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct drm_device *dev =3D crtc->dev;
> +	struct vkms_crtc *vkms_crtc =3D drm_crtc_to_vkms_crtc(crtc);
>  	unsigned int pipe =3D drm_crtc_index(crtc);
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> -	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
> =20
>  	drm_calc_timestamping_constants(crtc, &crtc->mode);
> =20
> -	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -	out->vblank_hrtimer.function =3D &vkms_vblank_simulate;
> -	out->period_ns =3D ktime_set(0, vblank->framedur_ns);
> -	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
> +	hrtimer_init(&vkms_crtc->vblank_hrtimer, CLOCK_MONOTONIC,
> +		     HRTIMER_MODE_REL);
> +	vkms_crtc->vblank_hrtimer.function =3D &vkms_vblank_simulate;
> +	vkms_crtc->period_ns =3D ktime_set(0, vblank->framedur_ns);
> +	hrtimer_start(&vkms_crtc->vblank_hrtimer, vkms_crtc->period_ns,
> +		      HRTIMER_MODE_REL);
> =20
>  	return 0;
>  }
> =20
>  static void vkms_disable_vblank(struct drm_crtc *crtc)
>  {
> -	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *vkms_crtc =3D drm_crtc_to_vkms_crtc(crtc);
> =20
> -	hrtimer_cancel(&out->vblank_hrtimer);
> +	hrtimer_cancel(&vkms_crtc->vblank_hrtimer);
>  }
> =20
>  static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
> @@ -88,9 +91,8 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *=
crtc,
>  				      bool in_vblank_irq)
>  {
>  	struct drm_device *dev =3D crtc->dev;
> +	struct vkms_crtc *vkms_crtc =3D drm_crtc_to_vkms_crtc(crtc);
>  	unsigned int pipe =3D crtc->index;
> -	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(dev);
> -	struct vkms_output *output =3D &vkmsdev->output;
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> =20
>  	if (!READ_ONCE(vblank->enabled)) {
> @@ -98,7 +100,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc =
*crtc,
>  		return true;
>  	}
> =20
> -	*vblank_time =3D READ_ONCE(output->vblank_hrtimer.node.expires);
> +	*vblank_time =3D READ_ONCE(vkms_crtc->vblank_hrtimer.node.expires);
> =20
>  	if (WARN_ON(*vblank_time =3D=3D vblank->time))
>  		return true;
> @@ -110,7 +112,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc=
 *crtc,
>  	 * the vblank core expects. Therefore we need to always correct the
>  	 * timestampe by one frame.
>  	 */
> -	*vblank_time -=3D output->period_ns;
> +	*vblank_time -=3D vkms_crtc->period_ns;
> =20
>  	return true;
>  }
> @@ -236,18 +238,18 @@ static void vkms_crtc_atomic_disable(struct drm_crt=
c *crtc,
>  static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
>  				   struct drm_atomic_state *state)
>  {
> -	struct vkms_output *vkms_output =3D drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *vkms_crtc =3D drm_crtc_to_vkms_crtc(crtc);
> =20
>  	/* This lock is held across the atomic commit to block vblank timer
>  	 * from scheduling vkms_composer_worker until the composer is updated
>  	 */
> -	spin_lock_irq(&vkms_output->lock);
> +	spin_lock_irq(&vkms_crtc->lock);
>  }
> =20
>  static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>  				   struct drm_atomic_state *state)
>  {
> -	struct vkms_output *vkms_output =3D drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc *vkms_crtc =3D drm_crtc_to_vkms_crtc(crtc);
> =20
>  	if (crtc->state->event) {
>  		spin_lock(&crtc->dev->event_lock);
> @@ -262,9 +264,9 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *c=
rtc,
>  		crtc->state->event =3D NULL;
>  	}
> =20
> -	vkms_output->composer_state =3D to_vkms_crtc_state(crtc->state);
> +	vkms_crtc->composer_state =3D to_vkms_crtc_state(crtc->state);
> =20
> -	spin_unlock_irq(&vkms_output->lock);
> +	spin_unlock_irq(&vkms_crtc->lock);
>  }
> =20
>  static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs =3D {
> @@ -275,31 +277,45 @@ static const struct drm_crtc_helper_funcs vkms_crtc=
_helper_funcs =3D {
>  	.atomic_disable	=3D vkms_crtc_atomic_disable,
>  };
> =20
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor)
> +struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
> +				 struct drm_plane *primary,
> +				 struct drm_plane *cursor)
>  {
> -	struct vkms_output *vkms_out =3D drm_crtc_to_vkms_output(crtc);
> +	struct drm_device *dev =3D &vkmsdev->drm;
> +	struct vkms_crtc *vkms_crtc;
>  	int ret;
> =20
> -	ret =3D drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
> +	if (vkmsdev->output.num_crtcs >=3D VKMS_MAX_OUTPUT_OBJECTS)
> +		return ERR_PTR(-ENOMEM);
> +
> +	vkms_crtc =3D &vkmsdev->output.crtcs[vkmsdev->output.num_crtcs++];
> +
> +	ret =3D drmm_crtc_init_with_planes(dev, &vkms_crtc->base, primary, curs=
or,
>  					 &vkms_crtc_funcs, NULL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init CRTC\n");
> -		return ret;
> +		goto out_error;
>  	}
> =20
> -	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> +	drm_crtc_helper_add(&vkms_crtc->base, &vkms_crtc_helper_funcs);
> =20
> -	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
> -	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
> +	drm_mode_crtc_set_gamma_size(&vkms_crtc->base, VKMS_LUT_SIZE);
> +	drm_crtc_enable_color_mgmt(&vkms_crtc->base, 0, false, VKMS_LUT_SIZE);
> =20
> -	spin_lock_init(&vkms_out->lock);
> -	spin_lock_init(&vkms_out->composer_lock);
> -	mutex_init(&vkms_out->enabled_lock);
> +	spin_lock_init(&vkms_crtc->lock);
> +	spin_lock_init(&vkms_crtc->composer_lock);
> +	mutex_init(&vkms_crtc->enabled_lock);
> =20
> -	vkms_out->composer_workq =3D alloc_ordered_workqueue("vkms_composer", 0=
);
> -	if (!vkms_out->composer_workq)
> -		return -ENOMEM;
> +	vkms_crtc->composer_workq =3D alloc_ordered_workqueue("vkms_composer", =
0);
> +	if (!vkms_crtc->composer_workq) {
> +		ret =3D -ENOMEM;
> +		goto out_error;
> +	}
> +
> +	return vkms_crtc;
> =20
> -	return ret;
> +out_error:
> +	memset(vkms_crtc, 0, sizeof(*vkms_crtc));
> +	vkmsdev->output.num_crtcs -=3D 1;
> +	return ERR_PTR(ret);
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 387c832f5dc9..65b1e2c52106 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -57,8 +57,8 @@ static void vkms_release(struct drm_device *dev)
>  {
>  	struct vkms_device *vkms =3D drm_device_to_vkms_device(dev);
> =20
> -	if (vkms->output.composer_workq)
> -		destroy_workqueue(vkms->output.composer_workq);
> +	for (int i =3D 0; i < vkms->output.num_crtcs; i++)
> +		destroy_workqueue(vkms->output.crtcs[i].composer_workq);
>  }
> =20
>  static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> @@ -203,15 +203,15 @@ static int vkms_platform_probe(struct platform_devi=
ce *pdev)
>  		goto out_release_group;
>  	}
> =20
> -	ret =3D drm_vblank_init(&vkms_device->drm, 1);
> +	ret =3D vkms_modeset_init(vkms_device);
>  	if (ret) {
> -		DRM_ERROR("Failed to vblank\n");
> +		DRM_ERROR("Unable to initialize modesetting\n");
>  		goto out_release_group;
>  	}
> =20
> -	ret =3D vkms_modeset_init(vkms_device);
> +	ret =3D drm_vblank_init(&vkms_device->drm, vkms_device->output.num_crtc=
s);
>  	if (ret) {
> -		DRM_ERROR("Unable to initialize modesetting\n");
> +		DRM_ERROR("Failed to vblank\n");
>  		goto out_release_group;
>  	}
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 4c35d6305f2a..761cd809617e 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -23,6 +23,10 @@
> =20
>  #define NUM_OVERLAY_PLANES 8
> =20
> +
> +#define VKMS_MAX_OUTPUT_OBJECTS 16
> +#define VKMS_MAX_PLANES (3 * VKMS_MAX_OUTPUT_OBJECTS)
> +
>  #define VKMS_LUT_SIZE 256
> =20
>  struct vkms_frame_info {
> @@ -66,6 +70,27 @@ struct vkms_plane {
>  	struct drm_plane base;
>  };
> =20
> +struct vkms_crtc {
> +	struct drm_crtc base;
> +
> +	struct drm_writeback_connector wb_connector;
> +	struct hrtimer vblank_hrtimer;
> +	ktime_t period_ns;
> +	struct drm_pending_vblank_event *event;
> +	/* ordered wq for composer_work */
> +	struct workqueue_struct *composer_workq;
> +	/* protects concurrent access to composer */
> +	spinlock_t lock;
> +	/* guarantees that if the composer is enabled, a job will be queued */
> +	struct mutex enabled_lock;
> +
> +	/* protected by @enabled_lock */
> +	bool composer_enabled;
> +	struct vkms_crtc_state *composer_state;
> +
> +	spinlock_t composer_lock;
> +};
> +
>  struct vkms_color_lut {
>  	struct drm_color_lut *base;
>  	size_t lut_length;
> @@ -97,25 +122,14 @@ struct vkms_crtc_state {
>  };
> =20
>  struct vkms_output {
> -	struct drm_crtc crtc;
> -	struct drm_encoder encoder;
> -	struct drm_connector connector;
> -	struct drm_writeback_connector wb_connector;
> -	struct hrtimer vblank_hrtimer;
> -	ktime_t period_ns;
> -	struct drm_pending_vblank_event *event;
> -	/* ordered wq for composer_work */
> -	struct workqueue_struct *composer_workq;
> -	/* protects concurrent access to composer */
> -	spinlock_t lock;
> -	/* guarantees that if the composer is enabled, a job will be queued */
> -	struct mutex enabled_lock;
> -
> -	/* protected by @enabled_lock */
> -	bool composer_enabled;
> -	struct vkms_crtc_state *composer_state;
> -
> -	spinlock_t composer_lock;
> +	int num_crtcs;
> +	struct vkms_crtc crtcs[VKMS_MAX_OUTPUT_OBJECTS];
> +	int num_encoders;
> +	struct drm_encoder encoders[VKMS_MAX_OUTPUT_OBJECTS];
> +	int num_connectors;
> +	struct drm_connector connectors[VKMS_MAX_OUTPUT_OBJECTS];
> +	int num_planes;
> +	struct vkms_plane planes[VKMS_MAX_PLANES];
>  };
> =20
>  struct vkms_device;
> @@ -133,12 +147,14 @@ struct vkms_device {
>  	struct vkms_config config;
>  };
> =20
> -#define drm_crtc_to_vkms_output(target) \
> -	container_of(target, struct vkms_output, crtc)
> +#define drm_crtc_to_vkms_crtc(crtc) container_of(crtc, struct vkms_crtc,=
 base)
> =20
>  #define drm_device_to_vkms_device(target) \
>  	container_of(target, struct vkms_device, drm)
> =20
> +#define timer_to_vkms_crtc(timer) \
> +	container_of(timer, struct vkms_crtc, vblank_hrtimer)
> +
>  #define to_vkms_crtc_state(target)\
>  	container_of(target, struct vkms_crtc_state, base)
> =20
> @@ -146,13 +162,14 @@ struct vkms_device {
>  	container_of(target, struct vkms_plane_state, base.base)
> =20
>  /* CRTC */
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor);
> +struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
> +				 struct drm_plane *primary,
> +				 struct drm_plane *cursor);
> =20
>  int vkms_output_init(struct vkms_device *vkmsdev, int index);
> =20
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int index);
> +				   enum drm_plane_type type);
> =20
>  /* CRC Support */
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> @@ -163,11 +180,12 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, c=
onst char *source_name,
> =20
>  /* Composer Support */
>  void vkms_composer_worker(struct work_struct *work);
> -void vkms_set_composer(struct vkms_output *out, bool enabled);
> +void vkms_set_composer(struct vkms_crtc *vkms_crtc, bool enabled);
>  void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plan=
e_state *plane, int y);
>  void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line=
_buffer *src_buffer, int y);
> =20
>  /* Writeback */
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
> +				    struct vkms_crtc *vkms_crtc);
> =20
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vk=
ms_output.c
> index 963a64cf068b..86faf94f7408 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -1,9 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0+
> =20
> -#include "vkms_drv.h"
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_encoder.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "vkms_drv.h"
> =20
>  static const struct drm_connector_funcs vkms_connector_funcs =3D {
>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
> @@ -28,74 +32,116 @@ static int vkms_conn_get_modes(struct drm_connector =
*connector)
>  }
> =20
>  static const struct drm_connector_helper_funcs vkms_conn_helper_funcs =
=3D {
> -	.get_modes    =3D vkms_conn_get_modes,
> +	.get_modes =3D vkms_conn_get_modes,
>  };
> =20
> -static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
> -				  struct drm_crtc *crtc)
> +static struct drm_connector *
> +vkms_connector_init(struct vkms_device *vkms_device)
>  {
> -	struct vkms_plane *overlay;
> +	struct drm_connector *connector;
> +	int ret;
> =20
> -	overlay =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> -	if (IS_ERR(overlay))
> -		return PTR_ERR(overlay);
> +	if (vkms_device->output.num_connectors >=3D VKMS_MAX_OUTPUT_OBJECTS)
> +		return ERR_PTR(-ENOMEM);
> =20
> -	if (!overlay->base.possible_crtcs)
> -		overlay->base.possible_crtcs =3D drm_crtc_mask(crtc);
> +	connector =3D &vkms_device->output
> +			     .connectors[vkms_device->output.num_connectors++];
> +	ret =3D drm_connector_init(&vkms_device->drm, connector,
> +				 &vkms_connector_funcs,
> +				 DRM_MODE_CONNECTOR_VIRTUAL);
> +	if (ret) {
> +		memset(connector, 0, sizeof(*connector));
> +		vkms_device->output.num_connectors -=3D 1;
> +		return ERR_PTR(ret);
> +	}
> =20
> -	return 0;
> +	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> +
> +	return connector;
> +}
> +
> +static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_de=
vice)
> +{
> +	struct drm_encoder *encoder;
> +	int ret;
> +
> +	if (vkms_device->output.num_encoders >=3D VKMS_MAX_OUTPUT_OBJECTS)
> +		return ERR_PTR(-ENOMEM);
> +
> +	encoder =3D &vkms_device->output
> +			   .encoders[vkms_device->output.num_encoders++];
> +	ret =3D drm_encoder_init(&vkms_device->drm, encoder, &vkms_encoder_func=
s,
> +			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	if (ret) {
> +		memset(encoder, 0, sizeof(*encoder));
> +		vkms_device->output.num_encoders -=3D 1;
> +		return ERR_PTR(ret);
> +	}
> +	return encoder;
>  }
> =20
>  int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  {
>  	struct vkms_output *output =3D &vkmsdev->output;
>  	struct drm_device *dev =3D &vkmsdev->drm;
> -	struct drm_connector *connector =3D &output->connector;
> -	struct drm_encoder *encoder =3D &output->encoder;
> -	struct drm_crtc *crtc =3D &output->crtc;
> +	struct drm_connector *connector;
> +	struct drm_encoder *encoder;
> +	struct vkms_crtc *vkms_crtc;
>  	struct vkms_plane *primary, *cursor =3D NULL;
>  	int ret;
>  	int writeback;
>  	unsigned int n;
> =20
> -	primary =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
> +	primary =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
> =20
>  	if (vkmsdev->config.overlay) {
>  		for (n =3D 0; n < NUM_OVERLAY_PLANES; n++) {
> -			ret =3D vkms_add_overlay_plane(vkmsdev, index, crtc);
> -			if (ret)
> -				return ret;
> +			struct vkms_plane *overlay =3D vkms_plane_init(
> +				vkmsdev, DRM_PLANE_TYPE_OVERLAY);
> +			if (IS_ERR(overlay)) {
> +				ret =3D PTR_ERR(overlay);
> +				goto err_planes;
> +			}
>  		}
>  	}
> =20
>  	if (vkmsdev->config.cursor) {
> -		cursor =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> -		if (IS_ERR(cursor))
> -			return PTR_ERR(cursor);
> +		cursor =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
> +		if (IS_ERR(cursor)) {
> +			ret =3D PTR_ERR(cursor);
> +			goto err_planes;
> +		}
>  	}
> =20
> -	ret =3D vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
> -	if (ret)
> -		return ret;
> +	vkms_crtc =3D vkms_crtc_init(vkmsdev, &primary->base,
> +				   cursor ? &cursor->base : NULL);
> +	if (IS_ERR(vkms_crtc)) {
> +		DRM_ERROR("Failed to init crtc\n");
> +		ret =3D PTR_ERR(vkms_crtc);
> +		goto err_planes;
> +	}
> =20
> -	ret =3D drm_connector_init(dev, connector, &vkms_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VIRTUAL);
> -	if (ret) {
> +	for (int i =3D 0; i < vkmsdev->output.num_planes; i++) {
> +		vkmsdev->output.planes[i].base.possible_crtcs |=3D
> +			drm_crtc_mask(&vkms_crtc->base);
> +	}
> +
> +	connector =3D vkms_connector_init(vkmsdev);
> +	if (IS_ERR(connector)) {
>  		DRM_ERROR("Failed to init connector\n");
> +		ret =3D PTR_ERR(connector);
>  		goto err_connector;
>  	}
> =20
> -	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> -
> -	ret =3D drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> -	if (ret) {
> +	encoder =3D vkms_encoder_init(vkmsdev);
> +	if (IS_ERR(encoder)) {
>  		DRM_ERROR("Failed to init encoder\n");
> +		ret =3D PTR_ERR(encoder);
>  		goto err_encoder;
>  	}
> -	encoder->possible_crtcs =3D 1;
> +	encoder->possible_crtcs |=3D drm_crtc_mask(&vkms_crtc->base);
> =20
>  	ret =3D drm_connector_attach_encoder(connector, encoder);
>  	if (ret) {
> @@ -104,7 +150,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int=
 index)
>  	}
> =20
>  	if (vkmsdev->config.writeback) {
> -		writeback =3D vkms_enable_writeback_connector(vkmsdev);
> +		writeback =3D vkms_enable_writeback_connector(vkmsdev, vkms_crtc);
>  		if (writeback)
>  			DRM_ERROR("Failed to init writeback connector\n");
>  	}
> @@ -120,7 +166,13 @@ int vkms_output_init(struct vkms_device *vkmsdev, in=
t index)
>  	drm_connector_cleanup(connector);
> =20
>  err_connector:
> -	drm_crtc_cleanup(crtc);
> +	drm_crtc_cleanup(&vkms_crtc->base);
> +
> +err_planes:
> +	for (int i =3D 0; i < output->num_planes; i++)
> +		drm_plane_cleanup(&output->planes[i].base);
> +
> +	memset(output, 0, sizeof(*output));
> =20
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index e5c625ab8e3e..950e6c930273 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -8,6 +8,8 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_plane_helper.h>
> =20
>  #include "vkms_drv.h"
>  #include "vkms_formats.h"
> @@ -65,6 +67,20 @@ static void vkms_plane_destroy_state(struct drm_plane =
*plane,
>  	kfree(vkms_state);
>  }
> =20
> +static void vkms_plane_destroy(struct drm_plane *plane)
> +{
> +	struct vkms_plane *vkms_plane =3D
> +		container_of(plane, struct vkms_plane, base);
> +
> +	if (plane->state) {
> +		vkms_plane_destroy_state(plane, plane->state);
> +		plane->state =3D NULL;
> +	}
> +
> +	drm_plane_cleanup(plane);
> +	memset(vkms_plane, 0, sizeof(struct vkms_plane));
> +}
> +
>  static void vkms_plane_reset(struct drm_plane *plane)
>  {
>  	struct vkms_plane_state *vkms_state;
> @@ -86,9 +102,10 @@ static void vkms_plane_reset(struct drm_plane *plane)
>  static const struct drm_plane_funcs vkms_plane_funcs =3D {
>  	.update_plane		=3D drm_atomic_helper_update_plane,
>  	.disable_plane		=3D drm_atomic_helper_disable_plane,
> +	.destroy =3D vkms_plane_destroy,
>  	.reset			=3D vkms_plane_reset,
>  	.atomic_duplicate_state =3D vkms_plane_duplicate_state,
> -	.atomic_destroy_state	=3D vkms_plane_destroy_state,
> +	.atomic_destroy_state =3D vkms_plane_destroy_state,
>  };
> =20
>  static void vkms_plane_atomic_update(struct drm_plane *plane,
> @@ -198,17 +215,22 @@ static const struct drm_plane_helper_funcs vkms_pla=
ne_helper_funcs =3D {
>  };
> =20
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int index)
> +				   enum drm_plane_type type)
>  {
>  	struct drm_device *dev =3D &vkmsdev->drm;
> +	struct vkms_output *output =3D &vkmsdev->output;
>  	struct vkms_plane *plane;
> +	int ret;
> =20
> -	plane =3D drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 <<=
 index,
> -					   &vkms_plane_funcs,
> -					   vkms_formats, ARRAY_SIZE(vkms_formats),
> -					   NULL, type, NULL);
> -	if (IS_ERR(plane))
> -		return plane;
> +	if (output->num_planes >=3D VKMS_MAX_PLANES)
> +		return ERR_PTR(-ENOMEM);
> +
> +	plane =3D &output->planes[output->num_planes++];
> +	ret =3D drm_universal_plane_init(dev, &plane->base, 0, &vkms_plane_func=
s,
> +				       vkms_formats, ARRAY_SIZE(vkms_formats),
> +				       NULL, type, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> =20
>  	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms=
/vkms_writeback.c
> index d7e63aa14663..73b8c968e326 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
> =20
>  #include <linux/iosys-map.h>
> +#include <linux/kernel.h>
> =20
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_edid.h>
> @@ -102,7 +103,8 @@ static void vkms_wb_cleanup_job(struct drm_writeback_=
connector *connector,
>  				struct drm_writeback_job *job)
>  {
>  	struct vkms_writeback_job *vkmsjob =3D job->priv;
> -	struct vkms_device *vkmsdev;
> +	struct vkms_crtc *vkms_crtc =3D
> +		container_of(connector, struct vkms_crtc, wb_connector);
> =20
>  	if (!job->fb)
>  		return;
> @@ -111,8 +113,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_=
connector *connector,
> =20
>  	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
> =20
> -	vkmsdev =3D drm_device_to_vkms_device(job->fb->dev);
> -	vkms_set_composer(&vkmsdev->output, false);
> +	vkms_set_composer(vkms_crtc, false);
>  	kfree(vkmsjob);
>  }
> =20
> @@ -121,11 +122,10 @@ static void vkms_wb_atomic_commit(struct drm_connec=
tor *conn,
>  {
>  	struct drm_connector_state *connector_state =3D drm_atomic_get_new_conn=
ector_state(state,
>  											 conn);
> -	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(conn->dev);
> -	struct vkms_output *output =3D &vkmsdev->output;
> -	struct drm_writeback_connector *wb_conn =3D &output->wb_connector;
> -	struct drm_connector_state *conn_state =3D wb_conn->base.state;
> -	struct vkms_crtc_state *crtc_state =3D output->composer_state;
> +	struct vkms_crtc *vkms_crtc =3D
> +		drm_crtc_to_vkms_crtc(connector_state->crtc);
> +	struct drm_writeback_connector *wb_conn =3D &vkms_crtc->wb_connector;
> +	struct vkms_crtc_state *crtc_state =3D vkms_crtc->composer_state;
>  	struct drm_framebuffer *fb =3D connector_state->writeback_job->fb;
>  	u16 crtc_height =3D crtc_state->base.crtc->mode.vdisplay;
>  	u16 crtc_width =3D crtc_state->base.crtc->mode.hdisplay;
> @@ -133,18 +133,18 @@ static void vkms_wb_atomic_commit(struct drm_connec=
tor *conn,
>  	struct vkms_frame_info *wb_frame_info;
>  	u32 wb_format =3D fb->format->format;
> =20
> -	if (!conn_state)
> +	if (!connector_state)
>  		return;
> =20
> -	vkms_set_composer(&vkmsdev->output, true);
> +	vkms_set_composer(vkms_crtc, true);
> =20
> -	active_wb =3D conn_state->writeback_job->priv;
> +	active_wb =3D connector_state->writeback_job->priv;
>  	wb_frame_info =3D &active_wb->wb_frame_info;
> =20
> -	spin_lock_irq(&output->composer_lock);
> +	spin_lock_irq(&vkms_crtc->composer_lock);
>  	crtc_state->active_writeback =3D active_wb;
>  	crtc_state->wb_pending =3D true;
> -	spin_unlock_irq(&output->composer_lock);
> +	spin_unlock_irq(&vkms_crtc->composer_lock);
> =20
>  	wb_frame_info->offset =3D fb->offsets[0];
>  	wb_frame_info->pitch =3D fb->pitches[0];
> @@ -163,9 +163,10 @@ static const struct drm_connector_helper_funcs vkms_=
wb_conn_helper_funcs =3D {
>  	.atomic_commit =3D vkms_wb_atomic_commit,
>  };
> =20
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
> +				    struct vkms_crtc *vkms_crtc)
>  {
> -	struct drm_writeback_connector *wb =3D &vkmsdev->output.wb_connector;
> +	struct drm_writeback_connector *wb =3D &vkms_crtc->wb_connector;
> =20
>  	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
drm_writeback_connector_init() is still passing 1 even though we now
have vkms_crtc->base. You'd need to pass the correct crtc mask,
otherwise only the first connector would have a WB connector.
> =20
> --=20
> 2.42.0.rc1.204.g551eb34607-goog
>=20

--Q3B6CuiNNRy3fiNg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmTsqiUACgkQ9jQS5glH
1u84OhAAiyTIRIgbGxskCQCo1ciFo/rTSlEIuvfoIk+mBd3P47BrAFYaFKuFRTiY
pVCQxHWwfHG1Xt6KweHrbfeK/MM/qVT45G6JazFARBxoUITHfX7WWPMjvi5LxWTN
/BC2qi3P5XFlErQjMtqUv7N+gl471QxIFjc00fqLtPwqczxKZThxia3nqsmYOO1R
eDcG5BOLKxVQ/wcIwY63JV4nANEJo0yyN4d4pD0kOtc4GRqCmpR2BOqmwQfRMrmF
aXDob6mbxF9j3i3APl604/WyKKwSq8FLQnRsBF18jvFj3yD/D8Glx9tB/0WzHPnZ
wGI5bjGc2J8NjtAV56JuzAgHJpwaRJYTUK7RhCNZIby32y+gyRCtdbz2yjATu7nF
Al05gltHkleqByRBCB3N/bRPUX4iix36Qul0/bI+qGXAzePABm0ow6jBkT+wEfgl
eMiDStwcB8TizS/2ycvesnfe/YA7hGuRkzbyOOSzMj+83YuUbWxwfna0OhdALJZN
4R/UpHj9LPiXfof25FbB1okNxiWxi+SUYIUN0L7dt3mozr9jxctKPkf9ms3KkD2L
agNwUY3RiQ+E/R0nNY7Rbo+xbbaQ/7RAwNrokcwp9lB/2vfLOG54aWGwV6HxhzhC
y3GFPDxqjkSwfUfcooswRV7pz3O5cVetRcGeQMRkOjPIV6gK+jo=
=CBE/
-----END PGP SIGNATURE-----

--Q3B6CuiNNRy3fiNg--
