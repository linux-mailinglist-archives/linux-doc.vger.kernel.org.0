Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949C9166A84
	for <lists+linux-doc@lfdr.de>; Thu, 20 Feb 2020 23:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729205AbgBTWtn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 20 Feb 2020 17:49:43 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34994 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729006AbgBTWtn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Feb 2020 17:49:43 -0500
Received: by mail-pf1-f193.google.com with SMTP id i19so128490pfa.2
        for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2020 14:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hrRbpCCPHpVPhWFltflgpHqU78+a02z0kjg48Y4OSdE=;
        b=jEKUjFZFhAcyM3Q54oVvETk8kz+VWEk5bcp1YJ8iutaJKlUpUZaFbGVL0d5Zvk43Va
         ns6ocmjFOERXx6rZNN5938XcsobSE7kCazoGW5s6j54UCts/HeB8hQ12gBiOYsh84O0O
         /NKl3QYoUt2y2lm/+NJlM+PnUbQO8Wb/K0+pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hrRbpCCPHpVPhWFltflgpHqU78+a02z0kjg48Y4OSdE=;
        b=bnUoeyOgHEgLysXeBQXd25T43mjlS2hHF/7TLheEaKrv8oVgaJHJ4hIiFfDZntWQC7
         lbEZ388GSDCRmOp7zsIv49kiWIWTUu8gYUxXdrx6rSwtc/PmwIEL/gJppwtMcFOBoRyV
         NX2XSMMuAvQ4otAT1IGSCLuyHajG3mHG9J6D2RN0ke36U7iZv78xV0id2Dcp6W7QnVD4
         LLSEWrhsmVWqigTeL6mPC+K7m4Vp61vanmahj0ThZsU2fqZzOSL8GX9iwzLpRRKyBE0g
         OTVuKHy2eu/S7pBgWK++EpOCvH13v+0rmr75miatllaccAdXAGTuaeSGi/uxja90+PRJ
         Xd6Q==
X-Gm-Message-State: APjAAAWYMRpH7JuKk4Xd4dyvxV45URQpb/u6kBqYMgbEmhpz7qreKOrZ
        5ojjOTCqKAaxnkWroc6fJCy6PA==
X-Google-Smtp-Source: APXvYqx6sEdQKaVia+e8VEnJIw91Gg2LVx+bLKWp0mLVbV7vSH9biGF1JLIoeYZZ0MPRTM7n37/oeQ==
X-Received: by 2002:a63:3407:: with SMTP id b7mr7687627pga.163.1582238982562;
        Thu, 20 Feb 2020 14:49:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u11sm466950pjn.2.2020.02.20.14.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 14:49:41 -0800 (PST)
Date:   Thu, 20 Feb 2020 14:49:39 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [Regression] Docs build broken by commit 51e46c7a4007
Message-ID: <202002201448.62894C394@keescook>
References: <CAJZ5v0he=WQ6159fyaYYffdi66y596rVo7z1yLyGFcH45PXNUg@mail.gmail.com>
 <202002201158.2911CE2388@keescook>
 <CAJZ5v0hkKUi7FUOneEy2nO-=RM8ZbcoG1uHRYNWzrjONEhKYxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hkKUi7FUOneEy2nO-=RM8ZbcoG1uHRYNWzrjONEhKYxQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 20, 2020 at 10:44:35PM +0100, Rafael J. Wysocki wrote:
> On Thu, Feb 20, 2020 at 9:05 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Feb 20, 2020 at 07:50:47PM +0100, Rafael J. Wysocki wrote:
> > > On two of my systems the docs build has been broken by commit
> > > 51e46c7a4007 ("docs, parallelism: Rearrange how jobserver reservations
> > > are made").
> > >
> > > The symptom is that the build system complains about the "output"
> > > directory not being there and returns with an error.
> > >
> > > Reverting the problematic commit makes the problem go away.
> >
> > How strange! This must be some race in the parallel build.
> 
> I don't think so, I didn't use -j with htmldocs builds.

What version of Sphinx do you have?

> And you know what, adding "-j 2" to the command line actually makes it work. :-)

Without a -j argument, the Documentation build has been using -jauto on
Sphinx itself.

> > AFAICT, "output" is made in the first sub-target (Documentation/media). This
> > doesn't look entirely stable (there's no ordering implied by the "all"
> > target in there)...
> >
> > Does this work for you?
> 
> No, it doesn't.

Well now I'm really baffled. What make target are you specifying? I was
assuming you were doing "make htmldocs"?

-Kees

> 
> >
> > diff --git a/Documentation/Makefile b/Documentation/Makefile
> > index d77bb607aea4..5654e087ae1e 100644
> > --- a/Documentation/Makefile
> > +++ b/Documentation/Makefile
> > @@ -62,7 +62,8 @@ loop_cmd = $(echo-cmd) $(cmd_$(1)) || exit;
> >  #    e.g. "media" for the linux-tv book-set at ./Documentation/media
> >
> >  quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
> > -      cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/media $2 && \
> > +      cmd_sphinx = mkdir -p $(abspath $(BUILDDIR)) && \
> > +       $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/media $2 && \
> >         PYTHONDONTWRITEBYTECODE=1 \
> >         BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(srctree)/$(src)/$5/$(SPHINX_CONF)) \
> >         $(PYTHON) $(srctree)/scripts/jobserver-exec \
> >
> > --

-- 
Kees Cook
