Return-Path: <linux-doc+bounces-38301-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC96A37EB1
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 10:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 938A3161FE0
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 09:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D221F2153DE;
	Mon, 17 Feb 2025 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KVtPD/YN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14BF21519F
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784952; cv=none; b=ChiGJ4LAOOovBx9JRSOs2TKQU8oS4Z5mal03pqhId+frzZJ1FezdCIA42vULPovsQbJfckd9s8Yhsydq9hPpQkIP+yxrSDWzZ3R87nbVAwH+meJBSZTeSM7sNAgsfOV1eRuXisW1VvEXnfMMiehsVi0mxptUn6jecFh87y6C+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784952; c=relaxed/simple;
	bh=JTI+nXaNVcWoaa6VtHM2Ui/wbUmlIKJDUru+uibjB9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCcNA/SRKmRJe9qE1pE1/Ekbe1MAJ4zvUW4LnRIJ8n9Fhs1wPCj52wiybUCpExb/mKWx0+oSlteTZr46WPkOcbHFQYFXJGvGmX7BND1es72o7zW25WPnm4DHRgEt/feQiHe4IWmW7Pn3ODJYmkLvf7IpndzZqlpiIE7EO2KfmNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KVtPD/YN; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abb7a6ee2deso234289466b.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 01:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739784949; x=1740389749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XwnXWIR7yWtk2UMxmi/Y1HFxh5rFGAzJa074zoBARm4=;
        b=KVtPD/YNS/zVrFhXIldANdwa+7t1UxBt7jQ5cDch+4z/3Nfh3ZqhGhXOjaCa0OUPM+
         G/glpjLrR8dxPUpO+Q83Ok/S2leRme4aBjTqGAz/ch6cSidwEnWNiM7hr2nj0H/I7Crn
         y0zLlKgMt2gvE5TTBf0TG/iSANhz7gomm98byHIrUox1sUJBbaHW96nR6Gia03UqlIJx
         wSCGoSMK4cq6NMWkR2n7LTOgDSFWwKh7UOz0A4Y7d37BS2r1KtsPH9rbcK2fykbwQQjZ
         3xwBMLbxU4lI5ToHKbQ1kgrETUItaTmDLoUFbubN+gSsVJgmEqPOt5AEXYB9R26KoVdW
         XHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739784949; x=1740389749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwnXWIR7yWtk2UMxmi/Y1HFxh5rFGAzJa074zoBARm4=;
        b=aOOhYI9woxvVWb2DnmCVPTG8FzQwySvYP5X5MYQcoy4vo2xE22YbFGlV5m+FonIKbA
         oshjmjZghyDfEf7LuFrcVN1vOuV8PFKIyNhOFGBzFQzmbOEOdwZARr3aEI+zIR2BPoTk
         g9tpVEVx9d75QVZGDDT2/CmGmcss7bjgqJed2MhHADZx1vnnrymAROtyw2QDHa7ahOGY
         F5sy7uXawMJEAPfth1GSer3rpy56s72BSE3hb780QSVphkHJsQuL5Lo3o/20ewNJrdfZ
         uVwd1x1rKTf/DZhce7rh65TYsBpqhP27REJy62B0cwO7+SyKvSWRfdtH61rbEeyVtd8O
         LAlA==
X-Forwarded-Encrypted: i=1; AJvYcCWOlEoYw2Q3vxiLDFZFrTBMeU6EM3xMCiE863UaPbrNtHRKM5+mbPrL+haD8g+uW8dUHL9PqbrCoEA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/R0IjZq8v/aV9WsCR0UliXxMERzmRuRPTUqwOSm7S/oZF1hvv
	2nrniAccRVXEnvdKXPTJs1jDa3xf8DTsn29m0M3t7QPJq+EOUauFyvjaWcUtiiE=
X-Gm-Gg: ASbGncvH77+qRJ2qB8BF310HRzJsu5OKNdOTNZbSeEvVdx8HoXsbo5vVqMZ7Ec47o8Z
	e3Pk7tL9p+OnG7FxMhR6mysRRpNyd3+HYZMFphKJ27dRbBg5G+X64pA5yVFuHs9QgP6HSOx7M65
	MdGaMEKTuE6dz6qhYT7FF083Z5RIvh/QABT5/HL1UL7V3KOTCKre5Oaa69vpBvkuleFKdxfXsSg
	ki6npXiboyQWQI7Lpo8OZignAYfDG/C7tJv/5Qg98f6C9XzUl9vAWe5dTYbRhAz1ZoILResjfm3
	gW3DiE8B+QmE9ms8lEaXBAou7T0/oZBZtstcvVsc77YlSFSp26rDV8f5rw==
X-Google-Smtp-Source: AGHT+IGPu+N0KS3lXOQEYdhyiGIqpvFCM2BgrYLAGEe4LpMcMFyVdNaQDKGPYwLgyDJwrEbqrrj5cQ==
X-Received: by 2002:a17:907:72c8:b0:ab7:85e2:18bb with SMTP id a640c23a62f3a-abb7093022cmr900296366b.6.1739784949040;
        Mon, 17 Feb 2025 01:35:49 -0800 (PST)
Received: from rayden (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376abbsm861900766b.93.2025.02.17.01.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:35:48 -0800 (PST)
Date: Mon, 17 Feb 2025 10:35:46 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Sumit Garg <sumit.garg@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/8] tee: add close_context to TEE driver operation
Message-ID: <20250217093546.GA2637163@rayden>
References: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
 <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-2-297eacd0d34f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-2-297eacd0d34f@quicinc.com>

Hi,

On Sun, Feb 02, 2025 at 06:43:30PM -0800, Amirreza Zarrabi wrote:
> The tee_context can be used to manage TEE user resources, including
> those allocated by the driver for the TEE on behalf of the user.
> The release() callback is invoked only when all resources, such as
> tee_shm, are released and there are no references to the tee_context.
> 
> When a user closes the device file, the driver should notify the
> TEE to release any resources it may hold and drop the context
> references. To achieve this, a close_context() callback is
> introduced to initiate resource release in the TEE driver when
> the device file is closed.
> 
> Relocate teedev_ctx_get, teedev_ctx_put, tee_device_get, and
> tee_device_get functions to tee_drv.h to make them accessible
> outside the TEE subsystem.
> 
> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> ---
>  drivers/tee/tee_core.c    |  7 +++++++
>  drivers/tee/tee_private.h |  6 ------
>  include/linux/tee_core.h  | 11 +++++++++--
>  include/linux/tee_drv.h   |  6 ++++++
>  4 files changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 24edce4cdbaa..721522fe5c63 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -79,6 +79,7 @@ void teedev_ctx_get(struct tee_context *ctx)
>  
>  	kref_get(&ctx->refcount);
>  }
> +EXPORT_SYMBOL_GPL(teedev_ctx_get);
>  
>  static void teedev_ctx_release(struct kref *ref)
>  {
> @@ -96,11 +97,15 @@ void teedev_ctx_put(struct tee_context *ctx)
>  
>  	kref_put(&ctx->refcount, teedev_ctx_release);
>  }
> +EXPORT_SYMBOL_GPL(teedev_ctx_put);
>  
>  void teedev_close_context(struct tee_context *ctx)
>  {
>  	struct tee_device *teedev = ctx->teedev;
>  
> +	if (teedev->desc->ops->close_context)
> +		teedev->desc->ops->close_context(ctx);
> +
>  	teedev_ctx_put(ctx);
>  	tee_device_put(teedev);
>  }
> @@ -1037,6 +1042,7 @@ void tee_device_put(struct tee_device *teedev)
>  	}
>  	mutex_unlock(&teedev->mutex);
>  }
> +EXPORT_SYMBOL_GPL(tee_device_put);
>  
>  bool tee_device_get(struct tee_device *teedev)
>  {
> @@ -1049,6 +1055,7 @@ bool tee_device_get(struct tee_device *teedev)
>  	mutex_unlock(&teedev->mutex);
>  	return true;
>  }
> +EXPORT_SYMBOL_GPL(tee_device_get);
>  
>  /**
>   * tee_device_unregister() - Removes a TEE device
> diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> index 9bc50605227c..d3f40a03de36 100644
> --- a/drivers/tee/tee_private.h
> +++ b/drivers/tee/tee_private.h
> @@ -14,12 +14,6 @@
>  
>  int tee_shm_get_fd(struct tee_shm *shm);
>  
> -bool tee_device_get(struct tee_device *teedev);
> -void tee_device_put(struct tee_device *teedev);
> -
> -void teedev_ctx_get(struct tee_context *ctx);
> -void teedev_ctx_put(struct tee_context *ctx);
> -
>  struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
>  struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
>  					  unsigned long addr, size_t length);
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index a38494d6b5f4..8a4c9e30b652 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -65,8 +65,9 @@ struct tee_device {
>  /**
>   * struct tee_driver_ops - driver operations vtable
>   * @get_version:	returns version of driver
> - * @open:		called when the device file is opened
> - * @release:		release this open file
> + * @open:		called for a context when the device file is opened
> + * @close_context:	called when the device file is closed
> + * @release:		called to release the context
>   * @open_session:	open a new session
>   * @close_session:	close a session
>   * @system_session:	declare session as a system session
> @@ -76,11 +77,17 @@ struct tee_device {
>   * @supp_send:		called for supplicant to send a response
>   * @shm_register:	register shared memory buffer in TEE
>   * @shm_unregister:	unregister shared memory buffer in TEE
> + *
> + * The context given to @open might last longer than the device file if it is
> + * tied to other resources in the TEE driver. @close_context is called when the
> + * client closes the device file, even if there are existing references to the
> + * context. The TEE driver can use @close_context to start cleaning up.
>   */
>  struct tee_driver_ops {
>  	void (*get_version)(struct tee_device *teedev,
>  			    struct tee_ioctl_version_data *vers);
>  	int (*open)(struct tee_context *ctx);
> +	void (*close_context)(struct tee_context *ctx);
>  	void (*release)(struct tee_context *ctx);
>  	int (*open_session)(struct tee_context *ctx,
>  			    struct tee_ioctl_open_session_arg *arg,
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index a54c203000ed..d5f0c70ac95c 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -96,6 +96,12 @@ struct tee_param {
>  	} u;
>  };
>  
> +bool tee_device_get(struct tee_device *teedev);
> +void tee_device_put(struct tee_device *teedev);
> +
> +void teedev_ctx_get(struct tee_context *ctx);
> +void teedev_ctx_put(struct tee_context *ctx);
> +

Now that these functions are available to all the backend drivers,
please add some documentation for them so it more clear how they are
supposed to be used.

Thanks,
Jens

>  /**
>   * tee_shm_alloc_kernel_buf() - Allocate kernel shared memory for a
>   *                              particular TEE client driver
> 
> -- 
> 2.34.1
> 

