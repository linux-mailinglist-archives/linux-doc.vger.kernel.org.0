Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC994D3D81
	for <lists+linux-doc@lfdr.de>; Thu, 10 Mar 2022 00:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236134AbiCIXX6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Mar 2022 18:23:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbiCIXX6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 18:23:58 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177B2BF523
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 15:22:57 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7C9ED2CD;
        Wed,  9 Mar 2022 23:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7C9ED2CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1646868177; bh=XguK3/WP138NJ6GueO94MYPeWKYIrZRMQz0E9NO+T6A=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=GTrbcJvGKzYHq12tY5MML8JmEriu4kSSd1Yb5zriUTWw14Yi4prS/JIzU5UFY0HyJ
         TRLMGLjIL5fX8DJZF7UsbFcHI61hjJIqu0Q7AyLilec2Hwgg/7sA2X9hnLQ0FsizMW
         Wk6AHEK4X8d0nKNa3ZZZpxpt4pXWQ6X39gZFyl2Fe5+ogCwToZdji3w/XQcGr57YDy
         8W2PH8x8ujlN8vst0CyUFGhvRkoA8NMBrUghc6RczE2oDIn64XiJeG9erGbxPmkoCM
         oSfvy/AEfX4OdpYYuAKOw2hkGA/PbToN+w8AL6vHIwR5dp2DF5rJqbRPMBERh1kssh
         zwGUHEEsAwOcQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH 0/3] docs/zh_CN: add riscv vm-layout and peci translation
In-Reply-To: <cover.1645704571.git.siyanteng@loongson.cn>
References: <cover.1645704571.git.siyanteng@loongson.cn>
Date:   Wed, 09 Mar 2022 16:22:56 -0700
Message-ID: <87v8wm7ltb.fsf@meer.lwn.net>
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

Yanteng Si <siyanteng01@gmail.com> writes:

> v1:
> * Translate .../riscv/vm-layout.rst into Chinese.
> * Translate .../peci/* into Chinese.
>
> Yanteng Si (3):
>   docs/zh_CN: add riscv vm-layout translation
>   docs/zh_CN: add peci index translation
>   docs/zh_CN: add peci subsystem translation
>
>  Documentation/translations/zh_CN/index.rst    |  1 +
>  .../translations/zh_CN/peci/index.rst         | 26 +++++++
>  .../translations/zh_CN/peci/peci.rst          | 54 +++++++++++++++
>  .../translations/zh_CN/riscv/index.rst        |  1 +
>  .../translations/zh_CN/riscv/vm-layout.rst    | 67 +++++++++++++++++++
>  5 files changed, 149 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/peci/index.rst
>  create mode 100644 Documentation/translations/zh_CN/peci/peci.rst
>  create mode 100644 Documentation/translations/zh_CN/riscv/vm-layout.rst

Set applied, thanks.

jon
