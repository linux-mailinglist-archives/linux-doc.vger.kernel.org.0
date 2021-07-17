Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0ED3CC0CA
	for <lists+linux-doc@lfdr.de>; Sat, 17 Jul 2021 04:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhGQDBq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Jul 2021 23:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232674AbhGQDBp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jul 2021 23:01:45 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABE6C06175F
        for <linux-doc@vger.kernel.org>; Fri, 16 Jul 2021 19:58:49 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id d9so12899508ioo.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Jul 2021 19:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q+JKIv6hqPelr3xZyX4AN/xjnr9/KSPz21ndUrNdfWk=;
        b=gZB3XFs4YctFWRQcr3AIXjtExL95BV7PdCJGicm2Gr6SgUuXoZQWDPEzcXJDzhcENt
         BRFsO0Z9jJ7EOrIHBxA3wrRXn6ggBhqRvnQ0CVxDuWIGyGXzW534e581qFbDd2mo6kMM
         PoZF73m02ZKgaYSYk71151mbUwxR1WPCjP0ZdcPmsbYa2dMwBOkKy7mybG3Zu6/lRktW
         miAiWCRQyiAQQDhBvtGD1LWToxcC11v0WWvGN9fS7iS3mkJpXxpEC/wc7NouIJ4ZC/pz
         o+gCE4YveOiuhTwWz3WLFJC8KMbZasTHafFrYjNKaXknstxN+axL4ofpbNY8p2dfvUP0
         sVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q+JKIv6hqPelr3xZyX4AN/xjnr9/KSPz21ndUrNdfWk=;
        b=rbMzZZsRagvM8YuNs+0gaK1ZW0981vdOEBziQckyQGQaxPuqG5Uj1vfBRGgeb2+Ro3
         LIEmgDhKXeCFd0dwB2ote1ei/GmjoBpa3pIt1kWqjGuaBzzN9tjcLB4AfjofVdhBwD/E
         hdmevJ34OS0lIqLHvebYoKEsBY5rlb16HmmBA54m3sTrUyRKIm4BZBbCk79ZPbJ5nb5d
         AIhVpWkVEhluJ65MdFNZ/45baCQviFBtBgkSTMq93zC7HM/u9jwheNpw1f4uxIYdSJ/G
         H7FSiPX0rzYzjjoruwkrv526ttn8bvXDVFPmmopCUUQkQCBEfMpBi90gw/DNhHoh73li
         cX9g==
X-Gm-Message-State: AOAM531sCfGuFeC2mz63lMQm19xlDNJAm4fcC4+3UBo97FGc+dTpUmis
        Ab0KbbKTEdK5kR9wIkGqLttjOJoWK/NQEF+N530f/w==
X-Google-Smtp-Source: ABdhPJxDKnBkegYHanD7zJwcvdIx+ZQrUXzneHtsWj+SRasMpccY2hK3i9cO2t/21SQnvSisrpoUY8PjATBolBy1zmE=
X-Received: by 2002:a5d:8888:: with SMTP id d8mr9778897ioo.170.1626490728818;
 Fri, 16 Jul 2021 19:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210619092002.1791322-1-pcc@google.com> <YNnKSkcAM05tmPta@casper.infradead.org>
In-Reply-To: <YNnKSkcAM05tmPta@casper.infradead.org>
From:   Peter Collingbourne <pcc@google.com>
Date:   Fri, 16 Jul 2021 19:58:37 -0700
Message-ID: <CAMn1gO5GiMwanh2pHk7-BNo0UoSbyxkjAjjdK6URMESR6MCY=Q@mail.gmail.com>
Subject: Re: [PATCH v4] mm: introduce reference pages
To:     Matthew Wilcox <willy@infradead.org>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Jann Horn <jannh@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        kernel test robot <lkp@intel.com>,
        Linux API <linux-api@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 28, 2021 at 6:11 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Sat, Jun 19, 2021 at 02:20:02AM -0700, Peter Collingbourne wrote:
> > +++ b/include/linux/mm.h
> > @@ -32,6 +32,7 @@
> >  #include <linux/sched.h>
> >  #include <linux/pgtable.h>
> >  #include <linux/kasan.h>
> > +#include <linux/fs.h>
>
> No.

This was because is_refpage_vma needed to access vm_file->f_op to
check whether the mapping is a reference page. In v5 I've moved that
part of the check into mm/refpage.c.

> > +++ b/include/linux/mman.h
> > @@ -2,6 +2,7 @@
> >  #ifndef _LINUX_MMAN_H
> >  #define _LINUX_MMAN_H
> >
> > +#include <linux/fs.h>
>
> No.

Okay, this one was entirely unused; removed.

Peter
