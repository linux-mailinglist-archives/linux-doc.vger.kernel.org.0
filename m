Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADD1B602B59
	for <lists+linux-doc@lfdr.de>; Tue, 18 Oct 2022 14:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbiJRMLV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Oct 2022 08:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbiJRMLP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Oct 2022 08:11:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41EE03AE42
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 05:11:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ECC75B81EBB
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 12:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C7BC433B5
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 12:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666095071;
        bh=eWdPjOGt6v3LFbGnjlcR8DIptDKq22zly1W7eS556cc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VQ7G9P3KBKFLfYoLPZvJPZ+W6UzVyIlslNOK0+e4zPQRjtEL6tqX2aAKb+LphghsE
         JlrIUSrSTyLsTI7CaLPX1v3nHhmnHEVdbzAYahYBHuYbWQuoNQrV4cweFXrUFVFW1I
         Fc/w2T/cSqLr7xn2QzSSrpzR3PzkBFzTz0HWvK+IxY561vN3tCrqrv2CexYEpOeIiK
         lQU3lNA5fj75yBYiYpUq5cQoSVAuevQP3CjyKeCIi71d5ewlib+VjjEl2xP5hd7dpy
         jvhiAaOhmZwa2stWNHU2w27feYQ5mzOhAbbqlEN9rI+bKdf1TKZrR5uohXJK0p6b6D
         RfRmvZj/kigTw==
Received: by mail-ed1-f43.google.com with SMTP id b12so20134791edd.6
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 05:11:11 -0700 (PDT)
X-Gm-Message-State: ACrzQf15WvRooK58TIe3Bss5LL5n9rbucggxgacIiNWzUU4WByEP08eZ
        quC8ZdXhR/Gp0wLO62tA8isZVJxC7pziDGnUhNE=
X-Google-Smtp-Source: AMsMyM5znqKNjGs3V/OndztvtPb+qT2+rIZS8P7UwXdK6lBdPPeWIPtDkNrkFphiETK8ds13I9RLWCeZmQPziFqCbdk=
X-Received: by 2002:a05:6402:2285:b0:45c:7c8c:3032 with SMTP id
 cw5-20020a056402228500b0045c7c8c3032mr2253120edb.78.1666095069812; Tue, 18
 Oct 2022 05:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221018100457.3440691-1-kernel@xen0n.name> <20221018100457.3440691-2-kernel@xen0n.name>
In-Reply-To: <20221018100457.3440691-2-kernel@xen0n.name>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Tue, 18 Oct 2022 20:10:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4L1kQoY6UOr3v2h6XJ3o6x=bg88JeBP4+x40YVydNACQ@mail.gmail.com>
Message-ID: <CAAhV-H4L1kQoY6UOr3v2h6XJ3o6x=bg88JeBP4+x40YVydNACQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: LoongArch: Document the syscall ABI
To:     WANG Xuerui <kernel@xen0n.name>
Cc:     linux-doc@vger.kernel.org, WANG Xuerui <git@xen0n.name>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 18, 2022 at 6:05 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> From: WANG Xuerui <git@xen0n.name>
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Yanteng Si <siyanteng@loongson.cn>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: loongarch@lists.linux.dev
> ---
>  Documentation/loongarch/index.rst       |  1 +
>  Documentation/loongarch/syscall-abi.rst | 36 +++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 Documentation/loongarch/syscall-abi.rst
>
> diff --git a/Documentation/loongarch/index.rst b/Documentation/loongarch/index.rst
> index aaba648db907..5dacd7143d2f 100644
> --- a/Documentation/loongarch/index.rst
> +++ b/Documentation/loongarch/index.rst
> @@ -10,6 +10,7 @@ LoongArch Architecture
>
>     introduction
>     irq-chip-model
> +   syscall-abi
>
>     features
>
> diff --git a/Documentation/loongarch/syscall-abi.rst b/Documentation/loongarch/syscall-abi.rst
> new file mode 100644
> index 000000000000..6f63aa3cfc64
> --- /dev/null
> +++ b/Documentation/loongarch/syscall-abi.rst
> @@ -0,0 +1,36 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===============================
> +Linux/LoongArch system call ABI
> +===============================
> +
> +This document describes the system call ABI of Linux/LoongArch.
> +As the kernel is 64-bit only for now, the description below assumes an LP64\*
> +calling convention.
> +
> +Syscall numbers and parameters
> +==============================
> +
> +Like with other recent architecture ports, for the most part Linux/LoongArch
> +reuses the asm-generic syscall numbers and parameters.
> +There are a few points worth mentioning though.
> +
> +* There is no ``renameat``. Use ``renameat2`` instead.
> +* There is no ``getrlimit`` or ``setrlimit``. Use ``prlimit64`` instead.
> +* There is no ``fstat`` or ``newfstatat``. Only ``statx`` is provided, and
You may need list more syscalls:
Controlled by __ARCH_WANT_OLD_STAT:
sys_stat()/sys_lstat()/sys_fstat()/sys_fstatat()
Controlled by __ARCH_WANT_NEW_STAT:
sys_newstat()/sys_newlstat()/sys_newfstat()/sys_newfstatat()
Controlled by __ARCH_WANT_STAT64:
sys_stat64()/sys_lstat64()/sys_fstat64()/sys_fstatat64()

Huacai

> +  low-level components making their own syscalls are expected to be aware of
> +  this (and provide their own shims if necessary).
> +
> +Invocation
> +==========
> +
> +System calls are currently made with the ``syscall 0`` instruction.
> +Although the immediate field in the instruction is not checked at present,
> +it is strongly advised to keep it zeroed in case it is to be made meaningful
> +in the future.
> +
> +The system call number is placed in the register ``a7``.
> +Parameters, if present, are placed from ``a0`` through ``a6`` as needed,
> +as if calling a function with the respective arguments.
> +Upon return, ``a0`` contains the return value, and ``t0-t8`` should be
> +considered clobbered; all other registers are preserved.
> --
> 2.38.0
>
