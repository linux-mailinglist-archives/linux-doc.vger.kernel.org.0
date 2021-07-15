Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E6F3C9B4F
	for <lists+linux-doc@lfdr.de>; Thu, 15 Jul 2021 11:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235914AbhGOJXK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 15 Jul 2021 05:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhGOJXK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Jul 2021 05:23:10 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7EBC06175F
        for <linux-doc@vger.kernel.org>; Thu, 15 Jul 2021 02:20:16 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id l11so3407799pji.5
        for <linux-doc@vger.kernel.org>; Thu, 15 Jul 2021 02:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6pAhtSqRq3EZDsI0szqPR/lESeA+rPyUtVd7J89gp40=;
        b=rLsmkhldrp4yl3Wj1JRXZbOHe3pAbHtpqrRAlluoOR/eDaY0YRxccgzCKFvyXLr20f
         ljivsy3JYKVoLfKg7n6+29ruUL/gIBr5Jwgbv3XtTLTOmb2XF30tGCIKOmtMCabjzA6R
         NyI2gAUkaEBgCSUbRMY5xZI7zlvQxJA2S0/z20/tJZIWYZGZzwxGsYEs36/hHpn+DS0k
         3O/1hZ0aKIFjPlLIUmOx+9rE7YgV7lAk+aQtNyJiqnxZNzDRnEKA4rDxOUAZVVh6ADzS
         mrsdr4dSSszl+wGv/SKWdCi+ZPHpxW2IwE+wht66O1Ab/GIC7d2gTSDzqDlBCzcz3S9F
         K/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6pAhtSqRq3EZDsI0szqPR/lESeA+rPyUtVd7J89gp40=;
        b=CgLAysH64Qj4MYytNOZ7IjHr5WL01ajCpncv3AY9t3PPazpEMnQhA9D3plHFR6FXyS
         jWVhOAbuYVjAoLpwIXTIz7Qp8ytCO/oS48f9T2aFznDSYC1Wlp968+kTlAi1D2zpPFwl
         BkrcDvDQqXUZtKsKjr0VJ3ueRNCvclxOuSm5o7olZI0v75Oe1m5/+3LcqwEc6plegV4v
         dc1j+StLmKRZgwkFeLOSdUtQ7jHxocJ6pPjUCFkc4Vf2j3cL4PKFIx9M1oXMMAUXMKkY
         ldgyergAqzDPh9Ut32t1K3fUaPlyvERQdyCp3NARpTuLneY2mM9W7Y8ftuSVOaI5eSUZ
         Faww==
X-Gm-Message-State: AOAM530tMR55CTwZnqWi3P+nA/vFGopYlBXM5PNonkaQELn6gugfljMh
        G10Byg1tCSbv71+ehyjSAy9TfcuHxRLsoWruadrALQ==
X-Google-Smtp-Source: ABdhPJyoq+CplDAt0++yDKPq5zlRJd7A1inSxCzrPDNc8oARKST5bwqgbLq2thZt2IBorCVGJoXBVKWrQHQ8DpqlmAo=
X-Received: by 2002:a17:90a:9b13:: with SMTP id f19mr3270778pjp.229.1626340815734;
 Thu, 15 Jul 2021 02:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com>
 <20210714193542.21857-2-joao.m.martins@oracle.com> <CAMZfGtWhx71w0b4FM_t2LCK-q1+ePv6YQtQat+9FozLPnN4x3Q@mail.gmail.com>
 <YO/YcBTzKTzzNUfK@infradead.org>
In-Reply-To: <YO/YcBTzKTzzNUfK@infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 15 Jul 2021 17:19:39 +0800
Message-ID: <CAMZfGtWe1Wc_TZksDAdLmwsAZ2vv9CP0QBr4ABYt+KyqbTbNzw@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] memory-failure: fetch compound_head after pgmap_pfn_valid()
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Joao Martins <joao.m.martins@oracle.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 15, 2021 at 2:42 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> Can you please fix up your mailer to not mess with the subject?
> That makes the thread completely unreadable.

Sorry. I didn't realize it before. Thanks for your reminder.
