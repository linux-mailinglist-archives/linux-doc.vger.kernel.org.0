Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFB86762745
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jul 2023 01:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjGYXZ7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Jul 2023 19:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjGYXZ7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Jul 2023 19:25:59 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A5E19AD
        for <linux-doc@vger.kernel.org>; Tue, 25 Jul 2023 16:25:57 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b9ed206018so41535ad.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Jul 2023 16:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690327557; x=1690932357;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XUAymOqyJF+KJzhkhKRHjkAaSaauZTSc0FF9IG/sL8s=;
        b=K/zocu5kXUyK0/jI3vAvSSXNAJ68vZAWBxXmVZ2imIvEsi7Fx8cNGPhTKJBVNOQsX8
         ma9NJSi0ZrEZvF0QVbb4UIDpZkW5pNU+rFWNr6Bh2kyJOZ6UJAV3MKm8wcBBdYPLUTMy
         yP9hRlwTYRBW1/WwDkjU/ZbOaXUCJEMm/Ph6C+SU71Py5ANKvVSnT9otHCbQGvdCGW11
         mjw4K6e0DWr1yCUtqbg97DsKQaI3JFD8WvxKI+gvu3TmjjpqfMVxMmDlsBa3ZvbFTL6D
         1uORd5FDtYbAmNw1hMAK4lO3WW9TVrDa5yF08G7o/Sbal6jTBu2knXTksXpMMYHw6y+d
         IJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690327557; x=1690932357;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUAymOqyJF+KJzhkhKRHjkAaSaauZTSc0FF9IG/sL8s=;
        b=arWW3NppIzOmhZpT7sEM+NDytdOetIoKpNhgZ40lxYmfWi/Xr0QWmm9T5qjEBouhYs
         4ZlExDdwQG3bDL5DFL+cMKMxejQ5SVknmj/I8w2q3YgqNK0v8W+b3WpEJ9r0uN69GVkV
         LHsmeRtzT0u8prsu0lAGM6XSl7GAc0QbZzk8YjPrMoFNS/hskhLKCHScXyUyCAAii0Js
         PHgeHR6NdRKOGdYb44EGZV/OPYrDL4SaZmMH/iWtHBJVpLXfgOjxGL75ScQiZESwIuSz
         1n2rkfBRKUIuaFXuMvYebV4Hqp4gUff63qmKBGgH09x6SvPDQFDmWyGriZNQcNOPoj6+
         CKOg==
X-Gm-Message-State: ABy/qLahSTrBYNY6Hyek71iyO+PHfTLuqPDyGn8bkwPkXwe+zBAFY+B+
        5OH049KnEpbQWtMgDTJEB5WotQ==
X-Google-Smtp-Source: APBJJlFq1uMDAKy4VsXXWIgKNW3YHd+x947A6mDx0IlNuq/VCClpH++XD+l+geMp8QQyqsWsJ2FRHQ==
X-Received: by 2002:a17:902:d48c:b0:1bb:9675:8c1a with SMTP id c12-20020a170902d48c00b001bb96758c1amr300090plg.24.1690327556899;
        Tue, 25 Jul 2023 16:25:56 -0700 (PDT)
Received: from [2620:0:1008:15:ecb7:d63b:6ebb:ac11] ([2620:0:1008:15:ecb7:d63b:6ebb:ac11])
        by smtp.gmail.com with ESMTPSA id w13-20020aa7858d000000b00686236718d8sm10117911pfn.41.2023.07.25.16.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 16:25:56 -0700 (PDT)
Date:   Tue, 25 Jul 2023 16:25:55 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
To:     Julian Pidancet <julian.pidancet@oracle.com>
cc:     Christoph Lameter <cl@linux.com>,
        "Lameter, Christopher" <cl@os.amperecomputing.com>,
        Pekka Enberg <penberg@kernel.org>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Rafael Aquini <aquini@redhat.com>
Subject: Re: [PATCH v2] mm/slub: disable slab merging in the default
 configuration
In-Reply-To: <CU5AB77A9U99.1G4IRUW6DZPJP@imme>
Message-ID: <b9e451a6-087d-4fb6-521b-bb8962da1f5c@google.com>
References: <20230629221910.359711-1-julian.pidancet@oracle.com> <38083ed2-333b-e245-44e4-2f355e4f9249@google.com> <CTSGWINSM18Q.3HQ1DN27GNA1R@imme> <8813897d-4a52-37a0-fe44-a9157716be9b@google.com> <17349901-df3a-494e-fa71-2584d92526b5@google.com>
 <3bcfa538-4474-09b7-1812-b4260b09256a@google.com> <7b6b07b3-d8a1-b24f-1df2-bf6080bc5516@google.com> <CU5AB77A9U99.1G4IRUW6DZPJP@imme>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 18 Jul 2023, Julian Pidancet wrote:

> Hi David,
> 
> Many thanks for running all these tests. The amount of attention you've
> given this change is simply amazing. I wish I could have been able to
> assist you by doing more tests, but I've been lacking the necessary
> resources to do so.
> 
> I'm as surprised as you are regarding the skylake regression. 20% is
> quite a large number, but perhaps it's less worrying than it looks given
> that benchmarks are usually very different from real-world workloads?
> 

I'm not an expert on context_switch1_per_thread_ops so I can't infere 
which workloads would be most affected by such a regression other than to 
point out that -18% is quite substantial.

I'm still hoping to run some benchmarks with 64KB page sizes as Christoph 
suggested, I should be able to do this with arm64.

It's ceratinly good news that the overall memory footprint doesn't change 
much with this change.

> As Kees Cook was suggesting in his own reply, have you given a thought
> about including this change in -next and see if there are regressions
> showing up in CI performance tests results?
> 

I assume that anything we can run with CI performance tests can also be 
run without merging into -next?

The performance degradation is substantial for a microbenchmark, I'd like 
to complete the picture on other benchmarks and do a complete analysis 
with 64KB page sizes since I think the concern Christoph mentions could be 
quite real.  We just don't have the data yet to make an informed 
assessment of it.  Certainly would welcome any help that others would like 
to provide for running benchmarks with this change as well :P

Once we have a complete picture, we might also want to discuss what we are 
hoping to achieve with such a change.  I was very supportive of it prior 
to the -18% benchmark result.  But if most users are simply using whatever 
their distro defaults to and other users may already be opting into this 
either by the kernel command line or .config, it's hard to determine 
exactly the set of users that would be affected by this change.  Suddenly 
causing a -18% regression overnight for this would be surprising for them.
