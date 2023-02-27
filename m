Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 378B96A4960
	for <lists+linux-doc@lfdr.de>; Mon, 27 Feb 2023 19:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjB0SPK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Feb 2023 13:15:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbjB0SPJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Feb 2023 13:15:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D31D91ADE0;
        Mon, 27 Feb 2023 10:15:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7EC66B80D99;
        Mon, 27 Feb 2023 18:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AC0C4339B;
        Mon, 27 Feb 2023 18:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677521706;
        bh=cncdIkMR1gprp4HuOs6wGtWWUUc1+D/y8p1+f7FwAxA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=e19Ub1od5SnXaKZqM4CWFmZX80lC6pVJEoVGG90aM5lX1mtVz9VfIknmYsNMaZID1
         3RjKMfpG57j9oyB+oF4TJkH3VEJBVF40rZEFwed+yUHFlemusyj+WWYTCDgd+0qe+c
         Vz6T5kFlsEr5Or65mQSzMYiY57Iy7wGByWZnwQGuaj71IXrFUWu1JeXNDZu3kp6Jc7
         DasbyC4sHhaabBk0wm9oS1oUiB/DMIdi4eSzFJf6IIGQ4/94xYufpdj3MGDoaI1mXF
         J+vmkTVO7SwmgFZ5La9eBhHnQDmk/c0u+xyhjebd4fO/AP+qvpJ2VmFoDGJPk5fKC0
         v+m+u87G1/wNw==
Date:   Mon, 27 Feb 2023 10:15:04 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Brian Haley <haleyb.dev@gmail.com>, davem@davemloft.net,
        edumazet@google.com, pabeni@redhat.com, corbet@lwn.net,
        den@openvz.org, razor@blackwall.org, ulf.hansson@linaro.org,
        Jason@zx2c4.com, wangyuweihx@gmail.com, daniel@iogearbox.net,
        thomas.zeitlhofer+lkml@ze-it.at, alexander@mihalicyn.com,
        ja@ssi.bg, netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.2 31/53] neighbor: fix proxy_delay usage when
 it is zero
Message-ID: <20230227101504.45ef890c@kernel.org>
In-Reply-To: <20230226144446.824580-31-sashal@kernel.org>
References: <20230226144446.824580-1-sashal@kernel.org>
        <20230226144446.824580-31-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 26 Feb 2023 09:44:23 -0500 Sasha Levin wrote:
> From: Brian Haley <haleyb.dev@gmail.com>
> 
> [ Upstream commit 62e395f82d04510b0f86e5e603e29412be88596f ]
> 
> When set to zero, the neighbor sysctl proxy_delay value
> does not cause an immediate reply for ARP/ND requests
> as expected, it instead causes a random delay between
> [0, U32_MAX). Looking at this comment from
> __get_random_u32_below() explains the reason:

Potential behavior change, can we wait 4 weeks, until it's been 
in a couple of -rcs?
