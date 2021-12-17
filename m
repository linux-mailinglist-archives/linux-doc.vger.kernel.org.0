Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD50647845F
	for <lists+linux-doc@lfdr.de>; Fri, 17 Dec 2021 06:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbhLQFJl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Dec 2021 00:09:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbhLQFJk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Dec 2021 00:09:40 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433E5C06173F
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 21:09:40 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id np6-20020a17090b4c4600b001a90b011e06so1550410pjb.5
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 21:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5W/bzSegDtUSc7k5vwSKDN1FXvdIqhDrrjznRYisGn4=;
        b=fZLDIXhJVef2Z1hy/ndF0dlu4HSaUi1iW5nk2bY9o8ImRzFTrPTpamqbr5GIm0q8Q9
         tUcD62tef/aGPGby7voFS2Q4O9znqtZC/dlM9iaxGmwtb/R2eP6YWbyrzMEgN/pn8tNb
         cZSUxTfTx49X31uuAc32d+RaZnez/sRMNgZWw3Hx/a9cWjIC7ZWpTak9H2I/+MNAeT8Z
         mFhMwoQgcS3zY8AQ/hEQNiqsm+9yVFEzT5aNz8vL0Lp9LbV2k9I4/ifJbb0nFQPSnB8L
         t4hsDHVqv9nYsL0s9rLLzFmjoOHmTTB41YmATNlKZKfTH2JYujVG8vbJqo3etSTBgXb+
         qA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5W/bzSegDtUSc7k5vwSKDN1FXvdIqhDrrjznRYisGn4=;
        b=vkNaMXW+knRBVC7s7UHLc6XLGgzgiZ9/gTYq8+b6vb6Brqg1J1QxC8ZxcL6APvvrI/
         uEQ4dAezlFExrGxqzqO3JutEjdPntcBDa0eIXl8HEPjS/RYD/LxNqiYhdNWaFLKe77QG
         l25H1py9aV8L5fOqNTROZzdhZoMlbZt2lAQuFmI66L/gnzus75UAMd1duQ+AAr8Hs8hV
         Q4Q31Q6S27caapC/zOllhG4YFevuTnDeclr2IIhabku9tkpOdZOWpRTjHUveHGMO370G
         HtupqRPIE9AcLor43jfZrn3nbIFqPyK5X0KRgpu8Nop87o+dkrLL+VE4oOUMuiFEHbJA
         B/Hg==
X-Gm-Message-State: AOAM531lhzHPvnhQcpU8EP5s4iXMFNpMDpT6Iu1XN8La5j6FuYWCyyWf
        oRiBIhhGPf/BfH/C7TjA/2K1midVDLWfhHfuAuGccA==
X-Google-Smtp-Source: ABdhPJyqJJLzM+AwEpjT5+YuXTNw45sYnJ1rOAs2JyCLtKmVCOv6nZdUpQdI0UOsjb5oyYBeB3Y59xD1nuBqwDvddq4=
X-Received: by 2002:a17:90b:4a0a:: with SMTP id kk10mr10274235pjb.198.1639717779421;
 Thu, 16 Dec 2021 21:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20211217044911.798817-1-sharinder@google.com>
In-Reply-To: <20211217044911.798817-1-sharinder@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Fri, 17 Dec 2021 00:09:28 -0500
Message-ID: <CAFd5g45qZjD33dBQtpqD3btNBNL6gL38=8YBBUGCAr9-ohgdpg@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Documentation: KUnit: Rework KUnit documentation
To:     Harinder Singh <sharinder@google.com>
Cc:     davidgow@google.com, shuah@kernel.org, corbet@lwn.net,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tim.Bird@sony.com, elver@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 16, 2021 at 11:49 PM Harinder Singh <sharinder@google.com> wrote:
>
> The KUnit documentation was not very organized. There was little
> information related to KUnit architecture and the importance of unit
> testing.
>
> Add some new pages, expand and reorganize the existing documentation.
> Reword pages to make information and style more consistent.

Thanks for all your hard work on this Harinder!

And thanks to everyone else (Tim, Marco, and David) for all of your
help on this!

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
