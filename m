Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3B8F6B0FA7
	for <lists+linux-doc@lfdr.de>; Wed,  8 Mar 2023 18:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbjCHRD6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Mar 2023 12:03:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjCHRDi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Mar 2023 12:03:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A0D61BC
        for <linux-doc@vger.kernel.org>; Wed,  8 Mar 2023 09:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678294879;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=isJ7kUg6w2yotKIMM4vEPM6+nhroD6rmF07E2tGh5Po=;
        b=CdomeMF9ITaL9jbwtMK+QwCY3o/6FlR5c8CS+ROt/ZcqQeJ+/tnM9aX0EZSMDnDxt218tJ
        uepG2VT8VjPCIoTlwek7InE4szq3JRvqOVNn1narkIBs76wod/pM/qs9UA0xJr6pJZzDd8
        C5xmJtTTpreYinb+6w93qkLazWLtExc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-LO2k-XpwMEyfQv0v8dBSSw-1; Wed, 08 Mar 2023 12:01:18 -0500
X-MC-Unique: LO2k-XpwMEyfQv0v8dBSSw-1
Received: by mail-wm1-f70.google.com with SMTP id j6-20020a05600c1c0600b003eaf882cb85so1036699wms.9
        for <linux-doc@vger.kernel.org>; Wed, 08 Mar 2023 09:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678294877;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isJ7kUg6w2yotKIMM4vEPM6+nhroD6rmF07E2tGh5Po=;
        b=s4vnImiG0KxSEBAuoSoLS/CFVMFJbpdIHm+mMF8OZZOjKVzvRMNsHYSmIjrk2q4oq8
         h2jXaEQEeEQtF3o0uWScv4Kyjngwjodqz26jSTcWRVFOk8yAei/7Bl1Aj7CnGiAvvXor
         a5uj72kI8ZnUmfRFlxLuJHNZpaq0KE6EfdtbVAJfAmlzBCxlxNYcI0+CIISmgIrnO7h0
         OvE/yONFzuuSelm69WIrf1FOAzSxyhX8IgoIcDS38TQp8dNumu69Ph51HV/yOn4QIpOh
         k0ulQ1RSQa6tCB94dxvi0N1BjGyIL2X/5wbocfMxqKDgex+Z1mSdTQFQLruVJGjZxj6S
         rgiw==
X-Gm-Message-State: AO0yUKWPSnFkqsSrjbrS23NpO1uiGeQY9FNbet8P/unUBIVzFkxW7M0t
        9ThLBOE+Nw616ljhlcO6KSmq+ho1vDoCQuNkqElpAxPf9Dz8e+Zaycn2pHtMWcgP0j61C6pJM0Y
        eodr5okpKbt2tNB1XEfFV
X-Received: by 2002:a05:600c:35c8:b0:3eb:3692:6450 with SMTP id r8-20020a05600c35c800b003eb36926450mr18162696wmq.18.1678294877298;
        Wed, 08 Mar 2023 09:01:17 -0800 (PST)
X-Google-Smtp-Source: AK7set8/yxEmiy9IGiBlKJbCq89vZIGh2thlx0KZIAaYSbrcDYcQtulnML6PDyUCnLtd4DvoqVzIbA==
X-Received: by 2002:a05:600c:35c8:b0:3eb:3692:6450 with SMTP id r8-20020a05600c35c800b003eb36926450mr18162656wmq.18.1678294876944;
        Wed, 08 Mar 2023 09:01:16 -0800 (PST)
Received: from ?IPV6:2003:cb:c71b:cb00:d372:1da8:9e9e:422d? (p200300cbc71bcb00d3721da89e9e422d.dip0.t-ipconnect.de. [2003:cb:c71b:cb00:d372:1da8:9e9e:422d])
        by smtp.gmail.com with ESMTPSA id j39-20020a05600c48a700b003e21638c0edsm15915707wmp.45.2023.03.08.09.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 09:01:16 -0800 (PST)
Message-ID: <d9727ac4-4976-0de7-2d16-676ad7db5e89@redhat.com>
Date:   Wed, 8 Mar 2023 18:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com
Cc:     linux-mm@kvack.org, riel@surriel.com, mhocko@suse.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, hannes@cmpxchg.org
References: <20230224044000.3084046-1-shr@devkernel.io>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 0/3] mm: process/cgroup ksm support
In-Reply-To: <20230224044000.3084046-1-shr@devkernel.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For some reason gmail thought it would be a good ideas to move this into 
the SPAM folder, so I only saw the recent replies just now.

I'm going to have a look at this soonish.


One point that popped up in the past and that I raised on the last RFC: 
we should think about letting processes *opt out/disable* KSM on their 
own. Either completely, or for selected VMAs.

Reasoning is, that if you have an application that really doesn't want 
some memory regions to be applicable to KSM (memory de-duplication 
attacks? Knowing that KSM on some regions will be counter-productive)

For example, remembering if MADV_UNMERGEABLE was called and not only 
clearing the VMA flag. So even if KSM would be force-enabled by some 
tooling after the process started, such regions would not get considered 
for KSM.

It would a bit like how we handle THP.


On 24.02.23 05:39, Stefan Roesch wrote:
> So far KSM can only be enabled by calling madvise for memory regions. To
> be able to use KSM for more workloads, KSM needs to have the ability to be
> enabled / disabled at the process / cgroup level.
> 
> Use case 1:
> The madvise call is not available in the programming language. An example for
> this are programs with forked workloads using a garbage collected language without
> pointers. In such a language madvise cannot be made available.
> 
> In addition the addresses of objects get moved around as they are garbage
> collected. KSM sharing needs to be enabled "from the outside" for these type of
> workloads.
> 
> Use case 2:
> The same interpreter can also be used for workloads where KSM brings no
> benefit or even has overhead. We'd like to be able to enable KSM on a workload
> by workload basis.
> 
> Use case 3:
> With the madvise call sharing opportunities are only enabled for the current
> process: it is a workload-local decision. A considerable number of sharing
> opportuniites may exist across multiple workloads or jobs. Only a higler level
> entity like a job scheduler or container can know for certain if its running
> one or more instances of a job. That job scheduler however doesn't have
> the necessary internal worklaod knowledge to make targeted madvise calls.
> 
> Security concerns:
> In previous discussions security concerns have been brought up. The problem is
> that an individual workload does not have the knowledge about what else is
> running on a machine. Therefore it has to be very conservative in what memory
> areas can be shared or not. However, if the system is dedicated to running
> multiple jobs within the same security domain, its the job scheduler that has
> the knowledge that sharing can be safely enabled and is even desirable.

Note that there are some papers about why limiting memory deduplciation 
attacks to single security domains is not sufficient. Especially, the 
remote deduplication attacks fall into that category IIRC.


-- 
Thanks,

David / dhildenb

