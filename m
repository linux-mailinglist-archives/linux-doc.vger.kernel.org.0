Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF2774A197
	for <lists+linux-doc@lfdr.de>; Thu,  6 Jul 2023 17:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbjGFPyI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 6 Jul 2023 11:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjGFPyH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jul 2023 11:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0251FD4
        for <linux-doc@vger.kernel.org>; Thu,  6 Jul 2023 08:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688658756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FRxt/NiYUgXmWV4fU8al0zRW2xGKMvH1kCizqQUlA4w=;
        b=dcRLPyN0hCF47Lu8xVqBcOLpEdMD79WTcXaaV299k39qII0lUzBHXiOG7ZJUoU9N0Dv8IG
        JmopjTlTT7B1bq+o0uafJ5orNBvzNG5biDsCmEjGxl7it38KDHd7mDvO6jk21pQABmfaNa
        zkEcMPIUQCkHk6UXMTGQ5PQ6V1Tc7ZY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-5r9JO7X1Mu-ClnxSCXkysA-1; Thu, 06 Jul 2023 11:52:35 -0400
X-MC-Unique: 5r9JO7X1Mu-ClnxSCXkysA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fbb18e9bd9so5142155e9.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Jul 2023 08:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688658754; x=1691250754;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRxt/NiYUgXmWV4fU8al0zRW2xGKMvH1kCizqQUlA4w=;
        b=eZM7mSdt8CowG+w94XeAzf1H+rRQAe9PY6i6k9t9MbaPQemLxHQlRGbgr6YrRjQZdc
         z8/TUu4HAJQYOxlzPfYYEESgtHUJuplyzCoJCVMnx4yuxclJqg46vRjPchoRcvxfg0Bf
         YcCkdce3C34AviemB1a35i2fP2uN7HPdouJDsq4dNFrRMZL2sn7EkF+fxje8vHSq6wgd
         Q1KHUT2GtkbYiIS4ltfrQMIy2O08tdhXB0kN6VeIU7/AqAccLxX4mhH1sidpBWbPahG7
         kO/keaPq/KJZ15wqPfMx3pO01UN9N6qGFphidHufRTnrHjSuWYoLROKlaGGDmPLE3ulJ
         rGHg==
X-Gm-Message-State: ABy/qLZu8To0HtgY6j2dBUJUgy3BxJ5IIlupVvJtWTT791IqYfIigbLO
        2g2RZi1XyUDdSx93Qdh/VPdqI1b8qZq/AayDwvZGyZblLc7zyG1oqvufhQGwiK8h1l9gGBby5I/
        e37s/lR4xENzkyRCQbAtt
X-Received: by 2002:a05:600c:470e:b0:3fa:94ea:583c with SMTP id v14-20020a05600c470e00b003fa94ea583cmr5689125wmo.8.1688658754382;
        Thu, 06 Jul 2023 08:52:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHXRw0efno7C2fsVwB/UBBH508hAt9zGq2PeqHV7LtAjoXuI1o+g7kP3ECiR8lQmbiALoTLPA==
X-Received: by 2002:a05:600c:470e:b0:3fa:94ea:583c with SMTP id v14-20020a05600c470e00b003fa94ea583cmr5689103wmo.8.1688658754011;
        Thu, 06 Jul 2023 08:52:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id m23-20020a7bcb97000000b003fbaade072dsm2484157wmi.23.2023.07.06.08.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 08:52:33 -0700 (PDT)
Message-ID: <41329726-6861-f777-e7b1-e4b510ab4af5@redhat.com>
Date:   Thu, 6 Jul 2023 17:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH drm-next v6 02/13] drm: manager to keep track of GPUs VA
 mappings
Content-Language: en-US
To:     Donald Robson <Donald.Robson@imgtec.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "jason@jlekstrand.net" <jason@jlekstrand.net>,
        "willy@infradead.org" <willy@infradead.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "bagasdotme@gmail.com" <bagasdotme@gmail.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "matthew.brost@intel.com" <matthew.brost@intel.com>,
        "bskeggs@redhat.com" <bskeggs@redhat.com>,
        "ogabbay@kernel.org" <ogabbay@kernel.org>,
        "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
        "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "alexdeucher@gmail.com" <alexdeucher@gmail.com>,
        "airlied@gmail.com" <airlied@gmail.com>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "airlied@redhat.com" <airlied@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
 <20230629222651.3196-3-dakr@redhat.com>
 <8d01cb3add315277c86cf4b28d6901fed1977448.camel@imgtec.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <8d01cb3add315277c86cf4b28d6901fed1977448.camel@imgtec.com>
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

Hi Donald,

On 7/6/23 17:45, Donald Robson wrote:
> On Fri, 2023-06-30 at 00:25 +0200, Danilo Krummrich wrote:
>>
>> +#ifdef CONFIG_LOCKDEP
>> +typedef struct lockdep_map *lockdep_map_p;
>> +#define drm_gpuva_manager_ext_assert_held(mgr)		\
>> +	lockdep_assert(lock_is_held((mgr)->ext_lock) != LOCK_STATE_NOT_HELD)
>> +/**
>> + * drm_gpuva_manager_set_ext_lock - set the external lock according to
>> + * @DRM_GPUVA_MANAGER_LOCK_EXTERN
>> + * @mgr: the &drm_gpuva_manager to set the lock for
>> + * @lock: the lock to set
>> + *
>> + * If @DRM_GPUVA_MANAGER_LOCK_EXTERN is set, drivers need to call this function
>> + * to provide the lock used to lock linking and unlinking of &drm_gpuvas to the
>> + * &drm_gem_objects GPUVA list.
>> + */
>> +#define drm_gpuva_manager_set_ext_lock(mgr, lock)	\
>> +	(mgr)->ext_lock = &(lock)->dep_map
>> +#else
>> +typedef struct { /* nothing */ } lockdep_map_p;
> 
> lockdep_map_p conflicts with an identical typedef in maple_tree.h when CONFIG_LOCKDEP is
> not set (it's being pulled in by mm.h in drm_vma_manager.h). I'll just comment the line
> out for now.

Good catch! I got this trick from maple_tree.h and intended to move it 
to the lockdep header in a separate patch to avoid such collisions. 
Unfortunately, I forgot about it. Gonna fix it up.

- Danilo

> 
>> +#define drm_gpuva_manager_ext_assert_held(mgr)		do { (void)(mgr); } while (0)
>> +#define drm_gpuva_manager_set_ext_lock(mgr, lock)	do { } while (0)
>> +#endif
>> +

