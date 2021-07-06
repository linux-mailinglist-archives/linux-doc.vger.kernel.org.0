Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D873BDE4E
	for <lists+linux-doc@lfdr.de>; Tue,  6 Jul 2021 22:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhGFUTf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Jul 2021 16:19:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47946 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229935AbhGFUTf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jul 2021 16:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625602615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=s/BBwhSLYUvHJfPP5fwqPO4ji4FbL7n2m98UsEdtyyY=;
        b=Ys/HEhhWMnmj6LsCEvdEivMuIIp7c7uEt7umRLyYBpDIjy91AewHf7djCj6jbUNCasILCk
        Xlm2kbV2WqWBq7vqdk1unc//qNrqajRCn72t4wcOBEpoO1aQXnZWeaUFhwLIxo8KlmBH9+
        +lRcqCq6fxjbadCDTOXHuqM0lfrxgIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-_2gfo29zNG6mV7a_nLVV7w-1; Tue, 06 Jul 2021 16:16:52 -0400
X-MC-Unique: _2gfo29zNG6mV7a_nLVV7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 605941023F48;
        Tue,  6 Jul 2021 20:16:47 +0000 (UTC)
Received: from localhost (ovpn-113-79.rdu2.redhat.com [10.10.113.79])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D1B9D17240;
        Tue,  6 Jul 2021 20:16:46 +0000 (UTC)
Date:   Tue, 6 Jul 2021 15:52:33 -0400
From:   Eduardo Habkost <ehabkost@redhat.com>
To:     Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
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
        Paolo Bonzini <pbonzini@redhat.com>,
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
Subject: Re: [PATCH 4/4] x86/tsx: Add cmdline tsx=fake to not clear CPUID
 bits RTM and HLE
Message-ID: <20210706195233.h6w4cm73oktfqpgz@habkost.net>
References: <cover.2d906c322f72ec1420955136ebaa7a4c5073917c.1623272033.git-series.pawan.kumar.gupta@linux.intel.com>
 <de6b97a567e273adff1f5268998692bad548aa10.1623272033.git-series.pawan.kumar.gupta@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <de6b97a567e273adff1f5268998692bad548aa10.1623272033.git-series.pawan.kumar.gupta@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 09, 2021 at 02:14:39PM -0700, Pawan Gupta wrote:
> On CPUs that deprecated TSX, clearing the enumeration bits CPUID.RTM and
> CPUID.HLE may not be desirable in some corner cases. Like a saved guest
> would refuse to resume if it was saved before the microcode update
> that deprecated TSX.

Why is a global option necessary to allow those guests to be
resumed?  Why can't KVM_GET_SUPPORTED_CPUID always return the HLE
and RTM bits as supported when the host CPU has them?


> 
> Add a cmdline option "tsx=fake" to not clear CPUID bits even when the
> hardware always aborts TSX transactions.
> 
> Suggested-by: Tony Luck <tony.luck@intel.com>
> Suggested-by: Andi Kleen <ak@linux.intel.com>
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> Reviewed-by: Andi Kleen <ak@linux.intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Tested-by: Neelima Krishnan <neelima.krishnan@intel.com>
[...]

-- 
Eduardo

