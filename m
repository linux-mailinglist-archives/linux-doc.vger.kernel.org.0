Return-Path: <linux-doc+bounces-42574-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B5AA8061E
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 14:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CBFA7A465F
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 12:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5573926E16D;
	Tue,  8 Apr 2025 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+vod5ze"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F96E26E167
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114794; cv=none; b=mBq+OD4DqSjRy6ykqb6EjUbc9/7CRgMzR9W/BIE8GZzd8+oQwrL6YXZfyYGferF9aSpdOw6vjIlycnZGykeEGljmgAxHQ8t0TtuJEaa2xYtdX7KfUTWA021gk37i7DSEWtL/iJPxDXdPH/ZOzb37j7eOiyJE59jsL6N+B1DBW2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114794; c=relaxed/simple;
	bh=cqJEYZpTWXR9jKvrePEizNqBxYjyUuof2ktKIwAHaEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQfgx+fRCQMhZ5ZWw8VbDh3C5RLbcUsJlz5IQocuqQIce4r74GVOc1Twidnl2a8twYGMEDoTWBFxB/Vju7neW2VIpe3f/CgFfgIWa6r8nHaLwkkqltOwAcj0fhRivccKtf4+IrDRh5bNbyQ5PpG3SmX7A6Zrp3TRxnTxmjFM/xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l+vod5ze; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2d0364e9231so577943fac.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Apr 2025 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744114791; x=1744719591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+klmaoxCED4pDcFuxlOcSxnmOj1ckuigEs3QIV/u2+U=;
        b=l+vod5zeI8r7178aind6l5S/I5Zh3mSHKmxd39+YIgpl2RqcTFqALu7ABsDJ2ZcARg
         1hLfnSQNPcki7jKtKMfH7NWvnapjh0EGt+xreSSjOLRBrKL8ajP3FyptqnzAKhJYqtsy
         yjVAqx3oAsEdBFSuZ3Kj43WK6OIL9l9+Hg8NIpZAOxYWiYauDlWiu2McCpivt0ZHnEDj
         jiQrnKT4EL3KuttTSZQxS+SblBJa/dzrFkmhfrIvEBMYR3eSeKAOdrr3rzXswahA1Lo8
         4yJQs2KatYurck/Bk5+UjaA+pCIt+uD/drBNEV9HC9rO3th6sBhGeX68+pbUBhxh7FOA
         ntRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114791; x=1744719591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+klmaoxCED4pDcFuxlOcSxnmOj1ckuigEs3QIV/u2+U=;
        b=P7PTF+7qQ7sPWcqS76433U8kM73EybiyMU2Xxo5szoqxdT6Io9cuzkFu/rGJ/QaIfM
         tN8VoKhCRnPciF9bVOKDU46aCYW4t51H87WwOT/P8xf3j2uDWnx5IuZFLP32HLxCrXgx
         C2N0NFViUdWbO8P8EgiLl4ntNxZrW57dOuGtKwwvbBTpNSAEl7MhT1TjpQd3VDzvmHKI
         tIMdEBUwlP5QMmm35kLQ0zL77k+qcrwfCGKwRHVsLbfE/NwL1f51qA3C91R5Jis7GMCW
         K7EHDzaDec8+C+KYleooZ989DrtNB0aijY1KIgHVPS8n5P/zUPFooeW3jnUh9YOPmwPg
         cACQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZm39OpREOAq8aAwN2r8MHHO3aYhRS3LofKozD8ROWIUXAGsq2cnVx5YvEEQPzOfxgk6EupddkQ0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8a3b4n+jhR697qBrNintwa1cqf2iZgYfWslaooavnSNLxMCfr
	ydMq6dfFYzsm3mpOcTRzkjNJT2GPQN48k/cUtsiqE8Obhwo4WT8zp0jVoT8MG4HNiD80jXxV7x6
	TomhfAPLNpnIZIJwnydNpTMTHF0lh2rj6bS6jZQ==
X-Gm-Gg: ASbGncsJ842frGSkW5Z5qTIWFc6IgHXfuFip520SibBV/IrF1qR4g8c9E027DlhCLsA
	pJzxAz95RC8a853kw6Yn0A9ZFGQD8t5wTfxiZVtufesIILWJAcAJak/QuFNfL8kLGVW1CZ28GQo
	/rXwNBOmw/agZGD2TviLLmHgQR6Zc=
X-Google-Smtp-Source: AGHT+IFCF+RMHdZBnY2a7hFAdIdejCYyUR6De9S4JNypn9WNmsQX98mK3kXX45iMYBxCtgKmtWC1RqssrKMa0JwHMXI=
X-Received: by 2002:a05:6870:8886:b0:297:23a8:1e0 with SMTP id
 586e51a60fabf-2cd19ba33camr6980481fac.0.1744114791286; Tue, 08 Apr 2025
 05:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 8 Apr 2025 14:19:39 +0200
X-Gm-Features: ATxdqUHiR13vrEghgcenypM4xH6AalhCyyu9dL_6PNXYq9LDpZaokLz8xGNRvcA
Message-ID: <CAHUa44GRBiRr6CsFWxJhyzf1cRSEP66m5K7uFntOv3oYWTHWgQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Apurupa Pattapu <quic_apurupa@quicinc.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amirreza,

On Fri, Mar 28, 2025 at 3:48=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> For drivers that can transfer data to the TEE without using shared
> memory from client, it is necessary to receive the user address
> directly, bypassing any processing by the TEE subsystem. Introduce
> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
> userspace buffers.
>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
>  include/linux/tee_drv.h  |  6 ++++++
>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
>  3 files changed, 55 insertions(+), 6 deletions(-)

Is this patch needed now that the QCOMTEE driver supports shared
memory? I prefer keeping changes to the ABI to a minimum.

Cheers,
Jens

>
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 22cc7d624b0c..bc862a11d437 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -404,6 +404,17 @@ static int params_from_user(struct tee_context *ctx,=
 struct tee_param *params,
>                         params[n].u.value.b =3D ip.b;
>                         params[n].u.value.c =3D ip.c;
>                         break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +                       params[n].u.ubuf.uaddr =3D u64_to_user_ptr(ip.a);
> +                       params[n].u.ubuf.size =3D ip.b;
> +
> +                       if (!access_ok(params[n].u.ubuf.uaddr,
> +                                      params[n].u.ubuf.size))
> +                               return -EFAULT;
> +
> +                       break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> @@ -472,6 +483,11 @@ static int params_to_user(struct tee_ioctl_param __u=
ser *uparams,
>                             put_user(p->u.value.c, &up->c))
>                                 return -EFAULT;
>                         break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +                       if (put_user((u64)p->u.ubuf.size, &up->b))
> +                               return -EFAULT;
> +                       break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>                         if (put_user((u64)p->u.memref.size, &up->b))
> @@ -672,6 +688,13 @@ static int params_to_supp(struct tee_context *ctx,
>                         ip.b =3D p->u.value.b;
>                         ip.c =3D p->u.value.c;
>                         break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +                       ip.a =3D (u64)p->u.ubuf.uaddr;
> +                       ip.b =3D p->u.ubuf.size;
> +                       ip.c =3D 0;
> +                       break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> @@ -774,6 +797,16 @@ static int params_from_supp(struct tee_param *params=
, size_t num_params,
>                         p->u.value.b =3D ip.b;
>                         p->u.value.c =3D ip.c;
>                         break;
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> +                       p->u.ubuf.uaddr =3D u64_to_user_ptr(ip.a);
> +                       p->u.ubuf.size =3D ip.b;
> +
> +                       if (!access_ok(params[n].u.ubuf.uaddr,
> +                                      params[n].u.ubuf.size))
> +                               return -EFAULT;
> +
> +                       break;
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>                         /*
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index ce23fd42c5d4..d773f91c6bdd 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -82,6 +82,11 @@ struct tee_param_memref {
>         struct tee_shm *shm;
>  };
>
> +struct tee_param_ubuf {
> +       void * __user uaddr;
> +       size_t size;
> +};
> +
>  struct tee_param_value {
>         u64 a;
>         u64 b;
> @@ -92,6 +97,7 @@ struct tee_param {
>         u64 attr;
>         union {
>                 struct tee_param_memref memref;
> +               struct tee_param_ubuf ubuf;
>                 struct tee_param_value value;
>         } u;
>  };
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index d0430bee8292..3e9b1ec5dfde 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT        6
>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT 7       /* input and outp=
ut */
>
> +/*
> + * These defines userspace buffer parameters.
> + */
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT   8
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT  9
> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT   10      /* input and outp=
ut */
> +
>  /*
>   * Mask for the type part of the attribute, leaves room for more types
>   */
> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
>  /**
>   * struct tee_ioctl_param - parameter
>   * @attr: attributes
> - * @a: if a memref, offset into the shared memory object, else a value p=
arameter
> - * @b: if a memref, size of the buffer, else a value parameter
> + * @a: if a memref, offset into the shared memory object,
> + *     else if a ubuf, address of the user buffer,
> + *     else a value parameter
> + * @b: if a memref or ubuf, size of the buffer, else a value parameter
>   * @c: if a memref, shared memory identifier, else a value parameter
>   *
> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used=
 in
> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NO=
NE
> - * indicates that none of the members are used.
> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value =
is
> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYP=
E_UBUF_*
> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the m=
embers
> + * are used.
>   *
>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>   * identifier representing the shared memory object. A memref can refere=
nce
>
> --
> 2.34.1
>

