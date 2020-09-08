Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 426FC26140A
	for <lists+linux-doc@lfdr.de>; Tue,  8 Sep 2020 18:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731089AbgIHQAk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Sep 2020 12:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731044AbgIHQAE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Sep 2020 12:00:04 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F19C061799
        for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2020 08:56:39 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j2so19679245wrx.7
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2020 08:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jYC9v1Z1TC/eRVDb6B6iUcOvbi2c078flAMPYhklKtQ=;
        b=wETpD6saEAEz/nnn8zVtwhh+gaFPha+TeS89jJ1i0WXRSxkwSLmbkgYLe8LJONzyMS
         DoB7HEnSel284io7HecToViYhGiJ/osVBiEYD5yf36sYhXeLWHEvuky/VfFW+7XxkgGB
         VNk4oD+jr9cpDC8j7R2bk16HED+JGEVY/OcjOdN2e+kZrHY2LHNqjx+alq560KySCd1/
         RwuqL+2rbOxyAm0vQxuu+ygoqRDiR/sxu6RsaVECGbE7ZTmzbo3vAPc3y+pfvc+FtQcc
         g1bQM/CkUw5uoAWK6aYaUslAe00EShXz22vICKweKwyYvAPpqK2uKAcCW+a4z8jnwfTk
         tehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jYC9v1Z1TC/eRVDb6B6iUcOvbi2c078flAMPYhklKtQ=;
        b=oNDuY8BZmmhq9qmn9EvxCpkEIuSMTGYByAeIBhPmgfdJGhRD2VtagyvaQKtu1kdtNF
         K49CyG6qrVuymiDxv/Yhd7O7NNbaxZ5th/F2lmFv8R00MAxgpAQJW+xn5i0GmVUL7ThU
         Ou7/Ie+tH1UUauS1YuAlE+fkZao2CbnNfltG+HUpF/RIyZBTTs57xDYV3StdYdyOVUgf
         bjs3JCfB2DX9tdmSRodWgvuwpqFgdfjHhtyVDPGOAMI5W/1XvoK2DcmxXw3cbK7fpQ53
         qSlUAKFlN/AAJ0o38zvJCNCCYnetA1Vlwx/paWJjCSHMFKWzbRWb005xzw8DAeSGN7Xr
         ANZQ==
X-Gm-Message-State: AOAM533i42wlThpvHnzdtCS51Qtobc+r7tnjCiabTvQyote/oC3r9gVe
        Q34YFnbm84smBahyKHCWXNwf4Q==
X-Google-Smtp-Source: ABdhPJzbyBGQJjklA0DbEeiaRcvxaMdt7wtqKlePMw2vv0wGDtTenivAuH+P4XF9OnbAiMxdsAAPtw==
X-Received: by 2002:a5d:4a4b:: with SMTP id v11mr335425wrs.36.1599580598237;
        Tue, 08 Sep 2020 08:56:38 -0700 (PDT)
Received: from elver.google.com ([100.105.32.75])
        by smtp.gmail.com with ESMTPSA id h184sm34756040wmh.41.2020.09.08.08.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 08:56:37 -0700 (PDT)
Date:   Tue, 8 Sep 2020 17:56:31 +0200
From:   Marco Elver <elver@google.com>
To:     Vlastimil Babka <vbabka@suse.cz>
Cc:     Dave Hansen <dave.hansen@intel.com>, glider@google.com,
        akpm@linux-foundation.org, catalin.marinas@arm.com, cl@linux.com,
        rientjes@google.com, iamjoonsoo.kim@lge.com, mark.rutland@arm.com,
        penberg@kernel.org, hpa@zytor.com, paulmck@kernel.org,
        andreyknvl@google.com, aryabinin@virtuozzo.com, luto@kernel.org,
        bp@alien8.de, dave.hansen@linux.intel.com, dvyukov@google.com,
        edumazet@google.com, gregkh@linuxfoundation.org, mingo@redhat.com,
        jannh@google.com, corbet@lwn.net, keescook@chromium.org,
        peterz@infradead.org, cai@lca.pw, tglx@linutronix.de,
        will@kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH RFC 00/10] KFENCE: A low-overhead sampling-based memory
 safety error detector
Message-ID: <20200908155631.GC61807@elver.google.com>
References: <20200907134055.2878499-1-elver@google.com>
 <e399d8d5-03c2-3c13-2a43-3bb8e842c55a@intel.com>
 <20200908153102.GB61807@elver.google.com>
 <feb73053-17a6-8b43-5b2b-51a813e81622@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <feb73053-17a6-8b43-5b2b-51a813e81622@suse.cz>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 08, 2020 at 05:36PM +0200, Vlastimil Babka wrote:
> On 9/8/20 5:31 PM, Marco Elver wrote:
> >> 
> >> How much memory overhead does this end up having?  I know it depends on
> >> the object size and so forth.  But, could you give some real-world
> >> examples of memory consumption?  Also, what's the worst case?  Say I
> >> have a ton of worst-case-sized (32b) slab objects.  Will I notice?
> > 
> > KFENCE objects are limited (default 255). If we exhaust KFENCE's memory
> > pool, no more KFENCE allocations will occur.
> > Documentation/dev-tools/kfence.rst gives a formula to calculate the
> > KFENCE pool size:
> > 
> > 	The total memory dedicated to the KFENCE memory pool can be computed as::
> > 
> > 	    ( #objects + 1 ) * 2 * PAGE_SIZE
> > 
> > 	Using the default config, and assuming a page size of 4 KiB, results in
> > 	dedicating 2 MiB to the KFENCE memory pool.
> > 
> > Does that clarify this point? Or anything else that could help clarify
> > this?
> 
> Hmm did you observe that with this limit, a long-running system would eventually
> converge to KFENCE memory pool being filled with long-aged objects, so there
> would be no space to sample new ones?

Sure, that's a possibility. But remember that we're not trying to
deterministically detect bugs on 1 system (if you wanted that, you
should use KASAN), but a fleet of machines! The non-determinism of which
allocations will end up in KFENCE, will ensure we won't end up with a
fleet of machines of identical allocations. That's exactly what we're
after. Even if we eventually exhaust the pool, you'll still detect bugs
if there are any.

If you are overly worried, either the sample interval or number of
available objects needs to be tweaked to be larger. The default of 255
is quite conservative, and even using something larger on a modern
system is hardly noticeable. Choosing a sample interval & number of
objects should also factor in how many machines you plan to deploy this
on. Monitoring /sys/kernel/debug/kfence/stats can help you here.

Thanks,
-- Marco
