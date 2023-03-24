Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7025F6C76C1
	for <lists+linux-doc@lfdr.de>; Fri, 24 Mar 2023 06:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbjCXFAd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Mar 2023 01:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjCXFAb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Mar 2023 01:00:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D0E19F16;
        Thu, 23 Mar 2023 22:00:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9A1F36294A;
        Fri, 24 Mar 2023 05:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E78E1C4339E;
        Fri, 24 Mar 2023 05:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679634027;
        bh=hxIAAffVzfLjss74KiALSYBJthtXxacpq+QZ8plANiU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=JJ/aJ3eK4qwIzgVrOnil27HFmn5U7PHGDNwIdC/ihEDIJEK9VJDGGIE44a29UOtAB
         CIDnvt/w0H+9nIFC0kAIp5yt9znvIB71rxrA9qyY/p/mCwSPNTR/gVwHuLm1zxcXRs
         pKfUIUFUhgcaC7VC1i3BNPJS1wWrW2HNy5wpSIj/AEewgD1gJCoWVAadLeITiZ0sJ7
         PyFSN63dtFKAtjDkel6FFJcboETUpa19Ubq+ogr7qSqk9wZtLY0okHkexE1VsbtsDf
         Cn3lc1+znPUv4xVHSZq9AuG4gklICEFXDhFxLYBSlGzgRfvxJRksNFx7RKHf9SxKc2
         uoLVb9YsEsfww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C06D2E52511;
        Fri, 24 Mar 2023 05:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] docs: netdev: add note about Changes Requested and
 revising commit messages
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <167963402678.21241.359053559453446320.git-patchwork-notify@kernel.org>
Date:   Fri, 24 Mar 2023 05:00:26 +0000
References: <20230322231202.265835-1-kuba@kernel.org>
In-Reply-To: <20230322231202.265835-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, sean.anderson@seco.com, corbet@lwn.net,
        linux-doc@vger.kernel.org
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 22 Mar 2023 16:12:02 -0700 you wrote:
> One of the most commonly asked questions is "I answered all questions
> and don't need to make any code changes, why was the patch not applied".
> Document our time honored tradition of asking people to repost with
> improved commit messages, to record the answers to reviewer questions.
> 
> Take this opportunity to also recommend a change log format.
> 
> [...]

Here is the summary with links:
  - [net-next] docs: netdev: add note about Changes Requested and revising commit messages
    https://git.kernel.org/netdev/net-next/c/e110ba659271

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


