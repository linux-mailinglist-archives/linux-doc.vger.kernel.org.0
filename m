Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6042C2E93
	for <lists+linux-doc@lfdr.de>; Tue, 24 Nov 2020 18:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390725AbgKXRa5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Nov 2020 12:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726929AbgKXRa5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Nov 2020 12:30:57 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1025C0617A6
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 09:30:56 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id i17so22994474ljd.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 09:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OADMwQE1HfwIqpykz3TZHnF1kNpcSHUWVvcwMzNsJSQ=;
        b=PJShiVFyF1QNS10ZK4hJqy3gWb157c8QAhEOlJGh2WvhpNpcKK4xyS2IJjsn1qT0o9
         7z5S5VxcVYvqQEhJ+/qHSd+14/OcThKF0xaB0Zrai3oT+DFHkJgtmI/4gbsw2VGDCFTf
         9lYnYnkuCE+t0kqHdYmUa4AheBKK5giwYdR7ynp4suEuBcxe+TwkKY/2jUjhQmBkwsoi
         KrHHhun/l4cIx8YdaDMakKI0Op0/sCEYNA/DmDr6zDJD8cdttK+bAs27ymsbZlrhYsXB
         UX9kzKbv1leE1HsdepaQRJIOVpkmu5ogHpKKcDBoiFcNJnUMu17DN+V02PxWNMwk7zhb
         Zz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OADMwQE1HfwIqpykz3TZHnF1kNpcSHUWVvcwMzNsJSQ=;
        b=GJ+6GVuBzdj5k1Ba6Q8wXMrIJ02hHddUxK+ox4F3mZhy7sclGJYhH+ZTOSjLdwMFY0
         6jLgEU5J2saVgI+Xfa9/T00iT3F4K+Y9ZZCHtFVHvmCby7567GgJeo0Rln03rAlAN2cQ
         bwZ+aH8FEIuSlaxDm1d5/CFUrKYPIf1NFb1SnBUmT66OrZUe6iDewH5fbx43hnPQdLN9
         svC/EwnNZ7iVHsG/iHz4RvXmimnyDe6tWNrmeS5qmTvvCHxaX17nhxbQQKHmbQ24fZUH
         w1cH7Oe2HEFJM9Z1OZDbM8QY4QJkepoeImyNFHLFKvizMg4M37qz3tbJ9PV/+wOpTijY
         CBIw==
X-Gm-Message-State: AOAM53098qsq2zgQjncIde0kjt/iD7ryBjicNcP3XyP4FlmwkLal6n3X
        RWMtirKOK1q36ZVWrdCqFfRCs2Y2hLALFpbjM8uoMe3885zDNvon
X-Google-Smtp-Source: ABdhPJzAUS95IiJtBmLXO44wiBfEN3j6soT+ctyunXlhCZXtXqVbQTF1xIIFi3BAaCvjBNUGriYGAWkADaFGkqIB3QQ=
X-Received: by 2002:a05:651c:1035:: with SMTP id w21mr100232ljm.326.1606239055088;
 Tue, 24 Nov 2020 09:30:55 -0800 (PST)
MIME-Version: 1.0
References: <87lfer2c0b.fsf@oldenburg2.str.redhat.com> <20201124122639.x4zqtxwlpnvw7ycx@wittgenstein>
 <878saq3ofx.fsf@oldenburg2.str.redhat.com> <dcffcbacbc75086582ea3f073c9e6a981a6dd27f.camel@klomp.org>
 <20201124164546.GA14094@infradead.org> <CAG48ez2ZHPavVU3_2VnRADFQstOM1s+3GwfWsRaEjAA1jYcHDg@mail.gmail.com>
 <X70/uPNt2BA/vUSo@kroah.com>
In-Reply-To: <X70/uPNt2BA/vUSo@kroah.com>
From:   Jann Horn <jannh@google.com>
Date:   Tue, 24 Nov 2020 18:30:28 +0100
Message-ID: <CAG48ez2NH2Esw_55JiwK1FAzr_qFFyGaPrE_A=iH=dNuVvY6GQ@mail.gmail.com>
Subject: Re: [PATCH] syscalls: Document OCI seccomp filter interactions & workaround
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>, Mark Wielaard <mark@klomp.org>,
        Florian Weimer <fweimer@redhat.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux API <linux-api@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        dev@opencontainers.org, Jonathan Corbet <corbet@lwn.net>,
        "Carlos O'Donell" <carlos@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 24, 2020 at 6:15 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Tue, Nov 24, 2020 at 06:06:38PM +0100, Jann Horn wrote:
> > +seccomp maintainers/reviewers
> > [thread context is at
> > https://lore.kernel.org/linux-api/87lfer2c0b.fsf@oldenburg2.str.redhat.com/
> > ]
> >
> > On Tue, Nov 24, 2020 at 5:49 PM Christoph Hellwig <hch@infradead.org> wrote:
> > > On Tue, Nov 24, 2020 at 03:08:05PM +0100, Mark Wielaard wrote:
> > > > For valgrind the issue is statx which we try to use before falling back
> > > > to stat64, fstatat or stat (depending on architecture, not all define
> > > > all of these). The problem with these fallbacks is that under some
> > > > containers (libseccomp versions) they might return EPERM instead of
> > > > ENOSYS. This causes really obscure errors that are really hard to
> > > > diagnose.
> > >
> > > So find a way to detect these completely broken container run times
> > > and refuse to run under them at all.  After all they've decided to
> > > deliberately break the syscall ABI.  (and yes, we gave the the rope
> > > to do that with seccomp :().
> >
> > FWIW, if the consensus is that seccomp filters that return -EPERM by
> > default are categorically wrong, I think it should be fairly easy to
> > add a check to the seccomp core that detects whether the installed
> > filter returns EPERM for some fixed unused syscall number and, if so,
> > prints a warning to dmesg or something along those lines...
>
> Why?  seccomp is saying "this syscall is not permitted", so -EPERM seems
> like the correct error to provide here.  It's not -ENOSYS as the syscall
> is present.
>
> As everyone knows, there are other ways to have -EPERM be returned from
> a syscall if you don't have the correct permissions to do something.
> Why is seccomp being singled out here?  It's doing the correct thing.

AFAIU from what the others have said, it's being singled out because
it means that for two semantically equivalent operations (e.g.
openat() vs open()), one can fail while the other works because the
filter doesn't know about one of the syscalls. Normally semantically
equivalent syscalls are supposed to be subject to the same checks, and
if one of them fails, trying the other one won't help.

But if you can't tell whether the more modern syscall failed because
of a seccomp filter, you may be forced to retry with an older syscall
even on systems where the new syscall works fine, and such a fallback
may reduce security or reliability if you're trying to use some flags
that only the new syscall provides for security, or something like
that. (As a contrived example, imagine being forced to retry any
tgkill() that fails with EPERM as a tkill() just in case you're
running under a seccomp filter.)
