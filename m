Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD1552516B
	for <lists+linux-doc@lfdr.de>; Thu, 12 May 2022 17:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355794AbiELPkQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 12 May 2022 11:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348319AbiELPkO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 11:40:14 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A2C25C2A8
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 08:40:12 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:3d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 65888846;
        Thu, 12 May 2022 15:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 65888846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1652370012; bh=DiW0y0LmE34i0FTng7c2jrcxbaOIyWEsGymLb6R85oE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=YUN73+97vPj1kY3tDemQ8pufbrYPDyJwpHUzfNY7z0Zo5l1YHaO8gzyJK8chugLyf
         rXeLTbo4m6sBX6Bc86eOiFCncrFgQWjjVF0LYr1t6VjVBUyIE8VjcI/IwNGk7yNk4X
         kg13mm9LuV47V/I6Te1OpuhVMa03l/8KPgtcL+SrmUw1ATBb8VCMKjCEoFBewRNUa0
         BP+e/Y+bYukdU6SsFMAhz/vrJQLlRsRbdR37nFAxgsQcxuxzhR/wTEmAHQ3ZLHFMJF
         ds6jrYUBrzXccttHn8kIHpkJUx23vOazRNEFsWUxoszTBr2Cdyzjyj9iQawfHebeqW
         lEjxXzPNNgxrg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alex Shi <seakeel@gmail.com>,
        Huilong Deng <denghuilong@cdjrlc.com>, alexs@kernel.org
Cc:     siyanteng01@gmail.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs/zh_CN: fix devicetree usage-model translation
In-Reply-To: <df5cd5b7-238e-2e12-09e8-c892f0394818@gmail.com>
References: <20220510020135.55452-1-denghuilong@cdjrlc.com>
 <df5cd5b7-238e-2e12-09e8-c892f0394818@gmail.com>
Date:   Thu, 12 May 2022 09:40:11 -0600
Message-ID: <87mtfm4v50.fsf@meer.lwn.net>
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

Alex Shi <seakeel@gmail.com> writes:

> On 5/10/22 10:01, Huilong Deng wrote:
>> machine_desc is a item in devicetree, shouldn't be half translated. Let's
>> keep a whole word untranslated.
>> 
>> Signed-off-by: Huilong Deng <denghuilong@cdjrlc.com>
>
> Reviewed-by: Alex Shi <alexs@kernel.org>

Applied, thanks.

jon
