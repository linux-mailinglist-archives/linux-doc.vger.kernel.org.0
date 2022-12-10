Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7D20648E81
	for <lists+linux-doc@lfdr.de>; Sat, 10 Dec 2022 12:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiLJLrd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 10 Dec 2022 06:47:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiLJLrd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Dec 2022 06:47:33 -0500
Received: from out-56.mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A0B1AA07
        for <linux-doc@vger.kernel.org>; Sat, 10 Dec 2022 03:47:31 -0800 (PST)
Date:   Sat, 10 Dec 2022 19:47:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670672850;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wf0BQwuK7HlbHyNdzAOrF4nfBFrWO1C8eR4DknLV8ZE=;
        b=OK6CnLSv7hB4gfdR2uMOe4OyhdEgtiZwRIJ8TimbVFjOvqp3ijxvpCnooZOyy/F+9xzOPn
        uJrZbfBVuLNp6g0mEM4fnR4GoWe/0Ju8uwhCBi8E1I1u5AmiXxdEydfW/rk1Tvzm6Qs4B6
        3lk8lhvrMR9Yl7WrpgEkqhLWLDayi2Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 11/13] docs/zh_CN: Update the translation of ksm to
 6.1-rc8
Message-ID: <Y5RxyAP1Yeb1XKzf@bobwxc.mipc>
References: <cover.1670642548.git.siyanteng@loongson.cn>
 <4d11b3d7b7223c16b38ef913a6a6de108a0886d3.1670642548.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d11b3d7b7223c16b38ef913a6a6de108a0886d3.1670642548.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-12-10 (六) 11:27:03 +0800 Yanteng Si 曰：
> Update to commit 21b7bdb504ae ("ksm: add profit monitoring
> documentation")
> 
> commit 94bfe85bde18 ("mm/vmstat: add events for ksm cow")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,

> ---
>  .../translations/zh_CN/admin-guide/mm/ksm.rst | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

