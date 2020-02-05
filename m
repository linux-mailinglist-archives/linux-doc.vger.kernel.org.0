Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00F69153A7E
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2020 22:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgBEVx1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Feb 2020 16:53:27 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:45073 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbgBEVx1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Feb 2020 16:53:27 -0500
Received: by mail-qv1-f65.google.com with SMTP id l14so1867057qvu.12
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2020 13:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MIZWPxqzRXVWJ+Ic+8hIOYHDUnRhZs/23Y0wxfGuu50=;
        b=KnwHUgQGUNZbFj3rH4Z0EEhz7PCS6Z9wYfSH9eL4TLB/xohszjfi6RhmLw9HzUkEda
         gfqgK/qtDD4MJRJxn/dtri6oDbBXtiUUZV402IVYVH56tDpMsBlSDdmBy1S0DVZvqNEq
         Oe9LCnjug5VsOY8/k0EZlZuKVsNkoCwQGWJbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MIZWPxqzRXVWJ+Ic+8hIOYHDUnRhZs/23Y0wxfGuu50=;
        b=NqqQ6nWxJYIVeosJOkorQG2rHLROXoOEaE7d/a4noJ1wFldBcrJLixz7vDwLQL86Nt
         JqnMVKKfW/jro8qeeIkWSAXhRa1sgja6KtVv4q/DP9N/2gIxhkIyvN7Rbs3K6iTAQfzu
         y7hLiquKamLbppjrHLfmzA2VRAQ8cWA9z75aK3poRDzdLvdijl5ZaoSQU9isyruegFR6
         e7SVKOkHfsTBu9fVQ9TmPPItOYae9yF1Yv7o+v+G84qMz57rVKfLL1cApzMNAAKtVNn3
         gJuJXm+8w99hdcC978QqRFj+6bl8PWOyCnPNMtQ71p8LJwvpicvanwJgvWoMld1Dke5Q
         /oJQ==
X-Gm-Message-State: APjAAAVhmhZWv2LAfztvVo4wEeau1nlDwDm8hNuiv4leoDKH3V1vRPcL
        ydMvZiIBZzxYgnnYi906tmk87EwoOckA2LVfVajLTg==
X-Google-Smtp-Source: APXvYqyuo1xISODfo2xqjaF2V/BnCvStWurrM4AuLh1UdM27OhlsRBYTxe+qkPTZGUGfwJWU3jbnqq/w5I56cqrGXZU=
X-Received: by 2002:a05:6214:287:: with SMTP id l7mr34917177qvv.142.1580939606245;
 Wed, 05 Feb 2020 13:53:26 -0800 (PST)
MIME-Version: 1.0
References: <20200205154629.GA1257054@kroah.com> <20200205160250.GG142103@google.com>
 <CAOesGMj7Z9JoEYrnQaiHrHsjG7cv9ebEbyZM-QFWN2HJDa=UGA@mail.gmail.com>
 <20200205171353.GI142103@google.com> <20200205213354.GB1465126@kroah.com>
 <CAEXW_YSU_Zm24R2TYFQd42CfXyotowv42BbvbvKfSFbZGUqOHQ@mail.gmail.com> <20200205214841.GB1468203@kroah.com>
In-Reply-To: <20200205214841.GB1468203@kroah.com>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Wed, 5 Feb 2020 13:53:15 -0800
Message-ID: <CAEXW_YST9qj91=TbJ9j4boQgV=k=8E6fSQZB-iojRBLwGXSOag@mail.gmail.com>
Subject: Re: [PATCH] Revert kheaders feature
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Olof Johansson <olof@lixom.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tejun Heo <tj@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 5, 2020 at 1:48 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Feb 05, 2020 at 01:35:56PM -0800, Joel Fernandes wrote:
> > On Wed, Feb 5, 2020 at 1:33 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > [snip]
> > > > > like the BTF approach is significantly better and said users are
> > > > > hopefully moving forward to it quickly, and if they can't move
> > > > > forward, then they're likely also not going to move forward to newer
> > > > > kernels either?
> > > >
> > > > I think BCC runs on a lot of upstream machines. I think the migration
> > > > strategy is a matter of opinion, one way is to take it out and cause some
> > > > pain in the hope that users/tools will migrate soon (while probably carrying
> > > > the reverted patches out of tree). Another is to migrate the tools first and
> > > > then take it out (which has its own disadvantages such as introducing even
> > > > more users of it while it is still upstream).
> > >
> > > Do we "know" what tools today require this, and what needs to be done to
> > > "fix" them?  If we don't know that, then there's no way to drop this,
> > > pretty much ever :(
> >
> > Is there a real reason to drop it or a problem dropping this solves though?
>
> Olof had some reasons, but as we were drinking at the time when it came
> up last night, I can't really remember them specifically.  Hopefully he
> does :)
> But that didn't answer my question of "who is still using this"?  I was
> hoping we actually knew this given it was created for specific users.

I think I mentioned this in a previous thread of this email. Several
BCC tools are using it - see for example the criticalstat BCC tool
which includes linux/sched.h :
https://github.com/iovisor/bcc/blob/master/tools/criticalstat.py#L73
, or filetop BCC tool which uses struct dentry :
https://github.com/iovisor/bcc/blob/master/tools/filetop.py#L101

These would break without kernel headers either on the host or via
CONFIG_IKHEADERS.

thanks,

 - Joel
