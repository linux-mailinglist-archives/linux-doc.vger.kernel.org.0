Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6426E42795A
	for <lists+linux-doc@lfdr.de>; Sat,  9 Oct 2021 13:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbhJILGZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 9 Oct 2021 07:06:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28662 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232748AbhJILGY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 9 Oct 2021 07:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633777466;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lJ/2iCuZIJi8M6YSq3TSpepZV4prmg5N+D8TG37hfos=;
        b=AaxYMxWO/BxUn2MZXFoc35vCI1KV/4CUz8y8p85dSztjOa0jHIixCxO6RGnznkOiLHXPN7
        MG0m5wU+2AxYtXxgK0xS3+g6vwV6+CPFP/huMjMwvP1CzbKNNwHiI33KTu9lMzum0tsYdu
        aJUfkc2diMHEqi6grWIVPcouKMuHSR0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-9j1JPJ1SPBuy17SYEdsgow-1; Sat, 09 Oct 2021 07:04:22 -0400
X-MC-Unique: 9j1JPJ1SPBuy17SYEdsgow-1
Received: by mail-ed1-f70.google.com with SMTP id c7-20020a05640227c700b003d27f41f1d4so11450022ede.16
        for <linux-doc@vger.kernel.org>; Sat, 09 Oct 2021 04:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lJ/2iCuZIJi8M6YSq3TSpepZV4prmg5N+D8TG37hfos=;
        b=OXLVTvXwGFclGb+xFNKHVVVkt7r1EquUui0Av+VQh/ovzynPoGHY2ByjOjaI864KBI
         6DIFwQT8lmljJkqhzDPRHH4TBUfWyWdBZbzcd7ISvuPx62O7aYJclssTn7IlB+7PQJNH
         I2o6Rk/QZSo7WjyLK1ccH5+vjlPM7t8wBfzgR7t68wG5+q6wEG5UE3LR7rXu3TKJKBm0
         7iSgAOWH00F0KY+4f32aEGu23wQ4RpTDOAwc+ntmnotME12FQaf3wZiD4hM4VTSFIdyK
         ok7VtJkB+v2Ay57f2wQZhfk+EJvkxiQPOCwPtn7k+DW8F2e94bCZ+319NLFDvSmMz6X+
         6sSg==
X-Gm-Message-State: AOAM530at4rd5nzC7/sRIC09YHWuSf1frDeIqdxviI//H1QfMnfym7rC
        WclM1axDeaWDtP7ypJj4C5OZrHXmf1jN+yxfXXuLud82QMTaXb7sOnjvTx99z17aXMCuembLemU
        mheD+whyYKbzAMrWb5lJS
X-Received: by 2002:a17:906:585a:: with SMTP id h26mr10966038ejs.31.1633777461691;
        Sat, 09 Oct 2021 04:04:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwobA8ZxtLfM+i96qTUZJc2D6zqI9p4pA768qS/bvwYQXY5otl6Kxnqg/w4gwu0W8PjfTgg/g==
X-Received: by 2002:a17:906:585a:: with SMTP id h26mr10965985ejs.31.1633777461334;
        Sat, 09 Oct 2021 04:04:21 -0700 (PDT)
Received: from redhat.com ([2.55.132.170])
        by smtp.gmail.com with ESMTPSA id n22sm831106eja.120.2021.10.09.04.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 04:04:20 -0700 (PDT)
Date:   Sat, 9 Oct 2021 07:04:10 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
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
        Andi Kleen <ak@linux.intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v5 16/16] x86/tdx: Add cmdline option to force use of
 ioremap_host_shared
Message-ID: <20211009070132-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-17-sathyanarayanan.kuppuswamy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211009003711.1390019-17-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 08, 2021 at 05:37:11PM -0700, Kuppuswamy Sathyanarayanan wrote:
> +	ioremap_force_shared= [X86_64, CCG]
> +			Force the kernel to use shared memory mappings which do
> +			not use ioremap_host_shared/pcimap_host_shared to opt-in
> +			to shared mappings with the host. This feature is mainly
> +			used by a confidential guest when enabling new drivers
> +			without proper shared memory related changes. Please note
> +			that this option might also allow other non explicitly
> +			enabled drivers to interact with the host in confidential
> +			guest, which could cause other security risks. This option
> +			will also cause BIOS data structures to be shared with the
> +			host, which might open security holes.
> +
>  	io7=		[HW] IO7 for Marvel-based Alpha systems
>  			See comment before marvel_specify_io7 in
>  			arch/alpha/kernel/core_marvel.c.

The connection is quite unfortunate IMHO.
Can't there be an option
that unbreaks drivers *without* opening up security holes by
making BIOS shared?

-- 
MST

