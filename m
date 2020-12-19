Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FE92DF036
	for <lists+linux-doc@lfdr.de>; Sat, 19 Dec 2020 16:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgLSPXa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 19 Dec 2020 10:23:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgLSPXa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Dec 2020 10:23:30 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F2CC061285
        for <linux-doc@vger.kernel.org>; Sat, 19 Dec 2020 07:22:49 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id n26so7496176eju.6
        for <linux-doc@vger.kernel.org>; Sat, 19 Dec 2020 07:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P+jGtH23Yq38yOQYGvt0IgD6KQtyCabY1KtS2IhBV/0=;
        b=UoiP6/bZfAjYvg1sfgXfD+ImXuTeBVduRWggWXpuxYhLbZ1Y14mqpf1YwP0Y58p62e
         Gyernd13LNioL+mKStJcoHk4wTC7BPu+dnntkmJyIFpuZ5TGbNtIAzaVp77uO4jrEFgY
         f1pD77NUHkq1ufWXlF2CaDVX5+fAxwKDJ9raLf9yhqA3kbcFB3R16VvKUPqDgxmU2nQR
         NmffjBeVjRtb8jONQTYBNsnLk7M/hcT6IfANSQ2nYWlLayD2ZT+tzPkjs5HudXxIOLkO
         Oy6l0o98vGSPK7OZ8B/enprP5uuqBpU9MsNp/Nz8YTA4cty6qq6Pm76sHenxiOcZ+rZ5
         bm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P+jGtH23Yq38yOQYGvt0IgD6KQtyCabY1KtS2IhBV/0=;
        b=o6gc7PN/coWmz08mUXox5lQQ9G7+nq9BLRdRWZS6jIt/dZjGLoBwGLwS9P9/4yDlIE
         iMZ9/8HcLAWzQHM2cvKkvwrWg+AJ2Wfq4z/0EVmB/3pSQchT3wReCJMT+UzPmwhoKeUL
         i6yUm6nVYjUaVth9o5VjNr8Intii9t7JCheqQ2PYzKHdSAuR91qVTCMG4IvcL7HkeE2P
         D/KZTnIOVOCYR1f6KhPxc2ad/XSC02xt2ZturuSHOrFytxtJup4TOrQTUsgCfR11ULS5
         9RkbUxNj17fQp7fPdd+gGcNOCjGRL2UoZbgwYz2pB0SX+v6/wfuIFMZYVeT0+P9dfHeP
         WDZw==
X-Gm-Message-State: AOAM530tb92hs+7c3XFcF18hZfGMivhy6os0n7bWvHsN7PDK9qk5vGNr
        CI/OkZXB8sncbsP90o9XKR1AWuk2YFTlOrBgbx6XXA==
X-Google-Smtp-Source: ABdhPJw7uNC1YKSCA18U0yIH6EDWLkYeZ5Z/TCbZxv03GrBNZ/TC07+r/73iebPU+3XMZpziP+iF0h9IrSfzvsdJiDU=
X-Received: by 2002:a17:906:b04f:: with SMTP id bj15mr8506111ejb.383.1608391368306;
 Sat, 19 Dec 2020 07:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
 <20201217185243.3288048-11-pasha.tatashin@soleen.com> <75b6fb52-ef2c-e17b-2e43-45be913c6206@nvidia.com>
In-Reply-To: <75b6fb52-ef2c-e17b-2e43-45be913c6206@nvidia.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Sat, 19 Dec 2020 10:22:12 -0500
Message-ID: <CA+CK2bBXRHwNoaT=Nveeb=YaZodS56K+frujvuzGXGCTMvpN7A@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] selftests/vm: test faulting in kernel, and
 verify pinnable pages
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, mike.kravetz@oracle.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Ira Weiny <ira.weiny@intel.com>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Dec 19, 2020 at 12:57 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 12/17/20 10:52 AM, Pavel Tatashin wrote:
>  >
>
> Hi Pavel,
>
> This all looks good pretty good to me, with just a couple of minor
> doubts interleaved with the documentation tweaks:
>
> a) I'm not yet sure if the is_pinnable_page() concept is a keeper. If it's
> not for some reason, then we should revisit this patch.
>
> b) I don't yet understand why FOLL_TOUCH from gup/pup is a critical part
> of the test.
>
>
> > When pages are pinned they can be faulted in userland and migrated, and
> > they can be faulted right in kernel without migration.
> >
> > In either case, the pinned pages must end-up being pinnable (not movable).
>
> Let's delete the above two sentences, which are confusing as currently
> worded, and just keep approximately the last sentence below.

Sure.

>
> >
> > Add a new test without touching pages in userland, and use FOLL_TOUCH
> > instead. Also, verify that pinned pages are pinnable.
>
> Maybe this instead:
>
> Add a new test to gup_test, to verify that only "pinnable" pages are
> pinned. Also, use gup/pup + FOLL_TOUCH to fault in the pages, rather
> than faulting them in from user space.

OK

>
>
> ?  But I don't know why that second point is important. Is it actually
> important in order to have a valid test? If so, why?

It is crucial because when pages are faulted from userland they may
end up in a movable zone, we spend time migrating them during pinning:
performance suffers. When pages are faulted from the kernel, they do
not need to be migrated as they should end-up in the right zone from
the beginning, and performance should be fast.

Here is sample run to pin 512M 4096 pages at a time:

Before my changes:
Fault in userland:    get:4787 put:1093
Fault in kernel:      get:80577 put:1187
In both cases pages in movable zone were pinned. The fault in kernel
is slower compared to userland, because pages need to be faulted and
zeroed before returning.

With my changes:
Fault in userland:   get:150793 put:1111
Fault in kernel:        get:81066 put:1091
In both cases pages were pinned in correct zone. The fault in kernel
is faster than userland, because userland pages needed to be migrated
from the movable zone.


>
>
> >
> > Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
> > ---
> >   mm/gup_test.c                         |  6 ++++++
> >   tools/testing/selftests/vm/gup_test.c | 17 +++++++++++++----
> >   2 files changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/gup_test.c b/mm/gup_test.c
> > index 24c70c5814ba..24fd542091ee 100644
> > --- a/mm/gup_test.c
> > +++ b/mm/gup_test.c
> > @@ -52,6 +52,12 @@ static void verify_dma_pinned(unsigned int cmd, struct page **pages,
> >
> >                               dump_page(page, "gup_test failure");
> >                               break;
> > +                     } else if (cmd == PIN_LONGTERM_BENCHMARK &&
> > +                             WARN(!is_pinnable_page(page),
> > +                                  "pages[%lu] is NOT pinnable but pinned\n",
> > +                                  i)) {
> > +                             dump_page(page, "gup_test failure");
> > +                             break;
> >                       }
> >               }
> >               break;
> > diff --git a/tools/testing/selftests/vm/gup_test.c b/tools/testing/selftests/vm/gup_test.c
> > index 42c71483729f..f08cc97d424d 100644
> > --- a/tools/testing/selftests/vm/gup_test.c
> > +++ b/tools/testing/selftests/vm/gup_test.c
> > @@ -13,6 +13,7 @@
> >
> >   /* Just the flags we need, copied from mm.h: */
> >   #define FOLL_WRITE  0x01    /* check pte is writable */
> > +#define FOLL_TOUCH   0x02    /* mark page accessed */
>
>
> Aha, now I see why you wanted to pass other GUP flags, in the previous
> patch. I think it's OK to pass this set of possible flags (as
> .gup_flags) through ioctl, yes.

Sure, and I will rename .flags to .gup_flags as you previously suggested.

>
> However (this is about the previous patch), I *think* we're better off
> leaving the gup_test behavior as: "default is read-only pages, but you
> can pass in -w to specify FOLL_WRITE". As opposed to passing in raw
> flags from the command line. And yes, I realize that my -F option seemed
> to recommand the latter...I'm regretting that -F approach now.

But, that would reverse the current default behaviour where FOLL_WRITE
is always set. I introduced "-W" not to break backward compatibility
where the "-w" option was already available, but since "-w" is the
default it basically does nothing, where "-W '' removes the
FOLL_WRITE. Do you want to reverse the current behaviour?

>
> The other direction to go might be to stop doing that, and shift over to
> just let the user specify FOLL_* flags directly on the command line, but
> IMHO there's no need for that (yet), and it's a little less error-prone
> to constrain it.
>
> This leads to: change the "-F 1", to some other better-named option,
> perhaps. Open to suggestion there.

Perhaps disable "-F n" and print a warning about the ignored flag
until it is found to be useful?

>
>
> >
> >   static char *cmd_to_str(unsigned long cmd)
> >   {
> > @@ -39,11 +40,11 @@ int main(int argc, char **argv)
> >       unsigned long size = 128 * MB;
> >       int i, fd, filed, opt, nr_pages = 1, thp = -1, repeats = 1, write = 1;
> >       unsigned long cmd = GUP_FAST_BENCHMARK;
> > -     int flags = MAP_PRIVATE;
> > +     int flags = MAP_PRIVATE, touch = 0;
>
>
> Silly nit, can we put it on its own line? This pre-existing mess of
> declarations makes it hard to read everything. One item per line is
> easier on the reader, who is often just looking for a single item at a
> time. Actually why not rename it slightly while we're here (see below),
> maybe to this:
>
>         int use_foll_touch = 0;

Sure, I will move it. I also prefer one initialization per-line, but
tried to keep the current style. I can also correct the other
initializations in this function.

>
>
> >       char *file = "/dev/zero";
> >       char *p;
> >
> > -     while ((opt = getopt(argc, argv, "m:r:n:F:f:abctTLUuwWSHp")) != -1) {
> > +     while ((opt = getopt(argc, argv, "m:r:n:F:f:abctTLUuwWSHpz")) != -1) {
>
> Yes, this seems worth its own command line option.
>
> >               switch (opt) {
> >               case 'a':
> >                       cmd = PIN_FAST_BENCHMARK;
> > @@ -110,6 +111,10 @@ int main(int argc, char **argv)
> >               case 'H':
> >                       flags |= (MAP_HUGETLB | MAP_ANONYMOUS);
> >                       break;
> > +             case 'z':
> > +                     /* fault pages in gup, do not fault in userland */
>
> How about:
>                         /*
>                          * Use gup/pup(FOLL_TOUCH), *instead* of faulting
>                          * pages in from user space.
>                          */
>                         use_foll_touch = 1;

Sure.

>
> > +                     touch = 1;
> > +                     break;
> >               default:
> >                       return -1;
> >               }
> > @@ -167,8 +172,12 @@ int main(int argc, char **argv)
> >       else if (thp == 0)
> >               madvise(p, size, MADV_NOHUGEPAGE);
> >
> > -     for (; (unsigned long)p < gup.addr + size; p += PAGE_SIZE)
> > -             p[0] = 0;
> > +     if (touch) {
> > +             gup.flags |= FOLL_TOUCH;
> > +     } else {
> > +             for (; (unsigned long)p < gup.addr + size; p += PAGE_SIZE)
> > +                     p[0] = 0;
> > +     }
>
> OK.

Thank you for your review.

Pahsa
