Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05E0B60C9A9
	for <lists+linux-doc@lfdr.de>; Tue, 25 Oct 2022 12:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbiJYKN1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Oct 2022 06:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbiJYKNJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Oct 2022 06:13:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D9E14409C
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666692306;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WkMY2q7k/FRScATXzFjfEIt8wnjgYfKsZeIIXZ3g4lg=;
        b=fvZCSVb+DpvPtgyKixAoEUeYqUqVbgNxDskBK1UPi7h1HGvPOT9bVZjehxiiqoSbjK0UDg
        ue198JyUaJl7+KKogkBkpzKglru5KekkXx2/rHYDcCdUVr170BOlXsO1IEz32Xjn/B6TXX
        Bm260xlKts91zGuHc+Gb4EX6m64iF8E=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-8nig1IPAOWa00T8bDUnIBw-1; Tue, 25 Oct 2022 06:05:05 -0400
X-MC-Unique: 8nig1IPAOWa00T8bDUnIBw-1
Received: by mail-qt1-f197.google.com with SMTP id br5-20020a05622a1e0500b00394c40fee51so8661570qtb.17
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 03:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WkMY2q7k/FRScATXzFjfEIt8wnjgYfKsZeIIXZ3g4lg=;
        b=R/9WWcbgCxQbqUZIaYOcXHM0xxR2eTgL2IL1+lI1MOV0ffxNTs131ZGfrpbdxi9oHh
         8HO4v3zUezsim1TysKnPavLOUqGHMnr0PEW5CulSTz0TPEc+By3l/Pa3AHOySr9lNdtq
         1JLoMKjBSHLUXPRbBkR0bzy0nChSlsUkD+LuCYjSJ+HOl+O+dBUeTn3v1pEk8at0GumP
         otFkBblHfCrRg9HO5yf7gJu3HPGhNtC8UTRCXKzcF9b2kRactZa2Jdrv6jG30vPXd24X
         BLeplHzQ+BvmDp+lKzdJnhW+ryAiBV9kGo01lHC7hCBjHOpMzMX01KrfS5oDVfg7TltP
         mEDA==
X-Gm-Message-State: ACrzQf3L7PHAgXS/XidCOctqglRrl+JfliQRo3RdSZLlUwMXQUSSRC0p
        g2osCbhI5Q1SSNayPNx083TWmgzf6cOi2sRmR4qrT9SNO3NLphPXYmBik+h1QZyt6lspjOjK/Ma
        kRECz6VE+KLr/RTD4WNbq
X-Received: by 2002:a05:6214:21e5:b0:4b3:f3e0:5432 with SMTP id p5-20020a05621421e500b004b3f3e05432mr30997929qvj.19.1666692305293;
        Tue, 25 Oct 2022 03:05:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM693U09GZt8c3TCu0FJo9qI1g4ScuhxN9DXfAJplWl/vGo09zLnXBtWBBG2qZwZQgoHuj3OGw==
X-Received: by 2002:a05:6214:21e5:b0:4b3:f3e0:5432 with SMTP id p5-20020a05621421e500b004b3f3e05432mr30997911qvj.19.1666692305082;
        Tue, 25 Oct 2022 03:05:05 -0700 (PDT)
Received: from [10.201.49.36] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
        by smtp.googlemail.com with ESMTPSA id d13-20020a05620a240d00b006bc192d277csm1807519qkn.10.2022.10.25.03.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 03:05:04 -0700 (PDT)
Message-ID: <6812bb87-f355-eddb-c484-b3bb089dd630@redhat.com>
Date:   Tue, 25 Oct 2022 12:05:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 4/4] KVM: use signals to abort enter_guest/blocking and
 retry
Content-Language: en-US
To:     Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        kvm@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221022154819.1823133-1-eesposit@redhat.com>
 <20221022154819.1823133-5-eesposit@redhat.com>
 <5ee4eeb8-4d61-06fc-f80d-06efeeffe902@redhat.com>
 <4ef882c2-1535-d7df-d474-e5fab2975f53@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <4ef882c2-1535-d7df-d474-e5fab2975f53@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/24/22 09:43, Emanuele Giuseppe Esposito wrote:
>> Since the userspace should anyway avoid going into this effectively-busy
>> wait, what about clearing the request after the first exit?  The
>> cancellation ioctl can be kept for vCPUs that are never entered after
>> KVM_KICK_ALL_RUNNING_VCPUS.  Alternatively, kvm_clear_all_cpus_request
>> could be done right before up_write().
>
> Clearing makes sense, but should we "trust" the userspace not to go into
> busy wait?

I think so, there are many other ways for userspace to screw up.

> What's the typical "contract" between KVM and the userspace? Meaning,
> should we cover the basic usage mistakes like forgetting to busy wait on
> KVM_RUN?

Being able to remove the second ioctl if you do (sort-of pseudocode 
based on this v1)

	kvm_make_all_cpus_request(kvm, KVM_REQ_USERSPACE_KICK);
	down_write(&kvm->memory_transaction);
	up_write(&kvm->memory_transaction);
	kvm_clear_all_cpus_request(kvm, KVM_REQ_USERSPACE_KICK);

would be worth it, I think.

Paolo

