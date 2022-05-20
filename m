Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 852A352E374
	for <lists+linux-doc@lfdr.de>; Fri, 20 May 2022 06:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233544AbiETEBy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 20 May 2022 00:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbiETEBx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 May 2022 00:01:53 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650F414A26B
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 21:01:52 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id h5so8639792wrb.11
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 21:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lX20NL3YNPaKjNecI4oDdq3acoU2kOL0ZbPMHMv9mB0=;
        b=QUhqUNwjiYBBL+Gfy7USDRKlfhCB5po25WZwgPlSiSkUXf8omWvdSvXZzxRV41w1tT
         d5C/MVpxWJNzqMqMn4BsGlEqIb6rOVIxP+yf5DJ3CcD/CMFR7a+o3Nxfo0tiHS41+QJx
         1G0voWhXE97nNh8TDu9IYnnRSfvefCogP4VsB5M0y74VMQ5qGopMDi1VQqUGm6PnvD78
         YluERYOhs/tCKgwebfwVE2yQreNBgLUaB4ZY4z6xzZTQ7LXJk9AbCoT54oExEPxtuCAM
         DF3gvipca18rnRT53tde7E+gUZik7VP0hR/Z6h4m5Gl7iRVkpIrQcRhWqQ2jBr0jnUJX
         zgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lX20NL3YNPaKjNecI4oDdq3acoU2kOL0ZbPMHMv9mB0=;
        b=JNLVkMMjjqjEZ8DxjqOOk+KNMPE4476siDpdk7Cr07iFgEVGLmPiJCRVYZ/w71LC0/
         pUXYfFuGPpiIVG9/AoUMTCR4UPGyKsAX28MIwpvuTS4gIghsaOXjTJ6sAg3wvJ/SuLXp
         iaXGIf2Py9lwoU3T9jBa/5o2QMbgp1yZq6UNkiwU6x5JkxSPmLSwktSQQyDIXcsW5ynS
         SdzdIRhFO8yoK2lBda4bKe8WX99y2mRBR9hMMuKpSjIFdYRTahzx70s7waYrcDoxS5AA
         JBjLqfegMHWf4ljDoScMiG4LGbxtkXFwEJxZbbnIIvHpU9SFOkpfbmzBsKMX3N+tSaHW
         xnLw==
X-Gm-Message-State: AOAM532MnfnMiLskif5ONu8wfWxMw5tfjaQPIy2QXkKGyZU3fkAmOmWI
        PDycZ8s7e3DugUCND0XzTB9lGaxmnpihx66Bkdu0BA==
X-Google-Smtp-Source: ABdhPJzdvVJxxqGLhr1D82HU8Nge0YZ/NcyQRTLRKVqI4Jh/02FF2nx30JgW9qrXm/uIf/Cxvut3pYr3QoTiG9nq0a4=
X-Received: by 2002:a5d:5846:0:b0:20c:7407:5fa1 with SMTP id
 i6-20020a5d5846000000b0020c74075fa1mr6448325wrf.116.1653019310813; Thu, 19
 May 2022 21:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220519214021.3572840-1-kaleshsingh@google.com> <202205191848.DEE05F6@keescook>
In-Reply-To: <202205191848.DEE05F6@keescook>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Thu, 19 May 2022 21:01:39 -0700
Message-ID: <CAC_TJve0iyPU0uKoKOi_qcwgxPkgNKgirBcMJ=oYBqhRC3a_+Q@mail.gmail.com>
Subject: Re: [RFC PATCH] procfs: Add file path and size to /proc/<pid>/fdinfo
To:     Kees Cook <keescook@chromium.org>
Cc:     Ioannis Ilkos <ilkos@google.com>,
        "T.J. Mercier" <tjmercier@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
        Mike Rapoport <rppt@kernel.org>,
        Colin Cross <ccross@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 19, 2022 at 6:50 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, May 19, 2022 at 02:40:15PM -0700, Kalesh Singh wrote:
> > [...]
> > +     seq_file_path(m, file, "\n");
> > +     seq_putc(m, '\n');
> >
> >       /* show_fd_locks() never deferences files so a stale value is safe */
> >       show_fd_locks(m, file, files);
>
> This comment implies "file" might be stale? Does that mean anything for
> the above seq_file_path()?

Hi Kees.

Thanks for taking a look. The comment above says the "files" pointer
can be stale. It doesn't affect our use of "file" here. seq_show()
takes the reference with get_file() so "file" wouldn't be destroyed
from under us.

Thanks,
Kalesh
>
> --
> Kees Cook
