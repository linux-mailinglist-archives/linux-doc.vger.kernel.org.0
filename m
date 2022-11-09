Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAF4662360E
	for <lists+linux-doc@lfdr.de>; Wed,  9 Nov 2022 22:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbiKIVtF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Nov 2022 16:49:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbiKIVtE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Nov 2022 16:49:04 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 756152F676
        for <linux-doc@vger.kernel.org>; Wed,  9 Nov 2022 13:49:03 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ft34so201104ejc.12
        for <linux-doc@vger.kernel.org>; Wed, 09 Nov 2022 13:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cnCKimjPnszuIv7P7tspkRhy5Ca1GNkxCTByBpzQ+sI=;
        b=DO9FR6ZD8ZIFh+aT5h4gwblO1n9ghAWy3MsuSo3TmN7NhzBNojKqBDaAOyjojPXBpb
         2apvdXr1918BW/PGEEnPwlYhi00OUDvvaN6HBtkWxJvxACQMtWImcvQB9v/0iOJ8C+xl
         tJHnnlH4FWdcXpQT3kBvkMyMvMnwsS9vhSGxa8N8daChnXdybjvYQCSwDiawdsC1TMkj
         CHU04xFNEn7j8Q9B/F07yQKjkM1nCiGvBEAoBVYVWIrikEcdXLsyMzcCEMnYcKWCtYkO
         yV4FZUnABZSnS2NkNwyo2QEUHICiCYQmL+WUQAs8EHwZRUxSg4ZHHPOeyb/Ehtc/klrr
         JI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnCKimjPnszuIv7P7tspkRhy5Ca1GNkxCTByBpzQ+sI=;
        b=oEolnxf7i5EJPBBT/i0SMNxXQrXoPmqG/uBANjwhaklrvQbhjIzkZRjyvuYPXFtzas
         aBRZpQxjSuRllHt1aRITM9bGgz+C30EkR4xBOPlu1F3QjVcLOv7a5q0ebBs5p/rhO9Z0
         n6Kqszc1pBDqEvPNNrtVfwbpLSZ3A4OtwFlKDBoziJo8LV+8VEItMW2PHaWgtP8P7/bz
         NG3EyAljdsHOxGGMYAHEagDS7VyMVEUi7NfkfAQh6CeXq9wBBymJQZZxpjqcEd5yR5Xa
         Y7DDAYv9MZwjgsjzc0GeOg8Sqioln/xb/pnPyNd6EwHZw/kFoNHguJcINgH65GHW1Teb
         rSAw==
X-Gm-Message-State: ACrzQf2BcfNfaSYQICaAYvPTGDNG+DJ9yvoOuIb+lZHmtAHzPVC2GKbf
        Q8ZGM1tGUba+y1nHSGlx10eu6ArMbw+gPtZAJGVZ
X-Google-Smtp-Source: AMsMyM4GI/CT8J2vgpNPmtw7prru+BKDWcCBKJuFSaTiFl13pqM1mmfcmz/5X1/dsZC/odHmQ3nDLRca52uPdbt1N30=
X-Received: by 2002:a17:906:c839:b0:78a:d0a4:176 with SMTP id
 dd25-20020a170906c83900b0078ad0a40176mr1831678ejb.720.1668030541823; Wed, 09
 Nov 2022 13:49:01 -0800 (PST)
MIME-Version: 1.0
References: <20221109194404.gonna.558-kees@kernel.org> <20221109200050.3400857-1-keescook@chromium.org>
In-Reply-To: <20221109200050.3400857-1-keescook@chromium.org>
From:   Bill Wendling <morbo@google.com>
Date:   Wed, 9 Nov 2022 13:48:45 -0800
Message-ID: <CAGG=3QXM3u_uz1fuW2LzvrZqqPhYL15m+LJgD39R=jkuyENmYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] panic: Separate sysctl logic from CONFIG_SMP
To:     Kees Cook <keescook@chromium.org>
Cc:     Jann Horn <jannh@google.com>, Petr Mladek <pmladek@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        tangmeng <tangmeng@uniontech.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Seth Jenkins <sethjenkins@google.com>,
        Andy Lutomirski <luto@kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>, Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        David Gow <davidgow@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Eric Biggers <ebiggers@google.com>,
        Huang Ying <ying.huang@intel.com>,
        Anton Vorontsov <anton@enomsg.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 9, 2022 at 12:01 PM Kees Cook <keescook@chromium.org> wrote:
>
> In preparation for adding more sysctls directly in kernel/panic.c, split
> CONFIG_SMP from the logic that adds sysctls.
>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: tangmeng <tangmeng@uniontech.com>
> Cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  kernel/panic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/panic.c b/kernel/panic.c
> index da323209f583..129936511380 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -75,8 +75,9 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
>
>  EXPORT_SYMBOL(panic_notifier_list);
>
> -#if defined(CONFIG_SMP) && defined(CONFIG_SYSCTL)
> +#if CONFIG_SYSCTL

Should this be "#ifdef CONFIG_SYSCTL"?

>  static struct ctl_table kern_panic_table[] = {
> +#if defined(CONFIG_SMP)

nit: This could be "#ifdef CONFIG_SMP"

>         {
>                 .procname       = "oops_all_cpu_backtrace",
>                 .data           = &sysctl_oops_all_cpu_backtrace,
> @@ -86,6 +87,7 @@ static struct ctl_table kern_panic_table[] = {
>                 .extra1         = SYSCTL_ZERO,
>                 .extra2         = SYSCTL_ONE,
>         },
> +#endif
>         { }
>  };
>
> --
> 2.34.1
>
