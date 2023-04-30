Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 089726F2B83
	for <lists+linux-doc@lfdr.de>; Mon,  1 May 2023 01:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjD3XUa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 30 Apr 2023 19:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjD3XU3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 30 Apr 2023 19:20:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9ABF1B9;
        Sun, 30 Apr 2023 16:20:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6658360EAB;
        Sun, 30 Apr 2023 23:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67117C433D2;
        Sun, 30 Apr 2023 23:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682896826;
        bh=Wby4jXsEn2wWUqVyugy9IuYPaC6jAOlmbTtdvi9V4vI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KT6OpYn9ZbW4V75+jRcBMPQCEF9gho+yjl3y9zBcpb8rhVvamCL8DZF4Ouhci2ZFh
         sJ496HtpJtXz5rJ0eGRiqtLpPntMZowuseux1dgTETN5LziyOFLNlnzPrUuBbLz24M
         y+YcMYlgnEDKQwGFf2UyjPvy9EV3CPqoKj1wnEbe7JwNiBrtQFYHJVHy0MdnHwXcrw
         Y7wlMrCMnfs/ykwyfYaQCUaISqvuIXSgWCwuGnrNz75x440+YwSpGPetoGN26wu+sz
         PSyBDfIPxk7D3mp0w3NzL29GfDDmuXIguWhk9vWzVbt6fbBPSSzD41r09ib9kZZUK3
         lia+vPYT/644Q==
Date:   Mon, 1 May 2023 00:20:21 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Costa Shulyupin <costa.shul@redhat.com>, linux-doc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: redirect from old arch to the new one
Message-ID: <20230501002021.44800b38@sal.lan>
In-Reply-To: <87r0s4b0pe.fsf@meer.lwn.net>
References: <20230427101241.1273752-1-costa.shul@redhat.com>
        <20230428132415.0d0f5a03@sal.lan>
        <87r0s4b0pe.fsf@meer.lwn.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 28 Apr 2023 07:22:53 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab@kernel.org> writes:
> 
> > Again, as this is something that only applies to websites hosting
> > documentation, IMO the best would be to have a separate file
> > ("conf_redirects.py") included on conf.py, that will be
> > auto-generated by a script that would receive, as input, the
> > initial Kernel version where redirects should be preserved.  
> 
> ...but again...I think we should observe an actual problem before we
> start adding any of this.  Otherwise we'll just end up carrying a bunch
> of cruft indefinitely.

Agreed. Just saying that, if this is a real problem, a custom conf.py
would be the best approach. 

Btw, if I'm not mistaken, our building system already allows it via:

	make SPHINX_CONF=conf-redirects.py htmldocs

I suspect that it would be possible to add redirects extension and
its parameters on it, if someone ever needs it. No need to carry
such stuff at the Kernel upstream, as this would very likely limited
to some web sites that would be interested on keeping links to
old documentation's location.

Regards,
Mauro
