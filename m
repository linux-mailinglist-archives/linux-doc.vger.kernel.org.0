Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D0B70D162
	for <lists+linux-doc@lfdr.de>; Tue, 23 May 2023 04:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjEWCij (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 May 2023 22:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234721AbjEWCig (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 May 2023 22:38:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F152A19B
        for <linux-doc@vger.kernel.org>; Mon, 22 May 2023 19:38:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 53371616CB
        for <linux-doc@vger.kernel.org>; Tue, 23 May 2023 02:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5999EC433D2;
        Tue, 23 May 2023 02:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684809507;
        bh=bMQX7nxLNAZp0941mwLdOgEWnsP6ucv1KeEe2O/NpT8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=o3Gs7Sk7Sp+Lbl6n2tEs3E4bYqtkYMKda+4PlCDojdgItyBmUfjioKzFQV3jzB6zX
         Uw5r9uhGfCZLO7wmRwxPkHXFw9wPKSpkah2TmK0nXQG5/OhE320HZdWveEo/9g8dQi
         7uz6R5DzqnuuaTwjMvC5rElczyEr930FABy3/dDeEAVgUnhlLTacgepBqqAP/Ergv3
         okZE2cL8xQC1L17Kz4n0X9nGGAzRBqKrA73vMql6NEBU0wUXYmmJwDY/Uz9vCsLNgH
         /D/woeIv5slR8DMyVJOiqxZaVQcvJtDMdq5lQPAEeiMefHMCwtPQoF+CiAJSAWSQri
         pVv330gOOTC9Q==
Date:   Mon, 22 May 2023 19:38:26 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        donald.hunter@redhat.com
Subject: Re: [patch net-next v1 2/2] tools: ynl: Handle byte-order in struct
 members
Message-ID: <20230522193826.48ecdd59@kernel.org>
In-Reply-To: <20230521170733.13151-3-donald.hunter@gmail.com>
References: <20230521170733.13151-1-donald.hunter@gmail.com>
        <20230521170733.13151-3-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 21 May 2023 18:07:33 +0100 Donald Hunter wrote:
> Add support for byte-order in struct members in the genetlink-legacy
> spec.

Acked-by: Jakub Kicinski <kuba@kernel.org>

Which spec is this for? 
