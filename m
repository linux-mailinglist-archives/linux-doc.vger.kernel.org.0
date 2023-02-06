Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAAE68C5FF
	for <lists+linux-doc@lfdr.de>; Mon,  6 Feb 2023 19:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjBFSmR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 6 Feb 2023 13:42:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBFSmQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Feb 2023 13:42:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16956273D
        for <linux-doc@vger.kernel.org>; Mon,  6 Feb 2023 10:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675708887;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mV7wu48lUfeS3GU07IXyzbGWRiDs4lMjYJhBoJBL7dQ=;
        b=GRzj6Qgw29zOkVEJcN9HSVhRPFvkcq8MjD2iNkDET0B7nQ61uOwz/cJPr6EWkDBQdRkarT
        Qcft7vmmKkLxhsITPMIKrxrrjwM6gMOezbI3gkX3DOWy80Kn/jBFsCfxIC1jUlqwYyGC1w
        yK7mVTFaQ7XuqS9Tm9sIdraLYSQS3hw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-S4BoJ0BJO3CapLoKeW03rQ-1; Mon, 06 Feb 2023 13:41:26 -0500
X-MC-Unique: S4BoJ0BJO3CapLoKeW03rQ-1
Received: by mail-ed1-f70.google.com with SMTP id en20-20020a056402529400b004a26ef05c34so8291795edb.16
        for <linux-doc@vger.kernel.org>; Mon, 06 Feb 2023 10:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mV7wu48lUfeS3GU07IXyzbGWRiDs4lMjYJhBoJBL7dQ=;
        b=mMDv0VRU+n8t4Y4bqJl+8kUhYlDJarqcVeju9XMkUGRO5gZn6uYgZHpmuTBrTOAxTD
         yHzKit7RH6eThKRN3aiCtBBFASxtqp5awkmbTdY3gtdwJHmr4d40/cZWZLJQp972OVQr
         edla50tFOthGb6N6DLMZcD0JQcuQtjFymxT5yOBN3oDpk2Yd44IDkPz1gFlmTL3yM7QU
         EeIO/U0zYmaPEamjUo59uwsTv+oj7XnOvtf7iBlcLekuqO8u9Wxi9J8RfNs0WQvu8N4u
         3VpsOsW8W8sHQQGbgSXwvuYBZJ/hhx3rDhRapjTWXjcK3CRS7eAVfHtCr48prg+NPaTm
         74fQ==
X-Gm-Message-State: AO0yUKUwf7QWPU42ILf3rF09W6hJR1G4568Ns2iNLwBXh3xt7jIRtHvK
        wLPCK6DLZlVtv82e+a8mefr+tkpfgYNXHyJSFNo4l4Rge9Vu+JvugQPXOqNpPoWhAJrVF58MPEJ
        /iAiEg3fWyEPYTgAvVeW9
X-Received: by 2002:a17:906:1dc8:b0:878:8237:7abb with SMTP id v8-20020a1709061dc800b0087882377abbmr383407ejh.35.1675708885089;
        Mon, 06 Feb 2023 10:41:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9FFg9WxyaDxE9MX9rbZD0l91/5bcmXcVyXebsSOuym8lZQpDrI3Bo83tXHjG/CiZX7/gEa+A==
X-Received: by 2002:a17:906:1dc8:b0:878:8237:7abb with SMTP id v8-20020a1709061dc800b0087882377abbmr383390ejh.35.1675708884883;
        Mon, 06 Feb 2023 10:41:24 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id bu18-20020a170906a15200b0088351ea808bsm5750226ejb.46.2023.02.06.10.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 10:41:24 -0800 (PST)
Message-ID: <4439c44b-cbd0-7160-da3d-e78f6aeeec77@redhat.com>
Date:   Mon, 6 Feb 2023 19:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Nouveau] [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi
 interfaces
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Dave Airlie <airlied@gmail.com>
Cc:     Matthew Brost <matthew.brost@intel.com>, daniel@ffwll.ch,
        corbet@lwn.net, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mripard@kernel.org, bskeggs@redhat.com, jason@jlekstrand.net,
        nouveau@lists.freedesktop.org, airlied@redhat.com
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
 <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
 <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
 <CAPM=9txON8VCb3H7vDY_DOgtUg2Ad3mBvYVxgSMyZ1noOu-rBQ@mail.gmail.com>
 <a1c526e0-0df7-12cb-c5a1-06e9cd0d876b@amd.com>
 <3f935a7e-fede-2bad-c029-4a3af850c9b5@redhat.com>
 <95d0631b-545c-ea4d-7439-75422e9a9120@amd.com>
 <67958920-c5bb-a0f5-2306-e3ae4fdbaeb3@redhat.com>
 <c0635ff3-027f-bcd7-afbc-46f4e62d3651@amd.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <c0635ff3-027f-bcd7-afbc-46f4e62d3651@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/6/23 17:14, Christian König wrote:
> Concentrating this discussion on a very big misunderstanding first.
> 
> Am 06.02.23 um 14:27 schrieb Danilo Krummrich:
>> [SNIP]
>> My understanding is that userspace is fully responsible on the parts 
>> of the GPU VA space it owns. This means that userspace needs to take 
>> care to *not* ask the kernel to modify mappings that are in use 
>> currently.
> 
> This is a completely wrong assumption! Take a look at what games like 
> Forza Horizzon are doing.
> 
> Basically that game allocates a very big sparse area and fills it with 
> pages from BOs while shaders are accessing it. And yes, as far as I know 
> this is completely valid behavior.

I also think this is valid behavior. That's not the problem I'm trying 
to describe. In this case userspace modifies the VA space 
*intentionally* while shaders are accessing it, because it knows that 
the shaders can deal with reading 0s.

Just to have it all in place, the example I gave was:
  - two virtually contiguous buffers A and B
  - binding 1 mapped to A with BO offset 0
  - binding 2 mapped to B with BO offset length(A)

What I did not mention both A and B aren't sparse buffers in this 
example, although it probably doesn't matter too much.

Since the conditions to do so are given, we merge binding 1 and binding 
2 right at the time when binding 2 is requested. To do so a driver might 
unmap binding 1 for a very short period of time (e.g. to (re-)map the 
freshly merged binding with a different page size if possible).

 From userspace perspective buffer A is ready to use before applying 
binding 2 to buffer B, hence it would be illegal to touch binding 1 
again when userspace asks the kernel to map binding 2 to buffer B.

Besides that I think there is no point in merging between buffers anyway 
because we'd end up splitting such a merged mapping anyway later on when 
one of the two buffers is destroyed.

Also, I think the same applies to sparse buffers as well, a mapping 
within A isn't expected to be re-mapped just because something is mapped 
to B.

However, in this context I start wondering if re-mapping in the context 
of merge and split is allowed at all, even within the same sparse buffer 
(and even with a separate page table for sparse mappings as described in 
my last mail; shaders would never fault).

> 
> So you need to be able to handle this case anyway and the approach with 
> the regions won't help you at all preventing that.
> 
> Regards,
> Christian.
> 

