Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC0F73D2CF
	for <lists+linux-doc@lfdr.de>; Sun, 25 Jun 2023 20:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjFYSEO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 25 Jun 2023 14:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjFYSEO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Jun 2023 14:04:14 -0400
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDAA1B9;
        Sun, 25 Jun 2023 11:04:12 -0700 (PDT)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mx1.riseup.net (Postfix) with ESMTPS id 4QpzPl6CHTzDrNy;
        Sun, 25 Jun 2023 18:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1687716252; bh=3cOd9Tulf+RLZ2R/lGuVfEdERy8xqZ4HHWjkWZv3FAs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lXentHTOo29YwgA/Q5WAgBBEUsl5DTqsmOJd4wsjxBgZocgZ/PG9hmyBm6a2IjvcQ
         jSPI26UWubdYOe7kngWhcU0/oO570ofVUyrxiNgiJQfcscdp5bpwrskBKK4yXdJc0q
         2YM4+n0xeBBSr2pFLMDwbOsLDvaGUK77nSPcbPXQ=
X-Riseup-User-ID: 7EBE90DED2258EE1CA830B796CBA05FD63338D890F31F4C1BCCCB27A6DA77A56
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4QpzPg4YpbzJntB;
        Sun, 25 Jun 2023 18:04:07 +0000 (UTC)
Message-ID: <64c40359-d0ee-5070-2a52-033c7e655e0a@riseup.net>
Date:   Sun, 25 Jun 2023 15:04:05 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 6/6] drm/vkms: Add a module param to enable/disable the
 default device
Content-Language: en-US
To:     Jim Shargo <jshargo@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Melissa Wen <melissa.srw@gmail.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230623222353.97283-1-jshargo@chromium.org>
 <20230623222353.97283-7-jshargo@chromium.org>
From:   Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230623222353.97283-7-jshargo@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jim,

On 6/23/23 19:23, Jim Shargo wrote:
> In many testing circumstances, we will want to just create a new device
> and test against that. If we create a default device, it can be annoying
> to have to manually select the new device instead of choosing the only
> one that exists.
> 
> The param, enable_default, is defaulted to true to maintain backwards
> compatibility.
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> ---
>   drivers/gpu/drm/vkms/vkms_drv.c | 44 ++++++++++++++++++++++-----------
>   1 file changed, 29 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 314a04659c5f..1cb56c090a65 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -42,17 +42,26 @@
>   #define DRIVER_MAJOR	1
>   #define DRIVER_MINOR	0
>   
> +static bool enable_default_device = true;
> +module_param_named(enable_default_device, enable_default_device, bool, 0444);
> +MODULE_PARM_DESC(enable_default_device,
> +		 "Enable/Disable creating the default device");

Wouldn't be better to just call it "enable_default"?

Also, could you add this parameter to vkms_config debugfs file?

Best Regards,
- Maíra

> +
>   static bool enable_cursor = true;
>   module_param_named(enable_cursor, enable_cursor, bool, 0444);
> -MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
> +MODULE_PARM_DESC(enable_cursor,
> +		 "Enable/Disable cursor support for the default device");
>   
>   static bool enable_writeback = true;
>   module_param_named(enable_writeback, enable_writeback, bool, 0444);
> -MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector support");
> +MODULE_PARM_DESC(
> +	enable_writeback,
> +	"Enable/Disable writeback connector support for the default device");
>   
>   static bool enable_overlay;
>   module_param_named(enable_overlay, enable_overlay, bool, 0444);
> -MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
> +MODULE_PARM_DESC(enable_overlay,
> +		 "Enable/Disable overlay support for the default device");
>   
>   DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>   
> @@ -278,10 +287,7 @@ void vkms_remove_device(struct vkms_device *vkms_device)
>   static int __init vkms_init(void)
>   {
>   	int ret;
> -	struct platform_device *pdev;
> -	struct vkms_device_setup vkms_device_setup = {
> -		.configfs = NULL,
> -	};
> +	struct platform_device *default_pdev = NULL;
>   
>   	ret = platform_driver_register(&vkms_platform_driver);
>   	if (ret) {
> @@ -289,19 +295,27 @@ static int __init vkms_init(void)
>   		return ret;
>   	}
>   
> -	pdev = platform_device_register_data(NULL, DRIVER_NAME, 0,
> -					     &vkms_device_setup,
> -					     sizeof(vkms_device_setup));
> -	if (IS_ERR(pdev)) {
> -		DRM_ERROR("Unable to register default vkms device\n");
> -		platform_driver_unregister(&vkms_platform_driver);
> -		return PTR_ERR(pdev);
> +	if (enable_default_device) {
> +		struct vkms_device_setup vkms_device_setup = {
> +			.configfs = NULL,
> +		};
> +
> +		default_pdev = platform_device_register_data(
> +			NULL, DRIVER_NAME, 0, &vkms_device_setup,
> +			sizeof(vkms_device_setup));
> +		if (IS_ERR(default_pdev)) {
> +			DRM_ERROR("Unable to register default vkms device\n");
> +			platform_driver_unregister(&vkms_platform_driver);
> +			return PTR_ERR(default_pdev);
> +		}
>   	}
>   
>   	ret = vkms_init_configfs();
>   	if (ret) {
>   		DRM_ERROR("Unable to initialize configfs\n");
> -		platform_device_unregister(pdev);
> +		if (default_pdev)
> +			platform_device_unregister(default_pdev);
> +
>   		platform_driver_unregister(&vkms_platform_driver);
>   	}
>   
