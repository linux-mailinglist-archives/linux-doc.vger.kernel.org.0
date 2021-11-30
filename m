Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A60C463E97
	for <lists+linux-doc@lfdr.de>; Tue, 30 Nov 2021 20:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245721AbhK3T3N (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 30 Nov 2021 14:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244892AbhK3T3I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Nov 2021 14:29:08 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CEDC061574
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 11:25:47 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id e3so91269945edu.4
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 11:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mUe1etHTeAh3A2xC3mRSG89zpXC1bCrhy9fylkJ/lXk=;
        b=l7SSwJJsh3Dg1tolC6JDaZE65vqBeF+DWW4JEX7SK8u/Bc5JOX45lyYGuxXNt4ohmt
         dzLJRk/olbLvNfAQAuAaisTAxYTL4LSzmKlMzxpWU3KQMq+cWhyVPpQ0aR/x+V0GF9F+
         D1dTINT6K6t9wQL4kIUh7i4XMhHNMubDqTsYP+/nmsYJ3GUryuRtov5FeXoBhCCjbYMe
         YlGIFHCLGRvsejevuXFXpcGY/Ij9cn8Q+cGhIsaCcu6Y8gAqEsZS5FRxoKBVtoqZ6JgB
         hxmNrIdNUtvqmi2U+QHr6lsXfqQuJDHMS6WValSK1DBjBemRLAvx6QNEeB35xWNZaIid
         snkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mUe1etHTeAh3A2xC3mRSG89zpXC1bCrhy9fylkJ/lXk=;
        b=h9Bcxe8xQuxsde1MViuDRHd2TOb0xw9JSPYwXHPHAsjtXi2fX2KnzemcTH6hnNpLj3
         H1Q/z3qxp48Xcf0gbOwihh/vMWlRrpserr89VYhyJoizUt24VyoHvl/DiQdRb7VQQhzj
         Ki7ycUB4LG4CactStUtFN57NjqJFDVe6M8v4hKO6WSRIE5S8SsGyGJAoTvZCOwL65hlo
         iabhiC4hVPwBW8bXblFQuylh3tSdmaDwqUxJDDMnvi299AGuyZqGtNVKhgwCCFEoZ4XJ
         C/H+v/h1e90eqoib1Z7v2clQGI2CbhUoqVXu5rBqqANXDE14e7mLwuoK9FtKDd0pUu2I
         aYRQ==
X-Gm-Message-State: AOAM5316BlnxK3JNwvdLmMl7WMrBtkNMQEHHPXtBH/8Jr7WXOMwvtsee
        ox+pTj8pV4n5l2ngfFSZeDF0nAwJO78PMbftBmN3gA==
X-Google-Smtp-Source: ABdhPJxTaOkNeqHy63NuVfX5HVhSVZk5X1GCRN36lztXyJE++faH21KWi2lLIRlKAgTyh5rggcRNpmE6mEV6Y+GzSlA=
X-Received: by 2002:a17:906:2b12:: with SMTP id a18mr1206115ejg.254.1638300345509;
 Tue, 30 Nov 2021 11:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20211123214814.3756047-1-pasha.tatashin@soleen.com>
 <20211123214814.3756047-3-pasha.tatashin@soleen.com> <6d82e674-76dc-f3b0-2e53-a92eeb249eff@gmail.com>
 <CA+CK2bAX2XmMrt9RBGiUV7LG_sbpB7ov6bxMVjr5FSBVirE1CA@mail.gmail.com>
 <7d339956-27fb-4eb6-bd73-791807ddef56@gmail.com> <9e0014e8-e251-360c-ad82-334ad0f28303@gmail.com>
 <CA+CK2bDiWc2y=CW6d=6raaf9Haq2vuWQDTQZ-aAyLDdpq5aQPQ@mail.gmail.com> <aee858af-f0f7-1da6-5976-cf0057092afa@gmail.com>
In-Reply-To: <aee858af-f0f7-1da6-5976-cf0057092afa@gmail.com>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 30 Nov 2021 14:25:09 -0500
Message-ID: <CA+CK2bBQE0-Tw0XhAyPm0R3hsCkUqN7Oij4vNEDfut80KBxGZA@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm: page table check
To:     Fusion Future <qydwhotmail@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Paul Turner <pjt@google.com>, weixugc@google.com,
        Greg Thelen <gthelen@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, masahiroy@kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE" <x86@kernel.org>,
        frederic@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Nov 28, 2021 at 9:57 PM Fusion Future <qydwhotmail@gmail.com> wrote:
>
> On 2021/11/29 00:57, Pasha Tatashin wrote:
> > This commit by itself would not cause the freeze or BUG_ON(), but the
> > next commit which enables it on x86 arch might.
>
> Yes, you are right. At the commit
> "[1e67abff1820489435aad3fcf258708c21c283ef] x86: mm: add x86_64 support
> for page table check" my system starts to experience the freeze.
>
> I can now reproduce the freeze by following the steps below:
>
> 1. Open 20 YouTube video pages, and a YouTube Music page.
> 2. Play music in the background. (The step can be omitted)
> 3. Run `git clone
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git ln`

Thanks, I found a reliable way to reproduce this problem on my workstation:
reduce the amount of physical memory to 4G via memmap kernel
parameter,  and use a script that starts chrome browser with 20 tabs
each pointing to a youtube.com page.

I will send an update after root cause.

> git will never successfully clone the repo because the system will
> freeze during the operation.
>
> I also tried adding `page_table_check=off` to the boot option but still

I will add support for page_table_check=off even when
CONFIG_PAGE_TABLE_CHECK_ENFORCED is set

Thanks,
Pasha
