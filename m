Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D6614E68A
	for <lists+linux-doc@lfdr.de>; Fri, 31 Jan 2020 01:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbgAaAYg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Jan 2020 19:24:36 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35923 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727618AbgAaAYg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Jan 2020 19:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580430275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Yce3RzcRj3/knjHHok9NbXtjPYcgNWKvZz8mmZTolms=;
        b=HMgtAbTpRcM0UtZk1S7aW8D+SCDo4EBZAXwQKuXpN4nlYttE2Y838HoE23HnoS8BnEtHxa
        8ISozK01LAlOtN42aT3PDX6L3Oq6tSDdBWAoHDOxRCk4CUMwnTyrgvNwRt3XSVvna4xcib
        +t+7hpddUBnAeMkocWu78EHJRKg/5/E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-XQj84m3SP0O440J5l_8AjQ-1; Thu, 30 Jan 2020 19:24:33 -0500
X-MC-Unique: XQj84m3SP0O440J5l_8AjQ-1
Received: by mail-ed1-f69.google.com with SMTP id y8so3536347edv.4
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2020 16:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yce3RzcRj3/knjHHok9NbXtjPYcgNWKvZz8mmZTolms=;
        b=MDcAf40Sa29B5Tdp1+2/xmo4aYZDRohOyANg+XqlYLWmXyTX6xfsSXR8U6ox28oVdj
         ULHehqHRgO+4FLr1ncQYhBD1ii3T6tXNpN7IwI6g9lCiSGnzQ8xpme1JKAIP+t2hoo3t
         RW0onlUW7AdjFTMi8yMEZrH6naBrxNJufd9S19ujHYa9VnZCvicmLnzjGEFnWW3XlhLs
         e6VAYxKcVUkevYGQhjoTgN/VDcVotUh0pxfE5B7Fe1d5GLhVK11XhCFIwO99mMgc4nUO
         tos3dkZoGDwL58VK+aU18IQsfwD7Wrgvh0oez6tE1O/dHDxhSbozPzrMRnuNbWQdFrUp
         L0hQ==
X-Gm-Message-State: APjAAAXTU3XSslslMvRxUGFQ9wJ4fvS9rBNuFA4kJ6QruquGSm410+4N
        C5xZnWs9pk3nMYu4mzxSSNqwNourcresA5/FYGMYprtfVy1m+GCK5HKsRJRDxMpMkRV96Xbl8f+
        XVt2qLA7v8P/5OElaEtSg0AKTbqL0FnYJ8W/i
X-Received: by 2002:a50:cfc1:: with SMTP id i1mr6377964edk.366.1580430272328;
        Thu, 30 Jan 2020 16:24:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqxfns7Ipz2OMXE7rsuvi11JkWCkrY9gHsHVLdpY40duyr/etkHlFPDUanfpd7IpDQXFGEdFBuoEY3X8zi7kwNg=
X-Received: by 2002:a50:cfc1:: with SMTP id i1mr6377950edk.366.1580430272088;
 Thu, 30 Jan 2020 16:24:32 -0800 (PST)
MIME-Version: 1.0
References: <20200130191019.19440-1-mcroce@redhat.com> <20200130141448.27fa32aa@cakuba>
In-Reply-To: <20200130141448.27fa32aa@cakuba>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Fri, 31 Jan 2020 01:23:56 +0100
Message-ID: <CAGnkfhzHqHFiqje3_ruSFvz09QKv3M8dqvOqzN_kau6ZpKzWOw@mail.gmail.com>
Subject: Re: [PATCH net] netfilter: nf_flowtable: fix documentation
To:     Jakub Kicinski <kuba@kernel.org>, netfilter-devel@vger.kernel.org
Cc:     Pablo Neira Ayuso <pablo@netfilter.org>,
        netdev <netdev@vger.kernel.org>, linux-doc@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Florian Westphal <fw@strlen.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 30, 2020 at 11:14 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu, 30 Jan 2020 20:10:19 +0100, Matteo Croce wrote:
> > In the flowtable documentation there is a missing semicolon, the command
> > as is would give this error:
> >
> >     nftables.conf:5:27-33: Error: syntax error, unexpected devices, expecting newline or semicolon
> >                     hook ingress priority 0 devices = { br0, pppoe-data };
> >                                             ^^^^^^^
> >     nftables.conf:4:12-13: Error: invalid hook (null)
> >             flowtable ft {
> >                       ^^
> >
> > Fixes: 19b351f16fd9 ("netfilter: add flowtable documentation")
> > Signed-off-by: Matteo Croce <mcroce@redhat.com>
>
> This is netfilter so even though it's tagged as net, I'm expecting
> Pablo (or Jon) to take it. Please LMK if I'm wrong.
>

You're right.
As get_maintainers.pl didn't list netfilter-devel@vger.kernel.org I missed it.

-- 
Matteo Croce
per aspera ad upstream

