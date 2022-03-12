Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA754D6D02
	for <lists+linux-doc@lfdr.de>; Sat, 12 Mar 2022 07:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbiCLGaL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 12 Mar 2022 01:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbiCLGaK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Mar 2022 01:30:10 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868BFFD0E
        for <linux-doc@vger.kernel.org>; Fri, 11 Mar 2022 22:29:04 -0800 (PST)
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KFt8F1KlJz9sSs;
        Sat, 12 Mar 2022 14:25:17 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 12 Mar 2022 14:29:01 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 12 Mar 2022 14:29:00 +0800
Subject: Re: [PATCH] docs: scheduler: Convert schedutil.txt to ReST
To:     Jonathan Corbet <corbet@lwn.net>, <peterz@infradead.org>,
        <mingo@redhat.com>
CC:     <linux-doc@vger.kernel.org>, <zhengbin13@huawei.com>,
        <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <tangyeechou@gmail.com>
References: <20220311030400.32320-1-tangyizhou@huawei.com>
 <87v8wk2ozc.fsf@meer.lwn.net>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <6bdba99e-2fa5-49f7-325b-fffee15bd8d8@huawei.com>
Date:   Sat, 12 Mar 2022 14:29:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <87v8wk2ozc.fsf@meer.lwn.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/3/12 4:50, Jonathan Corbet wrote:

> You would appear to have done some space-to-tab conversions throughout
> the file which muddies up the diff and makes it harder to see what you
> have really changed.  Please redo the patch without unneeded white-space
> changes.

I just find out these space-to-tab conversions are not necessary because
the rendered HTML texts have already been aligned.

Will remove them in the next version.

Regards,
Tang
