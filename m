Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 385865FA25D
	for <lists+linux-doc@lfdr.de>; Mon, 10 Oct 2022 19:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiJJRCs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 Oct 2022 13:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbiJJRCg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Oct 2022 13:02:36 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35542C115
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 10:02:31 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id p186so8910417iof.5
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 10:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sku5J7PyxwEr729i9MgpltbFTlOLk2agD7q4nskSz/8=;
        b=GfZe1er7asCP0ALA4xE6quMC5DxOFhh/7LbUYi1cC7lbaczkr2bHNyRdEFHjv207Vn
         Wiqxjkj1oviICRGEGXz7Mcg6Awz7FctKFrN1vYbsEPlnEa06eG1DIgm3v2oSHEgptcur
         spkpD/4M/kpmoHV9rtcTZJr2HLtXnkPJPYdPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sku5J7PyxwEr729i9MgpltbFTlOLk2agD7q4nskSz/8=;
        b=tYR+pvQgflc4FvJtB74zFKpNEbLPD1OGLAAEl3oZc21TkMq/h6D5IN1EyC7mbx8Kb7
         YE/pZ4jO4L8F5S/dwVelFEeQcu3KeOr8oYvWmOJ0Qn9RrK+33RDjIqg4y/uJQToJ39Xg
         YHFjYhYxbCekcXUxhSUad2wEMW+T0CfklcRroZGqp96G1jnBY+q2iZev66ZtpjGMgIOc
         4we/zCOd0bW/x3R8Yui7WiOS1Rk7nF/8FwTvNALGq86sOK62SgsvXiABP+zbMWqK3+a/
         +kLM6qWunzJ8sKKAA4FC4se9uT8q6886CA2c0PObzgM6a8A/IEdq4wC9GqOgJXaVHeJ1
         s6DQ==
X-Gm-Message-State: ACrzQf1w38xiF6VsfYWlbLJbKoFXAL+8iUIx4PKg7HUf1gdttq4lamdx
        qUwu7qC81Hjk7KVQYXeIl6KfDQ==
X-Google-Smtp-Source: AMsMyM5MdoRFlHdN/oWlHzW5c6TiU0d91kNy2sJnAp7PMUFFDAN10eFKJ+CZjzZGIA+MbGA7ivOSYw==
X-Received: by 2002:a05:6638:2491:b0:35a:53dd:f98e with SMTP id x17-20020a056638249100b0035a53ddf98emr10571658jat.261.1665421350124;
        Mon, 10 Oct 2022 10:02:30 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id v2-20020a02b082000000b0036378e4747esm4096449jah.114.2022.10.10.10.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 10:02:29 -0700 (PDT)
Message-ID: <e26efc62-327f-946e-6a0a-151151485589@linuxfoundation.org>
Date:   Mon, 10 Oct 2022 11:02:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH -next v5 2/4] selftests/memory-hotplug: Restore memory
 before exit
Content-Language: en-US
To:     David Hildenbrand <david@redhat.com>,
        zhaogongyi <zhaogongyi@huawei.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Cc:     "akinobu.mita@gmail.com" <akinobu.mita@gmail.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "osalvador@suse.de" <osalvador@suse.de>,
        "shuah@kernel.org" <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <f83730eec0b1445fa92d4cf0397d886b@huawei.com>
 <b0ae9fcc-7e2b-dae9-30be-4b6ee248bf97@redhat.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <b0ae9fcc-7e2b-dae9-30be-4b6ee248bf97@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/10/22 00:54, David Hildenbrand wrote:
> On 08.10.22 03:40, zhaogongyi wrote:

>>
>> Yes, online_memory_expect_success() already prints a warning, remove the warning in online_all_offline_memory() seems ok,
>>
>> My previous consideration was that one more log information would make it easier to locate the wrong location.
> 
> Let's keep it simple unless there is real reason to warn twice.
> 

zhaogongyi,

Please note that I already applied the patches to linux-kselftest
next for my second pull request before the merge window. Please
send the change David requested in a separate patch on top of
next as a fix.

thanks,
-- Shuah
