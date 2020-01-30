Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2AF14E5DE
	for <lists+linux-doc@lfdr.de>; Fri, 31 Jan 2020 00:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727678AbgA3XFA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Jan 2020 18:05:00 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44848 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727677AbgA3XFA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Jan 2020 18:05:00 -0500
Received: by mail-pf1-f196.google.com with SMTP id y5so2246988pfb.11
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2020 15:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZVCoy0c6zBh/23HJ8qV14vEXBoPTNgRjwz7/2GTwHIc=;
        b=bLf97hh1JmbfTKxaOIa/hfizEnh8PioMn1Y9TI7CEopKUPmgeQBicnEdwrFatxlt9U
         /dF+mwGLbsQW7KmPTy8I6XvXreO4N48lEX+Ehw6v+hoPAgu86vKzIbhOK4gM6oTf8mzR
         cUmaOPLKTOy/zPKtP/xK5WHSM7BjdC+E9H/qWV2SFU1exl9sfnhtxf2MfNs0DfBmIsih
         drKywXHDy84lMq4TuYIprVFUFSLN67kw0IUzFFhKIkCU/UHmgiJqlOOqaSS+2J072x0h
         J3RdIyqQ5IBv58TAQv0tMiutT2U2bysgST7jCLtDi7nTZT3kvU1poPBXQgw1qd6KjzT/
         afJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZVCoy0c6zBh/23HJ8qV14vEXBoPTNgRjwz7/2GTwHIc=;
        b=Xyn0noPtwgO+Cspqo7eEn+qw6vpU91QrJGFdzAQRQPXkePybnrecE9IW0y40Zr9qsb
         ORDYs1R0YqJCZZT6fOQiGeBnlwej+fb8yTaAv5QoAOUxD4JI/lOv6DbJDvgX2dpydNyf
         nVrwVtLcb4CILCq/JvD7GGxvbccTCbHf8uwsOIGMCBID3aLCSGmCmfExyFR4IUZ0GoGF
         yxznPAQ2XemhrxOFfj15Of0q0O1z5gUDYuzvNTAWRkx+Wb5G7OzMd2YhdqrqaA1NBPfM
         +5uJF2m/DAa4QocYluvflvDyabYtFSaHRGxfd5URDA0/SLY7JWPb1hBLXY6NwZ66ZN6U
         dATA==
X-Gm-Message-State: APjAAAVdw8Ha48EHyLqG6TjHJyau1bfzngq33Q1fiqc8xhhD0xU+1EN7
        cUaKyB+ByA7P4X/77KaLN1bcSCo6wuS71AiPUH8Ycw==
X-Google-Smtp-Source: APXvYqzpy57/EHOzTXSLzSf3keMtVmLBKsmU0rRVRaSHQpEvmWIO/hSL5ezfKU+X1bWMMEn/DiuqtJfLEN9g3PJzcvQ=
X-Received: by 2002:a63:480f:: with SMTP id v15mr6926030pga.201.1580425499190;
 Thu, 30 Jan 2020 15:04:59 -0800 (PST)
MIME-Version: 1.0
References: <20200128072002.79250-1-brendanhiggins@google.com>
 <20200128072002.79250-8-brendanhiggins@google.com> <20200129062709.5B2A22067C@mail.kernel.org>
In-Reply-To: <20200129062709.5B2A22067C@mail.kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 30 Jan 2020 15:04:47 -0800
Message-ID: <CAFd5g47cha8DJdS9x=Qjj-vLXjGOugQK38Ln85eznfuN11cLrQ@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] Documentation: Add kunit_shutdown to kernel-parameters.txt
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alan Maguire <alan.maguire@oracle.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>, David Gow <davidgow@google.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Jeff Dike <jdike@addtoit.com>,
        Kees Cook <keescook@chromium.org>,
        Richard Weinberger <richard@nod.at>, rppt@linux.ibm.com,
        Shuah Khan <skhan@linuxfoundation.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Logan Gunthorpe <logang@deltatee.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Knut Omang <knut.omang@oracle.com>,
        linux-um <linux-um@lists.infradead.org>,
        linux-arch@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 28, 2020 at 10:27 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Brendan Higgins (2020-01-27 23:20:02)
> > Add kunit_shutdown, an option to specify that the kernel shutsdown after
> > running KUnit tests, to the kernel-parameters.txt documentation.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index ade4e6ec23e03..0472b02ce16bb 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -2054,6 +2054,13 @@
> >                         0: force disabled
> >                         1: force enabled
> >
> > +       kunit_shutdown  [KERNEL UNIT TESTING FRAMEWORK] Shutdown kernel after
> > +                       running tests.
> > +                       Default:        (flag not present) don't shutdown
> > +                       poweroff:       poweroff the kernel after running tests.
> > +                       halt:           halt the kernel after running tests.
> > +                       reboot:         reboot the kernel after running tests.
>
> Maybe drop the full stops on the short descriptions.

Will fix.

> Otherwise,
>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>

Thanks!
