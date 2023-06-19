Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14FBD735AA1
	for <lists+linux-doc@lfdr.de>; Mon, 19 Jun 2023 17:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjFSPFH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 19 Jun 2023 11:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbjFSPEn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 11:04:43 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0448B1702
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 08:03:42 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f122ff663eso4559687e87.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1687187019; x=1689779019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=49YbCrrQnu++46aqDxt53mcv8RYAaq7cMrbIqaaKKyY=;
        b=nF2ZfiGhvW695ksU2fZGH8TntTiJZDsIYNJXmRhfJhE8hrLMgVujyNeOlovtQ8zmBs
         YJBdLOvNi4ffSAs3QIuT44dZxkwfw1Jsk59cfo0o2+aVJrRGBC4zF1SrVJOc0tuMrch3
         WCgBsh9iZWz+AhHRspSUz3dLixDXzXEXyZCArBISpBJgjvKafrnV6WiLg/VRywdKbMHH
         wDXJUa/K5OD2WXMFtiDt+tecmRmZWvJBjtAz0aSIDS8iVdZreDp5aMwSEz7SO3uIWmjl
         IYoekmh7VOrc8ZdwyGktpGMDlyoOiji0hCps/UObbPmONQO2PjwIIf+Qc64ZsGOb8nlg
         kBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687187019; x=1689779019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=49YbCrrQnu++46aqDxt53mcv8RYAaq7cMrbIqaaKKyY=;
        b=jgHSDZwiH+TL/o6NpLeI2ou0canssV+ffChXyxoo6lWfAa8gLLqyApxHidiN69ZfyM
         ht05Cq7feSY76lUP+HfHlCQlCERfi566dC1uREM43YDdyYq2uXoDQh7iZuONPb0SBvFt
         uyBt/okf7ushKm/K2FGVuySkqXWQYU5Rs4tHbRc9E2XHdCH4s/PpElN1NXY0LWGiLRpW
         4oSkfPM2861j6HcvItysSvPlVFOUy/wHqgWi9vJrCaMUo8AyKu89SiZp9xOuLWEe/eK7
         F1Sa47Ovb8WKcUhTzKgMNZTOTiPusE/vQs9IVaY5c823KKMkb0Ao/a57dJAV+j6u4lIo
         G8DA==
X-Gm-Message-State: AC+VfDwlYnXcwIq4b/4YO3MiyoQUoTnLbT1YVeUOJ7a5h/GmPnGEF5jO
        G8leiUeVpJMRxUhWUDhPvCZPCw==
X-Google-Smtp-Source: ACHHUZ7FJRf9OVIP5GW2qC+5pDf0N+cIYCphYRWLPLD/TYzVC+I3/y+Zs8rDeqQ1h+4S2vb97c/VQw==
X-Received: by 2002:a19:e30e:0:b0:4f4:b138:e998 with SMTP id a14-20020a19e30e000000b004f4b138e998mr5132982lfh.68.1687187018602;
        Mon, 19 Jun 2023 08:03:38 -0700 (PDT)
Received: from [10.43.1.253] ([83.142.187.84])
        by smtp.gmail.com with ESMTPSA id m29-20020a056512015d00b004f6366cbe72sm4295872lfo.228.2023.06.19.08.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 08:03:38 -0700 (PDT)
Message-ID: <a38a35ca-41cd-d082-9723-391130fcb8bf@semihalf.com>
Date:   Mon, 19 Jun 2023 17:03:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] docs: security: Confidential computing intro and
 threat model for x86 virtualization
To:     "Reshetova, Elena" <elena.reshetova@intel.com>,
        "Christopherson,, Sean" <seanjc@google.com>
Cc:     Carlos Bilbao <carlos.bilbao@amd.com>,
        "Chen, Jason CJ" <jason.cj.chen@intel.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ardb@kernel.org" <ardb@kernel.org>,
        "kraxel@redhat.com" <kraxel@redhat.com>,
        "dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "Dhaval.Giani@amd.com" <Dhaval.Giani@amd.com>,
        "michael.day@amd.com" <michael.day@amd.com>,
        "pavankumar.paluri@amd.com" <pavankumar.paluri@amd.com>,
        "David.Kaplan@amd.com" <David.Kaplan@amd.com>,
        "Reshma.Lal@amd.com" <Reshma.Lal@amd.com>,
        "Jeremy.Powell@amd.com" <Jeremy.Powell@amd.com>,
        "sathyanarayanan.kuppuswamy@linux.intel.com" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "alexander.shishkin@linux.intel.com" 
        <alexander.shishkin@linux.intel.com>,
        "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "dgilbert@redhat.com" <dgilbert@redhat.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "dinechin@redhat.com" <dinechin@redhat.com>,
        "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
        "berrange@redhat.com" <berrange@redhat.com>,
        "mst@redhat.com" <mst@redhat.com>, "tytso@mit.edu" <tytso@mit.edu>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "leon@kernel.org" <leon@kernel.org>,
        "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
        "lukas@wunner.de" <lukas@wunner.de>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "cdupontd@redhat.com" <cdupontd@redhat.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        "sameo@rivosinc.com" <sameo@rivosinc.com>,
        "bp@alien8.de" <bp@alien8.de>,
        "security@kernel.org" <security@kernel.org>,
        Larry Dewey <larry.dewey@amd.com>,
        "android-kvm@google.com" <android-kvm@google.com>,
        Dmitry Torokhov <dtor@google.com>,
        Allen Webb <allenwebb@google.com>,
        Tomasz Nowicki <tn@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Patryk Duda <pdk@semihalf.com>
References: <20230612164727.3935657-1-carlos.bilbao@amd.com>
 <ZIihRqZljMaMRGcK@google.com>
 <DM8PR11MB5750D16B08B769173DCD740AE75AA@DM8PR11MB5750.namprd11.prod.outlook.com>
 <ZInLlkXsgnej9ZpT@google.com>
 <001aa2ed-2f78-4361-451d-e31a4d4abaa0@semihalf.com>
 <ZIxqAXhy1tCVpzz7@google.com>
 <22438996-cea6-fcdc-530b-bf3f2477a81c@semihalf.com>
 <ZIyk+qIBRD6ezlPo@google.com>
 <10b6045e-e5e4-e1f6-f93a-34f1ad61fdfe@semihalf.com>
 <DM8PR11MB5750F226997913CC1A0E54A4E75FA@DM8PR11MB5750.namprd11.prod.outlook.com>
Content-Language: en-US
From:   Dmytro Maluka <dmy@semihalf.com>
In-Reply-To: <DM8PR11MB5750F226997913CC1A0E54A4E75FA@DM8PR11MB5750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/19/23 13:23, Reshetova, Elena wrote:
>> And BTW, doesn't it mean that interrupts also need to be hardened in the
>> guest (if we don't want the complexity of interrupt controllers in the
>> trusted hypervisor)? At least sensitive ones like IPIs, but I guess we
>> should also consider interrupt-based timings attacks, which could use
>> any type of interrupt. (I have no idea how to harden either of the two
>> cases, but I'm no expert.)
> 
> We have been thinking about it a bit at least when it comes to our
> TDX case. Two main issues were identified: interrupts contributing
> to the state of Linux PRNG [1] and potential implications of missing
> interrupts for reliable panic and other kernel use cases [2]. 
> 
> [1] https://intel.github.io/ccc-linux-guest-hardening-docs/security-spec.html#randomness-inside-tdx-guest
> [2] https://intel.github.io/ccc-linux-guest-hardening-docs/security-spec.html#reliable-panic
> 
> For the first one, in addition to simply enforce usage of RDSEED
> for TDX guests, we still want to do a proper evaluation of security
> of Linux PRNG under our threat model. The second one is 
> harder to reliably asses imo, but so far we were not able to find any
> concrete attack vectors. But it would be good if people who 
> have expertise in this, could take a look on the assessment we did. 
> The logic was to go over all kernel core callers of various 
> smp_call_function*, on_each_cpu* and check the implications
> if such an IPI is never delivered. 

Thanks. I also had in mind for example [1].

[1] https://people.cs.kuleuven.be/~jo.vanbulck/ccs18.pdf
