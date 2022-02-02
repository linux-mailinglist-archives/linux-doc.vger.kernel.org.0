Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBC4F4A7B80
	for <lists+linux-doc@lfdr.de>; Thu,  3 Feb 2022 00:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348022AbiBBXIQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Feb 2022 18:08:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242737AbiBBXIP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Feb 2022 18:08:15 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89BF5C06173B
        for <linux-doc@vger.kernel.org>; Wed,  2 Feb 2022 15:08:15 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id f10so2128557lfu.8
        for <linux-doc@vger.kernel.org>; Wed, 02 Feb 2022 15:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jBBnG4iriAx2QlzLYuicKwqWN3IoZcmUHa4D8MHxWsw=;
        b=YdPUEHhlnJ0w/JeFN+OZ/SYhMOlNUiH9Ng0LqezBtX+z0wsAuTuq6YiuXY/hol7pYw
         uXZkdIaGJ8RQXEqSmlZHe9QBfpsoNzIVqK0nuxFohHsknWXkgarRvRaPy8TunLbJ+jjd
         XqRPTafPGjWAlQTTqWgmsVJeTisraDBDhu+RVI8fNc0halAkc5O3QxVM0o83DqzumI/g
         oshtN0JCe2UrWAV7EoR73fF/Wv1u+BBKKy+ONF1kFZbYtCjED4DdrAE5bke+Oz/O92Ux
         n2Z6u2BvkymqYkcDtbm/awpcxUfHNKAo0bpkcro3lj6oLG7OYOgIUeG/Fs4x7L0t8rVS
         QxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jBBnG4iriAx2QlzLYuicKwqWN3IoZcmUHa4D8MHxWsw=;
        b=UGK5uZiY5LhVIjVAKwaKGJOeVDzrHZGdYBugzGJ0SlGo9Mi+qoDwYQTx8TvhUN01lA
         p0JkfZdlUJeAC3YkSx1QyK7LxuqAfL/ZtxcyfRM4OQ0w5qNS3/tlxCEsEnEjU/9ico2U
         18fZkQ0NFlwzLnQg3I3qgWZ6mLV7Hkhk38WeWCRBFi8oVnzc+GGbX1bVpgopqO4RFQ86
         wuBfowav7YUO8+uDMROBsUa9uonsn8BmUoCQC6ZKoaVsv9C4qUGzzxH+qsgUy5n0S4xM
         wl7JRj02QlMopBYnWMp+7hdw81cIKd+bgYPoNQa/KV7X8Mu6faV2DYFGfMeUHkbSSD8m
         RZCg==
X-Gm-Message-State: AOAM530bC5Sdq1+pQ9bWslpmoKYD3KIX6HZFgWB7eXsz4G0VDobwnv+B
        lUAbvluXtvDBQNSPVCe9cCylWZkIqIffXANqLh35tEn5KoFa1Q==
X-Google-Smtp-Source: ABdhPJwNhFCg09jLnWAO/xZyK74NzRqq4QPChtE2uoqCveVvP+dq76KVPeCpKxsOM/QKWb03FPmrFGJV6LfsQmnhw8w=
X-Received: by 2002:ac2:4e10:: with SMTP id e16mr25504054lfr.444.1643843293594;
 Wed, 02 Feb 2022 15:08:13 -0800 (PST)
MIME-Version: 1.0
References: <20220131204357.1133674-1-keescook@chromium.org>
 <6641e01b86374ce197020d57c65ae3b3@AcuMS.aculab.com> <CANiq72neVsdLRyLn24avMhLCaHxMEiG0bD-ZkG46O7J29FanYA@mail.gmail.com>
 <6d75ee32e7c3415ebcfa12e61d26aa87@AcuMS.aculab.com> <CANiq72nep38_aFpUNc5C3Po_AKmuiogqvzc_pJgvixJqy9POwg@mail.gmail.com>
In-Reply-To: <CANiq72nep38_aFpUNc5C3Po_AKmuiogqvzc_pJgvixJqy9POwg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 2 Feb 2022 15:08:01 -0800
Message-ID: <CAKwvOdnWM8kw8TWKOv3uCoqroeqF2kW+TUEavFYOp5W6+ZPgew@mail.gmail.com>
Subject: Re: [PATCH] linux/const.h: Explain how __is_constexpr() works
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        David Laight <David.Laight@aculab.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Martin Uecker <Martin.Uecker@med.uni-goettingen.de>,
        Ingo Molnar <mingo@kernel.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 2, 2022 at 3:01 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Feb 2, 2022 at 11:20 PM David Laight <David.Laight@aculab.com> wrote:
> >
> > The type of the result depends on the type of the 2nd and 3rd arguments.
> > Not on the value of the first one.
>
> I am not talking about the first operand. The behavior of the
> conditional operator has a few cases. Since you mentioned promotions,
> it looked like you were thinking about what happens for the arithmetic
> types case, i.e.
>
> """If both the second and third operands have arithmetic type, the
> result type that would be determined by the usual arithmetic
> conversions, were they applied to those two operands, is the type of
> the result."""
>
> which could lead to thinking that the expressions need to have the
> same type as you mentioned, but that is not true, and the arithmetic
> types case is not used in the macro either. The cases used are the
> null pointer constant vs. pointer and the pointer to void vs. pointer
> to object type.
>
> > It has nothing to with the condition, the compiler is trying to 'sort out'
> > a suitable return type.
> >
> > I suspect the mismatched pointer types might even be a gcc extension.
>
> That is why I said it does not fit the constraints of the operator.
> The standard does not describe what happens in such a case.

Since this patch is a rephrasing of
https://stackoverflow.com/a/49481218, I think the relevant citation
from the C standard is below:

```
The key here is that the conditional operator returns a different type
depending on whether one of the operands is a null pointer constant
(6.5.15.6):

[...] if one operand is a null pointer constant, the result has the
type of the other operand; otherwise, one operand is a pointer to void
or a qualified version of void, in which case the result type is a
pointer to an appropriately qualified version of void.

So, if x was an integer constant expression, then the second operand
is a null pointer constant and therefore the type of the expression is
the type of the third operand, which is a pointer to int.
```

-- 
Thanks,
~Nick Desaulniers
