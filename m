Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE1874B112
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jul 2023 14:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbjGGMmK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Jul 2023 08:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjGGMmJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jul 2023 08:42:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0374D19B2
        for <linux-doc@vger.kernel.org>; Fri,  7 Jul 2023 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688733688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7Pvx8BnPDazf3dvRsddP57JfF7wRhoQ8lQ+cKlGDP24=;
        b=dyNIakG1fca6a2lT6Ertq/Rp8AgwYIbAPVLzveJJTQT1ZdQoRQYOgfJj5HYsK34AFEfMdt
        nTCDIglyUlZu4GkreXUEWXdSXhs/l+F0DKU6NdGHvne185RRyUKPlmaf8PZzHpO/WBLzeT
        amKqYwe1hYnQCGeGq2XgnoD4UQX0Shs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-NM6xkfWUOgG95kHaztfiGw-1; Fri, 07 Jul 2023 08:41:26 -0400
X-MC-Unique: NM6xkfWUOgG95kHaztfiGw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-993d5006993so36026866b.3
        for <linux-doc@vger.kernel.org>; Fri, 07 Jul 2023 05:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688733685; x=1691325685;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Pvx8BnPDazf3dvRsddP57JfF7wRhoQ8lQ+cKlGDP24=;
        b=WfqMo6DGPpRbpXAVmjrUCm6jj7t7NtR981anAxbLWcZTNez2i60InOni7Emuf63Yrx
         +44W6xY7j59Eb74sewgb1h4sfo9LrgN8T2QlqYX717Dkd31usDr3Rm49Y+bddMHTexx2
         FJcx6j3lRf5Uj1KPOlMSDy0dsjjtJzEQAgVbu1691wGO4aO6dlnS0xMNvt4v9/HvOg2B
         pLFNCffRMWmiAlk7evSHwpi6lBENIdHbV1WaDFQ6bXYcJd1WPrjv5m+6bFwmKzaN/x3m
         tVW/cDFmj52DgPQaPiMfUS/HTGkVrmTjqE9aCU/soGK0pdT3D5JA3B9p3NGvEZqCRCvj
         kPIw==
X-Gm-Message-State: ABy/qLYCa5CQOgktY8hrO9SThSpp3nhW4ScgubwnXIbsdH5Hxt8UrXyh
        n8S6cyVL/7wOxpCU5iVgF7wtTHGvgddBZ9pm46o3G/JBDNZWOEv9m1MTdslCyselvT78FN+4cfS
        sk8H53Z1241darUlLpeDN
X-Received: by 2002:a17:906:7a0f:b0:974:1c98:d2d9 with SMTP id d15-20020a1709067a0f00b009741c98d2d9mr4407026ejo.3.1688733685810;
        Fri, 07 Jul 2023 05:41:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEjteGIi3KT97fwOWlMdZkLiUsbSPeH2eror+aBLBU9/BQlYnfXmM4DYbHJ8zXHqJFnCi0/Wg==
X-Received: by 2002:a17:906:7a0f:b0:974:1c98:d2d9 with SMTP id d15-20020a1709067a0f00b009741c98d2d9mr4406995ejo.3.1688733685531;
        Fri, 07 Jul 2023 05:41:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id qh27-20020a170906ecbb00b0098733a40bb7sm2148920ejb.155.2023.07.07.05.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 05:41:25 -0700 (PDT)
Message-ID: <e92219d7-77f7-a40a-39d9-ea7afc5f3687@redhat.com>
Date:   Fri, 7 Jul 2023 14:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH drm-next v6 02/13] drm: manager to keep track of GPUs VA
 mappings
Content-Language: en-US
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, alexdeucher@gmail.com, ogabbay@kernel.org,
        bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Donald Robson <donald.robson@imgtec.com>,
        Dave Airlie <airlied@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
 <20230629222651.3196-3-dakr@redhat.com>
 <20230707130010.1bd5d41b@collabora.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230707130010.1bd5d41b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/7/23 13:00, Boris Brezillon wrote:
> On Fri, 30 Jun 2023 00:25:18 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> +/**
>> + * drm_gpuva_for_each_va_range - iternator to walk over a range of &drm_gpuvas
>> + * @va__: &drm_gpuva structure to assign to in each iteration step
>> + * @mgr__: &drm_gpuva_manager to walk over
>> + * @start__: starting offset, the first gpuva will overlap this
>> + * @end__: ending offset, the last gpuva will start before this (but may
>> + * overlap)
>> + *
>> + * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
>> + * between @start__ and @end__. It is implemented similarly to list_for_each(),
>> + * but is using the &drm_gpuva_manager's internal interval tree to accelerate
>> + * the search for the starting &drm_gpuva, and hence isn't safe against removal
>> + * of elements. It assumes that @end__ is within (or is the upper limit of) the
>> + * &drm_gpuva_manager. This iterator does not skip over the &drm_gpuva_manager's
>> + * @kernel_alloc_node.
>> + */
>> +#define drm_gpuva_for_each_va_range(va__, mgr__, start__, end__) \
>> +	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__)); \
> 
> drm_gpuva_find_first() takes the range size as its last argument, not
> the range end:
> 
> 	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
> 

Good catch! Originally this was

drm_gpuva_it_iter_first(&(mgr)->rb.tree, (start__), (end__) - 1)

but then I changed it since I did not want to expose the interval tree 
functions directly.

> 
>> +	     va__ && (va__->va.addr < (end__)) && \
>> +	     !list_entry_is_head(va__, &(mgr__)->rb.list, rb.entry); \
>> +	     va__ = list_next_entry(va__, rb.entry))
> 
> If you define:
> 
> static inline struct drm_gpuva *
> drm_gpuva_next(struct drm_gpuva *va)
> {
> 	if (va && !list_is_last(&va->rb.entry, &va->mgr->rb.list))
> 		return list_next_entry(va, rb.entry);
> 
> 	return NULL;
> } >
> the for loop becomes a bit more readable:

Yes, it would. However, I don't want it to be confused with 
drm_gpuva_find_next(). Maybe I should rename the latter to something 
like drm_gpuva_find_next_neighbor() then.

> 
> 	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
> 	     va__ && (va__->va.addr < (end__)); \
> 	     va__ = drm_gpuva_next(va__))
> 
>> +
>> +/**
>> + * drm_gpuva_for_each_va_range_safe - iternator to safely walk over a range of
>> + * &drm_gpuvas
>> + * @va__: &drm_gpuva to assign to in each iteration step
>> + * @next__: another &drm_gpuva to use as temporary storage
>> + * @mgr__: &drm_gpuva_manager to walk over
>> + * @start__: starting offset, the first gpuva will overlap this
>> + * @end__: ending offset, the last gpuva will start before this (but may
>> + * overlap)
>> + *
>> + * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
>> + * between @start__ and @end__. It is implemented similarly to
>> + * list_for_each_safe(), but is using the &drm_gpuva_manager's internal interval
>> + * tree to accelerate the search for the starting &drm_gpuva, and hence is safe
>> + * against removal of elements. It assumes that @end__ is within (or is the
>> + * upper limit of) the &drm_gpuva_manager. This iterator does not skip over the
>> + * &drm_gpuva_manager's @kernel_alloc_node.
>> + */
>> +#define drm_gpuva_for_each_va_range_safe(va__, next__, mgr__, start__, end__) \
>> +	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__)), \
>> +	     next__ = va ? list_next_entry(va__, rb.entry) : NULL; \
>> +	     va__ && (va__->va.addr < (end__)) && \
>> +	     !list_entry_is_head(va__, &(mgr__)->rb.list, rb.entry); \
>> +	     va__ = next__, next__ = list_next_entry(va__, rb.entry))
> 
> And this is the safe version using the drm_gpuva_next() helper:
> 
> 	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)), \
> 	     next__ = drm_gpuva_next(va__); \
> 	     va__ && (va__->va.addr < (end__)); \
> 	     va__ = next__, next__ = drm_gpuva_next(va__))
> 
> Those changes fixed an invalid pointer access I had in the sm_unmap()
> path.
> 

Sorry you did run into this bug.

- Danilo

