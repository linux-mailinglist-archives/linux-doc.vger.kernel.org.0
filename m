Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F013C25816E
	for <lists+linux-doc@lfdr.de>; Mon, 31 Aug 2020 20:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgHaS7S (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 31 Aug 2020 14:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbgHaS7R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Aug 2020 14:59:17 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD136C061573
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2020 11:59:16 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 31so1132253pgy.13
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2020 11:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s3gvdeLLkLMj6sDEkcPB4/tK2fV8l3UXQaxnpiPHbxk=;
        b=f5jljmQ/Tzl+5/kQmFEzbbT1v88qGePnYEgl5N300ns0wx1IJw8gl5o8we5HmlsNUO
         9OrnCQ5fnN7H0lecCflIqYgo4ZUYtfwMqXbVvCJBuNQ1mJd81VwgdMaQcZbmrLK8giNW
         2Vo8kgN9OndT7YWtpzTDv+UrOpYqludP78QE72eW5t6EduVt1DYYwD4f9gxj96skYZgU
         2RuAvVCUUbVW/1OVhcepCZVYJkSeyH/GIwRjOjpPuppwNQvYBVoEcdmCoC7AymmQrk09
         DwGmrHquG9eF6ITSLT4smoZd7wD0MueAzRjsBbzuZu191A3lkHuWi7MG7JgGaoRMly6m
         D3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s3gvdeLLkLMj6sDEkcPB4/tK2fV8l3UXQaxnpiPHbxk=;
        b=sjr+wjIqhQBWF9zbTmqutVWNDwDvi9CDrc3YcQVHDoj3g9GUESq8LJT+xuXl4EvHrL
         xZYmHt+MjIiH+9uVIrL6HrEidEsbYV26PXTwZEvPWUuAP971bUuJURoHROp6HI5EGlti
         mEoaZ+a6rOfD5meSlqytDOyHYOKr/i7QhrGM4mpI4uzR3CEtinFgdncpx0iHhdNmTWJd
         eLQ5rQKlKEII/ydfCSGiTBT3wn5VMKxrUZRBhU37eLJRqBGYA+P7LIUgvYzdpUNEhZbe
         mnKiDXUDwsXRT4pLpwWa6BjtqpEFB1dlz8lePtFSbe2RY4Niq/fnOoJ+4H1g2YDUJgyP
         1wbw==
X-Gm-Message-State: AOAM530KeN9nLUJxotrN7NahnJJAWO/Bul15VgXIv8lR0Az40y6pL3f9
        AdbZxoLKfcWl8tWHZk+2BZnEM7dgUhBHQwfIWaAeZQ==
X-Google-Smtp-Source: ABdhPJxZdxUKTq0Gc3Lf2zRRjEfPyDXVNK6R9eATwLEDG7sxtcGbnWRGarQFHP/X/n7i91gf4i6j4xi1w7XQ868l7qg=
X-Received: by 2002:aa7:8e8f:: with SMTP id a15mr2350429pfr.135.1598900355921;
 Mon, 31 Aug 2020 11:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200831171733.955393-1-alinde@google.com> <20200831113238.b6b38076bb02076458592a3d@linux-foundation.org>
In-Reply-To: <20200831113238.b6b38076bb02076458592a3d@linux-foundation.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 31 Aug 2020 20:59:04 +0200
Message-ID: <CAAeHK+z9xVfW_W1u=ZatPXQ+2UH9khuW2yM96BcgLmm8ENzymg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] add fault injection to user memory access
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     albert.linde@gmail.com, Borislav Petkov <bp@alien8.de>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Zijlstra <peterz@infradead.org>, akinobu.mita@gmail.com,
        "H. Peter Anvin" <hpa@zytor.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Marco Elver <elver@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Albert van der Linde <alinde@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 31, 2020 at 8:32 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Mon, 31 Aug 2020 17:17:30 +0000 albert.linde@gmail.com wrote:
>
> > The goal of this series is to improve testing of fault-tolerance in
> > usages of user memory access functions, by adding support for fault
> > injection.
>
> Does anyone actually plan to use this feature, on an ongoing basis?
> It's the sort of thing which the various test robots could exploit, but
> I'm not sure that they are using fault injection?

Hi Andrew,

syzkaller/syzbot is using the existing fault injection modes and will
use this particular feature too.

Thanks!
