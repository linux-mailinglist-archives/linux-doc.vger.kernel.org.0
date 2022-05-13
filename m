Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1062526276
	for <lists+linux-doc@lfdr.de>; Fri, 13 May 2022 14:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380491AbiEMM6O (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 May 2022 08:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380493AbiEMM6N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 May 2022 08:58:13 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FF79B1A0
        for <linux-doc@vger.kernel.org>; Fri, 13 May 2022 05:58:12 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id bg25so4751020wmb.4
        for <linux-doc@vger.kernel.org>; Fri, 13 May 2022 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=thaX8F5YMEB8rBSpYIHSf7KiewyBMS4c1TXezvvYXWo=;
        b=auGUYIiH8r7oJP67oOuHmzM/NOGPcdCLkLQF91WtkEgHQTmkJLUMnLAuJDyzjYn4e2
         2t8AnU/iUvEat3vHWqybIizYNTPVY0ZILJEv2VtWYhJv4l6so1W1LFOoNYlSuXPbDREi
         CaWD/8FR0FE/ZE//HYKE5FX42YiD7R6zQrQdllq9MeLOMcL/PmTY9bEtbPaGwG1GUk8I
         YXfqv/Clz9P/mcGMzzMu65NpEzl6n5AizJbkoffXPxU2NidzoyAY9tD0kyqBJW+cV6Yo
         L2XUKHbPY5DKUYM1pS6eoC+6qn9GDVlPBM5mHQ4SaO+Ed5OW841882ELq1gSprMqGPzV
         8sFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=thaX8F5YMEB8rBSpYIHSf7KiewyBMS4c1TXezvvYXWo=;
        b=yTN9TuZH4SMn7FtS+xMXguqLcqKqES3DrNBElAJ8ubJjj1FdkWi5vctIeIF5L3VgLm
         OVb65BX+a0Occqyhl2vKHL7ZAOhHHvoa79L6v+Ap4Qqi5eu1DVMhEJH3VD5HTj4TzyGg
         4+wwwKOIVGxTFlgyB8IsnHSYQpByddGAjPUxQ+WKr+xXiusV5AI0xym0zvllysZa+wQn
         +Jki6prGSewPxinHeslvKnP+p+HyFHsPRBRaQWakVmDj/170ZBD3Yd03nAKoBmCR92WI
         44iV0iRF/G9YU2uw+MXfkA6Sj7fikEUsdKja/DFjXqUhE/dDPTTr1Qk3DtbW+ZeMkrko
         fgKA==
X-Gm-Message-State: AOAM533U2sib6h4KZ3X0vDIi4pejhMpn5/S8UzBIniTY7GwC+bOu1+ph
        Xtp27/KKNIGn+e3wmvE8XgvJY0YwejPmvMX2DqlI
X-Google-Smtp-Source: ABdhPJyuPrauqU//BMVcgTUuAktKz5n/8NYQebKBmgF7eFtX+zbGS3ouW2oyFE/TlzAylCXCC9SYX/nSdl005MFElIs=
X-Received: by 2002:a05:600c:4fd0:b0:394:7999:98ab with SMTP id
 o16-20020a05600c4fd000b00394799998abmr4378959wmq.179.1652446690471; Fri, 13
 May 2022 05:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220513112743.156414-1-mic@digikod.net>
In-Reply-To: <20220513112743.156414-1-mic@digikod.net>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 13 May 2022 08:57:59 -0400
Message-ID: <CAHC9VhQS1mNAzC2Qo2+rxUs5BERA6Y9FyzapdRQ65g5FY1Mwtw@mail.gmail.com>
Subject: Re: [PATCH v2] landlock: Explain how to support Landlock
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Alejandro Colomar <alx.manpages@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 13, 2022 at 7:27 AM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
> Let's help users by documenting how to enable and check for Landlock in
> the kernel and the running system.  The userspace-api section may not be
> the best place for this but it still makes sense to put all the user
> documentation at the same place.
>
> Cc: Paul Moore <paul@paul-moore.com>
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>
> Link: https://lore.kernel.org/r/20220513112743.156414-1-mic@digikod.net
> ---
>
> Changes since v1:
> * Move the checking subsection at the beginning (suggested by Paul
>   Moore) and merge the two configuration subsections.
> * Use both dmesg and journalctl to handle cases where journald is not
>   installed or when the kernel log buffer is full.
> * Add reference to the syscall check (ABI section).
> * Improve explanations.
> * Update copyright date.
> ---
>  Documentation/userspace-api/landlock.rst | 29 +++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)

Looks good to me.

Reviewed-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
