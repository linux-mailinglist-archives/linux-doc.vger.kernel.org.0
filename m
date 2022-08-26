Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 788975A1DA3
	for <lists+linux-doc@lfdr.de>; Fri, 26 Aug 2022 02:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiHZALP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 25 Aug 2022 20:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiHZALO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 20:11:14 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56A65B78F
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 17:11:12 -0700 (PDT)
Date:   Fri, 26 Aug 2022 08:10:46 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1661472671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yUGt2hm0bFEfMMa9wCr2IlahsThFjzxQwNE5vy/YgUY=;
        b=LOtTQtSm66TMkdro4ahMJdXWNjQANFzAApRXgBbmgCcRIWUzma6by2Ll85+SJQcifqrT5S
        KSvfOVSgpV5MW8775p7Azejl61B0bP4iBuff6SvAQGH1P/P/qr1HR0oaL5lNJD5mPuZfgf
        IWwl/lIJ7ZYYIgjOj9Vs4LKLier+FM4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com,
        corbet@lwn.net, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        xiyou.wangcong@gmail.com, hidave.darkstar@gmail.com,
        tekkamanninja@gmail.com, leoyang.li@nxp.com, src.res@email.cn,
        linux-doc-tw-discuss@lists.sourceforge.net
Subject: Re: [PATCH v1 2/3] docs/zh_CN: Remove IRQ and oops-tracing
Message-ID: <YwgPhr3tUUQVCVzA@bobwxc.mipc>
References: <cover.1661431365.git.siyanteng@loongson.cn>
 <7dc43c33ea7e2edf668070b203dce83b285f2cdb.1661431365.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7dc43c33ea7e2edf668070b203dce83b285f2cdb.1661431365.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-08-25 (四) 20:53:26 +0800 Yanteng Si 曰：
> The English version of IRQ has been refactored and
> the new document (not called that anymore) has been
> moved to core-api/irq, which has been translated
> into Chinese. oops-tracing is pretty much the same,
> let's remove them.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  Documentation/translations/zh_CN/IRQ.txt      |  39 ----
>  .../translations/zh_CN/oops-tracing.txt       | 212 ------------------
>  2 files changed, 251 deletions(-)
>  delete mode 100644 Documentation/translations/zh_CN/IRQ.txt
>  delete mode 100644 Documentation/translations/zh_CN/oops-tracing.txt
> 

Thanks,

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

