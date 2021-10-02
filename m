Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAF341FD46
	for <lists+linux-doc@lfdr.de>; Sat,  2 Oct 2021 18:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233687AbhJBQzH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 2 Oct 2021 12:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbhJBQzG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Oct 2021 12:55:06 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8214AC0613EC
        for <linux-doc@vger.kernel.org>; Sat,  2 Oct 2021 09:53:20 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u18so52058224lfd.12
        for <linux-doc@vger.kernel.org>; Sat, 02 Oct 2021 09:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7qMFTJ7wxvDKx7RqRNbyM5iYJL53fzpBAX1Z0cXGDYo=;
        b=BnC7AWn2t7U8hcMvbZB6+f8WRPJ/wlLxLWqJMBBFQqlt2pJ7o9Cq+PY7G8zlvkboG0
         +aMmZjmiZyWkpgq/2TNa5lv+hVLEInO3k7cx6j+7mNevTzx3z8dSx+JapPEMt+QE7qnM
         jYwoWfCyKbjfVLLEkVydAP4vUyV5gl74Dwa/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7qMFTJ7wxvDKx7RqRNbyM5iYJL53fzpBAX1Z0cXGDYo=;
        b=VaTx1jW/2TClmmL1jJwqoDwi1ZbyhO609Puqyf+4sv8RGoou2tM+C6Z5r/eUBYggGm
         sBx46sW5gAekDaHtEOuaviPvk8wNgqahFp2S/uXXwSevex4FKRRHVbXvzHjuk8Sx4SN+
         nINcPvJNqMiPjVATNN0lZc4l3305HQEOirlk0R3t2lE/F9e/paJT37HpnkVOjolEXDTB
         iGuKSKQwNPNYXiR/j4+ZHcu6Z0qW4jQE4Ff5A8HUsMxoEAf6c4IDpR8kIChBw40s28T0
         gk4L9QRuP2LO38wkoU/e3H1EqzH3j0oy+p10EhhjlNtzGqABwftSAXs8XN6bqcS9YYX2
         5WyQ==
X-Gm-Message-State: AOAM530p9AF0Pm1696Nn05A/iJt+9WdPmHtaAtABsnlgdnDgFYo6THS4
        G05S/F8dZm1ZL+dyNbgPQU2fbYWBC8zStcf7wmE=
X-Google-Smtp-Source: ABdhPJyTVVMPPhxLad/C4nEh9lSd77i1vGOsR/FBdvofphg0igqA5KozpfBfQ9fhEni5cQsHjTY06A==
X-Received: by 2002:a05:6512:2002:: with SMTP id a2mr4335596lfb.531.1633193597947;
        Sat, 02 Oct 2021 09:53:17 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 13sm1085206lfq.285.2021.10.02.09.53.16
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Oct 2021 09:53:16 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id i4so52295592lfv.4
        for <linux-doc@vger.kernel.org>; Sat, 02 Oct 2021 09:53:16 -0700 (PDT)
X-Received: by 2002:a2e:3309:: with SMTP id d9mr4559712ljc.249.1633193585297;
 Sat, 02 Oct 2021 09:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210929185823.499268-1-alex.popov@linux.com> <d290202d-a72d-0821-9edf-efbecf6f6cef@linux.com>
 <20210929194924.GA880162@paulmck-ThinkPad-P17-Gen-1> <YVWAPXSzFNbHz6+U@alley>
 <CAHk-=widOm3FXMPXXK0cVaoFuy3jCk65=5VweLceQCuWdep=Hg@mail.gmail.com> <ba67ead7-f075-e7ad-3274-d9b2bc4c1f44@linux.com>
In-Reply-To: <ba67ead7-f075-e7ad-3274-d9b2bc4c1f44@linux.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 2 Oct 2021 09:52:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=whrLuVEC0x+XzYUNV2de5kM-k39GkJWwviQNuCdZ0nfKg@mail.gmail.com>
Message-ID: <CAHk-=whrLuVEC0x+XzYUNV2de5kM-k39GkJWwviQNuCdZ0nfKg@mail.gmail.com>
Subject: Re: [PATCH] Introduce the pkill_on_warn boot parameter
To:     Alexander Popov <alex.popov@linux.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Joerg Roedel <jroedel@suse.de>,
        Maciej Rozycki <macro@orcam.me.uk>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kees Cook <keescook@chromium.org>,
        Luis Chamberlain <mcgrof@kernel.org>, Wei Liu <wl@xen.org>,
        John Ogness <john.ogness@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Jann Horn <jannh@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Lutomirski <luto@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will.deacon@arm.com>,
        David S Miller <davem@davemloft.net>,
        Borislav Petkov <bp@alien8.de>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-hardening@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        notify@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Oct 2, 2021 at 4:41 AM Alexander Popov <alex.popov@linux.com> wrote:
>
> And what do you think about the proposed pkill_on_warn?

Honestly, I don't see the point.

If you can reliably trigger the WARN_ON some way, you can probably
cause more problems by fooling some other process to trigger it.

And if it's unintentional, then what does the signal help?

So rather than a "rationale" that makes little sense, I'd like to hear
of an actual _use_ case. That's different. That's somebody actually
_using_ that pkill to good effect for some particular load.

That said, I don't much care in the end. But it sounds like a
pointless option to just introduce yet another behavior to something
that should never happen anyway, and where the actual
honest-to-goodness reason for WARN_ON() existing is already being
fulfilled (ie syzbot has been very effective at flushing things like
that out).

                   Linus
