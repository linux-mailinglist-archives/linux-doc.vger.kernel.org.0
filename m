Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7B938D7D1
	for <lists+linux-doc@lfdr.de>; Sun, 23 May 2021 01:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhEVXk7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 22 May 2021 19:40:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:58708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231446AbhEVXk7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 22 May 2021 19:40:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1C636121F
        for <linux-doc@vger.kernel.org>; Sat, 22 May 2021 23:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621726773;
        bh=zDjcQM82T3zWBFosGa25gfnhyhFFiGZ7lvxtB2YXTlI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=B+TwDyrWGdAjEvCjjmZ1r2ApPYlRVCsMUQTzIrMnFG9NNW22o0HCcvbabvN9ZmwzI
         hJpNC7YT1zc+wJP7BEcfl9DpfT9sWrDhD9IMV/uqVnhfK6UtolN4p/KsH8UnLRzf4R
         8UrPti9HeYVeCFyXy8R7zrdLHuLp+1QNyKhU5fAtnD2Hy3trJIrxMSVkrTmofmZvFw
         cDdaLbPINEZ9qn0UQ0JyIphclHsqWkFK1v1KEoofR82jPoEvUA1G2HTg7xclExac6s
         xO+nceMPqnnXVXFFJYS7NI/qVyDOZ2kLadnfxKyM+bjxSVw7pqeX0axB4/wveF1Wnm
         DEnmPwPWrL3Tg==
Received: by mail-ej1-f48.google.com with SMTP id gb17so17965807ejc.8
        for <linux-doc@vger.kernel.org>; Sat, 22 May 2021 16:39:32 -0700 (PDT)
X-Gm-Message-State: AOAM533gpxgYVfnANCRpLwkEOYLPUStkpE0IN2Xy2Dht2/BwPRlWCOAf
        wRd96CaGi/TjnBNbz7cwrYXkvZ/60hA52EL2eGwdgw==
X-Google-Smtp-Source: ABdhPJwAVu0oyGtUpR1c3WqPW+v7885e6HHBhZnVMCDtrkGrfBYPAbfHVT6rxsNYk/ProlHmSNOEIVRIb18Me5LG1jA=
X-Received: by 2002:a17:906:458:: with SMTP id e24mr17084955eja.199.1621726771411;
 Sat, 22 May 2021 16:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210521221211.29077-1-yu-cheng.yu@intel.com> <20210521221211.29077-25-yu-cheng.yu@intel.com>
In-Reply-To: <20210521221211.29077-25-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Sat, 22 May 2021 16:39:19 -0700
X-Gmail-Original-Message-ID: <CALCETrVQ70VvZPf_tH5KOspYx6KwDg07dodzobBSABxMyc1xJw@mail.gmail.com>
Message-ID: <CALCETrVQ70VvZPf_tH5KOspYx6KwDg07dodzobBSABxMyc1xJw@mail.gmail.com>
Subject: Re: [PATCH v27 24/31] x86/cet/shstk: Handle thread shadow stack
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
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
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 21, 2021 at 3:14 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
> index 5ea2b494e9f9..8e5f772181b9 100644
> --- a/arch/x86/kernel/shstk.c
> +++ b/arch/x86/kernel/shstk.c
> @@ -71,6 +71,53 @@ int shstk_setup(void)
>         return 0;
>  }
>
> +int shstk_alloc_thread_stack(struct task_struct *tsk, unsigned long clone_flags,
> +                            unsigned long stack_size)
> +{

...

> +       state = get_xsave_addr(&tsk->thread.fpu.state.xsave, XFEATURE_CET_USER);
> +       if (!state)
> +               return -EINVAL;
> +

The get_xsave_addr() API is horrible, and we already have one
egregiously buggy instance in the kernel.  Let's not add another
dubious use case.

If state == NULL, this means that CET_USER is in its init state.
CET_USER in the init state should behave identically regardless of
whether XINUSE[CET_USER] is set.  Can you please adjust this code
accordingly?

Thanks,
Andy
