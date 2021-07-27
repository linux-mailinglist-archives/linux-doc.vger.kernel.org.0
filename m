Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74FD3D7EF4
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jul 2021 22:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhG0URC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 27 Jul 2021 16:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54278 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230426AbhG0URB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 16:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627417020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ByUPLbiVuvdvoapeEFXQAcFKJj/8lLrwBdwnV9vgH+s=;
        b=iIPYqXhCxCQ/tI2aYQFlODE1F3UluJwhMLsCtJIL6dxTpUc6duCZErA/0NMrf/FQ9v6VYQ
        kVXxAUsNLVyGRANNgGGwZuA/kcpiszOqAO1LQ4eAMpIY3IBJLke102HomkElsJgcSwK3U4
        9oeGI14kIdPEi0z3L79v7iom4+LBXQw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-NRw2HH0hOK-9f9YMV5b3YQ-1; Tue, 27 Jul 2021 16:16:59 -0400
X-MC-Unique: NRw2HH0hOK-9f9YMV5b3YQ-1
Received: by mail-qv1-f70.google.com with SMTP id 15-20020a0562140dcfb02902e558bb7a04so367276qvt.10
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 13:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ByUPLbiVuvdvoapeEFXQAcFKJj/8lLrwBdwnV9vgH+s=;
        b=Bggxk7TcdkgdtFFPI2K8tGFB9Cg+TbCqNDNPaudGLVGgr79LhFZXg6FapchxCSXIv0
         vKAFYP6hTwV1tDpBfpqXain81ehDhh0R0n68HdBUu29aRzPn+k1oadv3O/1Hh/m0f0U7
         QslyuaWTCg+VxVmu+wP0eXRA/KVu0977lWHtJPpu5WN/2Gksfm35Mfz1mFw0hZixmKSE
         XTV/Ct4FOGVfPtlGYFl+xqHG3vAtn6ij1BesUKd8rmSJ3ulzEFeo20c6sIDCaafJMR+N
         H63l3zVPj/nKz2LKrBgAQo5cgRvYH/+YPELG/8hv5Eq77sfl3xsCuNKViSgX5HrX/2CQ
         GrRw==
X-Gm-Message-State: AOAM531cLPMdaFiqj+Z8RcgF1eGZAYOobNHWuwu7+bN3Lk7UYJnaN88I
        Y8n6xDUbgGXrtKanN6CWl+xmc9jw0bwzcLhAYJhXNlSbTn/YwwuuNhh9BxS/r+h6F7A4SMOnaD4
        0A+XGAjqzRlg/G5PK3QFT
X-Received: by 2002:a05:620a:318e:: with SMTP id bi14mr21424391qkb.176.1627417018992;
        Tue, 27 Jul 2021 13:16:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkKaLGiPqMLIncbtDqJyUsjY34972lfs0JJ1TJHQSJbPBkHyyv8W+CXGcrtPiJOkaTxPBjIQ==
X-Received: by 2002:a05:620a:318e:: with SMTP id bi14mr21424373qkb.176.1627417018811;
        Tue, 27 Jul 2021 13:16:58 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id g10sm1910136qtp.67.2021.07.27.13.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 13:16:58 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 2/9] cgroup/cpuset: Fix a partition bug with hotplug
To:     Tejun Heo <tj@kernel.org>
Cc:     Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, Phil Auld <pauld@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>
References: <20210720141834.10624-1-longman@redhat.com>
 <20210720141834.10624-3-longman@redhat.com>
 <YP8+ajTnvrha+0O6@mtj.duckdns.org>
Message-ID: <2173a00b-504a-1932-877d-d26775e4775c@redhat.com>
Date:   Tue, 27 Jul 2021 16:16:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YP8+ajTnvrha+0O6@mtj.duckdns.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/26/21 6:59 PM, Tejun Heo wrote:
> On Tue, Jul 20, 2021 at 10:18:27AM -0400, Waiman Long wrote:
>> In cpuset_hotplug_workfn(), the detection of whether the cpu list
>> has been changed is done by comparing the effective cpus of the top
>> cpuset with the cpu_active_mask. However, in the rare case that just
>> all the CPUs in the subparts_cpus are offlined, the detection fails
>> and the partition states are not updated correctly. Fix it by forcing
>> the cpus_updated flag to true in this particular case.
>>
>> Fixes: 4b842da276a8 ("cpuset: Make CPU hotplug work with partition")
>> Signed-off-by: Waiman Long <longman@redhat.com>
> Applied to cgroup/for-5.15 w/ a minor update to the comment (I dropped
> "just" before "all". It read weird to me.)
>
> Thanks.
>
Thanks for fixing the wording.

Cheers,
Longman

