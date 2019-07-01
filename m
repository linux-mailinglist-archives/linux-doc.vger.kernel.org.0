Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77B62453CE
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jun 2019 07:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbfFNFNM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 Jun 2019 01:13:12 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33730 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbfFNFNM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jun 2019 01:13:12 -0400
Received: by mail-lj1-f195.google.com with SMTP id h10so1038201ljg.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2019 22:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aL7dOhWJv6Iy9PdIL/Yj/9BYl97GRWMi/xDEOn/xHjE=;
        b=MXRx/8mRNZMEm1bSJWyIQsqdjsBQQWYSqSNiLZbqiLy8NWqMXq9PwlieAW0h9A12ak
         /QfePvWZDuOYNpjekRDfBniymCHnr8jZ6wyvty7ZG7h+tkY4iUnvLjn4rf/3RpwKp4y7
         yENE6RqmnFanwpBzOT9bmTtrkiKD/rZKwo9AE5XqDN4hiTmgj6FpzDjKfz1dU/4bTGa/
         5hv6teKrtqHFtBVrtF7qGtc5jBuXkteMXOVAPJd7bKlJrHx6evSlDzru4Zugeyp3Kl1B
         fpiyzYSgJI1guXX+HAkkUTyRSKQmjmLyAQSCiVSywCIYV/d+sqdiFx2/yT92ARm6v5Se
         1KDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aL7dOhWJv6Iy9PdIL/Yj/9BYl97GRWMi/xDEOn/xHjE=;
        b=KHCJneae8GX1aleKWuc+5ti4/NSo1m+aHPXIoo9G8QXD5p7xfWLPuk7uTOnIUN5jQQ
         tiOf1WADuwcBCWAqXhvkjlFzWysMzqETLZc2iwr00Q6nVuZ0UfoN5wO6iRLfACkQ2OyM
         2jxX8sv6F/93qC/D3QnYAh+Gi2itE3N0vC2+pLUVMTpBbIwR2KY/twrQ+p6F1hCuv3LI
         B+WVs7SdqtFjepymlVdbz2YUUAvyuOwK48YPB//IAXWrW1XjBbFMj9WtJB6vhnEVr0UA
         xTnqnCi5jjgMIYDJhAjsryKUKYVML4+envPwmZ65LkfSQfRaknOfMrlIKZjCleZn27If
         vC3A==
X-Gm-Message-State: APjAAAVWZy/1woSBDG+FFcd+uw/352AOp0SjDA1ROil7vKHBnSjrbs1H
        V7/a+KCAObhwIKsqGecoUCKmaPMYvXfjORAtq2RsTA==
X-Google-Smtp-Source: APXvYqwbhE6azwYa5Cp42iogGaz/sbbBnyxJMg/6/oQvYNIvy2CVlb+gsNyQN1WDW1av7RwJ5ccPczeFkpq9mcT7YzM=
X-Received: by 2002:a2e:4b12:: with SMTP id y18mr2691836lja.238.1560489190498;
 Thu, 13 Jun 2019 22:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
 <1560421833-27414-2-git-send-email-sumit.garg@linaro.org> <20190613151257.GA18488@linux.intel.com>
 <20190613151714.GC18488@linux.intel.com> <20190613151746.GD18488@linux.intel.com>
In-Reply-To: <20190613151746.GD18488@linux.intel.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Fri, 14 Jun 2019 10:42:59 +0530
Message-ID: <CAFA6WYMjuEm8jwjteD1Wu2Uqs_O2jQuVyffqqpaNnSs0hksDMw@mail.gmail.com>
Subject: Re: [RFC 1/7] tee: optee: allow kernel pages to register as shm
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Jens Wiklander <jens.wiklander@linaro.org>, corbet@lwn.net,
        dhowells@redhat.com, jejb@linux.ibm.com, zohar@linux.ibm.com,
        jmorris@namei.org, serge@hallyn.com,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tee-dev@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 13 Jun 2019 at 20:47, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Thu, Jun 13, 2019 at 06:17:14PM +0300, Jarkko Sakkinen wrote:
> > On Thu, Jun 13, 2019 at 06:12:57PM +0300, Jarkko Sakkinen wrote:
> > > On Thu, Jun 13, 2019 at 04:00:27PM +0530, Sumit Garg wrote:
> > > > Kernel pages are marked as normal type memory only so allow kernel pages
> > > > to be registered as shared memory with OP-TEE.
> > > >
> > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > >
> > > Just out of pure interest why this was not allowed before?
> >
> > Please spare me and ignore that one :-) Obviouslly because it
> > was not used.
> >
> > Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>
> Actually,
>
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>

Thanks.

-Sumit

> /Jarkko
