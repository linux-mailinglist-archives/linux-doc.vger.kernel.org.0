Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F740101D69
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2019 09:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbfKSI3x (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Nov 2019 03:29:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33128 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725306AbfKSI3x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Nov 2019 03:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574152192;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H20VJbl/HlqoZLKxB2eEkiVm9bjunStGFexdv/rH5Wg=;
        b=JlwJQjRzOTfjV9DJ3akkmLjYDMyXdy+0J8dQBJOOyXwwy7jWgQA8ZeTAm+E6XqoqyO1InA
        V2nD+uurSIGtTn+TzGxjHOeKi8Wh6rdjjShty1M2djP6Wj9RxOkSfYPHLBfphOSsjGdv7E
        /3IhjgSF/TjwnaZl1KXmY1FWdNZiT+E=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429--kaEMQVVOz6OnewElBiS3A-1; Tue, 19 Nov 2019 03:29:49 -0500
Received: by mail-lf1-f69.google.com with SMTP id p4so5900516lfo.10
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2019 00:29:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LdTt3n+0i729FTDReSuLECgSQ4aS+lT8YABUAIgw7M4=;
        b=AfoSLdd8nnmUIXNPYQkcdfhHWMpZJJGb/NCzxS4+3ufBzQXqklGitT2DC50HL8fY7H
         rrlTKLGPbfRR9zjMeQHqwVneCOxE8z7Rz6MjbupB8+ZlerJDbtZu3WtBR7XNmoJwl6M5
         C4bVbrqyNxdi9Zz1GqfPLO6MWsnprlBjnRrsklg9h3HIcgUytTTeR3vQ7mvWXI2IbTpn
         r5iPdjxepa+1KSyf41v3ZKN74teuVAM7z5PoyZg6XHuPbVDcIX5hu8ryuoucIsXQww3f
         cu2Nn28+JwGcuOKvroIGboKGWx6urC0wuCCgKBitI2RlPXl/QFC4vXxzx0fHhLcjuxmx
         8tmQ==
X-Gm-Message-State: APjAAAWaPCvjMcVzblAbvK34Cg4yuneM1acB8ZkIwlrgHZK2IlwDQ0hS
        IsEZdGpnIfOu3S/9KpgJ5+Q96TYa4ZtvuDk5BkShSpp1vbXQy45KDstjn96DKg7VROoCdworfyY
        /2pc6T/dniWxMCY0TTBHFn11CLx/cqvpG2+nE
X-Received: by 2002:a2e:98c6:: with SMTP id s6mr2467932ljj.235.1574152187849;
        Tue, 19 Nov 2019 00:29:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqw2IC2bHi8fy/d2SRNiTEi36NRc3i9RixIH7XOkwEMkhAxGronTJF+riz7NT7kg7+QIn9WK1oeS0ClHOZKD/g0=
X-Received: by 2002:a2e:98c6:: with SMTP id s6mr2467897ljj.235.1574152187559;
 Tue, 19 Nov 2019 00:29:47 -0800 (PST)
MIME-Version: 1.0
References: <1573459282-26989-1-git-send-email-bhsharma@redhat.com>
 <20191113063858.GE22427@linaro.org> <CACi5LpP54d9DKW63G5W6X4euBjAm2NwkHOiM01dB7g8d60s=4w@mail.gmail.com>
 <20191115015959.GI22427@linaro.org> <CAJ2QiJJOSspLKRh+jRB_o0o9nmeAsiFKzxGJ8R0pYPRM4iptmw@mail.gmail.com>
In-Reply-To: <CAJ2QiJJOSspLKRh+jRB_o0o9nmeAsiFKzxGJ8R0pYPRM4iptmw@mail.gmail.com>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Date:   Tue, 19 Nov 2019 13:59:33 +0530
Message-ID: <CACi5LpO_fvzDiXP9+QLga_B7kozRRnE9ix4Xa=xvNx1Kvci=3Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
To:     Prabhakar Kushwaha <prabhakar.pkin@gmail.com>
Cc:     AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bhupesh SHARMA <bhupesh.linux@gmail.com>,
        Boris Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morse <james.morse@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>,
        Steve Capper <steve.capper@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Dave Anderson <anderson@redhat.com>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        kexec mailing list <kexec@lists.infradead.org>
X-MC-Unique: -kaEMQVVOz6OnewElBiS3A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 19, 2019 at 12:03 PM Prabhakar Kushwaha
<prabhakar.pkin@gmail.com> wrote:
>
> Hi Akashi,
>
> On Fri, Nov 15, 2019 at 7:29 AM AKASHI Takahiro
> <takahiro.akashi@linaro.org> wrote:
> >
> > Bhupesh,
> >
> > On Fri, Nov 15, 2019 at 01:24:17AM +0530, Bhupesh Sharma wrote:
> > > Hi Akashi,
> > >
> > > On Wed, Nov 13, 2019 at 12:11 PM AKASHI Takahiro
> > > <takahiro.akashi@linaro.org> wrote:
> > > >
> > > > Hi Bhupesh,
> > > >
> > > > Do you have a corresponding patch for userspace tools,
> > > > including crash util and/or makedumpfile?
> > > > Otherwise, we can't verify that a generated core file is
> > > > correctly handled.
> > >
> > > Sure. I am still working on the crash-utility related changes, but yo=
u
> > > can find the makedumpfile changes I posted a couple of days ago here
> > > (see [0]) and the github link for the makedumpfile changes can be see=
n
> > > via [1].
> > >
> > > I will post the crash-util changes shortly as well.
> > > Thanks for having a look at the same.
> >
> > Thank you.
> > I have tested my kdump patch with a hacked version of crash
> > where VA_BITS_ACTUAL is calculated from tcr_el1_t1sz in vmcoreinfo.
> >
>
> I also did hack to calculate VA_BITS_ACTUAL is calculated from
> tcr_el1_t1sz in vmcoreinfo. Now i am getting error same as mentioned
> by you in other thread last month.
> https://www.mail-archive.com/crash-utility@redhat.com/msg07385.html
>
> how this error was overcome?
>
> I am using
>  - crashkernel: https://github.com/crash-utility/crash.git  commit:
> babd7ae62d4e8fd6f93fd30b88040d9376522aa3
> and
>  - Linux: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t
> commit: af42d3466bdc8f39806b26f593604fdc54140bcb

I will post a formal change for crash-utility shortly that fixes the
same. Right now we are having issues with emails bouncing off
'crash-utility@redhat.com', so my patches sent to the same are in
undelivered state at-the-moment.

For easy testing I will share the link to my github tree (off-line)
[which contains the changes] as well.

Regards,
Bhupesh

