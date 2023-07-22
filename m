Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13FD675D8E0
	for <lists+linux-doc@lfdr.de>; Sat, 22 Jul 2023 04:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjGVCKX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 Jul 2023 22:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjGVCKV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Jul 2023 22:10:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167E330D0
        for <linux-doc@vger.kernel.org>; Fri, 21 Jul 2023 19:10:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A16EA61DBC
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 02:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01BE9C433C9;
        Sat, 22 Jul 2023 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689991820;
        bh=UsCL7n8ZbjFv4PmIhx+hchDRbus/yXH2TcTibEMKQPI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=iFrk2Ed5dPfUEgtQNRh+YL/UOdsVT7VgONhIcqQvt23ut5Wv1qUY54NoLlJq4f+HS
         lSYGLDLVLAJf4TLou829hCieDbBnIQMxMbzrjZo6fE8lMEHTpQ+oDTlpLUY5wS1NTE
         PEcXySfxRQzoS5Fj+HNNwSbum0aHCmJjKCdhgVID/NRQgJLC8Cu5DFHCKC66pXH00F
         5ucJQH6nhvzl9XiMja3gxBgVc8LKkW+J1+4fzqf+zYncm2vTNHyqERIeUlxZMQwmvJ
         TGsRUFtxrumE/yUwvTDg5MZueW2XfNrFUxdbCt5f/hiH5RKAuZLhi0LKVhzwQoPy9l
         5sDtQkGx1s2mw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D7CACC595C1;
        Sat, 22 Jul 2023 02:10:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] docs: net: clarify the NAPI rules around XDP Tx
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168999181988.11383.16650443656675994636.git-patchwork-notify@kernel.org>
Date:   Sat, 22 Jul 2023 02:10:19 +0000
References: <20230720161323.2025379-1-kuba@kernel.org>
In-Reply-To: <20230720161323.2025379-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, linux-doc@vger.kernel.org
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
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 20 Jul 2023 09:13:23 -0700 you wrote:
> page pool and XDP should not be accessed from IRQ context
> which may happen if drivers try to clean up XDP TX with
> NAPI budget of 0.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: linux-doc@vger.kernel.org
> 
> [...]

Here is the summary with links:
  - [net] docs: net: clarify the NAPI rules around XDP Tx
    https://git.kernel.org/netdev/net/c/32ad45b76990

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


