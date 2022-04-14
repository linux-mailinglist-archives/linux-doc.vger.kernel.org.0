Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA5BE50048A
	for <lists+linux-doc@lfdr.de>; Thu, 14 Apr 2022 05:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239674AbiDNDMa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Apr 2022 23:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbiDNDMa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Apr 2022 23:12:30 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75842245A8
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 20:10:06 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id mp16-20020a17090b191000b001cb5efbcab6so8055559pjb.4
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 20:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x38fxRe2I9332EIqIELmjXuO8tya1CoWYBlRM4dRf9Y=;
        b=DEQXkwfuO8XG/2J5+9/TexaZwTl30gwLH5K+skHt03SGR7MIro3RVpiei7Z4RSuNp9
         1btBtXzkEoUzfIMDttWv7ygA/QNseQt7o9nMmSCv8sZpkeHXxLAqegSkkqSrn11HjwlT
         uLqet9TK0M2oXxLqk6AjrDc7yMdb9f3JMPqp2N/NBNn0VH6FyXrb979ZDwfcR5qUpgH6
         qcSpQx2teJGe/iFCO9UT9un/RtF4dK1YubV+H5bormOuBdvqJIED8uPibsQ+r+ksnVo5
         BhxWSyjNsfVlL/57Iyrwn0lOvzl8FsIMLHvZwUfjsd3HPW38cwOYL85diShzl9WXxILJ
         sZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x38fxRe2I9332EIqIELmjXuO8tya1CoWYBlRM4dRf9Y=;
        b=cCIs+rdxWAKJkL/tj6pwOp5DD982KLfxANcmuEmoFysgLDRyWdoloxAhVFOyYOw1zK
         Igi3/lCFJ4gTw6X2O4bWLDLfT5UfZNn2+YL42FWpd0UFYUOav6i2S83MI/3mXaF3+QBP
         NawDfbE7OBt+zjQ1KuM1AbUYVuqX1mtSnZjpFHx7K6+QjB3uiSDD9mFzsTaWhDaIdy4H
         JMVUOpvMvxKdjJELaorAC1E8gG1jahnn0bIPE8qqQClDXKgmV5AfhXD2LIRulAI6eORi
         i58IOocX7L7YS8CDtRVjAmKDvAF3fQZeq4mgWjGCySiG63JHpC9GYA4XfQTuI/gCqmst
         w4hw==
X-Gm-Message-State: AOAM532bXEbWB2gmQeyG9Kit+I8uVjI+NcC4FWf7dYFv7oYC1A4dtdLz
        Wuk0PGgG+aG4NSzC3UBJ9GpwgA==
X-Google-Smtp-Source: ABdhPJx26XcNuCBhCeMD0mZWqXVksREg7eMXsF7ScRo4UeehL60oi/zUIX7ce55F4s2S0hYc+pyncw==
X-Received: by 2002:a17:903:246:b0:153:84fe:a9b0 with SMTP id j6-20020a170903024600b0015384fea9b0mr45398269plh.163.1649905806015;
        Wed, 13 Apr 2022 20:10:06 -0700 (PDT)
Received: from localhost ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id e6-20020a17090a728600b001cb646a4adfsm4198135pjg.52.2022.04.13.20.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 20:10:05 -0700 (PDT)
Date:   Thu, 14 Apr 2022 11:10:01 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     corbet@lwn.net, mike.kravetz@oracle.com, mcgrof@kernel.org,
        keescook@chromium.org, yzaikin@google.com, osalvador@suse.de,
        david@redhat.com, masahiroy@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        duanxiongchun@bytedance.com, smuchun@gmail.com
Subject: Re: [PATCH v8 1/4] mm: hugetlb_vmemmap: introduce
 CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP
Message-ID: <YleQiQW7gFTO7SMk@FVFYT0MHHV2J.usts.net>
References: <20220413144748.84106-1-songmuchun@bytedance.com>
 <20220413144748.84106-2-songmuchun@bytedance.com>
 <20220413120804.3570dc230a958f4923e3f3c3@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413120804.3570dc230a958f4923e3f3c3@linux-foundation.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 13, 2022 at 12:08:04PM -0700, Andrew Morton wrote:
> On Wed, 13 Apr 2022 22:47:45 +0800 Muchun Song <songmuchun@bytedance.com> wrote:
> 
> > If the size of "struct page" is not the power of two but with the feature
> > of minimizing overhead of struct page associated with each HugeTLB is
> > enabled, then the vmemmap pages of HugeTLB will be corrupted after
> > remapping (panic is about to happen in theory).  But this only exists when
> > !CONFIG_MEMCG && !CONFIG_SLUB on x86_64.  However, it is not a conventional
> > configuration nowadays.  So it is not a real word issue, just the result
> > of a code review.
> 
> The patch does add a whole bunch of tricky junk to address something
> which won't happen.  How about we simply disable
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP if (!CONFIG_MEMCG &&
> !CONFIG_SLUB)?
>
 
I'm afraid not. The size of 'struct page' also depends on
LAST_CPUPID_NOT_IN_PAGE_FLAGS which could be defined
when CONFIG_NODES_SHIFT or CONFIG_KASAN_SW_TAGS
or CONFIG_NR_CPUS is configured with a large value.  Then
the size would be more than 64 bytes.

Seems like the approach [1] is more simple and feasible,
which also could prevent the users from doing unexpected
configurations, however, it is objected by Masahiro.
Shall we look back at the approach again?

Thanks.

