Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B45AD7805A0
	for <lists+linux-doc@lfdr.de>; Fri, 18 Aug 2023 07:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358151AbjHRFZa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Aug 2023 01:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357433AbjHRFYW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 01:24:22 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F6049FD
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 22:24:19 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1c26bb27feeso303489fac.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 22:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692336259; x=1692941059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vKY6dslgCgbpKgOXRY3KL48h9xLMusfKMnXRvr2rLHo=;
        b=QtaN/l+8H5mnKYER/RNnmyzmMYZMMoSmTd6TH0qzyrZyXiIAk5+dVtJD3CDxMQfh5p
         0NIfJVi56WJFGS67nMsb3y4yHyWrqifWEckIDgg008QSJJp0xEHlQMW6gtUFAiaBj7F7
         UuCVctBgoYLz/s3ZNqn3JhfI5tb045Po7jCmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692336259; x=1692941059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vKY6dslgCgbpKgOXRY3KL48h9xLMusfKMnXRvr2rLHo=;
        b=fBpMAXgUs+ixB21K8udbsaXr4XSUb/PtPlK65QVJkcmugwE8VtzNoFhkWgW0HLZc5v
         CIxNDpKIbQTUwFA5DAB2gB/kJJBm5uPE1RUWRW9aXcUnTtystuG9tFqEBss7WBXrR2zD
         s41hOu5v2qFxDhmQ8+e5OX/ys2dUjxEmjsMInPwWcQAbI3b5PDsHCRX3Kvc0Px3CAckz
         R/IGumXAfkWgrzVX7P1T1zNhajI0eoTyWsCIXuP1hYwVvOWz3yL5Aufjl7EUTzYJuT5Y
         f3rNWEeuR2/4w0/Zc6V2vYvosJC7/Kepz9ExA6ATEoHSebVHR4FkNOOlSTm9kTFf61XJ
         L19Q==
X-Gm-Message-State: AOJu0Yy0JX0DvBuI8UejPyOlEPajiwyr/tIGmR8oj6BQP0CwSPSdwxDP
        +6T/aTHHRgdGrwsie1LieF0dEg==
X-Google-Smtp-Source: AGHT+IGdqKWWvsPAFKIYxFyzP/Zx57oTaDjCVpT4tf/IFpk6B6Aczlby4uO0dVQHvfL9euKMR0rfUA==
X-Received: by 2002:a05:6870:b52b:b0:1c8:b82b:cbdb with SMTP id v43-20020a056870b52b00b001c8b82bcbdbmr1854244oap.33.1692336258991;
        Thu, 17 Aug 2023 22:24:18 -0700 (PDT)
Received: from ?IPV6:2401:fa00:8f:203:4e9f:532f:e004:aaa1? ([2401:fa00:8f:203:4e9f:532f:e004:aaa1])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902c24400b001bf10059251sm703867plg.239.2023.08.17.22.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 22:24:18 -0700 (PDT)
Message-ID: <0dadd751-1546-170f-3693-7087ba6ab262@chromium.org>
Date:   Fri, 18 Aug 2023 14:24:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 5/6] drm/vkms: Support enabling ConfigFS devices
To:     Marius Vlad <marius.vlad@collabora.com>,
        Jim Shargo <jshargo@chromium.org>
Cc:     Haneen Mohammed <hamohammed.sa@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Melissa Wen <melissa.srw@gmail.com>, mairacanal@riseup.net,
        dri-devel@lists.freedesktop.org
References: <20230623222353.97283-1-jshargo@chromium.org>
 <20230623222353.97283-6-jshargo@chromium.org> <ZNuFU3VbiKhZTIWk@xpredator>
Content-Language: en-US
From:   Brandon Ross Pollack <brpol@chromium.org>
In-Reply-To: <ZNuFU3VbiKhZTIWk@xpredator>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 8/15/23 23:01, Marius Vlad wrote:
> Hi,
>
> See below some minor comments:
>
> On Fri, Jun 23, 2023 at 06:23:47PM -0400, Jim Shargo wrote:
>> VKMS now supports creating and using virtual devices!
>>
>> In addition to the enabling logic, this commit also prevents users from
>> adding new objects once a card is registered.
>>
>> Signed-off-by: Jim Shargo <jshargo@chromium.org>
>> ---
>>   drivers/gpu/drm/vkms/vkms_configfs.c |  37 +++--
>>   drivers/gpu/drm/vkms/vkms_crtc.c     |   4 +-
>>   drivers/gpu/drm/vkms/vkms_drv.c      |   3 +-
>>   drivers/gpu/drm/vkms/vkms_drv.h      |   2 +-
>>   drivers/gpu/drm/vkms/vkms_output.c   | 201 +++++++++++++++++++++++----
>>   5 files changed, 202 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
>> index 544024735d19..f5eed6d23dcd 100644
>> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
>> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
>> @@ -504,29 +504,40 @@ static ssize_t device_enabled_store(struct config_item *item, const char *buf,
>>   {
>>   	struct vkms_configfs *configfs = item_to_configfs(item);
>>   	struct vkms_device *device;
>> -	int value, ret;
>> +	int enabled, ret;
>>   
>> -	ret = kstrtoint(buf, 0, &value);
>> +	ret = kstrtoint(buf, 0, &enabled);
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (value != 1)
>> -		return -EINVAL;
>> -
>> -	mutex_lock(&configfs->lock);
>> -
>> -	if (configfs->vkms_device) {
>> +	if (enabled == 0) {
>> +		mutex_lock(&configfs->lock);
>> +		if (configfs->vkms_device) {
>> +			vkms_remove_device(configfs->vkms_device);
>> +			configfs->vkms_device = NULL;
>> +		}
>>   		mutex_unlock(&configfs->lock);
>> +
>>   		return len;
>>   	}
>>   
>> -	device = vkms_add_device(configfs);
>> -	mutex_unlock(&configfs->lock);
>> +	if (enabled == 1) {
>> +		mutex_lock(&configfs->lock);
>> +		if (!configfs->vkms_device) {
>> +			device = vkms_add_device(configfs);
>> +			if (IS_ERR(device)) {
>> +				mutex_unlock(&configfs->lock);
>> +				return -PTR_ERR(device);
>> +			}
>> +
>> +			configfs->vkms_device = device;
>> +		}
>> +		mutex_unlock(&configfs->lock);
>>   
>> -	if (IS_ERR(device))
>> -		return -PTR_ERR(device);
>> +		return len;
>> +	}
>>   
>> -	return len;
>> +	return -EINVAL;
>>   }
>>   
>>   CONFIGFS_ATTR(device_, enabled);
>> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
>> index d91e49c53adc..5ebb5264f6ef 100644
>> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
>> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
>> @@ -278,7 +278,7 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
>>   
>>   struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>>   				 struct drm_plane *primary,
>> -				 struct drm_plane *cursor)
>> +				 struct drm_plane *cursor, const char *name)
>>   {
>>   	struct drm_device *dev = &vkmsdev->drm;
>>   	struct vkms_crtc *vkms_crtc;
>> @@ -290,7 +290,7 @@ struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>>   	vkms_crtc = &vkmsdev->output.crtcs[vkmsdev->output.num_crtcs++];
>>   
>>   	ret = drmm_crtc_init_with_planes(dev, &vkms_crtc->base, primary, cursor,
>> -					 &vkms_crtc_funcs, NULL);
>> +					 &vkms_crtc_funcs, name);
>>   	if (ret) {
>>   		DRM_ERROR("Failed to init CRTC\n");
>>   		goto out_error;
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
>> index 1b5b7143792f..314a04659c5f 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>> @@ -210,7 +210,7 @@ static int vkms_platform_probe(struct platform_device *pdev)
>>   	ret = drm_dev_register(&vkms_device->drm, 0);
>>   	if (ret) {
>>   		DRM_ERROR("Unable to register device with id %d\n", pdev->id);
>> -		return ret;
>> +		goto out_release_group;
>>   	}
>>   
>>   	drm_fbdev_generic_setup(&vkms_device->drm, 0);
>> @@ -256,6 +256,7 @@ struct vkms_device *vkms_add_device(struct vkms_configfs *configfs)
>>   			dev, &vkms_platform_driver.driver))) {
>>   		pdev = to_platform_device(dev);
>>   		max_id = max(max_id, pdev->id);
>> +		put_device(dev);
>>   	}
>>   
>>   	pdev = platform_device_register_data(NULL, DRIVER_NAME, max_id + 1,
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>> index 3634eeeb4548..3d592d085f49 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -239,7 +239,7 @@ void vkms_remove_device(struct vkms_device *vkms_device);
>>   /* CRTC */
>>   struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>>   				 struct drm_plane *primary,
>> -				 struct drm_plane *cursor);
>> +				 struct drm_plane *cursor, const char *name);
>>   
>>   int vkms_output_init(struct vkms_device *vkmsdev);
>>   int vkms_output_init_default(struct vkms_device *vkmsdev);
>> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
>> index c9e6c653de19..806ff01954ad 100644
>> --- a/drivers/gpu/drm/vkms/vkms_output.c
>> +++ b/drivers/gpu/drm/vkms/vkms_output.c
>> @@ -2,8 +2,10 @@
>>   
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_connector.h>
>> +#include <drm/drm_crtc.h>
>>   #include <drm/drm_edid.h>
>>   #include <drm/drm_encoder.h>
>> +#include <drm/drm_plane.h>
>>   #include <drm/drm_probe_helper.h>
>>   #include <drm/drm_simple_kms_helper.h>
>>   
>> @@ -82,7 +84,6 @@ static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device)
>>   
>>   int vkms_output_init_default(struct vkms_device *vkmsdev)
>>   {
>> -	struct vkms_output *output = &vkmsdev->output;
>>   	struct drm_device *dev = &vkmsdev->drm;
>>   	struct drm_connector *connector;
>>   	struct drm_encoder *encoder;
>> @@ -101,8 +102,7 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
>>   			struct vkms_plane *overlay = vkms_plane_init(
>>   				vkmsdev, DRM_PLANE_TYPE_OVERLAY);
>>   			if (IS_ERR(overlay)) {
>> -				ret = PTR_ERR(overlay);
>> -				goto err_planes;
>> +				return PTR_ERR(overlay);
>>   			}
>>   		}
>>   	}
>> @@ -110,17 +110,16 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
>>   	if (vkmsdev->config.cursor) {
>>   		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
>>   		if (IS_ERR(cursor)) {
>> -			ret = PTR_ERR(cursor);
>> -			goto err_planes;
>> +			return PTR_ERR(cursor);
>>   		}
>>   	}
>>   
>>   	vkms_crtc = vkms_crtc_init(vkmsdev, &primary->base,
>> -				   cursor ? &cursor->base : NULL);
>> +				   cursor ? &cursor->base : NULL,
>> +				   "crtc-default");
>>   	if (IS_ERR(vkms_crtc)) {
>>   		DRM_ERROR("Failed to init crtc\n");
>> -		ret = PTR_ERR(vkms_crtc);
>> -		goto err_planes;
>> +		return PTR_ERR(vkms_crtc);
>>   	}
>>   
>>   	for (int i = 0; i < vkmsdev->output.num_planes; i++) {
>> @@ -131,22 +130,20 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
>>   	connector = vkms_connector_init(vkmsdev);
>>   	if (IS_ERR(connector)) {
>>   		DRM_ERROR("Failed to init connector\n");
>> -		ret = PTR_ERR(connector);
>> -		goto err_connector;
>> +		return PTR_ERR(connector);
>>   	}
>>   
>>   	encoder = vkms_encoder_init(vkmsdev);
>>   	if (IS_ERR(encoder)) {
>>   		DRM_ERROR("Failed to init encoder\n");
>> -		ret = PTR_ERR(encoder);
>> -		goto err_encoder;
>> +		return PTR_ERR(encoder);
>>   	}
>>   	encoder->possible_crtcs |= drm_crtc_mask(&vkms_crtc->base);
>>   
>>   	ret = drm_connector_attach_encoder(connector, encoder);
>>   	if (ret) {
>>   		DRM_ERROR("Failed to attach connector to encoder\n");
>> -		goto err_attach;
>> +		return ret;
>>   	}
>>   
>>   	if (vkmsdev->config.writeback) {
>> @@ -158,27 +155,175 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
>>   	drm_mode_config_reset(dev);
>>   
>>   	return 0;
>> +}
>>   
>> -err_attach:
>> -	drm_encoder_cleanup(encoder);
>> +static bool is_object_linked(struct vkms_config_links *links, unsigned long idx)
>> +{
>> +	return links->linked_object_bitmap & (1 << idx);
>> +}
>>   
>> -err_encoder:
>> -	drm_connector_cleanup(connector);
>> +int vkms_output_init(struct vkms_device *vkmsdev)
>> +{
>> +	struct drm_device *dev = &vkmsdev->drm;
>> +	struct vkms_configfs *configfs = vkmsdev->configfs;
>> +	struct vkms_output *output = &vkmsdev->output;
>> +	struct plane_map {
>> +		struct vkms_config_plane *config_plane;
>> +		struct vkms_plane *plane;
>> +	} plane_map[VKMS_MAX_PLANES] = { 0 };
>> +	struct encoder_map {
>> +		struct vkms_config_encoder *config_encoder;
>> +		struct drm_encoder *encoder;
>> +	} encoder_map[VKMS_MAX_OUTPUT_OBJECTS] = { 0 };
>> +	struct config_item *item;
>> +	int map_idx = 0;
>> +
>> +	list_for_each_entry(item, &configfs->planes_group.cg_children,
>> +			    ci_entry) {
>> +		struct vkms_config_plane *config_plane =
>> +			item_to_config_plane(item);
>> +		struct vkms_plane *plane =
>> +			vkms_plane_init(vkmsdev, config_plane->type);
>> +
>> +		if (IS_ERR(plane)) {
>> +			DRM_ERROR("Unable to init plane from config: %s",
>> +				  item->ci_name);
>> +			return PTR_ERR(plane);
>> +		}
>>   
>> -err_connector:
>> -	drm_crtc_cleanup(&vkms_crtc->base);
>> +		plane_map[map_idx].config_plane = config_plane;
>> +		plane_map[map_idx].plane = plane;
>> +		map_idx += 1;
>> +	}
>>   
>> -err_planes:
>> -	for (int i = 0; i < output->num_planes; i++) {
>> -		drm_plane_cleanup(&output->planes[i].base);
>> +	map_idx = 0;
>> +	list_for_each_entry(item, &configfs->encoders_group.cg_children,
>> +			    ci_entry) {
>> +		struct vkms_config_encoder *config_encoder =
>> +			item_to_config_encoder(item);
>> +		struct drm_encoder *encoder = vkms_encoder_init(vkmsdev);
>> +
>> +		if (IS_ERR(encoder)) {
>> +			DRM_ERROR("Failed to init config encoder: %s",
>> +				  item->ci_name);
>> +			return PTR_ERR(encoder);
>> +		}
>> +		encoder_map[map_idx].config_encoder = config_encoder;
> A two connector configuration without an encoder would have the
> potential of blowing up if we don't create a second_encoder.

What a catch!!! I tested this and sure enough BOOM!

Switched to limiting based on output->num_encoders as it should be.

>> +		encoder_map[map_idx].encoder = encoder;
>> +		map_idx += 1;
>>   	}
>>   
>> -	memset(output, 0, sizeof(*output));
>> +	list_for_each_entry(item, &configfs->connectors_group.cg_children,
>> +			    ci_entry) {
>> +		struct vkms_config_connector *config_connector =
>> +			item_to_config_connector(item);
>> +		struct drm_connector *connector = vkms_connector_init(vkmsdev);
>>   
>> -	return ret;
>> -}
>> +		if (IS_ERR(connector)) {
>> +			DRM_ERROR("Failed to init connector from config: %s",
>> +				  item->ci_name);
>> +			return PTR_ERR(connector);
>> +		}
>>   
>> -int vkms_output_init(struct vkms_device *vkmsdev)
>> -{
>> -	return -ENOTSUPP;
>> +		for (int j = 0; j < output->num_connectors; j++) {
>> +			struct encoder_map *encoder = &encoder_map[j];
>> +
>> +			if (is_object_linked(
>> +				    &config_connector->possible_encoders,
>> +				    encoder->config_encoder
>> +					    ->encoder_config_idx)) {
> Here encoder->config_encoder for two connectors but a single encoder
> will give back a empty encoder.
>> +				drm_connector_attach_encoder(connector,
>> +							     encoder->encoder);
>> +			}
>> +		}
>> +	}
>> +
>> +	list_for_each_entry(item, &configfs->crtcs_group.cg_children,
>> +			    ci_entry) {
>> +		struct vkms_config_crtc *config_crtc =
>> +			item_to_config_crtc(item);
>> +		struct vkms_crtc *vkms_crtc;
>> +		struct drm_plane *primary = NULL, *cursor = NULL;
>> +
>> +		for (int j = 0; j < output->num_planes; j++) {
>> +			struct plane_map *plane_entry = &plane_map[j];
>> +			struct drm_plane *plane = &plane_entry->plane->base;
>> +
>> +			if (!is_object_linked(
>> +				    &plane_entry->config_plane->possible_crtcs,
>> +				    config_crtc->crtc_config_idx)) {
>> +				continue;
>> +			}
>> +
>> +			if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
>> +				if (primary) {
>> +					DRM_WARN(
>> +						"Too many primary planes found for crtc %s.",
>> +						item->ci_name);
>> +					return EINVAL;
>> +				}
>> +				primary = plane;
>> +			} else if (plane->type == DRM_PLANE_TYPE_CURSOR) {
>> +				if (cursor) {
>> +					DRM_WARN(
>> +						"Too many cursor planes found for crtc %s.",
>> +						item->ci_name);
>> +					return EINVAL;
>> +				}
>> +				cursor = plane;
>> +			}
>> +		}
>> +
>> +		if (!primary) {
>> +			DRM_WARN("No primary plane configured for crtc %s",
>> +				 item->ci_name);
>> +			return EINVAL;
>> +		}
>> +
>> +		vkms_crtc =
>> +			vkms_crtc_init(vkmsdev, primary, cursor, item->ci_name);
>> +		if (IS_ERR(vkms_crtc)) {
>> +			DRM_WARN("Unable to init crtc from config: %s",
>> +				 item->ci_name);
>> +			return PTR_ERR(vkms_crtc);
>> +		}
>> +
>> +		for (int j = 0; j < output->num_planes; j++) {
>> +			struct plane_map *plane_entry = &plane_map[j];
>> +
>> +			if (!plane_entry->plane)
>> +				break;
>> +
>> +			if (is_object_linked(
>> +				    &plane_entry->config_plane->possible_crtcs,
>> +				    config_crtc->crtc_config_idx)) {
>> +				plane_entry->plane->base.possible_crtcs |=
>> +					drm_crtc_mask(&vkms_crtc->base);
>> +			}
>> +		}
>> +
>> +		for (int j = 0; j < output->num_encoders; j++) {
>> +			struct encoder_map *encoder_entry = &encoder_map[j];
>> +
>> +			if (is_object_linked(&encoder_entry->config_encoder
>> +						      ->possible_crtcs,
>> +					     config_crtc->crtc_config_idx)) {
>> +				encoder_entry->encoder->possible_crtcs |=
>> +					drm_crtc_mask(&vkms_crtc->base);
>> +			}
>> +		}
>> +
>> +		if (vkmsdev->config.writeback) {
>> +			int ret = vkms_enable_writeback_connector(vkmsdev,
>> +								  vkms_crtc);
>> +			if (ret)
>> +				DRM_WARN(
>> +					"Failed to init writeback connector for config crtc: %s. Error code %d",
>> +					item->ci_name, ret);
>> +		}
>> +	}
> I think we might be needing here a test for missing symlinks - invalid
> configurations, like unused crtcs, encoders, connectors. I
> suppose anything that's not matched with is_object_linked(),
> such we avoid invalid configuration found by drm_mode_config_validate()
> and inform users about missing them.
>
> An example here would be to create a second encoder, connector, crtc and
> not symlink them to their possible_encoders,possible_crtcs mask. An
> i-g-t test for this very thing would be needed to stress different kind
> of combinations.

I wonder about this.  Shouldn't a user be free to create dangling files 
to simulate some scenario?

I could see a further development to publish a warning in the log, but 
disallowing it seems overly restrictive.

Either way we could accomplish this pretty easily by adding a flag to 
each vkms object in the form of `bool is_linked` and set it when we 
detect it's linked.  Then at the end iterate through all planes, 
encoders, connectors, crtcs that can be linked and if they are not just 
publish a warning saying

kwarn: "crtc/plane/encoder $NAME is created but unlinked"

IGT tests to test that that was done make sense to me.

>> +
>> +	drm_mode_config_reset(dev);
>> +
>> +	return 0;
>>   }
>> -- 
>> 2.41.0.162.gfafddb0af9-goog
>>
