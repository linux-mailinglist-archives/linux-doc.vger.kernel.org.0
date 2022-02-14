Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0F594B5042
	for <lists+linux-doc@lfdr.de>; Mon, 14 Feb 2022 13:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbiBNMec (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Feb 2022 07:34:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353219AbiBNMe3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Feb 2022 07:34:29 -0500
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7CDB4A3CF
        for <linux-doc@vger.kernel.org>; Mon, 14 Feb 2022 04:34:20 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id w18so8031806uar.8
        for <linux-doc@vger.kernel.org>; Mon, 14 Feb 2022 04:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u0lz2sBFTROYxYJ6eqMOWGm9UTJfyP61FYvgdnhkZ3I=;
        b=nEe1l0hdXdSreWxGfYzOMAroXlhk6U0l82gHW3dPxeIq953C7Lp9jjLb2STTA6q91/
         3YQY4ptFY0W/xrLk7ftcOUEfF8rFpzdTQ8h3MQihF6t8uu5sJA7kA1+NwxRI5NEil3eQ
         Q7L5s5C16Ueci5KvTW8ZsSue/4M0Ez7bYUWbG/hnIbzmAHff0KFw2BjGyAJC7HyX2QIL
         VzfwopRLUvXhkwlC+oRzZ0vFHluU4tQarVn4+Mo337qqWn6gqsW6rvbqcvcEqOiJdybU
         a3MOgBj/AErLTKkCLaXkn/1IwVHXsI8YeZ05g/IrjegWXqgmhrCOjV+OkAiiHMSohxO7
         qMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u0lz2sBFTROYxYJ6eqMOWGm9UTJfyP61FYvgdnhkZ3I=;
        b=aBq91Ou2llGp8KCWsc1fOOCSfzMSS0L8brjErlUZanePXgGi/DXetLK9+36iB6bDuk
         AXk8tkm0ZowBq9NSHB7oKFFh1Vf9N5gIhs5uJRsKpdoexbGOH5G+WblCOq4eBSl1sBmV
         exQMLUD06XphO350SS29lG0XeP68e1NKx3eKUzluOcR5TLEFKX/apSuxX6AY2INfSuY7
         bPbXe59YHtHGhT5xXdgdnBRbiPe0aoZwrkx9Cq+0vsXnGClQhMQZjIrP3WVDevh/RKbS
         OjuWJ7IcTgdawrHEPtN+GfkSHRyRkVHORC9H2wrypQSkebYVGx7S/tZS5H4mqIeBF0bu
         l+bA==
X-Gm-Message-State: AOAM531q6xWhS8OF7JpYKLX3Jt1HTByPXG09iq42jQ/DGrl694rq4apj
        mMVI4EUZ4nxRDSFkA9hh6u0LWnyZ3inRdU/J92vSdA==
X-Google-Smtp-Source: ABdhPJynVqzw7a/FIDfNQ5KPM6nTyitNKm9fkVk2JtHfS8Fd+I3LpTUBteooPVT+TNL1/84Wz6nqn9c+aHocTnLplII=
X-Received: by 2002:ab0:6cb7:: with SMTP id j23mr3707418uaa.36.1644842059506;
 Mon, 14 Feb 2022 04:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20220130211838.8382-1-rick.p.edgecombe@intel.com> <20220130211838.8382-27-rick.p.edgecombe@intel.com>
In-Reply-To: <20220130211838.8382-27-rick.p.edgecombe@intel.com>
From:   Jann Horn <jannh@google.com>
Date:   Mon, 14 Feb 2022 13:33:53 +0100
Message-ID: <CAG48ez0_Ng8Fv4ytLK=Y5ANXiDfBPsFFwfxQTzgmDjU1RNFnDw@mail.gmail.com>
Subject: Re: [PATCH 26/35] x86/process: Change copy_thread() argument 'arg' to 'stack_size'
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc:     x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H . J . Lu" <hjl.tools@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V . Shankar" <ravi.v.shankar@intel.com>,
        Dave Martin <dave.martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        joao.moreira@intel.com, John Allen <john.allen@amd.com>,
        kcc@google.com, eranian@google.com,
        Yu-cheng Yu <yu-cheng.yu@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jan 30, 2022 at 10:22 PM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
>
> The single call site of copy_thread() passes stack size in 'arg'.  To make
> this clear and in preparation of using this argument for shadow stack
> allocation, change 'arg' to 'stack_size'.  No functional changes.

Actually that name is misleading - the single caller copy_process() indeed does:

retval = copy_thread(clone_flags, args->stack, args->stack_size, p, args->tls);

but the member "stack_size" of "struct kernel_clone_args" can actually
also be a pointer argument given to a kthread, see create_io_thread()
and kernel_thread():

pid_t kernel_thread(int (*fn)(void *), void *arg, unsigned long flags)
{
  struct kernel_clone_args args = {
    .flags    = ((lower_32_bits(flags) | CLONE_VM |
            CLONE_UNTRACED) & ~CSIGNAL),
    .exit_signal  = (lower_32_bits(flags) & CSIGNAL),
    .stack    = (unsigned long)fn,
    .stack_size  = (unsigned long)arg,
  };

  return kernel_clone(&args);
}

And then in copy_thread(), we have:

kthread_frame_init(frame, sp, arg)


So I'm not sure whether this name change really makes sense, or
whether it just adds to the confusion.
