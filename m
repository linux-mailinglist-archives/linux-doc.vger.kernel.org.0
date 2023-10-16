Return-Path: <linux-doc+bounces-313-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A453E7C9DFA
	for <lists+linux-doc@lfdr.de>; Mon, 16 Oct 2023 05:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9452B20BE7
	for <lists+linux-doc@lfdr.de>; Mon, 16 Oct 2023 03:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A1D5C98;
	Mon, 16 Oct 2023 03:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kDsZb28I"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE821FA9
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 03:40:36 +0000 (UTC)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B7DAD
	for <linux-doc@vger.kernel.org>; Sun, 15 Oct 2023 20:40:34 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7e5dc8573so50180247b3.0
        for <linux-doc@vger.kernel.org>; Sun, 15 Oct 2023 20:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1697427634; x=1698032434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI2/fjvxux9kOhr+MN6nR47zrqV+MlgEJ7nQc3CGiEU=;
        b=kDsZb28I2nOB/4Xu+ZiY7pJuoh2edxEOI3q40dYdKXUU6U3VUIeJeuxzXn1XT2hT5H
         0nKh+xYp1IaePQ1N0+kcSRrAJSg7S8Riy7EKlmGC8uvsgNbuvGx9DQQCp5kS48L7xnYX
         xkgC2vG30fZXnKmQ8Jz/25N7sPMYcl/ArgQUEULDGFt6eiPwEkb/1/ZF1ICLK3Zvk1AQ
         567lqwtOHPGae0ItFk8IKHW7zQjXIppsTcyoSfbG5oudcQ8N4l+AGewCZfeGTe7QQffw
         JDm/HB2ZCgp65U6d8jICQGnK+jXuoBx1NPhHUCaxQgodirv3tRGBLJTligNr95EqSp15
         k7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697427634; x=1698032434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BI2/fjvxux9kOhr+MN6nR47zrqV+MlgEJ7nQc3CGiEU=;
        b=HEWHBHPINRTHS3wHKFcaQRJI8GwBGk47lXAFo35hiCG22Kc0qVFIkktY+y+ZjjiobT
         QL5vWxzGwY1vWHYpt3cVWa3t4ugJQCOc+afCDyjtz/klysTtTssHNO5h5DqThQq7CYsr
         6zCtCCZkjeZ4/sTGBd95hdHqdKiay1UGXJ9L5QPYdJoxtqaO+jzDnPVL1H2wul41QGxV
         /Tvh8j8+X2Iuzqkc55C9zZP0SCv2cu6zaz6f/hHCTd4lH4FdffU3voyljuYyqUbwvReE
         k+pUQOZjYgzFznnenLhCuOsmHqS0GVfGkRawwQXL+Qai21amI8vuX24745QAiM/rBOiy
         yorQ==
X-Gm-Message-State: AOJu0YwSiADHXxyX7RNUvmQ5zzG2Dgr+Nnor6foOYREiUhmNBTlZEd+v
	1rWLrsLOyPdlFCgnijblWOrgfw==
X-Google-Smtp-Source: AGHT+IHros4bTzExUZqJrCKsN+Ddzh3apHzeOi8pHztUz/zBms1TVFaa5iq2H9se67ANKhFZ0rn2OA==
X-Received: by 2002:a0d:d64b:0:b0:5a8:60ad:39a4 with SMTP id y72-20020a0dd64b000000b005a860ad39a4mr3655444ywd.3.1697427633775;
        Sun, 15 Oct 2023 20:40:33 -0700 (PDT)
Received: from [10.255.187.14] ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id 66-20020a630045000000b005ab7b055573sm4753882pga.79.2023.10.15.20.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Oct 2023 20:40:33 -0700 (PDT)
Message-ID: <cc3b202b-d4ea-4912-b4c7-28ed8fc68072@bytedance.com>
Date: Mon, 16 Oct 2023 11:40:24 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] Introduce __mt_dup() to improve the performance
 of fork()
To: Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
 willy@infradead.org, brauner@kernel.org, surenb@google.com,
 michael.christie@oracle.com, mjguzik@gmail.com,
 mathieu.desnoyers@efficios.com, npiggin@gmail.com, peterz@infradead.org,
 oliver.sang@intel.com, mst@redhat.com
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Peng Zhang <zhangpeng.00@bytedance.com>
References: <20231016032226.59199-1-zhangpeng.00@bytedance.com>
From: Peng Zhang <zhangpeng.00@bytedance.com>
In-Reply-To: <20231016032226.59199-1-zhangpeng.00@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



在 2023/10/16 11:22, Peng Zhang 写道:
> Hi all,
> 
> This series introduces __mt_dup() to improve the performance of fork(). During
> the duplication process of mmap, all VMAs are traversed and inserted one by one
> into the new maple tree, causing the maple tree to be rebalanced multiple times.
> Balancing the maple tree is a costly operation. To duplicate VMAs more
> efficiently, mtree_dup() and __mt_dup() are introduced for the maple tree. They
> can efficiently duplicate a maple tree.
> 
> Here are some algorithmic details about {mtree,__mt}_dup(). We perform a DFS
> pre-order traversal of all nodes in the source maple tree. During this process,
> we fully copy the nodes from the source tree to the new tree. This involves
> memory allocation, and when encountering a new node, if it is a non-leaf node,
> all its child nodes are allocated at once.
> 
> Some previous discussions can be referred to as [1]. For a more detailed
> analysis of the algorithm, please refer to the logs for patch [3/10] and patch
> [10/10]
> 
> There is a "spawn" in byte-unixbench[2], which can be used to test the
> performance of fork(). I modified it slightly to make it work with
> different number of VMAs.
> 
> Below are the test results. The first row shows the number of VMAs.
> The second and third rows show the number of fork() calls per ten seconds,
> corresponding to next-20231006 and the this patchset, respectively. The
> test results were obtained with CPU binding to avoid scheduler load
> balancing that could cause unstable results. There are still some
> fluctuations in the test results, but at least they are better than the
> original performance.
> 
> 21     121   221    421    821    1621   3221   6421   12821  25621  51221
> 112100 76261 54227  34035  20195  11112  6017   3161   1606   802    393
> 114558 83067 65008  45824  28751  16072  8922   4747   2436   1233   599
> 2.19%  8.92% 19.88% 34.64% 42.37% 44.64% 48.28% 50.17% 51.68% 53.74% 52.42%
> 
> Thanks for Liam's review.
> 
> Changes since v4:
>   - Change the handling method for the failure of dup_mmap(). Handle it in
>     exit_mmap().
>   - Update check_forking() and bench_forking().
>   - Add the corresponding copyright statement.
> 
I apologize for forgetting to include all the links while editing the cover letter.
Here they are:
[1] https://lore.kernel.org/lkml/463899aa-6cbd-f08e-0aca-077b0e4e4475@bytedance.com/
[2] https://github.com/kdlucas/byte-unixbench/tree/master

v1: https://lore.kernel.org/lkml/20230726080916.17454-1-zhangpeng.00@bytedance.com/
v2: https://lore.kernel.org/lkml/20230830125654.21257-1-zhangpeng.00@bytedance.com/
v3: https://lore.kernel.org/lkml/20230925035617.84767-1-zhangpeng.00@bytedance.com/
v4: https://lore.kernel.org/lkml/20231009090320.64565-1-zhangpeng.00@bytedance.com/

> Peng Zhang (10):
>    maple_tree: Add mt_free_one() and mt_attr() helpers
>    maple_tree: Introduce {mtree,mas}_lock_nested()
>    maple_tree: Introduce interfaces __mt_dup() and mtree_dup()
>    radix tree test suite: Align kmem_cache_alloc_bulk() with kernel
>      behavior.
>    maple_tree: Add test for mtree_dup()
>    maple_tree: Update the documentation of maple tree
>    maple_tree: Skip other tests when BENCH is enabled
>    maple_tree: Update check_forking() and bench_forking()
>    maple_tree: Preserve the tree attributes when destroying maple tree
>    fork: Use __mt_dup() to duplicate maple tree in dup_mmap()
> 
>   Documentation/core-api/maple_tree.rst |   4 +
>   include/linux/maple_tree.h            |   7 +
>   kernel/fork.c                         |  39 ++-
>   lib/maple_tree.c                      | 304 ++++++++++++++++++++-
>   lib/test_maple_tree.c                 | 123 +++++----
>   mm/memory.c                           |   7 +-
>   mm/mmap.c                             |   9 +-
>   tools/include/linux/rwsem.h           |   4 +
>   tools/include/linux/spinlock.h        |   1 +
>   tools/testing/radix-tree/linux.c      |  45 +++-
>   tools/testing/radix-tree/maple.c      | 363 ++++++++++++++++++++++++++
>   11 files changed, 815 insertions(+), 91 deletions(-)
> 

