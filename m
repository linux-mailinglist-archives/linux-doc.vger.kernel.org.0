Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE1B3CEFE3
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jul 2021 01:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351186AbhGSWr6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 19 Jul 2021 18:47:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27830 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1387060AbhGSUIL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jul 2021 16:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626727672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y7h6lI2j06CWA4PFkJ3/o8PCCfCme/nAjcw8Qib/v6k=;
        b=QAGQOQeEYdPa2YZO567/Gv20T98Pac2dTvgNvMqkiAu9g+oiFdE25R/kiUoLv3G21ssvKr
        7BYV6XGWOC8tmnThLcRxjfAAFYzAHP4jFgTDeHlaN2bUYR9LQ7ZIE+tPmDdp3oyRV89iw/
        uCnEN50DUbhVyhaTENahEhZlyItP8cM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-2o9qDDwrP9aiCTIkYOJ7hg-1; Mon, 19 Jul 2021 16:47:47 -0400
X-MC-Unique: 2o9qDDwrP9aiCTIkYOJ7hg-1
Received: by mail-wr1-f72.google.com with SMTP id i10-20020a5d55ca0000b029013b976502b6so9390452wrw.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 13:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Y7h6lI2j06CWA4PFkJ3/o8PCCfCme/nAjcw8Qib/v6k=;
        b=APLM+p/876bV1P0Bm/JaBMhP2vzsyXlrfhg9bVkpDzLYhOzLDikz3eukaRxexqlKfP
         IvIebzzFxD/zgkfgmcCfPp86YV9dvcpkIFEQp4J59CL+QlQk1cR7sjUpmT4JnRrUn1N9
         TB6v226WLjXs0CCW/nZwQ+9vq64fBf5EeS9yMKvDPguAd6t7rZENwXUnhmmnbp07WxMU
         MXat3/rz7+8mBOIM7srrRU3I1GISCwzGKux4Dvnp1PPxFxETLmWXdcV/defH1ok+U2cY
         Qy7Mpu6+aM5FHIoIf+ucDvjNmXNZSfRLNhe/YwzHJdhH4hw1t/S7BCAod2t3KgXWbUBd
         gEbg==
X-Gm-Message-State: AOAM532kLMpwgkmw4g8eLpiX613kgCh5MDCPz/EEb0G3WFTFjuCEojHm
        o1VagXh1NhP+i14TTpI6tO0ZiJN8TzWATZa2ZNrOTlApNNtAGZZTVIWnEOoF6wiDtOkmTjlEIUz
        2cuKfNVYhlRwq6TsISKEmPcobT4o9KAFJZ5vPPAzXqGsNVS/K24J6AZi8LU8KpHvJeLq+
X-Received: by 2002:a1c:9851:: with SMTP id a78mr33923873wme.33.1626727666730;
        Mon, 19 Jul 2021 13:47:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+ujxOnHrTzwvaBYr/KTSEr8E7a6K4CcyuRHwDXhC9uinDQ3SXPRp7phK7pAIZy40B+WK+oQ==
X-Received: by 2002:a1c:9851:: with SMTP id a78mr33923846wme.33.1626727666435;
        Mon, 19 Jul 2021 13:47:46 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f? (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de. [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
        by smtp.gmail.com with ESMTPSA id e3sm21662130wra.15.2021.07.19.13.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 13:47:46 -0700 (PDT)
To:     Peter Collingbourne <pcc@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Matthew Wilcox <willy@infradead.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>
Cc:     Jann Horn <jannh@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mm@kvack.org, kernel test robot <lkp@intel.com>,
        Linux API <linux-api@vger.kernel.org>,
        linux-doc@vger.kernel.org
References: <20210619092002.1791322-1-pcc@google.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4] mm: introduce reference pages
Message-ID: <3268d400-7435-f038-a1a1-f476adb03845@redhat.com>
Date:   Mon, 19 Jul 2021 22:47:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210619092002.1791322-1-pcc@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> +SYSCALL_DEFINE2(refpage_create, const void *__user, content, unsigned long,
> +		flags)
> +{
> +	unsigned long content_addr = (unsigned long)content;
> +	struct page *userpage;
> +	struct refpage_private_data *private_data;
> +	int fd;
> +
> +	if (flags != 0)
> +		return -EINVAL;
> +
> +	if ((content_addr & (PAGE_SIZE - 1)) != 0 ||
> +	    get_user_pages(content_addr, 1, 0, &userpage, 0) != 1)
> +		return -EFAULT;
> +
> +	private_data = kzalloc(sizeof(struct refpage_private_data), GFP_KERNEL);
> +	if (!private_data) {
> +		put_page(userpage);
> +		return -ENOMEM;
> +	}
> +
> +	private_data->refpage = alloc_page(GFP_KERNEL);
> +	if (!private_data->refpage) {
> +		kfree(private_data);
> +		put_page(userpage);
> +		return -ENOMEM;
> +	}
> +
> +	copy_highpage(private_data->refpage, userpage);
> +	arch_prep_refpage_private_data(private_data);
> +	put_page(userpage);
> +
> +	fd = anon_inode_getfd("[refpage]", &refpage_file_operations,
> +			      private_data, O_RDONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		put_refpage_private_data(private_data);
> +
> +	return fd;
> +}
> 

Hi,

some questions:

1. is there any upper limit or can a simple process effectively flood 
the system with alloc_page(GFP_KERNEL)? (does ulimit -n apply or is it 
/proc/sys/fs/file-max)

2. Shouldn't there be a GFP_ACCOUNT or am I missing something important?

3. How does this interact with MADV_DONTNEED? I assume we'll be able to 
zap the mapped refpage and on refault, we'll map in the refpage again, 
correct?

-- 
Thanks,

David / dhildenb

