Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A59F063032
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jul 2019 07:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfGIF4c (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 9 Jul 2019 01:56:32 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37952 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfGIF4c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jul 2019 01:56:32 -0400
Received: by mail-lj1-f193.google.com with SMTP id r9so18287434ljg.5
        for <linux-doc@vger.kernel.org>; Mon, 08 Jul 2019 22:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xli8Y1cqqEneErVoUF+bY1KzJjP8ZHOc6NmhgPLACKg=;
        b=IMCCarKQ7otAoqPUCeGQC3vcXQb2Cyy+ZfbRDDkUApkZBYQD9XaWe8JxyQ2r2kqeNo
         iBJVq3IEy825J1ZWOrKaOxMAamH2f2vMKMoBJB3v9Pag6syG+IgeeABenXGICPBQqVRo
         TCM9fQapLUxDmgd5l/nMkqcnYtQpA18ueFn8Kf+B65KClSm2X8JmaYkufFfGd9PJ7M06
         UnU5YQ6+xIMYq94vzkNzahudlTAkRFSRs7ooYuxhMyRpb6sFcPbMki9x9dlQKXVZvSxF
         OVDpetNx+Pr7CE/MltAUCeQcSuQw5PFb9k+56T+tdJXrd2q4ayYgA2XbDfZQj6MaXQC5
         3KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xli8Y1cqqEneErVoUF+bY1KzJjP8ZHOc6NmhgPLACKg=;
        b=Ttr4jabqHAsh1LrlHajm7+oXLFtyeng20XgHZ2XLPLGJQWlpRpQEnC8hNoahX6uMPG
         a8jwcjw0eu4EcPjpCnxXWcKQDuFmY7kprYHG/+NW6JUPqf4MjvqGQPS8Myp6p8D1fiiz
         2RH8aTvjEMGiPREnc5ERQ77aM945VXaABTSnDjVapMY7ulryRNRQ2QWsvejJEWHZJvH2
         8Q4n4HLb/7zQM5UVmztn2JwMitLjRXQFwlw4XmVpeGmECNurSlb3r8Ln5KGWd/4ut8kb
         FD3kR/sordKgRRrsq6Cddzk+DI/RnO4x70E8zCmhkslqi/PKDP6m9JS0G61RNBbThn+w
         P1oQ==
X-Gm-Message-State: APjAAAX6EdfAof3P09zygszPxP1/NP1eycUe3XQfw4BctUwqCLtdXzH0
        2Q/J0Sm128nFNox0cXw57LWjDBhWV72aV0BwdhmaOA==
X-Google-Smtp-Source: APXvYqwlQhdGUCfefYlKEiVuartStp85eZgRlkFqVnuEEm3QLzZHJNUv9XM9V5LdaYLUAVFbqvkatSjh6AFt6SHR4es=
X-Received: by 2002:a2e:9b57:: with SMTP id o23mr7858753ljj.67.1562651790245;
 Mon, 08 Jul 2019 22:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
 <1560421833-27414-4-git-send-email-sumit.garg@linaro.org> <20190708153908.GA28253@jax>
In-Reply-To: <20190708153908.GA28253@jax>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Tue, 9 Jul 2019 11:26:19 +0530
Message-ID: <CAFA6WYNzs=RErreWaa5BmF-P03Vf9nzQjvY_JpMckw87k9z12w@mail.gmail.com>
Subject: Re: [RFC 3/7] tee: add private login method for kernel clients
To:     Jens Wiklander <jens.wiklander@linaro.org>
Cc:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, corbet@lwn.net,
        dhowells@redhat.com, jejb@linux.ibm.com,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>, jmorris@namei.org,
        serge@hallyn.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tee-dev@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks Jens for your comments.

On Mon, 8 Jul 2019 at 21:09, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Hi Sumit,
>
> On Thu, Jun 13, 2019 at 04:00:29PM +0530, Sumit Garg wrote:
> > There are use-cases where user-space shouldn't be allowed to communicate
> > directly with a TEE device which is dedicated to provide a specific
> > service for a kernel client. So add a private login method for kernel
> > clients and disallow user-space to open-session using this login method.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  drivers/tee/tee_core.c   | 6 ++++++
> >  include/uapi/linux/tee.h | 2 ++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index 0f16d9f..4581bd1 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -334,6 +334,12 @@ static int tee_ioctl_open_session(struct tee_context *ctx,
> >                       goto out;
> >       }
> >
> > +     if (arg.clnt_login == TEE_IOCTL_LOGIN_REE_KERNEL) {
> TEE_IOCTL_LOGIN_REE_KERNEL is defined as 0x80000000 which is in the
> range specified and implementation defined by the GP spec. I wonder if
> we shouldn't filter the entire implementation defined range instead of
> just this value.

Agree. Will rather check for entire implementation defined range:
0x80000000 - 0xFFFFFFFF.

>
> > +             pr_err("login method not allowed for user-space client\n");
> pr_debug(), if it's needed at all.
>

Ok will use pr_debug() instead.

> > +             rc = -EPERM;
> > +             goto out;
> > +     }
> > +
> >       rc = ctx->teedev->desc->ops->open_session(ctx, &arg, params);
> >       if (rc)
> >               goto out;
> > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > index 4b9eb06..f33c69c 100644
> > --- a/include/uapi/linux/tee.h
> > +++ b/include/uapi/linux/tee.h
> > @@ -172,6 +172,8 @@ struct tee_ioctl_buf_data {
> >  #define TEE_IOCTL_LOGIN_APPLICATION          4
> >  #define TEE_IOCTL_LOGIN_USER_APPLICATION     5
> >  #define TEE_IOCTL_LOGIN_GROUP_APPLICATION    6
> > +/* Private login method for REE kernel clients */
> It's worth noting that this is filtered by the TEE framework, compared
> to everything else which is treated opaquely.
>

IIUC, you are referring to login filter in optee_os. Change to prevent
filter for this login method is part of this PR [1].

[1] https://github.com/OP-TEE/optee_os/pull/3082

-Sumit

> > +#define TEE_IOCTL_LOGIN_REE_KERNEL           0x80000000
> >
> >  /**
> >   * struct tee_ioctl_param - parameter
> > --
> > 2.7.4
> >
>
> Thanks,
> Jens
