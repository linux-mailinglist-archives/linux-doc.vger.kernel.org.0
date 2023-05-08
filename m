Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7440C6F9E90
	for <lists+linux-doc@lfdr.de>; Mon,  8 May 2023 06:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbjEHEIp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 8 May 2023 00:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjEHEIo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 May 2023 00:08:44 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E501F6EB5;
        Sun,  7 May 2023 21:08:42 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50be0d835aaso7406430a12.3;
        Sun, 07 May 2023 21:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683518921; x=1686110921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=418lmDvsSwaR5hPOcnBAQZAbghEwqMzFRELtnuxfpVc=;
        b=WM48MUrgQ8nDrO/xcJbziZYeEJIYKJ+lsqBG5g5X/M3QfyNsy8Zp0JnPxtCfngt9o4
         mUXFB3keoT+bry4xcLN3YHZFV1qbfuK7R1SvymDYF6QNCR+ojbXKkQ1jq08YPmVpOkk9
         7Nx5DtP3rWm1T0hpcw/e6M2A3squvqmwdDE51oDaXeXJWSZJCEMoFNIKU8Fkhw7uIUBk
         3a+2cnpSTeuTw7HNLm3OEoYauDKYWea3CxCQecN9No7QPJgUnT51B2yO0RunQEAfnKlx
         PDMAhI1h1pBIUYRStRuC99P7bfCzoeCspk6mZ0UZXl2/XPWadRpEThfj6GQs/83QMpIa
         F4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683518921; x=1686110921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=418lmDvsSwaR5hPOcnBAQZAbghEwqMzFRELtnuxfpVc=;
        b=Svw9l9fN9G25HkTmy70H45i5COdSuMG/pUTPfIUlUWE+zlxqKoJ/H20R33PvFCr2Ue
         oQnfRKGrvQYJK8KnSzgJkkg9rJpBu7ueqYJi01ZvX8SulT2kDKVeYwQy1vOobYR0PajN
         +XbILV4CbGCEnJkOhzHBRuMbUgOGNXkyVtM6MNXQ8aeQ0aebU1FF2af74ex+I8cNPp4x
         dC2a0XkgvRvu5e1OZl0LEHVLpRXCUHAR4CYBiQUvuBIv7ZDZxdWQoY8Q7SoGqrBLBuHD
         RYXtDGcKfZDqJfogUe15PfkAlxr3lEf1XVTA6BzRylkJ2axJ5UAUvMHGNbdc8yYqcF7P
         1ivQ==
X-Gm-Message-State: AC+VfDwKRTPtkCIAYGJ2eVoCku3YSrYSNJg9qHyXmPIv6+HUvNoe8qT8
        MUrWVMCkt71CdhTkck4NQhv6tICaRSfKM7AblAE=
X-Google-Smtp-Source: ACHHUZ4IPERXtNJef1vvKhMOH/D3B+M3LH79PgUudG1dBoi9d1doeo709yH83md5swCmQ/LygaVdGk3TZgPTcg9HZhk=
X-Received: by 2002:aa7:ca57:0:b0:50c:1e2:4a42 with SMTP id
 j23-20020aa7ca57000000b0050c01e24a42mr7368607edt.15.1683518921019; Sun, 07
 May 2023 21:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230505113315.3307723-1-liujian56@huawei.com> <20230505113315.3307723-3-liujian56@huawei.com>
In-Reply-To: <20230505113315.3307723-3-liujian56@huawei.com>
From:   Jason Xing <kerneljasonxing@gmail.com>
Date:   Mon, 8 May 2023 12:08:04 +0800
Message-ID: <CAL+tcoDY11sSO8_h1DKCWgAXOjQwM1JR5cx7cpmotWVj28m_fg@mail.gmail.com>
Subject: Re: [PATCH 2/9] softirq: Use sched_clock() based timeout
To:     Liu Jian <liujian56@huawei.com>
Cc:     corbet@lwn.net, paulmck@kernel.org, frederic@kernel.org,
        quic_neeraju@quicinc.com, joel@joelfernandes.org,
        josh@joshtriplett.org, boqun.feng@gmail.com, rostedt@goodmis.org,
        mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
        qiang1.zhang@intel.com, jstultz@google.com, tglx@linutronix.de,
        sboyd@kernel.org, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, peterz@infradead.org,
        frankwoo@google.com, Rhinewuwu@google.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rcu@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 5, 2023 at 7:25=E2=80=AFPM Liu Jian <liujian56@huawei.com> wrot=
e:
>
> From: Peter Zijlstra <peterz@infradead.org>
>
> Replace the jiffies based timeout with a sched_clock() based one.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Liu Jian <liujian56@huawei.com>
> ---
>  kernel/softirq.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/softirq.c b/kernel/softirq.c
> index bff5debf6ce6..59f16a9af5d1 100644
> --- a/kernel/softirq.c
> +++ b/kernel/softirq.c
> @@ -27,6 +27,7 @@
>  #include <linux/tick.h>
>  #include <linux/irq.h>
>  #include <linux/wait_bit.h>
> +#include <linux/sched/clock.h>
>
>  #include <asm/softirq_stack.h>
>
> @@ -489,7 +490,7 @@ asmlinkage __visible void do_softirq(void)
>   * we want to handle softirqs as soon as possible, but they
>   * should not be able to lock up the box.
>   */
> -#define MAX_SOFTIRQ_TIME  msecs_to_jiffies(2)
> +#define MAX_SOFTIRQ_TIME       (2 * NSEC_PER_MSEC)

I wonder if it affects those servers that set HZ to some different
values rather than 1000 as default.

Thanks,
Jason

>  #define MAX_SOFTIRQ_RESTART 10
>
>  #ifdef CONFIG_TRACE_IRQFLAGS
> @@ -527,9 +528,9 @@ static inline void lockdep_softirq_end(bool in_hardir=
q) { }
>
>  asmlinkage __visible void __softirq_entry __do_softirq(void)
>  {
> -       unsigned long end =3D jiffies + MAX_SOFTIRQ_TIME;
>         unsigned long old_flags =3D current->flags;
>         int max_restart =3D MAX_SOFTIRQ_RESTART;
> +       u64 start =3D sched_clock();
>         struct softirq_action *h;
>         unsigned long pending;
>         unsigned int vec_nr;
> @@ -584,7 +585,7 @@ asmlinkage __visible void __softirq_entry __do_softir=
q(void)
>
>         pending =3D local_softirq_pending();
>         if (pending) {
> -               if (time_before(jiffies, end) && !need_resched() &&
> +               if (sched_clock() - start < MAX_SOFTIRQ_TIME && !need_res=
ched() &&
>                     --max_restart)
>                         goto restart;
>
> --
> 2.34.1
>
>
