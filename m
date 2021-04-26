Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB58A36AA07
	for <lists+linux-doc@lfdr.de>; Mon, 26 Apr 2021 02:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbhDZAcU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 25 Apr 2021 20:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbhDZAcT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Apr 2021 20:32:19 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0120AC061761
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 17:31:38 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id m7so51196374ljp.10
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 17:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xiJzJOLdknIj0RBYTk/1dN6htHjhW+TONZdztDGFbBU=;
        b=Jdq7oZq6fxDOqg46MRmtQhPd4SrRlEoVknjUuOCN8BcuzP0XNt6vzVqFCgtk1RQnDo
         aoNcId528WptBW8I/GRW0hTa2aXzAWWFwChG0KT+nxIMCls5G27DWJ1JE6OnT+o+2yLV
         aQqNBLsysaitWjvDbKKJq91G8PTL4sGca2FUlg4KbpmK5vpAvTqmOQ/bOFj6yLDG/9mg
         xjcfvDF0r9YdV+2/oWeKiDvthYWFkTUor+1dsPncf5EHnm3RR1SVKQAGE8Nxv0eVODnN
         kn5XxNw2deklLmJjDafIhLdW0X2KtTmQhB1X51MPIrl0AaDBNZ16CsRhDmLQ7Rh7W3o8
         lesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xiJzJOLdknIj0RBYTk/1dN6htHjhW+TONZdztDGFbBU=;
        b=Uin9T65m2TSQiQSgHyETT/PJ27Ccm7Qx4VitCqSDZW5h7pqxFtDRV98tj4itBLxlEa
         ASWnPj8XOv9nWBRME3sX71zV2jFeMsNH10WtLmpOB/AE1CVY80OMvg+rkAuF1fDSEoYg
         ovhEdkI0lhuTC+ow8+smE62mg54wgTfA3gksZreoVDNFQEZu6dtM4rZZmBYBn7Hqnipv
         vwklRHXDnPVDnnbJxJAKEENFllPQhwRwknRZ7QpjzlkxXsTHIK+3+3E6ZOAYsuAu/vI5
         WVK4+DpIYu82zkbkZVmKiqFVTOBAblAiYzSkCb+YgIP5CBZmj7xSpse3i16q4WqBTqJ6
         ZmfQ==
X-Gm-Message-State: AOAM530FvZMCjzHV/7UnPTjOhLYenjS0YKNHMzV+JORD5VkyvL1NqS7V
        cyULKsv0H1xDMmqe6OP1M28HOwuzImCK28eXaZiLXQ==
X-Google-Smtp-Source: ABdhPJzMJggL0ZBTNgft14ZUf0CVG/24WpdjGgjRupl3gpl/UhKK6SN9IOAxYxBKJAnZm1R2/rMVeGJ9kPNWkYsj1cE=
X-Received: by 2002:a2e:a54c:: with SMTP id e12mr11354812ljn.326.1619397097310;
 Sun, 25 Apr 2021 17:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
In-Reply-To: <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Apr 2021 02:31:26 +0200
Message-ID: <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 22, 2021 at 11:29 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:

> > But as subsystem maintainer I'd like a clear picture of this wrapper
> > overhead, what does it usually entail? A typical kernel API has
> > vtable and a few variables, not much more than that.
>
> If you mean runtime-overhead, i.e. performance, it should be very
> small or even zero. It should be possible to perform LTO across
> languages too.
>
> If you mean source code overhead, or cognitive overhead, then it is
> quite a bit, yes. Please see below.

Yeah that is what I mean :)

> I hear you! I do not think it will take decades for kernel developers
> to get up to speed, but I agree that having some help/backup is a very
> good idea in the beginning.
>
> Our hope is that, if Rust advantages prove themselves, then it will
> the subsystem maintainers the ones that will want to create and
> maintain the wrappers so that drivers in their tree are easier to
> maintain and less prone to mistakes ;-)

I am not really convinced that (leaf) drivers is where Rust will
help most.

As I mentioned in my mail to Wedson that I think things like network
protocols that deal with abstract entities will have more "pure code"
(not deal with machine registers, just RAM memory).
File systems would be another example.

I think the Rust proponents should be open to the fact that their
work will eventually depend on themselves or someone else
fixing a working compiler for the maintained architectures in
the Linux kernel one way or the other, so they will be able to
work with Rust project anywhere in the kernel.

For example m68k is not going away. Avoiding this question
of compiler support, just waiting and hoping that these old
architectures will disappear is the wrong idea. The right idea
is to recognize that LLVM and/or GCC Rust needs to
support all these architectures so they can all use Rust.
Someone needs to put in the effort.

After all fixing that compiler support is an insignificant amount
of work compared to what Rust in the core kernel will be.

Yours,
Linus Walleij
