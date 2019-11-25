Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5740109716
	for <lists+linux-doc@lfdr.de>; Tue, 26 Nov 2019 00:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfKYXuA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Nov 2019 18:50:00 -0500
Received: from mail-vs1-f41.google.com ([209.85.217.41]:35690 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfKYXuA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Nov 2019 18:50:00 -0500
Received: by mail-vs1-f41.google.com with SMTP id k15so11468807vsp.2
        for <linux-doc@vger.kernel.org>; Mon, 25 Nov 2019 15:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=generalsoftwareinc-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rvY24eePNZt+ycJ3AFHByDgIP1Rv1kswbJLitykNPsM=;
        b=i0RI/OVoO7H3VElF3DlRBwGuB3cfc8g9JH8Uw3W07sxlXmrk86lAYmebUQPbd5jguf
         lkmeffv+K/+4Oqcti7XGhYWjIclq6r88iI7Dk37KxTTIMJMgYGCILYmXFyUkZ0Dmv0cy
         ch41cP7PD8jkpkdM36QQWaCzzJDgtxySyhRSb7emi2vrKAtewWDm/xZ70UOJ2tT+q/n2
         iQNblP857cmJkw9m/GB3WuM9KXviy4YTFVHZYu20ujMl/zfDgn4udKZjgqr5YI0g95hT
         NY4oS35utxZZlxsWY02jvIBWVoNJgKTXrY/rA/IFhYgdsPYgmg23o+8KZ3PlzvxVXO4P
         +9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rvY24eePNZt+ycJ3AFHByDgIP1Rv1kswbJLitykNPsM=;
        b=IoXPAS9/fJFP5w4XTsg2OLjrXrl+33XD6Vk1ak2IlsTRu66BEZn0v7H5uiUhhJedIu
         yIwiqYhClatF1KKVfMQWVrwsL5lvzqkthEfqGkuLhERAZEtvYDOqYz2mCauD2R6vrtZj
         J8eC4bvs+EVsItqRp8q+3frGJfBMB6DY3uqaw+2Xush/quYipsWDK2XcDodYgjhMisXP
         eLFn0pWl7YCkap/uxtfuAoSPJWUFtPjqes3hE4HkpPWseszqaDqJgE9SugxLRUvd4LMq
         at7agcnY3aBDagjCdH6F8scTFtHe2qS8GABmu4BTl/fBlSkxWKS5gZl9wycQK2OKKFhb
         am/g==
X-Gm-Message-State: APjAAAXYw08AQr7YNbRgXeXYXeKztMPnLvgrHZ4zb7l2Dw+FCHj4K5O/
        Cqmtx6AE2WY4q410j8sBsXWpwg==
X-Google-Smtp-Source: APXvYqxeCabpQ+se9Zi1Mbc6QyxyiLZn11MsE8kypk/KmsdPdLqn4Mtl7URGnbPmK7vVazhUDvW8Ew==
X-Received: by 2002:a05:6102:c3:: with SMTP id u3mr20993889vsp.41.1574725798720;
        Mon, 25 Nov 2019 15:49:58 -0800 (PST)
Received: from ubuntu1804-desktop ([172.97.41.74])
        by smtp.gmail.com with ESMTPSA id c21sm2606280vko.45.2019.11.25.15.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 15:49:58 -0800 (PST)
Date:   Mon, 25 Nov 2019 18:49:57 -0500
From:   "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        joel@joelfernandes.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [RFC v2 2/2] docs: ftrace: Fix typos
Message-ID: <20191125234957.nwbzz72aarbhdni2@ubuntu1804-desktop>
References: <cover.1574655670.git.frank@generalsoftwareinc.com>
 <a843617511989679b29fbd62b1b8b3e991f2101e.1574655670.git.frank@generalsoftwareinc.com>
 <20191125123709.5eff70a9@gandalf.local.home>
 <20191125164625.01101109@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191125164625.01101109@gandalf.local.home>
User-Agent: NeoMutt/20171215
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 25, 2019 at 04:46:25PM -0500, Steven Rostedt wrote:
> On Mon, 25 Nov 2019 12:37:09 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Sun, 24 Nov 2019 23:38:41 -0500
> > "Frank A. Cancio Bello" <frank@generalsoftwareinc.com> wrote:
> > 
> > > --- a/Documentation/trace/ring-buffer-design.txt
> > > +++ b/Documentation/trace/ring-buffer-design.txt
> > > @@ -37,7 +37,7 @@ commit_page - a pointer to the page with the last finished non-nested write.
> > >  
> > >  cmpxchg - hardware-assisted atomic transaction that performs the following:
> > >  
> > > -   A = B iff previous A == C
> > > +   A = B if previous A == C  
> > 
> > This wasn't a typo. "iff" means "if and only if" which is a standard
> > notation. That is, this is shorthand for:
> > 
> >   A = B if previous A == C
> >   previous A == C if A = B
> 
> Although thinking about this more, this may not be correct. If
> previous A == B, then A = B, thus the "iff" notation is not actually
> accurate.
> 
> This wouldn't then be a typo fix, but a real fix to the logic ;-)
> 

What are the odds ;)

I knew about the concept https://en.wikipedia.org/wiki/If_and_only_if
from school math but didn't remember the notation. For me was
suspicious so, I  looked in "the cmpxchg doc" and nothing referring
to "iff" was there, then I decided to classified it as a typo.

Now thinking more deeply, I agreed with you that was not a typo but
a "logic mistake", even not for the same reason ;)

Being not 100% sure of what I'm about to say, I will say it
anyway because you have been kind enough to write the second email.

"if and only if (shortened as iff) is a biconditional logical
connective between statements" and A = B can't be considered a
logical statement in the context of that definition (math/logic),
even it could be in C.

Thank you Steven one more time for such a quick reply!
frank a.
