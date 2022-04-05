Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7F94F4A23
	for <lists+linux-doc@lfdr.de>; Wed,  6 Apr 2022 02:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442685AbiDEWfJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 Apr 2022 18:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457764AbiDEQoy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Apr 2022 12:44:54 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CAEDFFBD
        for <linux-doc@vger.kernel.org>; Tue,  5 Apr 2022 09:42:56 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:35:2589:2a93:190d:b787])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D3E2B608;
        Tue,  5 Apr 2022 16:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D3E2B608
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1649176976; bh=o87/K1qFBwU9iCXrR9IPmMxWC9du8YBylPWgPPYF9Ic=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Z0Vd6yv7oK5Zt1yrGgva9KRKhmrpen/biItjNM1Z3AS/F7MbrYuJCx2oYCraHI3uM
         fB3tVEsJD5UOkCRyGLYYg87tDkL/1nHqJ8e/VX2x3pPYg9ltdMT5aSR7WrOJ15dQ2J
         jDGixS0t8eQluQp/xJDth23sGz2ErPAcX3FF2i0KEtblNoGwhq6W6P+/OMh0PNDzlr
         tvbQO2eE9xT5Wb6xioNC4nmBUYiF9hGj8P8NeIf2Ld0H21en0eymQaDYjWqkQ0jz6v
         YC35UvZ58xgr6ZSrHqvcfe/KjSJwGqZbYCykIaCxblu1gqApXGKEGjpHX8MwChKUbY
         B79P5xdk2BuyA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add schedutil Chinese translation
In-Reply-To: <20220329072358.18914-1-tangyizhou@huawei.com>
References: <20220329072358.18914-1-tangyizhou@huawei.com>
Date:   Tue, 05 Apr 2022 10:42:55 -0600
Message-ID: <8735ireb1s.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> Translate scheduler/schedutil.rst into Chinese.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
> v2:
> Take Yangteng's advice.
>
>  .../translations/zh_CN/scheduler/index.rst    |   1 +
>  .../zh_CN/scheduler/schedutil.rst             | 165 ++++++++++++++++++
>  2 files changed, 166 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/scheduler/schedutil.rst

Applied, thanks.

jon
