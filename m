Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A207360B3C
	for <lists+linux-doc@lfdr.de>; Thu, 15 Apr 2021 16:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233285AbhDOOA3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 15 Apr 2021 10:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbhDOOA2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Apr 2021 10:00:28 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247E7C061574
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 07:00:05 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id bx20so27055659edb.12
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 07:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y6SOtxaSvvSrMRGWadRLTdN5j/Ia40PgWlLDe/mfqno=;
        b=MtB3uFfgeAtlB7+OskzJhQgeqwn0OUXUhk2ByLLtZl2bG065DMtx6WtfeFL27cIv20
         F3h8q+RDHP8unvp7PjqcwcC3Qie+7t/E+fduqwCNU9i8Cw64UNxPyTbi93n/PELs8ZPM
         kTvAujHl7X11hfvBCj7U1z/Oqk0eqF5I9nbCDEq9pMmz2J4+tUxm7Xmiv9x4w7pQ2dlT
         HlfDfCHkqpVQBN/d2eu3lXVdPrqQ/2fVu769Th8o99VPtiH3lfZFtIkCF5mQKT56sYcT
         /S5PLABL7KFsWZKOgq2t2bKts+N2GCteAAqmzCYLrsdyXH/FqvTWgld1bk781P0leb9l
         qbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y6SOtxaSvvSrMRGWadRLTdN5j/Ia40PgWlLDe/mfqno=;
        b=qHYDeq4MhrD+vlbAdo35S6GxGN0GrUqze/UVgiM414S81SZLKeTVgIEFlodL6VMh6x
         YOx20DI/1v0J05+n+SMAPSp+fgKVEP9cvJxKvkJylX9ySnzXlkCQfQenTbm2NLqguhhY
         fxZWXmcDdZHaA5XQbXiPjL7wlxiFUq5xe4cYHBs9xw2QKlZaO70vWJZ6FlZFPLr8ciWv
         J+M3D8rTWEU0yc1AB86KvSHUWRdSsa8tMzSH4bKi7dLN/D/Qg0jD8h63uUhONmzW+zcm
         pgkJsz5KF3YW8QcThRg8DVoZX4xIvHiAJCuTdE1hf0bErDwBr2NhxQOMVpMysJpIMlhk
         82ig==
X-Gm-Message-State: AOAM531F2iYpxxol5YgxJrKSolsQSR/3Hln++vPk26Ho7vPTT963jQtq
        6CKxAgR6JwGjXaaM5wZHAItGt5CU2Te8oncVKGhG
X-Google-Smtp-Source: ABdhPJxZmXYSXlByiPXfvpOnk1xaJfWfuy87POt7oGwxO8XTzXAp9SNEduKcz1rwITJhH+c/jpKTsNSWGMSeUJRaCTQ=
X-Received: by 2002:a05:6402:1cc1:: with SMTP id ds1mr4251308edb.135.1618495203692;
 Thu, 15 Apr 2021 07:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210309143953.142341-1-richard_c_haines@btinternet.com>
 <CAHC9VhSHm-GrmjdZKPFf8Rr5JNzo7ieR+mSy7F3n-KjfD1OEaA@mail.gmail.com>
 <20210413190150.GB26626@mail.hallyn.com> <96941e4977f38dea58a56fe19cfeb84179f0e3ef.camel@btinternet.com>
In-Reply-To: <96941e4977f38dea58a56fe19cfeb84179f0e3ef.camel@btinternet.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 15 Apr 2021 09:59:52 -0400
Message-ID: <CAHC9VhTcEx07YZ=F5M3kft+YL1aYBi-cN6PvuGr+cZ2HWMD3pA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] LSM Documentation - Render lsm_hooks.h for kernel_docs
To:     Richard Haines <richard_c_haines@btinternet.com>
Cc:     "Serge E. Hallyn" <serge@hallyn.com>,
        linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, James Morris <jmorris@namei.org>,
        casey@schaufler-ca.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 15, 2021 at 9:54 AM Richard Haines
<richard_c_haines@btinternet.com> wrote:
> Thanks for the comments, I'll rebuild on 5.12-rc7 and resubmit as a
> patch.

Thanks Richard.

-- 
paul moore
www.paul-moore.com
