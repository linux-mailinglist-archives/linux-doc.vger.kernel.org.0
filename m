Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70D4C4ED1F4
	for <lists+linux-doc@lfdr.de>; Thu, 31 Mar 2022 04:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbiCaC57 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 30 Mar 2022 22:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbiCaC5w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Mar 2022 22:57:52 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D318B1207F6
        for <linux-doc@vger.kernel.org>; Wed, 30 Mar 2022 19:55:59 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id v35so40026250ybi.10
        for <linux-doc@vger.kernel.org>; Wed, 30 Mar 2022 19:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LDGcIKDDCWfntxIrDwg9NeEeCU9Lt3ZtVZJtgLcXbjo=;
        b=ehvnGf0k3aAoq9MC2JYKyRY0i4dKaTVRiQuSZTvJKKIQkMCypskYgzN4Xm/JZ52RC/
         vK4R4fZ/MtrdkHepjo7BcnI12BnCd+kS2eiqIJB2uoKfcoKGfxcSryGLZzFQXRB/SSqA
         WxQDRxBwkq47q9kYArRurS3/a/bs9pEhxJ4HWxa/v1mvrJrPsrZgUm21pX5NOE+NCmYP
         NTDa4hYvbaVQvfUj7MoHdxT+X99VAM/tHihgKAzlBkVVtDaqc9MOOPAHACpZtT83gCk9
         cRehK8HZzQ+ywONbDwHF9mFr7g1MEi3Q4cFY7IJOnk+VwX8lXE1NdbVVHaR6WIZUAUdT
         nC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LDGcIKDDCWfntxIrDwg9NeEeCU9Lt3ZtVZJtgLcXbjo=;
        b=IhhD5cfmPCKOEPgpkmv0guTIjx0f6XSrvaRuVczjBkvIpx0r/WSXbSFF3RbS8M6AWx
         oA1oGzq/GANdpbRTMR5BY9gxrgIIFi0gkRur3BbJJjOf2RqPy5MslkKwE6NR4js+e7Fb
         2mHe8q8MFw3rS7eDT+V3nuY1zw5DPpKzBX2Q15BDC5QxIu7+g/k/ldYIMkf9fX2mIdI2
         dQSZIq4Y8kjy+JoULvSo2WMpXGE5b/7+b3qNrJeyUOV44VX8axIGqbVT12+EuWB1RvIH
         oG/LMj2QR1Ya64njYBYeanBe+G5x7jDUyRif4AlDr5Ujg/kf4narOajqDNMyeqC7PUor
         17Rg==
X-Gm-Message-State: AOAM532FLOc8wqYvb4CNAQ3g+sEC4FuhKz/ct5Yg/poZknqi/qGPQTh8
        LaSPb6kFErYafEclWDQfkXVbug4oDrqbAhmG8VUqSg==
X-Google-Smtp-Source: ABdhPJxAoUYq0gy2PYb5dAIdtttQkFTZaQDjRFIKDP9yxDhDCV22s3LsslKjxvT4uh0wdtnGs1uY4ySHCJU1/VDmZh8=
X-Received: by 2002:a25:e70e:0:b0:634:1a47:4ff2 with SMTP id
 e14-20020a25e70e000000b006341a474ff2mr2484276ybh.89.1648695213764; Wed, 30
 Mar 2022 19:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220330153745.20465-1-songmuchun@bytedance.com>
 <20220330153745.20465-2-songmuchun@bytedance.com> <20220330192827.4b95e3d7fb149ef9cc687ccb@linux-foundation.org>
In-Reply-To: <20220330192827.4b95e3d7fb149ef9cc687ccb@linux-foundation.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 31 Mar 2022 10:52:58 +0800
Message-ID: <CAMZfGtXsMZ7ZwAzV5yZ39TB-=Q7Lw8oyjq2m65SXqHGwHQfj9w@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] mm: hugetlb_vmemmap: introduce STRUCT_PAGE_SIZE_IS_POWER_OF_2
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Oscar Salvador <osalvador@suse.de>,
        David Hildenbrand <david@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        Muchun Song <smuchun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 31, 2022 at 10:28 AM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Wed, 30 Mar 2022 23:37:42 +0800 Muchun Song <songmuchun@bytedance.com> wrote:
>
> > If the size of "struct page" is not the power of two and this
> > feature is enabled,
>
> What is "this feature"?   Let's spell it out?

Will do.

>
> > then the vmemmap pages of HugeTLB will be
> > corrupted after remapping (panic is about to happen in theory).
> > But this only exists when !CONFIG_MEMCG && !CONFIG_SLUB on
> > x86_64.  However, it is not a conventional configuration nowadays.
> > So it is not a real word issue, just the result of a code review.
> > But we have to prevent anyone from configuring that combined
> > configuration.  In order to avoid many checks like "is_power_of_2
> > (sizeof(struct page))" through mm/hugetlb_vmemmap.c.  Introduce
> > STRUCT_PAGE_SIZE_IS_POWER_OF_2 to detect if the size of struct
> > page is power of 2 and make this feature depends on this new
> > macro.  Then we could prevent anyone do any unexpected
> > configuration.
> >
> > ...
> >
> > --- /dev/null
> > +++ b/mm/struct_page_size.c
> > @@ -0,0 +1,20 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Generate definitions needed by the preprocessor.
> > + * This code generates raw asm output which is post-processed
> > + * to extract and format the required data.
> > + */
> > +
> > +#define __GENERATING_STRUCT_PAGE_SIZE_IS_POWER_OF_2_H
> > +/* Include headers that define the enum constants of interest */
> > +#include <linux/mm_types.h>
> > +#include <linux/kbuild.h>
> > +#include <linux/log2.h>
> > +
> > +int main(void)
> > +{
> > +     if (is_power_of_2(sizeof(struct page)))
> > +             DEFINE(STRUCT_PAGE_SIZE_IS_POWER_OF_2, is_power_of_2(sizeof(struct page)));
>
> Why not
>
>         DEFINE(STRUCT_PAGE_SIZE_IS_POWER_OF_2, 1);
>

Yep, this is more simple.  But the 2nd parameter of DEFINE() will
go into the comments.  I want to make it more clear when someone
reads the code of this macro.  The two different sentences will
generate the following two different comments.  Which one do
you think is better?

#define STRUCT_PAGE_SIZE_IS_POWER_OF_2 1 /*
is_power_of_2(sizeof(struct page)) */
#define STRUCT_PAGE_SIZE_IS_POWER_OF_2 1 /* 1 */

Thanks.
