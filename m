Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6AA2F562F
	for <lists+linux-doc@lfdr.de>; Thu, 14 Jan 2021 02:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbhANBoP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Jan 2021 20:44:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbhANBVr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 20:21:47 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92385C061786
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 17:20:12 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id y8so2076692plp.8
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 17:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XrnFQm3yxmGSlxVmkfzcamv4pi81tiqdYqSnRQXjXoY=;
        b=djIUI+EEAUGfRcY+LCI4jhslBWN5DrE+mWfMPojsOc731gQz9i1Onk19CCZS0dxNL1
         0MHtAG191+3TNBpT/W9kh2WeaZ+9ZUJtYCMrbBbt6g02lK0ivDZx1sfH6YyXZhUPdjhW
         H8LkmveziTB5VMCjH5yxqjl5/CEstNnuFnJjungjjZPfMyZW2mdaXqR7Vr8uMbdpEJTC
         wToYN7jeSsHZmaMmt5L0/xYhUf0BM9TmBuRrb45fb8idUoRhjlQPOB7TAajzA6/eUK4G
         7y+hvQM5KoVDVodaSW8A2/XHa9mPJcrCBouwEgO0XTKjYN3+b9yNCsB+TjIDP9Zzlm6q
         5LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XrnFQm3yxmGSlxVmkfzcamv4pi81tiqdYqSnRQXjXoY=;
        b=alhJQ56dH90DtLJ3XKKjUYuriDidJpZwRFxw2MblMe9DNpr4sAdFaeUo+2aJ218Kad
         OBYVk4XZbUnzCC3M3M453RFUcnFc9vYdAmUzLWXcUm4Hzls6B65CgeH7D9B9+m8YQwpK
         HvpVhOZ3JcSOstGB65ZvuNPI44/wzN86Kreqoi1pcLE0m5IgGikBsoxPo3hf7tvzudFS
         iJByDl45LMqufmmO6OSiN9DnYOLagHdb+b+g5AUXYM3xtA3WiKWknQ+79GIpJDzYmx4F
         cPSHQy3hkAWkizXevHphijzIQMvbI4Vz9nRH6PkBCWG4aMvU878AV1gsN+a9WnXLiaO6
         PMFQ==
X-Gm-Message-State: AOAM532WKiKrnAXbjni09k9+8gxOJnPZAkNkJcFtWT5UasFalyHeDKo8
        xJtGb4c0Zyu17/O9hVfQGbLuiHk0jNelF5vxH2t0/A==
X-Google-Smtp-Source: ABdhPJw11N47JjXKZe748d/t8Qx6Lu3tOloFAVN/QkkrwblbR27PX02I0uZbsptPVDGPeiFGk/o1VN339g6DcZZI+qo=
X-Received: by 2002:a17:902:ed14:b029:da:9da4:3091 with SMTP id
 b20-20020a170902ed14b02900da9da43091mr5031901pld.29.1610587211830; Wed, 13
 Jan 2021 17:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20210114003447.7363-1-natechancellor@gmail.com>
In-Reply-To: <20210114003447.7363-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 13 Jan 2021 17:19:59 -0800
Message-ID: <CAKwvOdnJ0VUjTX-cyLgtHvy68DHG1VMj7s0huk_FKh1E9pH9Cg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Add a section about supported architectures
To:     Nathan Chancellor <natechancellor@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Patch looks fine, but `make -j htmldocs` seems to be taking forever
for me so I can't render it. Is this a known issue?

$ make -j htmldocs
  SPHINX  htmldocs --> file:///android0/linux-next/Documentation/output
make[2]: Nothing to be done for 'html'.
WARNING: The kernel documentation build process
        support for Sphinx v3.0 and above is brand new. Be prepared for
        possible issues in the generated output.
        Warning: The Sphinx 'sphinx_rtd_theme' HTML theme was not
found. Make sure you have the theme installed to produce pretty HTML
output. Falling back to the default theme.
enabling CJK for LaTeX builder
./drivers/usb/dwc3/core.h:1259: warning: Function parameter or member
'gadget_max_speed' not described in 'dwc3'
./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:340: warning:
Incorrect use of kernel-doc format:          *
@active_vblank_irq_count
./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:379: warning:
Function parameter or member 'active_vblank_irq_count' not described
in 'amdgpu_display_manager'
./include/linux/rcupdate.h:884: warning: Excess function parameter
'ptr' description in 'kfree_rcu'
./include/linux/rcupdate.h:884: warning: Excess function parameter
'rhf' description in 'kfree_rcu'

<seems like no updates from here>

On Wed, Jan 13, 2021 at 4:35 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> The most common question around building the Linux kernel with clang is
> "does it work?" and the answer has always been "it depends on your
> architecture, configuration, and LLVM version" with no hard answers for
> users wanting to experiment. LLVM support has significantly improved
> over the past couple of years, resulting in more architectures and
> configurations supported, and continuous integration has made it easier
> to see what works and what does not.
>
> Add a section that goes over what architectures are supported in the
> current kernel version, how they should be built (with just clang or the
> LLVM utilities as well), and the level of support they receive. This
> will make it easier for people to try out building their kernel with
> LLVM and reporting issues that come about from it.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  Documentation/kbuild/llvm.rst | 44 +++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index 21c847890d03..b18401d2ba82 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -63,6 +63,50 @@ They can be enabled individually. The full list of the parameters: ::
>  Currently, the integrated assembler is disabled by default. You can pass
>  ``LLVM_IAS=1`` to enable it.
>
> +Supported Architectures
> +-----------------------
> +
> +LLVM does not target all of the architectures that Linux supports and
> +just because a target is supported in LLVM does not mean that the kernel
> +will build or work without any issues. Below is a general summary of
> +architectures that currently work with ``CC=clang`` or ``LLVM=1``. Level
> +of support corresponds to "S" values in the MAINTAINERS files. If an
> +architecture is not present, it either means that LLVM does not target
> +it or there are known issues. Using the latest stable version of LLVM or
> +even the development tree will generally yield the best results.
> +An architecture's ``defconfig`` is generally expected to work well,
> +certain configurations may have problems that have not been uncovered
> +yet. Bug reports are always welcome at the issue tracker below!
> +
> +.. list-table::
> +   :widths: 10 10 10
> +   :header-rows: 1
> +
> +   * - Architecture
> +     - Level of support
> +     - ``make`` command
> +   * - arm
> +     - Supported
> +     - ``LLVM=1``
> +   * - arm64
> +     - Supported
> +     - ``LLVM=1``
> +   * - mips
> +     - Maintained
> +     - ``CC=clang``
> +   * - powerpc
> +     - Maintained
> +     - ``CC=clang``
> +   * - riscv
> +     - Maintained
> +     - ``CC=clang``
> +   * - s390
> +     - Maintained
> +     - ``CC=clang``
> +   * - x86
> +     - Supported
> +     - ``LLVM=1``
> +
>  Getting Help
>  ------------
>
>
> base-commit: 7c53f6b671f4aba70ff15e1b05148b10d58c2837
> --
> 2.30.0
>


-- 
Thanks,
~Nick Desaulniers
