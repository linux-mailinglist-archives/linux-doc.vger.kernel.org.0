Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D722C6B83
	for <lists+linux-doc@lfdr.de>; Fri, 27 Nov 2020 19:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbgK0SXZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Nov 2020 13:23:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732369AbgK0SXW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Nov 2020 13:23:22 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407EBC061A04
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2020 10:23:22 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id 142so6840284ljj.10
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2020 10:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e5KHpDtt5i2rR9LdUm+DCPfd8QCddCnGgU8lKoXRsc0=;
        b=k13XGK60aqGF8P+LZ5njqN9LkrUfUD2db3KBZtvlM/8c/m+Ar7Iaj3L9tzWBo8M07X
         SLsANqBnyZqRR6Y4soOGO3BasvLtrGteYICfbknYu6+sh6RI2ecZi3k8piaxa2oAkZ9r
         3r0E9YxnkK40upO2J0VCON60VP9A2pQg8FXc5xnBv6kNKFodimMOFDHidiR6CzUsbEFR
         loPKKh70S/Se5tUMMtUFbZCKu5Z+hj/H3WQX43nUvJytv6dzolyzWwSFRv5P6nDBJLoK
         qXUUk5BYiEe7ku9T/ezKgm1a+BRdDMxdD7inERGIrtnl3U0qHDisct5Mn5LnHgoH6V+P
         18tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e5KHpDtt5i2rR9LdUm+DCPfd8QCddCnGgU8lKoXRsc0=;
        b=izzfOYMvanKhE8+lNJrhGKANbKpRuZI7jrPJgFOCS4qqADIfJBwLaUOMue5HtT8JWS
         fnqeJU0byE/advkn/21uru3MHmrELaGyA6SiOKx5D1WhB8z+cNHc6wAHY2AZanScknY6
         5iOZzR967cELM0Bs7khV+rIL14bmhdg3YKwhYKyEPhlKemJ1G6E3VnUJFzw2NvM4aB0x
         5mX/ZuzETJWnB0EyUyE6fS4XM0bVN9mpkms5qs/E1BIVgnshqYV1EaDgMa3Gh9ToVKGJ
         zx5J46suktz47+dam/rIEdtIKHYkJZJGGMyF2Tc6rd9OLdb3OHUjbEUyK3Du7+XIFL/w
         MrYw==
X-Gm-Message-State: AOAM530ve8xeZTMqcCyT/o6gRx7Bz7n6Bt2nYPzmDpxkeyZ5+KT3/f9Z
        5By/NVVlgkygqqv09oEeFO0MR5jTHlM4/AHL47g3/Q==
X-Google-Smtp-Source: ABdhPJws0SUY2VfCWZwO1KgOCMLdvLLRf++rtY0jADZAsBpXkmgj4FmHl+qbGYochUFxuoYBMzoAHyDIowR/TJhi40s=
X-Received: by 2002:a2e:9216:: with SMTP id k22mr3959253ljg.138.1606501400078;
 Fri, 27 Nov 2020 10:23:20 -0800 (PST)
MIME-Version: 1.0
References: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com> <CAG48ez2VAu6oARGVZ+muDK9_6_38KVUTJf7utz5Nn=AsmN17nA@mail.gmail.com>
In-Reply-To: <CAG48ez2VAu6oARGVZ+muDK9_6_38KVUTJf7utz5Nn=AsmN17nA@mail.gmail.com>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 27 Nov 2020 19:22:53 +0100
Message-ID: <CAG48ez13ZAAOVmA89PRKRqr9UezV2_bj8Q6_6sSPzcqfzbsuQQ@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/virt: vmgenid: add vm generation id driver
To:     "Catangiu, Adrian Costin" <acatan@amazon.com>
Cc:     "Graf (AWS), Alexander" <graf@amazon.de>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>, Willy Tarreau <w@1wt.eu>,
        "MacCarthaigh, Colm" <colmmacc@amazon.com>,
        Andy Lutomirski <luto@kernel.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Eric Biggers <ebiggers@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        "Woodhouse, David" <dwmw@amazon.co.uk>,
        "bonzini@gnu.org" <bonzini@gnu.org>,
        "Singh, Balbir" <sblbir@amazon.com>,
        "Weiss, Radu" <raduweis@amazon.com>,
        "oridgar@gmail.com" <oridgar@gmail.com>,
        "ghammer@redhat.com" <ghammer@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Qemu Developers <qemu-devel@nongnu.org>,
        KVM list <kvm@vger.kernel.org>,
        Michal Hocko <mhocko@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Linux API <linux-api@vger.kernel.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        linux-s390 <linux-s390@vger.kernel.org>,
        "areber@redhat.com" <areber@redhat.com>,
        Pavel Emelyanov <ovzxemul@gmail.com>,
        Andrey Vagin <avagin@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
        "gil@azul.com" <gil@azul.com>,
        "asmehra@redhat.com" <asmehra@redhat.com>,
        "dgunigun@redhat.com" <dgunigun@redhat.com>,
        "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[resend in the hope that amazon will accept my mail this time instead
of replying "550 Too many invalid recipients" again]

On Fri, Nov 20, 2020 at 11:29 PM Jann Horn <jannh@google.com> wrote:
> On Mon, Nov 16, 2020 at 4:35 PM Catangiu, Adrian Costin
> <acatan@amazon.com> wrote:
> > This patch is a driver that exposes a monotonic incremental Virtual
> > Machine Generation u32 counter via a char-dev FS interface that
> > provides sync and async VmGen counter updates notifications. It also
> > provides VmGen counter retrieval and confirmation mechanisms.
> >
> > The hw provided UUID is not exposed to userspace, it is internally
> > used by the driver to keep accounting for the exposed VmGen counter.
> > The counter starts from zero when the driver is initialized and
> > monotonically increments every time the hw UUID changes (the VM
> > generation changes).
> >
> > On each hw UUID change, the new hypervisor-provided UUID is also fed
> > to the kernel RNG.
>
> As for v1:
>
> Is there a reasonable usecase for the "confirmation" mechanism? It
> doesn't seem very useful to me.
>
> How do you envision integrating this with libraries that have to work
> in restrictive seccomp sandboxes? If this was in the vDSO, that would
> be much easier.
