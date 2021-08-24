Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC10D3F5B3A
	for <lists+linux-doc@lfdr.de>; Tue, 24 Aug 2021 11:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235743AbhHXJsB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Aug 2021 05:48:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49173 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235797AbhHXJsA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Aug 2021 05:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629798435;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=byOliS/hAlH982j95uoj9FjiMsaJUQkzdYQOZKOZeFM=;
        b=EpSjaKaORit2KBe35XMrcFltkhci8RVMV7pN97m/XqxyihAXn2G+tohwnWuAezzH4bp48M
        efD8nrjBZJ6yjreif7/fjD3rTeTWH11Tav+ryGfZYH2nwH71eP7mowc9EipQYYwbSrgdrl
        bEd+dJo0mtOfCZWeq1ubGE6hNpUgYI4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-IXULYnx4MNi_b9JMwIEARA-1; Tue, 24 Aug 2021 05:47:14 -0400
X-MC-Unique: IXULYnx4MNi_b9JMwIEARA-1
Received: by mail-ej1-f72.google.com with SMTP id c25-20020a170906529900b005c56c92caa2so2160715ejm.19
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 02:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=byOliS/hAlH982j95uoj9FjiMsaJUQkzdYQOZKOZeFM=;
        b=pc25thVqL5rC8/CZ7jsd7ehVSf+Nv7k9vDlicICq/6HqmnL2qiJT61Pv87B7TZGWWv
         wbJyvl5xS0LqjbO3X403Yw0vMqAWn32FjprL1bknmU73/vxkj9n5u6wG+Uc3K94+LSDh
         IjIwNSPNLVdhjjQCnBVMvPMczOQefa6Y1+fEe1JIBMpVAhMZF4JB/fvUBLeRsYvqLxsS
         SotixSd83DQ011051wZPdpb+nf3jiW0noYVHTBeitWuZNT3aOyTzlIP/HhhviSiCoiCa
         dHdwQKOtPA57oMCV/zfGFxuCDGX7TpMlaEzk+UgFMMRJIyqc/Q3Ek0kzTJexNrXIzdD9
         sU/Q==
X-Gm-Message-State: AOAM532rP3Zh+6BhFIYKRYcUGC4Y+MfFvlFyOUS0dw3IfAigEIjaufyD
        OHnW6zAE4V4uVT3SqvhZLb7MH6xMT1udIGznWiTITp94SSsGytsmvsDfJhwZVULJSoAcezNl8JN
        oWEZMfyB2U4PVGmLFCxPx
X-Received: by 2002:a17:906:3542:: with SMTP id s2mr40413088eja.379.1629798433290;
        Tue, 24 Aug 2021 02:47:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUO88Sc9irEBtMZmBbVQ8WcILdFFNEosAjyt1865+nkRLAobkOu3Zuf3KEOK5TLE4bRYLW2A==
X-Received: by 2002:a17:906:3542:: with SMTP id s2mr40413054eja.379.1629798433111;
        Tue, 24 Aug 2021 02:47:13 -0700 (PDT)
Received: from redhat.com ([2.55.137.225])
        by smtp.gmail.com with ESMTPSA id b18sm2800522ejl.90.2021.08.24.02.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 02:47:12 -0700 (PDT)
Date:   Tue, 24 Aug 2021 05:47:03 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Andi Kleen <ak@linux.intel.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
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
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Message-ID: <20210824053830-mutt-send-email-mst@kernel.org>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
 <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com>
 <d992b5af-8d57-6aa6-bd49-8e2b8d832b19@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d992b5af-8d57-6aa6-bd49-8e2b8d832b19@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 23, 2021 at 07:14:18PM -0700, Andi Kleen wrote:
> 
> On 8/23/2021 6:04 PM, Dan Williams wrote:
> > On Mon, Aug 23, 2021 at 5:31 PM Kuppuswamy, Sathyanarayanan
> > <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> > > 
> > > 
> > > On 8/23/21 4:56 PM, Michael S. Tsirkin wrote:
> > > > > Add a new variant of pci_iomap for mapping all PCI resources
> > > > > of a devices as shared memory with a hypervisor in a confidential
> > > > > guest.
> > > > > 
> > > > > Signed-off-by: Andi Kleen<ak@linux.intel.com>
> > > > > Signed-off-by: Kuppuswamy Sathyanarayanan<sathyanarayanan.kuppuswamy@linux.intel.com>
> > > > I'm a bit puzzled by this part. So why should the guest*not*  map
> > > > pci memory as shared? And if the answer is never (as it seems to be)
> > > > then why not just make regular pci_iomap DTRT?
> > > It is in the context of confidential guest (where VMM is un-trusted). So
> > > we don't want to make all PCI resource as shared. It should be allowed
> > > only for hardened drivers/devices.
> > That's confusing, isn't device authorization what keeps unaudited
> > drivers from loading against untrusted devices? I'm feeling like
> > Michael that this should be a detail that drivers need not care about
> > explicitly, in which case it does not need to be exported because the
> > detail can be buried in lower levels.
> 
> We originally made it default (similar to AMD), but it during code audit we
> found a lot of drivers who do ioremap early outside the probe function.
> Since it would be difficult to change them all we made it opt-in, which
> ensures that only drivers that have been enabled can talk with the host at
> all and can't be attacked. That made the problem of hardening all these
> drivers a lot more practical.
> 
> Currently we only really need virtio and MSI-X shared, so for changing two
> places in the tree you avoid a lot of headache elsewhere.
> 
> Note there is still a command line option to override if you want to allow
> and load other drivers.
> 
> -Andi

I see. Hmm. It's a bit of a random thing to do it at the map time
though. E.g. DMA is all handled transparently behind the DMA API.
Hardening is much more than just replacing map with map_shared
and I suspect what you will end up with is basically
vendors replacing map with map shared to make things work
for their users and washing their hands.

I would say an explicit flag in the driver that says "hardened"
and refusing to init a non hardened one would be better.

-- 
MST

