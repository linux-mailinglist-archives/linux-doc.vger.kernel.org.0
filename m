Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 479C2632ECC
	for <lists+linux-doc@lfdr.de>; Mon, 21 Nov 2022 22:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbiKUV1R (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Nov 2022 16:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbiKUV05 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 16:26:57 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C7CBE85C
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 13:26:52 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0BCF8377;
        Mon, 21 Nov 2022 21:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0BCF8377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1669066012; bh=LDZ8Up9MlkXk8qw9x6+X6LZ22y8bfIvRYKhrwL1u8ZY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VwSyAEkkxGOpjL3M2FNjRy/stheK1+fLgA1dqJJ6JilMP+aGF7LwYMtsOsLWYakdb
         gDqCv2nMGu8BVWTKwuUNsIRfaAStF8mNM0LipGIXnf3xHoC0wySl9vJqHwy920AIS4
         F5C4vU7Irlq+FL6wXeYzH1i9YT7hk0CDhvY+IleXktAkdZmm0Ty5tQQrxUuJgrf5QW
         anAcUXcsiLBQrBc6QrCWw+pOVSV36Ujd0wf++bsKnD+AFNiRmAHxI+yTVwXmS9Nkim
         Ki0SSnCKqAEvV/OvBUsGLSTH5ncuAxD38RB05T7uLx2gfReXn1HIrWjuqRk3hm0U9O
         G4+46YR+JJ1QQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Maxim Cournoyer <maxim.cournoyer@gmail.com>,
        linux-doc@vger.kernel.org
Cc:     Maxim Cournoyer <maxim.cournoyer@gmail.com>
Subject: Re: [PATCH v2 1/2] doc: add texinfodocs and infodocs targets
In-Reply-To: <20221116190210.28407-2-maxim.cournoyer@gmail.com>
References: <20221116190210.28407-1-maxim.cournoyer@gmail.com>
 <20221116190210.28407-2-maxim.cournoyer@gmail.com>
Date:   Mon, 21 Nov 2022 14:26:51 -0700
Message-ID: <877czo9exw.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Maxim Cournoyer <maxim.cournoyer@gmail.com> writes:

> Sphinx supports generating Texinfo sources and Info documentation,
> which can be navigated easily and is convenient to search (via the
> indexed nodes or anchors, for example).
>
> Signed-off-by: Maxim Cournoyer <maxim.cournoyer@gmail.com>
> ---
>  Documentation/Makefile                     | 11 +++++++++++
>  Documentation/userspace-api/media/Makefile |  3 ++-
>  Makefile                                   |  2 +-
>  3 files changed, 14 insertions(+), 2 deletions(-)

Wow, I thought that HTML output from Sphinx was slow, but texinfo is
another thing altogether...

Oh well, I guess for some folks it's worth waiting for, so I've applied
this patch, thanks.

jon
