Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1135A3FAEF0
	for <lists+linux-doc@lfdr.de>; Mon, 30 Aug 2021 00:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235688AbhH2W1Y (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 29 Aug 2021 18:27:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27974 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235498AbhH2W1X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 29 Aug 2021 18:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630275990;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=w+MBpgO+PBJKHqx0Y7eErLZSvPvNS8U9WRpzvSbhkVw=;
        b=gAmBZHwpZem49MSfu5U/CZ/a5gr5V2xPAiE8x7s7qTrcmyfHUZMhvXgnbBO48QN3T2mExC
        dO1u1BknmTb7tV0FmR+iQOV+BEZ7G638rsmFUPAERL53ZoCG+bUOEYbJE+c6RSOTkl8b/o
        ajJCJ6lUbgZfEZWmQfT67AkAmqdybSI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-WKY-REsTPI-IMwJtoPiURQ-1; Sun, 29 Aug 2021 18:26:29 -0400
X-MC-Unique: WKY-REsTPI-IMwJtoPiURQ-1
Received: by mail-wm1-f72.google.com with SMTP id s197-20020a1ca9ce000000b002e72ba822dcso2258223wme.6
        for <linux-doc@vger.kernel.org>; Sun, 29 Aug 2021 15:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w+MBpgO+PBJKHqx0Y7eErLZSvPvNS8U9WRpzvSbhkVw=;
        b=HnOrh1fRizFLPQH+gqbMjlzqOCBMuarr9u1wXqezEeWRDREkfzCS2YiElqZQ8k/rq5
         MoqtRDx07rOyK/omAF26+b4NPusjCs82rXFDZpHcfNmKYpSJaNRSCvzCJ6HULF3Udw+c
         R4/TI4QdCqBZoJdphnVbTyFc54IV4LAoGMpqwX6qcCLRs7gycx7/y4tLmnGxlOWaxE2E
         aDAJsGiz9umgb47UluJcDnN3RUelUvUTsIhlNrH814R2yhrdWiO6/uAQc9uvI0pLQ9ME
         6OFmldTh1JYintIVCqYvaq0YrUwPNDhphX8Iv8j4F76dWUjBokQpPbW+6RBAsJQJad1p
         D37A==
X-Gm-Message-State: AOAM530yFs5C9MI62snIKosSTZ4DBDCX/mydUAC8RdBJwz1XmjXet18s
        bnEHd0sxpQho341Wx9s9WSOISCXCN5A7bjsOWxRh313d6pu8p8I/921aB3aW56nfp/VTn+/F/mA
        mX2TREhe5UiZR+2yr3DTn
X-Received: by 2002:adf:d191:: with SMTP id v17mr9646952wrc.345.1630275987855;
        Sun, 29 Aug 2021 15:26:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrWdV4UWjmsxWXnznxAyF40RS7x+qTXWNuG7vw+rYxDj6nRO9NmovukIvxjT80bQD6fn6smQ==
X-Received: by 2002:adf:d191:: with SMTP id v17mr9646917wrc.345.1630275987667;
        Sun, 29 Aug 2021 15:26:27 -0700 (PDT)
Received: from redhat.com ([2.55.28.138])
        by smtp.gmail.com with ESMTPSA id c190sm12208101wma.21.2021.08.29.15.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 15:26:26 -0700 (PDT)
Date:   Sun, 29 Aug 2021 18:26:20 -0400
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
Message-ID: <20210829181635-mutt-send-email-mst@kernel.org>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
 <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com>
 <d992b5af-8d57-6aa6-bd49-8e2b8d832b19@linux.intel.com>
 <20210824053830-mutt-send-email-mst@kernel.org>
 <d21a2a2d-4670-ba85-ce9a-fc8ea80ef1be@linux.intel.com>
 <20210829112105-mutt-send-email-mst@kernel.org>
 <09b340dd-c8a8-689c-4dad-4fe0e36d39ae@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09b340dd-c8a8-689c-4dad-4fe0e36d39ae@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Aug 29, 2021 at 09:17:53AM -0700, Andi Kleen wrote:
> Also I changing this single call really that bad? It's not that we changing
> anything drastic here, just give the low level subsystem a better hint about
> the intention. If you don't like the function name, could make it an
> argument instead?

My point however is that the API should say that the
driver has been audited, not that the mapping has been
done in some special way. For example the mapping can be
in some kind of wrapper, not directly in the driver.
However you want the driver validated, not the wrapper.

Here's an idea:



diff --git a/include/linux/audited.h b/include/linux/audited.h
new file mode 100644
index 000000000000..e23fd6ad50db
--- /dev/null
+++ b/include/linux/audited.h
@@ -0,0 +1,3 @@
+#ifndef AUDITED_MODULE
+#define AUDITED_MODULE
+#endif

Now any audited driver must do
#include <linux/audited.h>
first of all.
Implementation-wise it can do any number of things,
e.g. if you like then sure you can do:

#ifdef AUDITED_MODULE
#define pci_ioremap pci_ioremap_shared
#else
#define pci_ioremap pci_ioremap
#endif

but you can also thinkably do something like (won't work,
but just to give you the idea):

#ifdef AUDITED_MODULE
#define __init __init
#else
#define __init
#endif

or any number of hacks like this.


-- 
MST

