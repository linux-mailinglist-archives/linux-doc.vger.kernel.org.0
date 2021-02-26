Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BA2325D3E
	for <lists+linux-doc@lfdr.de>; Fri, 26 Feb 2021 06:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhBZFf1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Feb 2021 00:35:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhBZFfZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Feb 2021 00:35:25 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC19C06174A
        for <linux-doc@vger.kernel.org>; Thu, 25 Feb 2021 21:34:45 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id f8so4707297plg.5
        for <linux-doc@vger.kernel.org>; Thu, 25 Feb 2021 21:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=E/72ukQbxYFbVDYN4+VjF6J8sjswQu6JBy9Ss0as/qU=;
        b=vhgwHnFNT/68Ayu7hro0UxDnpQReFVDyOPHPkE0/XUKxwK8kZmaS8R7kq78Q0Us743
         SGyU1Ac82gfd9zr8RCIdEyGBwS8c3kH02NmTGHzjn5GDNSilpugoe7ewdOfrVZYp3f5o
         KCrdW3pjxtOhhuf0z8v9/TPAHxjTxrjwpNfLKxVt23zoDOYQmQYzPke+//rhUDzRBwRe
         IcG6lgAJBcZ+jlCmERdKj0dUfL/aSHZbET2IsyHTFFBYbWsztxywU5PIj9jPqxRmStMe
         wL/0YzryIUBLtuWKpuvp9HlAybL+dAc49h8aLMdSl8ki/dfYVqmmxrGmG6pCfCOJaCNv
         EXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=E/72ukQbxYFbVDYN4+VjF6J8sjswQu6JBy9Ss0as/qU=;
        b=bb0hC5z50PneMN4eegNKXSPetfRxc4UtX0W+gOJxE1Jy6LbRy2Qo5GUcQIYkAmw69k
         9TEXcJauTQ9EQDKjiGfpnH61nhi1Qjr6bpHY0/jUNr52BHJdw/Ulj9vWYm4XT91rr1O2
         7zsQs5qbaY+Wbp9nLBMK6PRpeSMbR3PbYiP6SMRgb4xPk3d5RYPd+XOs8hInY8V+Zib0
         4b15EpiRE5tIOODom3IaVkS3P93/nQDW7rb5H53aKrVnY9ofyS4f9jI8hkAqhacpxEN5
         AyYYWaBklqsEG/b6RtKyI+K9og9roKCK79/9In1bpm1BKLa2HEp/im+hsuaQMwKZO6RF
         STKQ==
X-Gm-Message-State: AOAM530P6vMsN0XoEmdrJtLyhZKUm80nxNBFWaWwVVHSX4x9XzAQk6WS
        st1ogTLuSqojLDBZhSuzPiClKA==
X-Google-Smtp-Source: ABdhPJzW1IJ4S3iG3hcraE3lyy9TjHQW8d0WKS43o1bxGTLqIkJbTOvVQByksy5Oj08iXyZRZy7qjg==
X-Received: by 2002:a17:903:2491:b029:e4:16d6:e0a4 with SMTP id p17-20020a1709032491b02900e416d6e0a4mr1704912plw.64.1614317684998;
        Thu, 25 Feb 2021 21:34:44 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id h3sm7631695pgm.67.2021.02.25.21.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 21:34:44 -0800 (PST)
Date:   Thu, 25 Feb 2021 21:34:44 -0800 (PST)
X-Google-Original-Date: Thu, 25 Feb 2021 21:34:10 PST (-0800)
Subject:     Re: [PATCH 2/2] Documentation: features: refresh feature list
In-Reply-To: <20210225142841.3385428-2-arnd@kernel.org>
CC:     corbet@lwn.net, Arnd Bergmann <arnd@arndb.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, guoren@kernel.org,
        tsbogend@alpha.franken.de, tangyouling@loongson.cn,
        suxingxing@loongson.cn, ralf@linux-mips.org,
        david.daney@cavium.com, yangtiezhu@loongson.cn, ayan@wavecomp.com,
        penberg@kernel.org, mhiramat@kernel.org, me@packi.ch,
        zong.li@sifive.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-csky@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     arnd@kernel.org
Message-ID: <mhng-dba4c3e2-9d1f-4e1d-8b9a-f19eb9bf519a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 25 Feb 2021 06:27:18 PST (-0800), arnd@kernel.org wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Run the update script to document the recent feature additions
> on riscv, mips and csky.
>
> Fixes: c109f42450ec ("csky: Add kmemleak support")
> Fixes: 8b3165e54566 ("MIPS: Enable GCOV")
> Fixes: 1ddc96bd42da ("MIPS: kernel: Support extracting off-line stack traces from user-space with perf")
> Fixes: 74784081aac8 ("riscv: Add uprobes supported")
> Fixes: 829adda597fe ("riscv: Add KPROBES_ON_FTRACE supported")
> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
> Fixes: dcdc7a53a890 ("RISC-V: Implement ptrace regs and stack API")

For the RISC-V stuff

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  Documentation/features/debug/gcov-profile-all/arch-support.txt  | 2 +-
>  Documentation/features/debug/kmemleak/arch-support.txt          | 2 +-
>  Documentation/features/debug/kprobes-on-ftrace/arch-support.txt | 2 +-
>  Documentation/features/debug/kprobes/arch-support.txt           | 2 +-
>  Documentation/features/debug/kretprobes/arch-support.txt        | 2 +-
>  Documentation/features/debug/uprobes/arch-support.txt           | 2 +-
>  Documentation/features/perf/kprobes-event/arch-support.txt      | 2 +-
>  Documentation/features/perf/perf-regs/arch-support.txt          | 2 +-
>  Documentation/features/perf/perf-stackdump/arch-support.txt     | 2 +-
>  Documentation/features/sched/numa-balancing/arch-support.txt    | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/features/debug/gcov-profile-all/arch-support.txt b/Documentation/features/debug/gcov-profile-all/arch-support.txt
> index 416c70345946..b39c1a5de3f3 100644
> --- a/Documentation/features/debug/gcov-profile-all/arch-support.txt
> +++ b/Documentation/features/debug/gcov-profile-all/arch-support.txt
> @@ -16,7 +16,7 @@
>      |        ia64: | TODO |
>      |        m68k: | TODO |
>      |  microblaze: |  ok  |
> -    |        mips: | TODO |
> +    |        mips: |  ok  |
>      |       nds32: | TODO |
>      |       nios2: | TODO |
>      |    openrisc: | TODO |
> diff --git a/Documentation/features/debug/kmemleak/arch-support.txt b/Documentation/features/debug/kmemleak/arch-support.txt
> index 915185634611..e9ac415f8aec 100644
> --- a/Documentation/features/debug/kmemleak/arch-support.txt
> +++ b/Documentation/features/debug/kmemleak/arch-support.txt
> @@ -10,7 +10,7 @@
>      |         arc: |  ok  |
>      |         arm: |  ok  |
>      |       arm64: |  ok  |
> -    |        csky: | TODO |
> +    |        csky: |  ok  |
>      |       h8300: | TODO |
>      |     hexagon: | TODO |
>      |        ia64: | TODO |
> diff --git a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> index aade7816cb87..96156e8802a7 100644
> --- a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> +++ b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: | TODO |
>      |       sparc: | TODO |
> diff --git a/Documentation/features/debug/kprobes/arch-support.txt b/Documentation/features/debug/kprobes/arch-support.txt
> index 4b663c124d1c..ee95ed61909a 100644
> --- a/Documentation/features/debug/kprobes/arch-support.txt
> +++ b/Documentation/features/debug/kprobes/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ok  |
>      |       sparc: |  ok  |
> diff --git a/Documentation/features/debug/kretprobes/arch-support.txt b/Documentation/features/debug/kretprobes/arch-support.txt
> index 5449bb808442..612cb97d47b8 100644
> --- a/Documentation/features/debug/kretprobes/arch-support.txt
> +++ b/Documentation/features/debug/kretprobes/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ok  |
>      |       sparc: |  ok  |
> diff --git a/Documentation/features/debug/uprobes/arch-support.txt b/Documentation/features/debug/uprobes/arch-support.txt
> index 2820177787e1..8bd5548a4485 100644
> --- a/Documentation/features/debug/uprobes/arch-support.txt
> +++ b/Documentation/features/debug/uprobes/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: | TODO |
>      |       sparc: |  ok  |
> diff --git a/Documentation/features/perf/kprobes-event/arch-support.txt b/Documentation/features/perf/kprobes-event/arch-support.txt
> index 75739a0007e0..78f3fe080f0e 100644
> --- a/Documentation/features/perf/kprobes-event/arch-support.txt
> +++ b/Documentation/features/perf/kprobes-event/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: | TODO |
>      |      parisc: |  ok  |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ok  |
>      |       sparc: |  ok  |
> diff --git a/Documentation/features/perf/perf-regs/arch-support.txt b/Documentation/features/perf/perf-regs/arch-support.txt
> index ea8b6d96633a..5bf3b1854a1f 100644
> --- a/Documentation/features/perf/perf-regs/arch-support.txt
> +++ b/Documentation/features/perf/perf-regs/arch-support.txt
> @@ -16,7 +16,7 @@
>      |        ia64: | TODO |
>      |        m68k: | TODO |
>      |  microblaze: | TODO |
> -    |        mips: | TODO |
> +    |        mips: |  ok  |
>      |       nds32: | TODO |
>      |       nios2: | TODO |
>      |    openrisc: | TODO |
> diff --git a/Documentation/features/perf/perf-stackdump/arch-support.txt b/Documentation/features/perf/perf-stackdump/arch-support.txt
> index 87165861037e..d88659bb4fc1 100644
> --- a/Documentation/features/perf/perf-stackdump/arch-support.txt
> +++ b/Documentation/features/perf/perf-stackdump/arch-support.txt
> @@ -16,7 +16,7 @@
>      |        ia64: | TODO |
>      |        m68k: | TODO |
>      |  microblaze: | TODO |
> -    |        mips: | TODO |
> +    |        mips: |  ok  |
>      |       nds32: | TODO |
>      |       nios2: | TODO |
>      |    openrisc: | TODO |
> diff --git a/Documentation/features/sched/numa-balancing/arch-support.txt b/Documentation/features/sched/numa-balancing/arch-support.txt
> index bfcfaff67a1b..9affb7c2c500 100644
> --- a/Documentation/features/sched/numa-balancing/arch-support.txt
> +++ b/Documentation/features/sched/numa-balancing/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: |  ..  |
>      |      parisc: |  ..  |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ..  |
>      |       sparc: | TODO |
