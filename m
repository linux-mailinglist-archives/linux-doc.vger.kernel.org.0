Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9095452F3
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jun 2022 19:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237749AbiFIR2D (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Jun 2022 13:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244081AbiFIR2B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 13:28:01 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03303103F
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 10:27:52 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8B084732;
        Thu,  9 Jun 2022 17:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8B084732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1654795672; bh=iTm1peX9+9qZ1I7Q4HH2iIShuKNEk20QkxTAYUWLxl4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=RxvCfsvqC3X9FtMBRtJe+WtNJRLVWw/z1lKBgBcpDBinzW+/zAnnlcDK7gXvxs6vz
         mHOpMBjAG8bi8mAu3lXRPbNINGK4GkOGEJ2g/ogkdDEL0m/ddVQgOYUrS50W6Z140Y
         bBqWt0J0R87vQiT5yqqAX6dF0JkbQcGsNwopfXZ/R439u3xKkC1pdDM+ErxY8FByzo
         5Rma5dBbyf0fltu1ynNnGdp/Y+g5eqfEMM83Tib82vl5OQK6QqtX6JlH2wmTB3HlFH
         JB4umvdWkOMuxjFnydeyOug7ZY6K52aV4SPL+qAbc2RxgSpqatXNBvpP4WnXFSMWgR
         MZcV5YZDjP6RQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Simon Horman <simon.horman@corigine.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        oss-drivers@corigine.com
Subject: Re: [PATCH] docs: arm: tcm: Fix typo in description of TCM and MMU
 usage
In-Reply-To: <YqIjgt0Df2JYlmpF@corigine.com>
References: <20220603112729.222398-1-simon.horman@corigine.com>
 <87fskd4yiq.fsf@meer.lwn.net> <YqIjgt0Df2JYlmpF@corigine.com>
Date:   Thu, 09 Jun 2022 11:27:51 -0600
Message-ID: <877d5p4ui0.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Simon Horman <simon.horman@corigine.com> writes:

> On Thu, Jun 09, 2022 at 10:01:01AM -0600, Jonathan Corbet wrote:
>> Simon Horman <simon.horman@corigine.com> writes:
>> 
>> > Correct a typo in the description of interaction between
>> > the TCM and MMU.
>> >
>> > Found by inspection.
>> >
>> > Signed-off-by: Louis Peens <louis.peens@corigine.com>
>> > Signed-off-by: Simon Horman <simon.horman@corigine.com>
>> 
>> Here too I have to ask: what does this signoff chain mean?  If two
>> developers were needed for a single-character typo fix, then a
>> Co-developed-by line is appropriate.  If you are forwarding a patch from
>> Louis, then a From: line to get the authorship right is indicated ... ?
>
> The patch was created by me.
>
> Due to internal processes a release by a colleague is provided, that is the
> purpose of Louis's sign off (overkill in this case, I agree).
>
> If Louis's sign-off is not necessary from your perspective then I'm happy
> for you to drop it or for my to repost the patch without it.

So are you perhaps using it like a Reviewed-by?  If so, that's the tag
that should be used.  But Signed-off-by has a well-defined meaning
described by the DCO, and "release by a colleague" isn't in there, so
I think that tag is not appropriate in this patch.

Thanks,

jon
