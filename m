Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5F92663D6
	for <lists+linux-doc@lfdr.de>; Fri, 11 Sep 2020 18:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgIKQ0D (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 11 Sep 2020 12:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbgIKPWl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Sep 2020 11:22:41 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F23C06179B
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2020 06:33:56 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id d189so9409986oig.12
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2020 06:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TpsoM88cyk0U9ujavsoiNiP/xNpunXVnqQMw3rUrW70=;
        b=cL1oEi6GisMpZ+1vyaA1YZmE9+hCJmDs4kjImnwwOvOvKuOrq7EHDUtsuuabzR57Po
         K0AAX9GUto+YmGqhasb5W+vSlZpIfwGIpXn8/ZobsoDeJAJ/YCW6Jf2ybVuHSXZ02iHQ
         h6tve/Bzu8Wpl7KaWn7eZFKsYkyrouec6acrsO3QrHhdbgZgDli4Blz30Kn6EMMfCBB6
         58ax9jDb2e5Q/SgCE0G1rBCJ/6kVKL7K1KguH/4zVty6MT6Hs8WiLxSXGArkPLwwuURv
         HHvmieKXwiJoMkOUJQMjpACLQQ0BtYCF8oF3Vir4JYh/XjFSG9+Miqora4bd5lLjf1sX
         HUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TpsoM88cyk0U9ujavsoiNiP/xNpunXVnqQMw3rUrW70=;
        b=QXbcAf2/p7ZwfXuoKcqP4TWJ8dyjGiaWPJabAkuogXL6Vn2g+r7O/wpjteCyFSYG2v
         h6zP21gU84GX3o8ffjUcwT9RJnEV9JNm2kWj3jV/o6k4cS/E8TtxqqPvcoRiHApCv+oN
         K9Xkd7uz+Qd8iOdmTC9nhPM4aCiDHeVMfO7+8lZGngRHnOefGB6MLix/5l3vmFzyDCXL
         cCjvmTeMH7Uh6rGfXGNkuxoc6bouOjtlCKYPxmAdUWDAWGCPM1A1RSQPL9XA6vrmbNS9
         6Kdp+g8h7tcTUkQ7XVTV4N2lWA+z0pqk8GXMgR/uaohuS0ZVDN8SA3Q2arrx0K2ARpgS
         rjTg==
X-Gm-Message-State: AOAM533V+gQtsetFfFgJxa1rrHtk37ApCcPKlqA26SZeAs++sty9Khwt
        786w8nmnRKeKlWq8PPWGEZfTaQD8DsPAeOQRmwzNnw==
X-Google-Smtp-Source: ABdhPJzVyxHRpCzzWlwpCs+zsjH4vVQha0aihZX+rNn7CbuvYFeOPOIR3N4j0lJ6yIb7854KZDwveUXgHPVXHY+FMZ4=
X-Received: by 2002:aca:54d1:: with SMTP id i200mr1268021oib.172.1599831235876;
 Fri, 11 Sep 2020 06:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200907134055.2878499-1-elver@google.com> <e399d8d5-03c2-3c13-2a43-3bb8e842c55a@intel.com>
 <20200908153102.GB61807@elver.google.com> <feb73053-17a6-8b43-5b2b-51a813e81622@suse.cz>
 <20200908155631.GC61807@elver.google.com> <CACT4Y+YZqj0CJTumpHr-g9HcRgs+JHwWP5eg1nYHP0E-Zw25DQ@mail.gmail.com>
 <CANpmjNO7XwhefA+NKszVkNqj8a60QY45n-=EUtGns+ysNYV9mQ@mail.gmail.com> <CACT4Y+YSQDjEh6+XMXiHvMaKAT8bA=JkC8xY3AXfcSk+f9yR+g@mail.gmail.com>
In-Reply-To: <CACT4Y+YSQDjEh6+XMXiHvMaKAT8bA=JkC8xY3AXfcSk+f9yR+g@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 11 Sep 2020 15:33:44 +0200
Message-ID: <CANpmjNNWOVi317bF_E=QdcSSd5x6Dfk=+nECA9VnZSLGMKigYQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/10] KFENCE: A low-overhead sampling-based memory
 safety error detector
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Vlastimil Babka <vbabka@suse.cz>,
        Dave Hansen <dave.hansen@intel.com>,
        Alexander Potapenko <glider@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>, Qian Cai <cai@lca.pw>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 11 Sep 2020 at 15:10, Dmitry Vyukov <dvyukov@google.com> wrote:
> On Fri, Sep 11, 2020 at 2:03 PM Marco Elver <elver@google.com> wrote:
> > On Fri, 11 Sep 2020 at 09:36, Dmitry Vyukov <dvyukov@google.com> wrote:
[...]
> > > By "reasonable" I mean if the pool will last long enough to still
> > > sample something after hours/days? Have you tried any experiments with
> > > some workload (both short-lived processes and long-lived
> > > processes/namespaces) capturing state of the pool? It can make sense
> > > to do to better understand dynamics. I suspect that the rate may need
> > > to be orders of magnitude lower.
> >
> > Yes, the current default sample interval is a lower bound, and is also
> > a reasonable default for testing. I expect real deployments to use
> > much higher sample intervals (lower rate).
> >
> > So here's some data (with CONFIG_KFENCE_NUM_OBJECTS=1000, so that
> > allocated KFENCE objects isn't artificially capped):
> >
> > -- With a mostly vanilla config + KFENCE (sample interval 100 ms),
> > after ~40 min uptime (only boot, then idle) I see ~60 KFENCE objects
> > (total allocations >600). Those aren't always the same objects, with
> > roughly ~2 allocations/frees per second.
> >
> > -- Then running sysbench I/O benchmark, KFENCE objects allocated peak
> > at 82. During the benchmark, allocations/frees per second are closer
> > to 10-15. After the benchmark, the KFENCE objects allocated remain at
> > 82, and allocations/frees per second fall back to ~2.
> >
> > -- For the same system, changing the sample interval to 1 ms (echo 1 >
> > /sys/module/kfence/parameters/sample_interval), and re-running the
> > benchmark gives me: KFENCE objects allocated peak at exactly 500, with
> > ~500 allocations/frees per second. After that, allocated KFENCE
> > objects dropped a little to 496, and allocations/frees per second fell
> > back to ~2.
> >
> > -- The long-lived objects are due to caches, and just running 'echo 1
> > > /proc/sys/vm/drop_caches' reduced allocated KFENCE objects back to
> > 45.
>
> Interesting. What type of caches is this? If there is some type of
> cache that caches particularly lots of sampled objects, we could
> potentially change the cache to release sampled objects eagerly.

The 2 major users of KFENCE objects for that workload are
'buffer_head' and 'bio-0'.

If we want to deal with those, I guess there are 2 options:

1. More complex, but more precise: make the users of them check
is_kfence_address() and release their buffers earlier.

2. Simpler, generic solution: make KFENCE stop return allocations for
non-kmalloc_caches memcaches after more than ~90% of the pool is
exhausted. This assumes that creators of long-lived objects usually
set up their own memcaches.

I'm currently inclined to go for (2).

Thanks,
-- Marco
