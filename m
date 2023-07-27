Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF297657CC
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jul 2023 17:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232617AbjG0PgX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jul 2023 11:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbjG0PgS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 11:36:18 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF35F211C
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=MVJk0dYjbABiyZXzBLHcIMtJCZnsqFtdqsh7IgSJFJM=; b=YR2Z43JVws5DbzUkZaiRh0/cvX
        Wkw+oV2VFjFZCCueDFUpDTQH24O9ylc/HpivDoa1S61cFkCbZn6LnrEu7uk5l1VT1HZJlhdXbHfcT
        Tcw++LI86EZZeHu2f/V+jfTIOXCbvETsD9ckCGfTVSgW8IkZB96Z7rtCykkMnHr84BaJRjoHLYNna
        DJX5wBTOnbnqUU+c9FZj16J9Ww5nu4tVOhO+CoF6J28F71wEfTHeDLjPbvL2powz7QtgfXNu9xUsp
        EXPE0sT0wP612fgmXlwPtGTPTlyfm8Nio67Nn04r1OTpIpzAvDP+6V7Dc+ckTdPfU642YXLQMCtnc
        RATBN+5g==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qP329-00Fyfs-1p;
        Thu, 27 Jul 2023 15:36:09 +0000
Message-ID: <d975e31c-32da-804b-1828-2fc982624d16@infradead.org>
Date:   Thu, 27 Jul 2023 08:36:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 16/16] arm64: text replication: add Kconfig
Content-Language: en-US
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
 <E1qP2xR-001CYS-Ti@rmk-PC.armlinux.org.uk>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <E1qP2xR-001CYS-Ti@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Russell,

On 7/27/23 08:31, Russell King (Oracle) wrote:
> +config REPLICATE_KTEXT
> +	bool "Replicate kernel text across numa nodes"

Please use                                 NUMA
for consistency

> +	depends on NUMA
> +	help
> +	  Say Y here to enable replicating the kernel text across multiple
> +	  nodes in a NUMA cluster.  This trades memory for speed.

with	             ^^^^.

-- 
~Randy
