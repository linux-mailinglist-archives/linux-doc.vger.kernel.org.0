Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53465790660
	for <lists+linux-doc@lfdr.de>; Sat,  2 Sep 2023 10:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244759AbjIBIpZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 2 Sep 2023 04:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351863AbjIBIpZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Sep 2023 04:45:25 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4701706;
        Sat,  2 Sep 2023 01:45:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 6AE2ACE02C1;
        Sat,  2 Sep 2023 08:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D006C433C8;
        Sat,  2 Sep 2023 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693644318;
        bh=D0VKU97IUIqN1bvcHCUYCp6kzWS5ndv73r4TdZg6LEg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o16YLLhT69i2vF6xGy67WPGceqraJOO3yohv2/UY7wo2GrApWjzfLsB1hyvHKula1
         UfFPX2Y12JAWj3NvgYhaVtfqVMZBCzX3WdkuF4d6iJMUkrIgSNJkPh+RxhVyZ9APLr
         LHhWWQBGOgPiL2pjbWsZbxaSxv/blZD/GATDX6t9KXn4e48LEpuGsKS1iNtwHg/dEk
         zK7G3ud5lAOhseADajxGI3My4Hx1c2rwuCtgEY+47sFssxJG0De0HLIkl+NAESnPiE
         AVvE7z71O7kBsgep31PdeMGpCplnhaKiJFoT5TE83T+H1ckxloPxYxL5QTENZhyIdJ
         fdRcrT9PLT9cQ==
Date:   Sat, 2 Sep 2023 10:45:14 +0200
From:   Simon Horman <horms@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net] docs: netdev: update the netdev infra URLs
Message-ID: <20230902084514.GA2146@kernel.org>
References: <20230901211718.739139-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901211718.739139-1-kuba@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 01, 2023 at 02:17:18PM -0700, Jakub Kicinski wrote:
> Some corporate proxies block our current NIPA URLs because
> they use a free / shady DNS domain. As suggested by Jesse
> we got a new DNS entry from Konstantin - netdev.bots.linux.dev,
> use it.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>

