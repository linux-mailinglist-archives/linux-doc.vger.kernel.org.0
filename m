Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22D146B6EF
	for <lists+linux-doc@lfdr.de>; Tue,  7 Dec 2021 10:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbhLGJYR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 7 Dec 2021 04:24:17 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:40466 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233657AbhLGJYR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Dec 2021 04:24:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E989ECE1A22;
        Tue,  7 Dec 2021 09:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F07C341C3;
        Tue,  7 Dec 2021 09:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638868844;
        bh=jr4AQwW0Ku1H2pVlYzn/HiQYDt4S3BGML8+KQWnqfbE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HrNsTek6KqaGRTBCTOxqHiaKi4YFgjTmt90+9L2rBvHH08Ze3H9bP+JmF/T4oThtV
         5GoSey2pFkv48hSMQvwHJ8LM6dROFnNuiXiSYrwg+EriaUW6Y5sSMjXzobLG5Ko5N8
         gaO6nmn+/s/8JcmDas/0dVx36SFgp+ZQwf96DLmCwN3FiuEaRosEzkQkxdVKoIFUZu
         vFp9lQ2SRl26tt6MZj6EcCIBZ4DBihLdGr0AuYSmWlYxsw/MYjAJbwx/9N1GwhQvdN
         OcsZGiQorgf/bfG9GYgG0FSUXjO9pwVvAAOmPIj9AM7VNBF4JgD2CoK0QM+JUljVLf
         n1xcBHAlmNeYA==
Date:   Tue, 7 Dec 2021 10:20:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        " =?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@protonmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Klychkov <andrew.a.klychkov@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] docs: allow selecting a Sphinx theme
Message-ID: <20211207102038.1e8a4f8c@coco.lan>
In-Reply-To: <20211207101622.6a3b3c4f@coco.lan>
References: <cover.1638369365.git.mchehab+huawei@kernel.org>
        <eb4e49b9a701643b07a56f1863005ba8216ef694.1638369365.git.mchehab+huawei@kernel.org>
        <878rwx35v7.fsf@meer.lwn.net>
        <20211206211421.6eeb990d@coco.lan>
        <87mtld1gy1.fsf@meer.lwn.net>
        <20211207101622.6a3b3c4f@coco.lan>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 7 Dec 2021 10:16:22 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Mon, 06 Dec 2021 15:55:50 -0700
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> >   
> > > Em Mon, 06 Dec 2021 12:12:12 -0700
> > > Jonathan Corbet <corbet@lwn.net> escreveu:
> > >    
> > >> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> > >>     
> > >> > Instead of having RTD as an almost mandatory theme, allow the
> > >> > user to select other themes via a THEMES environment var.
> > >> >
> > >> > There's a catch, though: as the current theme override logic is
> > >> > dependent of the RTD theme, we need to move the code which
> > >> > adds the CSS overrides to be inside the RTD theme logic.
> > >> >
> > >> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > >> > ---
> > >> >
> > >> > See [PATCH v3 0/4] at: https://lore.kernel.org/all/cover.1638369365.git.mchehab+huawei@kernel.org/
> > >> >
> > >> >  Documentation/Makefile             |  3 ++
> > >> >  Documentation/conf.py              | 52 +++++++++++++++++-------------
> > >> >  Documentation/doc-guide/sphinx.rst |  8 +++++
> > >> >  3 files changed, 41 insertions(+), 22 deletions(-)      
> > >> 
> > >> So I'm playing with this now, and definitely want to apply it.  I do
> > >> have one little worry, though...  THEME seems like an overly general
> > >> name to use here, and seems relatively likely to conflict with other
> > >> uses.  THEME= on the command line is fine, but what do you think about
> > >> something like DOCS_THEME for the environment variable?  Or even
> > >> HTML_THEME as Sphinx uses?    
> > >
> > > I'm not sure if we will ever consider a "THEME" environment var for anything
> > > but docs and html stuff. That's why I ended taking the shortest name (for
> > > both THEME and CSS make vars).
> > >
> > > Yet, I'm OK if to use whatever name you think it would work best.    
> > 
> > I don't doubt we'll have BPF themes one of these years...:)  
> 
> Heh, true :-D
> 
> > Seriously, though, I was thinking about uses beyond building kernels.
> > If I, say, always want to build with the alabaster theme, and so set
> > THEME to effect that, will it then mess with my desktop environment or
> > some such?  
> 
> Hmm... makes sense, but worse case scenario, if someone uses some other
> software that would conflict with whatever vars we use, he/she could
> always place the vars inside a script ;-)
> 
> Here, I created this small script for testing a dark theme:
> 
> 	#!/bin/bash
> 	set -e
> 
> 	if [ "$VIRTUAL_ENV" == "" ]; then
> 		. sphinx_4.3.0/bin/activate
> 	fi
> 	cat << EOF > my_css.css
> 		body {background-color: #0f0f0f; }
> 		div.body { background-color: #1f1f1f; }
> 		.sig.c   .k, .sig.c   .kt, .sig.cpp .k, .sig.cpp .kt { color: #17ff17; }
> 	EOF
> 	make CSS=my_css.css THEME=groundwork htmldocs
> 
> That not only creates a simple CSS file, but also enables the virtual 
> environment if disabled.
> 
> > A quick search doesn't turn up anything, so probably I'm worrying too
> > much.  Maybe I should just apply it as-is, and we can change it if a
> > conflict turns up.  
> 
> Works for me. If you prefer instead that I rename them, just let
> me know and I'll send a v4. Or, if you prefer, Feel free to just 
> do a:
> 	sed s,THEME,foo_THEME,g -i patch1
> 	sed s,CSS,bar_CSS,g -i patch2
> 
> before applying the series ;-)

On a second thought, I'd like to adjust the description of patch 4,
so I'll re-send the series anyway. So, I'll submit v4 with:

 	sed s,THEME,DOCS_THEME,g -i patch1
 	sed s,CSS,DOCS_CSS,g -i patch2

Thanks,
Mauro
