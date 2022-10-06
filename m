Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB8C5F5D92
	for <lists+linux-doc@lfdr.de>; Thu,  6 Oct 2022 02:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiJFAPH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Oct 2022 20:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbiJFAOz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Oct 2022 20:14:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B6727177;
        Wed,  5 Oct 2022 17:14:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8911FB81FC1;
        Thu,  6 Oct 2022 00:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BFCC433C1;
        Thu,  6 Oct 2022 00:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665015289;
        bh=RzEHCtYQC/zDpTfA+p0gGFDeA+FKp/h4fMYfMSol3G0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EKKKQBVl3M3GOnPAz7PM5W/azh6cP1b2bB+FXifCI4l53WpV/2V9YtEsREYDKJ2Gu
         s1ndfbL/59jNyybKqmds4DsTcewKL6twzaBL8g81feSepna2J2IvpvjgR8W+Kyrlx6
         b5YC56T9ptqWA7J05UmE9T/sRldrzki66ozSvEWY1dnlaIwVpoh/SYxiFiHWezxZ7L
         itQo0j96DTPqgNSC63NaMH2/bsIwHiAmCAqYhFlcyydAyA/cqSPblFjQmIiUV+f5r8
         ILXIsTdDN+A8t38NbiTNHe0H4JALp2jV5UAnlSY8ZxRg83+g7IjSE8C8jjTVzj/h3H
         srmwmw2/nXMhQ==
Date:   Wed, 5 Oct 2022 17:14:48 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Casper Andersson <casper.casan@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: networking: phy: add missing space
Message-ID: <20221005171448.21c8c595@kernel.org>
In-Reply-To: <8735c2bbqt.fsf@meer.lwn.net>
References: <20221004073242.304425-1-casper.casan@gmail.com>
        <6645ba3ba389dc6da8d16f063210441337db9249.camel@redhat.com>
        <a495dd76-060a-210a-1a11-55333d67180c@gmail.com>
        <30e3cee2-420b-b2bc-9af0-9f7e9c696c57@gmail.com>
        <8735c2bbqt.fsf@meer.lwn.net>
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

On Wed, 05 Oct 2022 08:12:26 -0600 Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> >> It is a documentation patch, therefore not functionally touching
> >> code, maybe that could count as an exception?  
> >
> > I think jon will pick up this patch, maybe as -rc-worthy fixes.  
> 
> The networking folks prefer to carry their own documentation patches,
> so I don't normally do that.  I'd be happy to this time with a
> suitable ack.
> 
> But honestly, there is nothing urgent about this change, I'd say just
> wait until net-next is open.

Sorry for the back and forth, the patch is waiting patchwork, we've 
just been unusually busy the last two days. We'll apply it soon.
