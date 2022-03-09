Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F224D2590
	for <lists+linux-doc@lfdr.de>; Wed,  9 Mar 2022 02:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiCIBOG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Mar 2022 20:14:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231435AbiCIBNW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 20:13:22 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9404D141E38
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 16:56:44 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id bi12so1611874ejb.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 16:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dlXc7nO4VVenbG9TQJ/z1TWtkG9nDmF64Ost29V8AWc=;
        b=fk9Kkf3UiaboVe5n2sPqRmsu9R/9pSJ0MBG82T7odsoD9Z+4tUrGity1EBUSVcd5bO
         Ay+GVgtTlqOjk5DG157lanciRnAlDA9OLu41FZ3ehebtgoQkdRl4IX3y8PNM/lSEI5AP
         dZRPNM6mHBzmKNa87ZpX/gBVrjQgnOz7vbrW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dlXc7nO4VVenbG9TQJ/z1TWtkG9nDmF64Ost29V8AWc=;
        b=3wp+oos4IfaC8Y8UTac43SJHY2ZB03XmNwDsItenoWEmWfgxgwU/Kf8XA+HV+IOIWt
         Tq+yzNGHHcFVtrpPlDYIXPMn7+/N3kUrzL8B5ks799wWJuzNH9OYDSIPeiHQYUHNKxpV
         DYRw5E9X7Ol5pTIPZOvzk9ivBqeiTD1Su3091MacC8uh3q4ssyFC+SyF8IK7a1PTAPyi
         v/jZa9z35p3vKFmKhn/rHuahs609KpBO3cCmp4fGqcKE78MMPUHP/OPQnlVGDGm3UqIL
         WWNpFdh4qIi89msQ4SkDaASihaGqqbutVT8VBwzTooePkaVvg1qJLldJr98FraaDW+M2
         OAog==
X-Gm-Message-State: AOAM533siQB7XDo83GcIgaqYyZepmhk+5l5desQDXPdTYyUJMrZs6t++
        tyZvocScqc92XlVF2w8Su6NjZNNhnVW8/sKpXzU=
X-Google-Smtp-Source: ABdhPJxiDFW0uvmX5HQ3sZnHJjXv8FXEtIky8PxYck5f9b9anFofUPHY6AwsRoZ/fq1EcT8Z/2blyQ==
X-Received: by 2002:a17:907:6d9f:b0:6db:62b6:f3d6 with SMTP id sb31-20020a1709076d9f00b006db62b6f3d6mr1669581ejc.366.1646785800973;
        Tue, 08 Mar 2022 16:30:00 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id y13-20020a1709060a8d00b006dabeaf86c7sm102105ejf.137.2022.03.08.16.30.00
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 16:30:00 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id bi12so1516066ejb.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 16:30:00 -0800 (PST)
X-Received: by 2002:ac2:44a4:0:b0:445:8fc5:a12a with SMTP id
 c4-20020ac244a4000000b004458fc5a12amr12499712lfm.27.1646785789558; Tue, 08
 Mar 2022 16:29:49 -0800 (PST)
MIME-Version: 1.0
References: <20220308234723.3834941-1-yuzhao@google.com> <CAHk-=wi5wg=72exwHODJdVtAfqa1e85dGfjGftuhHQ5Z4v-DNA@mail.gmail.com>
 <CAOUHufYFDawK6vmkQ16EQm7FSHresViifnxW2yj_RDuMSjJPjg@mail.gmail.com>
In-Reply-To: <CAOUHufYFDawK6vmkQ16EQm7FSHresViifnxW2yj_RDuMSjJPjg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 8 Mar 2022 16:29:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgwgqJMyxbrxa-mY3cYh--BZ5JKDieVc=RfXR1mdqsYkQ@mail.gmail.com>
Message-ID: <CAHk-=wgwgqJMyxbrxa-mY3cYh--BZ5JKDieVc=RfXR1mdqsYkQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] Multi-Gen LRU Framework
To:     Yu Zhao <yuzhao@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        "the arch/x86 maintainers" <x86@kernel.org>
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

On Tue, Mar 8, 2022 at 4:15 PM Yu Zhao <yuzhao@google.com> wrote:
>
> This sounds self-serving: our data centers want them, so I had to try.

Heh. I'm not opposed to putting them back in, but if/when we merge the
multi-gen LRU code, I really want people to be all testing the same
thing.

I also think that if we put them back in, that should come with

 (a) performance numbers for the different cases

 (b) hard guidance of what the numbers should be, and under what
circumstances (ie giving the user enough information that he *can*
answer the question for his configuration)

 (c) some thought about perhaps making them possibly more dynamic than
a hardcoded build-time value (assuming the numbers show that it's
worth doing in the first place, of course)

so I think that the support for the concept can/should be left in, but
I think that kind of fancy "I want more generations or fewer
tiers-per-generation because of XYZ" needs to be a separate issue with
more explanation from the initial "This multi-gen LRU gives better
performance" merge.

Because as-is, I don't think those config options had nearly enough
information associated with them to merit them existing.

                  Linus
