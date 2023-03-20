Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C02676C1013
	for <lists+linux-doc@lfdr.de>; Mon, 20 Mar 2023 12:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbjCTLBs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Mar 2023 07:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbjCTLBY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Mar 2023 07:01:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5E12A6EE
        for <linux-doc@vger.kernel.org>; Mon, 20 Mar 2023 03:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679309763;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Uev/6TIR5F3PclO8PFZRAwXYZNKhyqQFBI+8u5UniWw=;
        b=YqOfT8QgWqlRTD52936zGnWQaEhQ6o4/H/RxLYTvZfR6wmqUHBFW5zxcid+HsJQzEkogJ3
        fdSto1nYaYeBPejekD5bJ88FK9+voWRYSgryEupVj2mJ6gGsyC8YI93Vh11UV4GIy/+FqQ
        /gzmwKk5LoqreEbtNFOXiooHLHkg3fs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-dOJFQgZXOxWtE5AGUyPHKA-1; Mon, 20 Mar 2023 06:56:02 -0400
X-MC-Unique: dOJFQgZXOxWtE5AGUyPHKA-1
Received: by mail-wm1-f69.google.com with SMTP id o42-20020a05600c512a00b003ed26fa6ebdso4253064wms.7
        for <linux-doc@vger.kernel.org>; Mon, 20 Mar 2023 03:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679309761;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uev/6TIR5F3PclO8PFZRAwXYZNKhyqQFBI+8u5UniWw=;
        b=21w3hQ4nNAGANIZwJJJqDoj0HoaqQjXqrDdQrlZVoYdSSqKyoNVWDuG+SIALCBZP9l
         UfXkzBUv3IZIpQ3gFOUYhxnDMiV7FuD7BHnqujANi7ngtMFBtLsf8zmASkfR7JKjg4pB
         EzrS/JGSDhWY5Ajcigx1IuHAAl8oJpsWSn/GIJkVHI/fJgkbE5H0HtWISRUZb+nTGRC+
         /3r/opuF0Qr6DuiEW6fufGnokxauJjQz+FyP6s/gxGM0WgXiK+k+tBuHalWCmd2ae1Ye
         bQXY4MgtpSIZ35ixyhiW9mdII9CCero/XCrUr8F8alTU42a+S8fHCuEYA5hGLQcatws/
         LAaw==
X-Gm-Message-State: AO0yUKU5Agnhsgah4/2bUvBVi8C7GRgA2jwCSGxnG7faL0lutvkgUGq7
        r9IeYtQ3TRleRKxW0hszgg/vN8Ch1bGCFZVoWg693VsKJWXv2gRpAQjv1rjg5PKEDl9/FouDeJp
        xvAWALf8xZTMDQmmcaefj
X-Received: by 2002:adf:e489:0:b0:2cf:f04b:fb24 with SMTP id i9-20020adfe489000000b002cff04bfb24mr5824044wrm.37.1679309761546;
        Mon, 20 Mar 2023 03:56:01 -0700 (PDT)
X-Google-Smtp-Source: AK7set8WX92KehpQIBsLhcgUmkTOLAy5Ruvm0+sHAsLPZBEH3a+gBm5GFUVie1BNgZZNDNfEQFrU3w==
X-Received: by 2002:adf:e489:0:b0:2cf:f04b:fb24 with SMTP id i9-20020adfe489000000b002cff04bfb24mr5824021wrm.37.1679309761182;
        Mon, 20 Mar 2023 03:56:01 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:4100:a064:1ded:25ec:cf2f? (p200300cbc7024100a0641ded25eccf2f.dip0.t-ipconnect.de. [2003:cb:c702:4100:a064:1ded:25ec:cf2f])
        by smtp.gmail.com with ESMTPSA id b9-20020a05600010c900b002c7163660a9sm8595635wrx.105.2023.03.20.03.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:56:00 -0700 (PDT)
Message-ID: <a7176b88-98ac-75b7-2de3-a85b342401ef@redhat.com>
Date:   Mon, 20 Mar 2023 11:55:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 18/40] mm: Introduce VM_SHADOW_STACK for shadow stack
 memory
Content-Language: en-US
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        John Allen <john.allen@amd.com>, kcc@google.com,
        eranian@google.com, rppt@kernel.org, jamorris@linux.microsoft.com,
        dethoma@microsoft.com, akpm@linux-foundation.org,
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
        debug@rivosinc.com, szabolcs.nagy@arm.com
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>
References: <20230319001535.23210-1-rick.p.edgecombe@intel.com>
 <20230319001535.23210-19-rick.p.edgecombe@intel.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230319001535.23210-19-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19.03.23 01:15, Rick Edgecombe wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> New hardware extensions implement support for shadow stack memory, such
> as x86 Control-flow Enforcement Technology (CET). Add a new VM flag to
> identify these areas, for example, to be used to properly indicate shadow
> stack PTEs to the hardware.
> 
> Shadow stack VMA creation will be tightly controlled and limited to
> anonymous memory to make the implementation simpler and since that is all
> that is required. The solution will rely on pte_mkwrite() to create the
> shadow stack PTEs, so it will not be required for vm_get_page_prot() to
> learn how to create shadow stack memory. For this reason document that
> VM_SHADOW_STACK should not be mixed with VM_SHARED.
> 
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Tested-by: Kees Cook <keescook@chromium.org>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

