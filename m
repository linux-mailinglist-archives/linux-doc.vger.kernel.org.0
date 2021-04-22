Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C09D6367E4B
	for <lists+linux-doc@lfdr.de>; Thu, 22 Apr 2021 12:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235833AbhDVKEC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 22 Apr 2021 06:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235815AbhDVKEA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Apr 2021 06:04:00 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067ECC06138C
        for <linux-doc@vger.kernel.org>; Thu, 22 Apr 2021 03:03:26 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a36so40303192ljq.8
        for <linux-doc@vger.kernel.org>; Thu, 22 Apr 2021 03:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fi1nyojqm+ITv1jOfr1bYqtxzxCOpWmoUIo17W0BtvI=;
        b=pPEh/5ux89ZxxJmLelA6aiTCu6nZP4KZan7I1fhxg5IM2mB/pMxqaykorlLBoHAAF4
         BMwLxkvatGofd4g/7+fqs5W27wB9dZ9ZhACIq8AHx9wYErcvCBLxJQL0Waq9f9wS1u+g
         ht4F4t5p/O9cXD7fTHrqQmB/HkFlmngsYDC/A3S/BdRExVGFpY72I+8AC343Vy6dWKl8
         05OiqXHyputw/PXr55qoyVbKz9N21H9AnOjxyCORDXaFz5gzHgg7CJq7CDmr4EeoejnQ
         ASEO0Ip6TWf9+beKJsxfqsnzWoOhq5DyC5nhFwIEVJ/tayxxWlrG2MAN38Bcw/RRaEKQ
         hl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fi1nyojqm+ITv1jOfr1bYqtxzxCOpWmoUIo17W0BtvI=;
        b=ett9fEynlc58BLkksHzoCfG/uk7x4Iqen9sk3F1sYc5bRJlHz4GU1bSO793ymtF10O
         KVQjPEZxXfFHbk4R6ZVtazPYujsnK5N5zDxATf9wz5xGQpWYyL3kJgcTjMzI7sqY8CLf
         zxRLABB3lmbjvqQYEdQtMe3Ptbia5Qk50SaY17EG+iynBwsTzZpv0sH3/+rcfQUtS7tz
         BjWHCK0Vh4OZhHUyrfTBH7fjz+zlmgyvdv1XTgv9OqMGWSUJd8fPQut1C4/5vks5NS9C
         ym8ar+SfEk0bnlaNSbwHjCYhK6NaR2xfvplnezQ24QmVQ4dL5AcXIDhWEZJlCDlvC5uE
         wwyQ==
X-Gm-Message-State: AOAM532xqzIQoGhmHWvRNea/cHKED+1v+XNDXXea2gEiyA92gXekFOxY
        qu3LZM+0Y6ZVPprIt3DkMKvfeAqy6Z8K2CHEwOGiug==
X-Google-Smtp-Source: ABdhPJzdK6KgdWUAyHPUel0RqEsohUgn0il7lU/HJpySo22DK4nOdNaBNEQmaj5i8Gk/KaGKlqHxQcMn7KBTTYUGYQk=
X-Received: by 2002:a05:651c:c1:: with SMTP id 1mr1859058ljr.467.1619085804376;
 Thu, 22 Apr 2021 03:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
In-Reply-To: <YHj02M3jMSweoP4l@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Apr 2021 12:03:13 +0200
Message-ID: <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi folks,

"we will do less critical stuff, like device drivers, first".

OK I mostly do device drivers. Kind of like it. So I'd like to provide
feedback from that angle.

On Fri, Apr 16, 2021 at 4:22 AM Wedson Almeida Filho
<wedsonaf@google.com> wrote:

> We don't intend to directly expose C data structures to Rust code (outside the
> kernel crate). Instead, we intend to provide wrappers that expose safe
> interfaces even though the implementation may use unsafe blocks. So we expect
> the vast majority of Rust code to just care about the Rust memory model.

I'm a bit worried about this.

I am sure you are aware of this document:
Documentation/process/stable-api-nonsense.rst

We really like to change the internal APIs of the kernel, and it sounds to
me like Rust really likes a rust-side-vs-C-side approach to APIs, requiring
these wrappers to be written and maintained all over the place, and that
is going to affect the mobility of the kernel-internal APIs and make them
less mobile.

If it means I need to write and review less patches related to NULL
dereference and use-after-free etc etc, then it may very well be worth
it.

But as subsystem maintainer I'd like a clear picture of this wrapper
overhead, what does it usually entail? A typical kernel API has
vtable and a few variables, not much more than that.

I go to patch 12/13 and I see things like this:

+/// A descriptor of wrapped list elements.
+pub trait GetLinksWrapped: GetLinks {
+    /// Specifies which wrapper (e.g., `Box` and `Arc`) wraps the list entries.
+    type Wrapped: Wrapper<Self::EntryType>;
+}
+
+impl<T: ?Sized> GetLinksWrapped for Box<T>
+where
+    Box<T>: GetLinks,
+{
+    type Wrapped = Box<<Box<T> as GetLinks>::EntryType>;
+}
+
+impl<T: GetLinks + ?Sized> GetLinks for Box<T> {
+    type EntryType = T::EntryType;
+    fn get_links(data: &Self::EntryType) -> &Links<Self::EntryType> {
+        <T as GetLinks>::get_links(data)
+    }
+}

My God. Lose the horrible CamelCase to begin with. I hope the
language spec does not mandate that because our kernel C style
does not use it.

It becomes obvious that as subsystem maintainer for the Linux kernel
a casual drive-by experience with Rust is not going to suffice by far.

All subsystem maintainers are expected to understand and maintain
wrappers like these, right? That means all subsystem maintainers need
to be elevated to understand the above without effort if you wake them
up in their sleep at 4 in the morning.

This makes me a bit sceptic.

Get me right, we are of course good at doing really complicated stuff,
that's what engineers do. But we are not Iron Man. We need a clear
way into understanding and maintaining wrappers and we need support
with it when we don't understand it, so the kernel would need a Rust
wrapper maintainer that we can trust to stay around for the long term,
i.e. until their retirement, while actively teaching others for decades.
For an example see how RCU is maintained.

Developing trust in the people Miguel and Wedson is going to be more
important than trust in Google the company for this.

Yours,
Linus Walleij
