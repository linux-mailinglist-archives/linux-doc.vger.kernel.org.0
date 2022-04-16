Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B438B50354F
	for <lists+linux-doc@lfdr.de>; Sat, 16 Apr 2022 10:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbiDPIpO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 16 Apr 2022 04:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbiDPIpN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Apr 2022 04:45:13 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD34D9D0C3
        for <linux-doc@vger.kernel.org>; Sat, 16 Apr 2022 01:42:41 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 116012CC;
        Sat, 16 Apr 2022 08:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 116012CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1650098561; bh=TbiJi1CoqgS4O45T+VyEEcT/XgSs53h8Q05CRauYFX4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=jKT2XN8YmriqPmHrlmlYRMZgbCk/aDZsjjWEL7nZnU9JRQFz/HSITXO0laYigLEtc
         94npvVm7ikmR5ClTz8Wio7UHLo2hkGVzvu+YMUfB+hO7F/6B3smQPUI8oky/cWmvQI
         hgDG8bBOwmvUpPbwKAtD87vrDmfuUPaYLfIEBr+doOu9nkQ3o9qKYN4birPWVKcdk2
         Mf8lHJPk6lo3byqtRUr9SEtW0twFbR+FfsSbFA1EnQ58ueliA82b4NpP+z6rezti8R
         w3KF1oKb67P74nAqmJ3Ivzxu6crQc/wrHrsT9ki6rnXp/grW72vhrv1CR3z5YyMQMf
         ZDi3fFe0z2Czg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Zhou Yuheng <woshoxxx@gmail.com>, Alex Shi <seakeel@gmail.com>
Subject: Re: [PATCH v3] docs/zh_CN: Fix typo in process/howto.rst
In-Reply-To: <e915dae8-858a-01bf-e732-8b969c90ec78@huawei.com>
References: <20220315232428.4982-1-woshoxxx@gmail.com>
 <CAJy-AmkSuuUA5Wk52s3afq2B9c4HY9FfbLnkwDDB2giEBKPppg@mail.gmail.com>
 <e915dae8-858a-01bf-e732-8b969c90ec78@huawei.com>
Date:   Sat, 16 Apr 2022 02:42:36 -0600
Message-ID: <878rs54dxf.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> On 2022/3/18 18:11, Alex Shi wrote:
>> Reviewed-by: Alex Shi <alexs@kernel.org>
>> 
>> On Wed, Mar 16, 2022 at 7:26 AM Zhou Yuheng <woshoxxx@gmail.com> wrote:
>>>
>>> Correct the url of linux-next
>>>
>>> Signed-off-by: Zhou Yuheng <woshoxxx@gmail.com>
>
> Hi,jon:
>
> You may apply this patch, thanks.

OK, I've fetched it out of lore and done so, thanks.

jon
