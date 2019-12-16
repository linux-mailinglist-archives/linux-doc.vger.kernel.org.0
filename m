Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6146C12073D
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2019 14:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbfLPNdb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 16 Dec 2019 08:33:31 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:39628 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727601AbfLPNdb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Dec 2019 08:33:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hX83GRprAg3tFWzfR0yJfnTlg5FMz+gDu+wc1O4Fnx4=; b=gN1cKghEdT9/desbZ1miv/E2Z
        nw3wLoMWoZvE++ovn5gpi2tgYP/5oi+ukQnoBnTXF7Tmd2ewtnTZ3cxVeIzoK1gs7b9BICaoJekGR
        sYBvRque1gKgpStI6Zwt0LRrTy3DmFqnp7J1UL/shPBGhVtfDnvCYH2u6DlhB25hS0+SW0R6MwMBp
        wXqM/pYVkpLxFIfXdAuqfg7BWvJBGeJwaHesCcOYXDbboQp7aEAZGWNtA+VZgdb2W4nSCz+BGl7ga
        uRhDetmvR1oWGnoSb74XqO7WMve3A/HkZ8suhIhJuZl/cC5nqzksJQkH3S7He3t3f00Ua0Tx+3Ewz
        YhKVb+NBA==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:49646)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1igqV2-0007iQ-Aj; Mon, 16 Dec 2019 13:33:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1igqV0-0002Qo-N6; Mon, 16 Dec 2019 13:33:22 +0000
Date:   Mon, 16 Dec 2019 13:33:22 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Document the Link: tag formally
Message-ID: <20191216133322.GJ25745@shell.armlinux.org.uk>
References: <20191216093859.9196-1-linus.walleij@linaro.org>
 <877e2w1kfj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877e2w1kfj.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 16, 2019 at 03:14:56PM +0200, Jani Nikula wrote:
> On Mon, 16 Dec 2019, Linus Walleij <linus.walleij@linaro.org> wrote:
> > We have a lot of Link: tags in commits these days and they are
> > not formally defined in the kernel documentation. Let's put
> > a separate paragraph about it in submitting-patches.rst where
> > most other tags are defined.
> >
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Russell King <linux@armlinux.org.uk>
> > Reported-by: Russell King <linux@armlinux.org.uk>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  Documentation/process/submitting-patches.rst | 21 ++++++++++++++++----
> >  1 file changed, 17 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> > index ba5e944c7a63..20ef984aa743 100644
> > --- a/Documentation/process/submitting-patches.rst
> > +++ b/Documentation/process/submitting-patches.rst
> > @@ -643,9 +643,22 @@ which stable kernel versions should receive your fix. This is the preferred
> >  method for indicating a bug fixed by the patch. See :ref:`describe_changes`
> >  for more details.
> >  
> > +14) Link: tags
> > +--------------
> > +
> > +A Link: attribute can be used to provide a link back to a protocol of a
> > +discussion pertaining to the patch. A typical link looks like this:
> > +
> > +    Link: https://lore.kernel.org/r/<message-id>
> > +
> > +Any HTTP[S] links can be referenced. It is customary for maintainers to add
> > +Link: tags to reference discussions on mailing lists, and this can be done
> > +automatically with the git tool when applying patches in mailbox format, see
> > +:ref:`Documentation/maintainer/configure-git.rst <configure git>`.
> 
> I'd like to emphasize even more strongly that it is applied by the
> maintainer or committer, and should reference the patch that got
> applied. And that the patch submitters shouldn't try to add it
> themselves. (Which makes you wonder about the placement in
> submitting-patches.rst.) IMO other references should use References:
> that is already widely used.

I'm the maintainer of phylink.  During discussions, I may propose a
patch for someone to try.  When successful, I'll send a new email
submitting the patch officially to davem as the networking maintainer
as an entirely separate thread.

Using Link: to the patch that was submitted officially is obviously
impossible, but you would want to link to the discussion that resulted
in the patch, rather than the official submission - which would
generally be the submission plus an "applied" reply.

Looking at the history between v5.4 and current, it seems that it's
only DRM that uses References, and there's variations in its
formatting.  Some references to commits contain the word "commit"
and others do not.  Some references, from what I can tell, are
useless - for example "HSDES#1405586840" which I guess is some kind
of internal system somewhere.

There are some broken Link:s:

https://patchwork.freedesktop.org/patch/msgid/
<CACAvsv56Am90okV334eXgxDuK228sb9UJxMiOYjNAMShvvv4cg@mail.gmail.com

That has a space in there with a "<" - which suggests a broken script
is in use that mis-parses the email.

The References: thing is also completely undocumented...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
