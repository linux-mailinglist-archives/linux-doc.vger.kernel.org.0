Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B34A6038D0
	for <lists+linux-doc@lfdr.de>; Wed, 19 Oct 2022 06:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbiJSENV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Oct 2022 00:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiJSENU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Oct 2022 00:13:20 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81E5659F3
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 21:13:18 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id e129so15143946pgc.9
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 21:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=05myh31oMr/q2J5BJn593JOYwoX0tzfWg7ohUct7D5A=;
        b=YflIaczlCY9WKyaxEUxTSTFp5SQEgE5/lvpGzv1EJ0s5GzPMCU8/P/5D9c5NyhXp8J
         2DRhFvfOZviWnm3Zsx1lrqhtLuHKljlI+Ws7xMW/wLt+8b9HNRXrBB+KO9mHtbA1kgqu
         ECHd88+a1WZC6moWpAElwy2ZxE9VAaMYo2R17vybtNPYlM2usvA9FBYzO6OHasjNE+4M
         01+Q2STtfAweZrTYPBwxX1E9jZ8UrSIxp00BH3bJYUlmix2h+aEIgN/H5Zcvu4tKpWHl
         PqaGtufpb94uXGiJVukXkkWx2UagdF7byTQQjq/0vWmWTojIlGlPgyUy3ZiQ52xYwhfp
         K+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05myh31oMr/q2J5BJn593JOYwoX0tzfWg7ohUct7D5A=;
        b=FFhb/qBES6p8Fbzq6Lo7oaqhnTJsxwr5cXrIrfqdoaWmezxV6p3z/wx+gcEx7+xSfu
         Ao+pWzSh+LKkcqbp35EpMpWLIY8BIlVFyQxkGztVIjULUvjgyDrlbV046Cc/DJ3a0QQ3
         uJJVTQ3DeNuQkgdoOsfQ1CaTPkBrJpnoG6gAAbCmtO7O78tMti6fgSjngQPapI2BxKmp
         vkOIe+d+G9c9SDwjwcaDTZsIfF247y+9Cq5MHCffTrD0N7O/8Qd5+Sco9PgrJrBzHjOX
         ru9e5vBoKn0ph+7XIHEXQt1VQr0cC3nSRWh/S4wSYLgZN4WNauTlvGkByCJOC2hhTe0U
         /c9A==
X-Gm-Message-State: ACrzQf3t8alp7f7ofuBDdns3+YNTMLy3bEcYLiXAfXQk/CbRxXM19mBT
        Ab12mm7HwZKWnvbMinmzFIQtYaAJMT4Kfg==
X-Google-Smtp-Source: AMsMyM7PVGan+RHqzkCNfLmfIEcYPPU2SCyyNgOkjvyGlZJSW5qSXCZKTGjoqhBy2dUk+F703Q87Fg==
X-Received: by 2002:a05:6a00:1884:b0:562:6536:4844 with SMTP id x4-20020a056a00188400b0056265364844mr6639752pfh.2.1666152798231;
        Tue, 18 Oct 2022 21:13:18 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-77.three.co.id. [180.214.233.77])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902e8c300b00176b3d7db49sm9578499plg.0.2022.10.18.21.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 21:13:17 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 709A41012EB; Wed, 19 Oct 2022 11:13:14 +0700 (WIB)
Date:   Wed, 19 Oct 2022 11:13:13 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     WANG Xuerui <kernel@xen0n.name>
Cc:     linux-doc@vger.kernel.org, WANG Xuerui <git@xen0n.name>,
        Huacai Chen <chenhuacai@kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, loongarch@lists.linux.dev
Subject: Re: [PATCH 1/2] Documentation: LoongArch: Document the syscall ABI
Message-ID: <Y095WSk6brB2li/O@debian.me>
References: <20221018100457.3440691-1-kernel@xen0n.name>
 <20221018100457.3440691-2-kernel@xen0n.name>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pP58CdA786Rjnrv3"
Content-Disposition: inline
In-Reply-To: <20221018100457.3440691-2-kernel@xen0n.name>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--pP58CdA786Rjnrv3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 06:04:56PM +0800, WANG Xuerui wrote:
> From: WANG Xuerui <git@xen0n.name>
>=20

What description?

> diff --git a/Documentation/loongarch/syscall-abi.rst b/Documentation/loon=
garch/syscall-abi.rst
> new file mode 100644
> index 000000000000..6f63aa3cfc64
> --- /dev/null
> +++ b/Documentation/loongarch/syscall-abi.rst
> @@ -0,0 +1,36 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +Linux/LoongArch system call ABI
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +This document describes the system call ABI of Linux/LoongArch.
> +As the kernel is 64-bit only for now, the description below assumes an L=
P64\*
> +calling convention.
> +
> +Syscall numbers and parameters
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +Like with other recent architecture ports, for the most part Linux/Loong=
Arch
> +reuses the asm-generic syscall numbers and parameters.
> +There are a few points worth mentioning though.
> +
> +* There is no ``renameat``. Use ``renameat2`` instead.
> +* There is no ``getrlimit`` or ``setrlimit``. Use ``prlimit64`` instead.
> +* There is no ``fstat`` or ``newfstatat``. Only ``statx`` is provided, a=
nd
> +  low-level components making their own syscalls are expected to be awar=
e of
> +  this (and provide their own shims if necessary).
> +
> +Invocation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +System calls are currently made with the ``syscall 0`` instruction.
> +Although the immediate field in the instruction is not checked at presen=
t,
> +it is strongly advised to keep it zeroed in case it is to be made meanin=
gful
> +in the future.
> +
> +The system call number is placed in the register ``a7``.
> +Parameters, if present, are placed from ``a0`` through ``a6`` as needed,
> +as if calling a function with the respective arguments.
> +Upon return, ``a0`` contains the return value, and ``t0-t8`` should be
> +considered clobbered; all other registers are preserved.

The wording can be improved:

---- >8 ----

diff --git a/Documentation/loongarch/syscall-abi.rst b/Documentation/loonga=
rch/syscall-abi.rst
index 6f63aa3cfc64e5..d05fa2e0211bbf 100644
--- a/Documentation/loongarch/syscall-abi.rst
+++ b/Documentation/loongarch/syscall-abi.rst
@@ -5,32 +5,32 @@ Linux/LoongArch system call ABI
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
=20
 This document describes the system call ABI of Linux/LoongArch.
-As the kernel is 64-bit only for now, the description below assumes an LP6=
4\*
-calling convention.
+As the kernel currently only supports 64-bit LoongArch architecture, the
+description below assumes LP64\* calling convention.
=20
 Syscall numbers and parameters
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
=20
-Like with other recent architecture ports, for the most part Linux/LoongAr=
ch
+Like ther recent architecture ports, for the most part Linux/LoongArch
 reuses the asm-generic syscall numbers and parameters.
-There are a few points worth mentioning though.
+There are a few limitations worth mentioning though.
=20
 * There is no ``renameat``. Use ``renameat2`` instead.
 * There is no ``getrlimit`` or ``setrlimit``. Use ``prlimit64`` instead.
-* There is no ``fstat`` or ``newfstatat``. Only ``statx`` is provided, and
-  low-level components making their own syscalls are expected to be aware =
of
-  this (and provide their own shims if necessary).
+* There is no ``fstat`` or ``newfstatat``. Only ``statx`` is provided and
+  low-level components invoking their own syscalls are expected to be aware
+  of this (and provide their own shims if necessary).
=20
 Invocation
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-System calls are currently made with the ``syscall 0`` instruction.
+System calls are currently invoked with the ``syscall 0`` instruction.
 Although the immediate field in the instruction is not checked at present,
-it is strongly advised to keep it zeroed in case it is to be made meaningf=
ul
+it is strongly advised to keep it zeroed in case the field has purposes
 in the future.
=20
-The system call number is placed in the register ``a7``.
-Parameters, if present, are placed from ``a0`` through ``a6`` as needed,
-as if calling a function with the respective arguments.
-Upon return, ``a0`` contains the return value, and ``t0-t8`` should be
-considered clobbered; all other registers are preserved.
+The system call number is placed in the register ``a7``. Parameters, if
+present, are placed from ``a0`` through ``a6`` as needed, as if calling
+a function with respective arguments. Upon return, the return value is pla=
ced
+in ``a0`` and ``t0-t8`` should be considered clobbered; all other registers
+are preserved.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--pP58CdA786Rjnrv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY095VAAKCRD2uYlJVVFO
o5fFAQCtJdqR+Euwsb9nvjdIt/dLpS21ZxAQz6P2lyHgYsLqEQEArJcNI2Rd6XJ7
vDMZn/Jl/mZrA7i9pOweOtD2NlRm5gg=
=3HRU
-----END PGP SIGNATURE-----

--pP58CdA786Rjnrv3--
