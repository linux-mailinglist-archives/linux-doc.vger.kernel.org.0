Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE463BDF29
	for <lists+linux-doc@lfdr.de>; Tue,  6 Jul 2021 23:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhGFWAy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Jul 2021 18:00:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28880 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229891AbhGFWAx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jul 2021 18:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625608694;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k+aIEuRJ9fWvAoEW/b9NeolC7NVomT1H6FczvBKOAzE=;
        b=iLunRKnwLudlFUJNpOv/hCBw4iNO5US/9JcdHGrwAMluMo0VZHv205EhqjRjBV9y2Zr/jx
        IPvprmxDrVezVjeSTSaNlkwiMSbogDpzwTJfq8UEhYgBCDdqHy6CzdRsh2SM4l2O2pJ4uQ
        1So/F1DelsBYU8yKz9Tc8kxKPkmPFtc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-oDya_YkgM6SMLx6tCW5fJA-1; Tue, 06 Jul 2021 17:58:13 -0400
X-MC-Unique: oDya_YkgM6SMLx6tCW5fJA-1
Received: by mail-ej1-f69.google.com with SMTP id u4-20020a1709061244b02904648b302151so6318255eja.17
        for <linux-doc@vger.kernel.org>; Tue, 06 Jul 2021 14:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k+aIEuRJ9fWvAoEW/b9NeolC7NVomT1H6FczvBKOAzE=;
        b=CMH//j6ApsVDrdrkeJ+AsrZ0hwyvKA9IhKR+HHtJKgRJxIMjoqFj6Ox6wDSLfbU/4w
         o5t5wJFKc5++83zphZwEe3yi1bJD22SIZ6MEARm8l5l2uQuQo3SFu/+PE+/rbnWd4bxI
         7ktReY2sjATslUPkievOxZU/fXtB4YmZOfK4RXziGTFs1FiPFJlxmvk/SBR4qhlvanE4
         bz8Iv2wLLNI/Nr8v5DJdnGCzRNpYWuJ9v+/tR/YWeuyVWPsFLm6ZE3iLiwhG/ufOMZEn
         ++Jqqa4w2BtCsQQmpYqy7tFzf+gLD03zKw887yHRYNF/6VTmXKtRPGcfVB3DiwVFckWr
         4Jmw==
X-Gm-Message-State: AOAM53140aPGdmf9QPN4o8KCIFiXRcGgInbHOeRiq0T9k3L9IbEpqFt3
        3lcpa9f7BMMGxc5U12zukMlJVCR/ExxSszI7OAAu7vEobh55j2MFCIDGKApc6GWqrSm8Pf69PLG
        BktHYBWHFm9OmBeWCeAsw
X-Received: by 2002:a17:906:76d5:: with SMTP id q21mr10696818ejn.17.1625608691879;
        Tue, 06 Jul 2021 14:58:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqu/1lmrR8rrbh1YwrwIRMdNhn9GsNtFz8/94TRiu8HtTTs9q7p0msHS4QV1z8KlbqmflYCA==
X-Received: by 2002:a17:906:76d5:: with SMTP id q21mr10696799ejn.17.1625608691666;
        Tue, 06 Jul 2021 14:58:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id u17sm7779485edt.67.2021.07.06.14.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 14:58:11 -0700 (PDT)
To:     Eduardo Habkost <ehabkost@redhat.com>
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
References: <cover.2d906c322f72ec1420955136ebaa7a4c5073917c.1623272033.git-series.pawan.kumar.gupta@linux.intel.com>
 <de6b97a567e273adff1f5268998692bad548aa10.1623272033.git-series.pawan.kumar.gupta@linux.intel.com>
 <20210706195233.h6w4cm73oktfqpgz@habkost.net>
 <4cc2c5fe-2153-05c5-dedd-8cb650753740@redhat.com>
 <CAOpTY_qdbbnauTkbjkz+cZmo8=Hz6qqLNY6i6uamqhcty=Q1sw@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/4] x86/tsx: Add cmdline tsx=fake to not clear CPUID bits
 RTM and HLE
Message-ID: <671be35f-220a-f583-aa31-3a2da7dae93a@redhat.com>
Date:   Tue, 6 Jul 2021 23:58:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOpTY_qdbbnauTkbjkz+cZmo8=Hz6qqLNY6i6uamqhcty=Q1sw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/07/21 23:33, Eduardo Habkost wrote:
> On Tue, Jul 6, 2021 at 5:05 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>> It's a bit tricky, because HLE and RTM won't really behave well.  An old
>> guest that sees RTM=1 might end up retrying and aborting transactions
>> too much.  So I'm not sure that a QEMU "-cpu host" guest should have HLE
>> and RTM enabled.
> 
> Is the purpose of GET_SUPPORTED_CPUID to return what is supported by
> KVM, or to return what "-cpu host" should enable by default? They are
> conflicting requirements in this case.

In theory there is GET_EMULATED_CPUID for the former, so it should be 
the latter.  In practice neither QEMU nor Libvirt use it; maybe now we 
have a good reason to add it, but note that userspace could also check 
host RTM_ALWAYS_ABORT.

> Returning HLE=1,RTM=1 in GET_SUPPORTED_CPUID makes existing userspace
> take bad decisions until it's updated.
> 
> Returning HLE=0,RTM=0 in GET_SUPPORTED_CPUID prevents existing
> userspace from resuming existing VMs (despite being technically
> possible).
> 
> The first option has an easy workaround that doesn't require a
> software update (disabling HLE/RTM in the VM configuration). The
> second option doesn't have a workaround. I'm inclined towards the
> first option.

The default has already been tsx=off for a while though, so checking 
either GET_EMULATED_CPUID or host RTM_ALWAYS_ABORT in userspace might 
also be feasible for those that are still on tsx=on.

Paolo

