Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3D214E7A5
	for <lists+linux-doc@lfdr.de>; Fri, 31 Jan 2020 04:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgAaDmt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Jan 2020 22:42:49 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39218 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727827AbgAaDms (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Jan 2020 22:42:48 -0500
Received: by mail-ed1-f65.google.com with SMTP id m13so6278704edb.6
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2020 19:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WgYgtwuhELvjgU95da8aZgmkZEE2LUzAsh09NYauYq8=;
        b=V4DAOBEfJMxDP/cvxtqS0W4RxIvsJn3nBX4J4u/ixIUR0sam7ij47LtLs7X3xdrLue
         T+gQgE/IuSuHG+c1bCwSKLRIxEyV3GPPdSAj1tk55ADuIPMVj5pvEhJoib71xNWJyX/y
         x/P+bNFUYLYYlIFQ7QvFvBJRyyv/jK+jgn60OpDryI9ogSu20b1Oa04rp2mZfyyuGT75
         C3/qlvSpw2bjagahi9PrbmOmobeigkCmEmf3rCqLX43lYKQ/HevGcemvEbubXY4ABYvP
         0i0XBh77Bu0do5J3duGTP6lxbYQjoHY/4OFwruYn+nu/0uRb0B7WoFN9EsZbeYISxwk0
         aEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WgYgtwuhELvjgU95da8aZgmkZEE2LUzAsh09NYauYq8=;
        b=RhEqv0uf6z0OsxHpDxi7TqKVQ6uKK95Tsm2VbXMkH0nG94GqQLF0UDCKh5R/P8vaTJ
         IaJAsAzjk4EzAl9vUKlmHhhuWDbv3RG/vWK6jswYrHaGv+VTbIU+fgIHgVpk199OmBOK
         SyZGi8WGSjDjhlXKqGV8Zffw4zT88tzTnKy8TiJ8vgin/HCEWTlXZUP2FB+QaQSyo4YS
         ys4VjBFBS1fAxYL11GKkwwRuKKZSw6PirSUeJJIC/U6eLM6HZJSXgqMBBSLduthwT+yi
         jl8wbA3ONqybOP3bGhpbXtm91zqGR1/8HC7UevruCM10FEJWSkJCcUygidPSXPjnLVrd
         TtsQ==
X-Gm-Message-State: APjAAAU2qn1BfvW5303oxCzUSakn0Ij821+xOJYiE1Mojp3WQPQ/goUN
        zP8bUyveCJTlAphlw99F3B/sh6xY1vKVZD9XySWrr0AsFA==
X-Google-Smtp-Source: APXvYqz+gbq0qd2DddhxIcj5IlcvLwB7Um3eKjWD5LcYBxgMZ52Zo279iUVEXoWHiySpU3N5T5tsmEECBL4nYd7Sa64=
X-Received: by 2002:a50:fd15:: with SMTP id i21mr6778219eds.12.1580442166899;
 Thu, 30 Jan 2020 19:42:46 -0800 (PST)
MIME-Version: 1.0
References: <20200108162447.3347-1-sds@tycho.nsa.gov> <CAHC9VhQFQypUnRExSr62aaeW3hQ1iaAdwguwu67v_Lc84h=5rQ@mail.gmail.com>
In-Reply-To: <CAHC9VhQFQypUnRExSr62aaeW3hQ1iaAdwguwu67v_Lc84h=5rQ@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 30 Jan 2020 22:42:36 -0500
Message-ID: <CAHC9VhRf4qemBn9EEfwaxc9A11Z07o1P54wkpFVNtoTy2+QVyA@mail.gmail.com>
Subject: Re: [PATCH] Documentation,selinux: deprecate setting checkreqprot to 1
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     selinux@vger.kernel.org, omosnace@redhat.com, corbet@lwn.net,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 10, 2020 at 3:15 PM Paul Moore <paul@paul-moore.com> wrote:
> On Wed, Jan 8, 2020 at 11:24 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> > Deprecate setting the SELinux checkreqprot tunable to 1 via kernel
> > parameter or /sys/fs/selinux/checkreqprot.  Setting it to 0 is left
> > intact for compatibility since Android and some Linux distributions
> > do so for security and treat an inability to set it as a fatal error.
> > Eventually setting it to 0 will become a no-op and the kernel will
> > stop using checkreqprot's value internally altogether.
> >
> > checkreqprot was originally introduced as a compatibility mechanism
> > for legacy userspace and the READ_IMPLIES_EXEC personality flag.
> > However, if set to 1, it weakens security by allowing mappings to be
> > made executable without authorization by policy.  The default value
> > for the SECURITY_SELINUX_CHECKREQPROT_VALUE config option was changed
> > from 1 to 0 in commit 2a35d196c160e3 ("selinux: change
> > CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE default") and both Android
> > and Linux distributions began explicitly setting
> > /sys/fs/selinux/checkreqprot to 0 some time ago.
> >
> > Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
> > ---
> >  .../ABI/obsolete/sysfs-selinux-checkreqprot   | 23 +++++++++++++++++++
> >  .../admin-guide/kernel-parameters.txt         |  1 +
> >  MAINTAINERS                                   |  1 +
> >  security/selinux/Kconfig                      |  3 +++
> >  security/selinux/hooks.c                      |  5 +++-
> >  security/selinux/selinuxfs.c                  |  8 +++++++
> >  6 files changed, 40 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/ABI/obsolete/sysfs-selinux-checkreqprot
>
> I think this looks fine, but considering this week was the first time
> we really discussed this, let's hold off until after the next merge
> window so we get a full cycle in linux-next for folks to complain :)

I've queued this up in selinux/next, you'll see it in the tree once
the merge window closes.

-- 
paul moore
www.paul-moore.com
