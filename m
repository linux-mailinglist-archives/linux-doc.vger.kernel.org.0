Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3153B2A0AC9
	for <lists+linux-doc@lfdr.de>; Fri, 30 Oct 2020 17:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgJ3QM2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 30 Oct 2020 12:12:28 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:54873 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgJ3QM1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 12:12:27 -0400
Date:   Fri, 30 Oct 2020 16:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1604074344;
        bh=nZFU7sIE3OBpOLAtFFlRweFOldbgDSjhQVlNwfhVLsY=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=AZpHaiGnT4e8hXxTciEAL5zFCmMelbrGmugbp7pEQ8UvpEL1ZkerXeiy20k3LDDiR
         miuH4x4UaCMbKA85MB07bqi2L6++nuB9my8EsjETUHuvHM2+38rtNrS7HeIN22n2Xd
         E0L7+syEE0dyQ9sAygHet+gUXkUWIhL8zh4hO5GA=
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
From:   =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: Re: [PATCH RFC] docs: fix automarkup regression on Python 2
Message-ID: <C6QCQWW476W5.15PKD7G7AG16G@ArchWay>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri Oct 30, 2020 at 12:51 PM -03, Jonathan Corbet wrote:
>
> It turns out that the Python 2 re module lacks the ASCII flag, so don't
> try
> to use it there.
>
> Fixes: f66e47f98c1e ("docs: automarkup.py: Fix regexes to solve sphinx 3
> warnings")
> Reported-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
> Documentation/sphinx/automarkup.py | 20 ++++++++++++++------
> 1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/sphinx/automarkup.py
> b/Documentation/sphinx/automarkup.py
> index 409dbc4100de..3e81ebab26ed 100644
> --- a/Documentation/sphinx/automarkup.py
> +++ b/Documentation/sphinx/automarkup.py
> @@ -15,6 +15,14 @@ else:
> import re
> from itertools import chain
>
> +#
> +# Python 2 lacks re.ASCII...
> +#
> +try:
> + ascii_p3 =3D re.ASCII
> +except AttributeError:
> + ascii_p3 =3D 0
> +
> #
> # Regex nastiness. Of course.
> # Try to identify "function()" that's not already marked up some
> @@ -22,22 +30,22 @@ from itertools import chain
> # :c:func: block (i.e. ":c:func:`mmap()`s" flakes out), so the last
> # bit tries to restrict matches to things that won't create trouble.
> #
> -RE_function =3D re.compile(r'\b(([a-zA-Z_]\w+)\(\))', flags=3Dre.ASCII)
> +RE_function =3D re.compile(r'\b(([a-zA-Z_]\w+)\(\))', flags=3Dascii_p3)
>
> #
> # Sphinx 2 uses the same :c:type role for struct, union, enum and
> typedef
> #
> RE_generic_type =3D
> re.compile(r'\b(struct|union|enum|typedef)\s+([a-zA-Z_]\w+)',
> - flags=3Dre.ASCII)
> + flags=3Dascii_p3)
>
> #
> # Sphinx 3 uses a different C role for each one of struct, union, enum
> and
> # typedef
> #
> -RE_struct =3D re.compile(r'\b(struct)\s+([a-zA-Z_]\w+)', flags=3Dre.ASCI=
I)
> -RE_union =3D re.compile(r'\b(union)\s+([a-zA-Z_]\w+)', flags=3Dre.ASCII)
> -RE_enum =3D re.compile(r'\b(enum)\s+([a-zA-Z_]\w+)', flags=3Dre.ASCII)
> -RE_typedef =3D re.compile(r'\b(typedef)\s+([a-zA-Z_]\w+)',
> flags=3Dre.ASCII)
> +RE_struct =3D re.compile(r'\b(struct)\s+([a-zA-Z_]\w+)', flags=3Dascii_p=
3)
> +RE_union =3D re.compile(r'\b(union)\s+([a-zA-Z_]\w+)', flags=3Dascii_p3)
> +RE_enum =3D re.compile(r'\b(enum)\s+([a-zA-Z_]\w+)', flags=3Dascii_p3)
> +RE_typedef =3D re.compile(r'\b(typedef)\s+([a-zA-Z_]\w+)',
> flags=3Dascii_p3)
>
> #
> # Detects a reference to a documentation page of the form
> Documentation/... with
> --
> 2.26.2

Looks good to me.

Thanks,
N=C3=ADcolas

