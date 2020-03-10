Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C70741807E2
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2020 20:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgCJTWZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Mar 2020 15:22:25 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36440 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgCJTWZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Mar 2020 15:22:25 -0400
Received: by mail-pl1-f193.google.com with SMTP id g12so5833071plo.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2020 12:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vrf8fXIC1r2+JvlXlYgJWxCM5oPrpq5MZD/CQnIzo+w=;
        b=MmjLu5wlCm1KVWVg8MptJtFwJswJGmrA7TNTK6MlBe1QSv/l6sU0nu+xKUKFI5me9o
         88d+/cMpF6gvVKH5e38OY0sZpb0yCnFMSTlBQPQcLhTCOcS96CUUksnCUaHuQvU1WaFN
         06B+kAybXERrT5cBsw8iPIopCKaMFgckQdHZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vrf8fXIC1r2+JvlXlYgJWxCM5oPrpq5MZD/CQnIzo+w=;
        b=fdY4bSYWGXgFLu0nA0ww18J8wFcoqR2Kx0Wo1UZprjFwWlgKjNGfK3+lp4Y33QnNC+
         xB4nHgnVomRl8Lj/4VANziO0mL1jeSmcyeKa3M/ykF0lDZrdkn94pSiq3aT0Ua1S+ksb
         u4T5/TaxCUojXOPF7Mbpr+bz9bbImDg8qV9hlFjHOky4Qj36ZOisuC7o8zM6bMoWE9GK
         iEFH0S1QmGuHSOSUExOzdvwSZ3a/La++oRPFErBfGEnah8WpJ06eUJ9zbOFCSr+e86fW
         4fixpRr4cD1l5BR8p17kNQZByG5Ivi1EAuRB2xCUDlilwKpPAuBKy4ctezgSpoyaB9VJ
         VPkg==
X-Gm-Message-State: ANhLgQ1JxsRjYF8zQdmpMoxod7bsiLBGvEke89XlOY5OPEQu/PBklDOS
        VM+us+LJeeuBy3tnRnRy4s5VPS/quyU=
X-Google-Smtp-Source: ADFU+vsysRpDn6XtMDd6KeAEkYr65mpcbz9mvFMHbNITyDJ6Jk+4GBWwtp+4wEdTCClVX71+QtvaoQ==
X-Received: by 2002:a17:902:8a81:: with SMTP id p1mr21836886plo.284.1583868143955;
        Tue, 10 Mar 2020 12:22:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o66sm35070452pfb.93.2020.03.10.12.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 12:22:22 -0700 (PDT)
Date:   Tue, 10 Mar 2020 12:22:21 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Joe Perches <joe@perches.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: deprecated.rst: Clean up fall-through details
Message-ID: <202003101221.A1388D0C@keescook>
References: <202003041102.47A4E4B62@keescook>
 <20200310112356.1b5b32f2@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310112356.1b5b32f2@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 10, 2020 at 11:23:56AM -0600, Jonathan Corbet wrote:
> On Wed, 4 Mar 2020 11:03:24 -0800
> Kees Cook <keescook@chromium.org> wrote:
> 
> > Add example of fall-through, list-ify the case ending statements, and
> > adjust the markup for links and readability. While here, adjust
> > strscpy() details to mention strscpy_pad().
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Applied, thanks.  But ...
> 
> > ---
> >  Documentation/process/deprecated.rst | 48 +++++++++++++++++-----------
> >  1 file changed, 29 insertions(+), 19 deletions(-)
> > 
> > diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> > index 179f2a5625a0..f9f196d3a69b 100644
> > --- a/Documentation/process/deprecated.rst
> > +++ b/Documentation/process/deprecated.rst
> > @@ -94,8 +94,8 @@ and other misbehavior due to the missing termination. It also NUL-pads the
> >  destination buffer if the source contents are shorter than the destination
> >  buffer size, which may be a needless performance penalty for callers using
> >  only NUL-terminated strings. The safe replacement is :c:func:`strscpy`.
> > -(Users of :c:func:`strscpy` still needing NUL-padding will need an
> > -explicit :c:func:`memset` added.)
> > +(Users of :c:func:`strscpy` still needing NUL-padding should instead
> > +use strscpy_pad().)
> 
> :c:func: usage should really be stomped on when we encounter it.  There's
> a few in this file; I'll tack on a quick patch making them go away.

Oops, yes, I meant to do another pass for that. I will double-check
future patches!

-- 
Kees Cook
