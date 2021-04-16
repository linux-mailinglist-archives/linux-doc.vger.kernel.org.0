Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9488A361E26
	for <lists+linux-doc@lfdr.de>; Fri, 16 Apr 2021 12:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241765AbhDPKm2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Apr 2021 06:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241747AbhDPKm1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 06:42:27 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1153EC061756
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 03:42:03 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id i21-20020a05600c3555b029012eae2af5d4so4303053wmq.4
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zex7i7Gm7ilDvh/qRtb14tTVDUsTiPnIyJ8lJBlTVDY=;
        b=o+NE8pGADgY4FrSGIXWUfJDlnJ1juLdQCdEiocUx/f4kBswMU6EacEfCbch4zfDr8H
         +8aCGjJXpl6SK20MOt1VpdXaX4BbkHmki5A2hh1gmZ20w2EMJP1VjnEsC8VADb9byTqY
         lE+sl5rG/g22g2pLcBDdBqPUtuuihLLbi7A6mVCOjdUC+LZqLYwD2VrW6Q33ZmABcitG
         osCWWS16aeTjD/SapJryOxU2/k5hi64Zs2KKTkPikhugxITJ9wbjvvaZwkFN1zhfoIGY
         lMbuOFwM6i8S1cr0T1JDeA7IJyAS5SdymT8sxxaVslfrawq50NfS7neQz6FJIXPKg4kh
         wuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zex7i7Gm7ilDvh/qRtb14tTVDUsTiPnIyJ8lJBlTVDY=;
        b=FS9FWDH4fXjFG/edlYIb76/Rz5yUSkbq6irB2D6VnasDCZ5iwXUmwWv9F5Yl8MwFZx
         NC2j6SUivqhueAxRi23HI6wAneDi6doOX6FDCAoi4mi00Mq4/ZzdKUs2rwkw2F7MYiCl
         LO+rnFncCLyhIZIY5Jzsh1MQckCkJDSmKQI0pRrKQra3ROa1srQzbjqA6/gOXsAZJFJo
         /VjovvTHtF1Ia7RL1DSMws2poEPxRVxeqQ6ZGLJBCFsnya5J3Y9hzLPAIyobnKQfC3iI
         LAfJ2SQ3EVAnU4nJaQVPZo7AIeHlkDlqd8Qf6svV+iYN9N30pOE8kW+Pjk6x/IR2lSB9
         8q1w==
X-Gm-Message-State: AOAM533fNtljidQgMzZZfRVZDDHkl7wLYAWEvcLd67SmhHKGsuseesCU
        WKlyZ6353+OfTRp3gexAXOvykmRIGxeNRAeUg0pbzA==
X-Google-Smtp-Source: ABdhPJzSZVwXQXIP/gEzyKiBpeLInXpc+75cZ3dvpf3JNqEHMcXwCYZIJpV2ZQZVzZT+LiXa+F2urN3JdQz1K4fuTB0=
X-Received: by 2002:a7b:c348:: with SMTP id l8mr7746989wmj.152.1618569721686;
 Fri, 16 Apr 2021 03:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210415110426.2238-1-alex@ghiti.fr>
In-Reply-To: <20210415110426.2238-1-alex@ghiti.fr>
From:   Anup Patel <anup@brainfault.org>
Date:   Fri, 16 Apr 2021 16:11:50 +0530
Message-ID: <CAAhSdy2pD2q99-g3QSSHbpqw1ZD402fStFmbKNFzht2m=MS8mQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Protect kernel linear mapping only if
 CONFIG_STRICT_KERNEL_RWX is set
To:     Alexandre Ghiti <alex@ghiti.fr>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>, linux-doc@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        kasan-dev@googlegroups.com,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 15, 2021 at 4:34 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> If CONFIG_STRICT_KERNEL_RWX is not set, we cannot set different permissions
> to the kernel data and text sections, so make sure it is defined before
> trying to protect the kernel linear mapping.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Maybe you should add "Fixes:" tag in commit tag ?

Otherwise it looks good.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/setup.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 626003bb5fca..ab394d173cd4 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -264,12 +264,12 @@ void __init setup_arch(char **cmdline_p)
>
>         sbi_init();
>
> -       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
>                 protect_kernel_text_data();
> -
> -#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
> -       protect_kernel_linear_mapping_text_rodata();
> +#ifdef CONFIG_64BIT
> +               protect_kernel_linear_mapping_text_rodata();
>  #endif
> +       }
>
>  #ifdef CONFIG_SWIOTLB
>         swiotlb_init(1);
> --
> 2.20.1
>
