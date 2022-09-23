Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C00F75E742D
	for <lists+linux-doc@lfdr.de>; Fri, 23 Sep 2022 08:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbiIWGcr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 23 Sep 2022 02:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiIWGcq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Sep 2022 02:32:46 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FAF27DCD;
        Thu, 22 Sep 2022 23:32:45 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MYj2J2XnnzHpdP;
        Fri, 23 Sep 2022 14:30:32 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 14:32:43 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 14:32:43 +0800
Subject: Re: [PATCH -next] Documentation: devres: add missing SPI helper
To:     Lukas Wunner <lukas@wunner.de>
CC:     <linux-doc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <corbet@lwn.net>, <broonie@kernel.org>, <yangyingliang@huawei.com>
References: <20220917122639.1896965-1-yangyingliang@huawei.com>
 <20220923055518.GA17668@wunner.de>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <a61fd394-978f-1a12-b38e-2f3ab8ad02f7@huawei.com>
Date:   Fri, 23 Sep 2022 14:32:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220923055518.GA17668@wunner.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Lukas,

On 2022/9/23 13:55, Lukas Wunner wrote:
> On Sat, Sep 17, 2022 at 08:26:39PM +0800, Yang Yingliang wrote:
>> Add devm_spi_alloc_master() and devm_spi_alloc_slave() to devres.rst.
>> They are introduced by commit 5e844cc37a5c ("spi: Introduce device-managed
>> SPI controller allocation").
>>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   Documentation/driver-api/driver-model/devres.rst | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
>> index 76cc256c9e4f..1bd6f38dd7e3 100644
>> --- a/Documentation/driver-api/driver-model/devres.rst
>> +++ b/Documentation/driver-api/driver-model/devres.rst
>> @@ -437,6 +437,8 @@ SLAVE DMA ENGINE
>>   
>>   SPI
>>     devm_spi_register_master()
>> +  devm_spi_alloc_master()
>> +  devm_spi_alloc_slave()
>>   
>>   WATCHDOG
>>     devm_watchdog_register_device()
> Putting the alloc functions above the register function would
> probably be more in line with how they're used.  Apart from that:
Do I need send a v2 to move up alloc functions with your review tag.

Thanks,
Yang
>
> Reviewed-by: Lukas Wunner <lukas@wunner.de>
> .
