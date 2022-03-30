Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFE54ECA4A
	for <lists+linux-doc@lfdr.de>; Wed, 30 Mar 2022 19:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbiC3RJS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 30 Mar 2022 13:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244956AbiC3RJR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Mar 2022 13:09:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0395546145
        for <linux-doc@vger.kernel.org>; Wed, 30 Mar 2022 10:07:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AD1ACB81DA8
        for <linux-doc@vger.kernel.org>; Wed, 30 Mar 2022 17:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF74C340EE;
        Wed, 30 Mar 2022 17:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648660049;
        bh=lPBt1qdHRnf9hgD4+I+2qpHMJZasYYfalluKXphu1AA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nhdPawYch0j4LKUCUo2sVDwbdZRWeneLmxzyShRoeChwdLFep9ETYChlvkXGeLt3H
         9c2OucTY5F8hKaz0jEDn5aMstJDs8x2vnqHRwIVMuyY4nYWsvhbPD2Vd/n7miGfOCd
         vQ6eiLCmplsBDjOUOjpBNb/0Q0eqz9oGP3OyO0BeyB7W/jZXnzkbEB/2+sCmS8dVnw
         R2gFAb06UQJeLOMzSSRoBESHTSvQ4LvoLr5EF5dTN2t976dooNcEN7TeqzxoSuulYX
         OUmIOEE+L4lCQh+9k6poxs2XkqAQ87kBkdbWO8joc55jp6jWdwDneAjppWWlSh0E69
         2s7Xxs6D28KFA==
Date:   Wed, 30 Mar 2022 19:07:24 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
Message-ID: <20220330190724.1596e01a@coco.lan>
In-Reply-To: <ed2690db-84ae-5c85-f65d-e08021f5f562@gmail.com>
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
        <871qyk7p28.fsf@meer.lwn.net>
        <20220330022534.10ac0a50@coco.lan>
        <ed2690db-84ae-5c85-f65d-e08021f5f562@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
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

Em Wed, 30 Mar 2022 23:59:05 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Hi Mauro,
> 
> On Wed, 30 Mar 2022 02:25:34 +0200,
> Mauro Carvalho Chehab wrote:
> [...]
> > We need to verify both PDF and html generation, though, as I remember
> > that some 4.x versions had/(have?) issues with the C domain and duplicate
> > symbols detection.  
> 
> Can you elaborate on the issue you observed?
> In which document did you see it?

Sorry, it was on Sphinx 3.x, although the most complete fix got
merged on 4.0, I guess. This patch is related to it:

	b34b86d7a418 ("docs: conf.py: fix c:function support with Sphinx 3.x")

Basically, the Sphinx maintainer for the C domain rewrote the code,
causing all references generated by kernel-doc to be broken, and
almost all references at the media docs as well. Before the changes,
there were just one domain for C code references, used for functions,
structs, enums, etc. After the change, each one requires a different
tag. The kerneldoc script has gained support for Sphinx version when
such issue was addressed.

Another consequence of such change is that you can't have more than
one "read()" function inside the entire Kernel. While this makes
sense on userspace, It doesn't at Kernelspace, as different subsystems
may handle read/write/ioctl/... syscalls on their particular ways.
So, building docs were causing warnings about duplicated symbols.

There were some changes that went on 4.x to fix it, when 
".. c:namespace::" got merged. I don't remember when it was added.

> Verification of generated HTML and PDF can be hard.
> 
> Different Sphinx might generate slightly different .html or .tex
> files with no visible effect in the final rendering.  Hmm...

That was not the case on that time. We had to stick to Sphinx up to
version 2.4 for a couple of Kernel release cycles, in order to fix, as the
changes weren't trivial.

> Do you have an idea for automated regression testing?

Except for doing periodic html and pdf builds and reporting build errors,
no.

For html, perhaps some regression testing could be done by using pandoc
to convert html back into ReST (or to some other format) and compare if the
output from the same source with different Sphinx versions are identical 
(or similar enough). On such case, I would get rid of using read the docs
style, using the simplest possible one. That's easier said than done, though,
as such conversion could produce errors due to problems on pandoc - or some
minor differences - So, whomever would be running such tests would likely
need to add something in order to handle similar but different outputs and
exclude false-positives.

> 
> > 
> > Also, it could be worth to check the build time with 2.4.4 and with
> > whatever newer version we stick.  
> 
> I agree. I'll see what I can do.
> 
>         Thanks, Akira
> 
> >   
> >> So I'll just fast-track this
> >> patch in; dropping it into the stable updates probably makes sense too.  
> > 
> > Agreed.
> > 
> > Thanks,
> > Mauro  



Thanks,
Mauro
