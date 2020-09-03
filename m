Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89AA825C6B5
	for <lists+linux-doc@lfdr.de>; Thu,  3 Sep 2020 18:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgICQ0L (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 3 Sep 2020 12:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728397AbgICQ0G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Sep 2020 12:26:06 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADCEC061246
        for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2020 09:26:05 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id m6so3939572wrn.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Sep 2020 09:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SX2M8ZjNOBomakJPHx/eAoRjiYE0E7vCrIP8X7wqwrE=;
        b=oDD0Gux34thJnmZ1p9GU8/6kkTWx5e4QqShXwMd2NzdUka1D68oV585mq/L3jRJuu0
         w0CSzkCCoemSUbbJ8xwFmr5CuDop+bx66FGABsb7OMciJYlYF598/kVCyzUOgEKZ6zl1
         dJhzpIT78obpMOtyOQjJjAaeqiAJQhE1/6HIKz05PonttlZTZ2femjibqz5sE61+jsRU
         I3UGgJtnMU/bozY9Bs4Qa/anS5uwD/JAZSk1k65nv9i0c1yBndXHbXDLXLR2zmwsvmp8
         C9np4SMmG6PqdfSrCNaiH9JEU2oOeHPRfT0tNA1yVhssHn+9/w/tSyzAnqTgqKR+Lf01
         Zyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SX2M8ZjNOBomakJPHx/eAoRjiYE0E7vCrIP8X7wqwrE=;
        b=h4cfb/Ed1xHgrbjV2s8pCA0E9qyCPJ+MLJ6e1oNa7u8MuwIA4OGCCC/Ql5aqPJ8o97
         xzhxiWsT43T+vCOI/XSD15nbE4Q9JZyGbAOtvuagdg54uaw3xa3eLalRATi818Y1ZGBA
         KLkwNkjPMGXFMwAeJ8yml1GSYpiWcVfjekyrmybZZ2Tm+LgsblrqoC9+3OJHP/w61kcZ
         08Qgu59NPDN+WVxoaQVmvS/X0C5uCyRzP1MtKvejGbNS5WrZTBvn2pux4eQfasABx4fw
         UbtF+v252OYz+t/oCgN6qonFo+e/DV4iIq9rwnn4I34lbcv2u619Dw1jQX5WOozP23YR
         Kk+A==
X-Gm-Message-State: AOAM530X/VeRsOWaRkRXaXH/p26ozHO5NYc+i0sRDOLxnNMRw2V+i3ED
        EKo8hslpxamw8Ar1AMxUv6i+HqW4inyhbsvQY+dgwA==
X-Google-Smtp-Source: ABdhPJxcnMUlkP3dZ2TKybhF8a+O8Sm1srU3BtKK/jrCHsVYh3QnJ0h434G4rO8gv9hbnVUhv5ZzuuQkLwxiCBqscSc=
X-Received: by 2002:a5d:6a47:: with SMTP id t7mr3256984wrw.75.1599150364012;
 Thu, 03 Sep 2020 09:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <46e42e5e-0bca-5f3f-efc9-5ab15827cc0b@intel.com>
 <40BC093A-F430-4DCC-8DC0-2BA90A6FC3FA@amacapital.net> <b3809dd7-8566-0517-2389-8089475135b7@intel.com>
 <88261152-2de1-fe8d-7ab0-acb108e97e04@intel.com> <1b51d89c-c7de-2032-df23-e138d1369ffa@intel.com>
 <3967f126-f7ea-36fd-bec0-dfbbc46ef221@intel.com>
In-Reply-To: <3967f126-f7ea-36fd-bec0-dfbbc46ef221@intel.com>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Thu, 3 Sep 2020 09:25:51 -0700
Message-ID: <CALCETrXnzOwLSHWOtKTLuybCTZ=w+cBVMhs2uCzd+LSdbijQ3g@mail.gmail.com>
Subject: Re: [PATCH v11 6/9] x86/cet: Add PTRACE interface for CET
To:     "Yu, Yu-cheng" <yu-cheng.yu@intel.com>
Cc:     Dave Hansen <dave.hansen@intel.com>, Jann Horn <jannh@google.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 3, 2020 at 9:21 AM Yu, Yu-cheng <yu-cheng.yu@intel.com> wrote:
>
> On 9/3/2020 9:11 AM, Dave Hansen wrote:
> > On 9/3/20 9:09 AM, Yu, Yu-cheng wrote:
> >> If the debugger is going to write an MSR, only in the third case would
> >> this make a slight sense.  For example, if the system has CET enabled,
> >> but the task does not have CET enabled, and GDB is writing to a CET MSR.
> >>   But still, this is strange to me.
> >
> > If this is strange, then why do we even _implement_ writes?
> >
>
> For example, if the task has CET enabled, and it is in a control
> protection fault, the debugger can clear the task's IBT state, or unwind
> the shadow stack, etc.  But if the task does not have CET enabled (its
> CET MSRs are in INIT state), it would make sense for the PTRACE call to
> return failure than doing something else, right?

What do you mean "something else"?  I assume that, if GDB tells
ptrace() to write some value to the CET MSR, then it should get that
value.  If GDB writes to it on a task that is not currently using CET,
I don't see why it should fail.

--Andy
