Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4F01B239A
	for <lists+linux-doc@lfdr.de>; Fri, 13 Sep 2019 17:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730372AbfIMPlH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 Sep 2019 11:41:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57492 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730371AbfIMPlH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Sep 2019 11:41:07 -0400
Received: from [IPv6:2804:431:c7f4:5bfc:5711:794d:1c68:5ed3] (unknown [IPv6:2804:431:c7f4:5bfc:5711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F3C3828B629;
        Fri, 13 Sep 2019 16:41:02 +0100 (BST)
Subject: Re: [PATCH 3/3] null_blk: validated the number of devices
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "m@bjorling.me" <m@bjorling.me>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "krisman@collabora.com" <krisman@collabora.com>
References: <20190911144636.226945-1-andrealmeid@collabora.com>
 <20190911144636.226945-3-andrealmeid@collabora.com>
 <20190912161937.GK29434@bombadil.infradead.org>
 <dbdb0415-8762-f9c1-a65a-3531d9cca109@collabora.com>
 <DM6PR04MB5754177B405819C802549AE686B00@DM6PR04MB5754.namprd04.prod.outlook.com>
 <d55554f5-7212-c5fc-dbb0-4269be913aaa@collabora.com>
 <20190913151249.GN29434@bombadil.infradead.org>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <408e3e2d-3bb1-222b-d305-5d7a232d33a6@collabora.com>
Date:   Fri, 13 Sep 2019 12:39:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190913151249.GN29434@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/13/19 12:12 PM, Matthew Wilcox wrote:
> On Fri, Sep 13, 2019 at 11:57:17AM -0300, André Almeida wrote:
>> On 9/12/19 7:20 PM, Chaitanya Kulkarni wrote:
>>> On 09/12/2019 03:09 PM, André Almeida wrote:
>>>> Hello Matthew,
>>>>
>>>> On 9/12/19 1:19 PM, Matthew Wilcox wrote:
>>>>> On Wed, Sep 11, 2019 at 11:46:36AM -0300, André Almeida wrote:
>>>>>>
>>>>>> -static int nr_devices = 1;
>>>>>> +static unsigned int nr_devices = 1;
>>>>>>   module_param(nr_devices, int, 0444);
>>>>>
>>>>> ^^^ you forgot to change the module_param to match
>>>>>
>>>>>> +	if (!nr_devices) {
>>>>>> +		pr_err("null_blk: invalid number of devices\n");
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>
>>>>> I don't think this is necessary.
>>>>>
>>>>
>>>> Could you explain why you don't think is necessary? As I see, the module
>>>> can't be used without any /dev/nullb* device, so why we should load it?
>>>>
>>>> Thanks,
>>>> 	André
>>>>
>>>
>>> I think Matthew is right here. I think module can be loaded with 
>>> nr_devices=0.
>>>
>>> Did you get a chance to test nr_device=0 condition ?
>>>
>>
>> Yes. It says "module loaded" and lsmod shows that it is loaded indeed.
>> But you don't have any /dev/nullb*, so you can't do much with the module.
>>
>> With this patch, it refuses to load the module.
> 
> Why is that an improvement?  I agree it's an uninteresting thing to ask
> for, but I don't see a compelling need to fail the module load because
> of it.
> 

Indeed, failing is used when there is something wrong with the module,
and this is not the case when (nr_devices == 0). I will remove this, thanks!

>> I did not tested with all possible conditions, but I tested with the
>> following ones:
>>
>> * Using a negative number of devices:
>> 	- Previously, it would alloc and add a huge number of devices until the
>> system gets out of memory
>> 	- With module_param as uint, it will throw a "invalid for parameter
>> `nr_devices'" and refuse to load
>>
>> * Using a range of values (1, 10, 100, 1000):
>> 	- It will works as expect, creating some /dev/nullbX accordingly with
>> your parameter. Works fine with and without this patch.
> 
> If you ask it to create 4 billion devices, what happens?  Obviously we'll
> run out of dev_t at some point ...
> 

