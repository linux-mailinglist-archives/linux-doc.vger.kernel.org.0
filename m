Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947BA274AEF
	for <lists+linux-doc@lfdr.de>; Tue, 22 Sep 2020 23:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgIVVOK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Sep 2020 17:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbgIVVOK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Sep 2020 17:14:10 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38A8C0613D2
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2020 14:14:10 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id k14so12994340pgi.9
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2020 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jX0oqiM8ZRWUr1y81TApDh2RLCO5qMFygk0a8MYzzVI=;
        b=B1hYCzRIzXGxf476oO1RyhjC26uBYCDdckWaQTm5Z1XUjvlWEEJN1luX8NvRRESzqy
         uI37IR6+6MX61y1oGcN8An610Ee2QYGs6VGNllKq9m+zlneUHDzy3UsAGGBHv9DE1E1D
         qT8GQM4UVAesCA8kLMpRrA9ZeI4cfw8eGjxYKtyE0yjY59irZXh2Dfmz9OjumiYUu/qm
         yHTO7ctPRUbZ9EigdnrWAIXnwvosn5CW58fpf0+coea0060UfoW1dsYi0nQkVmy0O4VO
         g81iae2/630fno3kknm7E/zhJn0XhCUt3WhKQcA0ckIX/ElhyihqNT81SRkD23FlxBLs
         OQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jX0oqiM8ZRWUr1y81TApDh2RLCO5qMFygk0a8MYzzVI=;
        b=OcfSEOJQP5xL5ddcC1Mu/pjA5c4qe8MAIOANt+TruTKt78PVq+lT6or8LY/RkIorux
         7Xuvp7GT/tlV0lCvX118inZi8pOiMVVqh8H8C0pOJATWlxK/IqU/Syx907wgSvrM3sTK
         zoN23UrVvQ+gNGBRcb44ZBBi8mo5qn+5ZlOBt3qxaTZgDKYldJyznGT/REIoeK7WTmWk
         FOxYfT89YGmmSqgKvT+7ywdxJ4v1+VvYyZb8R2hzmxCdSECjJy8B+x6V8IVW+tS/gdvs
         2nKpvxbxPPLBjEBNb39P1tnRdQGu+4zUL2L/PvgwakHfjumltSFji7zyMIHlr5RHcqvF
         gvGg==
X-Gm-Message-State: AOAM530Efg9pGkpNpFNUyS+QNP8f0A+Fc2mTrlDHanQxcFDiNO3C6i1o
        j2uOb5cpmg0ZBPeLT02LYsvj5A==
X-Google-Smtp-Source: ABdhPJzzrNDDUM06Vr4/E2y5sYnq1wUrhSBwgHDHzOZNGlz/fG05U62zoyb1FdFl0XlVuaTCkIKrPg==
X-Received: by 2002:a63:516:: with SMTP id 22mr5143414pgf.316.1600809249779;
        Tue, 22 Sep 2020 14:14:09 -0700 (PDT)
Received: from google.com ([2620:0:1008:10:1ea0:b8ff:fe75:b885])
        by smtp.gmail.com with ESMTPSA id r15sm15218636pgg.17.2020.09.22.14.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 14:14:09 -0700 (PDT)
Date:   Tue, 22 Sep 2020 14:14:04 -0700
From:   Vipin Sharma <vipinsh@google.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     thomas.lendacky@amd.com, pbonzini@redhat.com, tj@kernel.org,
        lizefan@huawei.com, joro@8bytes.org, corbet@lwn.net,
        brijesh.singh@amd.com, jon.grimm@amd.com, eric.vantassell@amd.com,
        gingell@google.com, rientjes@google.com, kvm@vger.kernel.org,
        x86@kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC Patch 0/2] KVM: SVM: Cgroup support for SVM SEV ASIDs
Message-ID: <20200922211404.GA4141897@google.com>
References: <20200922004024.3699923-1-vipinsh@google.com>
 <20200922014836.GA26507@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922014836.GA26507@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 21, 2020 at 06:48:38PM -0700, Sean Christopherson wrote:
> On Mon, Sep 21, 2020 at 05:40:22PM -0700, Vipin Sharma wrote:
> > Hello,
> > 
> > This patch series adds a new SEV controller for tracking and limiting
> > the usage of SEV ASIDs on the AMD SVM platform.
> > 
> > SEV ASIDs are used in creating encrypted VM and lightweight sandboxes
> > but this resource is in very limited quantity on a host.
> > 
> > This limited quantity creates issues like SEV ASID starvation and
> > unoptimized scheduling in the cloud infrastructure.
> > 
> > SEV controller provides SEV ASID tracking and resource control
> > mechanisms.
> 
> This should be genericized to not be SEV specific.  TDX has a similar
> scarcity issue in the form of key IDs, which IIUC are analogous to SEV ASIDs
> (gave myself a quick crash course on SEV ASIDs).  Functionally, I doubt it
> would change anything, I think it'd just be a bunch of renaming.  The hardest
> part would probably be figuring out a name :-).
> 
> Another idea would be to go even more generic and implement a KVM cgroup
> that accounts the number of VMs of a particular type, e.g. legacy, SEV,
> SEV-ES?, and TDX.  That has potential future problems though as it falls
> apart if hardware every supports 1:MANY VMs:KEYS, or if there is a need to
> account keys outside of KVM, e.g. if MKTME for non-KVM cases ever sees the
> light of day.

I read about the TDX and its use of the KeyID for encrypting VMs. TDX
has two kinds of KeyIDs private and shared.

On AMD platform there are two types of ASIDs for encryption.
1. SEV ASID - Normal runtime guest memory encryption.
2. SEV-ES ASID - Extends SEV ASID by adding register state encryption with
		 integrity.

Both types of ASIDs have their own maximum value which is provisioned in
the firmware

So, we are talking about 4 different types of resources:
1. AMD SEV ASID (implemented in this patch as sev.* files in SEV cgroup)
2. AMD SEV-ES ASID (in future, adding files like sev_es.*)
3. Intel TDX private KeyID
4. Intel TDX shared KeyID

TDX private KeyID is similar to SEV and SEV-ES ASID. I think coming up
with the same name which can be used by both platforms will not be easy,
and extensible with the future enhancements. This will get even more
difficult if Arm also comes up with something similar but with different
nuances.

I like the idea of the KVM cgroup and when it is mounted it will have
different files based on the hardware platform.

1. KVM cgroup on AMD will have:
sev.max & sev.current.
sev_es.max & sev_es.current.

2. KVM cgroup mounted on Intel:
tdx_private_keys.max
tdx_shared_keys.max

The KVM cgroup can be used to have control files which are generic (no
use case in my mind right now) and hardware platform specific files
also.
