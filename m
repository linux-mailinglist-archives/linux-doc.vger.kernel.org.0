Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 456BD6043A5
	for <lists+linux-doc@lfdr.de>; Wed, 19 Oct 2022 13:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbiJSLqD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Oct 2022 07:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbiJSLpe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Oct 2022 07:45:34 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5753EAC88;
        Wed, 19 Oct 2022 04:25:02 -0700 (PDT)
Date:   Wed, 19 Oct 2022 16:56:56 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1666169854;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9bz96zkP1XGg9TUKq1KwZhHm4pUCXMTFQTrop+dEiRE=;
        b=mkR6nHDfO+kaJbuyftQO1STjjkAMgmJ/YT03UsCr7Lo4TGCNkoFIy9qVClmRS/D8kAcI7L
        HDr8/z7uD2iTfz8G8iQa5+B1oNO/aJxL2j1le6aO86reU2d6tpd2ivLBln2sM1YYcm9uu4
        f+5EvzzeUkg9VVqibIEY++zS4TQnaXM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH v2 1/5] docs/zh_CN: Add rust/index Chinese translation
Message-ID: <Y0+72LZN/LNloiVy@bobwxc.mipc>
References: <cover.1666097959.git.siyanteng@loongson.cn>
 <ff9b07cc36c3e32b3ee5cd1a04be45851a3272e1.1666097959.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff9b07cc36c3e32b3ee5cd1a04be45851a3272e1.1666097959.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-10-18 (二) 21:04:21 +0800 Yanteng Si 曰：
> Translate .../rust/index.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  Documentation/translations/zh_CN/index.rst    |  1 +
>  .../translations/zh_CN/rust/index.rst         | 31 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/rust/index.rst

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

