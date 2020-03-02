Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C62D17617C
	for <lists+linux-doc@lfdr.de>; Mon,  2 Mar 2020 18:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbgCBRqt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Mar 2020 12:46:49 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:44642 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgCBRqt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Mar 2020 12:46:49 -0500
Received: by mail-vk1-f196.google.com with SMTP id x62so41133vkg.11
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2020 09:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wRqcBb5NeC8MFmcr1zGXioEPHZAa7v+ogkQOpmNZPmY=;
        b=bhPvEOjmCSdagKL7wbSNn+LctUqd1mSHmEn2xDEvGzkuiK6UcHtyC+lxQPBpQlis9b
         MH79TeTlsFO7qPTBa6z4411JqMqW02pV/UZzr7nzeLdlB06ZAyi+pqcIdU9APksPYo90
         nUEWiNOWR0xD7j7ZSZMY7pDlZNRy4e+PnpIbfx6SKAz25tzKMc0nQ5KgTJhLyI0UbjFR
         H3wO7m6+wqBA2WjrG8+3fwWwHTSsGKwniZhDKBbmB9ntCpx4qOEDeojx6XTsRw3deXyz
         rGSuijN9djreVn1bWwoVZMSunjpo6Cp14oV/CsDb92SZz4nWSLWY6P94qaqIttgdND+9
         GVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wRqcBb5NeC8MFmcr1zGXioEPHZAa7v+ogkQOpmNZPmY=;
        b=NziB1uqN9DitntBJpvVJpvtyRos4+qdbfM3kVsqiwg32YEur18pi4DBwneoIm7C/Zh
         D/T0W0/0//jUGUIiPnBpiByjk7YZTu+UpXw1uv6+HGgF/WIsp/g3VmLW0PQDUx2fxPry
         x2CETlfl3PrAbgCw0njNh1rXm6xGK8RcVk+bflWzYtGn7XNOTtaIvLuVwBdMa5tptp5V
         nwf+/pX6tEXLIr2UO1apnw35h/R+uj2DnDEw5S70S1suhnJvHRRcWrJijUdhfzyc+kvQ
         Mx4jJXbP/4/eiAOPkzSG/AHVLDeUs5oB0wjAVO6O3YOys/z0jnNY+B8th/perCrrss5+
         ivLQ==
X-Gm-Message-State: ANhLgQ2Nin+aA0itsml/R7cS1iIvfKff2BVGUcW3hQZhJo+aSdHRWURL
        l7687AohRi6mow/c2RL5t60gy9WjZ8zDvS9YZJLWvA==
X-Google-Smtp-Source: ADFU+vvI4v1XSZF009wAi9uAcVVON3h+bKuIxN4MJslrz6LFmkBZ04IXzw5whl+Td9/Njl7w5J59jkiRYYRU3oMTDDU=
X-Received: by 2002:a1f:5385:: with SMTP id h127mr542849vkb.56.1583171207966;
 Mon, 02 Mar 2020 09:46:47 -0800 (PST)
MIME-Version: 1.0
References: <20200219183231.50985-1-balejs@google.com> <20200229005131.GB9813@google.com>
 <20200229184300.GA484762@carbon.DHCP.thefacebook.com> <20200301162003.GA186618@google.com>
 <20200302165330.GA505299@carbon.DHCP.thefacebook.com>
In-Reply-To: <20200302165330.GA505299@carbon.DHCP.thefacebook.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 2 Mar 2020 09:46:36 -0800
Message-ID: <CAJuCfpEk4gz9YKVuRBW4E-Up_LSGWCSpyJft4y+rOjyPSa08Zg@mail.gmail.com>
Subject: Re: [PATCH] cgroup-v1: freezer: optionally killable freezer
To:     Roman Gushchin <guro@fb.com>
Cc:     Marco Ballesio <balejs@google.com>, Tejun Heo <tj@kernel.org>,
        cgroups mailinglist <cgroups@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>, rjw@rjwysocki.net,
        pavel@ucw.cz, len.brown@intel.com, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, Minchan Kim <minchan@google.com>,
        Daniel Colascione <dancol@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 2, 2020 at 8:53 AM Roman Gushchin <guro@fb.com> wrote:
>
> On Sun, Mar 01, 2020 at 08:20:03AM -0800, Marco Ballesio wrote:
> > On Sat, Feb 29, 2020 at 10:43:00AM -0800, Roman Gushchin wrote:
> > > On Fri, Feb 28, 2020 at 04:51:31PM -0800, Marco Ballesio wrote:
> > > > Hi all,
> > > >
> > > > did anyone have time to look into my proposal and, in case, are there
> > > > any suggestions, ideas or comments about it?
> > >
> > > Hello, Marco!
> > >
> > > I'm sorry, somehow I missed the original letter.
> > >
> > > In general the cgroup v1 interface is considered frozen. Are there any particular
> > > reasons why you want to extend the v1 freezer rather than use the v2 version of it?
> > >
> > > You don't even need to fully convert to cgroup v2 in order to do it, some v1
> > > controllers can still be used.
> > >
> > > Thanks!
> > >
> > > Roman
> >
> > Hi Roman,
> >
> > When compared with backports of v2 features and their dependency chains, this
> > patch would be easier to carry in Android common. The potential is to have
> > killability for frozen processes on hw currently in use.
>

Hi Roman,

> I see...
>
> The implementation looks good to me, but I really not sure if adding new control files
> to cgroup v1 is a good idea at this point. Are there any plans in the Android world
> to move forward to cgroup v2? If not, why not?

There are plans to prototype that and gradually move from cgroups v1
to v2 at least for some cgroup controllers (the ones that can use
unified hierarchy). Creating an additional per-process cgroup v2
hierarchy only for freezer would be a high price to pay today. In the
future when we migrate some controllers to v2 the price will be
amortized and we will probably be able to do that.

> If there are any specific issues/dependencies, let's discuss and resolve them.
>
> Thanks!
>
> Roman

Thanks,
Suren.
