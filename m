Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A807427DEA3
	for <lists+linux-doc@lfdr.de>; Wed, 30 Sep 2020 04:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729774AbgI3C5T (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Sep 2020 22:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729708AbgI3C5T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 22:57:19 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511FCC0613D0
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 19:57:19 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id f1so129553plo.13
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 19:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CdiVN4MoIYXNti+D+K08kG5fvyK/5dVLiPfaQfAKwuc=;
        b=st7S9SNAhg2fIivqpQzhvrmcfW5mzGTGWG1LtzKvUjHGTdp9KEpCjllhjbUkwx8WMn
         p+cm1bIZEbYMfWgnoa4eAa+w8rrpDyy6EioF5U9eOyqidEfxrmln7sdWs2yOwSMV3nO/
         Pay10GF4e4N7hV0bKa6EAtxlwraP7NZsceZJljRUjsjHPwwAe2sMnECuiu4rO9lbmXQ7
         /w5bVInm5XamYfffGzqU1JfC/KFvZBOXUYsy+0bmp1AGwShCNSodR80vnTfEYSwkh8VB
         j07h44UWD3b/JibpXDuqHYCJgEh7xtwuiZfR5xl7OPdxhe5PT9k493K2YrBfb/zTdEi3
         IhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CdiVN4MoIYXNti+D+K08kG5fvyK/5dVLiPfaQfAKwuc=;
        b=MLpgxPr+yvOJF83OoFgn1V6wJIvA/INjZYRmVBbJX9U4mIanfMzXyTeh6M0EOo8ogf
         glD211fNpcLzNYgESWv2b/DLkHQiIOffGKmuEZ6iurnO7KeVOIxEcAxRul3ekgVZ/+IN
         ZUFfR1bqW5lnsQhOeWPWaJC493zIfilp2m/Zy71iwAiu/kSrYoDpI+SjcOK8hJXiDy8H
         nxGYfC6bePqQO0PRUEJkmwLNYoeCc+jiSAAN/k/FX9BVqIxOTdOTYccj7IjC3s9nvJT0
         UzrIK7Ql2jetgAIUF1pq4ZiDNZUaiKiKJv4VzvvNO2MSHjrhe9opYTI+Nhz65ROV6mm/
         ef/w==
X-Gm-Message-State: AOAM531p2z6S1JzPuVg/E9xsnE53SzOZ29h8FKeICOPnaw6zLaAvdHj4
        ge4NFBuC/grNWsF7EJpLF3fEJla/AiVR1Gs7O6ay4g==
X-Google-Smtp-Source: ABdhPJzX8idHqOKVy8umpqeXFwxgXNk3IKXSzqUAsXAqoXS95sel9yV5OAk2sSs+jMNGas6VmwSpjHHlG7L1C4y7lw4=
X-Received: by 2002:a17:90a:bc8d:: with SMTP id x13mr550726pjr.229.1601434638340;
 Tue, 29 Sep 2020 19:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200915125947.26204-1-songmuchun@bytedance.com>
 <20200915125947.26204-4-songmuchun@bytedance.com> <07e7d497-e800-be28-dfea-047579c3b27d@oracle.com>
In-Reply-To: <07e7d497-e800-be28-dfea-047579c3b27d@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 30 Sep 2020 10:56:42 +0800
Message-ID: <CAMZfGtWZ739Qd+9WZYtBTbQLjEqJa2BRa=5NBP9QMJQjsJS0mg@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH 03/24] mm/hugetlb: Introduce a new
 config HUGETLB_PAGE_FREE_VMEMMAP
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 30, 2020 at 7:41 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 9/15/20 5:59 AM, Muchun Song wrote:
> > The purpose of introducing HUGETLB_PAGE_FREE_VMEMMAP is to configure
> > whether to enable the feature of freeing unused vmemmap associated
> > with HugeTLB pages.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >  fs/Kconfig | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/fs/Kconfig b/fs/Kconfig
> > index 976e8b9033c4..61e9c08096ca 100644
> > --- a/fs/Kconfig
> > +++ b/fs/Kconfig
> > @@ -245,6 +245,21 @@ config HUGETLBFS
> >  config HUGETLB_PAGE
> >       def_bool HUGETLBFS
> >
> > +config HUGETLB_PAGE_FREE_VMEMMAP
> > +     bool "Free unused vmemmap associated with HugeTLB pages"
> > +     default n
> > +     depends on HUGETLB_PAGE
> > +     depends on SPARSEMEM_VMEMMAP
> > +     depends on HAVE_BOOTMEM_INFO_NODE
> > +     help
> > +       There are many struct page structure associated with each HugeTLB
> > +       page. But we only use a few struct page structure. In this case,
> > +       it waste some memory. It is better to free the unused struct page
> > +       structures to buddy system which can save some memory. For
> > +       architectures that support it, say Y here.
> > +
> > +       If unsure, say N.
> > +
>
> I could be wrong, but I believe the convention is introduce the config
> option at the same time code which depends on the option is introduced.
> Therefore, it might be better to combine with the next patch.

Yeah, great. Will do that. Thanks.

>
> Also, it looks like most of your development was done on x86.  Should
> this option be limited to x86 only for now?

Now only the x86 has the HAVE_BOOTMEM_INFO_NODE option. So
maybe this is enough :)

> --
> Mike Kravetz



-- 
Yours,
Muchun
