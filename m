Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D513529DB6
	for <lists+linux-doc@lfdr.de>; Tue, 17 May 2022 11:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242104AbiEQJQx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 17 May 2022 05:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244794AbiEQJQT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 May 2022 05:16:19 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87747632D
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 02:16:15 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id i8so2863806plr.13
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 02:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=onNloPT2vOHeOV/PSAtr8Uk19Uz1c04GpqkHIaBzWIY=;
        b=ZyE57yWZL+SFAnt+RCxLDdFdvh/Ti2hIPUBotwr6QjEtQZ6l+iylAXCbEacALkbQjL
         VvDYdcDpxNWpvmCuw5V6kkBxIerpdJ1it39e1AcUARaymO6JLB+O9Q2if8mkrwmK3JxQ
         pP8r9pMKAMaTlidnbgZyBS3sDVguddEuzS3BrrAdAjJCAVpsmfQu99GPH+e/3GfF+ZRw
         gr8Kgwnq/h6eSIkM7JunuCmfFQFqRSgzPd37lqeuYAcsHpE9d6raEHZyBAU16UlMgGD2
         KyHaf/GpDUjppELMMCFtwNgH+yIEj+lXLFGEaWxdZ+pqQ4MZ0CDr4gHHnGe3vaQSc5kE
         P+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=onNloPT2vOHeOV/PSAtr8Uk19Uz1c04GpqkHIaBzWIY=;
        b=WaMMq4rfL/JZhvlcyxpLiDftmNwUn5sLrkoebbOY/7+WoxR2StPrqthDI8vqakt/0K
         1MyRGAT3aypo0EoERu1rPXHYI3AtyXOx9yR4cCq1IQesllug/n0rIkJfpbJYHvTgfDil
         xJqky0TNMVXlUwIhdfDyYL7qdo7O6Z0lajDBbKEeAgT+VGIiEjVlbstJzro6OtMO2IqC
         LiMIeNo1b9PSoogBLFSL+3FuHl6CrSuqe76mlYphdObirFb2mHI8eCo79Cv7Y/Moqy9J
         a4PSwyAbF2pw5LAFFr4QNeAlCyaiLA2mLvxI20Xj3dKqn+m7A7XxbZ8gPR0bWK+eDUE7
         1Zpg==
X-Gm-Message-State: AOAM5330GANFYHHmqdGdpX0+RL5PlWfB088Lcm0n+wC5oqdqStAmEHIc
        izS4dIe1zYFVk5My46m4fWBllw==
X-Google-Smtp-Source: ABdhPJzuvNI99GDvviBh8Cb0S0VbIbzNldV4sCEMh/Ae6AtvyqRplmKR8tJnUOPkZJWORgAZgncEPQ==
X-Received: by 2002:a17:903:2d0:b0:14d:8a8d:cb1 with SMTP id s16-20020a17090302d000b0014d8a8d0cb1mr21430704plk.50.1652778975070;
        Tue, 17 May 2022 02:16:15 -0700 (PDT)
Received: from localhost ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id jc13-20020a17090325cd00b001618b4d86b3sm2978176plb.180.2022.05.17.02.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 02:16:14 -0700 (PDT)
Date:   Tue, 17 May 2022 17:16:11 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Oscar Salvador <osalvador@suse.de>
Cc:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        david@redhat.com, masahiroy@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        duanxiongchun@bytedance.com, smuchun@gmail.com
Subject: Re: [PATCH v12 7/7] mm: hugetlb_vmemmap: add
 hugetlb_optimize_vmemmap sysctl
Message-ID: <YoNn2+8VG7XxQ20Y@FVFYT0MHHV2J.usts.net>
References: <20220516102211.41557-1-songmuchun@bytedance.com>
 <20220516102211.41557-8-songmuchun@bytedance.com>
 <YoNXm2c5fJq8luqf@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoNXm2c5fJq8luqf@localhost.localdomain>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 17, 2022 at 10:06:51AM +0200, Oscar Salvador wrote:
> On Mon, May 16, 2022 at 06:22:11PM +0800, Muchun Song wrote:
> > We must add hugetlb_free_vmemmap=on (or "off") to the boot cmdline and
> > reboot the server to enable or disable the feature of optimizing vmemmap
> > pages associated with HugeTLB pages.  However, rebooting usually takes a
> > long time.  So add a sysctl to enable or disable the feature at runtime
> > without rebooting.  Why we need this?  There are 3 use cases.
> > 
> > 1) The feature of minimizing overhead of struct page associated with each
> > HugeTLB is disabled by default without passing "hugetlb_free_vmemmap=on"
> > to the boot cmdline. When we (ByteDance) deliver the servers to the
> > users who want to enable this feature, they have to configure the grub
> > (change boot cmdline) and reboot the servers, whereas rebooting usually
> > takes a long time (we have thousands of servers).  It's a very bad
> > experience for the users.  So we need a approach to enable this feature
> > after rebooting. This is a use case in our practical environment.
> > 
> > 2) Some use cases are that HugeTLB pages are allocated 'on the fly'
> > instead of being pulled from the HugeTLB pool, those workloads would be
> > affected with this feature enabled.  Those workloads could be identified
> > by the characteristics of they never explicitly allocating huge pages
> > with 'nr_hugepages' but only set 'nr_overcommit_hugepages' and then let
> > the pages be allocated from the buddy allocator at fault time.  We can
> > confirm it is a real use case from the commit 099730d67417.  For those
> > workloads, the page fault time could be ~2x slower than before. We
> > suspect those users want to disable this feature if the system has enabled
> > this before and they don't think the memory savings benefit is enough to
> > make up for the performance drop.
> > 
> > 3) If the workload which wants vmemmap pages to be optimized and the
> > workload which wants to set 'nr_overcommit_hugepages' and does not want
> > the extera overhead at fault time when the overcommitted pages be
> > allocated from the buddy allocator are deployed in the same server.
> > The user could enable this feature and set 'nr_hugepages' and
> > 'nr_overcommit_hugepages', then disable the feature.  In this case,
> > the overcommited HugeTLB pages will not encounter the extra overhead
> > at fault time.
> 
> I am having issues parsing point 3), specially the first part.
> IIUC, you are saying we have two kind of different workloads:
> 
> - one that wants to have hugetlb vmemmap pages optimized
> - one that wants to allocate hugetlb pages at fault time rather than
>   allocating them via /proc/..., but does not want to suffer the
>   overhead of optimizing the vmemmap pages when faulting them

I need to clarify this workload, the one that does not want to
suffer the overhead of optimizing the vmemmap pages when faulting
them instead of wanting to allocate hugetlb pages at fault time.
It is different from the one in the case 2). This one usually
configures 'nr_overcommit_hugepages' as well as 'nr_hugepages',
if it does not want to suffer the overhead of optimizing the
vmemmap pages when faulting pages (must be overcommitted pages),
then they could follow the steps mentioned above.

> 
> Then you say the user could enable the optimization and allocate
> those pages via nr_hugepages, and then disable the feature.
> So, when we fault in those pages, the pages are already in the
> pool, right? And are already optimized.
>

I mean the overcommitted pages (it could be allocated at fault
time) as explained above.

Thanks.
