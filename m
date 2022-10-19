Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E34C60420C
	for <lists+linux-doc@lfdr.de>; Wed, 19 Oct 2022 12:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234608AbiJSKw6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Oct 2022 06:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234613AbiJSKwd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Oct 2022 06:52:33 -0400
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608B715F905;
        Wed, 19 Oct 2022 03:23:46 -0700 (PDT)
Date:   Wed, 19 Oct 2022 16:58:01 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1666169902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8LuF5Nnv9KqImB+Ir6FQc5Unma4bslqpFwlF0i2mlYs=;
        b=UXLQYV9o1ejFNqI63pou8IBgEp0S8xgo5YBOCKr3TnovhFBTNeVg1U+cV2hQ6ulWk6UaG5
        m2uLr5U51gV07XLK2mxEVVZ9uc+ihIIugEa8nHJxDwtXZcto+6f972Bmw3ZG4bHSIS/Xjt
        DGKB/baBIHjEhFTfShSk8SDvUpJs2c0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH v2 2/5] docs/zh_CN: Add rust/quick-start Chinese
 translation
Message-ID: <Y0+8GQjLHyspkVTi@bobwxc.mipc>
References: <cover.1666097959.git.siyanteng@loongson.cn>
 <82a36881a46eb8afcc754f81f196982ac3f6c735.1666097959.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82a36881a46eb8afcc754f81f196982ac3f6c735.1666097959.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-10-18 (二) 21:04:22 +0800 Yanteng Si 曰：
> Translate .../rust/quick-start.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/rust/index.rst         |   2 +-
>  .../translations/zh_CN/rust/quick-start.rst   | 211 ++++++++++++++++++
>  2 files changed, 212 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/rust/quick-start.rst

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

