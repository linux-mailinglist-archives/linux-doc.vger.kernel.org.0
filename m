Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B05C9744493
	for <lists+linux-doc@lfdr.de>; Sat,  1 Jul 2023 00:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbjF3WOw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 30 Jun 2023 18:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbjF3WOv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 18:14:51 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBAE3C22;
        Fri, 30 Jun 2023 15:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=bBmF8PoAQEZMJlbfm9Trh4AS+Z1wbpxDhtVNF9ChCns=; b=Tj4EmHA2DdYSG8yLlZQhDVazSm
        YZ4qyO7cSH+9Vm+yCARCF4qVw6Kx1Ocw/dTKPJnmfX0KJVQg1gzq7RzzT72L0pMOL0wmk7T8N/hwl
        8cbOFUHFTibFu7IrlK5bVHKC8ime/wckAqPLwFa2BSTRYYcyQh5/BGGGUWWtpCu9xG3McLjnh7csU
        nHhf+XysQ39d75F5N/BEAuWfwrDHsPCY98nxhAM+09PW2nwZBFCfRMGFPWey25u0kDsQmfb5duz45
        +iv01UZam/guOSjcezd9gjPslMY6lsCSk6EFdUt/4vu5IuteP0l5PUAkIfiaMlExL8pbT0vXmfS5H
        AJA9jt9g==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qFMOA-004ezY-04;
        Fri, 30 Jun 2023 22:14:50 +0000
Message-ID: <4b9937d8-59b5-5a9a-df72-e7fa33728e41@infradead.org>
Date:   Fri, 30 Jun 2023 15:14:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH docs] docs: remove the tips on how to submit patches from
 MAINTAINERS
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, workflows@vger.kernel.org
References: <20230630171550.128296-1-kuba@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230630171550.128296-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 6/30/23 10:15, Jakub Kicinski wrote:
> Having "how to submit patches" in MAINTAINTERS seems out of place.
> We have a whole section of documentation about it, duplication
> is harmful and a lot of the text looks really out of date.
> 
> Sections 1, 2 and 4 look really, really old and not applicable
> to the modern process.
> 
> Section 3 is obvious but also we have build bots now.
> 
> Section 5 is a bit outdated (diff -u?!). But I like the part
> about factoring out shared code, so add that to process docs.
> 
> Section 6 is unnecessary?
> 
> Section 7 is covered by more appropriate docs.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  Documentation/process/6.Followthrough.rst |  7 ++
>  MAINTAINERS                               | 80 +----------------------
>  2 files changed, 9 insertions(+), 78 deletions(-)

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
