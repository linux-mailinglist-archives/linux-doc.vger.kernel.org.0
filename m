Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9993F6B7F
	for <lists+linux-doc@lfdr.de>; Wed, 25 Aug 2021 00:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238759AbhHXWAi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Aug 2021 18:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238716AbhHXWAh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Aug 2021 18:00:37 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFC0C061757
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 14:59:52 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id s11so21124985pgr.11
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 14:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jcFx0PZcA3f5x3kcuOE3FShtVPGcFTUcoRfnJMf2+WA=;
        b=kSoxnifXykQ6StIPlHX99aPNWQu+Di5Pk4x5o0CyBgJd9Hi73+uUta5pC3l9MPuDvg
         fBBpumEasAZeQZ2lG3NadMhBf/b9wuvINIZK2gj66HQh13cdNeZ+ZXIwck5oL9wu4os+
         US/+tqwCN2mSD+JCYRel2n+VEvcXsl1OGVQLjDfi4InNQ0bwty5/GVhAIxR6hITtGdLg
         B2dsfbm0W5uvRuyca+8kETN9jz+XRkeYZnbViXu4AvIglxlwUOQjCHGEfA65Iz68RZya
         QItoB3l4XDQYmoL1ZwgpumDwEUbCDGUDrdkJu1fa/f2rehIPRlYuMHbS58voDQNxtFcC
         VbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jcFx0PZcA3f5x3kcuOE3FShtVPGcFTUcoRfnJMf2+WA=;
        b=D5SP4x8dvKQwN8rv8AO5jIUPTwVz3btpWzo95n/GB5LTebPvAiuSScDVRLeCz+ePla
         gKgkVKjyWvop1kBVoAM8t5bGsBvVll072qVjnxnHDhngy73TWB2d8whts+I8Nb0lBNkm
         Q1i17UXEC0Th8TffbRgjvRNPYz4mCsX/YctQrvRdrdMoSrwjR7kEqOjO0O8hMT9gS9Z8
         ePwhd2i3TP2r4CT3SywXfbRPD7MAIp13h9FhBMgsy1T2rOba43teKnmZcI5bvIUC8Fq2
         odj4z9a+Bob6DantzAuM+fghQmMRrDj+qqiwJGZ3UIpiHHVjmqXjJyd/X0CdBhcVh7HN
         6xnA==
X-Gm-Message-State: AOAM533KEMb5gtdcDXaEPDlntKvgVo1OYJYToIvhJ+0vOw9YHc3aXGsX
        gHjth79UoZxq+okTT9sLKwxf5tWs13oPiWfVguFx/A==
X-Google-Smtp-Source: ABdhPJwK8XFV5db9UjT/ngKEY9JdyqfX6Fj3bAtuqrgUOWJJ8sDeTs4RTnwa4sK7JgHj0SxhjNCQ0rptoEHmw8RZG3Y=
X-Received: by 2002:a65:6642:: with SMTP id z2mr26520993pgv.240.1629842392235;
 Tue, 24 Aug 2021 14:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org> <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
 <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com> <CACK8Z6E+__kZqU8mVUnYhFc0wz_e81qBLO3ffqSDghVtztNeQw@mail.gmail.com>
In-Reply-To: <CACK8Z6E+__kZqU8mVUnYhFc0wz_e81qBLO3ffqSDghVtztNeQw@mail.gmail.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 24 Aug 2021 14:59:41 -0700
Message-ID: <CAPcyv4gmQeRNJJqxef5Vhws=v1g8+NtMjLBnJ1KR6rCWcd5VnA@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
To:     Rajat Jain <rajatja@google.com>
Cc:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Richard Henderson <rth@twiddle.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        James E J Bottomley <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter H Anvin <hpa@zytor.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 24, 2021 at 2:57 PM Rajat Jain <rajatja@google.com> wrote:
>
> On Mon, Aug 23, 2021 at 6:06 PM Dan Williams <dan.j.williams@intel.com> wrote:
> >
> > On Mon, Aug 23, 2021 at 5:31 PM Kuppuswamy, Sathyanarayanan
> > <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> > >
> > >
> > >
> > > On 8/23/21 4:56 PM, Michael S. Tsirkin wrote:
> > > >> Add a new variant of pci_iomap for mapping all PCI resources
> > > >> of a devices as shared memory with a hypervisor in a confidential
> > > >> guest.
> > > >>
> > > >> Signed-off-by: Andi Kleen<ak@linux.intel.com>
> > > >> Signed-off-by: Kuppuswamy Sathyanarayanan<sathyanarayanan.kuppuswamy@linux.intel.com>
> > > > I'm a bit puzzled by this part. So why should the guest*not*  map
> > > > pci memory as shared? And if the answer is never (as it seems to be)
> > > > then why not just make regular pci_iomap DTRT?
> > >
> > > It is in the context of confidential guest (where VMM is un-trusted). So
> > > we don't want to make all PCI resource as shared. It should be allowed
> > > only for hardened drivers/devices.
> >
> > That's confusing, isn't device authorization what keeps unaudited
> > drivers from loading against untrusted devices? I'm feeling like
> > Michael that this should be a detail that drivers need not care about
> > explicitly, in which case it does not need to be exported because the
> > detail can be buried in lower levels.
> >
> > Note, I specifically said "unaudited", not "hardened" because as Greg
> > mentioned the kernel must trust drivers, its devices that may not be
> > trusted.
>
> Can you please point me to the thread where this discussion with Greg
> is ongoing?

It slowed down to implement the "move to the 'authorized' device
model" recommendation. LWN has a good writeup (as usual) and a link to
the thread:

https://lwn.net/Articles/865918/
