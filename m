Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4C41FFAC8
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2020 20:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728736AbgFRSIq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 Jun 2020 14:08:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:38242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgFRSIp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Jun 2020 14:08:45 -0400
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D5F920B1F
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2020 18:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592503724;
        bh=VDvkimlQQCU+ioG4SXcIgHDcfTL7wrOO5MqRdGAfTEc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VDPQQlHkkM5i7l2kUKNI3MZru9Hp/OEKTgL7dxlE68FMj9Xzb952t7xKajdZ5SW1F
         67v8OG9mr/+GMjo/Iez1PiQZGTTLLHWmcny1nYd5LUyvWZ/cfnvPhUjeOJSxWs9mGn
         RTCRHkEvdwbjk8Afg+JbzEO44IrmsOmHtKs/MCQ0=
Received: by mail-wr1-f52.google.com with SMTP id l11so7064798wru.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2020 11:08:44 -0700 (PDT)
X-Gm-Message-State: AOAM533Y6D1TIgxO9srXp3ll2Y6U3qsutJOW+khBVxzzef1MRPG7OB8n
        DouUAMMUhGXtumXkgUf/6BY3FuyZadvBgHiKBtuvjQ==
X-Google-Smtp-Source: ABdhPJw7YsDCl7a6FegpiSYaFR158cNBqlrY602aDxsroQsKqdP4wg9rDAsttwiUfnxjK2ohkfMSeFkcIXvdyX06Mdk=
X-Received: by 2002:a5d:49c5:: with SMTP id t5mr6061347wrs.18.1592503723269;
 Thu, 18 Jun 2020 11:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200528201402.1708239-1-sashal@kernel.org> <874kr8cv9i.fsf@nanos.tec.linutronix.de>
In-Reply-To: <874kr8cv9i.fsf@nanos.tec.linutronix.de>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 18 Jun 2020 11:08:31 -0700
X-Gmail-Original-Message-ID: <CALCETrUeRPVq2n0UVuZZ9WTugH8Aetdw5rY+cccCT_=YgnJ_og@mail.gmail.com>
Message-ID: <CALCETrUeRPVq2n0UVuZZ9WTugH8Aetdw5rY+cccCT_=YgnJ_og@mail.gmail.com>
Subject: Re: [PATCH v13 00/16] Enable FSGSBASE instructions
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Sasha Levin <sashal@kernel.org>,
        Andrew Lutomirski <luto@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        X86 ML <x86@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Tony Luck <tony.luck@intel.com>,
        "Bae, Chang Seok" <chang.seok.bae@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 18, 2020 at 7:18 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Sasha,
>
> Sasha Levin <sashal@kernel.org> writes:
> > Changes from v12:
> >  - Reformat the series to be closer to the reverted codebase for easier
> >    review.
> >  - Drop a few of the changes introduced in v8 and v9.
>
> I've pushed the lot out to
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/fsgsbase
>
> Thanks for taking this up!
>

Is there a plan to deal with:

        /*
         * This function has some ABI oddities.
         *
         * A 32-bit ptracer probably expects that writing FS or GS will change
         * FSBASE or GSBASE respectively.  In the absence of FSGSBASE support,
         * this code indeed has that effect.  When FSGSBASE is added, this
         * will require a special case.
         *
         * For existing 64-bit ptracers, writing FS or GS *also* currently
         * changes the base if the selector is nonzero the next time the task
         * is run.  This behavior may? not be needed, and trying to preserve it
         * when FSGSBASE is added would be complicated at best.
         */

in arch/x86/kernel/ptrace.c?
