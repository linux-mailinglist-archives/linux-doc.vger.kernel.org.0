Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3CAA730FC5
	for <lists+linux-doc@lfdr.de>; Thu, 15 Jun 2023 08:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244307AbjFOGu1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 15 Jun 2023 02:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244586AbjFOGuA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Jun 2023 02:50:00 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442AF2715;
        Wed, 14 Jun 2023 23:49:06 -0700 (PDT)
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4QhXsD60rVzLmVY;
        Thu, 15 Jun 2023 14:47:12 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 15 Jun
 2023 14:49:03 +0800
Subject: Re: [PATCH net-next v4 5/5] page_pool: update document about frag API
To:     Jakub Kicinski <kuba@kernel.org>
CC:     <davem@davemloft.net>, <pabeni@redhat.com>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Alexander Duyck <alexander.duyck@gmail.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Eric Dumazet <edumazet@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        John Fastabend <john.fastabend@gmail.com>,
        <linux-doc@vger.kernel.org>, <bpf@vger.kernel.org>
References: <20230612130256.4572-1-linyunsheng@huawei.com>
 <20230612130256.4572-6-linyunsheng@huawei.com>
 <20230613214041.1c29a357@kernel.org>
 <1dc9b2e3-65ee-aa33-d604-a758fea98eb8@huawei.com>
 <20230614095649.5f7d8d40@kernel.org>
From:   Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <7b426283-09f7-a16f-61b8-43319cdab27f@huawei.com>
Date:   Thu, 15 Jun 2023 14:49:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20230614095649.5f7d8d40@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2023/6/15 0:56, Jakub Kicinski wrote:
> On Wed, 14 Jun 2023 20:04:39 +0800 Yunsheng Lin wrote:
>>> Seems like the semantics of page_pool_alloc() are always better than
>>> page_pool_alloc_frag(). Is there a reason to keep these two separate?  
>>
>> I am agree the semantics of page_pool_alloc() is better, I was thinking
>> about combining those two too.
>> The reason I am keeping it is about the nic hw with fixed buffer size for
>> each desc, and that buffer size is always smaller than or equal to half
>> of the page allocated from page pool, so it doesn't bother doing the
>> checking of 'size << 1 > max_size' and doesn't care about the actual
>> truesize.
> 
> I see. Let's reorg the documentation, then? Something along the lines
> of, maybe:

There is still one thing I am not sure about page_pool_alloc() API:
It use *size both as input and output, I am not sure if it is a general
pratice or not, or is there other better pratice than this.
