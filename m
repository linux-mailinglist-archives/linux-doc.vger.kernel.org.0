Return-Path: <linux-doc+bounces-35815-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9D6A18095
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jan 2025 15:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A18C16AAFE
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jan 2025 14:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61151F3FEA;
	Tue, 21 Jan 2025 14:56:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7831F4286;
	Tue, 21 Jan 2025 14:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737471370; cv=none; b=i/OTkuHuBjy3+frmUHfgIBwR4bUNp/40OgR2obk90oPOIJRWSi6pNlxCBxc37eUk4+wOnX2byABJ+jUu8OJYjs23PRPUvo9+7UfNwjEt+fIHYqX19H+th+1ZITYmnoNUDHyFOJYBE2mK4WBJA5YD5Yrkr24GNjDCv1+5x6lwir0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737471370; c=relaxed/simple;
	bh=0fJTPl9rakxRzo7loXTr3AZX210I/kFIENL/ut0zO+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdcaZmboiG34x4jFaLQr5E0xTxZxGtiavM2aUWGh8SmIgur7VbYPenWrauz2BGdLY/14hbQujQelU13AV68lM1J2wEou7YX1PFPSrvV/q2aUviQeUQ21AVXakQ3g1pLOX62hLZKhdhu8Ai+/maW37sHSk89EtHvHg8mY57O6PNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B5F2106F;
	Tue, 21 Jan 2025 06:56:35 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABAF13F66E;
	Tue, 21 Jan 2025 06:56:04 -0800 (PST)
Message-ID: <9e3fb9f6-2f95-4f84-8fa3-1789cb753e2e@arm.com>
Date: Tue, 21 Jan 2025 14:56:03 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 5/8] coresight: tmc: Add support for reading crash
 data
To: Linu Cherian <lcherian@marvell.com>, mike.leach@linaro.org,
 james.clark@arm.com
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 devicetree@vger.kernel.org, sgoutham@marvell.com, gcherian@marvell.com,
 Anil Kumar Reddy <areddy3@marvell.com>, Tanmay Jagdale <tanmay@marvell.com>
References: <20241216053014.3427909-1-lcherian@marvell.com>
 <20241216053014.3427909-6-lcherian@marvell.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241216053014.3427909-6-lcherian@marvell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linu

On 16/12/2024 05:30, Linu Cherian wrote:
> * Add support for reading crashdata using special device files.
>    The special device files /dev/crash_tmc_xxx would be available
>    for read file operation only when the crash data is valid.
> 
> * User can read the crash data as below
> 
>    For example, for reading crash data from tmc_etf sink
> 
>    #dd if=/dev/crash_tmc_etfXX of=~/cstrace.bin
> 
> Signed-off-by: Anil Kumar Reddy <areddy3@marvell.com>
> Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
> Signed-off-by: Linu Cherian <lcherian@marvell.com>
> ---
> Changelog from v12:
> * Fixed wrong buffer pointer passed to coresight_insert_barrier_packet
> * tmc_read_prepare_crashdata need to be called only once and
>    hence removed from read path and added to tmc_probe.
>    As as side effect, tmc_read_unprepare_crashdata is removed as well.
> * tmc_read_prepare_crashdata renamed to tmc_prepare_crashdata and
>    avoided taking locks as its called from probe function alone.
> * Introduced read status flag, "reading" specific to reserved buffer to keep the
>    reserved buffer reading independent of the regular buffer and updated
>    during tmc_crashdata_open/release functions
> * is_tmc_crashdata_valid is made static as its used only within
>    coresight-tmc-core.c
> * tmc_get_resvbuf_trace definition moved up before the first invocation
>    from tmc_prepare_crashdata
> * Replaced constant with TMC_STS_FULL
> 
>   .../hwtracing/coresight/coresight-tmc-core.c  | 213 +++++++++++++++++-
>   .../hwtracing/coresight/coresight-tmc-etr.c   |  22 +-
>   drivers/hwtracing/coresight/coresight-tmc.h   |  14 +-
>   3 files changed, 246 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 1e3938ec12cb..6ef68b56de22 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -105,6 +105,124 @@ u32 tmc_get_memwidth_mask(struct tmc_drvdata *drvdata)
>   	return mask;
>   }
>   
> +static bool is_tmc_crashdata_valid(struct tmc_drvdata *drvdata)
> +{
> +	struct tmc_crash_metadata *mdata;
> +
> +	if (!tmc_has_reserved_buffer(drvdata) ||
> +	    !tmc_has_crash_mdata_buffer(drvdata))
> +		return false;
> +
> +	mdata = drvdata->crash_mdata.vaddr;
> +
> +	/* Check version match */
> +	if (mdata->version != CS_CRASHDATA_VERSION)
> +		return false;
> +
> +	/* Check for valid metadata */
> +	if (!mdata->valid) {
> +		dev_dbg(&drvdata->csdev->dev,
> +			"Data invalid in tmc crash metadata\n");
> +		return false;
> +	}
> +
> +	/*
> +	 * Buffer address given by metadata for retrieval of trace data
> +	 * from previous boot is expected to be same as the reserved
> +	 * trace buffer memory region provided through DTS
> +	 */
> +	if (drvdata->resrv_buf.paddr != mdata->trace_paddr) {
> +		dev_dbg(&drvdata->csdev->dev,
> +			"Trace buffer address of previous boot invalid\n");
> +		return false;
> +	}
> +


> +	/* Check data integrity of metadata */
> +	if (mdata->crc32_mdata != find_crash_metadata_crc(mdata)) {
> +		dev_dbg(&drvdata->csdev->dev,
> +			"CRC mismatch in tmc crash metadata\n");
> +		return false;
> +	}
> +	/* Check data integrity of tracedata */
> +	if (mdata->crc32_tdata != find_crash_tracedata_crc(drvdata, mdata)) {
> +		dev_dbg(&drvdata->csdev->dev,
> +			"CRC mismatch in tmc crash tracedata\n");
> +		return false;
> +	}

The last two dev_dbg() could be made dev_info/dev_err() as it is a 
serious problem, that must be reported to the user.

> +
> +	return true;
> +}
> +
> +static inline ssize_t tmc_get_resvbuf_trace(struct tmc_drvdata *drvdata,
> +					  loff_t pos, size_t len, char **bufpp)
> +{
> +	s64 offset;
> +	ssize_t actual = len;
> +	struct tmc_resrv_buf *rbuf = &drvdata->resrv_buf;
> +
> +	if (pos + actual > rbuf->len)
> +		actual = rbuf->len - pos;
> +	if (actual <= 0)
> +		return 0;
> +
> +	/* Compute the offset from which we read the data */
> +	offset = rbuf->offset + pos;
> +	if (offset >= rbuf->size)
> +		offset -= rbuf->size;
> +
> +	/* Adjust the length to limit this transaction to end of buffer */
> +	actual = (actual < (rbuf->size - offset)) ?
> +		actual : rbuf->size - offset;
> +
> +	*bufpp = (char *)rbuf->vaddr + offset;
> +
> +	return actual;
> +}
> +
> +static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
> +{
> +	char *bufp;
> +	int ret = 0;

minor nit: This variable can be omitted.

> +	ssize_t len;
> +	u32 status, size;
> +	u64 rrp, rwp, dba;
> +	struct tmc_resrv_buf *rbuf;
> +	struct tmc_crash_metadata *mdata;
> +
> +	mdata = drvdata->crash_mdata.vaddr;
> +	rbuf = &drvdata->resrv_buf;
> +
> +	rrp = mdata->tmc_rrp;
> +	rwp = mdata->tmc_rwp;
> +	dba = mdata->tmc_dba;
> +	status = mdata->tmc_sts;
> +	size = mdata->tmc_ram_size << 2;
> +
> +	/* Sync the buffer pointers */
> +	rbuf->offset = rrp - dba;
> +	if (status & TMC_STS_FULL)
> +		rbuf->len = size;
> +	else
> +		rbuf->len = rwp - rrp;
> +
> +	/* Additional sanity checks for validating metadata */
> +	if ((rbuf->offset > size) ||
> +	    (rbuf->len > size)) {
> +		dev_dbg(&drvdata->csdev->dev,
> +			"Offset and length invalid in tmc crash metadata\n");
> +		return -EINVAL;
> +	}
> +
> +	if (status & TMC_STS_FULL) {
> +		len = tmc_get_resvbuf_trace(drvdata, 0x0,
> +					    CORESIGHT_BARRIER_PKT_SIZE, &bufp);
> +		if (len >= CORESIGHT_BARRIER_PKT_SIZE)
> +			coresight_insert_barrier_packet(bufp);
> +	}
> +
> +	return ret;

Instead,

	return 0;

to keep it clear.

> +}
> +
>   static int tmc_read_prepare(struct tmc_drvdata *drvdata)
>   {
>   	int ret = 0;
> @@ -223,6 +341,77 @@ static const struct file_operations tmc_fops = {
>   	.release	= tmc_release,
>   };
>   
> +static int tmc_crashdata_open(struct inode *inode, struct file *file)
> +{
> +	unsigned long flags;
> +	struct tmc_resrv_buf *rbuf;
> +	struct tmc_drvdata *drvdata = container_of(file->private_data,
> +						   struct tmc_drvdata,
> +						   crashdev);
> +
> +	rbuf = &drvdata->resrv_buf;
> +
> +	spin_lock_irqsave(&drvdata->spinlock, flags);

We should additionally verify that the "metadata->valid" is still set, 
because, a resrv_mode operation could clear it ? Or at the least set the
size in the rbuf to 0 when we use the RESRV mode, so we don't expose any 
data that was written in the RESRV mode.

> +	rbuf->reading = true;
> +	spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +
> +	nonseekable_open(inode, file);
> +
> +	dev_dbg(&drvdata->csdev->dev, "%s: successfully opened\n", __func__);
> +	return 0;
> +}
> +
> +static ssize_t tmc_crashdata_read(struct file *file, char __user *data,
> +				  size_t len, loff_t *ppos)
> +{
> +	char *bufp;
> +	ssize_t actual;
> +	struct tmc_drvdata *drvdata = container_of(file->private_data,
> +						   struct tmc_drvdata,
> +						   crashdev);
> +
> +	actual = tmc_get_resvbuf_trace(drvdata, *ppos, len, &bufp);
> +	if (actual <= 0)
> +		return 0;
> +
> +	if (copy_to_user(data, bufp, actual)) {
> +		dev_dbg(&drvdata->csdev->dev,
> +			"%s: copy_to_user failed\n", __func__);
> +		return -EFAULT;
> +	}
> +
> +	*ppos += actual;
> +	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
> +
> +	return actual;
> +
> +}
> +
> +static int tmc_crashdata_release(struct inode *inode, struct file *file)
> +{
> +	int ret = 0;
> +	unsigned long flags;
> +	struct tmc_resrv_buf *rbuf;
> +	struct tmc_drvdata *drvdata = container_of(file->private_data,
> +						   struct tmc_drvdata,
> +						   crashdev);
> +
> +	rbuf = &drvdata->resrv_buf;
> +	spin_lock_irqsave(&drvdata->spinlock, flags);
> +	rbuf->reading = false;
> +	spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +
> +	dev_dbg(&drvdata->csdev->dev, "%s: released\n", __func__);
> +	return ret;
> +}
> +
> +static const struct file_operations tmc_crashdata_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= tmc_crashdata_open,
> +	.read		= tmc_crashdata_read,
> +	.release	= tmc_crashdata_release,
> +};
> +
>   static enum tmc_mem_intf_width tmc_get_memwidth(u32 devid)
>   {
>   	enum tmc_mem_intf_width memwidth;
> @@ -532,6 +721,20 @@ static u32 tmc_etr_get_max_burst_size(struct device *dev)
>   	return burst_size;
>   }
>   
> +static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
> +					 const char *name)
> +{
> +	drvdata->crashdev.name =
> +		devm_kasprintf(&drvdata->csdev->dev, GFP_KERNEL, "%s_%s", "crash", name);
> +	drvdata->crashdev.minor = MISC_DYNAMIC_MINOR;
> +	drvdata->crashdev.fops = &tmc_crashdata_fops;
> +	if (misc_register(&drvdata->crashdev)) {
> +		dev_dbg(&drvdata->csdev->dev,
> +			"Failed to setup user interface for crashdata\n");
> +		drvdata->crashdev.fops = NULL;
> +	}
> +}
> +
>   static int __tmc_probe(struct device *dev, struct resource *res)
>   {
>   	int ret = 0;
> @@ -632,9 +835,15 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>   	drvdata->miscdev.minor = MISC_DYNAMIC_MINOR;
>   	drvdata->miscdev.fops = &tmc_fops;
>   	ret = misc_register(&drvdata->miscdev);
> -	if (ret)
> +	if (ret) {
>   		coresight_unregister(drvdata->csdev);
> +		goto out;
> +	}
> +
>   out:
> +	if (is_tmc_crashdata_valid(drvdata) &&
> +	    !tmc_prepare_crashdata(drvdata))
> +		register_crash_dev_interface(drvdata, desc.name);
>   	return ret;
>   }
>   
> @@ -687,6 +896,8 @@ static void __tmc_remove(struct device *dev)
>   	 * handler to this device is closed.
>   	 */
>   	misc_deregister(&drvdata->miscdev);
> +	if (drvdata->crashdev.fops)
> +		misc_deregister(&drvdata->crashdev);
>   	coresight_unregister(drvdata->csdev);
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index fb944a68a11c..0ca01d5c9581 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -2012,6 +2012,26 @@ static ssize_t buf_mode_preferred_show(struct device *dev,
>   	return sysfs_emit(buf, "%s\n", buf_modes_str[drvdata->etr_mode]);
>   }
>   
> +static int buf_mode_set_resrv(struct tmc_drvdata *drvdata)
> +{
> +	int err = 0;

minor nit:

	int err = -EBUSY;

> +	unsigned long flags;
> +	struct tmc_resrv_buf *rbuf;
> +
> +	rbuf = &drvdata->resrv_buf;
> +
> +	/* Ensure there are no active crashdata read sessions */
> +	spin_lock_irqsave(&drvdata->spinlock, flags);
> +	if (!rbuf->reading) {
> +		tmc_crashdata_set_invalid(drvdata);

See my comment above.  We don't seem to be checking this "after" we 
created the crash device file. But it is right to do so. May be 
additionally set the rbuf->len = 0 too ?

Another question, what happens if :

1) First boot - Crash data was captured, watchdog timer booted us into 
second kernel.
2) In the Second Kernel, no crash, but normal/kexec reboot to a 3rd kernel
3) 3rd Kernel booted with Trace Data still in tact.

I don't know if there is a reliable way to clear out the trace capture. 
I guess it doesn't matter if the 3rd kernel sees a "kernel trace" from 
1st kernel.

Do we need any additional information in the metadata header to indicate
which kernel/time the crash was captured.
Should we advertise the presence of a "crash" trace with a bit more of 
importance at probe ? May be yes and then ignore a persisting trace from 
crash and leave it to the user to figure out.


> +		drvdata->etr_mode = ETR_MODE_RESRV;
		err = 0;
	}

> -
> -	} else
> -		err = -1;

Remove ^^

> +	spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +	return err;
> +}
> +
>   static ssize_t buf_mode_preferred_store(struct device *dev,
>   					  struct device_attribute *attr,
>   					  const char *buf, size_t size)
> @@ -2027,7 +2047,7 @@ static ssize_t buf_mode_preferred_store(struct device *dev,
>   	else if (sysfs_streq(buf, buf_modes_str[ETR_MODE_CATU]) && buf_hw.has_catu)
>   		drvdata->etr_mode = ETR_MODE_CATU;
>   	else if (sysfs_streq(buf, buf_modes_str[ETR_MODE_RESRV]) && buf_hw.has_resrv)
> -		drvdata->etr_mode = ETR_MODE_RESRV;
> +		return buf_mode_set_resrv(drvdata) ? -EBUSY : size;

		return buf_mode_set_resrv(drvdata) ? : size;

Suzuki

>   	else if (sysfs_streq(buf, buf_modes_str[ETR_MODE_AUTO]))
>   		drvdata->etr_mode = ETR_MODE_AUTO;
>   	else
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index d76e83fc840b..e3707b69abff 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -195,11 +195,17 @@ struct etr_buf {
>    * @paddr	: Start address of reserved memory region.
>    * @vaddr	: Corresponding CPU virtual address.
>    * @size	: Size of reserved memory region.
> + * @offset	: Offset of the trace data in the buffer for consumption.
> + * @reading	: Flag to indicate if reading is active
> + * @len	: Available trace data @buf (may round up to the beginning).
>    */
>   struct tmc_resrv_buf {
>   	phys_addr_t     paddr;
>   	void		*vaddr;
>   	size_t		size;
> +	unsigned long	offset;
> +	bool		reading;
> +	s64		len;
>   };
>   
>   /**
> @@ -208,6 +214,8 @@ struct tmc_resrv_buf {
>    * @base:	memory mapped base address for this component.
>    * @csdev:	component vitals needed by the framework.
>    * @miscdev:	specifics to handle "/dev/xyz.tmc" entry.
> + * @crashdev:	specifics to handle "/dev/crash_tmc_xyz" entry for reading
> + *		crash tracedata.
>    * @spinlock:	only one at a time pls.
>    * @pid:	Process ID of the process that owns the session that is using
>    *		this component. For example this would be the pid of the Perf
> @@ -227,7 +235,7 @@ struct tmc_resrv_buf {
>    * @idr_mutex:	Access serialisation for idr.
>    * @sysfs_buf:	SYSFS buffer for ETR.
>    * @perf_buf:	PERF buffer for ETR.
> - * @resrv_buf:	Used by ETR as hardware trace buffer and for trace data
> + * @resrv_buf:  Used by ETR as hardware trace buffer and for trace data
>    *		retention (after crash) only when ETR_MODE_RESRV buffer
>    *		mode is enabled. Used by ETF for trace data retention
>    *		(after crash) by default.
> @@ -239,6 +247,7 @@ struct tmc_drvdata {
>   	void __iomem		*base;
>   	struct coresight_device	*csdev;
>   	struct miscdevice	miscdev;
> +	struct miscdevice	crashdev;
>   	spinlock_t		spinlock;
>   	pid_t			pid;
>   	bool			reading;
> @@ -309,6 +318,8 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata);
>   void tmc_enable_hw(struct tmc_drvdata *drvdata);
>   void tmc_disable_hw(struct tmc_drvdata *drvdata);
>   u32 tmc_get_memwidth_mask(struct tmc_drvdata *drvdata);
> +int tmc_read_prepare_crashdata(struct tmc_drvdata *drvdata);
> +int tmc_read_unprepare_crashdata(struct tmc_drvdata *drvdata);
>   
>   /* ETB/ETF functions */
>   int tmc_read_prepare_etb(struct tmc_drvdata *drvdata);
> @@ -371,6 +382,7 @@ void tmc_sg_table_sync_data_range(struct tmc_sg_table *table,
>   				  u64 offset, u64 size);
>   ssize_t tmc_sg_table_get_data(struct tmc_sg_table *sg_table,
>   			      u64 offset, size_t len, char **bufpp);
> +
>   static inline unsigned long
>   tmc_sg_table_buf_size(struct tmc_sg_table *sg_table)
>   {


