Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B3B2FA50D
	for <lists+linux-doc@lfdr.de>; Mon, 18 Jan 2021 16:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390445AbhARPp2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Jan 2021 10:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393517AbhARPo1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jan 2021 10:44:27 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B551C061575
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 07:43:42 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id z22so6882708ioh.9
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 07:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9u33B5kpdx78LRxtPzxqjXDA4O8vMwb9b3mNJEnT53c=;
        b=K463mC5DkZYkZN1sdYteF8BEn4+WZfjSGyZ5gih+OpCjTeiv7CfmbB92JnSmLU9FFs
         WvsumAb4sJiygLufQG4CyDBYL1MqkSNOXFBRfJdPw15GypkdbOLgeOBazewURA4xZbgc
         OlJwCaHx/0dVf6DsYMA07M590tjagAx/wCi6EvhSvYpGCxglYXVTsLpx5erGjXpuTVuP
         tTzD9CHdzHAL97EYo+9r/C08m99Jknp15513YhRK3BjPfZ5baUlqbOO9xHjUPdJhrkx3
         wTxc4o0U0caSFtlx4gvKViteDNPHMVexybJXsQrw4574nERjcdFr8nahuQaSBk7vSzXa
         JJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9u33B5kpdx78LRxtPzxqjXDA4O8vMwb9b3mNJEnT53c=;
        b=p1UfpZka1nYq/yNFnP4vCka3jhGyyyM0Zn7/NUWbW+1EKsxyYghCz8vNAuV6kkyf5M
         pLbhZU/OLS0zuT9oggpMBRCdSYz0T8fUsyqU7Q+73tuKv9blZp2jxTI16fTKY39ZeNZ+
         Lty/QjjaEDyfkJiLMUa0xOWKBcB/zFCutdzLxFGSDbiuEFgu9dRct3CRROgdrMPpZ/lz
         lsqTgVY2yYKAQzMg55zNcNp3MhwsnsD6Uoy0T/1IT41A8HYORdPWve4Nh3+GXHDc34/l
         31WnvzPiNGHVXvesx2lzpgCw1b948OvmLYNBi59DdIscW4/iW30q8edWVBXh7Lj/EuKC
         i1xA==
X-Gm-Message-State: AOAM533ltbQlDMS6WXn9ykwFUJS8K+4u5UC1YvEmEmg4QODdp7HXEMeb
        +aVgDSbqlSvLWxv2p0Q0phhrT5hU7S0fh30yrSW2Eg==
X-Google-Smtp-Source: ABdhPJxDyXaADFQRXUGcJ2y43BFgKdVm500B4s+VL7OQwM+f1n0E1PgN7J+UoNfmHAQ0FMFrJjr1R4ZLZ2P8kE6YdBQ=
X-Received: by 2002:a02:1dca:: with SMTP id 193mr119411jaj.39.1610984621544;
 Mon, 18 Jan 2021 07:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20210118113643.232579-1-jackmanb@google.com> <20210118083306.4c16153d@lwn.net>
In-Reply-To: <20210118083306.4c16153d@lwn.net>
From:   Brendan Jackman <jackmanb@google.com>
Date:   Mon, 18 Jan 2021 16:43:30 +0100
Message-ID: <CA+i-1C1LVKjfQLBYk6siiqhxfy0jCR7UBcAmJ4jCED0A9aWsxA@mail.gmail.com>
Subject: Re: [PATCH bpf-next] docs: bpf: Fixup atomics documentation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        KP Singh <kpsingh@chromium.org>,
        Florent Revest <revest@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks for the review :)

On Mon, 18 Jan 2021 at 16:33, Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Mon, 18 Jan 2021 11:36:43 +0000
> Brendan Jackman <jackmanb@google.com> wrote:
>
> > This fixues up the markup to fix a warning, be more consistent with
> > use of monospace, and use the correct .rst syntax for <em> (* instead
> > of _). It also clarifies the explanation of Clang's -mcpu
> > requirements for this feature, Alexei pointed out that use of the
> > word "version" was confusing here.
>
> This starts to sound like material for more than one patch...?

Good point, I'll split the markup fixups and actual content change
into separate patches.

> > NB this conflicts with Lukas' patch at [1], here where I've added
> > `::` to fix the warning, I also kept the original ':' which appears
> > in the output text.
>
> And why did you do that?

Hmm, indeed looks like that isn't necessary as long as there are no
spaces between the previous character and the '::'.

v2 incoming...

> > [1] https://lore.kernel.org/bpf/CA+i-1C3cEXqxcXfD4sibQfx+dtmmzvOzruhk8J5pAw3g5v=KgA@mail.gmail.com/T/#t
> >
> > Signed-off-by: Brendan Jackman <jackmanb@google.com>
> > ---
> >  Documentation/networking/filter.rst | 30 +++++++++++++++--------------
> >  1 file changed, 16 insertions(+), 14 deletions(-)
> >
> > diff --git a/Documentation/networking/filter.rst b/Documentation/networking/filter.rst
> > index f6d8f90e9a56..ba03e90a9163 100644
> > --- a/Documentation/networking/filter.rst
> > +++ b/Documentation/networking/filter.rst
> > @@ -1048,12 +1048,12 @@ Unlike classic BPF instruction set, eBPF has generic load/store operations::
> >  Where size is one of: BPF_B or BPF_H or BPF_W or BPF_DW.
> >
> >  It also includes atomic operations, which use the immediate field for extra
> > -encoding.
> > +encoding: ::
>
> Things like this read really strangely.  Just say "encoding::" and be done
> with it, please.
>
> Thanks,
>
> jon
