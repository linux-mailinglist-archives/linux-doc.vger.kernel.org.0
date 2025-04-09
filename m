Return-Path: <linux-doc+bounces-42689-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F576A81FCC
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 10:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D1D78831DA
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 08:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FED925C6E3;
	Wed,  9 Apr 2025 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yrOlad9b"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3776725B697
	for <linux-doc@vger.kernel.org>; Wed,  9 Apr 2025 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187256; cv=none; b=Uzv7u0C6iMer96d7ggTMXa/V3bVgKam7x0zZjqJnY77yYZYWD9bjFo/6oR2qXq3PeAzNriU4ZzIHxghoidwwwbsk+h3ZchLtWXrJQ31wSNGErjvaaMMPT4ksr7/mAQwRwp58apfu7Gh4E3lJnAfJWvd5DbLnaJaSXxip5FVmXow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187256; c=relaxed/simple;
	bh=jkHYEX1Ktd5OqU5tbqEEOC9i8YxJ6TPdszvCIdEeSeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeoN7UEB4mx9ML/NOFCoHY8Y7JQPcH20sVt+48HpSNzJeHFufmlapR3xBpyfgPX4HiWyCqxyK2jCvrRAnbhSlWyLajyYKfy54+DRoP75C5HNvx/P+zfV7OJX5Mbar36pnSDahGm2wsq9wlZgAgYcmIkVBUy0PJZDu9nlsueEGho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yrOlad9b; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2cc82edcf49so1561700fac.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Apr 2025 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744187252; x=1744792052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/lMrgXCt3JM3AMAeq45BbCg9Kkq7K6y3EXwhXyUEBw=;
        b=yrOlad9biyApdRTJanMQTvQCodVssZ4SUTIWfVLBVS2g4oehGJ/yhfDlx1072CSkr/
         CtThwRi2RKcb8rHUkduN5JHDHJr96pFHJJvKKz/nchiRLPqVfKJHXZpJ5cKP4EkQQ/vz
         Ws8Azv4Bc6Lr83S9WSkR9dzUi+DSNzUJy+kTEm2Loh6y0I57s/wSKnuZYireefZbUy3G
         tn7/qIAh+B2TnltI7R3L45dKZlJvfIaTlel7V7HlhksSOWwOoA2QpzgXV+dO87AB8yTy
         x9DmVQGP+Gk+8aAaby8WlgYOlSD9rNeeIegZnwqTiNzHFGumzdlBQchqcOs2jVlvTpav
         +Xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187252; x=1744792052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/lMrgXCt3JM3AMAeq45BbCg9Kkq7K6y3EXwhXyUEBw=;
        b=bwgAimF9rLGWWHmb2Ztgt7UwAMsCI0+WZDm5b+EXo6td7BPaZTZPLrkw2318krQQbL
         Z3WgokVv6vHIeu+7ARuPIsAr8nb2CYpMloGnTMGGArqEBRCh3TstWkw447vZhUxQ0MQF
         4RU1D2m2VaixV1+rnbHXORfteTG8kctSJutXapLLPTi7APhBMX6gYtDVrEp/vB4agHWN
         uLXumuNwX6dKHE43iNB1t8y3sfsYoSGOl/OjepbeOCICGPTGRUSH1Tsc87oTBhFqMtTg
         XnbRs6K9gMwdNro6mxsTT+MdmZD/uBNN0oCIiPdRXbnhA2rGIwSDt4QBA8GWBzjmDTYO
         9/iw==
X-Forwarded-Encrypted: i=1; AJvYcCXkbgQUm9YdZgmdCqmGjHdh8BJSDjGTKdtHczRmBMY5YLxeE0q30fN++ocsNTryiw1jON5Fbj/qEJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YynPeSs6caMgztBNKyvC92MwttRYpukTtM/ib/j2YE+6vbZMR7x
	nEcXM05Zc4UKoH/Z2O4pqxLAtbiKt8NohdTiIQ025DfT+1GSXPrQ63E5e2bsJui4q5YJCEJzNdu
	DwhnhrqTA2WzOiUusVOl4LaEe1mW/R1LI1WdiQQ==
X-Gm-Gg: ASbGnctDz+g58ZKDGGyNVLENA+WJ8BB246/yV0VsJeE+kN8IEfhu7zb9g7CGaX3WqJb
	gRCXDGkoSEQuivhCXbC33AiMNKc0FqSup+LVLfXoC8+PBqLcE9xIJe7eUA9mNB9kkEHsWWNooqp
	3AOIKa3VQ5b2WKP3YxZXDTYe4=
X-Google-Smtp-Source: AGHT+IEZeTFmVGTODWpd4xX+uFSSHfdEGipiWyYBCt8L1cARUIZAiR6ETmFp0kxz7VRwM4TyG8bHNU5bF8YWbLJbRHo=
X-Received: by 2002:a05:6870:7194:b0:2c6:72d3:fc93 with SMTP id
 586e51a60fabf-2d09176b3c9mr745417fac.12.1744187252078; Wed, 09 Apr 2025
 01:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>
 <CAHUa44GRBiRr6CsFWxJhyzf1cRSEP66m5K7uFntOv3oYWTHWgQ@mail.gmail.com>
 <5de2a378-77cf-4373-b3ae-faeebb931e2d@oss.qualcomm.com> <CAHUa44F-t29Hu0o3+0vFLjtrnA8ZGycPFcUTXEOmms9B=cZ6XA@mail.gmail.com>
 <db3e8182-99ae-4a63-96ca-5d7ebeeb170f@oss.qualcomm.com>
In-Reply-To: <db3e8182-99ae-4a63-96ca-5d7ebeeb170f@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 9 Apr 2025 10:27:20 +0200
X-Gm-Features: ATxdqUGMP5rCKKVvoNhq1SVNDfoVDLELnKd9DL_eKtgXdtc8jbz_99zAWdvG1vE
Message-ID: <CAHUa44G9NS-kyqEuuJrqijNttGANUJ_3W0uu+686fhA2C6pYDQ@mail.gmail.com>
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

On Wed, Apr 9, 2025 at 9:20=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
>
>
> On 4/9/2025 4:41 PM, Jens Wiklander wrote:
> > Hi Amirreza,
> >
> > On Wed, Apr 9, 2025 at 2:28=E2=80=AFAM Amirreza Zarrabi
> > <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>
> >> Hi jens,
> >>
> >> On 4/8/2025 10:19 PM, Jens Wiklander wrote:
> >>
> >> Hi Amirreza,
> >>
> >> On Fri, Mar 28, 2025 at 3:48=E2=80=AFAM Amirreza Zarrabi
> >> <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>
> >> For drivers that can transfer data to the TEE without using shared
> >> memory from client, it is necessary to receive the user address
> >> directly, bypassing any processing by the TEE subsystem. Introduce
> >> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
> >> userspace buffers.
> >>
> >> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >> ---
> >>  drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
> >>  include/linux/tee_drv.h  |  6 ++++++
> >>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
> >>  3 files changed, 55 insertions(+), 6 deletions(-)
> >>
> >> Is this patch needed now that the QCOMTEE driver supports shared
> >> memory? I prefer keeping changes to the ABI to a minimum.
> >>
> >> Cheers,
> >> Jens
> >>
> >> Unfortunately, this is still required. QTEE supports two types of data=
 transfer:
> >> (1) using UBUF and (2) memory objects. Even with memory object support=
, some APIs still
> >> expect to receive data using UBUF. For instance, to load a TA, QTEE of=
fers two interfaces:
> >> one where the TA binary is in UBUF and another where the TA binary is =
in a memory object.
> >
> > Is this a limitation in the QTEE backend driver or on the secure side?
> > Can it be fixed? I don't ask for changes in the ABI to the secure
> > world since I assume you haven't made such changes while this patch
> > set has evolved.
> >
> > Cheers,
> > Jens
>
> The secure-side ABI supports passing data using memcpy to the same
> buffer that contains the message for QTEE, rather than using a memory
> object. Some services tend to use this approach for small data instead
> of allocating a memory object. I have no choice but to expose this suppor=
t.

Got it, thanks! It's needed.

>
> Throughout the patchset, I have not made any change to the ABI but
> tried to provide support for the memory object in a separate,
> independent commit, distinct from the UBUF.

OK

Cheers,
Jens

>
> Best regards,
> Amir
>
> >
> >>
> >> Best Regards,
> >> Amir
> >>
> >> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> >> index 22cc7d624b0c..bc862a11d437 100644
> >> --- a/drivers/tee/tee_core.c
> >> +++ b/drivers/tee/tee_core.c
> >> @@ -404,6 +404,17 @@ static int params_from_user(struct tee_context *c=
tx, struct tee_param *params,
> >>                         params[n].u.value.b =3D ip.b;
> >>                         params[n].u.value.c =3D ip.c;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       params[n].u.ubuf.uaddr =3D u64_to_user_ptr(ip.=
a);
> >> +                       params[n].u.ubuf.size =3D ip.b;
> >> +
> >> +                       if (!access_ok(params[n].u.ubuf.uaddr,
> >> +                                      params[n].u.ubuf.size))
> >> +                               return -EFAULT;
> >> +
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >> @@ -472,6 +483,11 @@ static int params_to_user(struct tee_ioctl_param =
__user *uparams,
> >>                             put_user(p->u.value.c, &up->c))
> >>                                 return -EFAULT;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       if (put_user((u64)p->u.ubuf.size, &up->b))
> >> +                               return -EFAULT;
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >>                         if (put_user((u64)p->u.memref.size, &up->b))
> >> @@ -672,6 +688,13 @@ static int params_to_supp(struct tee_context *ctx=
,
> >>                         ip.b =3D p->u.value.b;
> >>                         ip.c =3D p->u.value.c;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       ip.a =3D (u64)p->u.ubuf.uaddr;
> >> +                       ip.b =3D p->u.ubuf.size;
> >> +                       ip.c =3D 0;
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >> @@ -774,6 +797,16 @@ static int params_from_supp(struct tee_param *par=
ams, size_t num_params,
> >>                         p->u.value.b =3D ip.b;
> >>                         p->u.value.c =3D ip.c;
> >>                         break;
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
> >> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
> >> +                       p->u.ubuf.uaddr =3D u64_to_user_ptr(ip.a);
> >> +                       p->u.ubuf.size =3D ip.b;
> >> +
> >> +                       if (!access_ok(params[n].u.ubuf.uaddr,
> >> +                                      params[n].u.ubuf.size))
> >> +                               return -EFAULT;
> >> +
> >> +                       break;
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
> >>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
> >>                         /*
> >> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> >> index ce23fd42c5d4..d773f91c6bdd 100644
> >> --- a/include/linux/tee_drv.h
> >> +++ b/include/linux/tee_drv.h
> >> @@ -82,6 +82,11 @@ struct tee_param_memref {
> >>         struct tee_shm *shm;
> >>  };
> >>
> >> +struct tee_param_ubuf {
> >> +       void * __user uaddr;
> >> +       size_t size;
> >> +};
> >> +
> >>  struct tee_param_value {
> >>         u64 a;
> >>         u64 b;
> >> @@ -92,6 +97,7 @@ struct tee_param {
> >>         u64 attr;
> >>         union {
> >>                 struct tee_param_memref memref;
> >> +               struct tee_param_ubuf ubuf;
> >>                 struct tee_param_value value;
> >>         } u;
> >>  };
> >> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> >> index d0430bee8292..3e9b1ec5dfde 100644
> >> --- a/include/uapi/linux/tee.h
> >> +++ b/include/uapi/linux/tee.h
> >> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
> >>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT        6
> >>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT 7       /* input and o=
utput */
> >>
> >> +/*
> >> + * These defines userspace buffer parameters.
> >> + */
> >> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT   8
> >> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT  9
> >> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT   10      /* input and o=
utput */
> >> +
> >>  /*
> >>   * Mask for the type part of the attribute, leaves room for more type=
s
> >>   */
> >> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
> >>  /**
> >>   * struct tee_ioctl_param - parameter
> >>   * @attr: attributes
> >> - * @a: if a memref, offset into the shared memory object, else a valu=
e parameter
> >> - * @b: if a memref, size of the buffer, else a value parameter
> >> + * @a: if a memref, offset into the shared memory object,
> >> + *     else if a ubuf, address of the user buffer,
> >> + *     else a value parameter
> >> + * @b: if a memref or ubuf, size of the buffer, else a value paramete=
r
> >>   * @c: if a memref, shared memory identifier, else a value parameter
> >>   *
> >> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is u=
sed in
> >> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
> >> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE=
_NONE
> >> - * indicates that none of the members are used.
> >> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or val=
ue is
> >> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
> >> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_=
TYPE_UBUF_*
> >> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of th=
e members
> >> + * are used.
> >>   *
> >>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
> >>   * identifier representing the shared memory object. A memref can ref=
erence
> >>
> >> --
> >> 2.34.1
> >>
>

