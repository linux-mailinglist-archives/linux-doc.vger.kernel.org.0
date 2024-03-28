Return-Path: <linux-doc+bounces-12518-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E29E8862BF
	for <lists+linux-doc@lfdr.de>; Thu, 21 Mar 2024 22:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 701851C21C65
	for <lists+linux-doc@lfdr.de>; Thu, 21 Mar 2024 21:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053C0136650;
	Thu, 21 Mar 2024 21:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PlqQ1VCd"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE6F136657
	for <linux-doc@vger.kernel.org>; Thu, 21 Mar 2024 21:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711058002; cv=none; b=uck9Xq9xUXAfN7l09hYtplBaIkmBAKN9AdTw/1SQ24g84INqbkEUboMQVJbCS3MXTUvUJuVJLEs9pBbn0HSfQcRijMDezGGhbjimob/U1IUjEyjOviSTLnnNEcKGWKQkn4DDWi6m6/TdmK+z49HLHz4lhKnClRdFxgmkO5B3K0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711058002; c=relaxed/simple;
	bh=WcvvS3OEkLFjYszouDsgraWVfjBu7sarLCU390aYOas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPeHfuSlNJj9h5k2MrPhZKIS3MZlhxXnFS8dGIU0jSoLUSWDPUD3STmiqGXJvxRL6hKpIcN4DWd3QmKBisZNrYZYzHQV97eol6hpYcuyXEiP5VRd/REoiYPDHVAGPxMteIhP0RFsLns+hqbMwsRUfAHq5qOTKXPtDbjtChQgZew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PlqQ1VCd; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1711057998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U9xIbt5IRGyj4Yh6zUnaudYx8WQHO3ZjhO4k+FGux7M=;
	b=PlqQ1VCdMmQb7CMTnF3ueOxvUYjQ2qNPWK23J+ZUf5kHQCWRjNcVhSKum6isUXV0J+FTi5
	n/eN/oYuBh7sHBT/nWyYjuxY7t7NP5XlalCvGwwHoPYgw3boDPE9z69TpfaZgmdYBUcs5x
	JkugC/OTPO2xUvTJTEevnUtGTAxfKcc=
Date: Fri, 22 Mar 2024 05:53:07 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v10,20/27] drm/connector: hdmi: Add Infoframes generation
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2024/3/21 23:29, Maxime Ripard wrote:
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
>   drivers/gpu/drm/Kconfig                            |   1 +
>   drivers/gpu/drm/drm_atomic_state_helper.c          | 338 +++++++++++++++++++++
>   drivers/gpu/drm/drm_connector.c                    |  14 +
>   .../gpu/drm/tests/drm_atomic_state_helper_test.c   |   1 +
>   drivers/gpu/drm/tests/drm_connector_test.c         |  12 +
>   include/drm/drm_atomic_state_helper.h              |   8 +
>   include/drm/drm_connector.h                        | 109 +++++++
>   7 files changed, 483 insertions(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 16029435b750..3d3193c7aa5f 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -97,10 +97,11 @@ config DRM_KUNIT_TEST
>   	  If in doubt, say "N".
>   
>   config DRM_KMS_HELPER
>   	tristate
>   	depends on DRM
> +	select DRM_DISPLAY_HDMI_HELPER

Should we select DRM_DISPLAY_HELPER here? Otherwise there will have some compile error
emerged with default config.


: drivers/gpu/drm/drm_atomic_state_helper.o: in function `drm_atomic_helper_connector_hdmi_check':
drm_atomic_state_helper.c:(.text+0x15e4): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
: drm_atomic_state_helper.c:(.text+0x15f0): undefined reference to `drm_hdmi_avi_infoframe_bars'
: drm_atomic_state_helper.c:(.text+0x1638): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'
make[2]: *** [scripts/Makefile.vmlinux:37: vmlinux] Error 1

make[1]: *** [/home/suijingfeng/UpStream/drm-tip/Makefile:1162: vmlinux] Error 2

make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:240: __sub-make] Error 2

>   	help
>   	  CRTC helpers for KMS drivers.
>   
>   config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>           bool "Enable refcount backtrace history in the DP MST helpers"

-- 
Best regards,
Sui


