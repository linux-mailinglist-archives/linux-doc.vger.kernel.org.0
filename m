Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CABD33EE1
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jun 2019 08:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfFDGQF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Jun 2019 02:16:05 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:35471 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbfFDGQF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jun 2019 02:16:05 -0400
Received: by mail-ua1-f68.google.com with SMTP id r7so7390044ual.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Jun 2019 23:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ewJ5Ta1tqLfBar5/v+xvEoWC9eNsUmqmktS5BAL1v4=;
        b=iAY6QNzYUMzpOTEij5DTCCeCGFdWX+1XW4Dl6XBGxs/uh5fTaQLzw6gsvM/YTY8yAy
         Vuhlb2N9QIGzFB7p+uNx2agmVvaT0YrGwlkrznGcMV/BJ3vjZOwYfT91ObF0HilpxUvZ
         ushwgIFUHzqKwzktGS+tWtQ9LoozyQTDc6pP8a8A9JtajvFy+BbT9nNuH9J2LXw3mFkK
         ZXvk9WhmNFswi5rnMmyNWd3V0uXNtDBtdeNRgDQiPpT+QtzQvawBc1TGicUozSJq1H++
         AztvwhH8/VO7uNnHicJVEEcNqS0BnVhEQg2NzDFigV8i5drGv7mrWaERSiLIZElL+w43
         pyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ewJ5Ta1tqLfBar5/v+xvEoWC9eNsUmqmktS5BAL1v4=;
        b=el0n7Ql/2J7/meWl4K61aKkdlu6Bd8a9Mhzrcm6w+nRAtlra9moBzcvLL9Xbvtp+We
         9xAdOMFdq/xBilL4GTu2/HnuJlTRXenNXxJvLxA1DIehKtvUebEBFQBWHPeQjimGFQ7Z
         auDqii8e946sq44J4T3eYG177CuIK5NG2zTsb9ISQ4HFVYMWvb6txu8GZ1kegdvhJHX1
         R7v9ByVUwiOAcyoiohiVHlFzhgs1tEGgzSJ0r/gDp8qEHfd0WUuLzsDcT9vEq1jwxyOJ
         r2efZMSmT1iIhQYJxE2tjO9QAxZt9npUHRPJhFsGPRr5Ect+u2ZCl2RNdcHoU010wmJw
         i9pA==
X-Gm-Message-State: APjAAAXEADohF3NCgKSul7L6I9eqpSH0gGR3JD21gRCI2k0l0SJeCxov
        d+N0fAcQJQEgs/SMQezbqMlWuCrxpdG6QI3oPeIcmA==
X-Google-Smtp-Source: APXvYqwKCyV+NOE8sEEcdPlQH+YXFJSn9SnFgvpkYXxbZf0ZGhvdtjM/bzR2bl6kcomUGRSbMbUBLpCYYqPwVEYMQ6Y=
X-Received: by 2002:ab0:238a:: with SMTP id b10mr9118247uan.52.1559628964082;
 Mon, 03 Jun 2019 23:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190530152758.16628-1-sashal@kernel.org> <20190530152758.16628-2-sashal@kernel.org>
In-Reply-To: <20190530152758.16628-2-sashal@kernel.org>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Tue, 4 Jun 2019 11:45:52 +0530
Message-ID: <CAFA6WYM1NrghG9qxUhrm76kopvBx9nmCL9XnRs11ysb2Yr0+Qw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] fTPM: firmware TPM running in TEE
To:     Sasha Levin <sashal@kernel.org>
Cc:     peterhuewe@gmx.de,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        jgg@ziepe.ca, corbet@lwn.net,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org,
        Microsoft Linux Kernel List <linux-kernel@microsoft.com>,
        Thirupathaiah Annapureddy <thiruan@microsoft.com>,
        "Bryan Kelly (CSI)" <bryankel@microsoft.com>,
        tee-dev@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 30 May 2019 at 20:58, Sasha Levin <sashal@kernel.org> wrote:
>
> This patch adds support for a software-only implementation of a TPM
> running in TEE.
>
> There is extensive documentation of the design here:
> https://www.microsoft.com/en-us/research/publication/ftpm-software-implementation-tpm-chip/ .
>
> As well as reference code for the firmware available here:
> https://github.com/Microsoft/ms-tpm-20-ref/tree/master/Samples/ARM32-FirmwareTPM
>
> Signed-off-by: Thirupathaiah Annapureddy <thiruan@microsoft.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/char/tpm/Kconfig        |   5 +
>  drivers/char/tpm/Makefile       |   1 +
>  drivers/char/tpm/tpm_ftpm_tee.c | 380 ++++++++++++++++++++++++++++++++
>  drivers/char/tpm/tpm_ftpm_tee.h |  40 ++++
>  4 files changed, 426 insertions(+)
>  create mode 100644 drivers/char/tpm/tpm_ftpm_tee.c
>  create mode 100644 drivers/char/tpm/tpm_ftpm_tee.h
>
> diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
> index f3e4bc490cf05..8bc9a56cade14 100644
> --- a/drivers/char/tpm/Kconfig
> +++ b/drivers/char/tpm/Kconfig
> @@ -163,6 +163,11 @@ config TCG_VTPM_PROXY
>           /dev/vtpmX and a server-side file descriptor on which the vTPM
>           can receive commands.
>
> +config TCG_FTPM_TEE
> +       tristate "TEE based fTPM Interface"
> +       depends on TEE && OPTEE
> +       ---help---
> +         This driver proxies for fTPM running in TEE
>
>  source "drivers/char/tpm/st33zp24/Kconfig"
>  endif # TCG_TPM
> diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
> index a01c4cab902a6..c354cdff9c625 100644
> --- a/drivers/char/tpm/Makefile
> +++ b/drivers/char/tpm/Makefile
> @@ -33,3 +33,4 @@ obj-$(CONFIG_TCG_TIS_ST33ZP24) += st33zp24/
>  obj-$(CONFIG_TCG_XEN) += xen-tpmfront.o
>  obj-$(CONFIG_TCG_CRB) += tpm_crb.o
>  obj-$(CONFIG_TCG_VTPM_PROXY) += tpm_vtpm_proxy.o
> +obj-$(CONFIG_TCG_FTPM_TEE) += tpm_ftpm_tee.o
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
> new file mode 100644
> index 0000000000000..f926b1287988b
> --- /dev/null
> +++ b/drivers/char/tpm/tpm_ftpm_tee.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) Microsoft Corporation
> + *
> + * Implements a firmware TPM as described here:
> + * https://www.microsoft.com/en-us/research/publication/ftpm-software-implementation-tpm-chip/
> + *
> + * A reference implementation is available here:
> + * https://github.com/microsoft/ms-tpm-20-ref/tree/master/Samples/ARM32-FirmwareTPM/optee_ta/fTPM
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/tee_drv.h>
> +#include <linux/tpm.h>
> +#include <linux/uuid.h>
> +
> +#include "tpm.h"
> +#include "tpm_ftpm_tee.h"
> +
> +#define DRIVER_NAME "ftpm-tee"
> +
> +/*
> + * TA_FTPM_UUID: BC50D971-D4C9-42C4-82CB-343FB7F37896
> + *
> + * Randomly generated, and must correspond to the GUID on the TA side.
> + * Defined here in the reference implementation:
> + * https://github.com/microsoft/ms-tpm-20-ref/blob/master/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/include/fTPM.h#L42
> + */
> +
> +static const uuid_t ftpm_ta_uuid =
> +       UUID_INIT(0xBC50D971, 0xD4C9, 0x42C4,
> +                 0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96);
> +
> +/**
> + * ftpm_tee_tpm_op_recv - retrieve fTPM response.
> + *
> + * @chip: the tpm_chip description as specified in driver/char/tpm/tpm.h.
> + * @buf: the buffer to store data.
> + * @count: the number of bytes to read.
> + *
> + * Return:
> + *     In case of success the number of bytes received.
> + *     On failure, -errno.
> + */
> +static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
> +{
> +       struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
> +       size_t len;
> +
> +       len = pvt_data->resp_len;
> +       if (count < len) {
> +               dev_err(&chip->dev,
> +                       "%s:Invalid size in recv: count=%zd, resp_len=%zd\n",
> +                       __func__, count, len);
> +               return -EIO;
> +       }
> +
> +       memcpy(buf, pvt_data->resp_buf, len);
> +       pvt_data->resp_len = 0;
> +
> +       return len;
> +}
> +
> +/**
> + * ftpm_tee_tpm_op_send - send TPM commands through the TEE shared memory.
> + *
> + * @chip: the tpm_chip description as specified in driver/char/tpm/tpm.h
> + * @buf: the buffer to send.
> + * @len: the number of bytes to send.
> + *
> + * Return:
> + *     In case of success, returns 0.
> + *     On failure, -errno
> + */
> +static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len)
> +{
> +       struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
> +       size_t resp_len;
> +       int rc;
> +       u8 *temp_buf;
> +       struct tpm_header *resp_header;
> +       struct tee_ioctl_invoke_arg transceive_args;
> +       struct tee_param command_params[4];
> +       struct tee_shm *shm = pvt_data->shm;
> +
> +       if (len > MAX_COMMAND_SIZE) {
> +               dev_err(&chip->dev,
> +                       "%s:len=%zd exceeds MAX_COMMAND_SIZE supported by fTPM TA\n",
> +                       __func__, len);
> +               return -EIO;
> +       }
> +
> +       memset(&transceive_args, 0, sizeof(transceive_args));
> +       memset(command_params, 0, sizeof(command_params));
> +       pvt_data->resp_len = 0;
> +
> +       /* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of fTPM TA */
> +       transceive_args = (struct tee_ioctl_invoke_arg) {
> +               .func = FTPM_OPTEE_TA_SUBMIT_COMMAND,
> +               .session = pvt_data->session,
> +               .num_params = 4,
> +       };
> +
> +       /* Fill FTPM_OPTEE_TA_SUBMIT_COMMAND parameters */
> +       command_params[0] = (struct tee_param) {
> +               .attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
> +               .u.memref = {
> +                       .shm = shm,
> +                       .size = len,
> +                       .shm_offs = 0,
> +               },
> +       };
> +
> +       temp_buf = tee_shm_get_va(shm, 0);
> +       if (IS_ERR(temp_buf)) {
> +               dev_err(&chip->dev, "%s:tee_shm_get_va failed for transmit\n",
> +                       __func__);
> +               return PTR_ERR(temp_buf);
> +       }
> +       memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
> +
> +       memcpy(temp_buf, buf, len);
> +
> +       command_params[1] = (struct tee_param) {
> +               .attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> +               .u.memref = {
> +                       .shm = shm,
> +                       .size = MAX_RESPONSE_SIZE,
> +                       .shm_offs = MAX_COMMAND_SIZE,
> +               },
> +       };
> +
> +       rc = tee_client_invoke_func(pvt_data->ctx, &transceive_args,
> +                                       command_params);
> +       if ((rc < 0) || (transceive_args.ret != 0)) {
> +               dev_err(&chip->dev, "%s:SUBMIT_COMMAND invoke error: 0x%x\n",
> +                       __func__, transceive_args.ret);
> +               return (rc < 0) ? rc : transceive_args.ret;
> +       }
> +
> +       temp_buf = tee_shm_get_va(shm, command_params[1].u.memref.shm_offs);
> +       if (IS_ERR(temp_buf)) {
> +               dev_err(&chip->dev, "%s:tee_shm_get_va failed for receive\n",
> +                       __func__);
> +               return PTR_ERR(temp_buf);
> +       }
> +
> +       resp_header = (struct tpm_header *)temp_buf;
> +       resp_len = be32_to_cpu(resp_header->length);
> +
> +       /* sanity check resp_len */
> +       if (resp_len < TPM_HEADER_SIZE) {
> +               dev_err(&chip->dev, "%s:tpm response header too small\n",
> +                       __func__);
> +               return -EIO;
> +       }
> +       if (resp_len > MAX_RESPONSE_SIZE) {
> +               dev_err(&chip->dev,
> +                       "%s:resp_len=%zd exceeds MAX_RESPONSE_SIZE\n",
> +                       __func__, resp_len);
> +               return -EIO;
> +       }
> +
> +       /* sanity checks look good, cache the response */
> +       memcpy(pvt_data->resp_buf, temp_buf, resp_len);
> +       pvt_data->resp_len = resp_len;
> +
> +       return 0;
> +}
> +
> +static void ftpm_tee_tpm_op_cancel(struct tpm_chip *chip)
> +{
> +       /* not supported */
> +}
> +
> +static u8 ftpm_tee_tpm_op_status(struct tpm_chip *chip)
> +{
> +       return 0;
> +}
> +
> +static bool ftpm_tee_tpm_req_canceled(struct tpm_chip *chip, u8 status)
> +{
> +       return 0;
> +}
> +
> +static const struct tpm_class_ops ftpm_tee_tpm_ops = {
> +       .flags = TPM_OPS_AUTO_STARTUP,
> +       .recv = ftpm_tee_tpm_op_recv,
> +       .send = ftpm_tee_tpm_op_send,
> +       .cancel = ftpm_tee_tpm_op_cancel,
> +       .status = ftpm_tee_tpm_op_status,
> +       .req_complete_mask = 0,
> +       .req_complete_val = 0,
> +       .req_canceled = ftpm_tee_tpm_req_canceled,
> +};
> +
> +/*
> + * Check whether this driver supports the fTPM TA in the TEE instance
> + * represented by the params (ver/data) to this function.
> + */
> +static int ftpm_tee_match(struct tee_ioctl_version_data *ver, const void *data)
> +{
> +       /*
> +        * Currently this driver only support GP Complaint OPTEE based fTPM TA
> +        */
> +       if ((ver->impl_id == TEE_IMPL_ID_OPTEE) &&
> +               (ver->gen_caps & TEE_GEN_CAP_GP))
> +               return 1;
> +       else
> +               return 0;
> +}
> +
> +/*
> + * Undo what has been done in ftpm_tee_probe
> + */
> +static void ftpm_tee_deinit(struct ftpm_tee_private *pvt_data)
> +{
> +       /* Release the chip */
> +       tpm_chip_unregister(pvt_data->chip);
> +
> +       /* frees chip */
> +       if (pvt_data->chip)
> +               put_device(&pvt_data->chip->dev);
> +
> +       if (pvt_data->ctx) {
> +               /* Free the shared memory pool */
> +               tee_shm_free(pvt_data->shm);
> +
> +               /* close the existing session with fTPM TA*/
> +               tee_client_close_session(pvt_data->ctx, pvt_data->session);
> +
> +               /* close the context with TEE driver */
> +               tee_client_close_context(pvt_data->ctx);
> +       }
> +
> +       /* memory allocated with devm_kzalloc() is freed automatically */
> +}
> +
> +/**
> + * ftpm_tee_probe - initialize the fTPM
> + * @pdev: the platform_device description.
> + *
> + * Return:
> + *     On success, 0. On failure, -errno.
> + */
> +static int ftpm_tee_probe(struct platform_device *pdev)
> +{
> +       int rc;
> +       struct tpm_chip *chip;
> +       struct device *dev = &pdev->dev;
> +       struct ftpm_tee_private *pvt_data = NULL;
> +       struct tee_ioctl_open_session_arg sess_arg;
> +
> +       pvt_data = devm_kzalloc(dev, sizeof(struct ftpm_tee_private),
> +                               GFP_KERNEL);
> +       if (!pvt_data)
> +               return -ENOMEM;
> +
> +       dev_set_drvdata(dev, pvt_data);
> +
> +       /* Open context with TEE driver */
> +       pvt_data->ctx = tee_client_open_context(NULL, ftpm_tee_match, NULL,
> +                                               NULL);
> +       if (IS_ERR(pvt_data->ctx)) {
> +               dev_err(dev, "%s:tee_client_open_context failed\n", __func__);

Is this well tested? I see this misleading error multiple times as
follows although TEE driver works pretty well.

Module built with "CONFIG_TCG_FTPM_TEE=y"

[    1.436878] ftpm-tee tpm@0: ftpm_tee_probe:tee_client_open_context failed
[    1.509471] ftpm-tee tpm@0: ftpm_tee_probe:tee_client_open_context failed
[    1.517268] ftpm-tee tpm@0: ftpm_tee_probe:tee_client_open_context failed
[    1.525596] ftpm-tee tpm@0: ftpm_tee_probe:tee_client_open_context failed

-Sumit

> +               return -EPROBE_DEFER;
> +       }
> +
> +       /* Open a session with fTPM TA */
> +       memset(&sess_arg, 0, sizeof(sess_arg));
> +       memcpy(sess_arg.uuid, ftpm_ta_uuid.b, TEE_IOCTL_UUID_LEN);
> +       sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
> +       sess_arg.num_params = 0;
> +
> +       rc = tee_client_open_session(pvt_data->ctx, &sess_arg, NULL);
> +       if ((rc < 0) || (sess_arg.ret != 0)) {
> +               dev_err(dev, "%s:tee_client_open_session failed, err=%x\n",
> +                       __func__, sess_arg.ret);
> +               rc = -EINVAL;
> +               goto out_tee_session;
> +       }
> +       pvt_data->session = sess_arg.session;
> +
> +       /* Allocate dynamic shared memory with fTPM TA */
> +       pvt_data->shm = tee_shm_alloc(pvt_data->ctx,
> +                               (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE),
> +                               TEE_SHM_MAPPED | TEE_SHM_DMA_BUF);
> +       if (IS_ERR(pvt_data->shm)) {
> +               dev_err(dev, "%s:tee_shm_alloc failed\n", __func__);
> +               rc = -ENOMEM;
> +               goto out_shm_alloc;
> +       }
> +
> +       /* Allocate new struct tpm_chip instance */
> +       chip = tpm_chip_alloc(dev, &ftpm_tee_tpm_ops);
> +       if (IS_ERR(chip)) {
> +               dev_err(dev, "%s:tpm_chip_alloc failed\n", __func__);
> +               rc = PTR_ERR(chip);
> +               goto out_chip_alloc;
> +       }
> +
> +       pvt_data->chip = chip;
> +       pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2;
> +
> +       /* Create a character device for the fTPM */
> +       rc = tpm_chip_register(pvt_data->chip);
> +       if (rc) {
> +               dev_err(dev, "%s:tpm_chip_register failed with rc=%d\n",
> +                       __func__, rc);
> +               goto out_chip;
> +       }
> +
> +       return 0;
> +
> +out_chip:
> +       put_device(&pvt_data->chip->dev);
> +out_chip_alloc:
> +       tee_shm_free(pvt_data->shm);
> +out_shm_alloc:
> +       tee_client_close_session(pvt_data->ctx, pvt_data->session);
> +out_tee_session:
> +       tee_client_close_context(pvt_data->ctx);
> +
> +       return rc;
> +}
> +
> +/**
> + * ftpm_tee_remove - remove the TPM device
> + * @pdev: the platform_device description.
> + *
> + * Return:
> + *     0 in case of success.
> + */
> +static int ftpm_tee_remove(struct platform_device *pdev)
> +{
> +       struct ftpm_tee_private *pvt_data = dev_get_drvdata(&pdev->dev);
> +
> +       /* Release the chip */
> +       tpm_chip_unregister(pvt_data->chip);
> +
> +       /* frees chip */
> +       put_device(&pvt_data->chip->dev);
> +
> +       /* Free the shared memory pool */
> +       tee_shm_free(pvt_data->shm);
> +
> +       /* close the existing session with fTPM TA*/
> +       tee_client_close_session(pvt_data->ctx, pvt_data->session);
> +
> +       /* close the context with TEE driver */
> +       tee_client_close_context(pvt_data->ctx);
> +
> +        /* memory allocated with devm_kzalloc() is freed automatically */
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id of_ftpm_tee_ids[] = {
> +       { .compatible = "microsoft,ftpm" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, of_ftpm_tee_ids);
> +
> +static struct platform_driver ftpm_tee_driver = {
> +       .driver = {
> +               .name = DRIVER_NAME,
> +               .of_match_table = of_match_ptr(of_ftpm_tee_ids),
> +       },
> +       .probe = ftpm_tee_probe,
> +       .remove = ftpm_tee_remove,
> +};
> +
> +module_platform_driver(ftpm_tee_driver);
> +
> +MODULE_AUTHOR("Thirupathaiah Annapureddy <thiruan@microsoft.com>");
> +MODULE_DESCRIPTION("TPM Driver for fTPM TA in TEE");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.h b/drivers/char/tpm/tpm_ftpm_tee.h
> new file mode 100644
> index 0000000000000..b09ee7be45459
> --- /dev/null
> +++ b/drivers/char/tpm/tpm_ftpm_tee.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) Microsoft Corporation
> + */
> +
> +#ifndef __TPM_FTPM_TEE_H__
> +#define __TPM_FTPM_TEE_H__
> +
> +#include <linux/tee_drv.h>
> +#include <linux/tpm.h>
> +#include <linux/uuid.h>
> +
> +/* The TAFs ID implemented in this TA */
> +#define FTPM_OPTEE_TA_SUBMIT_COMMAND  (0)
> +#define FTPM_OPTEE_TA_EMULATE_PPI     (1)
> +
> +/* max. buffer size supported by fTPM  */
> +#define  MAX_COMMAND_SIZE       4096
> +#define  MAX_RESPONSE_SIZE      4096
> +
> +/**
> + * struct ftpm_tee_private - fTPM's private data
> + * @chip:     struct tpm_chip instance registered with tpm framework.
> + * @state:    internal state
> + * @session:  fTPM TA session identifier.
> + * @resp_len: cached response buffer length.
> + * @resp_buf: cached response buffer.
> + * @ctx:      TEE context handler.
> + * @shm:      Memory pool shared with fTPM TA in TEE.
> + */
> +struct ftpm_tee_private {
> +       struct tpm_chip *chip;
> +       u32 session;
> +       size_t resp_len;
> +       u8 resp_buf[MAX_RESPONSE_SIZE];
> +       struct tee_context *ctx;
> +       struct tee_shm *shm;
> +};
> +
> +#endif /* __TPM_FTPM_TEE_H__ */
> --
> 2.20.1
>
