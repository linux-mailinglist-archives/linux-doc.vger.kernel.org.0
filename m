Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65C742AD17
	for <lists+linux-doc@lfdr.de>; Tue, 12 Oct 2021 21:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233398AbhJLTP2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 Oct 2021 15:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233456AbhJLTP1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Oct 2021 15:15:27 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45C5C061764
        for <linux-doc@vger.kernel.org>; Tue, 12 Oct 2021 12:13:25 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id qe4-20020a17090b4f8400b0019f663cfcd1so2648560pjb.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Oct 2021 12:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x0Pu5SkQy434ZkX51MnktY5ssWOIrsLEYRF7ntLLX9U=;
        b=0jctKiGZ96Dsvad5OoCsdnFQ90uhqg1CiK1Bu0TfnxVnL6DCcOHWSNEaxF2Q506KkR
         4HtMZYOUQL39cLxqSpXNajGrgxx+RmvKyhX9L62DSpa2FFz1DwK1pXjqe0gPg6jzDMKu
         WkA7Fi0xfKpYSR5vgaxJseL9c8Tv3DOZBBhmW2kjevu4TlUZ1AYGMy6keZGF9sAknJ9l
         hDA7MVJBkGzifUBk8/e/fmnFd3BwShLwj4oAUm8kr8DgAxB3H+Xy66k+IPlhE69rsxE+
         etyGZvxl/HxhIrzvur1lJ5f+acFnxyUDpgERXDK7KG94rmnmm7OmQdlxHrmjvC6jSJ+W
         hxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x0Pu5SkQy434ZkX51MnktY5ssWOIrsLEYRF7ntLLX9U=;
        b=jpM65jSjR6D++1QSAXSYAx9CxEYp3E8ngco3eizz1rQRTDHpocD4cLtjh/cRw+ZqKS
         2kYZEMGvAQmucSApctRtNm31y200urI0drUKImDOpb8y6/oLK3NDeb3AC5ovHkasRH7S
         c93COIDC2pYtcagElTpT418S2z01RKoJzFCn+fhlYwbCCkv3C1TJj77e6zoYJZtdE+Gl
         Dqn85+ke3VXA+S/N2Fn7EpnU4ZdRSySEHVAMqJsG7rYB9VYpUvPkSvhGT3DIjVRznQ0Z
         /jlkbotvsnjWCIY04fwaMHwP2ELmy+koXrPji9gAWnXxqSoO26xRUlJ0y0nEo8Vphjdg
         AA3Q==
X-Gm-Message-State: AOAM531oZINUmrFG/qxIRXSDlJaXf1kYIFoy5kB7XTFVcZlQOcjR1mIw
        /d2OWbtYuubZtS41Vqcj2R83L65um7z80VJoGlotmA==
X-Google-Smtp-Source: ABdhPJyNOix5cZDMBclXmOSXO+RM6EpABwDw+QW/CroDmQMvsjA4/EVROp8ApuvNtORV3RBVktyntd/Xd2M0AJ958a8=
X-Received: by 2002:a17:90b:350f:: with SMTP id ls15mr8210876pjb.220.1634066005117;
 Tue, 12 Oct 2021 12:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org> <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com> <DM8PR11MB57501C8F8F5C8B315726882EE7B69@DM8PR11MB5750.namprd11.prod.outlook.com>
 <f850d2d6-d427-8aeb-bd38-f9b5eb088191@linux.intel.com> <DM8PR11MB57505C520763DF706309E177E7B69@DM8PR11MB5750.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB57505C520763DF706309E177E7B69@DM8PR11MB5750.namprd11.prod.outlook.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 12 Oct 2021 12:13:13 -0700
Message-ID: <CAPcyv4g8VjbMaVnXXyWVh8tXNakO9FmDXfANJmPmgvDfZX-OBA@mail.gmail.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(), pci_iomap_host_shared_range()
To:     "Reshetova, Elena" <elena.reshetova@intel.com>
Cc:     Andi Kleen <ak@linux.intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "Lutomirski, Andy" <luto@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Richard Henderson <rth@twiddle.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        James E J Bottomley <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter H Anvin <hpa@zytor.com>,
        "Hansen, Dave" <dave.hansen@intel.com>,
        "Luck, Tony" <tony.luck@intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 12, 2021 at 11:57 AM Reshetova, Elena
<elena.reshetova@intel.com> wrote:
>
>
> > I suspect the true number is even higher because that doesn't include IO
> > inside calls to other modules and indirect pointers, correct?
>
> Actually everything should be included. Smatch has cross-function db and
> I am using it for getting the call chains and it follows function pointers.
> Also since I am starting from a list of individual read IOs, every single
> base read IO in drivers/* should be covered as far as I can see. But if it uses
> some weird IO wrappers then the actual list might be higher.

Why analyze individual IO calls? I thought the goal here was to
disable entire classes of ioremap() users?
