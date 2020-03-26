Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF946194999
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2020 21:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgCZUyl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 26 Mar 2020 16:54:41 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45734 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgCZUyl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Mar 2020 16:54:41 -0400
Received: by mail-io1-f67.google.com with SMTP id a24so6993509iol.12
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2020 13:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qIpHqCITSlYq28ZrJK7yCjm9889luVYT0dj9kJsGITk=;
        b=Uon02VISKzAqEHBzK9cAGSYsu3Qc5mvKQe0UNv3bzOXpocEW541GOj4o7jeU1eFLEf
         FCfPXPngZNSGwcn7DzfGZFny+hmAQxoGR0gOGQvVoQ/SHcrWe7LB/UV2tgP8bQQwZLXk
         qv1cACG8+rK+gl+lqDtENPtWyDRQ2noPT+Ow5TPxoSNoWghNoB8jZT+3NOkoOl2aUH1P
         XqkVKvWIumZ9IFErd1dVxFSxVXxMtebypV6OuVjjlOG6dBn7tv/pFEamtOBLcRGG65bs
         zkvfjglNTrwHmkbRiXA6JddZPeT4I/iO/e7MEFB1N/1Uc5420lVVQivh9f5LhzReltxl
         N44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qIpHqCITSlYq28ZrJK7yCjm9889luVYT0dj9kJsGITk=;
        b=MA4auFCmhkdQBDO6ZR3wBXmixTYisDhEVJjElJuIM2W6ULHypMFz1choPoC2KwmNso
         rqLn5AvTz56uyE7+LIm4hEHNkJis9l5JLtST8xC+xG1+wHg1JYgNW2/CUS3OfnI5nqwm
         F5UAN4DlF9WgpeWCjIozhyIZEoz5O/JG/oo0Zervqr0Jm27ZxpRiYWw/fN+7CzBJwBwS
         dJp26QMjvvi8t915QX239+4UOv/korLJUFYtYjgK0BiusWiMpD3ifv6kBKbzorpwHW7v
         63Fx3OaZt3N/s3hiZkeKq142XssGhEO051Rvv7Cujwf+kNQrME9b7yo3T/xckFqXn8kD
         ZThA==
X-Gm-Message-State: ANhLgQ2i+PbDTKMjqmDaPRVRDAG8qgAGeUqpE4aLGdwbey71jeZZjOTX
        0uGIb3ThQYUtYDT0j+cifnsXsKUjaDB1vaUHAAOILi57
X-Google-Smtp-Source: ADFU+vtevMH/ScxX0+FfrRrjbtXu5Z8zBAJlGo7wIoSFADSBRTftgXQxvct5MOt73cc2XvWulS4HQ++eUxWzTIUAxS4=
X-Received: by 2002:a6b:580d:: with SMTP id m13mr9737394iob.59.1585256080560;
 Thu, 26 Mar 2020 13:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200325194317.526492-1-ross.philipson@oracle.com>
 <CACdnJut56WuqO=uLff0qy1Jp=C6f_sRxLpRBsrzb6byBsFYdCg@mail.gmail.com> <bacbc25a-c724-d2fd-40bd-065799cd6195@apertussolutions.com>
In-Reply-To: <bacbc25a-c724-d2fd-40bd-065799cd6195@apertussolutions.com>
From:   Matthew Garrett <mjg59@google.com>
Date:   Thu, 26 Mar 2020 13:54:28 -0700
Message-ID: <CACdnJusRATYv3Une5r14KHJVEg5COVW9B_BNViUXjavSxZ6d5A@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] x86: Trenchboot secure late launch Linux kernel support
To:     "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc:     Ross Philipson <ross.philipson@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        linux-doc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, trenchboot-devel@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 26, 2020 at 1:50 PM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
> It is not part of the EFI entry point as we are not entering the kernel
> from EFI but I will address that further in my response to Andy. The
> expectation is that if you are on an UEFI platform then EBS should have
> already been called.

Ok. In that case should the EFI boot stub optionally be calling this
instead of startup_32?

> With respect to using the firmware's TPM code, one
> of the purposes of a TCG Dynamic Launch is to remove the firmware from
> the code being trusted in making the integrity measurement of the
> kernel. I trust the firmware to initialize the hardware because I have
> to and it does give a trust chain, aka the SRTM, that can attest to what
> was used during that process. When the OS kernel is being started that
> trust chain has become weak (or even broken). I want a new trust chain
> that can provide better footing for asserting the integrity of the
> kernel and this is what Dynamic Launch gives us. I would like to think I
> did a fair job explaining this at LSS last fall[1][2] and would
> recommend those that are curious to review the slides/watch the
> presentation.

PCs depend on the availability of EFI runtime services - it's not
possible to just assert that they're untrusted and so unsupported. The
TPM code is part of boot services which (based on your design) are
unavailable at this point, so I agree that you need your own
implementation.
