Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58CC115360F
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2020 18:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbgBERN5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Feb 2020 12:13:57 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40905 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbgBERN4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Feb 2020 12:13:56 -0500
Received: by mail-pg1-f193.google.com with SMTP id z7so1263633pgk.7
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2020 09:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vj5+aAzrvoWfPRgkxgs4rxT/s6njvxqAYMRAsIMwuyA=;
        b=JrR6YgNNHaDuSLy8zQFawVw0/bkB/6qhb1MSHfxFs+yhEb/tvPOBCvMNhPSClrp+uf
         4059po+dfZxCFkFcZJYnOWU1F6j+TJYIeycAp4ONZXGz9fMKNUW8zn7tCC3e/EP/rvah
         GoJ9sivDjZ4yi3GVY7yb8WCCntamIT00bL6WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vj5+aAzrvoWfPRgkxgs4rxT/s6njvxqAYMRAsIMwuyA=;
        b=IIvNWgu5l244lvRrRqyurbilKuQJP4YSUhIwb+/GyBGvS6FiX5gY2/7UaZqVTO8pIu
         tac+ErI+SyUxm0aW+im7V7koXDti05ZJz2+kRYWNcwpKz/al2FpiFsvSw13IqrgdwIds
         to8V5g0x3TVfpQ2kowpLeYm09rdhhSZ7dhT505asna/gN9hfF/K4tpUELZgGTAxOUn3W
         oQOYzlDhJPb/XdJyIiliy8Eh0rAd7FTI/Oq0fygXzOqsSjU/tulrEuur2KA2/jpUDWvP
         HmQwhelKWmQo/QuonQC7jIhsuTT9Ul4JF5LDZiqiYSQgP5u5STvZg5YgQKwZgPPYm9Op
         bW1g==
X-Gm-Message-State: APjAAAX+UOYk7hMjQV8fnRtItYXfk2tFIM/hghM7Ars+tC+rkrehg8UH
        f2IpOF7dRJZnoY4HDbUnsbZsig==
X-Google-Smtp-Source: APXvYqznycuD0T0BleL+Pa+43PZWNyKnViB90KE/txeTskjgNkDS5u8h7v39V9+zC73xVZynAHXSpA==
X-Received: by 2002:a63:5fcf:: with SMTP id t198mr22895535pgb.383.1580922834404;
        Wed, 05 Feb 2020 09:13:54 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id y2sm59968pff.139.2020.02.05.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 09:13:53 -0800 (PST)
Date:   Wed, 5 Feb 2020 12:13:53 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Olof Johansson <olof@lixom.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH] Revert kheaders feature
Message-ID: <20200205171353.GI142103@google.com>
References: <20200205154629.GA1257054@kroah.com>
 <20200205160250.GG142103@google.com>
 <CAOesGMj7Z9JoEYrnQaiHrHsjG7cv9ebEbyZM-QFWN2HJDa=UGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOesGMj7Z9JoEYrnQaiHrHsjG7cv9ebEbyZM-QFWN2HJDa=UGA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 05, 2020 at 04:55:39PM +0000, Olof Johansson wrote:
> On Wed, Feb 5, 2020 at 4:02 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> >
> > On Wed, Feb 05, 2020 at 03:46:29PM +0000, Greg Kroah-Hartman wrote:
> > > Now that BPF does not need a copy of the kernel headers anymore in order
> > > to build programs, there's no real need for putting the kernel headers
> > > into a kernel module.  So drop the feature quick, before someone starts
> > > using it :)
> >
> > Temporary Nack. Adding Alexei to the thread.
> >
> > I believe at the time of this going in, the BPF's BTF feature was not fully
> > ready or able to support the usecases. Especially because BPF programs can
> > call or use macros in kernel headers as well.
> >
> > Also, now BCC project does depend on this and so does bpftrace. Have both
> > of these tools migrated to use BTF and don't need CONFIG_KHEADERS to be
> > compiled? Sorry if I lost track.
> >
> > Just last week someone was using CONFIG_KHEADERS for BPF tracing purposes at
> > Google and pinged me as well. There are several others. This would at least
> > them some amount of pain.
> >
> > I'd suggest let us discuss more before ripping it out. thanks,
> 
> 
> Greg, please use olof@lixom.net on the patch, I try to keep LKML out
> of my non-upstream inbox. :-)
> 
> 
> Alexei was part of the discussion, and from others in the same room it
> sounded like there are no users of the upstream version of this
> feature. Posting this patch is the obvious way to find out if that is
> the case.
> 
> I.e. even if there was a version of bcc that required this, it sounds

The upstream BCC currently does require it since several tools include kernel
headers and bpftrace does require it as well. I guess my point was before
ripping it out, someone needs to complete the migration of all of those tools
to BTF (if BTF can even handle all usecase) following the motto of "Don't
break userspace".

> like the BTF approach is significantly better and said users are
> hopefully moving forward to it quickly, and if they can't move
> forward, then they're likely also not going to move forward to newer
> kernels either?

I think BCC runs on a lot of upstream machines. I think the migration
strategy is a matter of opinion, one way is to take it out and cause some
pain in the hope that users/tools will migrate soon (while probably carrying
the reverted patches out of tree). Another is to migrate the tools first and
then take it out (which has its own disadvantages such as introducing even
more users of it while it is still upstream).

thanks,

 - Joel

