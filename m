Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7B95EDD14
	for <lists+linux-doc@lfdr.de>; Wed, 28 Sep 2022 14:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiI1MpL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Sep 2022 08:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbiI1MpK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Sep 2022 08:45:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F3513D47
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 05:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664369106;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uufQYKHlB4NMDLgfrNjl6fs7TYc608vt4M1Drzs/IdQ=;
        b=EgSsMitTgjGRcjmAMhpxJb53Mx89pVWvUoqi5VIh7JEtc9jGR/l4oLZNDTGoGhvR2Nkxbb
        xxTvdBUswWTU8QljEnbyY3TnBvbuCbP/MwoPt70eT9ipTv8DkimOrz6uK+dlf0iovhpL9X
        j+5nUT7lY3KpXDY15z3+FvHzOSbi/UI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-iwjXnGiNNL-aHGHWGcvPEg-1; Wed, 28 Sep 2022 08:45:04 -0400
X-MC-Unique: iwjXnGiNNL-aHGHWGcvPEg-1
Received: by mail-wm1-f71.google.com with SMTP id f25-20020a7bc8d9000000b003b4768dcd9cso519462wml.9
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 05:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=uufQYKHlB4NMDLgfrNjl6fs7TYc608vt4M1Drzs/IdQ=;
        b=JI6jGxRgEPBegFlSQxmulGdjzsGfEZNdVnozNvYb5qXLBNoS9zDLYJxSSnmtlBGxae
         NSSnomA5Sqa3sFbDwBvSJuVhqyMPyKa3Pcr/fVWZ7TMv2euh0aYtodpL73SZMmWDxzOL
         k8yBpoilOL8/meHzhkrJkzZe7qObM4lCEWSML6Il/DVn2d2QX9omCtEWlMhQ4m0FSZDs
         VbSXaiVHvGXV3sOo4kezMbILZAsq2rLp1g8fm4aUbenOO/lwtC18IQegC9Jkjq0TQdko
         PmX8cmQIDdQ/mMnCGumVMO4XiA+VH6S7JIDro62fsE3PnPe6xuXsk47HSd83LxaNDZgF
         L78w==
X-Gm-Message-State: ACrzQf2sGaDM43mk5ARlUo5s0tnfHAj3GsPWE2pvS9bvwwG1zMbTM6bR
        tIp5ADjtkmv2fpc+u5v274WmOvb+2ZSsUnwL1o/w87UJdx/v6qHLW6voOcb9LA1NvNsuHYI0fd7
        BlpdoredYfe9uRnrSY/Yc
X-Received: by 2002:a5d:54ce:0:b0:22a:e653:654 with SMTP id x14-20020a5d54ce000000b0022ae6530654mr20853560wrv.134.1664369103796;
        Wed, 28 Sep 2022 05:45:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6DXGXWYtOD1tp72GMv95ymx/s3vXL+wcRLQZFw20ZkjuJBEtRIWnmJ9pGR6pi/ghRFhlc6iA==
X-Received: by 2002:a5d:54ce:0:b0:22a:e653:654 with SMTP id x14-20020a5d54ce000000b0022ae6530654mr20853525wrv.134.1664369103389;
        Wed, 28 Sep 2022 05:45:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:1100:add9:5f61:6b94:7540? (p200300cbc7041100add95f616b947540.dip0.t-ipconnect.de. [2003:cb:c704:1100:add9:5f61:6b94:7540])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c1d8d00b003b332a7bf15sm1635047wms.7.2022.09.28.05.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 05:45:02 -0700 (PDT)
Message-ID: <6f2615f2-27c6-34e5-77f3-166d0e7b6182@redhat.com>
Date:   Wed, 28 Sep 2022 14:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH -next v4 1/3] selftests/memory-hotplug: Add checking after
 online or offline
Content-Language: en-US
To:     zhaogongyi <zhaogongyi@huawei.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Cc:     "akinobu.mita@gmail.com" <akinobu.mita@gmail.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "osalvador@suse.de" <osalvador@suse.de>,
        "shuah@kernel.org" <shuah@kernel.org>
References: <dd8998bcfe0e4b82a617dfd79d93368c@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <dd8998bcfe0e4b82a617dfd79d93368c@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


>> Reviewed-by: David Hildenbrand <david@redhat.com>
>>
>>
>> I am questioning the stability of the offlining test, though.
>> Offlining a random memory block can fail easily, because "->removable" is not
>> expressive:
>>
>> # tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
>> Test scope: 2% hotplug memory
>>            online all hot-pluggable memory in offline state:
>>                    SKIPPED - no hot-pluggable memory in offline state
>>            offline 2% hot-pluggable memory in online state
>>            trying to offline 2 out of 96 memory block(s):
>> online->offline memory0
>> tools/testing/selftests/memory-hotplug/mem-on-off-test.sh: line 78: echo:
>> write error: Invalid argument offline_memory_expect_success 0: unexpected
>> fail
>> online->offline memory10
>> online->offline memory11
>>
>>
>> I guess this test will almost always fail nowadays.
> 
> Offline some memory node maybe failed as expected, but the error message is a bit annoying.

Ah, I see it now. We try offlining two and fail offlining the first one. 
Can we silence that warning in that case somehow?

-- 
Thanks,

David / dhildenb

