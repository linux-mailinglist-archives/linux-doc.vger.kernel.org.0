Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9667B5A5
	for <lists+linux-doc@lfdr.de>; Wed, 31 Jul 2019 00:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387992AbfG3WVc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 Jul 2019 18:21:32 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38453 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387881AbfG3WVc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jul 2019 18:21:32 -0400
Received: by mail-pg1-f195.google.com with SMTP id f5so21952904pgu.5
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2019 15:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Nxp6kZISKuYgp3wNOYBD76yj3i4MY+uTQ4TSDa0OJos=;
        b=smfE141ndNoeMYMj28pECOTjBkk754Sz050sDX3oHMan3yPFMvZOL/dHsqlet3LdGq
         o4GpgRb6/syhEuZS/2ALSKG2GQpuNX+cAa588evzTLZaQsTKb/k5e257LGWIqngjCh+Z
         OjhHAu3QJbe19Utqlf/fDMtrFpC0eXpQucUlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nxp6kZISKuYgp3wNOYBD76yj3i4MY+uTQ4TSDa0OJos=;
        b=fqJs2C28QFraVOUJdoq3UdSY3v7cyH2/MLAnLbtzBWaN1M6j2IP+zJmRvNVwF3JA5q
         gP9YlnEv2TMi5Ft8i8uxS0uvvZVT/FZoP51ZbWem8y8+vZ2CBXgPysVRNAz5x8df0fbp
         ijdSgGJEprWWkkxUJs34WqgQz3Tlbpfojqv3ODr0Ohrr+M0pArguF/zY0tlo62JdTwvD
         hsXfUVJIIbQc74iJIW735spzrFPSKP1b+z2ceG+CAkKuN4GAZDLfenuE2p25MAAWUoMz
         CuY7/BfIGbGpc/nhEJgaEYX+CmUce1Pp/dEKTxjJRcYfDl2+Gf2xyG3Kdu1QIJWCQsA5
         jCtQ==
X-Gm-Message-State: APjAAAVmNxLrWDqrcqb19z7lJKcBIx0NYazv/mpgLKmdGtrOew6aTwcz
        SUZTYKTyIA36YbzTqPcI+QM=
X-Google-Smtp-Source: APXvYqypXj85McSCCcFffXFRCfjjEjW5HB3v5KSm2u2QskvcubpU3JalJ0xeNv0kw3NruHY4c39HUw==
X-Received: by 2002:a17:90a:30aa:: with SMTP id h39mr119811673pjb.32.1564525291953;
        Tue, 30 Jul 2019 15:21:31 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id j15sm65790320pfr.146.2019.07.30.15.21.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 15:21:31 -0700 (PDT)
Date:   Tue, 30 Jul 2019 18:21:30 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, rcu@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 25/26] docs: rcu: convert some articles from html to
 ReST
Message-ID: <20190730222130.GD254050@google.com>
References: <cover.1564145354.git.mchehab+samsung@kernel.org>
 <8444797277eea7be474f40625bb190775a9cee33.1564145354.git.mchehab+samsung@kernel.org>
 <20190730212250.GJ14271@linux.ibm.com>
 <20190730215007.GA254050@google.com>
 <20190730190028.740c131e@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730190028.740c131e@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 30, 2019 at 07:00:28PM -0300, Mauro Carvalho Chehab wrote:
> Em Tue, 30 Jul 2019 17:50:07 -0400
> Joel Fernandes <joel@joelfernandes.org> escreveu:
> 
> > On Tue, Jul 30, 2019 at 02:22:50PM -0700, Paul E. McKenney wrote:
> > > On Fri, Jul 26, 2019 at 09:51:35AM -0300, Mauro Carvalho Chehab wrote:  
> > > > There are 4 RCU articles that are written on html format.
> > > > 
> > > > The way they are, they can't be part of the Linux Kernel
> > > > documentation body nor share the styles and pdf output.
> > > > 
> > > > So, convert them to ReST format.
> > > > 
> > > > This way, make htmldocs and make pdfdocs will produce a
> > > > documentation output that will be like the original ones, but
> > > > will be part of the Linux Kernel documentation body.
> > > > 
> > > > Part of the conversion was done with the help of pandoc, but
> > > > the result had some broken things that had to be manually
> > > > fixed.
> > > > 
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>  
> > > 
> > > I am having some trouble applying these, at least in part due to UTF-8
> > > sequences, for example double left quotation mark.  These end up being
> > > "=E2=80=9C", with a few space characters turned into "=20".
> > > 
> > > Any advice on how to apply these?  Should I just pull commits from
> > > somewhere?  
> > 
> > I was able to successfully apply and build this particular patch. I think
> > this is the only one in the series that applies to RCU.
> > 
> > Sadly, I can't find the patch in any of the public archives, but I could
> > perhaps email it to you as an .mbox attach which 'git am' should be able to
> > apply.
> > 
> > Mauro did say he was going to add some more details to changelog, or it could
> > be added when it is applied:
> > https://lore.kernel.org/rcu/20190726154550.5eeae294@coco.lan/
> 
> Yeah, I'm also planning to address at least some of the issues you
> pointed, in order to improve the html output, but got sidetracked by something 
> else and didn't find any time yet to finish. I'm adding some CI automation for
> the media subsystem in order to help us dealing with the huge amount of patches
> we receive there.
> 
> Feel free to add those details to the changelog. I may find some spare time 
> this week or the next one for the improvements you suggested, but those 
> could be sent on followup patches, once done.

Ok, I will re-send this RCU patch with the changes, leave this one to me.

The other memory model one, needs a lot more work so we can keep that aside
for now till someone has the time.

thanks,

 - Joel

