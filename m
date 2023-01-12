Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB3B666BE6
	for <lists+linux-doc@lfdr.de>; Thu, 12 Jan 2023 08:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjALH4i (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 12 Jan 2023 02:56:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235405AbjALH4g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jan 2023 02:56:36 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D33CF25
        for <linux-doc@vger.kernel.org>; Wed, 11 Jan 2023 23:56:35 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id y8-20020a170902b48800b00192a600df83so12273673plr.15
        for <linux-doc@vger.kernel.org>; Wed, 11 Jan 2023 23:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vg6nAgYjZ4wYYlTqMF3jbo791ipG8SuFLzs8v41dmTI=;
        b=kL0UvQite/urbN7Yp3NlzfzFTECRjRM1K7T5g4ZxG3zHylBlslAyzr6qxrAi9aysJM
         RDeACOZIgRrgriXoR4Pb3FUm6siAnl76A15BakL+7xmzzyJYvBrIKvFGmqzOdrHuLyHw
         eLCWL5a84U7mTNiiuZkhyyW//9BsTntHFbTMWG3xqNxmoxumrT4tac24HiqQmCacQxb7
         hWUb45XPnPy09DrO6jQeVMIxbVjfhO/QXKCL83ehtKjjTMjBps8fFK6gPa75SmpeTyw8
         vcf4DzdsP5Yv5ETLXzCGGp7Lotol2entUVESDqjWMyWKfU3XQsKSss8PleO3BkZomuWi
         ioIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vg6nAgYjZ4wYYlTqMF3jbo791ipG8SuFLzs8v41dmTI=;
        b=MKcKWe33Z1xM4mQqqq+CQ0wNZ53InrNuDtXYGlOrztsTuHjg/8OymOOxp7Q4uigqA0
         9g9K0dQ5/mV5f3lK8ti+O3rDoFeQh9g3ROsGH1SOB8Nxf0PQSykME7jOHT0xpWKRzUgK
         u0DkrTIaFR2FlGfSrFMpoo0rp8x1fMDYq0O+JBDHkVYxf3IjSq1oMwZYgLKlVSy3IfrG
         c+GszcX5tPaVRvFN6SZXr3ZtfM8C8T8axRdSdQcrcl+jGiUIbsK2rXhUipoD0+kjrLk6
         qK1MJZUWkUjzKkQNr6psx688ZwhsMAv9meJHs7BXuX5Ck/rx5iw9daqixH4/zAf7E5UK
         TxZg==
X-Gm-Message-State: AFqh2krC313MisUfhDHxv0YjltpXv7RSjC8E6IgplsabALf0NPw0Li2U
        ntpMrH9nHVBsVsIctqaDpt0IpoKLekUUBA==
X-Google-Smtp-Source: AMrXdXv29WhmagcsXxW5VJTVWoRrJdV9U6Gev8NYUGOd+PwEKkvAbufkJGb0qU84S3rueo4liZ5Ei6F1OKpY1Q==
X-Received: from shakeelb.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:262e])
 (user=shakeelb job=sendgmr) by 2002:a62:1488:0:b0:581:85ab:16b3 with SMTP id
 130-20020a621488000000b0058185ab16b3mr4558933pfu.67.1673510194669; Wed, 11
 Jan 2023 23:56:34 -0800 (PST)
Date:   Thu, 12 Jan 2023 07:56:31 +0000
In-Reply-To: <Y78+rfzXPq5XGs9O@phenom.ffwll.local>
Mime-Version: 1.0
References: <20230109213809.418135-1-tjmercier@google.com> <CALvZod4ru7F38tAO-gM9ZFKaEhS0w3KqFbPwhwcTvgJs4xMUow@mail.gmail.com>
 <Y78+rfzXPq5XGs9O@phenom.ffwll.local>
Message-ID: <20230112075631.wc6fd54ci55drhkp@google.com>
Subject: Re: [PATCH 0/4] Track exported dma-buffers with memcg
From:   Shakeel Butt <shakeelb@google.com>
To:     "T.J. Mercier" <tjmercier@google.com>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <brauner@kernel.org>,
        Carlos Llamas <cmllamas@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
        Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>, android-mm@google.com,
        jstultz@google.com, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 11, 2023 at 11:56:45PM +0100, Daniel Vetter wrote:
> 
[...]
> I think eventually, at least for other "account gpu stuff in cgroups" use
> case we do want to actually charge the memory.
> 
> The problem is a bit that with gpu allocations reclaim is essentially "we
> pass the error to userspace and they get to sort the mess out". There are
> some exceptions (some gpu drivers to have shrinkers) would we need to make
> sure these shrinkers are tied into the cgroup stuff before we could enable
> charging for them?
> 

No, there is no requirement to have shrinkers or making such memory
reclaimable before charging it. Though existing shrinkers and the
possible future shrinkers would need to be converted into memcg aware
shrinkers.

Though there will be a need to update user expectations that if they 
use memcgs with hard limits, they may start seeing memcg OOMs after the
charging of dmabuf.

> Also note that at least from the gpu driver side this is all a huge
> endeavour, so if we can split up the steps as much as possible (and get
> something interim useable that doesn't break stuff ofc), that is
> practically need to make headway here. 

This sounds reasonable to me.
