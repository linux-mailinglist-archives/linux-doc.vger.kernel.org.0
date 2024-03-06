Return-Path: <linux-doc+bounces-11522-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72577872FFF
	for <lists+linux-doc@lfdr.de>; Wed,  6 Mar 2024 08:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 953491C218D4
	for <lists+linux-doc@lfdr.de>; Wed,  6 Mar 2024 07:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085E95CDE0;
	Wed,  6 Mar 2024 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlvhm6Ap"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73245C8E7
	for <linux-doc@vger.kernel.org>; Wed,  6 Mar 2024 07:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709711699; cv=none; b=ZWwB1PR4PbdtYIUGgBLePbq1NUKSx7UJBSkpks2NGRAN6DZ+Um9dZ1A71l6KAMZEVLmU+mDAWEd50XGg7nJRkuOyg1H5KwdcqDI0xFDWloUl0SMe3j5K6JExTdFy5q9sCR53HAOYrpow///J0dVAjL9GA6eWpqwD4Gejb+of2m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709711699; c=relaxed/simple;
	bh=LT9qKQo4UXZzHLhYOjUPHE912Hn+4M4sBcAEzcsllO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZyqhDJ2DrCmLkzh+B6OeL8grDmtPrLM/dJtdBQ3la0sJIxyJu43rPzTFv8UVbG5JUAUQrOZ1p+qMkxae6U0BunA74W/2ge6s1Cb2GAMUlqZ5krdYRWxM50HMtinr+Ft0o5Sy19NIgXDlNiT2Bfl4TB4qVhf8YPyjK1re+GmsP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlvhm6Ap; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7db68ed7bb1so465672241.2
        for <linux-doc@vger.kernel.org>; Tue, 05 Mar 2024 23:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709711696; x=1710316496; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8TjHzenET0BsmhctyS5MBM+hfGxMEJbaLgMm6NPqdR0=;
        b=jlvhm6ApRsCFi6aOU7ZJO9czoe4GMRm8NgKeyitYdLhsGHLTksqVuTnyza/+UHptIO
         w1oTbljxhAEJn342YbDLMYfg6NhjciGyWMk8Lwdh5rXAEfquZEb/Xr7Dx57ADiHTPRSh
         fHt1TyWMbJIjmA3ON9Vtt+X9NbuSyCGHabjKcJOM/fTpD2DYCP/mvApv5o6+NXJc/0+e
         tLGQwDD8xlPORklgjYdQTNpcZEgU0J/E5XU7z9J3dHpGidnVcPT+/bF7HMlNPsVKb5k9
         cEwNaK7pBUd98IhsZL2eeToglDAiB4s5aKKTR0rhz9wzfdMp2ZkKEIM+H1gY15k9KVXN
         4o/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709711696; x=1710316496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TjHzenET0BsmhctyS5MBM+hfGxMEJbaLgMm6NPqdR0=;
        b=CZWbHVWKU0ECitbDqUY8iT3284hraOdXZJhCHCQAhXYU8eO2rynlxyvSZbfRrbXKfe
         3BBrg5w5Cr/6FM5K19fav9ywzOM+LBONIa/L5foCsJWGGU7IeZyjDBUtDbiYA+TMAEAP
         D5jWwSkFIVD0OvmIaCKxTyp4ThrI4XLWX3UCGLGb1bgqoexs04n06yXXMTTPNWRJ4jH/
         nBANZeNjRkRZ2v+XmnH3afD+JVyIyWPyHN2GOtyJ0Y27xLxqyoSHSIxIZG0b6COwlmQr
         bP16G0io4tOzHOY5dSJYMsbkx+wMn7Db4jXLOBeQgOjIYiOzQn0lkKsMmVu7nd8r3pdm
         KUQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPyZ0vkrdLOPNg02NW6pJxfArKTpwGdNQSn8wHpdSciAwlZlIYPjNPSu05b/NMBUo1/ltxeqT41GV2G91ON13mixEY/i77dfX0
X-Gm-Message-State: AOJu0Yxy4q1QDDeBOLalgyCLWfrMw2F1Bq2s8hMIUiadTZ/5lZoTT693
	i3EF79Y3xOn7IoMKxopZ5qL2LzzcHIZJpWCI8pJNjFULO/q9Lyjb4bSgbN60xjGEKbNxtwCWV9M
	AG8eTvpKDz3la4aovWpNmXLWTxvritoxwKRc46A==
X-Google-Smtp-Source: AGHT+IE23InAAx5DPBfIdH55gzora9LQUOuE8t0/sW15y+pg1x2BZA2bKIuts+uigTsA6DiHP6WF56fJYvRFxI+40v0=
X-Received: by 2002:a67:e9d9:0:b0:472:6661:bde7 with SMTP id
 q25-20020a67e9d9000000b004726661bde7mr4144359vso.15.1709711695254; Tue, 05
 Mar 2024 23:54:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305101745.213933-1-balint.dobszay@arm.com> <20240305101745.213933-4-balint.dobszay@arm.com>
In-Reply-To: <20240305101745.213933-4-balint.dobszay@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 6 Mar 2024 13:24:44 +0530
Message-ID: <CAFA6WYPbgwRKFA9_ppwDdpwfT6LiiuYb6e6rjntzEZs185jusA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] tee: tstee: Add Trusted Services TEE driver
To: Balint Dobszay <balint.dobszay@arm.com>
Cc: op-tee@lists.trustedfirmware.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jens.wiklander@linaro.org, corbet@lwn.net, sudeep.holla@arm.com, 
	rdunlap@infradead.org, krzk@kernel.org, gyorgy.szing@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi Balint,

On Tue, 5 Mar 2024 at 15:49, Balint Dobszay <balint.dobszay@arm.com> wrote:
>
> The Trusted Services project provides a framework for developing and
> deploying device Root of Trust services in FF-A Secure Partitions. The
> FF-A SPs are accessible through the FF-A driver, but this doesn't
> provide a user space interface. The goal of this TEE driver is to make
> Trusted Services SPs accessible for user space clients.
>
> All TS SPs have the same FF-A UUID, it identifies the RPC protocol used
> by TS. A TS SP can host one or more services, a service is identified by
> its service UUID. The same type of service cannot be present twice in
> the same SP. During SP boot each service in an SP is assigned an
> interface ID, this is just a short ID to simplify message addressing.
> There is 1:1 mapping between TS SPs and TEE devices, i.e. a separate TEE
> device is registered for each TS SP. This is required since contrary to
> the generic TEE design where memory is shared with the whole TEE
> implementation, in case of FF-A, memory is shared with a specific SP. A
> user space client has to be able to separately share memory with each SP
> based on its endpoint ID.
>
> Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
> ---
>  drivers/tee/Kconfig               |   1 +
>  drivers/tee/Makefile              |   1 +
>  drivers/tee/tstee/Kconfig         |  11 +
>  drivers/tee/tstee/Makefile        |   3 +
>  drivers/tee/tstee/core.c          | 482 ++++++++++++++++++++++++++++++
>  drivers/tee/tstee/tstee_private.h |  92 ++++++
>  include/uapi/linux/tee.h          |   1 +
>  7 files changed, 591 insertions(+)
>  create mode 100644 drivers/tee/tstee/Kconfig
>  create mode 100644 drivers/tee/tstee/Makefile
>  create mode 100644 drivers/tee/tstee/core.c
>  create mode 100644 drivers/tee/tstee/tstee_private.h
>
> diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
> index 73a147202e88..61b507c18780 100644
> --- a/drivers/tee/Kconfig
> +++ b/drivers/tee/Kconfig
> @@ -15,5 +15,6 @@ if TEE
>
>  source "drivers/tee/optee/Kconfig"
>  source "drivers/tee/amdtee/Kconfig"
> +source "drivers/tee/tstee/Kconfig"
>
>  endif
> diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
> index 68da044afbfa..5488cba30bd2 100644
> --- a/drivers/tee/Makefile
> +++ b/drivers/tee/Makefile
> @@ -5,3 +5,4 @@ tee-objs += tee_shm.o
>  tee-objs += tee_shm_pool.o
>  obj-$(CONFIG_OPTEE) += optee/
>  obj-$(CONFIG_AMDTEE) += amdtee/
> +obj-$(CONFIG_ARM_TSTEE) += tstee/
> diff --git a/drivers/tee/tstee/Kconfig b/drivers/tee/tstee/Kconfig
> new file mode 100644
> index 000000000000..d32f91d47398
> --- /dev/null
> +++ b/drivers/tee/tstee/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config ARM_TSTEE
> +       tristate "Arm Trusted Services TEE driver"
> +       depends on ARM_FFA_TRANSPORT
> +       default n
> +       help
> +         The Trusted Services project provides a framework for developing and
> +         deploying device Root of Trust services in FF-A Secure Partitions.
> +         This driver provides an interface to make Trusted Services Secure
> +         Partitions accessible for user space clients, since the FF-A driver
> +         doesn't implement a user space interface directly.
> diff --git a/drivers/tee/tstee/Makefile b/drivers/tee/tstee/Makefile
> new file mode 100644
> index 000000000000..5227020ebd30
> --- /dev/null
> +++ b/drivers/tee/tstee/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +arm-tstee-objs := core.o
> +obj-$(CONFIG_ARM_TSTEE) = arm-tstee.o
> diff --git a/drivers/tee/tstee/core.c b/drivers/tee/tstee/core.c
> new file mode 100644
> index 000000000000..577c9d52673e
> --- /dev/null
> +++ b/drivers/tee/tstee/core.c
> @@ -0,0 +1,482 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023, Arm Limited
> + */
> +
> +#include <linux/arm_ffa.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/tee_core.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +#include <linux/xarray.h>
> +#include "tstee_private.h"
> +
> +#define FFA_DIRECT_REQ_ARG_NUM 5
> +#define FFA_INVALID_MEM_HANDLE U64_MAX
> +
> +static void arg_list_to_ffa_data(const u32 *args,
> +                                struct ffa_send_direct_data *data)
> +{
> +       data->data0 = args[0];
> +       data->data1 = args[1];
> +       data->data2 = args[2];
> +       data->data3 = args[3];
> +       data->data4 = args[4];
> +}
> +
> +static void arg_list_from_ffa_data(const struct ffa_send_direct_data *data,
> +                                  u32 *args)
> +{
> +       args[0] = lower_32_bits(data->data0);
> +       args[1] = lower_32_bits(data->data1);
> +       args[2] = lower_32_bits(data->data2);
> +       args[3] = lower_32_bits(data->data3);
> +       args[4] = lower_32_bits(data->data4);
> +}
> +
> +static void tstee_get_version(struct tee_device *teedev,
> +                             struct tee_ioctl_version_data *vers)
> +{
> +       struct tstee *tstee = tee_get_drvdata(teedev);
> +       struct tee_ioctl_version_data v = {
> +               .impl_id = TEE_IMPL_ID_TSTEE,
> +               /* FF-A endpoint ID only uses the lower 16 bits */
> +               .impl_caps = lower_16_bits(tstee->ffa_dev->vm_id),
> +               .gen_caps = 0,

As I mentioned during the RFC review, since you aren't supporting
TEE_GEN_CAP_REG_MEM capability here...

> +       };
> +
> +       *vers = v;
> +}
> +
> +static int tstee_open(struct tee_context *ctx)
> +{
> +       struct ts_context_data *ctxdata;
> +
> +       ctxdata = kzalloc(sizeof(*ctxdata), GFP_KERNEL);
> +       if (!ctxdata)
> +               return -ENOMEM;
> +
> +       xa_init_flags(&ctxdata->sess_list, XA_FLAGS_ALLOC);
> +
> +       ctx->data = ctxdata;
> +
> +       return 0;
> +}
> +
> +static void tstee_release(struct tee_context *ctx)
> +{
> +       struct ts_context_data *ctxdata = ctx->data;
> +       struct ts_session *sess;
> +       unsigned long idx;
> +
> +       if (!ctxdata)
> +               return;
> +
> +       xa_for_each(&ctxdata->sess_list, idx, sess) {
> +               xa_erase(&ctxdata->sess_list, idx);
> +               kfree(sess);
> +       }
> +
> +       xa_destroy(&ctxdata->sess_list);
> +
> +       kfree(ctxdata);
> +       ctx->data = NULL;
> +}
> +
> +static int tstee_open_session(struct tee_context *ctx,
> +                             struct tee_ioctl_open_session_arg *arg,
> +                             struct tee_param *param __always_unused)
> +{
> +       struct tstee *tstee = tee_get_drvdata(ctx->teedev);
> +       struct ffa_device *ffa_dev = tstee->ffa_dev;
> +       struct ts_context_data *ctxdata = ctx->data;
> +       struct ffa_send_direct_data ffa_data;
> +       struct ts_session *sess = NULL;
> +       u32 ffa_args[FFA_DIRECT_REQ_ARG_NUM] = {};
> +       u32 sess_id;
> +       int rc;
> +
> +       ffa_args[TS_RPC_CTRL_REG] =
> +               TS_RPC_CTRL_PACK_IFACE_OPCODE(TS_RPC_MGMT_IFACE_ID,
> +                                             TS_RPC_OP_SERVICE_INFO);
> +
> +       memcpy(ffa_args + TS_RPC_SERVICE_INFO_UUID0, arg->uuid, UUID_SIZE);
> +
> +       arg_list_to_ffa_data(ffa_args, &ffa_data);
> +       rc = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &ffa_data);
> +       if (rc)
> +               return rc;
> +
> +       arg_list_from_ffa_data(&ffa_data, ffa_args);
> +
> +       if (ffa_args[TS_RPC_SERVICE_INFO_RPC_STATUS] != TS_RPC_OK)
> +               return -ENODEV;
> +
> +       if (ffa_args[TS_RPC_SERVICE_INFO_IFACE] > U8_MAX)
> +               return -EINVAL;
> +
> +       sess = kzalloc(sizeof(*sess), GFP_KERNEL);
> +       if (!sess)
> +               return -ENOMEM;
> +
> +       sess->iface_id = ffa_args[TS_RPC_SERVICE_INFO_IFACE];
> +
> +       rc = xa_alloc(&ctxdata->sess_list, &sess_id, sess, xa_limit_32b,
> +                     GFP_KERNEL);
> +       if (rc) {
> +               kfree(sess);
> +               return rc;
> +       }
> +
> +       arg->session = sess_id;
> +       arg->ret = 0;
> +
> +       return 0;
> +}
> +
> +static int tstee_close_session(struct tee_context *ctx, u32 session)
> +{
> +       struct ts_context_data *ctxdata = ctx->data;
> +       struct ts_session *sess;
> +
> +       /* Calls xa_lock() internally */
> +       sess = xa_erase(&ctxdata->sess_list, session);
> +       if (!sess)
> +               return -EINVAL;
> +
> +       kfree(sess);
> +
> +       return 0;
> +}
> +
> +static int tstee_invoke_func(struct tee_context *ctx,
> +                            struct tee_ioctl_invoke_arg *arg,
> +                            struct tee_param *param)
> +{
> +       struct tstee *tstee = tee_get_drvdata(ctx->teedev);
> +       struct ffa_device *ffa_dev = tstee->ffa_dev;
> +       struct ts_context_data *ctxdata = ctx->data;
> +       struct ffa_send_direct_data ffa_data;
> +       struct tee_shm *shm = NULL;
> +       struct ts_session *sess;
> +       u32 req_len, ffa_args[FFA_DIRECT_REQ_ARG_NUM] = {};
> +       int shm_id, rc;
> +       u8 iface_id;
> +       u64 handle;
> +       u16 opcode;
> +
> +       xa_lock(&ctxdata->sess_list);
> +       sess = xa_load(&ctxdata->sess_list, arg->session);
> +
> +       /*
> +        * Do this while holding the lock to make sure that the session wasn't
> +        * closed meanwhile
> +        */
> +       if (sess)
> +               iface_id = sess->iface_id;
> +
> +       xa_unlock(&ctxdata->sess_list);
> +       if (!sess)
> +               return -EINVAL;
> +
> +       opcode = lower_16_bits(arg->func);
> +       shm_id = lower_32_bits(param[0].u.value.a);
> +       req_len = lower_32_bits(param[0].u.value.b);
> +
> +       if (shm_id != 0) {
> +               shm = tee_shm_get_from_id(ctx, shm_id);
> +               if (IS_ERR(shm))
> +                       return PTR_ERR(shm);
> +
> +               if (shm->size < req_len) {
> +                       dev_err(&ffa_dev->dev,
> +                               "request doesn't fit into shared memory buffer\n");
> +                       rc = -EINVAL;
> +                       goto out;
> +               }
> +
> +               handle = shm->sec_world_id;
> +       } else {
> +               handle = FFA_INVALID_MEM_HANDLE;
> +       }
> +
> +       ffa_args[TS_RPC_CTRL_REG] = TS_RPC_CTRL_PACK_IFACE_OPCODE(iface_id,
> +                                                                 opcode);
> +       ffa_args[TS_RPC_SERVICE_MEM_HANDLE_LSW] = lower_32_bits(handle);
> +       ffa_args[TS_RPC_SERVICE_MEM_HANDLE_MSW] = upper_32_bits(handle);
> +       ffa_args[TS_RPC_SERVICE_REQ_LEN] = req_len;
> +       ffa_args[TS_RPC_SERVICE_CLIENT_ID] = 0;
> +
> +       arg_list_to_ffa_data(ffa_args, &ffa_data);
> +       rc = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &ffa_data);
> +       if (rc)
> +               goto out;
> +
> +       arg_list_from_ffa_data(&ffa_data, ffa_args);
> +
> +       if (ffa_args[TS_RPC_SERVICE_RPC_STATUS] != TS_RPC_OK) {
> +               dev_err(&ffa_dev->dev, "invoke_func rpc status: %d\n",
> +                       ffa_args[TS_RPC_SERVICE_RPC_STATUS]);
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +       arg->ret = ffa_args[TS_RPC_SERVICE_STATUS];
> +       if (shm && shm->size >= ffa_args[TS_RPC_SERVICE_RESP_LEN])
> +               param[0].u.value.a = ffa_args[TS_RPC_SERVICE_RESP_LEN];
> +
> +out:
> +       if (shm)
> +               tee_shm_put(shm);
> +
> +       return rc;
> +}
> +
> +static int tstee_shm_register(struct tee_context *ctx, struct tee_shm *shm,
> +                             struct page **pages, size_t num_pages,
> +                             unsigned long start __always_unused)
> +{
> +       struct tstee *tstee = tee_get_drvdata(ctx->teedev);
> +       struct ffa_device *ffa_dev = tstee->ffa_dev;
> +       struct ffa_mem_region_attributes mem_attr = {
> +               .receiver = tstee->ffa_dev->vm_id,
> +               .attrs = FFA_MEM_RW,
> +               .flag = 0,
> +       };
> +       struct ffa_mem_ops_args mem_args = {
> +               .attrs = &mem_attr,
> +               .use_txbuf = true,
> +               .nattrs = 1,
> +               .flags = 0,
> +       };
> +       struct ffa_send_direct_data ffa_data;
> +       struct sg_table sgt;
> +       u32 ffa_args[FFA_DIRECT_REQ_ARG_NUM] = {};
> +       int rc;
> +
> +       rc = sg_alloc_table_from_pages(&sgt, pages, num_pages, 0,
> +                                      num_pages * PAGE_SIZE, GFP_KERNEL);
> +       if (rc)
> +               return rc;
> +
> +       mem_args.sg = sgt.sgl;
> +       rc = ffa_dev->ops->mem_ops->memory_share(&mem_args);
> +       sg_free_table(&sgt);
> +       if (rc)
> +               return rc;
> +
> +       shm->sec_world_id = mem_args.g_handle;
> +
> +       ffa_args[TS_RPC_CTRL_REG] =
> +                       TS_RPC_CTRL_PACK_IFACE_OPCODE(TS_RPC_MGMT_IFACE_ID,
> +                                                     TS_RPC_OP_RETRIEVE_MEM);
> +       ffa_args[TS_RPC_RETRIEVE_MEM_HANDLE_LSW] =
> +                       lower_32_bits(shm->sec_world_id);
> +       ffa_args[TS_RPC_RETRIEVE_MEM_HANDLE_MSW] =
> +                       upper_32_bits(shm->sec_world_id);
> +       ffa_args[TS_RPC_RETRIEVE_MEM_TAG_LSW] = 0;
> +       ffa_args[TS_RPC_RETRIEVE_MEM_TAG_MSW] = 0;
> +
> +       arg_list_to_ffa_data(ffa_args, &ffa_data);
> +       rc = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &ffa_data);
> +       if (rc) {
> +               (void)ffa_dev->ops->mem_ops->memory_reclaim(shm->sec_world_id,
> +                                                           0);
> +               return rc;
> +       }
> +
> +       arg_list_from_ffa_data(&ffa_data, ffa_args);
> +
> +       if (ffa_args[TS_RPC_RETRIEVE_MEM_RPC_STATUS] != TS_RPC_OK) {
> +               dev_err(&ffa_dev->dev, "shm_register rpc status: %d\n",
> +                       ffa_args[TS_RPC_RETRIEVE_MEM_RPC_STATUS]);
> +               ffa_dev->ops->mem_ops->memory_reclaim(shm->sec_world_id, 0);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int tstee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
> +{
> +       struct tstee *tstee = tee_get_drvdata(ctx->teedev);
> +       struct ffa_device *ffa_dev = tstee->ffa_dev;
> +       struct ffa_send_direct_data ffa_data;
> +       u32 ffa_args[FFA_DIRECT_REQ_ARG_NUM] = {};
> +       int rc;
> +
> +       ffa_args[TS_RPC_CTRL_REG] =
> +                       TS_RPC_CTRL_PACK_IFACE_OPCODE(TS_RPC_MGMT_IFACE_ID,
> +                                                     TS_RPC_OP_RELINQ_MEM);
> +       ffa_args[TS_RPC_RELINQ_MEM_HANDLE_LSW] =
> +                       lower_32_bits(shm->sec_world_id);
> +       ffa_args[TS_RPC_RELINQ_MEM_HANDLE_MSW] =
> +                       upper_32_bits(shm->sec_world_id);
> +
> +       arg_list_to_ffa_data(ffa_args, &ffa_data);
> +       rc = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &ffa_data);
> +       if (rc)
> +               return rc;
> +       arg_list_from_ffa_data(&ffa_data, ffa_args);
> +
> +       if (ffa_args[TS_RPC_RELINQ_MEM_RPC_STATUS] != TS_RPC_OK) {
> +               dev_err(&ffa_dev->dev, "shm_unregister rpc status: %d\n",
> +                       ffa_args[TS_RPC_RELINQ_MEM_RPC_STATUS]);
> +               return -EINVAL;
> +       }
> +
> +       rc = ffa_dev->ops->mem_ops->memory_reclaim(shm->sec_world_id, 0);
> +
> +       return rc;
> +}
> +
> +static const struct tee_driver_ops tstee_ops = {
> +       .get_version = tstee_get_version,
> +       .open = tstee_open,
> +       .release = tstee_release,
> +       .open_session = tstee_open_session,
> +       .close_session = tstee_close_session,
> +       .invoke_func = tstee_invoke_func,
> +       .shm_register = tstee_shm_register,
> +       .shm_unregister = tstee_shm_unregister,

...then there isn't a need to register .shm_register and
.shm_unregister callbacks. But apart from that the driver is looking
good to me.

With above incorporated, feel free to add:

Acked-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> +};
> +
> +static const struct tee_desc tstee_desc = {
> +       .name = "tstee-clnt",
> +       .ops = &tstee_ops,
> +       .owner = THIS_MODULE,
> +};
> +
> +static int pool_op_alloc(struct tee_shm_pool *pool, struct tee_shm *shm,
> +                        size_t size, size_t align)
> +{
> +       return tee_dyn_shm_alloc_helper(shm, size, align, tstee_shm_register);
> +}
> +
> +static void pool_op_free(struct tee_shm_pool *pool, struct tee_shm *shm)
> +{
> +       tee_dyn_shm_free_helper(shm, tstee_shm_unregister);
> +}
> +
> +static void pool_op_destroy_pool(struct tee_shm_pool *pool)
> +{
> +       kfree(pool);
> +}
> +
> +static const struct tee_shm_pool_ops pool_ops = {
> +       .alloc = pool_op_alloc,
> +       .free = pool_op_free,
> +       .destroy_pool = pool_op_destroy_pool,
> +};
> +
> +static struct tee_shm_pool *tstee_create_shm_pool(void)
> +{
> +       struct tee_shm_pool *pool = kzalloc(sizeof(*pool), GFP_KERNEL);
> +
> +       if (!pool)
> +               return ERR_PTR(-ENOMEM);
> +
> +       pool->ops = &pool_ops;
> +
> +       return pool;
> +}
> +
> +static bool tstee_check_rpc_compatible(struct ffa_device *ffa_dev)
> +{
> +       struct ffa_send_direct_data ffa_data;
> +       u32 ffa_args[FFA_DIRECT_REQ_ARG_NUM] = {};
> +
> +       ffa_args[TS_RPC_CTRL_REG] =
> +                       TS_RPC_CTRL_PACK_IFACE_OPCODE(TS_RPC_MGMT_IFACE_ID,
> +                                                     TS_RPC_OP_GET_VERSION);
> +
> +       arg_list_to_ffa_data(ffa_args, &ffa_data);
> +       if (ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &ffa_data))
> +               return false;
> +
> +       arg_list_from_ffa_data(&ffa_data, ffa_args);
> +
> +       return ffa_args[TS_RPC_GET_VERSION_RESP] == TS_RPC_PROTOCOL_VERSION;
> +}
> +
> +static int tstee_probe(struct ffa_device *ffa_dev)
> +{
> +       struct tstee *tstee;
> +       int rc;
> +
> +       ffa_dev->ops->msg_ops->mode_32bit_set(ffa_dev);
> +
> +       if (!tstee_check_rpc_compatible(ffa_dev))
> +               return -EINVAL;
> +
> +       tstee = kzalloc(sizeof(*tstee), GFP_KERNEL);
> +       if (!tstee)
> +               return -ENOMEM;
> +
> +       tstee->ffa_dev = ffa_dev;
> +
> +       tstee->pool = tstee_create_shm_pool();
> +       if (IS_ERR(tstee->pool)) {
> +               rc = PTR_ERR(tstee->pool);
> +               tstee->pool = NULL;
> +               goto err_free_tstee;
> +       }
> +
> +       tstee->teedev = tee_device_alloc(&tstee_desc, NULL, tstee->pool, tstee);
> +       if (IS_ERR(tstee->teedev)) {
> +               rc = PTR_ERR(tstee->teedev);
> +               tstee->teedev = NULL;
> +               goto err_free_pool;
> +       }
> +
> +       rc = tee_device_register(tstee->teedev);
> +       if (rc)
> +               goto err_unreg_teedev;
> +
> +       ffa_dev_set_drvdata(ffa_dev, tstee);
> +
> +       return 0;
> +
> +err_unreg_teedev:
> +       tee_device_unregister(tstee->teedev);
> +err_free_pool:
> +       tee_shm_pool_free(tstee->pool);
> +err_free_tstee:
> +       kfree(tstee);
> +       return rc;
> +}
> +
> +static void tstee_remove(struct ffa_device *ffa_dev)
> +{
> +       struct tstee *tstee = ffa_dev->dev.driver_data;
> +
> +       tee_device_unregister(tstee->teedev);
> +       tee_shm_pool_free(tstee->pool);
> +       kfree(tstee);
> +}
> +
> +static const struct ffa_device_id tstee_device_ids[] = {
> +       /* TS RPC protocol UUID: bdcd76d7-825e-4751-963b-86d4f84943ac */
> +       { TS_RPC_UUID },
> +       {}
> +};
> +
> +static struct ffa_driver tstee_driver = {
> +       .name = "arm_tstee",
> +       .probe = tstee_probe,
> +       .remove = tstee_remove,
> +       .id_table = tstee_device_ids,
> +};
> +
> +module_ffa_driver(tstee_driver);
> +
> +MODULE_AUTHOR("Balint Dobszay <balint.dobszay@arm.com>");
> +MODULE_DESCRIPTION("Arm Trusted Services TEE driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/tee/tstee/tstee_private.h b/drivers/tee/tstee/tstee_private.h
> new file mode 100644
> index 000000000000..8e58725b57eb
> --- /dev/null
> +++ b/drivers/tee/tstee/tstee_private.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023, Arm Limited
> + */
> +
> +#ifndef TSTEE_PRIVATE_H
> +#define TSTEE_PRIVATE_H
> +
> +#include <linux/arm_ffa.h>
> +#include <linux/bitops.h>
> +#include <linux/tee_core.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +#include <linux/xarray.h>
> +
> +/*
> + * The description of the ABI implemented in this file is available at
> + * https://trusted-services.readthedocs.io/en/v1.0.0/developer/service-access-protocols.html#abi
> + */
> +
> +/* UUID of this protocol */
> +#define TS_RPC_UUID UUID_INIT(0xbdcd76d7, 0x825e, 0x4751, \
> +                             0x96, 0x3b, 0x86, 0xd4, 0xf8, 0x49, 0x43, 0xac)
> +
> +/* Protocol version*/
> +#define TS_RPC_PROTOCOL_VERSION                (1)
> +
> +/* Status codes */
> +#define TS_RPC_OK                      (0)
> +
> +/* RPC control register */
> +#define TS_RPC_CTRL_REG                        (0)
> +#define OPCODE_MASK                    GENMASK(15, 0)
> +#define IFACE_ID_MASK                  GENMASK(23, 16)
> +#define TS_RPC_CTRL_OPCODE(x)          ((u16)(FIELD_GET(OPCODE_MASK, (x))))
> +#define TS_RPC_CTRL_IFACE_ID(x)                ((u8)(FIELD_GET(IFACE_ID_MASK, (x))))
> +#define TS_RPC_CTRL_PACK_IFACE_OPCODE(i, o)    \
> +       (FIELD_PREP(IFACE_ID_MASK, (i)) | FIELD_PREP(OPCODE_MASK, (o)))
> +#define TS_RPC_CTRL_SAP_RC             BIT(30)
> +#define TS_RPC_CTRL_SAP_ERR            BIT(31)
> +
> +/* Interface ID for RPC management operations */
> +#define TS_RPC_MGMT_IFACE_ID           (0xff)
> +
> +/* Management calls */
> +#define TS_RPC_OP_GET_VERSION          (0x0000)
> +#define TS_RPC_GET_VERSION_RESP                (1)
> +
> +#define TS_RPC_OP_RETRIEVE_MEM         (0x0001)
> +#define TS_RPC_RETRIEVE_MEM_HANDLE_LSW (1)
> +#define TS_RPC_RETRIEVE_MEM_HANDLE_MSW (2)
> +#define TS_RPC_RETRIEVE_MEM_TAG_LSW    (3)
> +#define TS_RPC_RETRIEVE_MEM_TAG_MSW    (4)
> +#define TS_RPC_RETRIEVE_MEM_RPC_STATUS (1)
> +
> +#define TS_RPC_OP_RELINQ_MEM           (0x0002)
> +#define TS_RPC_RELINQ_MEM_HANDLE_LSW   (1)
> +#define TS_RPC_RELINQ_MEM_HANDLE_MSW   (2)
> +#define TS_RPC_RELINQ_MEM_RPC_STATUS   (1)
> +
> +#define TS_RPC_OP_SERVICE_INFO         (0x0003)
> +#define TS_RPC_SERVICE_INFO_UUID0      (1)
> +#define TS_RPC_SERVICE_INFO_UUID1      (2)
> +#define TS_RPC_SERVICE_INFO_UUID2      (3)
> +#define TS_RPC_SERVICE_INFO_UUID3      (4)
> +#define TS_RPC_SERVICE_INFO_RPC_STATUS (1)
> +#define TS_RPC_SERVICE_INFO_IFACE      (2)
> +
> +/* Service call */
> +#define TS_RPC_SERVICE_MEM_HANDLE_LSW  (1)
> +#define TS_RPC_SERVICE_MEM_HANDLE_MSW  (2)
> +#define TS_RPC_SERVICE_REQ_LEN         (3)
> +#define TS_RPC_SERVICE_CLIENT_ID       (4)
> +#define TS_RPC_SERVICE_RPC_STATUS      (1)
> +#define TS_RPC_SERVICE_STATUS          (2)
> +#define TS_RPC_SERVICE_RESP_LEN                (3)
> +
> +struct tstee {
> +       struct ffa_device *ffa_dev;
> +       struct tee_device *teedev;
> +       struct tee_shm_pool *pool;
> +};
> +
> +struct ts_session {
> +       u8 iface_id;
> +};
> +
> +struct ts_context_data {
> +       struct xarray sess_list;
> +};
> +
> +#endif /* TSTEE_PRIVATE_H */
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index 23e57164693c..d0430bee8292 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -56,6 +56,7 @@
>   */
>  #define TEE_IMPL_ID_OPTEE      1
>  #define TEE_IMPL_ID_AMDTEE     2
> +#define TEE_IMPL_ID_TSTEE      3
>
>  /*
>   * OP-TEE specific capabilities
> --
> 2.34.1
>

