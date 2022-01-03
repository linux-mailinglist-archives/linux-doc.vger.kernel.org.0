Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2956482E95
	for <lists+linux-doc@lfdr.de>; Mon,  3 Jan 2022 08:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbiACHAY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Jan 2022 02:00:24 -0500
Received: from condef-09.nifty.com ([202.248.20.74]:31340 "EHLO
        condef-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbiACHAW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jan 2022 02:00:22 -0500
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-09.nifty.com with ESMTP id 2036ui7o023377
        for <linux-doc@vger.kernel.org>; Mon, 3 Jan 2022 15:56:44 +0900
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 2036uTEH013835;
        Mon, 3 Jan 2022 15:56:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 2036uTEH013835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1641192990;
        bh=0+ioftAd/kkHmwKuFy51aEio59K+4lZDLN5BOQt2u3w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nTNVKEZrIcpoiz0vXU4cujaLF1XGmzC1qJe3R5nPVJx0RAg8n7ssxzCiFVMdzSozD
         fBLETiOgXeXRo5jzwfQDqJ8nK6gY6hkzCORFyIwfbS8DhnjIqbeqwgUfOrTxmrqUa6
         9IycmHvX+n8rZDr4XLCGTyoAJmYe+ZBy3Wbbp7NIFFqOsc6hWnEGD8O37ACiJPJRWQ
         fiZwbauWULziA8w1PWthBcVHg7QorrhnkoEIufRm9c1ckQtVNW1vQ81kvZ823otkF+
         DwSOv5DjkyXkodmnjcFqQwoTUO9yYJG8+3jykObtDXwTLNHSByMPbWIXJurJte/j8a
         BkMDtsBeNgkxQ==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id g2so29429969pgo.9;
        Sun, 02 Jan 2022 22:56:29 -0800 (PST)
X-Gm-Message-State: AOAM531y7VwaMjDXBtJoRWRaVgOD4TL73huWrTbp78Cbt9I/LVX2f+qo
        zAFwu3UIbWDfGaBtWJuWyCWC1iKPyOFYO8p9VTU=
X-Google-Smtp-Source: ABdhPJwJ0lPthz4rrEgHqocpuqBwWw4mWjV43mmunLIwxztjbIqpUr4Xo+cCJayA7GGb/pAS/JRxOvLYbOBKLM9Ovww=
X-Received: by 2002:a05:6a00:1484:b0:4bb:86a:c061 with SMTP id
 v4-20020a056a00148400b004bb086ac061mr44922472pfu.36.1641192988954; Sun, 02
 Jan 2022 22:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20211231195925.GA1678@kernel.org>
In-Reply-To: <20211231195925.GA1678@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 3 Jan 2022 15:55:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNASnMu3oBy18SHSkA-cpeXj=oaLQYTjfuBcuoHLi6aVC0Q@mail.gmail.com>
Message-ID: <CAK7LNASnMu3oBy18SHSkA-cpeXj=oaLQYTjfuBcuoHLi6aVC0Q@mail.gmail.com>
Subject: Re: [PATCH] doc: kbuild: fix default in `imply` table
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jan 1, 2022 at 5:01 AM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> `BAZ` takes `FOO`'s value as default (as far as `BAR` allows it).
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Documentation/kbuild/kconfig-language.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 98c24183d8c3..93a5b6e1fabd 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -176,7 +176,7 @@ applicable everywhere (see syntax).
>         y               y               y               Y/m/n
>         n               m               n               N/m
>         m               m               m               M/n
> -       y               m               n               M/n
> +       y               m               m               M/n
>         y               n               *               N
>         ===             ===             =============   ==============
>
> --
> 2.34.1
>


Applied to linux-kbuild. Thanks.

-- 
Best Regards
Masahiro Yamada
