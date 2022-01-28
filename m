Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157BF49F8C3
	for <lists+linux-doc@lfdr.de>; Fri, 28 Jan 2022 12:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244571AbiA1LwY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 28 Jan 2022 06:52:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbiA1LwX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Jan 2022 06:52:23 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF03C061714
        for <linux-doc@vger.kernel.org>; Fri, 28 Jan 2022 03:52:23 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id x52-20020a05683040b400b0059ea92202daso5441119ott.7
        for <linux-doc@vger.kernel.org>; Fri, 28 Jan 2022 03:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O60yGiuWnnbcMYfMLAv37vqkxweJf6XzlR6Lpk0bdI0=;
        b=P6xylPxu3oTF9ElqWG2+KKyUYq5JMNnqiPQRZUeDXqQie4aQmyPakvGVQD017+Sq5j
         w8WBVC0gRu5xZKxAFyYY2+ykLjSZ+O71IYW2FlMwViM/WIiwXp03lW9R8sZe5cCUlKfy
         P8c6ut1lo3vrggu9qgXKs1LoMnKbJoy9NFW8ZJeXZvE7GKCnAU39YhigoMzswo9cVR6f
         AN7r7VuDpulWZS82z9ushmAgLKUGp/8dAFq31IbINk/a43TB8V/KRTywy/HtecTt4Qt6
         nXeKqrtg9ysDBm4AJvx3Q87lxFKbMQc4SIwbwvGxp8+ia4JOg/O1GYhE3VU8wXtXX1j4
         VPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O60yGiuWnnbcMYfMLAv37vqkxweJf6XzlR6Lpk0bdI0=;
        b=Rhby+YbhSe4XkrLznUYhUWD4GAjm4SviVnv7uPj/y9crxaH9nMwthFzpCMuuy5ZKk0
         YUGSTvA9wiyujtnHZDsEoD2cGqJtnZj3/DIvRjRV9XO9XJtBPdtaAVRP5m3cTkKHA0Yv
         IaPu55IF/08W38UZIMjGFh9GRhlMP9R0Y5rhVofP33wwqAGjqECNdvmDMoBNznqejrsM
         Fm3nZWXHrX8Ph+WmHZTHC+Nq2Ib8HR4gf2f0O6CqdcZntpxML2jiQWJylWnwYbRzSWJ2
         UmGZZZxJQHciq+NyQZXX7a0eKTHI4zp8+wEzUxjoh8XV6dg/0IzqlQ7GC0TX8xHUzY7J
         pMQQ==
X-Gm-Message-State: AOAM532wFZopfRjJM/Xbm9hG7VA+497gaxIqncggZenas0CZGkdBUDEn
        3ELaIVGkukODGEwDU2tYzs1lzEPXxGD0ZTh4j6127iTMkpg=
X-Google-Smtp-Source: ABdhPJxFKUeb+z6L0PRMViTxwQseod5Vc2HUsrALgKw44oNXB9A/OsmkbGwTROjG05J4k1ROmFYME63G71BRWJvmWSU=
X-Received: by 2002:a05:6830:25d5:: with SMTP id d21mr3350658otu.246.1643370742236;
 Fri, 28 Jan 2022 03:52:22 -0800 (PST)
MIME-Version: 1.0
References: <1643370145-26831-1-git-send-email-yangtiezhu@loongson.cn> <1643370145-26831-5-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1643370145-26831-5-git-send-email-yangtiezhu@loongson.cn>
From:   Marco Elver <elver@google.com>
Date:   Fri, 28 Jan 2022 12:52:10 +0100
Message-ID: <CANpmjNPYYAy2jy_U_c7QjTsco6f1Hk2q=HP34di4YRMgdKsa+g@mail.gmail.com>
Subject: Re: [PATCH 4/5] sched: unset panic_on_warn before calling panic()
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 28 Jan 2022 at 12:42, Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> As done in the full WARN() handler, panic_on_warn needs to be cleared
> before calling panic() to avoid recursive panics.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  kernel/sched/core.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 848eaa0..f5b0886 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5524,8 +5524,17 @@ static noinline void __schedule_bug(struct task_struct *prev)
>                 pr_err("Preemption disabled at:");
>                 print_ip_sym(KERN_ERR, preempt_disable_ip);
>         }
> -       if (panic_on_warn)
> +
> +       if (panic_on_warn) {
> +               /*
> +                * This thread may hit another WARN() in the panic path.
> +                * Resetting this prevents additional WARN() from panicking the
> +                * system on this thread.  Other threads are blocked by the
> +                * panic_mutex in panic().
> +                */
> +               panic_on_warn = 0;
>                 panic("scheduling while atomic\n");

I agree this is worth fixing.

But: Why can't the "panic_on_warn = 0" just be moved inside panic(),
instead of copy-pasting this all over the place?

I may be missing something obvious why this hasn't been done before...

Thanks,
-- Marco
