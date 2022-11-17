Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C22262E852
	for <lists+linux-doc@lfdr.de>; Thu, 17 Nov 2022 23:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240866AbiKQWW7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Nov 2022 17:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240548AbiKQWWf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Nov 2022 17:22:35 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E6E905AB
        for <linux-doc@vger.kernel.org>; Thu, 17 Nov 2022 14:21:01 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id k15so3148270pfg.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Nov 2022 14:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bjS6jookRrLkIHeYFvmyUyMulRHdRVN48lVIAprlZtM=;
        b=esyTb2QqEwsZejmwz7RU3JJ/i5bs3jD0w1QGDpAJH1x7k6LWmTRroC60wf3LkiQZLN
         eNzs/WrAD9z01vxJieYSulq6bEkAItXkpfdFjaCTd8bVSYKNtAfLOfDVKDhmQHtNqztV
         AXvzI1owCvL7HdSQetShxaVlNBZX95DHdcPe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bjS6jookRrLkIHeYFvmyUyMulRHdRVN48lVIAprlZtM=;
        b=fQuKc031DB2L4NyV+JztuNzEzg0Cr51YM/7a9VQT22LTa/WLWuxDha2Uf6KbHpm5ki
         YJSVsxav3nvJUNG/d6p1iRlXzaD47z7iGvaEQqRReLpdy0XdCvypTNOMU1aifvHzNclg
         14107RObDYxAi7Lnawa54Q2yafALSnQNhKYds2LqvCWiHFmrsSKALP8iNR6ehYQGnJEX
         sTCgY5DRU1BzwqDevvGKSy/dDAZp83tE1Pxsv4ioUEszqBY35ml7qiQn9729/Yyc7o6B
         VY7K/YXzwzYxCh3STGZpJ/bG8YcJJX/xOit/00MsJdQDVSfarG1XY2HB2BHGj2FF01B2
         R1zA==
X-Gm-Message-State: ANoB5pmnsXXYdRv/PsVXgtI6WE5663qO5vcMHsIyLavOITUASLck+sie
        vBzh2hS3g1SEPB11SgJRrf/H+A==
X-Google-Smtp-Source: AA0mqf4r3HdCLyGjlDNNJSDNoS0327aEbPFi/nn+EtIWawSgs3Mp2p73ChMQv6KDBFKeTRgisUmgEQ==
X-Received: by 2002:a63:4b50:0:b0:459:16e5:9dd9 with SMTP id k16-20020a634b50000000b0045916e59dd9mr3927200pgl.362.1668723654307;
        Thu, 17 Nov 2022 14:20:54 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902650b00b00178b9c997e5sm1913492plk.138.2022.11.17.14.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 14:20:54 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 17 Nov 2022 14:20:53 -0800
To:     Ananda <a.badmaev@clicknet.pro>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        Minchan Kim <minchan@kernel.org>,
        Ananda Badmaev <a.badmaev@clicknet.pro>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Vitaly Wool <vitaly.wool@konsulko.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: zblock_alloc(): Memory - illegal accesses
Message-ID: <202211171419.FCDC8EE@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221117 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Nov 16 16:19:12 2022 -0800
    9097e28c25c8 ("mm: add zblock - new allocator for use via zpool API")

Coverity reported the following:

*** CID 1527352:  Memory - illegal accesses  (OVERRUN)
mm/zblock.c:320 in zblock_alloc()
314     	}
315     	list = &(pool->block_lists[block_type]);
316
317     check:
318     	spin_lock(&list->lock);
319     	/* check if there are free slots in cache */
vvv     CID 1527352:  Memory - illegal accesses  (OVERRUN)
vvv     Overrunning array of 10208 bytes at byte offset 10208 by dereferencing pointer "list".
320     	block = cache_find_block(list);
321     	if (block)
322     		goto found;
323     	spin_unlock(&list->lock);
324
325     	/* not found block with free slots try to allocate new empty block */

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527352 ("Memory - illegal accesses")
Fixes: 9097e28c25c8 ("mm: add zblock - new allocator for use via zpool API")

It looks like block_type is not checked to be < ARRAY_SIZE(block_desc)
after exiting the earlier loop, so the access through "list" may be past
the end of pool->block_lists.

Thanks for your attention!

-- 
Coverity-bot
