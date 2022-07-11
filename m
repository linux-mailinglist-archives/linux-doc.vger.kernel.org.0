Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0B1A569544
	for <lists+linux-doc@lfdr.de>; Thu,  7 Jul 2022 00:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbiGFW0f (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 Jul 2022 18:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234193AbiGFW0e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 18:26:34 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9AB2AE30
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 15:26:33 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id n7so4725347ioo.7
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 15:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tdMeO7jrD/dIfpY7p2JB9yqnBwdG8BahWjwdHXRbu1k=;
        b=naH4kwPAB5R8CvE/dGvN0fuWyppIK1xf3NBrtyjW3Y41AYDfdBR/vtTJnvbs61H6Bo
         ctYrY2owT9GvOmsWDgCOAHQ9N4p3OuMvnM15cYJnx8ESbgjggdI3/H3dE5nyD24iZiro
         35f2BbIakOw/NQnp6rDPvUYH56fdY3+FoExVEiTlkSriCXKCBNApax4DuFDx0PiUOnGo
         Sb4FO7GPktbl3uEUcchhWKqeD/MWyl0Bw0HJ29aEPK1/cCnq/tBxWsiqivcUreYflkEl
         5tQnpP8XmFtnwcM5inWfp5G8mEVBx8TmTScYhsQqkDh/aIWK+uurX2OglenfVAYr/j11
         vovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tdMeO7jrD/dIfpY7p2JB9yqnBwdG8BahWjwdHXRbu1k=;
        b=p+EcplhxqWt5Uf4bPcMGA0kQduVp2EGaMz/T1CO3tMmgWwSLxYlFsPr89tJxwPEOm5
         FZJ+tgnzbOAr3V4rjYOsK9kHpURY8uVq0F4BIn+26P0enABoS34F31NViuZNsu5XnQXB
         Lz0etAv8c6+le58aw37xVvteRq6b3UHqvYzAhq/BH+U/gzC0HpQByRRxsiggk1QFaG4M
         XIM/1IO+pIYnbuO2FN7Ur9kTBpkdNEIeIdDqGqnqrimehcy5PNYdC0ila7gfPcVZkZ2h
         u0Cgv4alKvtDiUa4fVIlpo/l/GvdIHLwyq2wdhq6D2O6VYKqs74dz5Z+33bUDRjEqQ8W
         vuCA==
X-Gm-Message-State: AJIora+pTqoEVC+pa5UqWoOD9jI/aOtTMNCi0e5GMC3nkPOGM9NGCnDD
        3LZd2D+am/tFhUEC2+KpgdW0YQ==
X-Google-Smtp-Source: AGRyM1s0AIMCH99LiToMeYSdiGPBoRUTHvuuNfnnciKcHf9pq+YmScNTAa9bLACPyJfsm70G4LXStw==
X-Received: by 2002:a05:6638:31c2:b0:32e:167a:d887 with SMTP id n2-20020a05663831c200b0032e167ad887mr26983433jav.197.1657146393078;
        Wed, 06 Jul 2022 15:26:33 -0700 (PDT)
Received: from google.com ([2620:15c:183:200:b89c:e10a:466e:cf7d])
        by smtp.gmail.com with ESMTPSA id e25-20020a0566380cd900b00339ee768069sm16275743jak.74.2022.07.06.15.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 15:26:32 -0700 (PDT)
Date:   Wed, 6 Jul 2022 16:26:27 -0600
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Liam Howlett <liam.howlett@oracle.com>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        page-reclaim@google.com, Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        Holger =?iso-8859-1?Q?Hoffst=E4tte?= 
        <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v13 08/14] mm: multi-gen LRU: support page table walks
Message-ID: <YsYMEwJCL4GE0Cx6@google.com>
References: <20220706220022.968789-1-yuzhao@google.com>
 <20220706220022.968789-9-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706220022.968789-9-yuzhao@google.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 06, 2022 at 04:00:17PM -0600, Yu Zhao wrote:

...

> +/*
> + * Some userspace memory allocators map many single-page VMAs. Instead of
> + * returning back to the PGD table for each of such VMAs, finish an entire PMD
> + * table to reduce zigzags and improve cache performance.
> + */
> +static bool get_next_vma(unsigned long mask, unsigned long size, struct mm_walk *args,
> +			 unsigned long *vm_start, unsigned long *vm_end)
> +{
> +	unsigned long start = round_up(*vm_end, size);
> +	unsigned long end = (start | ~mask) + 1;
> +
> +	VM_WARN_ON_ONCE(mask & size);
> +	VM_WARN_ON_ONCE((start & mask) != (*vm_start & mask));
> +
> +	while (args->vma) {
> +		if (start >= args->vma->vm_end) {
> +			args->vma = args->vma->vm_next;
> +			continue;
> +		}
> +
> +		if (end && end <= args->vma->vm_start)
> +			return false;
> +
> +		if (should_skip_vma(args->vma->vm_start, args->vma->vm_end, args)) {
> +			args->vma = args->vma->vm_next;
> +			continue;
> +		}
> +
> +		*vm_start = max(start, args->vma->vm_start);
> +		*vm_end = min(end - 1, args->vma->vm_end - 1) + 1;
> +
> +		return true;
> +	}
> +
> +	return false;
> +}

To make the above work on top of the Maple Tree:

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 7096ff7836db..c0c1195da803 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3689,23 +3689,14 @@ static bool get_next_vma(unsigned long mask, unsigned long size, struct mm_walk
 {
 	unsigned long start = round_up(*vm_end, size);
 	unsigned long end = (start | ~mask) + 1;
+	VMA_ITERATOR(vmi, args->mm, start);
 
 	VM_WARN_ON_ONCE(mask & size);
 	VM_WARN_ON_ONCE((start & mask) != (*vm_start & mask));
 
-	while (args->vma) {
-		if (start >= args->vma->vm_end) {
-			args->vma = args->vma->vm_next;
+	for_each_vma_range(vmi, args->vma, end) {
+		if (should_skip_vma(args->vma->vm_start, args->vma->vm_end, args))
 			continue;
-		}
-
-		if (end && end <= args->vma->vm_start)
-			return false;
-
-		if (should_skip_vma(args->vma->vm_start, args->vma->vm_end, args)) {
-			args->vma = args->vma->vm_next;
-			continue;
-		}
 
 		*vm_start = max(start, args->vma->vm_start);
 		*vm_end = min(end - 1, args->vma->vm_end - 1) + 1;
