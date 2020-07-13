Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E382193DB
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2020 00:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgGHWyu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Jul 2020 18:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgGHWyt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jul 2020 18:54:49 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7CD5C061A0B
        for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2020 15:54:49 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k5so212122pjg.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2020 15:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WGbtKIEdak0poDhgfsr8gAWQKkDV/IYhUhdp4uNN4yw=;
        b=GAkv2Kjn1Zts3qt68FflHU+1+2Um6tBR5MCMb8MYAcSNkqPYq49D7B4VR61eWXSOh4
         FhoavuaRf4SqWblrVieRMwuHDJ8Y2uYi3nQfd9iyZ9G+lGWD2HNVlHWDSLRsqe3HbDKb
         fuQlTfITW/1ZOw55rOG5jyZx6kQHAGB0BAK6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WGbtKIEdak0poDhgfsr8gAWQKkDV/IYhUhdp4uNN4yw=;
        b=Xzg6mPHWPg3LcaUW/TYN+vSiXo7H5MAFSGzTTNQdxDAyk0vZDifbXUx6sng5q+bz/N
         txyKkLZ/kqEbco7lUZQYF12uIvp94uV6h5ZI2ttOvM/sryGM4voRgYQklojlu4uw3DBP
         Y+tJ9+QPKAx4MrV34l5hM1eatBJTzyltIaX9jzNyJ2kcSQ4eB1nCP4uVD4bUIOmubc51
         uTXa6j/fKU3U78KPkGpSBQwADiocVPGD+955ghvD6go1hmB512XxC/MtA8QvkcKyw65N
         hfTKX3QJcq0Ie2C1I5JxB14yBZ6mfofXMmtEFQtN/tR9f4Jzm70QVu22B+XZcU+Rb0qp
         6sjA==
X-Gm-Message-State: AOAM530APxE95jTOA1aGlhfOZn0tZhaq8mnkSHgRlCm0etAsV4xIlw7m
        7+waQDyITC3+4HrbMF0W2hmEoQ==
X-Google-Smtp-Source: ABdhPJzk2Efj4MLTOriOU/NTXKepBMMQF8rKdzggSb+KTSO4Fmm2CNyNkdu4gp4N4Ir5pqJsx4O7QA==
X-Received: by 2002:a17:90a:2e85:: with SMTP id r5mr12029622pjd.232.1594248889174;
        Wed, 08 Jul 2020 15:54:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r9sm478867pje.12.2020.07.08.15.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 15:54:48 -0700 (PDT)
Date:   Wed, 8 Jul 2020 15:54:47 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: YAMA SECURITY MODULE
Message-ID: <202007081531.085533FC5@keescook>
References: <20200708073346.13177-1-grandmaster@al2klimov.de>
 <202007080103.2DAD857D4C@keescook>
 <2c05c0c3-e72a-7cc6-3391-2e0d3bdf6b2c@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c05c0c3-e72a-7cc6-3391-2e0d3bdf6b2c@al2klimov.de>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 08, 2020 at 08:22:03PM +0200, Alexander A. Klimov wrote:
> 
> 
> Am 08.07.20 um 10:05 schrieb Kees Cook:
> > On Wed, Jul 08, 2020 at 09:33:46AM +0200, Alexander A. Klimov wrote:
> > > Rationale:
> > > Reduces attack surface on kernel devs opening the links for MITM
> > > as HTTPS traffic is much harder to manipulate.
> > > 
> > > Deterministic algorithm:
> > > For each file:
> > >    If not .svg:
> > >      For each line:
> > >        If doesn't contain `\bxmlns\b`:
> > >          For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> > > 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
> > >              If both the HTTP and HTTPS versions
> > >              return 200 OK and serve the same content:
> > >                Replace HTTP with HTTPS.
> > > 
> > > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> > > ---
> > >   Continuing my work started at 93431e0607e5.
> > >   See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
> > >   (Actually letting a shell for loop submit all this stuff for me.)
> > > 
> > >   If there are any URLs to be removed completely or at least not HTTPSified:
> > >   Just clearly say so and I'll *undo my change*.
> As written here...

I interpreted that as "any URLs [changed by this patch]". I wanted no
URLs you changed to be removed nor not HTTPSified.

> > >   See also: https://lkml.org/lkml/2020/6/27/64

(You seem to be saying "any URLs [in the file]".)

> > >   If there are any valid, but yet not changed URLs:
> > >   See: https://lkml.org/lkml/2020/6/26/837

The URL I commented on was not valid and not changed by your patch.

> > > 
> > >   If you apply the patch, please let me know.
> > > 
> > > 
> > >   Documentation/admin-guide/LSM/Yama.rst | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/admin-guide/LSM/Yama.rst b/Documentation/admin-guide/LSM/Yama.rst
> > > index d0a060de3973..64fd62507ae5 100644
> > > --- a/Documentation/admin-guide/LSM/Yama.rst
> > > +++ b/Documentation/admin-guide/LSM/Yama.rst
> > > @@ -21,7 +21,7 @@ of their attack without resorting to user-assisted phishing.
> > >   This is not a theoretical problem. SSH session hijacking
> > >   (http://www.storm.net.nz/projects/7) and arbitrary code injection
> > 
> > This link is dead. It is likely best replaced by:
> ... I'd undo this change.

You sent me a patch to update URLs, gave me (seemingly) explicit
instructions about which things would cause you to undo individual
changes, none of which seemed to trigger, so I offered an improvement,
that would add another HTTPS URL -- which is entirely within your stated
desires to have "[one] commit ... per one thing [you've]i done" for
a patch where the Subject is literally "Replace HTTP links with HTTPS
ones", for which I suggested an improvement.

> But as it's the only one here, just forget this patch.

You seem hostile to accepting feedback on how this patch could be
improved. It's one thing to use automation to help generate patches,
and I understand your apparent desires to keep it automated, but that
is not always how patch development turns out.

Your instructions appear to take a long way to just say "here's a patch,
take it or leave it" which seems pretty anti-collaborative to me.

-- 
Kees Cook
