Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6474351725F
	for <lists+linux-doc@lfdr.de>; Mon,  2 May 2022 17:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359468AbiEBPWT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 May 2022 11:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236020AbiEBPWS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 May 2022 11:22:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFB512741;
        Mon,  2 May 2022 08:18:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14947474;
        Mon,  2 May 2022 17:18:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1651504723;
        bh=/r3yah2DFMNncEDNBwinB7adfs3LjzUwmeMYJ2hOTv0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Yjnmw4lTWK3mQDsKyUoBGYY5nYXkqE68WToL5TJa2eTxbA1oQU+J2DutR5bld/nv1
         pIcr4kGUbd2c0dco3O/6E6hUxAr2c3ZlEzUN3t8a9PzBtLrqj20nLMChJXyIBDrU1C
         vUequqc8n3n1gID6nPeqf906GSyM2Nt/IB+ZmuNc=
Date:   Mon, 2 May 2022 18:18:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@kernel.org>, torvalds@linux-foundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        Thomas Osterried <thomas@osterried.de>
Subject: Re: Driver graveyard
Message-ID: <Ym/2U0elJvJM3hmN@pendragon.ideasonboard.com>
References: <20220502071818.5101c752@kernel.org>
 <87ee1cxb2o.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ee1cxb2o.fsf@meer.lwn.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 02, 2022 at 08:29:03AM -0600, Jonathan Corbet wrote:
> Jakub Kicinski <kuba@kernel.org> writes:
> 
> > Hi!
> >
> > Thomas suggested that it may be nice to create some form of a record
> > for drivers which were retired from the tree. I think a code-centric
> > equivalent of CREDITS could be a good idea.
> >
> > Does such a record already exist somewhere? If not any thoughts on
> > creating a file storing (Kconfig, short description, commit which
> > removed the driver)? E.g.
> >
> >
> > K: DMASCC
> > D: Hamradio high-speed (DMA) SCC driver for AX.25. Driver supported
> > D: Ottawa PI/PI2, Paccomm/Gracilis D: PackeTwin, and S5SCC/DMA boards.
> > C: 865e2eb08f51
> 
> So what is the purpose for this file?  And more to the point, I guess:
> is there a need for it to be strictly machine-readable?  If the
> objective is to remember our history to minimize our chances of
> repeating it, something more prose-oriented might work better.

I can imagine it being potentially useful if someone wants to resurect a
driver, that file would be easier to search than the git history, but
maybe web search engines will keep linking to older kernel sources for
long enough.

On a side note, navigating removals is something git doesn't make easy:
git blame will tell when a line has been added (or modified), but
figuring out when a line has been removed is more difficult. Or is it
one of git's features that I simply don't know about ?

-- 
Regards,

Laurent Pinchart
