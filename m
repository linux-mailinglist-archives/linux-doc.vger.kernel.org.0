Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E3A666C2F
	for <lists+linux-doc@lfdr.de>; Thu, 12 Jan 2023 09:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236544AbjALINp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 12 Jan 2023 03:13:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239750AbjALINo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jan 2023 03:13:44 -0500
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53345E022
        for <linux-doc@vger.kernel.org>; Thu, 12 Jan 2023 00:13:40 -0800 (PST)
Received: by mail-pj1-x104a.google.com with SMTP id k11-20020a17090a514b00b0022723168c9eso5306969pjm.7
        for <linux-doc@vger.kernel.org>; Thu, 12 Jan 2023 00:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VWdRXf2+F3B6naWulQRoVncCtgT+T33N/C9h1MKyUek=;
        b=RGhd7Gam36sQbHlynE0qAtHIsyX4aCLddPEY2Ot/Dgnedc14Puqc+N15BF4HB1+p/F
         EyiFI8PkNHaolrVoe7QK5BM3CZp8vk6W4pTXG5t695yYCvf//btA1VGQaXM5Z9EWJrrS
         xLHhPHGK7LgyKGGfWBnGBtXkZ8Wr4/C7eaUCkaE01oIFkojxBDOH6PCPZu8BNx5Djp6V
         IfwRrmeF7rOuyASGIPSCTwqUXba95DqJIXmf+I/r32QKtPTm9Z4todzk318w55UFVqKx
         +j/E0vEN9DOhznh8mKC4jQPd/KfjI32B1A83D6ZGmdcx152TXiUUGw3Pro8wO5zpPEJ8
         n0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWdRXf2+F3B6naWulQRoVncCtgT+T33N/C9h1MKyUek=;
        b=nD8i00zE6v8+Q5wHaGE9hGSz5dV8PCzqTP5ZleZ9ziD0vnptjhhDVe573tzKwjPOH9
         /oI97QsGC3Qo8Pu3NPUK4LprqkmmDMfCXgKE0IFxlPbjUcFxCtCsUgJ+leeUmoriRY2K
         WUK5qYf3eI+l2HMTmbEuwGJcDoxeEdaWbWtAKClyk+AC5VJSWRO83EQPgX0YwMh6UWZp
         5V9VFgAjlsWTaMhrtghuHfpzhSp3vAiqY/F1yaXY2snAf3WysLgGq4o3yRp0CJF3ge/F
         +LFPr0WoXsLGphS7rKPBY8vZDU8XY3qO/nSn6oDBXbwGsViV61Vc+d6KWbi1Y8rzY6NR
         Hznw==
X-Gm-Message-State: AFqh2koxRBtfyzyDzfsKQArjfCLU4dXOQRlIPRfJYodAH2M7rJX1OcIh
        uz3CnhXYYm87k3FfllKkdSudRxpvCa4khg==
X-Google-Smtp-Source: AMrXdXsnUERgCx1wBY/PUV43pyxeJkOgHSEhh4R8ej3lO942bcK1tz6HE+NyNfEUpzC5WGguaBo2zTGHvm8JZA==
X-Received: from shakeelb.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:262e])
 (user=shakeelb job=sendgmr) by 2002:a05:6a00:1244:b0:56b:8181:fe3e with SMTP
 id u4-20020a056a00124400b0056b8181fe3emr5060573pfi.57.1673511219777; Thu, 12
 Jan 2023 00:13:39 -0800 (PST)
Date:   Thu, 12 Jan 2023 08:13:37 +0000
In-Reply-To: <CABdmKX0TAv=iRz0s+F6dVVX=xsK00BeUPkRM4bnsfemDAY9U4w@mail.gmail.com>
Mime-Version: 1.0
References: <20230109213809.418135-1-tjmercier@google.com> <CALvZod4ru7F38tAO-gM9ZFKaEhS0w3KqFbPwhwcTvgJs4xMUow@mail.gmail.com>
 <Y78+rfzXPq5XGs9O@phenom.ffwll.local> <CABdmKX0TAv=iRz0s+F6dVVX=xsK00BeUPkRM4bnsfemDAY9U4w@mail.gmail.com>
Message-ID: <20230112081337.fxgnhdk44mxu26et@google.com>
Subject: Re: [PATCH 0/4] Track exported dma-buffers with memcg
From:   Shakeel Butt <shakeelb@google.com>
To:     "T.J. Mercier" <tjmercier@google.com>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
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
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 11, 2023 at 04:49:36PM -0800, T.J. Mercier wrote:
> 
[...]
> > The problem is a bit that with gpu allocations reclaim is essentially "we
> > pass the error to userspace and they get to sort the mess out". There are
> > some exceptions (some gpu drivers to have shrinkers) would we need to make
> > sure these shrinkers are tied into the cgroup stuff before we could enable
> > charging for them?
> >
> I'm also not sure that we can depend on the dmabuf being backed at
> export time 100% of the time? (They are for dmabuf heaps.) If not,
> that'd make calling the existing memcg folio based functions a bit
> difficult.
> 

Where does the actual memory get allocated? I see the first patch is
updating the stat in dma_buf_export() and dma_buf_release(). Does the
memory get allocated and freed in those code paths?
