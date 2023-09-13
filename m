Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 110E379F3D0
	for <lists+linux-doc@lfdr.de>; Wed, 13 Sep 2023 23:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjIMVad (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Sep 2023 17:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjIMVaa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Sep 2023 17:30:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E031724
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 14:30:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17BE8C433CA;
        Wed, 13 Sep 2023 21:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694640626;
        bh=LXThKj7Ezb5QDDo4BX4Q+8iOUjMVr0VA9vtCmpwOfwE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=s7lQXOxA4FR47TglrPhqnCPZFpQrMLvQEtejH4TYxBzDeZ7ioM0XvXO1oNaU635bM
         r1aNubQgcIFMTkCqmCaQtDkFEsxJFFMoDkEnxaTVo1RBmNLJggVCjbIcT241JagML1
         mn3NVyv0Fl0+I9B344i5G7SrJNvZjRU1CnM4liHxnYlcQquHJc+WbsoHMA9WL74TdL
         8T+fMvgHNk6w91L2lL8DFHIh0lKH50KKJ0G+fGE9tRdnnuIzd6vVvzb9ffJhEe+CQP
         ihqebPWLP9u83SUn3NiDQQp/Gtks6PeO/WRKesTgJvp2xwF0dwxbAq1a5DydLV95SI
         qBMOJ5ksg5Euw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EDA80C64459;
        Wed, 13 Sep 2023 21:30:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf] docs/bpf: update out-of-date doc in BPF flow dissector
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169464062596.8992.16050814156574407725.git-patchwork-notify@kernel.org>
Date:   Wed, 13 Sep 2023 21:30:25 +0000
References: <20230911152353.8280-1-qtian@vmware.com>
In-Reply-To: <20230911152353.8280-1-qtian@vmware.com>
To:     Quan Tian <qtian@vmware.com>
Cc:     bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
        andrii@kernel.org, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com,
        kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
        jolsa@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Martin KaFai Lau <martin.lau@kernel.org>:

On Mon, 11 Sep 2023 15:23:53 +0000 you wrote:
> Commit a5e2151ff9d5 ("net/ipv6: SKB symmetric hash should incorporate
> transport ports") removed the use of FLOW_DISSECTOR_F_STOP_AT_FLOW_LABEL
> in __skb_get_hash_symmetric(), making the doc out-of-date.
> 
> Signed-off-by: Quan Tian <qtian@vmware.com>
> ---
>  Documentation/bpf/prog_flow_dissector.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [bpf] docs/bpf: update out-of-date doc in BPF flow dissector
    https://git.kernel.org/bpf/bpf-next/c/558c50cc3b13

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


