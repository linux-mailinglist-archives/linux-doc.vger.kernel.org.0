Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A9941006D
	for <lists+linux-doc@lfdr.de>; Fri, 17 Sep 2021 22:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233232AbhIQUzM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Sep 2021 16:55:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35563 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233144AbhIQUzM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Sep 2021 16:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631912029;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8EWbBFRzqn+CDnvlJz5qcZT7fMT6Nw9+JVYnR+B85b8=;
        b=Qtazm53bD1rj62mLjNEyE5Uio6JW0c160v7EqbmBq2tXeIw3roLe9em7IJcogj3oVyvFGZ
        dt6RwsAbJ1yoqY7jLDZN86m2yL3HUoWA2DX13PZklTKsWPT/BnBlh6ku4XGukRAH4Qp+fH
        r7LXEn8QpByY3YRPjXE98NPeu1FVwaQ=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-1oOpUkbcO02G5vVQRk6vJQ-1; Fri, 17 Sep 2021 16:53:47 -0400
X-MC-Unique: 1oOpUkbcO02G5vVQRk6vJQ-1
Received: by mail-io1-f72.google.com with SMTP id d23-20020a056602281700b005b5b34670c7so21991940ioe.12
        for <linux-doc@vger.kernel.org>; Fri, 17 Sep 2021 13:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8EWbBFRzqn+CDnvlJz5qcZT7fMT6Nw9+JVYnR+B85b8=;
        b=GGijosPRXLptybEf2kTcpMMXan0T/r99vd+HXF/bGhbtKAqKGs7q/X/CrQHBwSZ9ho
         iy0+79GbcrSgix2r/p0g4Xio//VkTRtxfCt3kEsBJ6k7RLh5ETjlareWf79DtleGJAd6
         C2g28Lc7DS2vsFiX8G7qpjon4NmiwIgqEtTI6H2Kfj5uC8mrVcTIY11J8gV6t9Kdyo4O
         UU8cfju/EHTO0ocTovs77hsdHiu1Fd/qJQVgmmo+gKfUpiGdhpyVmsPZRANW5Op+xpeF
         qPtFfcqKWWfdnERwYTPIx/N8n7+WGs/EJs5U8j0HK3yITcmC/xHb6ngJJ9+Gvfi5Zjv9
         DmnQ==
X-Gm-Message-State: AOAM530R2RWdw5ADFv7yoUkHpSd55cMSi6C6GWsEKq0lK1gmYdGUWDtb
        rVH5gaLx0Ec4NPaelMwmGufVmoNWIMapuAYn6r91UwNwYHeuoUvKk1stpnO1tLi/ftH4leui6U7
        vS9VGUKYF6c6jvx5k3NJq
X-Received: by 2002:a02:6043:: with SMTP id d3mr9052585jaf.127.1631912027040;
        Fri, 17 Sep 2021 13:53:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9q5X+AjYh1s/BEQkwddLJb9bdzZfTEh23K5SUpGpNdb4d0D6r/xx3i+FMB15F9hn+KggqPw==
X-Received: by 2002:a02:6043:: with SMTP id d3mr9052574jaf.127.1631912026714;
        Fri, 17 Sep 2021 13:53:46 -0700 (PDT)
Received: from halaneylaptop (068-184-200-203.res.spectrum.com. [68.184.200.203])
        by smtp.gmail.com with ESMTPSA id b1sm4165003ilf.43.2021.09.17.13.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 13:53:46 -0700 (PDT)
Date:   Fri, 17 Sep 2021 15:53:41 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     jim.cromie@gmail.com
Cc:     Jason Baron <jbaron@akamai.com>, Jonathan Corbet <corbet@lwn.net>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] Documentation: dyndbg: Improve cli param examples
Message-ID: <20210917205341.5bayndskygan6qrd@halaneylaptop>
References: <20210913222440.731329-1-ahalaney@redhat.com>
 <20210913222440.731329-4-ahalaney@redhat.com>
 <ff05cae4-8fa7-d1b6-795e-3bd85316774d@akamai.com>
 <CAJfuBxzrJwr17-RWZzhw90pKXZ1hL5kepuzvt1Di=JyekMJf4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJfuBxzrJwr17-RWZzhw90pKXZ1hL5kepuzvt1Di=JyekMJf4A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 17, 2021 at 02:30:09PM -0600, jim.cromie@gmail.com wrote:
> On Fri, Sep 17, 2021 at 1:50 PM Jason Baron <jbaron@akamai.com> wrote:
> >
> >
> >
> > On 9/13/21 6:24 PM, Andrew Halaney wrote:
> > > Jim pointed out that using $module.dyndbg= is always a more flexible
> > > choice for using dynamic debug on the command line. The $module.dyndbg
> > > style is checked at boot and handles if $module is a builtin. If it is
> > > actually a loadable module, it is handled again later when the module is
> > > loaded.
> > >
> > > If you just use dyndbg="module $module +p" dynamic debug is only enabled
> > > when $module is a builtin.
> > >
> > > It was recommended to illustrate wildcard usage as well.
> > >
> > > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > > Suggested-by: Jim Cromie <jim.cromie@gmail.com>
> > > ---
> > >   Documentation/admin-guide/dynamic-debug-howto.rst | 7 +++++--
> > >   1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
> > > index d0911e7cc271..4bfb23ed64ec 100644
> > > --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> > > +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> > > @@ -357,7 +357,10 @@ Examples
> > >     Kernel command line: ...
> > >       // see whats going on in dyndbg=value processing
> > >       dynamic_debug.verbose=1
> > > -    // enable pr_debugs in 2 builtins, #cmt is stripped
> > > -    dyndbg="module params +p #cmt ; module sys +p"
> > > +    // Enable pr_debugs in the params builtin
> > > +    params.dyndbg="+p"
> >
> > If we are going out of our way to change this to indicate that it works
> > for builtin and modules, it seems like the comment above should reflect
> > that? IE, something like this?
> >
> > '// Enable pr_debugs in the params module or if params is builtin.
> >
> 
> I dont think params can be a loadable module, so its not a great
> example of this.
> it should be one that "everyone" knows is usually loaded.
> 
> conversely, bare dyndbg example should have only builtin modules,
> then the contrast between 2 forms is most evident.
> 

Thank you both for the feedback, good points.

Does something like:

    // Enable pr_debugs in the btrfs module (can be builtin or loadable)
    btrfs.dyndbg="+p"
    // enable pr_debugs in all files under init/
    // and the function parse_one, #cmt is stripped
    dyndbg="file init/* +p #cmt ; func parse_one +p"

Work for you both? I think that makes the advantages of $module.dyndbg=
more clear and makes the usage of dyndbg= stick to strictly builtins.
If so I'll respin this patch in v3 of the series.

Thanks,
Andrew

> 
> > The first two patches look fine to me, so if you agree maybe just
> > re-spin this one?
> >
> > Thanks,
> >
> > -Jason
> >
> > > +    // enable pr_debugs in all files under init/
> > > +    // and the function pc87360_init_device, #cmt is stripped
> > > +    dyndbg="file init/* +p #cmt ; func pc87360_init_device +p"
> > >       // enable pr_debugs in 2 functions in a module loaded later
> > >       pc87360.dyndbg="func pc87360_init_device +p; func pc87360_find +p"
> >
> 

