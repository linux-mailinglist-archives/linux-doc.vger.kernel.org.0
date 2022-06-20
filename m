Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5225513AE
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jun 2022 11:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240468AbiFTJFi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Jun 2022 05:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240469AbiFTJF2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Jun 2022 05:05:28 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3AC12A89
        for <linux-doc@vger.kernel.org>; Mon, 20 Jun 2022 02:05:16 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id h192so9755579pgc.4
        for <linux-doc@vger.kernel.org>; Mon, 20 Jun 2022 02:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3UAMRgLNUKIxsrxlZlgJWjAL/qolC/AWmLK/+MOtFbU=;
        b=UuqARljvt2lDepH6j3+On0x8yTeDj7JkXgMOkTHBJFvzV4XNnbPVVgNM9AMphFEIhh
         yBH/qPyqO8aHdFOHI4K/ZlSa0iGmE3KuvqtKemXbstoFSdxwuYy0EIhdf3X5Vfp4pzb3
         hDBlFnp2xqY8vtn1RXCLYHTceZ19brPP4253HFAjAJr20ijxluZ48t/vOV+dvZtKE1Ri
         P3Qm1MhYnhC/yr4pk2ydDPYJockJvJ8+f/vEaUzO9L7nIKDiMWV+PCNzoJnLF5LToHhZ
         VOc2KL+3iaNPKJN6DYGb32YS6BDhcbEf3bQtfWtYbbiWH0rGP4vl1U/Vh+LlieBvlAfK
         unqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3UAMRgLNUKIxsrxlZlgJWjAL/qolC/AWmLK/+MOtFbU=;
        b=dF+hwu5xlRcWx52GrfOKVXoKiDPpCORelFkp6UTEUTAYYU7BKzGKlKs4/SUA1ij1YX
         n3+HVxGL8wJtIawfun3fWISwCj1JFpPbF+g2S/vLd0oiQijv0Ohy0O6Eef8IG1GZxgot
         YrumcwnNvGvYeouPcbKF1s3mN8BIvbxEWl+21ftJC/RcrKinnab9bvjckroxGmQW4E3x
         Exv/hT+uSFTuSELqn732aAF50YJqprYBx68lDnug2HJDkC3G08OWAnRQE/pEDEVWkr5O
         AjVFrIg90shaSfQK1DHNwq2CO7U0b5v6USdi9tt9Z/UYAtmdoFWcBNCtAY6X67G0MI77
         ckGw==
X-Gm-Message-State: AJIora87n20QrjxlG9/cndeS12zQECO6FXTc+uzoDREqcbXlkKO3Ascm
        7JbcLTabiA2dPhUPvi835bdKeMKAbOshD3i6TKU=
X-Google-Smtp-Source: AGRyM1uFneyj/aNF0LntK4npbU3wUwEEFOJ5Gi7b2Ac3jTlxoh2hJBKVvvO6kYk72pHsKmsc5l0txQ==
X-Received: by 2002:aa7:8426:0:b0:525:23bf:1b78 with SMTP id q6-20020aa78426000000b0052523bf1b78mr4184127pfn.26.1655715915994;
        Mon, 20 Jun 2022 02:05:15 -0700 (PDT)
Received: from localhost ([139.177.225.239])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902650b00b001624b1e1a7bsm8059940plk.250.2022.06.20.02.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 02:05:15 -0700 (PDT)
Date:   Mon, 20 Jun 2022 17:05:10 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Oscar Salvador <osalvador@suse.de>
Cc:     David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
        corbet@lwn.net, mike.kravetz@oracle.com, paulmck@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com
Subject: Re: [PATCH v4 2/2] mm: memory_hotplug: make hugetlb_optimize_vmemmap
 compatible with memmap_on_memory
Message-ID: <YrA4RpM2SMn5RNnq@FVFYT0MHHV2J.usts.net>
References: <20220619133851.68184-1-songmuchun@bytedance.com>
 <20220619133851.68184-3-songmuchun@bytedance.com>
 <YrAgUtV6wD6CIrad@FVFYT0MHHV2J.usts.net>
 <226243a9-b4f5-182e-1a5b-7b8d5c28f3b3@redhat.com>
 <YrAv18GnMOcQaAxz@FVFYT0MHHV2J.usts.net>
 <YrAzeHbYt1mAs9ue@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrAzeHbYt1mAs9ue@localhost.localdomain>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 20, 2022 at 10:44:40AM +0200, Oscar Salvador wrote:
> On Mon, Jun 20, 2022 at 04:29:11PM +0800, Muchun Song wrote:
> > > > Although it works, I think PageVmemmapSelfHosted() check for the 1st pfn's
> > > > vmemmap page is not always reliable.  Since we reused PG_owner_priv_1
> > > > as PG_vmemmap_self_hosted, the test is noly reliable for vmemmap page's
> > > > vmemmap page.  Other non-vmemmap page can be flagged with PG_owner_priv_1.
> > > > So this check can be false-positive. Maybe the following code snippet is
> > > > the solution.
> > > 
> > > How could that happen for pages used for backing a vmemmap?
> > >
> > 
> > It cannot happen for memmap_on_memory case. Howwver, it can happen for other
> > cases. E.g. the 1st pfn (of boot memory block) whose vmemmap page may be flagged
> > as PG_owner_priv_1 (if PG_swapcache is set). Then, the check is false-positive.
> 
> If this can really happen, which I am not that sure tbh, maybe a way out would be

I need to clarify this only can be happened by using this approach implemented
in this patch.

For a boot memory block, the vemmmap pages are not slef-hosted.  So the 1st pfn (of
this memory block) can be allocated to other users. e.g. an anonymous page with
PG_swapcache set.  In this patch, ALIGN_DOWN(pfn, PHYS_PFN(memory_block_size_bytes()))
will located on this anonymous page, then the check is false-positive.

[                  boot memory block                  ]
[        section        ][...][        section        ]
[                   usable memory                     ]

> to just define a new page-type as we did in previous versions of memmap_on_memory.
> In that way we would not for flags, but for its type.
>

I think we do not need to introduced a new flag, we just make sure the page
passed to PageVmemmapSelfHosted() is a backing page for vmemmap. Then we
cannot incur false-positive.  The feasible solution is walking page tables
to find a vmemmap page's backing page.

Thanks.
 
> But as I said, I am not entirely sure about the potential fallout of what you mention.
> 
> 
> -- 
> Oscar Salvador
> SUSE Labs
> 
