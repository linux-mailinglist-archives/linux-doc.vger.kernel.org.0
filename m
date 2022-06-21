Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40964552A78
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jun 2022 07:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344235AbiFUFdd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 21 Jun 2022 01:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344211AbiFUFdd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Jun 2022 01:33:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 258BD2181B
        for <linux-doc@vger.kernel.org>; Mon, 20 Jun 2022 22:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655789608;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=h+MrydMOJRPtRlmLWVZnu2Vf2FmC8y0u+vnzj78C7Ng=;
        b=YnjOqj7YNRlIDhkRQzylc+Rvf46pWb6KT5Fwj7/jJOInhvUL9q9PmNcs05p7Y4sZKJ+OdO
        rLWEMetuveGl5OndTtcyXS9TIkI88kxVei0OcHMomf9VHI4pO1ixFRodUqYTI9JQOOj185
        8B8HFfdAMAeQjfoSQn/qzIIx3jW9ufk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-pyhe4RwjNv-T_j2ChAXYbA-1; Tue, 21 Jun 2022 01:33:24 -0400
X-MC-Unique: pyhe4RwjNv-T_j2ChAXYbA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9735101AA47;
        Tue, 21 Jun 2022 05:33:23 +0000 (UTC)
Received: from localhost (ovpn-12-183.pek2.redhat.com [10.72.12.183])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 303CF492C3B;
        Tue, 21 Jun 2022 05:33:21 +0000 (UTC)
Date:   Tue, 21 Jun 2022 13:33:17 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Zhen Lei <thunder.leizhen@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Dave Young <dyoung@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Feng Zhou <zhoufeng.zf@bytedance.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Chen Zhou <dingguo.cz@antgroup.com>,
        John Donnelly <John.p.donnelly@oracle.com>,
        Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: Re: [PATCH 5/5] arm64: kdump: Don't defer the reservation of crash
 high memory
Message-ID: <YrFYHYgX3mC//t2l@MiWiFi-R3L-srv>
References: <20220613080932.663-1-thunder.leizhen@huawei.com>
 <20220613080932.663-6-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613080932.663-6-thunder.leizhen@huawei.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 06/13/22 at 04:09pm, Zhen Lei wrote:
> If the crashkernel has both high memory above DMA zones and low memory
> in DMA zones, kexec always loads the content such as Image and dtb to the
> high memory instead of the low memory. This means that only high memory
> requires write protection based on page-level mapping. The allocation of
> high memory does not depend on the DMA boundary. So we can reserve the
> high memory first even if the crashkernel reservation is deferred.
> 
> This means that the block mapping can still be performed on other kernel
> linear address spaces, the TLB miss rate can be reduced and the system
> performance will be improved.

Ugh, this looks a little ugly, honestly.

If that's for sure arm64 can't split large page mapping of linear
region, this patch is one way to optimize linear mapping. Given kdump
setting is necessary on arm64 server, the booting speed is truly
impacted heavily.

However, I would suggest letting it as is with below reasons:

1) The code will complicate the crashkernel reservatoin code which
is already difficult to understand. 
2) It can only optimize the two cases, first is CONFIG_ZONE_DMA|DMA32
  disabled, the other is crashkernel=,high is specified. While both
  two cases are corner case, most of systems have CONFIG_ZONE_DMA|DMA32
  enabled, and most of systems have crashkernel=xM which is enough.
  Having them optimized won't bring benefit to most of systems.
3) Besides, the crashkernel=,high can be handled earlier because 
  arm64 alwasys have memblock.bottom_up == false currently, thus we
  don't need worry arbout the lower limit of crashkernel,high
  reservation for now. If memblock.bottom_up is set true in the future,
  this patch doesn't work any more.


...
        crash_base = memblock_phys_alloc_range(crash_size, CRASH_ALIGN,
                                               crash_base, crash_max);

So, in my opinion, we can leave the current NON_BLOCK|SECT mapping as
is caused by crashkernel reserving, since no regression is brought.
And meantime, turning to check if there's any way to make the contiguous
linear mapping and later splitting work. The patch 4, 5 in this patchset
doesn't make much sense to me, frankly speaking.

Thanks
Baoquan

> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  arch/arm64/mm/init.c | 71 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 65 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index fb24efbc46f5ef4..ae0bae2cafe6ab0 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -141,15 +141,44 @@ static void __init reserve_crashkernel(int dma_state)
>  	unsigned long long crash_max = CRASH_ADDR_LOW_MAX;
>  	char *cmdline = boot_command_line;
>  	int dma_enabled = IS_ENABLED(CONFIG_ZONE_DMA) || IS_ENABLED(CONFIG_ZONE_DMA32);
> -	int ret;
> +	int ret, skip_res = 0, skip_low_res = 0;
>  	bool fixed_base;
>  
>  	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
>  		return;
>  
> -	if ((!dma_enabled && (dma_state != DMA_PHYS_LIMIT_UNKNOWN)) ||
> -	     (dma_enabled && (dma_state != DMA_PHYS_LIMIT_KNOWN)))
> -		return;
> +	/*
> +	 * In the following table:
> +	 * X,high  means crashkernel=X,high
> +	 * unknown means dma_state = DMA_PHYS_LIMIT_UNKNOWN
> +	 * known   means dma_state = DMA_PHYS_LIMIT_KNOWN
> +	 *
> +	 * The first two columns indicate the status, and the last two
> +	 * columns indicate the phase in which crash high or low memory
> +	 * needs to be reserved.
> +	 *  ---------------------------------------------------
> +	 * | DMA enabled | X,high used |  unknown  |   known   |
> +	 *  ---------------------------------------------------
> +	 * |      N            N       |    low    |    NOP    |
> +	 * |      Y            N       |    NOP    |    low    |
> +	 * |      N            Y       |  high/low |    NOP    |
> +	 * |      Y            Y       |    high   |    low    |
> +	 *  ---------------------------------------------------
> +	 *
> +	 * But in this function, the crash high memory allocation of
> +	 * crashkernel=Y,high and the crash low memory allocation of
> +	 * crashkernel=X[@offset] for crashk_res are mixed at one place.
> +	 * So the table above need to be adjusted as below:
> +	 *  ---------------------------------------------------
> +	 * | DMA enabled | X,high used |  unknown  |   known   |
> +	 *  ---------------------------------------------------
> +	 * |      N            N       |    res    |    NOP    |
> +	 * |      Y            N       |    NOP    |    res    |
> +	 * |      N            Y       |res/low_res|    NOP    |
> +	 * |      Y            Y       |    res    |  low_res  |
> +	 *  ---------------------------------------------------
> +	 *
> +	 */
>  
>  	/* crashkernel=X[@offset] */
>  	ret = parse_crashkernel(cmdline, memblock_phys_mem_size(),
> @@ -169,10 +198,33 @@ static void __init reserve_crashkernel(int dma_state)
>  		else if (ret)
>  			return;
>  
> +		/* See the third row of the second table above, NOP */
> +		if (!dma_enabled && (dma_state == DMA_PHYS_LIMIT_KNOWN))
> +			return;
> +
> +		/* See the fourth row of the second table above */
> +		if (dma_enabled) {
> +			if (dma_state == DMA_PHYS_LIMIT_UNKNOWN)
> +				skip_low_res = 1;
> +			else
> +				skip_res = 1;
> +		}
> +
>  		crash_max = CRASH_ADDR_HIGH_MAX;
>  	} else if (ret || !crash_size) {
>  		/* The specified value is invalid */
>  		return;
> +	} else {
> +		/* See the 1-2 rows of the second table above, NOP */
> +		if ((!dma_enabled && (dma_state == DMA_PHYS_LIMIT_KNOWN)) ||
> +		     (dma_enabled && (dma_state == DMA_PHYS_LIMIT_UNKNOWN)))
> +			return;
> +	}
> +
> +	if (skip_res) {
> +		crash_base = crashk_res.start;
> +		crash_size = crashk_res.end - crashk_res.start + 1;
> +		goto check_low;
>  	}
>  
>  	fixed_base = !!crash_base;
> @@ -202,9 +254,18 @@ static void __init reserve_crashkernel(int dma_state)
>  		return;
>  	}
>  
> +	crashk_res.start = crash_base;
> +	crashk_res.end = crash_base + crash_size - 1;
> +
> +check_low:
> +	if (skip_low_res)
> +		return;
> +
>  	if ((crash_base >= CRASH_ADDR_LOW_MAX) &&
>  	     crash_low_size && reserve_crashkernel_low(crash_low_size)) {
>  		memblock_phys_free(crash_base, crash_size);
> +		crashk_res.start = 0;
> +		crashk_res.end = 0;
>  		return;
>  	}
>  
> @@ -219,8 +280,6 @@ static void __init reserve_crashkernel(int dma_state)
>  	if (crashk_low_res.end)
>  		kmemleak_ignore_phys(crashk_low_res.start);
>  
> -	crashk_res.start = crash_base;
> -	crashk_res.end = crash_base + crash_size - 1;
>  	insert_resource(&iomem_resource, &crashk_res);
>  }
>  
> -- 
> 2.25.1
> 

