Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4277603E0F
	for <lists+linux-doc@lfdr.de>; Wed, 19 Oct 2022 11:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbiJSJKf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Oct 2022 05:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbiJSJKH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Oct 2022 05:10:07 -0400
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FD3B4885;
        Wed, 19 Oct 2022 02:01:37 -0700 (PDT)
Date:   Wed, 19 Oct 2022 16:59:04 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1666169960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5r9WXpsvT6fH7Yz7VBod1LYvGYbbYIGer4ws7o13/Is=;
        b=gb9QAvblkoACD4xLd0SkzXsi3NRciNXM039u0krATV4R2A438Ek4/rpjJefqR+MPex+DVP
        FEUrnpzQEZYwcHP9/Zm+nYpOlU2o1N/ozeurR6jFZ/+3GxO2rtI/+VQz1n4ojSM43ZOIgd
        Zopn3qRieSdbmmdNCZOCp9Y/WSghmWg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH v2 4/5] docs/zh_CN: Add rust/coding-guidelines Chinese
 translation
Message-ID: <Y0+8WJZI1LftB57P@bobwxc.mipc>
References: <cover.1666097959.git.siyanteng@loongson.cn>
 <c2795f10c65b4ff11c028a1f1f3cc9e2a55e520e.1666097959.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2795f10c65b4ff11c028a1f1f3cc9e2a55e520e.1666097959.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-10-18 (二) 21:07:00 +0800 Yanteng Si 曰：
> Translate .../rust/coding-guidelines.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../zh_CN/rust/coding-guidelines.rst          | 192 ++++++++++++++++++
>  .../translations/zh_CN/rust/index.rst         |   2 +-
>  2 files changed, 193 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/rust/coding-guidelines.rst

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

