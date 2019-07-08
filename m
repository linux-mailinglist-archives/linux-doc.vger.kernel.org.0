Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0206A62C71
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jul 2019 01:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfGHXQC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 8 Jul 2019 19:16:02 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44422 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbfGHXQC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jul 2019 19:16:02 -0400
Received: by mail-pl1-f194.google.com with SMTP id t14so5948163plr.11
        for <linux-doc@vger.kernel.org>; Mon, 08 Jul 2019 16:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oGZm1g5vtwwYit0yoo3SBX6Ei/KDlijim8AwfezWq5Q=;
        b=lFUSTt8nxcpQ1geusJZ3lspP7XQwyYNu3KMayNoosCV6UA30ZuMzOWUPZfCjTUzeKM
         iYW2yITMtWXzol7/+legnfgPOBGwjXoEFw7yce+7btcdg0htf2Hg4YfxND5u9apalxJL
         B3QYi+HDYUWlIIkNVozIYrBRfW/Zk/Qz4dosV0rI2mUxb16C62VVRSPlRILHQVx/6UE4
         RshFiQlSNd9CkGW5eoiTTfauBDsWytWT+kOLzVSwNCWkeJDN/HkdAIqfFvOi2TKYEg+r
         l8O7ss1ZZdrzfcN3z+0quxvvwbfum43KpVYwwtrEJTbglIXZty13qrEB3TCpWKeCVLSU
         fZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oGZm1g5vtwwYit0yoo3SBX6Ei/KDlijim8AwfezWq5Q=;
        b=AXTIaWEgxPHQ1an3D7VeiAWPvAb5TiuhbMcl+drZ5XBmNnnHBWiOMmVgWDDz2Z8itg
         JrPAU60RS/ZUCmPgbvszi+LeUaEXr3FxsE/Zi0VDJ8JrWrXxxcJu2zdYUmWlcVtIJJhn
         vciaMFkSpN2KgatUUR/MhzQo9oFJ/kxOXYvRdUeYYMk8mdf+HNGvXlK4lnGJi+F4zx5D
         F2lD4fW48t35WiOhhRsNZnhcFvmVerWij5F+kzx6AAKHEjsbSXcum59zyNRV+QStgf6t
         tPZMyW1BBoT3UgrN4skXTTA/00JqfuqStrTumQ3B35DScIKRDtHI/aUOMbhtLf9M2qIC
         B08A==
X-Gm-Message-State: APjAAAXaAs2bB4KMX/QqcachTWsR5fJj5cBq+N+FirGj5/aYjWP/YX3N
        YTBb+EjkwKrwFbxuZgQX5Yte05OqOHhmpE3I2gWa9g==
X-Google-Smtp-Source: APXvYqxLj9lV04W3pazbpY/qgg7ti1gSJwsPPAdwKpyGKBI70/LFOjfevFPZPMucLfnGO+AW10E2yFZhfTdlozEZOjY=
X-Received: by 2002:a17:902:29e6:: with SMTP id h93mr26754760plb.297.1562627761245;
 Mon, 08 Jul 2019 16:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-19-brendanhiggins@google.com> <20190705204810.GE19023@42.do-not-panic.com>
In-Reply-To: <20190705204810.GE19023@42.do-not-panic.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 8 Jul 2019 16:15:49 -0700
Message-ID: <CAFd5g44j7ECQorYLnDQadAaj+yBki98kFjmjejn+3W4eHtqGDA@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
To:     Luis Chamberlain <mcgrof@kernel.org>,
        Iurii Zaikin <yzaikin@google.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        shuah <shuah@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kunit-dev@googlegroups.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-um@lists.infradead.org,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        "Bird, Timothy" <Tim.Bird@sony.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Kevin Hilman <khilman@baylibre.com>,
        Knut Omang <knut.omang@oracle.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Petr Mladek <pmladek@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

CC'ing Iurii Zaikin

On Fri, Jul 5, 2019 at 1:48 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Wed, Jul 03, 2019 at 05:36:15PM -0700, Brendan Higgins wrote:
> > Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> > Acked-by: Luis Chamberlain <mcgrof@kernel.org>
>
> Come to think of it, I'd welcome Iurii to be added as a maintainer,
> with the hope Iurii would be up to review only the kunit changes. Of
> course if Iurii would be up to also help review future proc changes,
> even better. 3 pair of eyeballs is better than 2 pairs.

What do you think, Iurii?
