Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1364470D0CA
	for <lists+linux-doc@lfdr.de>; Tue, 23 May 2023 04:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjEWCFT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 May 2023 22:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjEWCFT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 May 2023 22:05:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCAACA
        for <linux-doc@vger.kernel.org>; Mon, 22 May 2023 19:05:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5813E61756
        for <linux-doc@vger.kernel.org>; Tue, 23 May 2023 02:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E6CC433EF;
        Tue, 23 May 2023 02:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684807516;
        bh=98O7VgNuMGNSu4HhCRX9uBBylnf5BFeRBBwKmuvbrT0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YAI5QUiwwA/PgrlJUpl86lTlACOL6WjXMe5NPCtPARbqkscHf9GEMlPS8q6yqY9Kh
         GTw5qKJiEQdNvlL2jaO9SZEyNXWfizze5SrahuzRpjjXP2ixScBlnPhZjPAweQM20u
         2+7wKlJshdrlqUndHVflQ+DCMzJfpIqmhVLEN6ohRki0PWQQE7vtCcz6KLjsmLFo70
         09oW/1C5fPUGK9xuanYa5SHyqctgjTd7iw5AF0Sb/6H3pjiyVelBIJWTuuStv2lve8
         OfVlX5MZooOEJ5YnVay0Fy+bSb9rDYAgP/uho4WQ0ZYcwfae2VlJwGqZAU7mr9RKyh
         5RR39aM0AzlHg==
Date:   Mon, 22 May 2023 19:05:15 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH net] docs: netdev: document the existence of the mail
 bot
Message-ID: <20230522190515.2793193f@kernel.org>
In-Reply-To: <043df418-28f0-49e5-bff0-2ea511148bb6@lunn.ch>
References: <20230522230903.1853151-1-kuba@kernel.org>
        <043df418-28f0-49e5-bff0-2ea511148bb6@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 23 May 2023 03:46:46 +0200 Andrew Lunn wrote:
> > +Instead of delegating patchwork permissions netdev uses a simple mail
> > +bot which looks for special commands/lines within the emails sent to
> > +the mailing list. For example to mark a series as Changes Requested
> > +one needs to send the following line anywhere in the email thread::
> > +
> > +  pw-bot: changes-requested  
> 
> ...
> 
> > +  https://patchwork.hopto.org/pw-bot.html  
> 
> [Evil grin]
> So your patch did not trigger the bot. Lets see if my reply does?
> [/Evil grin]

Commands must be on separate lines, with no extra white space.
I wonder if that proves the documentation is insufficient :)
