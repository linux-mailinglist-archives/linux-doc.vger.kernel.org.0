Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30D9D596170
	for <lists+linux-doc@lfdr.de>; Tue, 16 Aug 2022 19:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235643AbiHPRt5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 16 Aug 2022 13:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236173AbiHPRtz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Aug 2022 13:49:55 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C6D67F129
        for <linux-doc@vger.kernel.org>; Tue, 16 Aug 2022 10:49:54 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id o2so8785859iof.8
        for <linux-doc@vger.kernel.org>; Tue, 16 Aug 2022 10:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solid-run-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=kjqRKq9oJnes+t5wbhe3Qf46+H6wK6o+K4jvO1Tjuz8=;
        b=2Pp8bzj1MnGCU6V3vFJNsSKqqD/ziYTUDm2CF1NJhzXFBX0xc9mbyDXDKdd+QB6Wzg
         fnZJp2eKCWYuykufGDOSXGPsv7jAdNiq872uZ6+YS3FEFDrsSvziP6q9qSsi0Ckj3rGk
         XHwBXg1srh4Gm2YSVxSA6FWxO8UL52ni/TVzR7B/j2W6YFIoS6dNX9hcZaecsBB51/48
         +kYqS4rCI7UtAK7/T6NtJ9t9wNKLMRAm8kGrTxwRKhYfTpMqr49Lyx3o36X27FzopYeX
         UT/Tl9jNtv43LRs9+KljN2KuIM+HYa4Z0ZT/eAtIJuPoK4dcHdAc27Zu4v9ChOlJn8pk
         BZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=kjqRKq9oJnes+t5wbhe3Qf46+H6wK6o+K4jvO1Tjuz8=;
        b=IikrKpJU8FrxAHoPhOjfuDnsZzBFarUmrSmg4y8sc4LBn20ZITODjCj5KBOzw+dY+o
         IFyw8nUZx7Lb6AsA+7kr3++J+HhghDU62kLX/JayH+YQJIl4AKFUI8J496JrxJJXnPiN
         1v3QhzK/xmg8g/yrEO5ev98Gt1F3IUzvE6l9Z1oiXVxMzIHWiLpVvoH4Kod+LXvnKGtP
         nyulnEjBWuBh42QghmiHSqiaFlIh00QCV40WXv5c0q5CLLaMGpjJ34vD13KpbcA5oJD2
         UriXim4SfnE6K/MbiCsefrNxILHT/Bcttjlb8Kuu/pf1dZLRwPM900KEJ5sBi/lGhKNl
         8UkA==
X-Gm-Message-State: ACgBeo2Rb0XLgCywsTYHH5WcMqddQdS68+hnpSFzeYNLvxRQyPLxdGPr
        Qh537O4dqxRY1TUP/mbMU3IyWqqq7WGlkaaeN2AVqQ==
X-Google-Smtp-Source: AA6agR7IlYaeIBknvmvu0X+8YEBbXtjhQpsdJAi0dy2tbyCrCmJ4c7rG6mWa+yox2ulVDU8DDG9g31v9WMcdQCjTBiU=
X-Received: by 2002:a05:6602:3cc:b0:679:61e7:3928 with SMTP id
 g12-20020a05660203cc00b0067961e73928mr9381040iov.217.1660672193863; Tue, 16
 Aug 2022 10:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220816070311.89186-1-marcan@marcan.st> <20220816140423.GC11202@willie-the-truck>
 <c545705f-ee7e-4442-ebfc-64a3baca2836@marcan.st> <20220816173654.GA11766@willie-the-truck>
In-Reply-To: <20220816173654.GA11766@willie-the-truck>
From:   Jon Nettleton <jon@solid-run.com>
Date:   Tue, 16 Aug 2022 19:49:16 +0200
Message-ID: <CABdtJHt_3TKJVLhLiYMcBtvyA_DwaNapv1xHVeDdQH7cAC6YWw@mail.gmail.com>
Subject: Re: [PATCH] locking/atomic: Make test_and_*_bit() ordered on failure
To:     Will Deacon <will@kernel.org>
Cc:     Hector Martin <marcan@marcan.st>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
        jirislaby@kernel.org, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Oliver Neukum <oneukum@suse.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Asahi Linux <asahi@lists.linux.dev>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 16, 2022 at 7:38 PM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Aug 16, 2022 at 11:30:45PM +0900, Hector Martin wrote:
> > On 16/08/2022 23.04, Will Deacon wrote:
> > >> diff --git a/include/asm-generic/bitops/atomic.h b/include/asm-generic/bitops/atomic.h
> > >> index 3096f086b5a3..71ab4ba9c25d 100644
> > >> --- a/include/asm-generic/bitops/atomic.h
> > >> +++ b/include/asm-generic/bitops/atomic.h
> > >> @@ -39,9 +39,6 @@ arch_test_and_set_bit(unsigned int nr, volatile unsigned long *p)
> > >>    unsigned long mask = BIT_MASK(nr);
> > >>
> > >>    p += BIT_WORD(nr);
> > >> -  if (READ_ONCE(*p) & mask)
> > >> -          return 1;
> > >> -
> > >>    old = arch_atomic_long_fetch_or(mask, (atomic_long_t *)p);
> > >>    return !!(old & mask);
> > >>  }
> > >> @@ -53,9 +50,6 @@ arch_test_and_clear_bit(unsigned int nr, volatile unsigned long *p)
> > >>    unsigned long mask = BIT_MASK(nr);
> > >>
> > >>    p += BIT_WORD(nr);
> > >> -  if (!(READ_ONCE(*p) & mask))
> > >> -          return 0;
> > >> -
> > >>    old = arch_atomic_long_fetch_andnot(mask, (atomic_long_t *)p);
> > >>    return !!(old & mask);
> > >
> > > I suppose one sad thing about this is that, on arm64, we could reasonably
> > > keep the READ_ONCE() path with a DMB LD (R->RW) barrier before the return
> > > but I don't think we can express that in the Linux memory model so we
> > > end up in RmW territory every time.
> >
> > You'd need a barrier *before* the READ_ONCE(), since what we're trying
> > to prevent is a consumer from writing to the value without being able to
> > observe the writes that happened prior, while this side read the old
> > value. A barrier after the READ_ONCE() doesn't do anything, as that read
> > is the last memory operation in this thread (of the problematic sequence).
>
> Right, having gone back to your litmus test, I now realise it's the "SB"
> shape from the memory ordering terminology. It's funny because the arm64
> acquire/release instructions are RCsc and so upgrading the READ_ONCE()
> to an *arm64* acquire instruction would work for your specific case, but
> only because the preceeding store is a release.
>
> > At that point, I'm not sure DMB LD / early read / LSE atomic would be
> > any faster than just always doing the LSE atomic?
>
> It depends a lot on the configuration of the system and the state of the
> relevant cacheline, but generally avoiding an RmW by introducing a barrier
> is likely to be a win. It just gets ugly here as we'd want to avoid the
> DMB in the case where we end up doing the RmW. Possibly we could do
> something funky like a test-and-test-and-test-and-set (!) where we do
> the DMB+READ_ONCE() only if the first READ_ONCE() has the bit set, but
> even just typing that is horrible and I'd _absolutely_ want to see perf
> numbers to show that it's a benefit once you start taking into account
> things like branch prediction.
>
> Anywho, since Linus has applied the patch and it should work, this is
> just an interesting aside.
>
> Will
>

It is moot if Linus has already taken the patch, but with a stock
kernel config I am
still seeing a slight performance dip but only ~1-2% in the specific
tests I was running.
Sorry about the noise I will need to look at my kernel builder and see what went
wrong when I have more time.

Cheers,
Jon
