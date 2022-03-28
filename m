Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F194E96BA
	for <lists+linux-doc@lfdr.de>; Mon, 28 Mar 2022 14:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242522AbiC1Mfq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Mar 2022 08:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242534AbiC1Mfj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 08:35:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DFEE76442
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648470830;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ROdC7Jw3x8bFNSVJnYtQV9N5qoumVwi1dU/TOVEmlwk=;
        b=i5wEWOWkeh+r1PfatBL4xI8RFp44WdBs40kSH9DkQUTutJVfD1orJAEGgkrDrqN587myuw
        Iv3msY7QCUUanHyNSaHakWDVgqt2SFOBFoBsZMCs/6jOx599WaObxG6WrG1QAV5WdfFF9y
        OmRneu+qcI8zuucvj5HjAux9jeuYVCg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-243_rfmyPI2Mhh-PGnP20g-1; Mon, 28 Mar 2022 08:33:48 -0400
X-MC-Unique: 243_rfmyPI2Mhh-PGnP20g-1
Received: by mail-wm1-f69.google.com with SMTP id v191-20020a1cacc8000000b0038ce818d2efso3440180wme.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=ROdC7Jw3x8bFNSVJnYtQV9N5qoumVwi1dU/TOVEmlwk=;
        b=AhC4RfsKlgTZowHIAkFTqFvM1I10C1rG6ynAC6i8hqHINS697YBCUGY1W2yuKDAhMN
         4IKiBQuDgJQTFi1UxNOahtf15G9rYFNeOdsg5xP63bqZw11w5+zSYfMCfDg/DmqXfLQz
         ShFfq/5cGZRbTRc3gDfagg4ilGWj5OJWV+ijyTvzA+S9BO7v+bVsaMZ5hoGEYq/DSVlj
         If9xoJl8IU/qmHVAP9u3JXEwaPF9l5/pOtq4Z0vabXnHf1d93tolvqd4JNskh0uA8U8v
         T9V0c6n1xm99IBFAvfjztVsFCH4jNyhgwYf69Ho4ZTiPZUxjG0dMBBsjV41DK9CcyFfn
         oR+w==
X-Gm-Message-State: AOAM532ZPYNP5Tsbw78EcrGdVREiKEu9xh0/MJkk5u5P4VBtY43Afkxr
        WVLzMqGdkQKedlB96icJ3eHlP33spg7jyPB5FX/hLOWZL/6KmZWrMvuxFp6mZj2zfOQC1vFpHj2
        /8d9FprvrwVe9WrgoHNOd
X-Received: by 2002:a7b:c20b:0:b0:38c:6ed9:f4f with SMTP id x11-20020a7bc20b000000b0038c6ed90f4fmr26635153wmi.131.1648470827368;
        Mon, 28 Mar 2022 05:33:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhJwZZoG6Q1E+o6y6M1ilGgoNUpfEciP71qUcwMG1+HNmb4HQyx8CnO6u8Jy0aUNhZ3oDjCQ==
X-Received: by 2002:a7b:c20b:0:b0:38c:6ed9:f4f with SMTP id x11-20020a7bc20b000000b0038c6ed90f4fmr26635096wmi.131.1648470827144;
        Mon, 28 Mar 2022 05:33:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:2200:50d1:ff5c:5927:203a? (p200300cbc704220050d1ff5c5927203a.dip0.t-ipconnect.de. [2003:cb:c704:2200:50d1:ff5c:5927:203a])
        by smtp.gmail.com with ESMTPSA id a11-20020a5d456b000000b0020406ce0e06sm12047500wrc.94.2022.03.28.05.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 05:33:46 -0700 (PDT)
Message-ID: <15e3f11b-1551-a9c2-c348-bbe1ae1d9ef7@redhat.com>
Date:   Mon, 28 Mar 2022 14:33:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 7/9] mm: Calc the right pfn if page size is not 4K
Content-Language: en-US
To:     Wupeng Ma <mawupeng1@huawei.com>, akpm@linux-foundation.org,
        catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net
Cc:     ardb@kernel.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zyccr.com, dvhart@infradead.org, andy@infradead.org,
        rppt@kernel.org, paulmck@kernel.org, peterz@infradead.org,
        jroedel@suse.de, songmuchun@bytedance.com, macro@orcam.me.uk,
        frederic@kernel.org, W_Armin@gmx.de, john.garry@huawei.com,
        seanjc@google.com, tsbogend@alpha.franken.de,
        anshuman.khandual@arm.com, chenhuacai@kernel.org,
        gpiccoli@igalia.com, mark.rutland@arm.com,
        wangkefeng.wang@huawei.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org
References: <20220326064632.131637-1-mawupeng1@huawei.com>
 <20220326064632.131637-8-mawupeng1@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220326064632.131637-8-mawupeng1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 26.03.22 07:46, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> Pervious 0x100000 is used to check the 4G limit in

s/Pervious/Previous/

> find_zone_movable_pfns_for_nodes(). This is right in x86 because
> the page size can only be 4K. But 16K and 64K are available in
> arm64. So replate it with SIZE_4G >> PAGE_SHIFT.

s/replate/replace/

> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>  mm/page_alloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 6e0b4596cde9..41fd987b5b93 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -7811,7 +7811,7 @@ static void __init find_zone_movable_pfns_for_nodes(void)
>  
>  			usable_startpfn = memblock_region_memory_base_pfn(r);
>  
> -			if (usable_startpfn < 0x100000) {
> +			if (usable_startpfn < (SZ_4G >> PAGE_SHIFT)) {

PHYS_PFN(SZ_4G)

?

>  				mem_below_4gb_not_mirrored = true;
>  				continue;
>  			}


-- 
Thanks,

David / dhildenb

