Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B402E0481
	for <lists+linux-doc@lfdr.de>; Tue, 22 Dec 2020 03:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgLVCuy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Dec 2020 21:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgLVCuy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Dec 2020 21:50:54 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A52BC0613D3
        for <linux-doc@vger.kernel.org>; Mon, 21 Dec 2020 18:50:14 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id y8so6660005plp.8
        for <linux-doc@vger.kernel.org>; Mon, 21 Dec 2020 18:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sCc2IFUwdvsSbaqGN4i+xoLYg8bo8q9GqOnadnWn86M=;
        b=EFcweklmpZFX37UCEa3NG/H3IqUe54EEr8xpQ6AhjlUWmnNx+oFVTKuD+PJBMF9MC/
         PuFFFg9DSJ5ZqAwIVFcWXhAKNGWPqqF9ssAWzic75Tq45wA8X+6NlRIq8tw9fSmh+5Q6
         DyDpIAtBPi/QMJDfwtuXuWeDouFBQdcR2dzVjlrRLWskgwMzha9m8jXCTBq9loGrlbMP
         0lR4bZyv8mKlXjD3CnQlEuePSSPV1H6noA2eO5XEJ71Qxf/Tuvq1jc8H7eGZjb7KKgOZ
         WICiH3apu5X51ETJcKMrV8hF3Lh9xibTjcIzS9KvLcmNKrnGLrIBSRmPqvpdnxIOC/J6
         PBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sCc2IFUwdvsSbaqGN4i+xoLYg8bo8q9GqOnadnWn86M=;
        b=XL88pMLW9Tli8OGEihWgLjuMe70XGqJmCCmrTdr+zlByQ0qXunCW7hGEDfAIok4zoV
         T2lzHsO72jGnwlKH34qP7+5/gPKGGOmPvq12LqA9Jw3MQ4CbpeBNDknZyxIM1dpbcR9D
         BNEu4GRZVGn8HON26hrdvrFZaYTBa5Pz/XcTEGswSWf6vpjNHSaL3znVCmSyydqpjTMp
         lPvuEO5XsagAmXQ/cNlhnVFrLLJxygaBbYF6DTWAe9Pnd7RpgmifCpE+7jwmzcXzV3a7
         TEqJ/urevPGUvkVp1S7vRruzTzO5gPJEpXrQaiibB+z9NISljvKuIOV+I/vemAiZtBfM
         DsXQ==
X-Gm-Message-State: AOAM533KfUorQEmYPEB1+LRm3gcsshJavzSQ3hEI18NgI9Eg9FsfwjmA
        TBzJzoEzkWY771FTR/Wn0YmX1yMyYS/6a5RIEsx5WQ==
X-Google-Smtp-Source: ABdhPJwN8zbi7sZTQVpPryOVuQt7CfApSm+iEg1iAxKHHrxnSB7kplgsZ+W7mu3itpRyCUFJ7EmCi7/nZfC9oacqVo4=
X-Received: by 2002:a17:902:8503:b029:dc:44f:62d8 with SMTP id
 bj3-20020a1709028503b02900dc044f62d8mr18889150plb.34.1608605413385; Mon, 21
 Dec 2020 18:50:13 -0800 (PST)
MIME-Version: 1.0
References: <20201217121303.13386-1-songmuchun@bytedance.com>
 <20201217121303.13386-4-songmuchun@bytedance.com> <20201221091123.GB14343@linux>
 <CAMZfGtVnS=_m4fpGBfDpOpdgzP02QCteUQn-gGiLADWfGiVJ=A@mail.gmail.com>
 <20201221134345.GA19324@linux> <CAMZfGtVTqYXOvTHSay-6WS+gtDSCtcN5ksnkj8hJgrUs_XWoWQ@mail.gmail.com>
 <20201221180019.GA2884@localhost.localdomain>
In-Reply-To: <20201221180019.GA2884@localhost.localdomain>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 22 Dec 2020 10:49:35 +0800
Message-ID: <CAMZfGtVsJz-vt-vsgGBAxGOKdibCAxBsnjEpupKX_=Tw9rZZ3A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v10 03/11] mm/hugetlb: Free the vmemmap
 pages associated with each HugeTLB page
To:     Oscar Salvador <osalvador@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
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
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>, naoya.horiguchi@nec.com,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 22, 2020 at 2:00 AM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Mon, Dec 21, 2020 at 11:52:30PM +0800, Muchun Song wrote:
> > On Mon, Dec 21, 2020 at 9:44 PM Oscar Salvador <osalvador@suse.de> wrote:
> > >
> > > On Mon, Dec 21, 2020 at 07:25:15PM +0800, Muchun Song wrote:
> > >
> > > > Should we add a BUG_ON in vmemmap_remap_free() for now?
> > > >
> > > >         BUG_ON(reuse != start + PAGE_SIZE);
> > >
> > > I do not think we have to, plus we would be BUG_ing for some specific use
> > > case in "generic" function.
> >
> > The vmemmap_remap_range() walks page table range [start, end),
> > if reuse is equal to (start + PAGE_SIZE), the range can adjust to
> > [start - PAGE_SIZE, end). But if not, we need some work to
> > implement the "generic" function.
> >
> >   - adjust range to [min(start, reuse), end) and call
> >     vmemmap_remap_rangeand which skip the hole
> >     which is [reuse + PAGE_SIZE, start) or [end, reuse).
> >   - call vmemmap_remap_range(reuse, reuse + PAGE_SIZE)
> >     to get the reuse page.Then, call vmemmap_remap_range(start, end)
> >     again to remap.
> >
> > Which one do you prefer?
>
> I would not overcomplicate things at this stage.
> Just follow my sugestion and add a BUG_ON as you said, that might be the
> easier way now.
> We can overthink this in the future when some other usecases come
> around, right?

You are right. Will do this. Thanks for your suggestions.

>
> Thanks
>
>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
