Return-Path: <linux-doc+bounces-42203-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A23A7BA44
	for <lists+linux-doc@lfdr.de>; Fri,  4 Apr 2025 11:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8936189BC5D
	for <lists+linux-doc@lfdr.de>; Fri,  4 Apr 2025 09:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BE51BD03F;
	Fri,  4 Apr 2025 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSUiO4NR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214201A5BB6
	for <linux-doc@vger.kernel.org>; Fri,  4 Apr 2025 09:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743760458; cv=none; b=ZZsF9hS2epG1t5FH/Xw9lEkV8VNwWage40QckS+xuxPnYUwGzSm7T4jifmVj0WjmW72kHRZjkDR4c14BHKCmrF7evBRETL6c2yQwhvgxlQ/GSY4nzosi9jbVGOB9z4+R2w2aUwEdq/fwwqHGWDggB16aeDpUYZ0XzZfNnNIPWXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743760458; c=relaxed/simple;
	bh=hNeF7z0PXm+fZ7v87K6B50kIrzIayzQQzo6kuSxs2hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhK8cp18NG4XNN6KlQH4YNnYinJ+KQhzkLN2DGmbKX5hm0IXIgWoTXvKZH7V+3R8egZbbHxowFR67/hKacTg6G4HZyQrtTgzSYXQtMMq8xnizRu5H3qC4Sj9YM6QYdQPGFP+nAtfMsIX37SLV7TmPXFZRRfYsua3/2D+m6nvE+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSUiO4NR; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so242392766b.0
        for <linux-doc@vger.kernel.org>; Fri, 04 Apr 2025 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743760453; x=1744365253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kYAlHXEplBZR8C+Nf50IvIJmhOSpOhaYvMLYZLbAtKw=;
        b=PSUiO4NRJ7BCL0mL0p8SghQIM+pQNmuV+iah/Hy03TDHKCYzo1v81v6VsIbkNXjQ0W
         OiX+DzmB7vSvZV8M3a5btnnym/02igUBTmAdq7J3ghGuqgzSazAMCAkNtJrRu67xuIhO
         cldE6KnKKsw0ubqsqG12NiTY/OBIpQ7bx8HB1BQor/8LjeZzfltGmF8Hxsnw47h7vqJg
         OvBaf5OtAweU98FE8h41o4PjR/kni+OWNwbY4aIkHqK4m3yNdmtqvM3q8kv15SKh9Fuy
         DLdM/Uhq0pcH50AWd3DrlXuJs345e85iXp2EUnq4qkqN1lDf9k4TlyHfMULoWP2MF2sY
         QZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743760453; x=1744365253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYAlHXEplBZR8C+Nf50IvIJmhOSpOhaYvMLYZLbAtKw=;
        b=YhVnF/BMCc+nyxz8J015tuisWzLn0XiuSjlJclAZtX6WVQVzDGhkyBgCT9Hjax5U42
         jFZj3RWkLvvh/+BrjgQcK/C0tEE/9EQOAnmXY+nUWSqW23kUxaXE3r4LyOlSuC3gtLfb
         PaNV/jv9eC/lnOVBS0FNZnvQhLPudeKqqKTNgKKzU69fVXGJd/MMFi3uAtQjH01gLqGf
         JzIZheR8Ca0ZvdKBIxmNoawjpTybm8KSuXMZx1YOZZ1sWguvEJt0mfE8NUiay22NYiNu
         cjx+0w5TdgjSUmmRi9KRgupENPma2pbyYDEXyltKTrHQ/VYWCI7IU20tokpJP37kMrS/
         B8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8OxL5vvm897fs4aaySp6XEVyeZjygdap5ZYwfZJlcInq3QNqBgJ6WuihO8xqM9B8XbzCq8GCT3So=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+wv+OKfvLR7iU0W4orJgegOp5FMOa7NTmMF13rU69gjvUZgJh
	dF6KR1XpIiDu5ZHc9NBltnBiPhkk6NNRwv/Rtq9pc4KW77pGsll3ULK2UEWuqTs=
X-Gm-Gg: ASbGncv4Kn4tRqO2ukNI/RmUskvnIVWHsfPtu+zJuElbyAqMQEhEEnAQixwOxGt/pKe
	g+tppI8Hq+rJEKscTHerWTxSqoPdi+L/TINxHtaAslfQMEdMPMT8O5jx14Sug2ZeHK/gIzeH+vG
	bqhQb8JOjyo5pBcXdC/BW0nEjejJsMfAb3qwC5VgCSXt8TBu2kAfIFZPE8oeVboJ1r8c3Ir2CVX
	is7oTFgge9l2zLxkLatxyyUjhfVi1hxkBiqcZ7GIt1Zu9ZasCRg1mWrxXDrp80RCIMaeX5yMTQv
	ktMQN002mjogpd9DOSqPqLn0drVfCTS0KiDcdLt/F6xHENxncUAC6L4b
X-Google-Smtp-Source: AGHT+IHVK1xPFjgUlctqGoP+C/6wMdr/sOeO1yGK5ebaeEn+PcqQk/KtPy0g6bA4aI5FsjIRW2rTCA==
X-Received: by 2002:a17:907:6d29:b0:ac1:f19a:c0a0 with SMTP id a640c23a62f3a-ac7d177475emr226973866b.20.1743760453343;
        Fri, 04 Apr 2025 02:54:13 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:e124:1321:48a4:8c63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f651sm224335566b.123.2025.04.04.02.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:54:12 -0700 (PDT)
Date: Fri, 4 Apr 2025 11:54:10 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v37 24/31] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
Message-ID: <Z--sQj-fXwXkk5iS@linaro.org>
References: <20250404002728.3590501-1-quic_wcheng@quicinc.com>
 <20250404002728.3590501-25-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404002728.3590501-25-quic_wcheng@quicinc.com>

On Thu, Apr 03, 2025 at 05:27:21PM -0700, Wesley Cheng wrote:
> Create a USB BE component that will register a new USB port to the ASoC USB
> framework.  This will handle determination on if the requested audio
> profile is supported by the USB device currently selected.
> 
> Check for if the PCM format is supported during the hw_params callback.  If
> the profile is not supported then the userspace ALSA entity will receive an
> error, and can take further action.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  include/sound/q6usboffload.h  |  20 +++
>  sound/soc/qcom/Kconfig        |  12 ++
>  sound/soc/qcom/qdsp6/Makefile |   1 +
>  sound/soc/qcom/qdsp6/q6usb.c  | 278 ++++++++++++++++++++++++++++++++++
>  4 files changed, 311 insertions(+)
>  create mode 100644 include/sound/q6usboffload.h
>  create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
> 
> diff --git a/include/sound/q6usboffload.h b/include/sound/q6usboffload.h
> new file mode 100644
> index 000000000000..35ae26ba6509
> --- /dev/null
> +++ b/include/sound/q6usboffload.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * sound/q6usboffload.h -- QDSP6 USB offload
> + *
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/**
> + * struct q6usb_offload - USB backend DAI link offload parameters
> + * @dev: dev handle to usb be
> + * @domain: allocated iommu domain
> + * @sid: streamID for iommu
> + * @intr_num: usb interrupter number
> + **/
> +struct q6usb_offload {
> +	struct device *dev;
> +	struct iommu_domain *domain;
> +	long long sid;

"long long" feels like overkill for sid, given that it's essentially
either an u8 or -1. I see you just copied this from q6asm-dai.c, but
unlike q6asm-dai, you don't seem to check for sid < 0 in PATCH 28/31
(qc_audio_offload.c).

Looking at the logic in q6asm-dai.c, it feels like this could really
just be an "u8", since the -1 for "no iommus specified" is effectively
just handled like sid = 0.

> +	u16 intr_num;
> +};
> [...]
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> new file mode 100644
> index 000000000000..cb8c4a62a816
> --- /dev/null
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> [...]
> +static int q6usb_dai_dev_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct q6usb_port_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct of_phandle_args args;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u16(node, "qcom,usb-audio-intr-idx",
> +				   &data->priv.intr_num);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to read intr idx.\n");
> +		return ret;
> +	}
> +
> +	ret = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
> +	if (ret < 0)
> +		data->priv.sid = -1;
> +	else

Could just do if (ret == 0) here and drop the if branch above, if you
make sid an u8 like I suggested above.

> +		data->priv.sid = args.args[0] & Q6_USB_SID_MASK;
> +
> +	data->priv.domain = iommu_get_domain_for_dev(&pdev->dev);
> +
> +	data->priv.dev = dev;
> +	INIT_LIST_HEAD(&data->devices);

I think you also need devm_mutex_init(&data->lock) or separate
mutex_init()/mutex_destroy() here, if someone enables
CONFIG_DEBUG_MUTEXES.

Thanks,
Stephan

