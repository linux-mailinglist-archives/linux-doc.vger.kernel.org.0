Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAA602DA33
	for <lists+linux-doc@lfdr.de>; Wed, 29 May 2019 12:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbfE2KQn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 May 2019 06:16:43 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33552 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbfE2KQn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 06:16:43 -0400
Received: by mail-ot1-f66.google.com with SMTP id n18so1479420otq.0
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2019 03:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Abxu/H1sImqXuhwWhYSOk5xvOYnoBkkpjqInhihBcCI=;
        b=uPCsWh9fRkWJuwlKpXHz/RZG8nW7YVKwC5/i0AHmBQAElVNCKYPnYDRGPWr2Sdiy7J
         FGbrAZmtywaEWHYlECjBy38lyCo+kUWgsOoyLdN9JcCHLXuHsVfd0CNld++/Ri8YnZAJ
         /wEL+fD8DmpH+o4Nkygolmx0hfSISheT3J6qbDzFobiY0PK2bQiYhh7ywr38sKK0BfCi
         bKrsgKW4qELWcwep0HGbl3J/E2D/Bx3IVrWqSQnvtjtFNFIflWwXuZAN5zDPK0liW9L8
         JPaEVv4Vgk0MKUmIcicVi2gUce7F86R9k6BO/LqHPVAm0TaPXLX2Ht8Eb3X9GKl6IB8C
         Gp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Abxu/H1sImqXuhwWhYSOk5xvOYnoBkkpjqInhihBcCI=;
        b=BPpTb5enyyi9O2p6DSXK6P39ded62J0n/o/ZTZSpY/GVsyNOLvIj44D7iD4tdGxnWp
         bfXMCeVomz9LZ2N+ecSL1dCgoORgETRqpL6CS+ttJx5yZZkqzyPyE6QW57am0AS1QQ+8
         aD7g+C2qRc47Vf6mE+A2wajF4CzMtZ0MM6CJ+uS7BJtz4OwAruEqFsMXlerEuqZGnVYd
         OF3vSDB1yfckJZVCSAhxooUAiCujx4jWJ4fiH2SQxPt9TCbbx1c+ivvSWhRnWjtTn3fz
         MSzI/HZQslgzNhbl2Frw/aCC6MNN/K9+ecRfsk26zJhY71OEJkgLd4Zx1CSnK7wmnhP+
         kQiQ==
X-Gm-Message-State: APjAAAUVw28wxfm8hXRrkPuKnasuzMqfi3olAkhpEJQaIt0BDHyEBqSs
        LadJStsQzu1H9XICtWEas0VSUuru7PvTH/c5N05+nw==
X-Google-Smtp-Source: APXvYqyIW+HHgmO4UbA1lWAYQ9U1IvOgE1sk2LyiOyRvq+lk+NzeDhjzN0ojhEHe/Jj7gOCSDDh+51NrikrTdytRzS0=
X-Received: by 2002:a9d:362:: with SMTP id 89mr37406316otv.17.1559125002323;
 Wed, 29 May 2019 03:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190528163258.260144-1-elver@google.com> <20190528163258.260144-3-elver@google.com>
 <20190528165036.GC28492@lakrids.cambridge.arm.com> <CACT4Y+bV0CczjRWgHQq3kvioLaaKgN+hnYEKCe5wkbdngrm+8g@mail.gmail.com>
 <CANpmjNNtjS3fUoQ_9FQqANYS2wuJZeFRNLZUq-ku=v62GEGTig@mail.gmail.com> <20190529100116.GM2623@hirez.programming.kicks-ass.net>
In-Reply-To: <20190529100116.GM2623@hirez.programming.kicks-ass.net>
From:   Marco Elver <elver@google.com>
Date:   Wed, 29 May 2019 12:16:31 +0200
Message-ID: <CANpmjNMvwAny54udYCHfBw1+aphrQmiiTJxqDq7q=h+6fvpO4w@mail.gmail.com>
Subject: Re: [PATCH 3/3] asm-generic, x86: Add bitops instrumentation for KASAN
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 29 May 2019 at 12:01, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, May 29, 2019 at 11:20:17AM +0200, Marco Elver wrote:
> > For the default, we decided to err on the conservative side for now,
> > since it seems that e.g. x86 operates only on the byte the bit is on.
>
> This is not correct, see for instance set_bit():
>
> static __always_inline void
> set_bit(long nr, volatile unsigned long *addr)
> {
>         if (IS_IMMEDIATE(nr)) {
>                 asm volatile(LOCK_PREFIX "orb %1,%0"
>                         : CONST_MASK_ADDR(nr, addr)
>                         : "iq" ((u8)CONST_MASK(nr))
>                         : "memory");
>         } else {
>                 asm volatile(LOCK_PREFIX __ASM_SIZE(bts) " %1,%0"
>                         : : RLONG_ADDR(addr), "Ir" (nr) : "memory");
>         }
> }
>
> That results in:
>
>         LOCK BTSQ nr, (addr)
>
> when @nr is not an immediate.

Thanks for the clarification. Given that arm64 already instruments
bitops access to whole words, and x86 may also do so for some bitops,
it seems fine to instrument word-sized accesses by default. Is that
reasonable?
