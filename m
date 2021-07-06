Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261193BDEBA
	for <lists+linux-doc@lfdr.de>; Tue,  6 Jul 2021 23:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhGFVId (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Jul 2021 17:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60390 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229941AbhGFVId (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jul 2021 17:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625605553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0pCkeqTi9Z8pnCLX4xKb6CHs6Mz5uaIewNQ5zoX9f/k=;
        b=FchJAjcI+qfFQhnyWvqd75jNbnmpaRGkrvaukQ3o0lBq22FBUJa9d+X6U+hVnGzPh66cyi
        zYz9MC3Kw3M8PzBHFyJOCjUb4K/8DAUmQNMPYJy8beoi7pPhfNHVb5I2pbiQtmaALBY9rx
        FX1Fr/etK3aSZudUwJPn4V5kUjCegyk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-WxOdm8UzNXyitxZ1wdp4yw-1; Tue, 06 Jul 2021 17:05:52 -0400
X-MC-Unique: WxOdm8UzNXyitxZ1wdp4yw-1
Received: by mail-wm1-f71.google.com with SMTP id a13-20020a7bc1cd0000b02902104c012aa3so1319718wmj.9
        for <linux-doc@vger.kernel.org>; Tue, 06 Jul 2021 14:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0pCkeqTi9Z8pnCLX4xKb6CHs6Mz5uaIewNQ5zoX9f/k=;
        b=P6fz0Ya1yRpk6qchm2C8gKnFuPIeLIUJik1hUNOvthTWFR7YZSSOTBUPgq7uzTUe5H
         mQbKfiGWZYmzU/xMj7dC/OkL3SRbVYRUDJCcnHoW4QAj9xI1sG3iDa64ljhGfsYobh1o
         QN7U687/SjfUQBG2IDKwBR3zH5FpkvCdr1wZKtd/ct+m0pd7iDECxC0AJ1ZBJczTScXB
         nKLHTarzDq+0Dx2EPtCoj3ucPSH/NgRtgK74xz+je7PM0nTr39c0XY0l2J9TAzQZE2M3
         glx7IoSd9u1wCjLJvkkjvhSYy/cRfRWW7+NTQwIa2x/C/7EjAHdBV0xOXi5OSFUfEjgq
         PcJg==
X-Gm-Message-State: AOAM531mRUynXfUD6wAOWoacA4FJQb95dF3Ipu2T6TLOaT6Q6OqLz0bC
        9bW7x7RWUjEs5U/6gRsgUIQiU/yuref2kp2MAouIlyOzoBmUF1iaKlJUUR4MaiySLsXEFSKWC9e
        b55zk74qDmF7yt6RMAUPz
X-Received: by 2002:a5d:4906:: with SMTP id x6mr24381076wrq.387.1625605551567;
        Tue, 06 Jul 2021 14:05:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOhrydYavVx/+sIKU6aLtGvSDAD3WCi7G8LjuQ9+fVE5Y2AH5nCrrkIIkx8wYFJ5sw9P49rw==
X-Received: by 2002:a5d:4906:: with SMTP id x6mr24381018wrq.387.1625605551291;
        Tue, 06 Jul 2021 14:05:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.gmail.com with ESMTPSA id t9sm18899868wmq.14.2021.07.06.14.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 14:05:50 -0700 (PDT)
To:     Eduardo Habkost <ehabkost@redhat.com>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
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
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/4] x86/tsx: Add cmdline tsx=fake to not clear CPUID bits
 RTM and HLE
Message-ID: <4cc2c5fe-2153-05c5-dedd-8cb650753740@redhat.com>
Date:   Tue, 6 Jul 2021 23:05:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706195233.h6w4cm73oktfqpgz@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/07/21 21:52, Eduardo Habkost wrote:
> On Wed, Jun 09, 2021 at 02:14:39PM -0700, Pawan Gupta wrote:
>> On CPUs that deprecated TSX, clearing the enumeration bits CPUID.RTM and
>> CPUID.HLE may not be desirable in some corner cases. Like a saved guest
>> would refuse to resume if it was saved before the microcode update
>> that deprecated TSX.
> Why is a global option necessary to allow those guests to be
> resumed?  Why can't KVM_GET_SUPPORTED_CPUID always return the HLE
> and RTM bits as supported when the host CPU has them?

It's a bit tricky, because HLE and RTM won't really behave well.  An old 
guest that sees RTM=1 might end up retrying and aborting transactions 
too much.  So I'm not sure that a QEMU "-cpu host" guest should have HLE 
and RTM enabled.

So it makes sense to handle it in userspace, with one of the two 
following possibilities:

- userspace sees TSX_FORCE_ABORT and if so it somehow "discourages" 
setting HLE/RTM, even though they are shown as supported

- userspace sees TSX_FORCE_ABORT and if so it knows HLE/RTM can be set, 
even though they are discouraged in general

In any case, KVM's "supported CPUID" is based on the host features but 
independent.  KVM can decide to show or hide the hardware HLE and RTM 
bits independent of the host tsx= setting; it may make sense to hide the 
bits via a module parameter, but in any case this patch is not needed.

Paolo

