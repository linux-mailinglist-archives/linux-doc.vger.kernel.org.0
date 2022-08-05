Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE6958AB9F
	for <lists+linux-doc@lfdr.de>; Fri,  5 Aug 2022 15:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236071AbiHEN27 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 5 Aug 2022 09:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236073AbiHEN26 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Aug 2022 09:28:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8C79028705
        for <linux-doc@vger.kernel.org>; Fri,  5 Aug 2022 06:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659706135;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5LwXiW7Z9fPKOQuP6mWqJcS8w+uYP/AKU9h+QKQOqfY=;
        b=Q/oPvAzm+yT65mDJtPfKoMpPCpfPjnFDUuV6lK5QIEG6VR7qMSPeMULzI7G7SSndrJ3eNt
        YcF95heURkfGhPDALn/p1Cf77Hl/EqWjuLOSUmD6a+c/ErxQ2IXrKWUHMmjs9uP4RtPIEM
        /qehMpaCcDkneZ1dwAq8lyYDSWnIJGE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-xAp4a1AwPNutMDYiBqmGVw-1; Fri, 05 Aug 2022 09:28:54 -0400
X-MC-Unique: xAp4a1AwPNutMDYiBqmGVw-1
Received: by mail-wr1-f72.google.com with SMTP id c20-20020adfa314000000b0021f1757ea8aso501028wrb.2
        for <linux-doc@vger.kernel.org>; Fri, 05 Aug 2022 06:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=5LwXiW7Z9fPKOQuP6mWqJcS8w+uYP/AKU9h+QKQOqfY=;
        b=4aS7rKcBldTh4Vli1oUnojD1BohrhiPHJ/a4/lry4UommyTk0tKs7yGS3KLo31p7ZC
         DxGs254N+xGKqeBnPom64PsaGwNedwSgQ8Ie//APAbvMi1oMEx5iOGhSnTYtyzNRfSed
         P8CpyRJFvrGvLniTrYPW9A8eToQRuzQfneHyscCHi5mygf0Bra+by1wMRfWv6g4yF46g
         cEyztYbLsfCixY9otC/GOsCjwe6MqND8xY1nffqu+JVV3XEUAHJTSk0/oIJ1Z4SBE5BQ
         JoPsLe8/Puhkm7GwI5h2gAoV5cKMs191oY3VxsfBo6tmSFv2Zn7LUZx9a7g7UD0bAP+Z
         /fCg==
X-Gm-Message-State: ACgBeo2RymOz/JgcqaAr8Zu2ccwauye4vrhzwPXX5vZ8p2YCJL2Njkux
        RkpSu8HH5mewltUOITSIvn4DtCcZKg8PaGDk0KVKWyGI/DJ6dJx8ywgn5+aZj7thAL009F034xh
        22DzS7cYrlR8NmBDm7EA+
X-Received: by 2002:a05:6000:1acf:b0:21d:b410:599a with SMTP id i15-20020a0560001acf00b0021db410599amr4119468wry.123.1659706133365;
        Fri, 05 Aug 2022 06:28:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4rDbFbn4pE0ENzxm72PrKdoCqlUokRwvGeNDRUB01hSQV7gEIr0bukiPJi7Qq8c2+e4UOfGA==
X-Received: by 2002:a05:6000:1acf:b0:21d:b410:599a with SMTP id i15-20020a0560001acf00b0021db410599amr4119438wry.123.1659706133086;
        Fri, 05 Aug 2022 06:28:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:fb00:f5c3:24b2:3d03:9d52? (p200300cbc706fb00f5c324b23d039d52.dip0.t-ipconnect.de. [2003:cb:c706:fb00:f5c3:24b2:3d03:9d52])
        by smtp.gmail.com with ESMTPSA id ck19-20020a5d5e93000000b0021ee65426a2sm3893063wrb.65.2022.08.05.06.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 06:28:52 -0700 (PDT)
Message-ID: <203c752f-9439-b5ae-056c-27b2631dcb81@redhat.com>
Date:   Fri, 5 Aug 2022 15:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 05/14] mm/memfd: Introduce MFD_INACCESSIBLE flag
Content-Language: en-US
To:     Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
        linux-kselftest@vger.kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Hugh Dickins <hughd@google.com>,
        Jeff Layton <jlayton@kernel.org>,
        "J . Bruce Fields" <bfields@fieldses.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Steven Price <steven.price@arm.com>,
        "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
        ak@linux.intel.com, aarcange@redhat.com, ddutile@redhat.com,
        dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
        Muchun Song <songmuchun@bytedance.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-6-chao.p.peng@linux.intel.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220706082016.2603916-6-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06.07.22 10:20, Chao Peng wrote:
> Introduce a new memfd_create() flag indicating the content of the
> created memfd is inaccessible from userspace through ordinary MMU
> access (e.g., read/write/mmap). However, the file content can be
> accessed via a different mechanism (e.g. KVM MMU) indirectly.
> 
> It provides semantics required for KVM guest private memory support
> that a file descriptor with this flag set is going to be used as the
> source of guest memory in confidential computing environments such
> as Intel TDX/AMD SEV but may not be accessible from host userspace.
> 
> The flag can not coexist with MFD_ALLOW_SEALING, future sealing is
> also impossible for a memfd created with this flag.

It's kind of weird to have it that way. Why should the user have to
care? It's the notifier requirement to have that, no?

Why can't we handle that when register a notifier? If anything is
already mapped, fail registering the notifier if the notifier has these
demands. If registering succeeds, block it internally.

Or what am I missing? We might not need the memfile set flag semantics
eventually and would not have to expose such a flag to user space.

-- 
Thanks,

David / dhildenb

