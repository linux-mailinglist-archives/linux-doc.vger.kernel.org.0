Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4A0452072A
	for <lists+linux-doc@lfdr.de>; Mon,  9 May 2022 23:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbiEIV6H (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 May 2022 17:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbiEIV4f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 17:56:35 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345F82D4B68
        for <linux-doc@vger.kernel.org>; Mon,  9 May 2022 14:50:23 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:3d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5B28A732;
        Mon,  9 May 2022 21:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5B28A732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1652133023; bh=AodzYZlkW2doakAahq2l1gShWPz2YuK8pNk69BxHM5I=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=gJVFWJyfLD089qrmp8ihBv3474XZKBuKRTaQWgyL87NgrwLR5tFriwEk+0jAFghM5
         uGycaESC8x65OoxBGYlkhbeRyqLH++Giqawcm6hxlVOXDGIFJEhTRu45qXBkWcuB09
         Sg8/IrrBJWw2ewodaAtU+j+oXt2ruw9jjiJmV2JyDPQOXyMFRqGwLhWLqPiRLZgg13
         f0tasKW/amHKxnnyLuQ5U1MV1YEWpT3G7Le5x+0teHYpmgN8zFAWaFUf4pWM+/lypp
         n6deHtdOZ74e7difCbOlSpc+X96lMZxR5bF+Cb3hBrtdbWtKnI9WXW921RsyTytkUq
         vRBBibD2dM23g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mm@kvack.org, linux-doc@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [PATCH v2] mm,doc: Add new documentation structure
In-Reply-To: <20220507134947.444287-1-willy@infradead.org>
References: <20220507134947.444287-1-willy@infradead.org>
Date:   Mon, 09 May 2022 15:50:22 -0600
Message-ID: <87sfpicr4x.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Matthew Wilcox (Oracle)" <willy@infradead.org> writes:

> Closely following the outline of Mel Gorman's book "Understanding the
> Linux Virtual Memory Manager", add a new outline.  Preserve the current
> contents of the mm underneath the new outline so we can transition those
> documents to a more sensible place later.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>

So this seems like a good start to me.

What's your intended path for merging this?  You didn't copy me so I'm
assuming you had some other way in mind.

Thanks,

jon
