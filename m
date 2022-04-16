Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA5F503528
	for <lists+linux-doc@lfdr.de>; Sat, 16 Apr 2022 10:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiDPIYF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 16 Apr 2022 04:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiDPIYE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Apr 2022 04:24:04 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D9E2125D
        for <linux-doc@vger.kernel.org>; Sat, 16 Apr 2022 01:21:34 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1DFF02CC;
        Sat, 16 Apr 2022 08:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1DFF02CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1650097294; bh=2DPdB6qDbWYtZAcU5Zi7HimVmItrlRysllWkAvdB+gE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=L08WAERSW4TsiXxppoqy61hZyIoSpgyd1BXWjCHfFeHFOOc7kwjCT4Ha1iM5A8/jL
         dow8eq8FtIFQjXsX0Vw4UGk2UL3SnY9S0b58B3xTot6lpcAnDU72S/6WluscSJUFjG
         EdQ+HES+a0fQeJEi/AqgQOl5j6iqMdhU7+55cbZ8d0eUhAbPYakuMeuwNzVhyAgJCa
         jkuB/fuWPkHDS9UvYYx0uOIODDmQLvTVl2RpYh4hpbAaKXwQN4XngwQ5clmbqGnfrE
         gpTf4zVYyMhaGRPRk6T5IyjsgYdHka5XTQQey7IGrRESOhMPdKYPUJqGceurtB6nTg
         lvNu1EF055pJg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH v2 0/2] Add spinlocks Chinese translation
In-Reply-To: <20220408144742.23225-1-tangyizhou@huawei.com>
References: <20220408144742.23225-1-tangyizhou@huawei.com>
Date:   Sat, 16 Apr 2022 02:21:29 -0600
Message-ID: <87lew54ewm.fsf@meer.lwn.net>
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

> Now I start to translate some documents of locking.
>
> Tang Yizhou (2):
>   docs/zh_CN: Add locking/index Chinese translation
>   docs/zh_CN: Add spinlocks Chinese translation
>
>  Documentation/translations/zh_CN/index.rst    |   2 +-
>  .../translations/zh_CN/locking/index.rst      |  42 +++++
>  .../translations/zh_CN/locking/spinlocks.rst  | 149 ++++++++++++++++++
>  3 files changed, 192 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/locking/index.rst
>  create mode 100644 Documentation/translations/zh_CN/locking/spinlocks.rst

Applied, thanks.

jon
