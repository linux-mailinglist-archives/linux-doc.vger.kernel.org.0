Return-Path: <linux-doc+bounces-32379-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE59EADF0
	for <lists+linux-doc@lfdr.de>; Tue, 10 Dec 2024 11:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD006163536
	for <lists+linux-doc@lfdr.de>; Tue, 10 Dec 2024 10:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C2A1DC9A3;
	Tue, 10 Dec 2024 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3TDEH+7"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0C223DEB5
	for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 10:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733826282; cv=none; b=HzO/NI78MoPfQVSlVVB3UjRvFnhrYR6TZHnbHVyV4H1NArJe88BNPnWrz5IJc0eEYu2IdhK4n7ntY4TORremV5/FnEVdHJWt56tmW3roh+8Y1FU1OC2eFZ8B4bLeWfvDmMrTgynEYfUoXy0PJMu90cRv21h3Zdb2dLxyZ/QMvyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733826282; c=relaxed/simple;
	bh=KacdTMDwGHOubfAMUMEA0y3RYV/hoieH8eSRxF9Vy/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDIOmlr37FnOyGT6pk7nvbWhI3MORmcCdotiy1fC7bIWooJ7IG6uy80FRbiq3aa5TPVgAWHH9Jobvvl3oW5YgxUOGYU+O6LMoiDXXbxJCgQz4Bf7aEewh9Eru91k/MaU8r8/r2l28GsQH5vhXPYRWDHSM17p2ADOtJ8KvLHxNLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3TDEH+7; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-71ded02b779so1075465a34.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 02:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733826278; x=1734431078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnxhJKvx9jYvossMLwXlm6WCMeoNqlxmsqhx0tMAQvc=;
        b=W3TDEH+7hUB3uOktZN2+rAjiIzsIwLe+nbUQCCdTKz617Ax7EZ/Y3eF+MSPcBXZ4Ho
         ePy9bnnabXq3LtLEEzZrhjJ5VtKelBWpnCR1BQIGToBAKPtbCxC/uvZfz9i0+ZHQPpb/
         Jy+gYdDntjUUVu2zkZoClfQukKNE+lt0HayX/a+sMioPmZ1bDlLooBJgut/7vUfEfJvW
         ov6QB3LbJrxszoUsTlLC+DjBamKy0eZ5axYBENbM+H/l3avG7DP+MUx2WJtt3eANoyhg
         g+OgETo/g1XgsujhdyYaUOI60pZkZ6wX15/9RWIPu2pwh3hi75W/N66hD0byPx4KN743
         gYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733826278; x=1734431078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnxhJKvx9jYvossMLwXlm6WCMeoNqlxmsqhx0tMAQvc=;
        b=iCy5LakMPfizr0Bdd7kMInrHM3VyYHJPrV3YrXhGBeV7C6GmfmCjJnEXVsONWROcQI
         nME2Nu31kkkRVc8BwRWpYY4oO+ZWMVoYs4ARP2aoYk4nj2zn8uIVtsI+YjSLPHnhDv4U
         d1TlgtmKH0wziH+dsOMvAj/tozmRPkNmVg6AVhu+P9toMJq0oV7RL9pmzpKOsvgt95Ar
         MkHXLAEVzzjHniybjpGcag41sDcctqh1l6jZjxfZSjcKvlDneU5/Rw4ka51DM2w0J8i3
         FwN9EPiMCyFWavXGYQpGWLBqCFqzQP+wAitzfHYD/T5uZh/TxLqmJWANFEAiLVF3dhof
         xWTg==
X-Forwarded-Encrypted: i=1; AJvYcCXSblUBfjezwa1anvNzaQkfJ0DZSlFiIsfVelmHNJlwKX6WNrKfYi13Ntrc0EPYhucUak5fROFVTUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeOhgepq3NEpmho8jGvH+Qs3SKOthqpUZ97TMJZvQnnZmLmO/k
	rzx4JiFsUpNNnBlUUbJoFfX8TDsWKG+sh7berxUbPLqqbOO26KSGCO4i2EVsFAE84jK+2VdLuKd
	FU/41BXopuVR/tXRcx8KJaSMlsAgcpM+KdJ/n8w==
X-Gm-Gg: ASbGncv3P23/71ScIM/WErpkgm++46qeMCWcH3q8RXsBdx+3H2Sf7+P7JHqjIThQKYt
	RyI3LGX467TgEHZkIsABrhaq0wGKtmSq+jeE9
X-Google-Smtp-Source: AGHT+IFqSNy/U675xZEjsmCHP/7RnRexS72dnpn/UvAKcfve/GQogygTf20YsSMYxyFib0NlWI+JrNXv9DbPSym+qsU=
X-Received: by 2002:a9d:7d99:0:b0:71d:eee3:fd27 with SMTP id
 46e09a7af769-71deee3fe91mr4254214a34.1.1733826278464; Tue, 10 Dec 2024
 02:24:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
 <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-5-f502ef01e016@quicinc.com>
In-Reply-To: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-5-f502ef01e016@quicinc.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 10 Dec 2024 11:24:27 +0100
Message-ID: <CAHUa44FhZc1ZVgJQrqbDdY1kegNgHrC4VTs66-5CDfY04D6MMw@mail.gmail.com>
Subject: Re: [PATCH 05/10] qcomtee: implement object invoke support
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 5:20=E2=80=AFAM Amirreza Zarrabi
<quic_azarrabi@quicinc.com> wrote:
>
> Introduce qcom_tee_object, which represents an object in both QTEE and
> the kernel. QTEE clients can invoke an instance of qcom_tee_object to
> access QTEE services. If this invocation produces a new object in QTEE,
> an instance of qcom_tee_object will be returned.
>
> Similarly, QTEE can request services from the kernel by issuing a callbac=
k
> request, which invokes an instance of qcom_tee_object in the kernel.
> Any subsystem that exposes a service to QTEE should allocate and initiali=
ze
> an instance of qcom_tee_object with a dispatcher callback that is called
> when the object is invoked.
>
> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> ---
>  drivers/tee/Kconfig                    |   1 +
>  drivers/tee/Makefile                   |   1 +
>  drivers/tee/qcomtee/Kconfig            |  10 +
>  drivers/tee/qcomtee/Makefile           |   6 +
>  drivers/tee/qcomtee/async.c            | 153 ++++++
>  drivers/tee/qcomtee/core.c             | 928 +++++++++++++++++++++++++++=
++++++
>  drivers/tee/qcomtee/qcom_scm.c         |  36 ++
>  drivers/tee/qcomtee/qcomtee_msg.h      | 217 ++++++++
>  drivers/tee/qcomtee/qcomtee_private.h  |  47 ++
>  drivers/tee/qcomtee/release.c          |  66 +++
>  include/linux/firmware/qcom/qcom_tee.h | 284 ++++++++++
>  11 files changed, 1749 insertions(+)
>
[snip]

> +/**
> + * DOC: Overview
> + *
> + * qcom_tee_object provides object ref-counting, id allocation for objec=
ts hosted in
> + * REE, and necessary message marshaling for Qualcomm TEE (QTEE).
> + *
> + * To invoke an object in QTEE, user calls qcom_tee_object_do_invoke() w=
hile passing
> + * an instance of &struct qcom_tee_object and the requested operation + =
arguments.
> + *
> + * After the boot, QTEE provides a static object %ROOT_QCOM_TEE_OBJECT (=
type of
> + * %QCOM_TEE_OBJECT_TYPE_ROOT). The root object is invoked to pass user'=
s credentials and
> + * obtain other instances of &struct qcom_tee_object (type of %QCOM_TEE_=
OBJECT_TYPE_TEE)
> + * that represents services and TAs in QTEE, see &enum qcom_tee_object_t=
ype.
> + *
> + * The object received from QTEE are refcounted. So the owner of these o=
bjects can
> + * issue qcom_tee_object_get(), to increase the refcount, and pass objec=
ts to other
> + * clients, or issue qcom_tee_object_put() to decrease the refcount, and=
 releasing
> + * the resources in QTEE.
> + *
> + * REE can host services accessible to QTEE. A driver should embed an in=
stance of
> + * &struct qcom_tee_object in the struct it wants to export to QTEE (it =
is called
> + * callback object). It issues qcom_tee_object_user_init() to set the di=
spatch()
> + * operation for the callback object and set its type to %QCOM_TEE_OBJEC=
T_TYPE_CB_OBJECT.
> + *
> + * core.c holds an object table for callback objects. An object id is as=
signed
> + * to each callback object which is an index to the object table. QTEE u=
ses these ids
> + * to reference or invoke callback objects.
> + *
> + * If QTEE invoke a callback object in REE, the dispatch() operation is =
called in the
> + * context of thread that called qcom_tee_object_do_invoke(), originally=
.
> + */
> +
> +/**
> + * enum qcom_tee_object_typ - Object types.
> + * @QCOM_TEE_OBJECT_TYPE_TEE: object hosted on QTEE.
> + * @QCOM_TEE_OBJECT_TYPE_CB_OBJECT: object hosted on REE.
> + * @QCOM_TEE_OBJECT_TYPE_ROOT: 'primordial' object.
> + * @QCOM_TEE_OBJECT_TYPE_NULL: NULL object.
> + *
> + * Primordial object is used for bootstrapping the IPC connection betwee=
n a REE
> + * and QTEE. It is invoked by REE when it wants to get a 'client env'.
> + */
> +enum qcom_tee_object_type {
> +       QCOM_TEE_OBJECT_TYPE_TEE,
> +       QCOM_TEE_OBJECT_TYPE_CB_OBJECT,

The second OBJECT seems redundant. How about QCOM_TEE_OBJECT_TYPE_CB
or QCOM_TEE_OBJECT_TYPE_CALLBACK instead?

> +       QCOM_TEE_OBJECT_TYPE_ROOT,
> +       QCOM_TEE_OBJECT_TYPE_NULL,
> +};
[snip]

Cheers,
Jens

