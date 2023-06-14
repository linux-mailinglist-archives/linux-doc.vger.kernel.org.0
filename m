Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01BF772E300
	for <lists+linux-doc@lfdr.de>; Tue, 13 Jun 2023 14:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242472AbjFMM3j (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 13 Jun 2023 08:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242473AbjFMM3O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jun 2023 08:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDBF19A4
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 05:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686659298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5APAgmZrGjFJ9+U0RvJUaGvdr2gWc6sxi+r6310cnNs=;
        b=NpemX1ocFWDM1Jmyz+nrK9ZpYU08wE6iscEdj7w6KetAsPrCRPOR33uj2YzQ+NGDI9xFxG
        ofMbFgb7TFJdjLQXR1lYykQMCz2ht40lWsGpbzukhJ1tg5tLu5Plik83oCOioTshUpSdnP
        ahg0K99Jrlx1aaB+llVMNNOx/TmtlU0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-_7bTPjpHPOO4_LzckqiOqg-1; Tue, 13 Jun 2023 08:28:17 -0400
X-MC-Unique: _7bTPjpHPOO4_LzckqiOqg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30ae18b11bfso2383304f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 05:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686659296; x=1689251296;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5APAgmZrGjFJ9+U0RvJUaGvdr2gWc6sxi+r6310cnNs=;
        b=QJaW+5OXCKvkPC8yPjE/qLqvdsB8LTiCYZDx6twRTSX6eLcfwyiA4kSpVNxCtGiEyU
         Z5O9ucNPrumALPBLQ6ts+nf/JtQIwF476Mj8grPW9vgAXbwKYRrbO+qsIjBvihtVATgY
         xFCIKyIXYdMA+DUpgySMDY4o+jgmxzWsxS+S5EgKTdan4SIvIHE37ybJVy1HhMCfUatJ
         S1QyxDPJOfDAACa5prN1AJWeTK1ymSGJmC2gRX5sD1gTFNBBkGA6ub4mzPJi5i574p5n
         YsZmSA+1lgFFwuEEg1VXHNvojzL+KyM1EYe0tvjf3guGaRwoF8L5BIhIiZd14P16LUMw
         iGhA==
X-Gm-Message-State: AC+VfDyHqrd4edK9VKyz4yZ1q4wS48D0N2OYppICI006z0y/QynorXKs
        Wj3r33PlTovThkTF9+1mT4Zbe50O46d4cWo2g4KWNqhwtsfkUbAcGhj2lWk9ywa8h/iDRcnhTJ4
        k41fz+BkXvxbBYl0hfZES
X-Received: by 2002:a05:6000:10c7:b0:30a:eae0:106c with SMTP id b7-20020a05600010c700b0030aeae0106cmr7102034wrx.10.1686659296207;
        Tue, 13 Jun 2023 05:28:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61EMABfB7hkEtd8rE3feiAmwo8GaJnsqM5qFYcE5rkOiMq3BqizYRb/VE1CFB4BKMLKA5RWQ==
X-Received: by 2002:a05:6000:10c7:b0:30a:eae0:106c with SMTP id b7-20020a05600010c700b0030aeae0106cmr7101998wrx.10.1686659295754;
        Tue, 13 Jun 2023 05:28:15 -0700 (PDT)
Received: from ?IPV6:2003:cb:c710:ff00:1a06:80f:733a:e8c6? (p200300cbc710ff001a06080f733ae8c6.dip0.t-ipconnect.de. [2003:cb:c710:ff00:1a06:80f:733a:e8c6])
        by smtp.gmail.com with ESMTPSA id u2-20020a5d4342000000b0030e5c8d55f2sm15258101wrr.6.2023.06.13.05.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 05:28:15 -0700 (PDT)
Message-ID: <65805965-c6a2-ce0c-fb11-5277e5976120@redhat.com>
Date:   Tue, 13 Jun 2023 14:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v9 03/42] mm: Make pte_mkwrite() take a VMA
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
        debug@rivosinc.com, szabolcs.nagy@arm.com,
        torvalds@linux-foundation.org, broonie@kernel.org
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
 <20230613001108.3040476-4-rick.p.edgecombe@intel.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230613001108.3040476-4-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13.06.23 02:10, Rick Edgecombe wrote:
> The x86 Shadow stack feature includes a new type of memory called shadow
> stack. This shadow stack memory has some unusual properties, which requires
> some core mm changes to function properly.
> 
> One of these unusual properties is that shadow stack memory is writable,
> but only in limited ways. These limits are applied via a specific PTE
> bit combination. Nevertheless, the memory is writable, and core mm code
> will need to apply the writable permissions in the typical paths that
> call pte_mkwrite(). Future patches will make pte_mkwrite() take a VMA, so
> that the x86 implementation of it can know whether to create regular
> writable memory or shadow stack memory.
> 
> But there are a couple of challenges to this. Modifying the signatures of
> each arch pte_mkwrite() implementation would be error prone because some
> are generated with macros and would need to be re-implemented. Also, some
> pte_mkwrite() callers operate on kernel memory without a VMA.
> 
> So this can be done in a three step process. First pte_mkwrite() can be
> renamed to pte_mkwrite_novma() in each arch, with a generic pte_mkwrite()
> added that just calls pte_mkwrite_novma(). Next callers without a VMA can
> be moved to pte_mkwrite_novma(). And lastly, pte_mkwrite() and all callers
> can be changed to take/pass a VMA.
> 
> In a previous patches, pte_mkwrite() was renamed pte_mkwrite_novma() and
> callers that don't have a VMA were changed to use pte_mkwrite_novma(). So
> now change pte_mkwrite() to take a VMA and change the remaining callers to
> pass a VMA. Apply the same changes for pmd_mkwrite().
> 
> No functional change.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

Hopefully we'll get this landed soon :)

-- 
Cheers,

David / dhildenb

