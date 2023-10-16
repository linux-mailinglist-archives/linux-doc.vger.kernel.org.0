Return-Path: <linux-doc+bounces-302-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A99617C9DB1
	for <lists+linux-doc@lfdr.de>; Mon, 16 Oct 2023 05:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCD9A1C208D1
	for <lists+linux-doc@lfdr.de>; Mon, 16 Oct 2023 03:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5379A1C04;
	Mon, 16 Oct 2023 03:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cb/Ld+RY"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E05D185C
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 03:22:47 +0000 (UTC)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54F7D9
	for <linux-doc@vger.kernel.org>; Sun, 15 Oct 2023 20:22:42 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-27d4b280e4eso1526845a91.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Oct 2023 20:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1697426562; x=1698031362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gczzW0LaNc0vEssMkLzS11PtF6rOzBiU0Uwpu4VNOxY=;
        b=cb/Ld+RYc/kfM0acwFfmBZDSGqIgmB9RRKUmfvpMbLV+bGLt/VBqBnUDrB3hvOaJRH
         9YfHz6zdU8+nkD2tV+cKNgDxVDO37zIpuhTerGagihbCgvkXMn4B6W7WCdV1pVcWlp5L
         /OWFxmm4jhNi4ATYTOgpjQUzKfrFDrveAqxc1PMuhDWzsoyUcgC4ReZoic+AAOL3bS9u
         3KfaU9XYeFrdqhfjYCdxdPoye5uW94FuIYpEkIP+6wRe8fF99k8ZQwM6yA4+PPUil++k
         ryxlJDu74W3/MRUfgVmoLlarh7g0OWEE7pqJD2ckBH4wKHHBVH4+n81t2Io6gi7W3y51
         +27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697426562; x=1698031362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gczzW0LaNc0vEssMkLzS11PtF6rOzBiU0Uwpu4VNOxY=;
        b=T+qJswfq54CoDNRLucrOhdyIVF75vDyJYCmQ/Bk80N3z/AAgCiH96kSbAZyeUBlAJA
         JnSAoxNmVfuJpzuwvhkxilXSAeNW/X9Di39wyFArnkXf1OclFTgngwFU8voIIntiksyj
         NsQDjXEstcp4CcPix3eF2Wted5t9aWMq6f/hMbB95jXT7QDqVzJS7hnFezjm9EvDzgGc
         jFr0h8UNs1uLHvH4dHLFvTSeYBoKS7E+XT0N2BEQBH9mHvDRtj7iV7hWxT4hDEUXeoeb
         65HmkeAQ84KU2U2YMvLzkfcxP3EqhvPZTLwJCOWZ26pahkSXMBs423oMOAL20aXSFFJb
         s8tQ==
X-Gm-Message-State: AOJu0YwvHXOXDaEBkzBTO+G7R7m7nXEFX8qSNPIhdP/pWkmI3bIZ/kn0
	3oGUI2YuOg4spKqIV9EHB1C5Lw==
X-Google-Smtp-Source: AGHT+IFzFX6024nzxiosM9l+6Ya1tT1Cn5ggSgsLi/0x1b1M6T1Yxj2Q5/ayz8g2pgVlEQTFv5OCyw==
X-Received: by 2002:a17:90a:c202:b0:27c:f282:adac with SMTP id e2-20020a17090ac20200b0027cf282adacmr9364622pjt.0.1697426562152;
        Sun, 15 Oct 2023 20:22:42 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090ae28800b0027758c7f585sm3452770pjz.52.2023.10.15.20.22.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Oct 2023 20:22:41 -0700 (PDT)
From: Peng Zhang <zhangpeng.00@bytedance.com>
To: Liam.Howlett@oracle.com,
	corbet@lwn.net,
	akpm@linux-foundation.org,
	willy@infradead.org,
	brauner@kernel.org,
	surenb@google.com,
	michael.christie@oracle.com,
	mjguzik@gmail.com,
	mathieu.desnoyers@efficios.com,
	npiggin@gmail.com,
	peterz@infradead.org,
	oliver.sang@intel.com,
	mst@redhat.com
Cc: zhangpeng.00@bytedance.com,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v5 00/10] Introduce __mt_dup() to improve the performance of fork()
Date: Mon, 16 Oct 2023 11:22:16 +0800
Message-Id: <20231016032226.59199-1-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi all,

This series introduces __mt_dup() to improve the performance of fork(). During
the duplication process of mmap, all VMAs are traversed and inserted one by one
into the new maple tree, causing the maple tree to be rebalanced multiple times.
Balancing the maple tree is a costly operation. To duplicate VMAs more
efficiently, mtree_dup() and __mt_dup() are introduced for the maple tree. They
can efficiently duplicate a maple tree.

Here are some algorithmic details about {mtree,__mt}_dup(). We perform a DFS
pre-order traversal of all nodes in the source maple tree. During this process,
we fully copy the nodes from the source tree to the new tree. This involves
memory allocation, and when encountering a new node, if it is a non-leaf node,
all its child nodes are allocated at once.

Some previous discussions can be referred to as [1]. For a more detailed
analysis of the algorithm, please refer to the logs for patch [3/10] and patch
[10/10]

There is a "spawn" in byte-unixbench[2], which can be used to test the
performance of fork(). I modified it slightly to make it work with
different number of VMAs.

Below are the test results. The first row shows the number of VMAs.
The second and third rows show the number of fork() calls per ten seconds,
corresponding to next-20231006 and the this patchset, respectively. The
test results were obtained with CPU binding to avoid scheduler load
balancing that could cause unstable results. There are still some
fluctuations in the test results, but at least they are better than the
original performance.

21     121   221    421    821    1621   3221   6421   12821  25621  51221
112100 76261 54227  34035  20195  11112  6017   3161   1606   802    393
114558 83067 65008  45824  28751  16072  8922   4747   2436   1233   599
2.19%  8.92% 19.88% 34.64% 42.37% 44.64% 48.28% 50.17% 51.68% 53.74% 52.42%

Thanks for Liam's review.

Changes since v4:
 - Change the handling method for the failure of dup_mmap(). Handle it in
   exit_mmap().
 - Update check_forking() and bench_forking().
 - Add the corresponding copyright statement.

Peng Zhang (10):
  maple_tree: Add mt_free_one() and mt_attr() helpers
  maple_tree: Introduce {mtree,mas}_lock_nested()
  maple_tree: Introduce interfaces __mt_dup() and mtree_dup()
  radix tree test suite: Align kmem_cache_alloc_bulk() with kernel
    behavior.
  maple_tree: Add test for mtree_dup()
  maple_tree: Update the documentation of maple tree
  maple_tree: Skip other tests when BENCH is enabled
  maple_tree: Update check_forking() and bench_forking()
  maple_tree: Preserve the tree attributes when destroying maple tree
  fork: Use __mt_dup() to duplicate maple tree in dup_mmap()

 Documentation/core-api/maple_tree.rst |   4 +
 include/linux/maple_tree.h            |   7 +
 kernel/fork.c                         |  39 ++-
 lib/maple_tree.c                      | 304 ++++++++++++++++++++-
 lib/test_maple_tree.c                 | 123 +++++----
 mm/memory.c                           |   7 +-
 mm/mmap.c                             |   9 +-
 tools/include/linux/rwsem.h           |   4 +
 tools/include/linux/spinlock.h        |   1 +
 tools/testing/radix-tree/linux.c      |  45 +++-
 tools/testing/radix-tree/maple.c      | 363 ++++++++++++++++++++++++++
 11 files changed, 815 insertions(+), 91 deletions(-)

-- 
2.20.1


