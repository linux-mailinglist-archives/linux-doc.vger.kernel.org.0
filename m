Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878033BDEED
	for <lists+linux-doc@lfdr.de>; Tue,  6 Jul 2021 23:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhGFVgS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Jul 2021 17:36:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26524 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229770AbhGFVgS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jul 2021 17:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625607218;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WYXYXa+th2cYeV7B6S0tgQlmASzmnAP4QbXludRovGE=;
        b=E9mT4GXO6bHnr2GGo2X3sp9hr7HlWZs/FEF/1+SII9VIQ+EIr4SIxmBsl345rdplj7TGOr
        yKUcQj8E/lU215/tY4AiAEPwdjgOcReeANbp5hFva2Gg48ZcvoJRNcO2YC8sWRwgWCw5ax
        GuUrLtwesDMcXJYlMf82Cuc1jakh/g8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-Wvi9h5B6OKONJhHXfpQRuA-1; Tue, 06 Jul 2021 17:33:37 -0400
X-MC-Unique: Wvi9h5B6OKONJhHXfpQRuA-1
Received: by mail-lf1-f71.google.com with SMTP id bu14-20020a056512168eb029031226594940so45583lfb.15
        for <linux-doc@vger.kernel.org>; Tue, 06 Jul 2021 14:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WYXYXa+th2cYeV7B6S0tgQlmASzmnAP4QbXludRovGE=;
        b=f5miwWw1aECZQd/+6WAXI+skBw5SJ0zFoHzrMLrWeuxHtedXU+ddDjAOWVzOL0VZSM
         3jSl3QwJ4f5auX8h0dBGc6gxWkxNE89JWMEabir/3oO3VTqAAYcoM3Jy9IA1h3FO7hNK
         dBNp200bCDEP71jLnQwzuGVhO0sb6/w3uNDnuYnsTGCyz5Mma5LDwql5G9Wov1pDMFKN
         1UjF/EuxvIJO7LMNYaTucz7A2LVVfjQvv9P02MtJS/LRAwiPgrt0wzJW9OrtzFr0CT5J
         ZoRNi+PnX7HGSFFLmY87CCbAU2EJqcVdpvD2UfFN60BRQPUExLbNbNHFAmjOQ9WRTVho
         52Ag==
X-Gm-Message-State: AOAM533g/ZlRjRGktYN71uW0d/ZltmC/lwH+KSKggpMHCVyIHufSR0g6
        IWjExAAuavvF5KQN/0ZuP2JBNKUDtC7LVWaKU/IU4fMjx5hwcAGHx4reHXfVUAIDRxhv5RKbXU9
        A40BcE6pMgSjVBXngS9ALmb1MA2SO2sz0ePUn
X-Received: by 2002:a2e:8001:: with SMTP id j1mr17136816ljg.332.1625607215514;
        Tue, 06 Jul 2021 14:33:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4lvwBEiKDKHJqTeJvqU552DWCIoa0gwphzHoaDY6oDwfysF/qgeGW16LxF1TghHCckBp9oqxbf93Crjo/a/0=
X-Received: by 2002:a2e:8001:: with SMTP id j1mr17136776ljg.332.1625607215277;
 Tue, 06 Jul 2021 14:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.2d906c322f72ec1420955136ebaa7a4c5073917c.1623272033.git-series.pawan.kumar.gupta@linux.intel.com>
 <de6b97a567e273adff1f5268998692bad548aa10.1623272033.git-series.pawan.kumar.gupta@linux.intel.com>
 <20210706195233.h6w4cm73oktfqpgz@habkost.net> <4cc2c5fe-2153-05c5-dedd-8cb650753740@redhat.com>
In-Reply-To: <4cc2c5fe-2153-05c5-dedd-8cb650753740@redhat.com>
From:   Eduardo Habkost <ehabkost@redhat.com>
Date:   Tue, 6 Jul 2021 17:33:19 -0400
Message-ID: <CAOpTY_qdbbnauTkbjkz+cZmo8=Hz6qqLNY6i6uamqhcty=Q1sw@mail.gmail.com>
Subject: Re: [PATCH 4/4] x86/tsx: Add cmdline tsx=fake to not clear CPUID bits
 RTM and HLE
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Tony Luck <tony.luck@intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kyung Min Park <kyung.min.park@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Juergen Gross <jgross@suse.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Kan Liang <kan.liang@linux.intel.com>,
        Joerg Roedel <jroedel@suse.de>,
        Victor Ding <victording@google.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Anthony Steinhauser <asteinhauser@google.com>,
        Anand K Mistry <amistry@google.com>,
        Andi Kleen <ak@linux.intel.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Joe Perches <joe@perches.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 6, 2021 at 5:05 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 06/07/21 21:52, Eduardo Habkost wrote:
> > On Wed, Jun 09, 2021 at 02:14:39PM -0700, Pawan Gupta wrote:
> >> On CPUs that deprecated TSX, clearing the enumeration bits CPUID.RTM and
> >> CPUID.HLE may not be desirable in some corner cases. Like a saved guest
> >> would refuse to resume if it was saved before the microcode update
> >> that deprecated TSX.
> > Why is a global option necessary to allow those guests to be
> > resumed?  Why can't KVM_GET_SUPPORTED_CPUID always return the HLE
> > and RTM bits as supported when the host CPU has them?
>
> It's a bit tricky, because HLE and RTM won't really behave well.  An old
> guest that sees RTM=1 might end up retrying and aborting transactions
> too much.  So I'm not sure that a QEMU "-cpu host" guest should have HLE
> and RTM enabled.

Is the purpose of GET_SUPPORTED_CPUID to return what is supported by
KVM, or to return what "-cpu host" should enable by default? They are
conflicting requirements in this case.

>
> So it makes sense to handle it in userspace, with one of the two
> following possibilities:
>
> - userspace sees TSX_FORCE_ABORT and if so it somehow "discourages"
> setting HLE/RTM, even though they are shown as supported
>
> - userspace sees TSX_FORCE_ABORT and if so it knows HLE/RTM can be set,
> even though they are discouraged in general

In either case, we can make new userspace behave well. I'm worried
about existing userspace:

Returning HLE=1,RTM=1 in GET_SUPPORTED_CPUID makes existing userspace
take bad decisions until it's updated.

Returning HLE=0,RTM=0 in GET_SUPPORTED_CPUID prevents existing
userspace from resuming existing VMs (despite being technically
possible).

The first option has an easy workaround that doesn't require a
software update (disabling HLE/RTM in the VM configuration). The
second option doesn't have a workaround. I'm inclined towards the
first option.


>
> In any case, KVM's "supported CPUID" is based on the host features but
> independent.  KVM can decide to show or hide the hardware HLE and RTM
> bits independent of the host tsx= setting; it may make sense to hide the
> bits via a module parameter, but in any case this patch is not needed.
>
> Paolo
>

-- 
Eduardo

