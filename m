Return-Path: <linux-doc+bounces-38303-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC8CA37F8C
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 11:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B1F37A4F4D
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 10:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49CF2163B7;
	Mon, 17 Feb 2025 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K91MX+8h"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3D18FC79
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787010; cv=none; b=BNr+aLixEuxLe9HVaM9KA6LU2OWFJt06Tv6l3SPxwbRNtyl89Suyd4E4LenKayj/ZMXJHmCUXYVRBvaAYnolR/9IS46ohsU3zb/njOGhYnI2XYbV0kBZNJ53dAeniNHA/ohSZkqBACXoAWQ4tSZisO6+R4b5e2J7ViQNiadJebg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787010; c=relaxed/simple;
	bh=j32aHlewcxZHgt72stBZMlPca6hXMaSDHk5y3S0Dhak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIrnS7urACBTcbb7MdS/OuRDIEKO4wg72OKq82im76rdRF1kPQaPq36E9j8vOw89utfViVNi/uEc/0ZAE+mCojnt1AWmxjnLIwgHq5xO/bd69qGsX+muyHmh7ksVgfxh8ktKyc2yKRjxkQnIo10Oq8u3IB9Rjd+xgTe31W2kSbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K91MX+8h; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ded368fcd9so5188287a12.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 02:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787007; x=1740391807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uv151NG0pvPS5npwfEoUptwhovQw5OQ671qB8TdfkUA=;
        b=K91MX+8h97CtNHY+J6Hcpv3TjveiWPoIsuvYHFjfbsfVFJ96KHJRxALDwc+dNlLKLv
         jwKBRNkWOSiiA1+TShr2O643K65Uy1hqW725GefzNYyTqIWpic6rb6XyAfXEpJxbAPio
         rcJiLrasiex4ZjCKyT/JHn2hCFPYcbn/iqecrHTskiukWl/OnAdsirfYbMa04/u0+Rcg
         UWOF52DAyd30QNH20klAo8T3iN/0jx9dp7qtYVH76rUrWq5WniaJYUQpGGqmDzpd3QyY
         pG/xTDbNRUR1eqfyRISVVfiTBzfjAVAV+93wdwLJd8WVZT9IEj9t59U3zvBaKUiIDiRg
         H03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787007; x=1740391807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uv151NG0pvPS5npwfEoUptwhovQw5OQ671qB8TdfkUA=;
        b=TmVfQnGsQNiOCOt2m/xL9LQj0O6wQmCpz2SvUCMyjMCsCrQgY3jhH7zSR70GIdK17b
         9rRIZtPWKL0hGxyRWp0UKdHbBSOa5KsDTXo7ic9b+MKPjIwFUkeQZNwNmzy+aEuz7PgM
         ZZsNji3ySnbdJdnp70jLiViqxNjFbnb4tx+9u/Uf8wPJm7USTyOklla4hwnMjGibQFD2
         8YjbjvsCGohxSN9gLk+zUhcZyJvuLs1lADw4TWkcrUoR4zc72HeMqyz1b13/VbCnyWbf
         NowtBWcZHorIYDXgjEo2UZoCixacmMqKwRmqXfNMGqGKp3tAuj6OY5CX5l0fH+DqicYp
         Sgiw==
X-Forwarded-Encrypted: i=1; AJvYcCW3/y6Nq4PPnq3mo8OVYBbbWOWgeKoqVuvZAxVXXxHVgafpq/6r+2zsJnjzZ2/BUnv8Ke9ajdBh0ds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj6wtvescnU2Kq9hISuudIh+CR47W+0AUW0+hcJvKv6lmlruOc
	yn60+rmiPnVyOgSO6WblCcwkk2WQokGv2TQ3z9cpI6V9z0eBVEzWpWYP93N73vk=
X-Gm-Gg: ASbGnct3U+IROdqzlfnFSc135O4cEXLmrT8/rtwPm5XpUW10ZyX1qxAGnEQGxAJXC99
	qy25wbbi+lxyg9nC6FhFnBeJthLB9sCXc0NJgedca0MMVhEP5usN7k+6HIo1A3lzJndQzK+lCaq
	rxxdgzUE44feRE0QbmwwFWCmmj2+cCchuYt70AVT5zMUawQZQlRGQ8Ov3RUu87l77f3T+54ID1a
	nNREAwCxK3wlLYNqnu+vSxMmKnMSEuvA1LA4a4SaVWpiRCWv9W2H2nRld8E4yp52KstiskjjyPw
	UCDnn0UhG2N1u675VrAq4C362Tp9g1cVTGyoTgfGFfEwgVJ3F5+36Ui8Wg==
X-Google-Smtp-Source: AGHT+IGH+62O5WSEtHOlv1+RJOf1VZEfwtFti2ZEDmplBYjZuEVlS2Rl2AjyECic5SaKbQp0V/wtzA==
X-Received: by 2002:a05:6402:5246:b0:5dc:ad49:ba1a with SMTP id 4fb4d7f45d1cf-5e035f2631bmr10793683a12.0.1739787006494;
        Mon, 17 Feb 2025 02:10:06 -0800 (PST)
Received: from rayden (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece287cebsm6971482a12.74.2025.02.17.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:10:05 -0800 (PST)
Date: Mon, 17 Feb 2025 11:10:03 +0100
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
Subject: Re: [PATCH v2 3/8] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Message-ID: <20250217101003.GB2637163@rayden>
References: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
 <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-3-297eacd0d34f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-3-297eacd0d34f@quicinc.com>

On Sun, Feb 02, 2025 at 06:43:31PM -0800, Amirreza Zarrabi wrote:
> For drivers that can transfer data to the TEE without using shared
> memory from client, it is necessary to receive the user address
> directly, bypassing any processing by the TEE subsystem. Introduce
> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
> userspace buffers.
> 
> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> ---
>  drivers/tee/tee_core.c   | 27 +++++++++++++++++++++++++++
>  include/linux/tee_drv.h  |  6 ++++++
>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
>  3 files changed, 49 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 721522fe5c63..9f4b9a995e16 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -386,6 +386,16 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>  			params[n].u.value.b = ip.b;
>  			params[n].u.value.c = ip.c;
>  			break;
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +			params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
> +			params[n].u.ubuf.size = ip.b;
> +
> +			if (!access_ok(params[n].u.ubuf.uaddr, params[n].u.ubuf.size))

This line is over 80 columns,
https://docs.kernel.org/process/coding-style.html#breaking-long-lines-and-strings

> +				return -EFAULT;
> +
> +			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> @@ -454,6 +464,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
>  			    put_user(p->u.value.c, &up->c))
>  				return -EFAULT;
>  			break;
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +			if (put_user((u64)p->u.ubuf.size, &up->b))
> +				return -EFAULT;
> +			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>  			if (put_user((u64)p->u.memref.size, &up->b))
> @@ -654,6 +669,13 @@ static int params_to_supp(struct tee_context *ctx,
>  			ip.b = p->u.value.b;
>  			ip.c = p->u.value.c;
>  			break;
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +			ip.a = (u64)p->u.ubuf.uaddr;
> +			ip.b = p->u.ubuf.size;
> +			ip.c = 0;
> +			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> @@ -756,6 +778,11 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>  			p->u.value.b = ip.b;
>  			p->u.value.c = ip.c;
>  			break;
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +			p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);

Is this needed? Compare with how TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_* is
handled below. If it's indeed needed, please add an access_ok() check.

> +			p->u.ubuf.size = ip.b;
> +			break;
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>  			/*
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index d5f0c70ac95c..130782d4d5f6 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -82,6 +82,11 @@ struct tee_param_memref {
>  	struct tee_shm *shm;
>  };
>  
> +struct tee_param_ubuf {
> +	void * __user uaddr;
> +	size_t size;
> +};
> +
>  struct tee_param_value {
>  	u64 a;
>  	u64 b;
> @@ -92,6 +97,7 @@ struct tee_param {
>  	u64 attr;
>  	union {
>  		struct tee_param_memref memref;
> +		struct tee_param_ubuf ubuf;
>  		struct tee_param_value value;
>  	} u;
>  };
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index d0430bee8292..4a1dcfb4290e 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT	6
>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT	7	/* input and output */
>  
> +/*
> + * These defines userspace buffer parameters.
> + */
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT	8
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT	9
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT	10	/* input and output */
> +
>  /*
>   * Mask for the type part of the attribute, leaves room for more types
>   */
> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
>  /**
>   * struct tee_ioctl_param - parameter
>   * @attr: attributes
> - * @a: if a memref, offset into the shared memory object, else a value parameter
> - * @b: if a memref, size of the buffer, else a value parameter
> + * @a: if a memref, offset into the shared memory object,
> + *     else if a ubuf, address into the user buffer,

address _of_ the user buffer?

Thanks,
Jens

> + *     else a value parameter
> + * @b: if a memref or ubuf, size of the buffer, else a value parameter
>   * @c: if a memref, shared memory identifier, else a value parameter
>   *
> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
> - * indicates that none of the members are used.
> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
> + * are used.
>   *
>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>   * identifier representing the shared memory object. A memref can reference
> 
> -- 
> 2.34.1
> 

