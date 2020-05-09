Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142451CC187
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2020 14:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgEIM70 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 9 May 2020 08:59:26 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51074 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727820AbgEIM7Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 9 May 2020 08:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589029163;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pQw8wIihcr8z9SG9JkhXrUc3pHs+9HPhqleZu+dS0tc=;
        b=J5sy+26BKRGGq9QC2SIQZUWh6KGsA9VzUVxbKjzX7FXtdr8XKvTGTCyl5o6TbsJMMjAAOJ
        VjZJIXaQ88K6ZgY3r2vGpyLSKEDWdowoaA5E2Wn6O+q5yqz+SMG128MAWXKMB4IyuIcBrN
        mPM+EKRJO8QGWeeyiNZDwYNxTzaH+Y0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-4DfAVg3bNlOtorsM7hEVLg-1; Sat, 09 May 2020 08:59:22 -0400
X-MC-Unique: 4DfAVg3bNlOtorsM7hEVLg-1
Received: by mail-wr1-f69.google.com with SMTP id z8so2346927wrp.7
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2020 05:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pQw8wIihcr8z9SG9JkhXrUc3pHs+9HPhqleZu+dS0tc=;
        b=EwYaQG/Q6kKnM9cvM02LfftbBXbD3RH+TrQGtBGnWuhYY5kpgL7Q5qa5SUuvLx+ySz
         dCS1Xfvqbc8ITrNy9oepjscEMQulPp2A3Qp+++AQ7hStgzhYB5sK+4qBSQGoM3RxIzlB
         /q2jxn8mcPgwWz3plrFcEB4wNk7LFVdHn8IlaP/ADexBBEzgDnusAIbbeJcEJGj6OYmB
         Lk8URvSx87lH9x4PHr0RhbglDy1/dh3NmvvHz4b/4Aty7tTArZbKsNHSwdMuOw7+aDWQ
         XssVmJBJcdQMpv/EpwdQZ9oTosRoXYOL7FIypkx01gp8ZYMyhR4KRyuIQGNtDZQ24bZO
         iCCw==
X-Gm-Message-State: AGi0PuYmYObBZiiEElkLBR7L9Nx42ML7P6ZLYw+YzUiIdMfmwkqxQPYB
        vjB0w4zSQln6I+S7R7LcvY5tot7kx6hOEv2FTi6PkrsK875amDS4dK7JMISFF2ssZI5GPATVNkh
        ewxaQrhZvYXPkKvYPIcOh
X-Received: by 2002:adf:81e4:: with SMTP id 91mr8859395wra.143.1589029160731;
        Sat, 09 May 2020 05:59:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypKyvtlkWX1zEIAN3peqtORXIi11YJ6t6OrIjcvtaKt8KFtk61ibvPPJ0tYsrkzhC5wen/OCNg==
X-Received: by 2002:adf:81e4:: with SMTP id 91mr8859378wra.143.1589029160513;
        Sat, 09 May 2020 05:59:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1cb4:2b36:6750:73ce? ([2001:b07:6468:f312:1cb4:2b36:6750:73ce])
        by smtp.gmail.com with ESMTPSA id u16sm8073375wrq.17.2020.05.09.05.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2020 05:59:19 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] KVM: x86: Move pkru save/restore to x86.c
To:     Jim Mattson <jmattson@google.com>, Babu Moger <babu.moger@amd.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        the arch/x86 maintainers <x86@kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        mchehab+samsung@kernel.org, changbin.du@intel.com,
        Nadav Amit <namit@vmware.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        yang.shi@linux.alibaba.com, asteinhauser@google.com,
        anshuman.khandual@arm.com, Jan Kiszka <jan.kiszka@siemens.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        steven.price@arm.com, rppt@linux.vnet.ibm.com, peterx@redhat.com,
        Dan Williams <dan.j.williams@intel.com>, arjunroy@google.com,
        logang@deltatee.com, Thomas Hellstrom <thellstrom@vmware.com>,
        Andrea Arcangeli <aarcange@redhat.com>, justin.he@arm.com,
        robin.murphy@arm.com, ira.weiny@intel.com,
        Kees Cook <keescook@chromium.org>,
        Juergen Gross <jgross@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        pawan.kumar.gupta@linux.intel.com,
        "Yu, Fenghua" <fenghua.yu@intel.com>,
        vineela.tummalapalli@intel.com, yamada.masahiro@socionext.com,
        sam@ravnborg.org, acme@redhat.com, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>
References: <158897190718.22378.3974700869904223395.stgit@naples-babu.amd.com>
 <158897219574.22378.9077333868984828038.stgit@naples-babu.amd.com>
 <CALMp9eQj_aFcqR+v9SvFjKFxVjaHHzU44udcczJVqOR5vLQbWQ@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <90657d4b-cb2b-0678-fd9c-a281bb85fadf@redhat.com>
Date:   Sat, 9 May 2020 14:59:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CALMp9eQj_aFcqR+v9SvFjKFxVjaHHzU44udcczJVqOR5vLQbWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/05/20 00:09, Jim Mattson wrote:
>> +       if (static_cpu_has(X86_FEATURE_PKU) &&
>> +           kvm_read_cr4_bits(vcpu, X86_CR4_PKE) &&
>> +           vcpu->arch.pkru != vcpu->arch.host_pkru)
>> +               __write_pkru(vcpu->arch.pkru);
> This doesn't seem quite right to me. Though rdpkru and wrpkru are
> contingent upon CR4.PKE, the PKRU resource isn't. It can be read with
> XSAVE and written with XRSTOR. So, if we don't set the guest PKRU
> value here, the guest can read the host value, which seems dodgy at
> best.
> 
> Perhaps the second conjunct should be: (kvm_read_cr4_bits(vcpu,
> X86_CR4_PKE) || (vcpu->arch.xcr0 & XFEATURE_MASK_PKRU)).

You're right.  The bug was preexistent, but we should fix it in 5.7 and
stable as well.

>>  }
>>  EXPORT_SYMBOL_GPL(kvm_load_guest_xsave_state);
>>
>>  void kvm_load_host_xsave_state(struct kvm_vcpu *vcpu)
>>  {
>> +       /*
>> +        * eager fpu is enabled if PKEY is supported and CR4 is switched
>> +        * back on host, so it is safe to read guest PKRU from current
>> +        * XSAVE.
>> +        */
> I don't understand the relevance of this comment to the code below.
> 

It's probably stale.

Paolo

