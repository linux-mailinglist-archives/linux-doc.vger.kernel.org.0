Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F12242D3FC
	for <lists+linux-doc@lfdr.de>; Thu, 14 Oct 2021 09:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbhJNHrl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 14 Oct 2021 03:47:41 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:51028 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229551AbhJNHrk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Oct 2021 03:47:40 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19E7OBDZ015669;
        Thu, 14 Oct 2021 09:45:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=AteCvuyAJ2rDfYN7kHL5rJ2Ghv35YuaE3N1sonzQglA=;
 b=zXcPq1j/qY2R56OwiYSHuMkC7TkG9cvLidbOUw5u5FTDBjaf2hNIKtraREIF8OPeWaSv
 dere4jWtbcCD1m2rAqI7T2Ng+27Bq4q8k2CWWqP+hh04JkhxGNdjs4rtPBOVFdKNUr+L
 1oTkubRG6DDQLZ5SEJxuitnlZ8v9Pf865N4jhf+pw58d0QzypVde9AyrHKK4YBpsP6Tu
 e6So1kKA6ga9F9WYjRISJU7mExXxZ3eg3rEQ/TTUFwGovlpxH8Kj1jSw6U6nfvk0vmsA
 GPuugmVOZYTIx28ZNL12vEUPeMSOuCbTz/gkZoheaqdszH88wfGpNNGPw1ZQFl+MEdeD Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bp9estnvk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 Oct 2021 09:45:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB05210002A;
        Thu, 14 Oct 2021 09:45:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CCF582128B1;
        Thu, 14 Oct 2021 09:45:08 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 14 Oct
 2021 09:45:07 +0200
Subject: Re: [PATCH v9 2/2] tty: add rpmsg driver
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Suman Anna <s-anna@ti.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>
References: <20211008153446.23188-1-arnaud.pouliquen@foss.st.com>
 <20211008153446.23188-3-arnaud.pouliquen@foss.st.com>
 <20211012180723.GC4010675@p14s>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <0439d5ea-0ef0-e715-0558-15bb23e042ea@foss.st.com>
Date:   Thu, 14 Oct 2021 09:45:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012180723.GC4010675@p14s>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-14_02,2021-10-14_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Mathieu,

On 10/12/21 8:07 PM, Mathieu Poirier wrote:
> On Fri, Oct 08, 2021 at 05:34:46PM +0200, Arnaud Pouliquen wrote:
>> This driver exposes a standard TTY interface on top of the rpmsg
>> framework through a rpmsg service.
>>
>> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
>> per rpmsg endpoint.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>
>> ---
>> Update from V8
>> => Update based on Greg Greg Kroah-Hartman comments:
>>  - add module name in kconfig
>>  - remove the tty_rpmsg.rst documentation file and add description in
>>    rpmsg_tty.c.
>>  - rpmsg_tty.c remove of useless check and logs.
>>  - print err log instead of debug log on truncated RX buffer.
>> ---
>>  drivers/tty/Kconfig     |  12 ++
>>  drivers/tty/Makefile    |   1 +
>>  drivers/tty/rpmsg_tty.c | 275 ++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 288 insertions(+)
>>  create mode 100644 drivers/tty/rpmsg_tty.c
>>
>> diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
>> index 23cc988c68a4..cc30ff93e2e4 100644
>> --- a/drivers/tty/Kconfig
>> +++ b/drivers/tty/Kconfig
>> @@ -368,6 +368,18 @@ config VCC
>>  
>>  source "drivers/tty/hvc/Kconfig"
>>  
>> +config RPMSG_TTY
>> +	tristate "RPMSG tty driver"
>> +	depends on RPMSG
>> +	help
>> +	  Say y here to export rpmsg endpoints as tty devices, usually found
>> +	  in /dev/ttyRPMSGx.
>> +	  This makes it possible for user-space programs to send and receive
>> +	  rpmsg messages as a standard tty protocol.
>> +
>> +	  To compile this driver as a module, choose M here: the module will be
>> +	  called rpmsg_tty.
>> +
>>  endif # TTY
>>  
>>  source "drivers/tty/serdev/Kconfig"
>> diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
>> index a2bd75fbaaa4..07aca5184a55 100644
>> --- a/drivers/tty/Makefile
>> +++ b/drivers/tty/Makefile
>> @@ -26,5 +26,6 @@ obj-$(CONFIG_PPC_EPAPR_HV_BYTECHAN) += ehv_bytechan.o
>>  obj-$(CONFIG_GOLDFISH_TTY)	+= goldfish.o
>>  obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += mips_ejtag_fdc.o
>>  obj-$(CONFIG_VCC)		+= vcc.o
>> +obj-$(CONFIG_RPMSG_TTY)		+= rpmsg_tty.o
>>  
>>  obj-y += ipwireless/
>> diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
>> new file mode 100644
>> index 000000000000..226a13f6ef94
>> --- /dev/null
>> +++ b/drivers/tty/rpmsg_tty.c
>> @@ -0,0 +1,275 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2021 STMicroelectronics - All Rights Reserved
>> + *
>> + * The rpmsg tty driver implements serial communication on the RPMsg bus to makes
>> + * possible for user-space programs to send and receive rpmsg messages as a standard
>> + * tty protocol.
>> + *
>> + * The remote processor can instantiate a new tty by requesting a "rpmsg-tty" RPMsg service.
>> + * The "rpmsg-tty" service is directly used for data exchange. No flow control is implemented yet.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/rpmsg.h>
>> +#include <linux/slab.h>
>> +#include <linux/tty.h>
>> +#include <linux/tty_flip.h>
>> +
>> +#define MAX_TTY_RPMSG	32
>> +
>> +static DEFINE_IDR(tty_idr);	/* tty instance id */
>> +static DEFINE_MUTEX(idr_lock);	/* protects tty_idr */
>> +
>> +static struct tty_driver *rpmsg_tty_driver;
>> +
>> +struct rpmsg_tty_port {
>> +	struct tty_port		port;	 /* TTY port data */
>> +	int			id;	 /* TTY rpmsg index */
>> +	struct rpmsg_device	*rpdev;	 /* rpmsg device */
>> +};
>> +
>> +static int rpmsg_tty_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
>> +{
>> +	struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
>> +	int copied;
>> +
>> +	if (!len)
>> +		return -EINVAL;
>> +	copied = tty_insert_flip_string(&cport->port, data, len);
>> +	if (copied != len)
>> +		dev_err(&rpdev->dev, "Trunc buffer: available space is %d\n",
>> +			copied);

Here as the rpmsg callback return is not tested we need to log something because
data is lost. I will add the ratelimited version to limit logs.

>> +	tty_flip_buffer_push(&cport->port);
>> +
>> +	return 0;
>> +}
>> +
>> +static int rpmsg_tty_install(struct tty_driver *driver, struct tty_struct *tty)
>> +{
>> +	struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
>> +
>> +	tty->driver_data = cport;
>> +
>> +	return tty_port_install(&cport->port, driver, tty);
>> +}
>> +
>> +static int rpmsg_tty_open(struct tty_struct *tty, struct file *filp)
>> +{
>> +	return tty_port_open(tty->port, tty, filp);
>> +}
>> +
>> +static void rpmsg_tty_close(struct tty_struct *tty, struct file *filp)
>> +{
>> +	return tty_port_close(tty->port, tty, filp);
>> +}
>> +
>> +static int rpmsg_tty_write(struct tty_struct *tty, const u8 *buf, int len)
>> +{
>> +	struct rpmsg_tty_port *cport = tty->driver_data;
>> +	struct rpmsg_device *rpdev;
>> +	int msg_max_size, msg_size;
>> +	int ret;
>> +
>> +	rpdev = cport->rpdev;
>> +
>> +	msg_max_size = rpmsg_get_mtu(rpdev->ept);
>> +	if (msg_max_size < 0)
>> +		return msg_max_size;
>> +
>> +	msg_size = min(len, msg_max_size);
>> +
>> +	/*
>> +	 * Use rpmsg_trysend instead of rpmsg_send to send the message so the caller is not
>> +	 * hung until a rpmsg buffer is available. In such case rpmsg_trysend returns -ENOMEM.
>> +	 */
>> +	ret = rpmsg_trysend(rpdev->ept, (void *)buf, msg_size);
>> +	if (ret) {
>> +		dev_dbg(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
> 
> I'm with Greg on this one.  Event if it's a dev_dbg() something like this could
> quickly fill the logs. 
That's right,if the remote side is stalled and application doesn't propertly
handle the error returned.

> Customers should learn to use ftrace.  At the very least
> please use the ratelimited() version.  Same comment applies to rpmsg_tty_cb().

I'm not yet an expert in ftrace, I don't see trace that would highligth this
error (return value not traced), except adding trace_printk. If you have a
solution, please could you point that out to me?
The goal here is that a customers (who has an user spece application develloper
profile) has the explicit information that something goes wrong.

By default I would be in favour of using ratelimited version also here.

> 
> Otherwise:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 

Thanks,
Arnaud

>> +		return ret;
>> +	}
>> +
>> +	return msg_size;
>> +}
>> +
>> +static unsigned int rpmsg_tty_write_room(struct tty_struct *tty)
>> +{
>> +	struct rpmsg_tty_port *cport = tty->driver_data;
>> +	int size;
>> +
>> +	size = rpmsg_get_mtu(cport->rpdev->ept);
>> +	if (size < 0)
>> +		return 0;
>> +
>> +	return size;
>> +}
>> +
>> +static const struct tty_operations rpmsg_tty_ops = {
>> +	.install	= rpmsg_tty_install,
>> +	.open		= rpmsg_tty_open,
>> +	.close		= rpmsg_tty_close,
>> +	.write		= rpmsg_tty_write,
>> +	.write_room	= rpmsg_tty_write_room,
>> +};
>> +
>> +static struct rpmsg_tty_port *rpmsg_tty_alloc_cport(void)
>> +{
>> +	struct rpmsg_tty_port *cport;
>> +	int err;
>> +
>> +	cport = kzalloc(sizeof(*cport), GFP_KERNEL);
>> +	if (!cport)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	mutex_lock(&idr_lock);
>> +	cport->id = idr_alloc(&tty_idr, cport, 0, MAX_TTY_RPMSG, GFP_KERNEL);
>> +	mutex_unlock(&idr_lock);
>> +
>> +	if (cport->id < 0) {
>> +		err = cport->id;
>> +		kfree(cport);
>> +		return ERR_PTR(err);
>> +	}
>> +
>> +	return cport;
>> +}
>> +
>> +static void rpmsg_tty_release_cport(struct rpmsg_tty_port *cport)
>> +{
>> +	mutex_lock(&idr_lock);
>> +	idr_remove(&tty_idr, cport->id);
>> +	mutex_unlock(&idr_lock);
>> +
>> +	kfree(cport);
>> +}
>> +
>> +static const struct tty_port_operations rpmsg_tty_port_ops = { };
>> +
>> +static int rpmsg_tty_probe(struct rpmsg_device *rpdev)
>> +{
>> +	struct rpmsg_tty_port *cport;
>> +	struct device *dev = &rpdev->dev;
>> +	struct device *tty_dev;
>> +	int ret;
>> +
>> +	cport = rpmsg_tty_alloc_cport();
>> +	if (IS_ERR(cport)) {
>> +		dev_err(dev, "Failed to alloc tty port\n");
>> +		return PTR_ERR(cport);
>> +	}
>> +
>> +	tty_port_init(&cport->port);
>> +	cport->port.ops = &rpmsg_tty_port_ops;
>> +
>> +	tty_dev = tty_port_register_device(&cport->port, rpmsg_tty_driver,
>> +					   cport->id, dev);
>> +	if (IS_ERR(tty_dev)) {
>> +		dev_err(dev, "Failed to register tty port\n");
>> +		ret = PTR_ERR(tty_dev);
>> +		goto  err_destroy;
>> +	}
>> +
>> +	cport->rpdev = rpdev;
>> +
>> +	dev_set_drvdata(dev, cport);
>> +
>> +	dev_dbg(dev, "New channel: 0x%x -> 0x%x : ttyRPMSG%d\n",
>> +		rpdev->src, rpdev->dst, cport->id);
>> +
>> +	return 0;
>> +
>> +err_destroy:
>> +	tty_port_destroy(&cport->port);
>> +	rpmsg_tty_release_cport(cport);
>> +
>> +	return ret;
>> +}
>> +
>> +static void rpmsg_tty_remove(struct rpmsg_device *rpdev)
>> +{
>> +	struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
>> +
>> +	dev_dbg(&rpdev->dev, "Removing rpmsg tty device %d\n", cport->id);
>> +
>> +	/* User hang up to release the tty */
>> +	if (tty_port_initialized(&cport->port))
>> +		tty_port_tty_hangup(&cport->port, false);
>> +
>> +	tty_unregister_device(rpmsg_tty_driver, cport->id);
>> +
>> +	tty_port_destroy(&cport->port);
>> +	rpmsg_tty_release_cport(cport);
>> +}
>> +
>> +static struct rpmsg_device_id rpmsg_driver_tty_id_table[] = {
>> +	{ .name	= "rpmsg-tty" },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_tty_id_table);
>> +
>> +static struct rpmsg_driver rpmsg_tty_rpmsg_drv = {
>> +	.drv.name	= KBUILD_MODNAME,
>> +	.id_table	= rpmsg_driver_tty_id_table,
>> +	.probe		= rpmsg_tty_probe,
>> +	.callback	= rpmsg_tty_cb,
>> +	.remove		= rpmsg_tty_remove,
>> +};
>> +
>> +static int __init rpmsg_tty_init(void)
>> +{
>> +	int err;
>> +
>> +	rpmsg_tty_driver = tty_alloc_driver(MAX_TTY_RPMSG, TTY_DRIVER_REAL_RAW |
>> +					    TTY_DRIVER_DYNAMIC_DEV);
>> +	if (IS_ERR(rpmsg_tty_driver))
>> +		return PTR_ERR(rpmsg_tty_driver);
>> +
>> +	rpmsg_tty_driver->driver_name = "rpmsg_tty";
>> +	rpmsg_tty_driver->name = "ttyRPMSG";
>> +	rpmsg_tty_driver->major = 0;
>> +	rpmsg_tty_driver->type = TTY_DRIVER_TYPE_CONSOLE;
>> +
>> +	/* Disable unused mode by default */
>> +	rpmsg_tty_driver->init_termios = tty_std_termios;
>> +	rpmsg_tty_driver->init_termios.c_lflag &= ~(ECHO | ICANON);
>> +	rpmsg_tty_driver->init_termios.c_oflag &= ~(OPOST | ONLCR);
>> +
>> +	tty_set_operations(rpmsg_tty_driver, &rpmsg_tty_ops);
>> +
>> +	err = tty_register_driver(rpmsg_tty_driver);
>> +	if (err < 0) {
>> +		pr_err("Couldn't install rpmsg tty driver: err %d\n", err);
>> +		goto error_put;
>> +	}
>> +
>> +	err = register_rpmsg_driver(&rpmsg_tty_rpmsg_drv);
>> +	if (err < 0) {
>> +		pr_err("Couldn't register rpmsg tty driver: err %d\n", err);
>> +		goto error_unregister;
>> +	}
>> +
>> +	return 0;
>> +
>> +error_unregister:
>> +	tty_unregister_driver(rpmsg_tty_driver);
>> +
>> +error_put:
>> +	tty_driver_kref_put(rpmsg_tty_driver);
>> +
>> +	return err;
>> +}
>> +
>> +static void __exit rpmsg_tty_exit(void)
>> +{
>> +	unregister_rpmsg_driver(&rpmsg_tty_rpmsg_drv);
>> +	tty_unregister_driver(rpmsg_tty_driver);
>> +	tty_driver_kref_put(rpmsg_tty_driver);
>> +	idr_destroy(&tty_idr);
>> +}
>> +
>> +module_init(rpmsg_tty_init);
>> +module_exit(rpmsg_tty_exit);
>> +
>> +MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>");
>> +MODULE_DESCRIPTION("remote processor messaging tty driver");
>> +MODULE_LICENSE("GPL v2");
>> -- 
>> 2.17.1
>>
