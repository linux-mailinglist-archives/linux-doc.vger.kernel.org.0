Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF4BF4D30C7
	for <lists+linux-doc@lfdr.de>; Wed,  9 Mar 2022 15:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbiCIOEq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Mar 2022 09:04:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233416AbiCIOEp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 09:04:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 923BCC5593
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 06:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646834625;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wY6DJ3Ioz62fnPukSJTRdXvMi1FUgR+YwdIV4ZzZvHQ=;
        b=IXo03VFMGR8uTsDJF+v0OahFVa3OMC+8JSUKZbk08Z8I2vn10oSqBgswbyy7Fmq5ezq7tr
        hcG9Cqh6f9SUJBWFGUqfrGqTywBm0NW2UbTuKNCMaLlUui9zKToXrXtGKauu3/0o9nBl4i
        XJJw+Ge5ZkdwGsLNX+xXgu/s2vrzTdw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-DpKCrHX9M7mFCEJLYIP5Sg-1; Wed, 09 Mar 2022 09:03:44 -0500
X-MC-Unique: DpKCrHX9M7mFCEJLYIP5Sg-1
Received: by mail-wm1-f69.google.com with SMTP id x5-20020a1c7c05000000b00389bcc8df46so1026754wmc.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Mar 2022 06:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wY6DJ3Ioz62fnPukSJTRdXvMi1FUgR+YwdIV4ZzZvHQ=;
        b=MCwr3X/8ZtsdeQgNRkGcnA2muY1M9rPEPAJX4yOkMM3LX7vHdSdN7mCGpfKjzxEcAX
         o5cZt5U641a0JXegwlXW275GXveRU1sUUwrVgHGv13D2Lpt0l016kfkLrgZMteJBzP2m
         nackQfCs4YItmbnIelLOK/Tbwd3ua1IYrVAKmxfJDDkV4cqFuLTpOm4QY7W44QFSy0kv
         cLRcJUOvWHIidU+8sbsD5NTASaSPqghnjeA/4uLyiDwOw4TMNm343+gvbtA1jxTAhnfG
         bMEvxpUnMPjZJh7RcJ1zuyHRTYu3r/g7S+SmHOc8rsNHZB0r7NJreI9ccDupAqxYDMUV
         PZYQ==
X-Gm-Message-State: AOAM530oWqAhrLNaZBl7r14PV5qbU4tdw/zJEWZyC+MoqiLNFapHiri+
        amCcc/PVCwTWTseFeYlxpcBz3j3HjO35gBSkNXGCtrz0sIhC5hOx4Brv8+fH6zc+wizZZxbLvCX
        RfnPeW2eeCfAc47fruK2X
X-Received: by 2002:adf:e5d2:0:b0:1fb:768d:7d5 with SMTP id a18-20020adfe5d2000000b001fb768d07d5mr9190950wrn.256.1646834623385;
        Wed, 09 Mar 2022 06:03:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNBJfQGc2FmMdtt3mVPKQLbHOb+zj+vlrb2Ad8ZnI8Vtv4sYFZwCC94aOOQs1Mujr8yWTzvw==
X-Received: by 2002:adf:e5d2:0:b0:1fb:768d:7d5 with SMTP id a18-20020adfe5d2000000b001fb768d07d5mr9190878wrn.256.1646834622656;
        Wed, 09 Mar 2022 06:03:42 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.googlemail.com with ESMTPSA id m128-20020a1ca386000000b003898b148bf0sm4996126wme.20.2022.03.09.06.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 06:03:41 -0800 (PST)
Message-ID: <a7b27887-ce00-c173-a7e7-8ad3470154f5@redhat.com>
Date:   Wed, 9 Mar 2022 15:03:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/6] KVM: x86: add force_intercept_exceptions_mask
Content-Language: en-US
To:     Maxim Levitsky <mlevitsk@redhat.com>,
        Sean Christopherson <seanjc@google.com>
Cc:     kvm@vger.kernel.org, Kieran Bingham <kbingham@kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Andrew Jones <drjones@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Johannes Berg <johannes.berg@intel.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Jessica Yu <jeyu@kernel.org>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Yang Weijiang <weijiang.yang@intel.com>,
        linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Borislav Petkov <bp@suse.de>
References: <20210811122927.900604-1-mlevitsk@redhat.com>
 <20210811122927.900604-3-mlevitsk@redhat.com> <YTECUaPa9kySQxRX@google.com>
 <0cdac80177eea408b7e316bd1fc4c0c5839ba1d4.camel@redhat.com>
 <YifoysEvfnQgq59A@google.com>
 <3221c2385e1148fe0ee77d4717b52726e1db9d8d.camel@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <3221c2385e1148fe0ee77d4717b52726e1db9d8d.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/9/22 13:31, Maxim Levitsky wrote:
> Question: is it worth it? Since I am very busy with various things, this feature,
> beeing just small debug help which I used once in a while doesn't get much time from me.

I agree it's not very much worth.

Paolo

