Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672DF37AC75
	for <lists+linux-doc@lfdr.de>; Tue, 11 May 2021 18:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhEKQxE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 May 2021 12:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbhEKQxD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 May 2021 12:53:03 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB52FC061574
        for <linux-doc@vger.kernel.org>; Tue, 11 May 2021 09:51:55 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id p6-20020a4adc060000b02901f9a8fc324fso4338665oov.10
        for <linux-doc@vger.kernel.org>; Tue, 11 May 2021 09:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=+RJRJaIHaSSStueEp7c4C/AdKDnf+CbyhjFANCnCZTE=;
        b=e6jUzMAKZwJO6OMOqbd2AF4AK2OBjS+IYl4Reeg8VX0j44W/gvqifH15lQJQzXdrOH
         VfH3edlfHMDq/PAjZZR2aNO9EmR5l7ay1rhZhv5cj+23A9KXwFk3HuF2PsTAIdr65vow
         lTM6szYHV402N153dIlmvxF5pVjZ/19745/6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=+RJRJaIHaSSStueEp7c4C/AdKDnf+CbyhjFANCnCZTE=;
        b=ZQhE1JFFjZMaZoMsYJf8XdxakT2tyA/sNfQGmQ78zYVbjkwQRmIsvaQJFbnU3w5dmp
         NOaMSV/+VGnb4RsK0kk/mgdBkoIGQfeiLQukONm3/NUvIAFzLAUtg/C9Faf1ydtlSJX6
         p1miWEfZ/t9vdzEDUa3pSjvbGPq7aQepPLpS6NusXi5geqqpSm2G9yfdZIDjO1iYG3mK
         cKalL1gIwm4vTTW88oK95JxGO3SPHFM5yS4RrjuKp2XJKl/SCeOj4nQ3zLJflF7OxrYI
         5Xvd+B64JwIqPE75pGuCfcbfYRniQVDt5II9oAEtzxTtcBsCmVcF4x6kUIWnXTGi8KbS
         8IdQ==
X-Gm-Message-State: AOAM531Z7jJTbbus3cM5gapq/4KIZHQW10xStnrpotMyVExF023amgNU
        SWEy/b34ehroeUZhx1MbDjZpCx2BGFCiQiajycTd/A==
X-Google-Smtp-Source: ABdhPJyj2ahEw7C14zjVPw1sfYmwYktfujxVMpaVk9ux+m+l6dUS8yBsvja4qov19tkkiOKjCUmb1rnMw4jrGo3vtSk=
X-Received: by 2002:a4a:dc5:: with SMTP id 188mr24189409oob.80.1620751915341;
 Tue, 11 May 2021 09:51:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 May 2021 09:51:54 -0700
MIME-Version: 1.0
In-Reply-To: <YJpr+T616Wki2542@alley>
References: <20210511003845.2429846-1-swboyd@chromium.org> <20210511003845.2429846-6-swboyd@chromium.org>
 <YJpr+T616Wki2542@alley>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 11 May 2021 09:51:54 -0700
Message-ID: <CAE-0n522Oy1B3W3gpnShFM3YhRDXU_4nt6NTvBETmDJ9EL-Ddw@mail.gmail.com>
Subject: Re: [PATCH v6 05/13] module: Add printk formats to add module build
 ID to stacktraces
To:     Petr Mladek <pmladek@suse.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Petr Mladek (2021-05-11 04:35:21)
> On Mon 2021-05-10 17:38:37, Stephen Boyd wrote:
> > Let's make kernel stacktraces easier to identify by including the build
> > ID[1] of a module if the stacktrace is printing a symbol from a module.
>
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -11,6 +11,7 @@
> >
> >  #include <linux/list.h>
> >  #include <linux/stat.h>
> > +#include <linux/buildid.h>
> >  #include <linux/compiler.h>
> >  #include <linux/cache.h>
> >  #include <linux/kmod.h>
> > @@ -364,6 +365,11 @@ struct module {
> >       /* Unique handle for this module */
> >       char name[MODULE_NAME_LEN];
> >
> > +#ifdef CONFIG_STACKTRACE_BUILD_ID
> > +     /* Module build ID */
> > +     unsigned char build_id[BUILD_ID_SIZE_MAX];
> > +#endif
> > +
> >       /* Sysfs stuff. */
> >       struct module_kobject mkobj;
> >       struct module_attribute *modinfo_attrs;
> > @@ -627,7 +633,7 @@ void *dereference_module_function_descriptor(struct module *mod, void *ptr);
> >  const char *module_address_lookup(unsigned long addr,
> >                           unsigned long *symbolsize,
> >                           unsigned long *offset,
> > -                         char **modname,
> > +                         char **modname, const unsigned char **modbuildid,
>
> Nit: It would have been better to follow the existing style and put only one
>      parameter per-line.
>
> Please, fix it in the next version if there is any. But no need
> to resend it just because of this unless Jessica asks for it.

Thanks. akpm already picked this series up and fixed this problem.
