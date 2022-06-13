Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8201C5490F3
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jun 2022 18:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350994AbiFMMVz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Jun 2022 08:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359455AbiFMMUE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 08:20:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 626985713A
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 04:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655118197;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j5D3sK3qxzP9CGnwsiLKPN/J+KjY10e+k7sKDOcqT5o=;
        b=BpQnBRJkM+s/JPW3AwqucdVXJhFoPad+rXc4rMel291fDEE1AjZBJQ88JKERjhwpplUGai
        DGZ4TwlSg4wGbtLQMq+9g3npiZCOgkqTcQuNFKN/X0Fj/yyXdrwBb/3ABekRgqiTHfQ2oV
        0mtJwwvbcaZFCI9nUr/hdp0tQssaqLQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-FlRWUjzXMyS2HTfVLPS_7g-1; Mon, 13 Jun 2022 07:03:16 -0400
X-MC-Unique: FlRWUjzXMyS2HTfVLPS_7g-1
Received: by mail-wm1-f72.google.com with SMTP id l3-20020a05600c1d0300b0039c7efa2526so3025625wms.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 04:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=j5D3sK3qxzP9CGnwsiLKPN/J+KjY10e+k7sKDOcqT5o=;
        b=oYZzSZRfxC66h5Pgvi7MqbaSq4KuKNckw7Qe7+1EzwM/3gx4K4QnZdXME+4/Evxwpz
         W3D1oKw1rwRdYuf5Idu1j8Y4r0AjyTV7ZgH8aulutDaKW/0FOD/QyAyOrl/fdREN+xYo
         gz2Yg3jGehh88e5Q6bBzeA/UYGbOMT16XrBmR87FZWpa7NCmvkD5KK2wJtK/6nqU5ReY
         VGadIMRNSfQCtC+hx3uVpS3LKG71OM7JcJ2QTk+US9U7IvJlw6ZXva6vjou7p491EhgA
         85XipZJmN6jMti9ky5eyWMrJuSe4N017LuzQD5JyFWCkRne1RP7Ra5bvjet3pBF7yzl+
         rz2Q==
X-Gm-Message-State: AOAM530UQxaNQrp2CcrzdxwFztyiVffealgQIpNaka7yiycqlLsNpAcB
        c9li/y6aUgeiNFTyEn6cpGN+nAoLO0qCbjWi3LYvw2ZdPugLo/mnlIqabyr7w49MJZzorNIURDx
        xABHPp2Yoi56JxbStWb2F
X-Received: by 2002:a05:600c:3508:b0:39c:8240:5538 with SMTP id h8-20020a05600c350800b0039c82405538mr13049410wmq.165.1655118195260;
        Mon, 13 Jun 2022 04:03:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDoO2UACoWH0XUMegJUwRA9D70xt70UBbXMGCQlKNX3UWoHBV/NMn9vGGLzctDprJh1GcUdg==
X-Received: by 2002:a05:600c:3508:b0:39c:8240:5538 with SMTP id h8-20020a05600c350800b0039c82405538mr13049370wmq.165.1655118194993;
        Mon, 13 Jun 2022 04:03:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:bd00:963c:5455:c10e:fa6f? (p200300cbc706bd00963c5455c10efa6f.dip0.t-ipconnect.de. [2003:cb:c706:bd00:963c:5455:c10e:fa6f])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d4247000000b0021018642ff8sm8136796wrr.76.2022.06.13.04.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 04:03:14 -0700 (PDT)
Message-ID: <4c4cf0a8-aab6-2a17-e1f9-59d6700821b7@redhat.com>
Date:   Mon, 13 Jun 2022 13:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 4/6] mm: Limit warning message in vmemmap_verify() to
 once
Content-Language: en-US
To:     Wupeng Ma <mawupeng1@huawei.com>, corbet@lwn.net, will@kernel.org,
        ardb@kernel.org, catalin.marinas@arm.com
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        dvhart@infradead.org, andy@infradead.org, rppt@kernel.org,
        akpm@linux-foundation.org, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, paulmck@kernel.org,
        keescook@chromium.org, songmuchun@bytedance.com,
        rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
        swboyd@chromium.org, wei.liu@kernel.org, robin.murphy@arm.com,
        anshuman.khandual@arm.com, thunder.leizhen@huawei.com,
        wangkefeng.wang@huawei.com, gpiccoli@igalia.com,
        chenhuacai@kernel.org, geert@linux-m68k.org,
        vijayb@linux.microsoft.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org
References: <20220613082147.183145-1-mawupeng1@huawei.com>
 <20220613082147.183145-5-mawupeng1@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220613082147.183145-5-mawupeng1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13.06.22 10:21, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> For a system only have limited mirrored memory or some numa node without
> mirrored memory, the per node vmemmap page_structs prefer to allocate
> memory from mirrored region, which will lead to vmemmap_verify() in
> vmemmap_populate_basepages() report lots of warning message.
> 
> This patch change the frequency of "potential offnode page_structs" warning
> messages to only once to avoid a very long print during bootup.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>  mm/sparse-vmemmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index f4fa61dbbee3..f34c6889b0a6 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -528,7 +528,7 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
>  	int actual_node = early_pfn_to_nid(pfn);
>  
>  	if (node_distance(actual_node, node) > LOCAL_DISTANCE)
> -		pr_warn("[%lx-%lx] potential offnode page_structs\n",
> +		pr_warn_once("[%lx-%lx] potential offnode page_structs\n",
>  			start, end - 1);
>  }
>  

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

