Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBA3602DF1
	for <lists+linux-doc@lfdr.de>; Tue, 18 Oct 2022 16:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbiJROJb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Oct 2022 10:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiJROJ3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Oct 2022 10:09:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5BC25EC;
        Tue, 18 Oct 2022 07:09:21 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FD688B9;
        Tue, 18 Oct 2022 16:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1666102159;
        bh=XW3IWSkyTJNdMSanD5x08FhrrBKsT2/IbrHkChUSIec=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=o+6iX7VaRKS+pWv5oWVv7aPkYOoBztyd8AKZeKkfLw0o4dsVrr2nYNgRBnoTU4Fwt
         AgtofK9FGAXJ66m16sig80+FsLYtfpFhqdLDJU37hFEbGZ0z88ZH9uCwDq9SojQN2Z
         Z/ttSEf4YwL/yWITpVPB0IYobtXJc+geMZBO3lXE=
Message-ID: <40def24c-6d03-e792-de27-864b41fa0ac7@ideasonboard.com>
Date:   Tue, 18 Oct 2022 15:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 6/6] usb: gadget: uvc: add configfs option for sg
 support
Content-Language: en-US
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     Dan Vacura <w36195@motorola.com>, linux-usb@vger.kernel.org,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Jeff Vanhoof <qjv001@motorola.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Felipe Balbi <balbi@kernel.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20221017205446.523796-1-w36195@motorola.com>
 <20221017205446.523796-7-w36195@motorola.com>
 <78c6403a-22d9-903d-f0cf-4205e17962d3@ideasonboard.com>
 <20221018140432.GE5651@pengutronix.de>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20221018140432.GE5651@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Michael

On 18/10/2022 15:04, Michael Grzeschik wrote:
> Hi Dan!
> Hi Dan!
>
> On Tue, Oct 18, 2022 at 02:27:13PM +0100, Dan Scally wrote:
>> Hi Dan
>>
>> On 17/10/2022 21:54, Dan Vacura wrote:
>>> The scatter gather support doesn't appear to work well with some UDC 
>>> hw.
>>> Add the ability to turn on the feature depending on the controller in
>>> use.
>>>
>>> Signed-off-by: Dan Vacura <w36195@motorola.com>
>>
>>
>> Nitpick: I would call it use_sg everywhere, but either way:
>
> Or even only "scatter_gather". How does that sound?
>
>>
>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>>
>> Tested-by: Daniel Scally <dan.scally@ideasonboard.com>
>>
>>> ---
>>> V1 -> V2:
>>> - no change, new patch in serie
>>> V2 -> V3:
>>> - default on, same as baseline
>>>
>>>  Documentation/ABI/testing/configfs-usb-gadget-uvc | 1 +
>>>  Documentation/usb/gadget-testing.rst              | 2 ++
>>>  drivers/usb/gadget/function/f_uvc.c               | 2 ++
>>>  drivers/usb/gadget/function/u_uvc.h               | 1 +
>>>  drivers/usb/gadget/function/uvc_configfs.c        | 2 ++
>>>  drivers/usb/gadget/function/uvc_queue.c           | 4 ++--
>>>  6 files changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc 
>>> b/Documentation/ABI/testing/configfs-usb-gadget-uvc
>>> index 5dfaa3f7f6a4..839a75fc28ee 100644
>>> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
>>> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
>>> @@ -9,6 +9,7 @@ Description:    UVC function directory
>>>          streaming_interval    1..16
>>>          function_name        string [32]
>>>          req_int_skip_div    unsigned int
>>> +        sg_supported        0..1
>>>          ===================    =============================
>>>  What: /config/usb-gadget/gadget/functions/uvc.name/control
>>> diff --git a/Documentation/usb/gadget-testing.rst 
>>> b/Documentation/usb/gadget-testing.rst
>>> index f9b5a09be1f4..8e3072d6a590 100644
>>> --- a/Documentation/usb/gadget-testing.rst
>>> +++ b/Documentation/usb/gadget-testing.rst
>>> @@ -796,6 +796,8 @@ The uvc function provides these attributes in 
>>> its function directory:
>>>      function_name       name of the interface
>>>      req_int_skip_div    divisor of total requests to aid in 
>>> calculating
>>>                  interrupt frequency, 0 indicates all interrupt
>>> +    sg_supported        allow for scatter gather to be used if the UDC
>>> +                hw supports it
>>>      =================== 
>>> ================================================
>>>  There are also "control" and "streaming" subdirectories, each of 
>>> which contain
>>> diff --git a/drivers/usb/gadget/function/f_uvc.c 
>>> b/drivers/usb/gadget/function/f_uvc.c
>>> index e40ca26b9c55..d08ebe3ffeb2 100644
>>> --- a/drivers/usb/gadget/function/f_uvc.c
>>> +++ b/drivers/usb/gadget/function/f_uvc.c
>>> @@ -656,6 +656,7 @@ uvc_function_bind(struct usb_configuration *c, 
>>> struct usb_function *f)
>>>                  (opts->streaming_maxburst + 1));
>>>      uvc->config_skip_int_div = opts->req_int_skip_div;
>>> +    uvc->video.queue.use_sg = opts->sg_supported;
>
> Why do you set this here?
>
>>>      /* Allocate endpoints. */
>>>      ep = usb_ep_autoconfig(cdev->gadget, &uvc_control_ep);
>>> @@ -875,6 +876,7 @@ static struct usb_function_instance 
>>> *uvc_alloc_inst(void)
>>>      opts->streaming_interval = 1;
>>>      opts->streaming_maxpacket = 1024;
>>>      opts->req_int_skip_div = 4;
>>> +    opts->sg_supported = 1;
>>>      snprintf(opts->function_name, sizeof(opts->function_name), "UVC 
>>> Camera");
>>>      ret = uvcg_attach_configfs(opts);
>>> diff --git a/drivers/usb/gadget/function/u_uvc.h 
>>> b/drivers/usb/gadget/function/u_uvc.h
>>> index 6f73bd5638ed..5ccced629925 100644
>>> --- a/drivers/usb/gadget/function/u_uvc.h
>>> +++ b/drivers/usb/gadget/function/u_uvc.h
>>> @@ -25,6 +25,7 @@ struct f_uvc_opts {
>>>      unsigned int                    streaming_maxpacket;
>>>      unsigned int                    streaming_maxburst;
>>>      unsigned int                    req_int_skip_div;
>>> +    unsigned int                    sg_supported;
>>>      unsigned int                    control_interface;
>>>      unsigned int                    streaming_interface;
>>> diff --git a/drivers/usb/gadget/function/uvc_configfs.c 
>>> b/drivers/usb/gadget/function/uvc_configfs.c
>>> index 419e926ab57e..3784c0e02d01 100644
>>> --- a/drivers/usb/gadget/function/uvc_configfs.c
>>> +++ b/drivers/usb/gadget/function/uvc_configfs.c
>>> @@ -2351,6 +2351,7 @@ UVCG_OPTS_ATTR(streaming_interval, 
>>> streaming_interval, 16);
>>>  UVCG_OPTS_ATTR(streaming_maxpacket, streaming_maxpacket, 3072);
>>>  UVCG_OPTS_ATTR(streaming_maxburst, streaming_maxburst, 15);
>>>  UVCG_OPTS_ATTR(req_int_skip_div, req_int_skip_div, UINT_MAX);
>>> +UVCG_OPTS_ATTR(sg_supported, sg_supported, 1);
>>>  #undef UVCG_OPTS_ATTR
>>> @@ -2401,6 +2402,7 @@ static struct configfs_attribute *uvc_attrs[] = {
>>>      &f_uvc_opts_attr_streaming_maxpacket,
>>>      &f_uvc_opts_attr_streaming_maxburst,
>>>      &f_uvc_opts_attr_req_int_skip_div,
>>> +    &f_uvc_opts_attr_sg_supported,
>>>      &f_uvc_opts_string_attr_function_name,
>>>      NULL,
>>>  };
>>> diff --git a/drivers/usb/gadget/function/uvc_queue.c 
>>> b/drivers/usb/gadget/function/uvc_queue.c
>>> index 02559906a55a..3c7aa5c4bba2 100644
>>> --- a/drivers/usb/gadget/function/uvc_queue.c
>>> +++ b/drivers/usb/gadget/function/uvc_queue.c
>>> @@ -149,11 +149,11 @@ int uvcg_queue_init(struct uvc_video_queue 
>>> *queue, struct device *dev, enum v4l2
>>>      queue->queue.buf_struct_size = sizeof(struct uvc_buffer);
>>>      queue->queue.ops = &uvc_queue_qops;
>>>      queue->queue.lock = lock;
>>> -    if (cdev->gadget->sg_supported) {
>>> +    if (queue->use_sg && cdev->gadget->sg_supported) {
>>>          queue->queue.mem_ops = &vb2_dma_sg_memops;
>>> -        queue->use_sg = 1;
>>>      } else {
>>>          queue->queue.mem_ops = &vb2_vmalloc_memops;
>>> +        queue->use_sg = false;
>
> I am unsure, but can you actually not always use vb2_dma_sg_memops.


We have problems with this on the imx8mp EVK, because it doesn't account 
for dma-range properties in device tree and so will attempt to allocate 
memory outside the 4GB range that a DWC3 can access. The allocation 
attempts to fall back on the swiotlb, but that's slow even if it 
works...and it can fail and return -ENOMEM if the swiotlb is too small.


Probably some future work needs to fix the vb2_dma_sg_memops to take 
those dma constraints into account, but for now I wouldn't force its use.

>
> With my last patch we always set buf->mem to vb2_plane_vaddr(vb, 0);
>
> https://lore.kernel.org/linux-usb/20221017221141.3134818-1-m.grzeschik@pengutronix.de/T/#u 
>
>
>
> The condition to decide if encode_isoc_sg or encode_isoc should then
> remain the last place to switch between sg or not. I would hook the
> userspace decision in here.
>
> You can also directly get to opts->scatter_gather by using
>
>     struct f_uvc_opts *opts = fi_to_f_uvc_opts(uvc->func.fi);
>
> in the function uvcg_video_enable.
>
>>>      }
>>>      queue->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY
>>
>
> Thanks,
> Michael
>
