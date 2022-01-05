Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 209504859E5
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jan 2022 21:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243952AbiAEUSl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Jan 2022 15:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243949AbiAEUSl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jan 2022 15:18:41 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43730C0611FD
        for <linux-doc@vger.kernel.org>; Wed,  5 Jan 2022 12:18:41 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id i3so1132935ybh.11
        for <linux-doc@vger.kernel.org>; Wed, 05 Jan 2022 12:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=koUG4mBaX/32RQiwrPD+XRtpDsLQ6tXsD9l8tNIsTsM=;
        b=pTM4fbhrLR0L/UsKn5Elp+TBieKwifmdJJdKIcbCH1YbtfYeuZShXeHtuZNS5wYmic
         h23ROpOIL82AMYBxJtcr9Egz+EZwhVkXyRCMwCiT0AS2lS/dp51hran0Vx4s+c0gdbPl
         4hrxtvn6EJtmZEdXMhYOJrGEWFbKxRwiFFf3lDwaNUQcZiHxPxnufbvjiMtOLS4Vva2l
         KYxsRFmD4gdprdIu5MwNQNiNafGUE2XpzxtjD5dCsA0MYITeHA80YxQF3/A9Bdv6KWJo
         reCQ49By88S1uOEqJutLC0Y6yOVQJc0uJzp05KLlVodxkxrkwO0c8R92CdRYu7tEssVm
         1xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=koUG4mBaX/32RQiwrPD+XRtpDsLQ6tXsD9l8tNIsTsM=;
        b=SzjxHEAPVMJtTzH8loUcPSBKwi68Rw0qp6l+B1Kda+ZDm6Wue1fAiZKE/wHpqaufS9
         VDfWxnB++hG/+upizS6ym3QY6WxuUYx2c1vHu+d/YH6EcyZbTu02WD4b0eWwPpjRjSMy
         XC9+cLYcN6FJD0yNeiKLpo9b5OPIWA9SVq+IrXh03/jT2WG6yuR9TGl4vD9WruOfC63O
         Nsw6hjoUIcrbyXyQJW+HQ05yCGk5kvURiUmRIhYtbj6b1lTquUnGfDOTeZKAKeD/uYgG
         SgQ/80bdLnjSFkoBoG68k6RAggFWpIwwKk9X6bLe/LCYmFP8h/tSxRcsTHPkN5roJyTs
         Notw==
X-Gm-Message-State: AOAM530+LyCe7hvzy2NLzP/DEmAOSyyeHD+rX2mOS9XaVm19Z1c5TcVq
        lUfIGHXW8AMquYVFpD6GD3lmyP6K5GA1H1aZIYlljw==
X-Google-Smtp-Source: ABdhPJw+MtswP+bBIXzw2fD0VxSWv4TW1Zt5sSALH37S5MTkdypofzG6IRLw0xceqMUHVuy/3rntj/a1H0Cn1JQnB4A=
X-Received: by 2002:a05:6902:124f:: with SMTP id t15mr80500510ybu.644.1641413920152;
 Wed, 05 Jan 2022 12:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20211229215330.4134835-1-yaelt@google.com> <CAFA6WYPuPHgcnzt6j+Q-EA2Dos6vBDukrjpheo5srLVXFrifEg@mail.gmail.com>
 <5a38824152eeee0fc9ba0a4fd2308bb6e0970059.camel@linux.ibm.com> <CAFA6WYOJt3=YMTt_QQSq6Z-MK42hwWspgSpasw2fuPtVFcP3uA@mail.gmail.com>
In-Reply-To: <CAFA6WYOJt3=YMTt_QQSq6Z-MK42hwWspgSpasw2fuPtVFcP3uA@mail.gmail.com>
From:   Yael Tiomkin <yaelt@google.com>
Date:   Wed, 5 Jan 2022 15:18:29 -0500
Message-ID: <CAKoutNvW1c7MkTaFwyrD7MjUVXvTtcBOGFULMittJ5vzjMN0mg@mail.gmail.com>
Subject: Re: [PATCH v4] KEYS: encrypted: Instantiate key with user-provided
 decrypted data
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org,
        jejb@linux.ibm.com, Jarkko Sakkinen <jarkko@kernel.org>,
        corbet@lwn.net, dhowells@redhat.com, jmorris@namei.org,
        serge@hallyn.com, keyrings@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module <linux-security-module@vger.kernel.org>,
        =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Sumit,

On Mon, Jan 3, 2022 at 1:51 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Hi Mimi,
>
> Apologies for the delayed reply as I was on leave for a long new year weekend.
>
> On Thu, 30 Dec 2021 at 18:59, Mimi Zohar <zohar@linux.ibm.com> wrote:
> >
> > Hi Sumit,
> >
> > On Thu, 2021-12-30 at 15:37 +0530, Sumit Garg wrote:
> > > + Jan, Ahmad
> > >
> > > On Thu, 30 Dec 2021 at 03:24, Yael Tiomkin <yaelt@google.com> wrote:
> > > >
> > > > The encrypted.c class supports instantiation of encrypted keys with
> > > > either an already-encrypted key material, or by generating new key
> > > > material based on random numbers. This patch defines a new datablob
> > > > format: [<format>] <master-key name> <decrypted data length>
> > > > <decrypted data> that allows to instantiate encrypted keys using
> > > > user-provided decrypted data, and therefore allows to perform key
> > > > encryption from userspace. The decrypted key material will be
> > > > inaccessible from userspace.
> > >
> > > This type of user-space key import feature has already been discussed
> > > at large in the context of trusted keys here [1]. So what makes it
> > > special in case of encrypted keys such that it isn't a "UNSAFE_IMPORT"
> > > or "DEBUGGING_IMPORT" or "DEVELOPMENT_IMPORT", ...?
> > >
> > > [1] https://lore.kernel.org/linux-integrity/74830d4f-5a76-8ba8-aad0-0d79f7c01af9@pengutronix.de/
> > >
> > > -Sumit
> > >
> > > >
> > > > Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> > > > Signed-off-by: Yael Tiomkin <yaelt@google.com>
> >
> > There is a difference between trusted and encrypted keys.
>
> Yeah I understand the implementation differences.
>
> >  So in
> > addition to pointing to the rather long discussion thread, please
> > summarize the conclusion and, assuming you agree, include why in once
> > case it was acceptable and in the other it wasn't to provide userspace
> > key data.
>
> My major concern with importing user-space key data in *plain* format
> is that if import is *not* done in a safe (manufacturing or
> production) environment then the plain key data is susceptible to
> user-space compromises when the device is in the field.

I agree this can happen. Key distribution in any scenario needs to be
secure and this could also potentially be an issue if the key is first
encrypted and then imported. We can make sure the documentation
highlights the safety requirement.

>
> And it sounds like we are diverting from basic definition [1] of encrypted keys:
>
> "Trusted and Encrypted Keys are two new key types added to the
> existing kernel key ring service. Both of these new types are variable
> length symmetric keys, and in both cases all keys are created in the
> kernel, and **user space sees, stores, and loads** only encrypted
> blobs."
>
> Also, as Jarrko mentioned earlier the use-case is still not clear to
> me as well. Isn't user logon keys an alternative option for
> non-readable user-space keys?

The goal in this change is to allow key encryption from userspace,
using user-provided decrypted data. This cannot be achieved in logon
keys, which as you mentioned, are simply non-readable user type keys.


>
> [1] https://www.kernel.org/doc/html/v4.13/security/keys/trusted-encrypted.html
>
> -Sumit
>
> >
> > thanks,
> >
> > Mimi
> >

Yael
