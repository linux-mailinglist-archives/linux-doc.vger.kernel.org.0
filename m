Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4D77448DC
	for <lists+linux-doc@lfdr.de>; Sat,  1 Jul 2023 14:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjGAMUn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 1 Jul 2023 08:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjGAMUm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Jul 2023 08:20:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE35F4230
        for <linux-doc@vger.kernel.org>; Sat,  1 Jul 2023 05:20:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A20060B6D
        for <linux-doc@vger.kernel.org>; Sat,  1 Jul 2023 12:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93D08C433C9;
        Sat,  1 Jul 2023 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688214022;
        bh=j/F3EMJmjt1TzwbrXWlUlIvyAVC9WhXfUj+oiJF+y4U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=j21R695fzgXGo42ajgxlOziLZtRqvaNrpkC/b4v+yj9eC5iodwW+ZzEt7Y0aTYXw6
         An5NR2hsIkoLlNnGxdlJuqMGtvz3BDjjblGoalf3huASnz2WkWs0WSOAxnQjgZGjWQ
         fN7JxeC73BMQo66rgUfG/9Lr1tpSXKV5Bmfy03SCjpDbZ/S1BW4/NmrlxTGpyqF3Mc
         +RDj6gaywXoSRt3Mu1q9U7OuN+nmJmr2Mu2acTD0B4lY+EFN0FKVUNsL6zSMSy3mka
         IXaSfU/tVYEHoQVqMxcr/XVZj4KauNylaweGB6kI2kd2eZ9JPH0WDbhAyJl2hisI39
         xSOi3fSv6Nl4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79282C6445B;
        Sat,  1 Jul 2023 12:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] docs: netdev: broaden mailbot to all MAINTAINERS
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168821402249.27463.14270246072324876114.git-patchwork-notify@kernel.org>
Date:   Sat, 01 Jul 2023 12:20:22 +0000
References: <20230630160025.114692-1-kuba@kernel.org>
In-Reply-To: <20230630160025.114692-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, linux-doc@vger.kernel.org, corbet@lwn.net
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri, 30 Jun 2023 09:00:25 -0700 you wrote:
> Reword slightly now that all MAINTAINERS have access to the commands.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  Documentation/process/maintainer-netdev.rst | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net] docs: netdev: broaden mailbot to all MAINTAINERS
    https://git.kernel.org/netdev/net/c/d5dc39459bda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


