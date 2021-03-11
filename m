Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05862336C5C
	for <lists+linux-doc@lfdr.de>; Thu, 11 Mar 2021 07:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhCKGiH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 11 Mar 2021 01:38:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbhCKGhf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Mar 2021 01:37:35 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7551FC061761
        for <linux-doc@vger.kernel.org>; Wed, 10 Mar 2021 22:37:13 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id x29so13045231pgk.6
        for <linux-doc@vger.kernel.org>; Wed, 10 Mar 2021 22:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BeQyTYDxu+mGro++oymiELRqMwjIOrSXrDik0WPZ8lQ=;
        b=RZcW539H9MWd36hiZs7lgXBG+XKoPV1/UUl8taMCto0bKxozH4ZDvSAKp7CCZachZT
         9E4blGTxybgDyo/hGSqFw7sL2STmxtGOq5RP9siA6QmFT97Ajcy7pLzzFDf495LWH73T
         URxCbfagkbTTmMqc/w79Jnc5wAMaRyNaoIC3NZu4wMOITPm3V3s9aMdcGW7DT9zNVXT9
         vgXbom7xazFXS1mdWKxWVm7n6EZakzjJe4T9m++tMoXpdLNfmhYC5SwJjm43VxRapdZ7
         pvmcJisV+ygxOLcHCTXiIa6dLt7Vb4417l/gcjGkTUc0+yaYuMCCDNfwCtF9ZfzMDyGK
         ZWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BeQyTYDxu+mGro++oymiELRqMwjIOrSXrDik0WPZ8lQ=;
        b=MjDDKeIwimUVZMgyrOML8e1c6rH+63j/zrk9M+Xn1NQIiopKpvGfO/wxROAMv5FqPM
         kKSQrDBJ1kPClDG2YFC/qOobAJeNu9Ja4CkSGY6wZHji4P949edVTN7sIDi5ZTxaMRZc
         euVqxcYywiT+m6MFwGpQmCvDssISdRdEt3ZB57B68Hih0HXUnEPVsnr784lKI7W0g7pD
         b0DoYzKuGM5Rj4TXBUdPdLq+Qy1jXSKmit/D9YeY1vLka5GOh2xMBBAakUXXcucRVWFN
         sDCrKdBoYk7rKpe1AVl4aWFIcbvmobVAAr8viRMNFqv0nVSt7zu9nFLN528hRtfOGjiF
         2/OQ==
X-Gm-Message-State: AOAM533OvjAf6q/ANGmb5A/nNhuyOAwaNpQgpsd70td3hD9MAP/MihyW
        0IcW/msGyVml0ADQzaxKoGwY3aVMROvrCGKfOgGWYg==
X-Google-Smtp-Source: ABdhPJzK1UAVUjPA7zmyTIvbrAACo4MlpKdGzW6HkdeVszf/4mbQp6NKD8Nx74e3KVQB9Isx/GWCwqffONxKsgnFRfA=
X-Received: by 2002:a63:141e:: with SMTP id u30mr6156143pgl.31.1615444632963;
 Wed, 10 Mar 2021 22:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20210308102807.59745-1-songmuchun@bytedance.com>
 <20210308102807.59745-7-songmuchun@bytedance.com> <YEjnpwN8eDlyc08+@dhcp22.suse.cz>
 <4ed29af1-1114-a085-d47d-21d646963ab7@infradead.org>
In-Reply-To: <4ed29af1-1114-a085-d47d-21d646963ab7@infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 11 Mar 2021 14:36:35 +0800
Message-ID: <CAMZfGtW-DFYO=84-jzEp4WMiiBEjKHLN_JiWOyMisR+wXUoRkA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v18 6/9] mm: hugetlb: add a kernel
 parameter hugetlb_free_vmemmap
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Chen Huang <chenhuang5@huawei.com>,
        Bodeddula Balasubramaniam <bodeddub@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 11, 2021 at 1:16 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 3/10/21 7:37 AM, Michal Hocko wrote:
> > On Mon 08-03-21 18:28:04, Muchun Song wrote:
> >> Add a kernel parameter hugetlb_free_vmemmap to enable the feature of
> >> freeing unused vmemmap pages associated with each hugetlb page on boot.
> >>
> >> We disables PMD mapping of vmemmap pages for x86-64 arch when this
> >> feature is enabled. Because vmemmap_remap_free() depends on vmemmap
> >> being base page mapped.
> >>
> >> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> >> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> >> Reviewed-by: Barry Song <song.bao.hua@hisilicon.com>
> >> Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
> >> Tested-by: Chen Huang <chenhuang5@huawei.com>
> >> Tested-by: Bodeddula Balasubramaniam <bodeddub@amazon.com>
> >> ---
> >>  Documentation/admin-guide/kernel-parameters.txt | 14 ++++++++++++++
> >>  Documentation/admin-guide/mm/hugetlbpage.rst    |  3 +++
> >>  arch/x86/mm/init_64.c                           |  8 ++++++--
> >>  include/linux/hugetlb.h                         | 19 +++++++++++++++++++
> >>  mm/hugetlb_vmemmap.c                            | 24 ++++++++++++++++++++++++
> >>  5 files changed, 66 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> >> index 04545725f187..de91d54573c4 100644
> >> --- a/Documentation/admin-guide/kernel-parameters.txt
> >> +++ b/Documentation/admin-guide/kernel-parameters.txt
> >> @@ -1557,6 +1557,20 @@
> >>                      Documentation/admin-guide/mm/hugetlbpage.rst.
> >>                      Format: size[KMG]
> >>
> >> +    hugetlb_free_vmemmap=
> >> +                    [KNL] When CONFIG_HUGETLB_PAGE_FREE_VMEMMAP is set,
> >> +                    this controls freeing unused vmemmap pages associated
> >> +                    with each HugeTLB page. When this option is enabled,
> >> +                    we disable PMD/huge page mapping of vmemmap pages which
> >> +                    increase page table pages. So if a user/sysadmin only
> >> +                    uses a small number of HugeTLB pages (as a percentage
> >> +                    of system memory), they could end up using more memory
> >> +                    with hugetlb_free_vmemmap on as opposed to off.
> >> +                    Format: { on | off (default) }
> >
> > Please note this is an admin guide and for those this seems overly low
> > level. I would use something like the following
> >                       [KNL] Reguires CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> >                       enabled.
> >                       Allows heavy hugetlb users to free up some more
> >                       memory (6 * PAGE_SIZE for each 2MB hugetlb
> >                       page).
> >                       This feauture is not free though. Large page
> >                       tables are not use to back vmemmap pages which
>
>                                are not used

Thanks.

>
> >                       can lead to a performance degradation for some
> >                       workloads. Also there will be memory allocation
> >                       required when hugetlb pages are freed from the
> >                       pool which can lead to corner cases under heavy
> >                       memory pressure.
> >> +
> >> +                    on:  enable the feature
> >> +                    off: disable the feature
> >> +
> >>      hung_task_panic=
> >>                      [KNL] Should the hung task detector generate panics.
> >>                      Format: 0 | 1
>
>
> --
> ~Randy
>
