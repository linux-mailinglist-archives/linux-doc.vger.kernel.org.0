Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF98C431A98
	for <lists+linux-doc@lfdr.de>; Mon, 18 Oct 2021 15:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbhJRNUI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Oct 2021 09:20:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55479 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231839AbhJRNUE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Oct 2021 09:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634563073;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MzTAOtwulDEmvfrOMqdp9kU77zBPM/IRO9XOnd+cufc=;
        b=Zzog55VI2G2Ibuy6CANigG/Q77iyfOtp8pVcRGZiUYhusYfqwNrowcR2msszISgJ6fF757
        nXG8C9ziKGNU2HQVFOLp5FOevznG+Iy5kB5MKNG61hgVXn2zmAS/YyC3QY1X2N4/pvKu6i
        BSEtNVghbgPHO0e9Tx40Y+jJGxT0eBQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-gBE6SAMVOMC33OmDs5Ms6w-1; Mon, 18 Oct 2021 09:17:51 -0400
X-MC-Unique: gBE6SAMVOMC33OmDs5Ms6w-1
Received: by mail-wm1-f72.google.com with SMTP id s22-20020a1ca916000000b0030dcdcd37c5so3174683wme.8
        for <linux-doc@vger.kernel.org>; Mon, 18 Oct 2021 06:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MzTAOtwulDEmvfrOMqdp9kU77zBPM/IRO9XOnd+cufc=;
        b=rQgYq7E60trSIKUEWr6h00JYaPSLVabM4MCmx2604vx7RMK4J5LtBYQzmksR08t5AY
         sXDpiTsCccqWtD+v6yfVVaqYrLGpBRh/PPK4NF0NBdlPFWJU/JECmVMXDXczcHF7PLp7
         BaCQsSsfFq2EihG0KrvV7PrWCKk6IGY3pEW9/b019PYJ7PDFPPnTfWK7d9R8A96aJfJe
         NT/kAwRxBJxKI2l0lmtQrSQpRQ0eMPNwCKSoMvtid2VJ6lf2jrHGZf/Cj7xQotvHlUFy
         59BdTWB/NSridFGm+rKEyVnBAw2TEKjwo0Or/YSR9qy8QOQGYQC+fjHQZYsS2Iyv4+gn
         i9Dw==
X-Gm-Message-State: AOAM533RhSC75M4IjXn+vALtsslvsWdv907erClht4Ns10K3HnYExzGt
        HNuye7iFsHoiy/i/XkSONaOcYaZoABwDAkchJwfm6DRiKGJCz86mOs3SKdD+NVS9/7W0a2XME2A
        o5gh2OGbtczsrmjR4pSCU
X-Received: by 2002:a7b:c258:: with SMTP id b24mr43163296wmj.160.1634563070234;
        Mon, 18 Oct 2021 06:17:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSuIZ1TUObsaltct5kZLxF5NiX0EAwqlesEoWuwEt55OWxSiqTjrt15fn3c5YHGk3doStYbg==
X-Received: by 2002:a7b:c258:: with SMTP id b24mr43163243wmj.160.1634563069879;
        Mon, 18 Oct 2021 06:17:49 -0700 (PDT)
Received: from redhat.com ([2.55.19.190])
        by smtp.gmail.com with ESMTPSA id n66sm12531808wmn.2.2021.10.18.06.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 06:17:48 -0700 (PDT)
Date:   Mon, 18 Oct 2021 09:17:41 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
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
        Paolo Bonzini <pbonzini@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter H Anvin <hpa@zytor.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Message-ID: <20211018091627-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <cec62ebb-87d7-d725-1096-2c97c5eedbc3@linux.intel.com>
 <20211011073614-mutt-send-email-mst@kernel.org>
 <YW1lc5Y2P1zRc2kp@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW1lc5Y2P1zRc2kp@kroah.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 18, 2021 at 02:15:47PM +0200, Greg KH wrote:
> On Mon, Oct 11, 2021 at 07:59:17AM -0400, Michael S. Tsirkin wrote:
> > On Sun, Oct 10, 2021 at 03:22:39PM -0700, Andi Kleen wrote:
> > > 
> > > > To which Andi replied
> > > > 	One problem with removing the ioremap opt-in is that
> > > > 	it's still possible for drivers to get at devices without going through probe.
> > > > 
> > > > To which Greg replied:
> > > > https://lore.kernel.org/all/YVXBNJ431YIWwZdQ@kroah.com/
> > > > 	If there are in-kernel PCI drivers that do not do this, they need to be
> > > > 	fixed today.
> > > > 
> > > > Can you guys resolve the differences here?
> > > 
> > > 
> > > I addressed this in my other mail, but we may need more discussion.
> > 
> > Hopefully Greg will reply to that one.
> 
> Note, when wanting Greg to reply, someone should at the very least cc:
> him.

"that one" being "Andi's other mail". Which I don't remember what it was,
by now. Sorry.

> {sigh}
> 
> greg k-h

