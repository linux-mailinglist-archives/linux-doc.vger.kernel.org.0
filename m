Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0F73D2FFB
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jul 2021 00:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbhGVWPb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 22 Jul 2021 18:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbhGVWPb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jul 2021 18:15:31 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7840FC061757
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 15:56:04 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l11-20020a7bc34b0000b029021f84fcaf75so2459710wmj.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 15:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IA1VbfCE0XhvLNla6VhKBZi1IOWHetcg7Adztz386vQ=;
        b=tDQZihy5zIWb38ficSC58M4Lv2GJc/Chu8kZMuPp+SIGEeS7WY4a3H9lDctfzdbv0I
         DvnLxNxUhbBKQwJSQ+InAfvZtF5mWCQM1VuzOWAFevhdYqEEruucp/Jugpx23+HSfkdW
         pN/AuljpBwVjsdDrI1+ufPl5bzLN82cVyTjbkK27gkxtVlpFP7Eh35o3C1DcMotWoEVV
         /rZMVCsZxx3XbSkYOEdHlJqYjMl/iNKNHEBqgOWSqsPqdJ29B3eHuiAyk0fylyRAFOaa
         J6x1hfnAtllmgKeR+9JKvZh3yLYN2E6JhBlsqqGEuQhWDXaBzykqjfDJ6DTn5w318m5u
         MKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IA1VbfCE0XhvLNla6VhKBZi1IOWHetcg7Adztz386vQ=;
        b=uncUPxQzn8kBJq7tCe8TzRnlhh9aurCyV3wunWsbpH4/ZhFrQsDx5syBOgM1lIt++a
         g6jeibT0QNs17LACiZ970aiYvY5yMF37/QYyYqksaZNeItuqEUwmshLQJqsPvR6bci+k
         vE3DmQ0+e+Q+T9yRe0jvvDMyewwKGX3fPJzzEHSQrjfn7xqFWrcoBaJHim+gMrq8iV1+
         Vhx2EClox8k9hCEC8S64xinXl0Jo+TFNBULMFqoJ2N1rN/pjiby9h7lVDS25JyVYkYyL
         hEcVHOjzcCKrjHvJZ25gKmnjLDYCzIuu/MN6AGHg+Ip87eNeMnwVIpinX4o47rCOtsWC
         kkCQ==
X-Gm-Message-State: AOAM531CsU9gAs+rOhCcACNBVivVj2G8s1iPVVP4ERSVr6z6uVOqWUII
        fkBHg/gd0qcTFAaDdLsa2fecff5ljsYcRkI=
X-Google-Smtp-Source: ABdhPJy/btBS+ckSaWVgeDzTRKZZIrQZaP0axVhrjkHwwUrxODcWWr77Z9TCISNFbdreFF20YV+YzA==
X-Received: by 2002:a1c:7f54:: with SMTP id a81mr6144382wmd.107.1626994562893;
        Thu, 22 Jul 2021 15:56:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:7bb:435c:1528:220e])
        by smtp.gmail.com with ESMTPSA id n18sm29939899wrt.89.2021.07.22.15.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 15:56:02 -0700 (PDT)
Date:   Thu, 22 Jul 2021 23:55:58 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Finn Behrens <finn@kloenk.dev>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/17] Rust support
Message-ID: <YPn3fgDX8uNkF8Vp@google.com>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <YOVNJuA0ojmeLvKa@infradead.org>
 <CANiq72mKPFtB4CtHcc94a_y1V4bEOXXN2CwttQFvyzwXJv62kw@mail.gmail.com>
 <YOWjLmg/Z7kr2+tx@kroah.com>
 <YOW1Nj8+a2Yth2++@google.com>
 <YOXB7FRqldZik2Xn@kroah.com>
 <BFD5298D-00CD-4FEF-AE77-61E69AF78604@kloenk.dev>
 <YOZNuEtNbsLxRM0R@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOZNuEtNbsLxRM0R@casper.infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hey Matthew,

On Thu, Jul 08, 2021 at 01:58:32AM +0100, Matthew Wilcox wrote:
> Why are you so resistant to writing a real driver that deals with actual
> hardware?  

I don't think it was so much resistance but rather a prioritisation thing. Have
you by any chance seen the gpio driver I posted a couple of days ago?

> A simple NVMe driver is less than a thousand lines of C.
> I know the one in the kernel now is ridiculously complicated and has
> been thoroughly messed up with abstractions to support NVMeoF instead
> of having a separate driver, but it's really a simple interface at heart.

The latest NVMe spec is 452 pages long, which seems to contradict your claim
that it's simple. In any case, translating less than 1K lines of C shouldn't be
too hard (after I've built the abstractions, of course). Would you mind sharing
the simple driver you mention above?

Thanks,
-Wedson
