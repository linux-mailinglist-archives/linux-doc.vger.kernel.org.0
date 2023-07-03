Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 999B2745E8B
	for <lists+linux-doc@lfdr.de>; Mon,  3 Jul 2023 16:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjGCOfq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Jul 2023 10:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjGCOfp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 10:35:45 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB1594;
        Mon,  3 Jul 2023 07:35:45 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E059A380;
        Mon,  3 Jul 2023 14:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E059A380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1688394945; bh=DK/Zjt0X/wkpOiqYyIxSo3gzv9UFdeyywGWFaQyeNRc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=gWgWeHOKiKkWU/1iTqTOWhcI+uo1108Dt8uwKRIjYigVW1CTVuHKch/7dJ+jbkxMa
         +5gMZ1b19JZ2O0RJD0URsCKA15w4N7gRSSLtj/jNDM8Uh8I668P4Zb9gfkJojINrZP
         +FjPMB2oxnaBAEoqCCMHwxmFl3R/G2KCfj9inIBlmaO15fTQIDbTC7BJVNd0aI8JTd
         ppvMwNbcNE3p1O/UV8u5sTT/7Zomh86IcGUBDeSRF0IJIU2gXrcdaJLodwk8cGL6ja
         +/IoQ6ZfNRw4bFYk8H946RC+d+tLGxigJP6DqIO26L9yXOXHO1mDTqpE7p51TdeuOh
         BPzXvzYQ1WxlA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     linux-doc@vger.kernel.org, workflows@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH docs] docs: remove the tips on how to submit patches
 from MAINTAINERS
In-Reply-To: <20230630171550.128296-1-kuba@kernel.org>
References: <20230630171550.128296-1-kuba@kernel.org>
Date:   Mon, 03 Jul 2023 08:35:44 -0600
Message-ID: <87mt0djc5b.fsf@meer.lwn.net>
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

Jakub Kicinski <kuba@kernel.org> writes:

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

Applied, thanks.

jon
