Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EECFF63A6C3
	for <lists+linux-doc@lfdr.de>; Mon, 28 Nov 2022 12:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbiK1LHP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Nov 2022 06:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbiK1LGx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Nov 2022 06:06:53 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4ABF9193E0;
        Mon, 28 Nov 2022 03:06:41 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87710D6E;
        Mon, 28 Nov 2022 03:06:47 -0800 (PST)
Received: from [10.57.40.62] (unknown [10.57.40.62])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADF3F3F73B;
        Mon, 28 Nov 2022 03:06:38 -0800 (PST)
Message-ID: <d275dde8-9cb3-bd70-eacc-7907e42c59dd@arm.com>
Date:   Mon, 28 Nov 2022 11:06:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v14 1/2] drivers/coresight: Add UltraSoc System Memory
 Buffer driver
To:     hejunhao <hejunhao3@huawei.com>, mathieu.poirier@linaro.org,
        mike.leach@linaro.org, leo.yan@linaro.org,
        jonathan.cameron@huawei.com
Cc:     coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        lpieralisi@kernel.org, linuxarm@huawei.com, yangyicong@huawei.com,
        liuqi6124@gmail.com, f.fangjian@huawei.com,
        prime.zeng@hisilicon.com
References: <20221123123823.27973-1-hejunhao3@huawei.com>
 <20221123123823.27973-2-hejunhao3@huawei.com>
 <9f5f66fa-0388-6a76-25c9-cacef0e7a4e2@arm.com>
 <0eb32726-2054-ee00-4b7a-d7a2f0121efd@huawei.com>
 <80cf9c73-4b9a-f2f7-f72d-de985c045f9c@arm.com>
 <8e3b1957-33a7-83ed-6d62-1294cdb679e4@huawei.com>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <8e3b1957-33a7-83ed-6d62-1294cdb679e4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 25/11/2022 14:26, hejunhao wrote:
> 
> On 2022/11/24 21:45, Suzuki K Poulose wrote:
>> On 24/11/2022 13:33, hejunhao wrote:
>>>
>>> On 2022/11/23 22:03, Suzuki K Poulose wrote:
>>>> On 23/11/2022 12:38, Junhao He wrote:
>>>>> From: Qi Liu <liuqi115@huawei.com>
>>>>>
>>>>> Add driver for UltraSoc SMB(System Memory Buffer) device.
>>>>> SMB provides a way to buffer messages from ETM, and store
>>>>> these "CPU instructions trace" in system memory.
>>>>> The SMB device is identifier as ACPI HID "HISI03A1". Device
>>>>> system memory address resources are allocated using the _CRS
>>>>> method and buffer modes is the circular buffer mode.
>>>>>
>>>>> SMB is developed by UltraSoc technology, which is acquired by
>>>>> Siemens, and we still use "UltraSoc" to name driver.
>>>>>
>>>>> Signed-off-by: Qi Liu <liuqi115@huawei.com>
>>>>> Signed-off-by: Junhao He <hejunhao3@huawei.com>
>>>>> Tested-by: JunHao He <hejunhao3@huawei.com>
>>>>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>>>> ---
>>>>>   drivers/hwtracing/coresight/Kconfig        |  12 +
>>>>>   drivers/hwtracing/coresight/Makefile       |   1 +
>>>>>   drivers/hwtracing/coresight/ultrasoc-smb.c | 658 
>>>>> +++++++++++++++++++++
>>>>>   drivers/hwtracing/coresight/ultrasoc-smb.h | 129 ++++
>>>>>   4 files changed, 800 insertions(+)
>>>>>   create mode 100644 drivers/hwtracing/coresight/ultrasoc-smb.c
>>>>>   create mode 100644 drivers/hwtracing/coresight/ultrasoc-smb.h
>>>>>
>>>>
>>>>> +static void smb_sync_perf_buffer(struct smb_drv_data *drvdata,
>>>>> +                 struct cs_buffers *buf,
>>>>> +                 unsigned long head,
>>>>> +                 unsigned long data_size)
>>>>> +{
>>>>> +    struct smb_data_buffer *sdb = &drvdata->sdb;
>>>>> +    char **dst_pages = (char **)buf->data_pages;
>>>>> +    unsigned long to_copy;
>>>>> +    long pg_idx, pg_offset;
>>>>> +
>>>>> +    pg_idx = head >> PAGE_SHIFT;
>>>>> +    pg_offset = head & (PAGE_SIZE - 1);
>>>>> +
>>>>> +    while (data_size) {
>>>>> +        unsigned long pg_space = PAGE_SIZE - pg_offset;
>>>>> +
>>>>> +        /* Copy parts of trace data when read pointer wrap around */
>>>>> +        if (sdb->rd_offset + pg_space > sdb->buf_size)
>>>>> +            to_copy = sdb->buf_size - sdb->rd_offset;
>>>>> +        else
>>>>> +            to_copy = min(data_size, pg_space);
>>>>> +
>>>>> +        memcpy(dst_pages[pg_idx] + pg_offset,
>>>>> +                  sdb->buf_base + sdb->rd_offset, to_copy);
>>>>> +
>>>>> +        pg_offset += to_copy;
>>>>> +        if (pg_offset >= PAGE_SIZE) {
>>>>> +            pg_offset = 0;
>>>>> +            pg_idx++;
>>>>> +            pg_idx %= buf->nr_pages;
>>>>> +        }
>>>>> +        data_size -= to_copy;
>>>>> +        sdb->rd_offset += to_copy;
>>>>> +        sdb->rd_offset %= sdb->buf_size;
>>>>> +    }
>>>>> +
>>>>> +    sdb->data_size = 0;
>>>>
>>>>
>>>> --8>-- cut here --<8--
>>>>
>>>>> +    writel(sdb->start_addr + sdb->rd_offset,
>>>>> +        drvdata->base + SMB_LB_RD_ADDR_REG);
>>>>> +
>>>>> +    /*
>>>>> +     * Data remained in link cannot be purged when SMB is full, so
>>>>> +     * synchronize the read pointer to write pointer, to make sure
>>>>> +     * these remained data won't influence next trace.
>>>>> +     */
>>>>> +    if (sdb->full) {
>>>>> +        smb_purge_data(drvdata);
>>>>> +        writel(readl(drvdata->base + SMB_LB_WR_ADDR_REG),
>>>>> +               drvdata->base + SMB_LB_RD_ADDR_REG);
>>>>> +    }
>>>>
>>>> --<8-- end here --8>--
>>>>
>>>> As pointed out in the last review, we must do this step
>>>> everytime for perf mode irrespective of whether the buffer
>>>> was "FULL" or not.
>>>>
>>>> i.e, the above block should simply be:
>>>>
>>>>     if (sdb->full)
>>>>         smb_purge_data(drvdata);
>>>>
>>>>     /*
>>>>      * The uncollected Data must be discarded for perf,
>>>>      * as it cannot be clubbed with next schedule. We
>>>>      * any way TRUNCATE the buffer in this case.
>>>>      */
>>>>     writel(readl(drvdata->base + SMB_LB_WR_ADDR_REG),
>>>>         drvdata->base + SMB_LB_RD_ADDR_REG);
>>>>
>>>> Suzuki
>>>
>>> Hi Suzuki,
>>>
>>> We need to update SMB_LB_RD_ADDR_REG register first, then
>>> check the "full" flag, whether the register needs to be
>>> updated again.
>>
>> Why ? sdb->full is not updated after the write to RD_ADDR_REG.
>>
> Hi Suzuki,
> 
> Maybe using the code below is more appropriate.
> i.e,
> 
>      writel(sdb->start_addr + sdb->rd_offset,
>          drvdata->base + SMB_LB_RD_ADDR_REG);
> 
>      /*
>       * The uncollected Data must be discarded for perf,
>       * as it cannot be clubbed with next schedule. We
>       * any way TRUNCATE the buffer in this case.
>       */
>      smb_update_data_size(drvdata);
>      if (sdb->data_size)
>          writel(readl(drvdata->base + SMB_LB_WR_ADDR_REG),
>                  drvdata->base + SMB_LB_RD_ADDR_REG);

That should work. However, my question is, we must set the
RD_ADDR_REG to the WR_ADDR_REG in all cases. So, why not :

	/*
	 * We must flush and discard any data left in the
	 * buffer for a perf session, to avoid mixing
	 * the data from sessions.
	 * We TRUNCATE the buffer anyways to indicate
	 * that the buffer was lost.
	 */
	smb_purge_data();
	writel(readl(drvdata->base + SMB_LB_WR_ADDR_REG),
		drvdata->base + SMB_LB_RD_ADDR_REG);

and avoid the extra write ?

>>>
>>> If we don`t update the value of SMB_LB_RD_ADDR_REG register
>>> or reset buffer state, the buffer state will still be "full".
>>> The buffer has not free area,so the data will still remain
>>> in link.
>>
>> My issue here is with potentially "leaving the trace from a previous
>> session for the next session". i.e., at the end of a run, we must always
>> make sure that the buffer is left empty (unlike the sysfs mode).
>>
>> e.g.,
>>
>> perf_session_x: RUN0: RD=0x0, WR=0x5000, HANDLE_SIZE=0x3000, full=false.
>> At the end of the above routine we will have :
>>     RD=0x3000, WR=0x5000,
>>
>> and if a different perf session comes in, say perf_session_y, it will 
>> consume trace written by "x" at 0x3000-0x50000, right ?
>>
>> This is fine in the sysfs mode as we expect the entire sysfs mode
>> to be owned by a single session and is left to the user to split it.
>> But for perf mode we cannot do that and thus must make sure we don't
>> leak trace from one session to antoher.
>>
>> Suzuki
>>
> 
> In this cace:  RUN0: RD=0x0, WR=0x5000, HANDLE_SIZE=0x3000, full=false.
> We will update the "rd_offset" in smb_update_buffer() function.
> like this:
> 
>      ...
>      if (data_size > handle->size) {
>          sdb->rd_offset += data_size - handle->size;
>          sdb->rd_offset %= sdb->buf_size;
>          ...
>          }
>      ...
> 
> 
> So the rd_offset will advance to 0x2000 first,
> then we dump the latest trace data (0x2000 - 0x5000) from "buf_base + 
> rd_offset".

Right, that makes sense.


Thanks
Suzuki


