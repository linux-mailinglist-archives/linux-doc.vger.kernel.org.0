Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B168054F645
	for <lists+linux-doc@lfdr.de>; Fri, 17 Jun 2022 13:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380066AbiFQLFs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Jun 2022 07:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380595AbiFQLFs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Jun 2022 07:05:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF9C6C0F5
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 04:05:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2182061E58
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 11:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B681C3411F
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655463946;
        bh=1uBbVLUaPRXNbZsqVcCu1YMFZSM4++BuUkFmwedlp4I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bykSvHlXRKyLX4wVsrTVP+bW91xmZ/BLH8mINuM7pI9Qj9q8XHbzImGpTpjBwg9HM
         Bv6gTPLARHvphoYwYEyu6tn5p33/A35e0uUVkhP4T9i/887FercX2jY9+YPBur8Oo+
         E/sHJJNRBIydcOwZ0F9hxosJpLeIS/nWchrpsJZKoEJsUb8VoeVmTfN1bjSPZpcvhm
         HMg4ctJ62ikFRsHUCc59gqPyriApTtLxBBnnhCmv+gHrNSb2A1i87bGHqHmN5q1BVU
         lBEmsqUVSO86Vz+gBhoTXaYGeogqVZgRw0TalGyETuViOaltHBnfcWZQaPPPt1uP/T
         UespwVY15za7Q==
Received: by mail-lj1-f182.google.com with SMTP id l18so4336577lje.13
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 04:05:46 -0700 (PDT)
X-Gm-Message-State: AJIora9PaNM3/I+a8EOvOK1fjzeB12ProDy/XRFYcgZYn795XPbOSd6/
        /2lewbbOuv14gjQQTbZ8n/V6NmUV8sZqoCHz+nk=
X-Google-Smtp-Source: AGRyM1s4dyvnGCe4oSjf+q3h8djWoa1ljc5T+ue0cjMzRKAHztM3iOfkRGBqYgeEycivTzxyflSOPbkvRxjPA/f+VcM=
X-Received: by 2002:a05:651c:506:b0:257:c12:b941 with SMTP id
 o6-20020a05651c050600b002570c12b941mr4770423ljp.429.1655463944476; Fri, 17
 Jun 2022 04:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1655463225.git.siyanteng@loongson.cn> <2da9b19588cfa20c3797015ea3ce6831b3a7fa2b.1655463225.git.siyanteng@loongson.cn>
In-Reply-To: <2da9b19588cfa20c3797015ea3ce6831b3a7fa2b.1655463225.git.siyanteng@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Fri, 17 Jun 2022 19:05:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ihtPn-3zKWaevvTKeCs=tdi8RQ8NaKoEU_XD44mEytg@mail.gmail.com>
Message-ID: <CAAhV-H4ihtPn-3zKWaevvTKeCs=tdi8RQ8NaKoEU_XD44mEytg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] docs/LoongArch: Fix notes rendering by using reST directives
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, bobwxc@email.cn, seakeel@gmail.com,
        Jonathan Corbet <corbet@lwn.net>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng01@gmail.com>, loongarch@lists.linux.dev,
        WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Yanteng,

On Fri, Jun 17, 2022 at 6:55 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> "Note" is an admonition, but it doesn't render
> correctly, let's fix it by using reST directives.
I think "but it doesn't render correctly" should be "but it isn't
correctly rendered in HTML". How do you think, Xuerui?

Huacai
>
> Fixes: 0ea8ce61cb2c ("Documentation: LoongArch: Add basic documentations")
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: WANG Xuerui <git@xen0n.name>
> ---
>  Documentation/loongarch/introduction.rst   | 15 +++++++++------
>  Documentation/loongarch/irq-chip-model.rst | 22 +++++++++++++---------
>  2 files changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/Documentation/loongarch/introduction.rst b/Documentation/loongarch/introduction.rst
> index 2bf40ad370df..216b3f390e80 100644
> --- a/Documentation/loongarch/introduction.rst
> +++ b/Documentation/loongarch/introduction.rst
> @@ -45,10 +45,12 @@ Name              Alias           Usage               Preserved
>  ``$r23``-``$r31`` ``$s0``-``$s8`` Static registers    Yes
>  ================= =============== =================== ============
>
> -Note: The register ``$r21`` is reserved in the ELF psABI, but used by the Linux
> -kernel for storing the percpu base address. It normally has no ABI name, but is
> -called ``$u0`` in the kernel. You may also see ``$v0`` or ``$v1`` in some old code,
> -however they are deprecated aliases of ``$a0`` and ``$a1`` respectively.
> +.. Note::
> +    The register ``$r21`` is reserved in the ELF psABI, but used by the Linux
> +    kernel for storing the percpu base address. It normally has no ABI name,
> +    but is called ``$u0`` in the kernel. You may also see ``$v0`` or ``$v1``
> +    in some old code,however they are deprecated aliases of ``$a0`` and ``$a1``
> +    respectively.
>
>  FPRs
>  ----
> @@ -69,8 +71,9 @@ Name              Alias              Usage               Preserved
>  ``$f24``-``$f31`` ``$fs0``-``$fs7``  Static registers    Yes
>  ================= ================== =================== ============
>
> -Note: You may see ``$fv0`` or ``$fv1`` in some old code, however they are deprecated
> -aliases of ``$fa0`` and ``$fa1`` respectively.
> +.. Note::
> +    You may see ``$fv0`` or ``$fv1`` in some old code, however they are
> +    deprecated aliases of ``$fa0`` and ``$fa1`` respectively.
>
>  VRs
>  ----
> diff --git a/Documentation/loongarch/irq-chip-model.rst b/Documentation/loongarch/irq-chip-model.rst
> index 8d88f7ab2e5e..7988f4192363 100644
> --- a/Documentation/loongarch/irq-chip-model.rst
> +++ b/Documentation/loongarch/irq-chip-model.rst
> @@ -145,12 +145,16 @@ Documentation of Loongson's LS7A chipset:
>
>    https://github.com/loongson/LoongArch-Documentation/releases/latest/download/Loongson-7A1000-usermanual-2.00-EN.pdf (in English)
>
> -Note: CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller described
> -in Section 7.4 of "LoongArch Reference Manual, Vol 1"; LIOINTC is "Legacy I/O
> -Interrupts" described in Section 11.1 of "Loongson 3A5000 Processor Reference
> -Manual"; EIOINTC is "Extended I/O Interrupts" described in Section 11.2 of
> -"Loongson 3A5000 Processor Reference Manual"; HTVECINTC is "HyperTransport
> -Interrupts" described in Section 14.3 of "Loongson 3A5000 Processor Reference
> -Manual"; PCH-PIC/PCH-MSI is "Interrupt Controller" described in Section 5 of
> -"Loongson 7A1000 Bridge User Manual"; PCH-LPC is "LPC Interrupts" described in
> -Section 24.3 of "Loongson 7A1000 Bridge User Manual".
> +.. Note::
> +    - CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller described
> +      in Section 7.4 of "LoongArch Reference Manual, Vol 1";
> +    - LIOINTC is "Legacy I/OInterrupts" described in Section 11.1 of
> +      "Loongson 3A5000 Processor Reference Manual";
> +    - EIOINTC is "Extended I/O Interrupts" described in Section 11.2 of
> +      "Loongson 3A5000 Processor Reference Manual";
> +    - HTVECINTC is "HyperTransport Interrupts" described in Section 14.3 of
> +      "Loongson 3A5000 Processor Reference Manual";
> +    - PCH-PIC/PCH-MSI is "Interrupt Controller" described in Section 5 of
> +      "Loongson 7A1000 Bridge User Manual";
> +    - PCH-LPC is "LPC Interrupts" described in Section 24.3 of
> +      "Loongson 7A1000 Bridge User Manual".
> --
> 2.27.0
>
