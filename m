Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 648BC5895CC
	for <lists+linux-doc@lfdr.de>; Thu,  4 Aug 2022 04:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbiHDCCW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 3 Aug 2022 22:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbiHDCCV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Aug 2022 22:02:21 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DF95C9EB
        for <linux-doc@vger.kernel.org>; Wed,  3 Aug 2022 19:02:20 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id f65so16655692pgc.12
        for <linux-doc@vger.kernel.org>; Wed, 03 Aug 2022 19:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=R8a2uTZpErjV8ZoEO/x1ZNaBxjx4vHWCt7mF0miAi5E=;
        b=zZ1UG92HUINfBQ0MPaLPPVMGISoqyJK/vD/6sOBUj8XoURNF1lfjGeUqvP9Fd0Q0n4
         S4tnowzf3rtmuMxZufeXmYMk6Idx/JgCkX3Plw150oX75qK9rOWR5ykDKz/sz3+WUMmV
         qoFAxG0rCEOoKhTUc12aJo6XYNciiUvXjIJdrE1WLpbsMhASFxIFg9i+mVCKLFfEdRf4
         79VgYyrQKQ1IuJT+owA5Geif2IltJJU2FgCCZb8FX9DuLUrLQiPPMA3fiLeIhVfrDhS6
         lgBpNEPmcHiEORwN/t+xhP9fHEMu5jG2DSGj5k1P7NT0ZHbum9gVw4Knz8LQVXLxleRM
         DJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=R8a2uTZpErjV8ZoEO/x1ZNaBxjx4vHWCt7mF0miAi5E=;
        b=5jWjxESprvCZMP0xnSiLSu1ywrzC1flAabWQusHfVOKgGYGHhtxlKJAEJeFjB5QlWY
         8UlgKL/HYy/idixsIx/9L8lpYif9268r+LiwfMekCPamRrxavV9EMywP/IvqYeKm12Fb
         WVX/OC6TghHTV+jTvjdkDfv9nWtywvxogsmbKKo80ikWELhiYEMVoCPUtmmw4RnqB8NA
         eP27ZWZljBF4l5dHylg1eiB9493zF4bVC6KsJWsiJebFuMwlDt8f2xHtESnB5uPom3rn
         YwiJsgiAjwKKWuOJ9XHekpFX7Wofko74e5Bsf3+j/TohRU5wEogZ/nebeDaTiSWDUgtN
         Tn+g==
X-Gm-Message-State: AJIora+0hDkH+2loHRja4/TFhHB2R81kNdrAF/DL06gtS7o4gkT/oS6h
        ujT0VB3/SyvJ1MQWPPmbJnYOVQ==
X-Google-Smtp-Source: AGRyM1taVZO1N6EAUFFd6LVCOyUP7rwsRGObXVBy+H93Y4h3tUP8RyBFCKJp59eKeZktJHyBkWgolQ==
X-Received: by 2002:a05:6a00:2282:b0:52b:bab:16a4 with SMTP id f2-20020a056a00228200b0052b0bab16a4mr28685867pfe.17.1659578539603;
        Wed, 03 Aug 2022 19:02:19 -0700 (PDT)
Received: from [10.200.231.53] ([139.177.225.233])
        by smtp.gmail.com with ESMTPSA id i10-20020a056a00004a00b0052ab602a7d0sm6513352pfk.100.2022.08.03.19.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 19:02:19 -0700 (PDT)
Message-ID: <94ddcd31-e168-06ed-c0f9-2ea25b802d60@bytedance.com>
Date:   Thu, 4 Aug 2022 10:02:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH 8/9] sched/psi: add kernel cmdline parameter
 psi_inner_cgroup
To:     Tejun Heo <tj@kernel.org>
Cc:     Johannes Weiner <hannes@cmpxchg.org>, surenb@google.com,
        mingo@redhat.com, peterz@infradead.org, corbet@lwn.net,
        akpm@linux-foundation.org, rdunlap@infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        songmuchun@bytedance.com, cgroups@vger.kernel.org
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
 <20220721040439.2651-9-zhouchengming@bytedance.com>
 <Yt7KQc0nnOypB2b2@cmpxchg.org> <YuAqWprKd6NsWs7C@slm.duckdns.org>
 <5a3410d6-428d-9ad1-3e5a-01ca805ceeeb@bytedance.com>
 <Yuq3Q6Y9dRnjjcPt@slm.duckdns.org>
Content-Language: en-US
From:   Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <Yuq3Q6Y9dRnjjcPt@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/8/4 01:58, Tejun Heo wrote:
> Hello,
> 
> On Wed, Aug 03, 2022 at 08:17:22PM +0800, Chengming Zhou wrote:
>>> Assuming the above isn't wrong, if we can figure out how we can re-enable
>>> it, which is more difficult as the counters need to be resynchronized with
>>> the current state, that'd be ideal. Then, we can just allow each cgroup to
>>> enable / disable PSI reporting dynamically as they see fit.
>>
>> This method is more fine-grained but more difficult like you said above.
>> I think it may meet most needs to disable PSI stats in intermediate cgroups?
> 
> So, I'm not necessarily against implementing something easier but we at
> least wanna get the interface right, so that if we decide to do the full
> thing later we can easily expand on the existing interface. ie. let's please
> not be too hacky. I don't think it'd be that difficult to implement
> per-cgroup disable-only operation that we can later expand to allow
> re-enabling, right?

Agree, the interface is important, per-cgroup disable-only operation maybe easier
to implement. I will look into this more.

Thanks!

