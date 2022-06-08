Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF1F654381D
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jun 2022 17:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbiFHPwN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Jun 2022 11:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244483AbiFHPwM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 11:52:12 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42FBD1FE4EC
        for <linux-doc@vger.kernel.org>; Wed,  8 Jun 2022 08:52:11 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id gl15so28450242ejb.4
        for <linux-doc@vger.kernel.org>; Wed, 08 Jun 2022 08:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZWg+EByLX2ZJm6vETAdONT4qynX6hRsnoJ5CqHfmhnw=;
        b=RIC59qPhiDzIZcT8mYyjAWaAQYTLQ7GhRgZF/6BRjG+QgO5oJlG53QfqIVGPQr43sM
         mFzgNuQm3ojwsX+1IRo9briF7hE+utjRHjinwFhHpgE88u2jNmmweoRbMO1shu19pMzO
         26zbeFKBWGXTcj7YREyPZa6Ia1w4WYPW6e3E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZWg+EByLX2ZJm6vETAdONT4qynX6hRsnoJ5CqHfmhnw=;
        b=QRcyEkso62TOOU3pxyXwBD2HAC+MJIbmnCQpogb96kN6H4nhI9Zbb0LCPXyzD8TORb
         fomgmTGPsygFjkfc+2w7198WBV2hQoa9cQfc8eUoc6d+RuTVJ9GNxiLu1PZ2RW4RQqf4
         3LAOGBjCxNy4PNXMmJIJYAlQl5DxEPFI66q9mSWCUpVTF4Xhh/fosBMOebbmbkB2pp2y
         D8STNEv1LyoZUGflNGNapWi8tLZ2oq0g/ilBpONWrPgKvLUunKvbB8KLAB0XV//vUVbx
         lz1BOo2ZfalTo0Qipii0hGQ/g1fLsktItSp6l/C/TUGSlkIolIcvaIZwUKc/9WxIzcaA
         c8sQ==
X-Gm-Message-State: AOAM530ig2HKgLppd6uj/+WJxSoNCbeLCkfoE7uR3rVkcGhtr/vgn9tW
        KqaFw1LqzwMx6pCzhLZrdsKrBtmOUP64i+39egU=
X-Google-Smtp-Source: ABdhPJwQh8njSkiI0iE1bUYBRA9U3hfbDFPup94YDH9QfBglDnXy3qIdHcv72zs85KGjTaXiTNR5KA==
X-Received: by 2002:a17:906:9d01:b0:711:dc5d:c8a5 with SMTP id fn1-20020a1709069d0100b00711dc5dc8a5mr10196327ejc.432.1654703529410;
        Wed, 08 Jun 2022 08:52:09 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id ee36-20020a056402292400b0042bca34bd15sm12453561edb.95.2022.06.08.08.52.08
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 08:52:08 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id e5so4293217wma.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jun 2022 08:52:08 -0700 (PDT)
X-Received: by 2002:a05:600c:4982:b0:39c:3c0d:437c with SMTP id
 h2-20020a05600c498200b0039c3c0d437cmr30759229wmp.38.1654703516902; Wed, 08
 Jun 2022 08:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220518014632.922072-1-yuzhao@google.com> <20220518014632.922072-8-yuzhao@google.com>
 <CAGsJ_4yboZEY9OfyujPxBa_AEuGM3OAq5y_L9gvzSMUv70BxeQ@mail.gmail.com>
 <CAGsJ_4w3S_8Kaw2GyB3hg7b4N_D+6yBO7D6qmgxD9Fqz3_dhAg@mail.gmail.com>
 <20220607102135.GA32448@willie-the-truck> <CAGsJ_4zGEdHDv0ObZ-5y8sFKLO7Y6ZjTsZFs0KvdLwA_-iGJ5A@mail.gmail.com>
 <20220607104358.GA32583@willie-the-truck> <CAOUHufZh46A2hh_fn-8vVBDi_621rgbZq64_afDt8VxrzqJz1g@mail.gmail.com>
 <CAGsJ_4yvsXCj8snemAyX3jPJgWJR+tFCtUhV-3QJ75RNi=q_KA@mail.gmail.com>
In-Reply-To: <CAGsJ_4yvsXCj8snemAyX3jPJgWJR+tFCtUhV-3QJ75RNi=q_KA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 8 Jun 2022 08:51:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wirMfOpzNavjWao5GA65ve=9LQN-6=YCUtJGRpu=ujdoA@mail.gmail.com>
Message-ID: <CAHk-=wirMfOpzNavjWao5GA65ve=9LQN-6=YCUtJGRpu=ujdoA@mail.gmail.com>
Subject: Re: [PATCH v11 07/14] mm: multi-gen LRU: exploit locality in rmap
To:     Barry Song <21cnbao@gmail.com>
Cc:     Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, x86 <x86@kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>, huzhanyuan@oppo.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 7, 2022 at 5:43 PM Barry Song <21cnbao@gmail.com> wrote:
>
> Given we used to have a flush for clear pte young in LRU, right now we are
> moving to nop in almost all cases for the flush unless the address becomes
> young exactly after look_around and before ptep_clear_flush_young_notify.
> It means we are actually dropping flush. So the question is,  were we
> overcautious? we actually don't need the flush at all even without mglru?

We stopped flushing the TLB on A bit clears on x86 back in 2014.

See commit b13b1d2d8692 ("x86/mm: In the PTE swapout page reclaim case
clear the accessed bit instead of flushing the TLB").

               Linus
