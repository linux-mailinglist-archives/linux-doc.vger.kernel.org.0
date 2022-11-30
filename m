Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1604363E12D
	for <lists+linux-doc@lfdr.de>; Wed, 30 Nov 2022 21:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiK3UJw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 30 Nov 2022 15:09:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbiK3UJu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Nov 2022 15:09:50 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F4B91360;
        Wed, 30 Nov 2022 12:09:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9162861DA4;
        Wed, 30 Nov 2022 20:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66471C43146;
        Wed, 30 Nov 2022 20:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669838987;
        bh=r1rD9KyNMBqJg8aGe8o3Z8JXG+myDQ882BtgLSHPqNo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RFzWrAf4PAnp9Ebgo1QWOr+HKWbJmkSKwTKSucLkXV2ylmhJ4SrtmQX93z5/aOm3z
         WPDjofJdvcUPp6O+vdUuuvsPlFaNCSnojT8JdYzeHgOFKai6H+1o5Bos9c4zfdpJJ6
         53N2NsG8cxMUniXjE8Cx3hOJizULVJjjrK4aQcgjAHrnj0vgCQBgcbEi2VwjKLGFML
         iVK45j6pM0D4c4UsOpAiSToCQJGTeR4byKkL9vghzlYZ0xIeZSK5oT7qadPPFod9z1
         nemD4nvmaR0ba0hr8h8fNf5RFy2+0/iMGPuVFlZkjHVRJGdHOqFYNKa46pk0njabG8
         f39eYe3O+Vmzw==
From:   SeongJae Park <sj@kernel.org>
To:     SeongJae Park <sj@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 10/11] Docs/admin-guide/mm/damon/usage: document DAMOS filters of sysfs
Date:   Wed, 30 Nov 2022 20:09:36 +0000
Message-Id: <20221130200937.118005-11-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130200937.118005-1-sj@kernel.org>
References: <20221130200937.118005-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document about the newly added files for DAMOS filters on the DAMON
usage document.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/usage.rst | 48 +++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index 1a5b6b71efa1..3d82ca6a17ff 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -87,6 +87,8 @@ comma (","). ::
     │ │ │ │ │ │ │ quotas/ms,bytes,reset_interval_ms
     │ │ │ │ │ │ │ │ weights/sz_permil,nr_accesses_permil,age_permil
     │ │ │ │ │ │ │ watermarks/metric,interval_us,high,mid,low
+    │ │ │ │ │ │ │ filters/nr_filters
+    │ │ │ │ │ │ │ │ 0/type,matching,memcg_id
     │ │ │ │ │ │ │ stats/nr_tried,sz_tried,nr_applied,sz_applied,qt_exceeds
     │ │ │ │ │ │ │ tried_regions/
     │ │ │ │ │ │ │ │ 0/start,end,nr_accesses,age
@@ -151,6 +153,8 @@ number (``N``) to the file creates the number of child directories named as
 moment, only one context per kdamond is supported, so only ``0`` or ``1`` can
 be written to the file.
 
+.. _sysfs_contexts:
+
 contexts/<N>/
 -------------
 
@@ -268,8 +272,8 @@ schemes/<N>/
 ------------
 
 In each scheme directory, five directories (``access_pattern``, ``quotas``,
-``watermarks``, ``stats``, and ``tried_regions``) and one file (``action``)
-exist.
+``watermarks``, ``filters``, ``stats``, and ``tried_regions``) and one file
+(``action``) exist.
 
 The ``action`` file is for setting and getting what action you want to apply to
 memory regions having specific access pattern of the interest.  The keywords
@@ -347,6 +351,46 @@ as below.
 
 The ``interval`` should written in microseconds unit.
 
+schemes/<N>/filters/
+--------------------
+
+Users could know something more than the kernel for specific types of memory.
+In the case, users could do their own management for the memory and hence
+doesn't want DAMOS bothers that.  Users could limit DAMOS by setting the access
+pattern of the scheme and/or the monitoring regions for the purpose, but that
+can be inefficient in some cases.  In such cases, users could set non-access
+pattern driven filters using files in this directory.
+
+In the beginning, this directory has only one file, ``nr_filters``.  Writing a
+number (``N``) to the file creates the number of child directories named ``0``
+to ``N-1``.  Each directory represents each filter.  The filters are evaluated
+in the numeric order.
+
+Each filter directory contains three files, namely ``type``, ``matcing``, and
+``memcg_path``.  You can write one of two special keywords, ``anon`` for
+anonymous pages, or ``memcg`` for specific memory cgroup filtering.  In case of
+the memory cgroup filtering, you can specify the memory cgroup of the interest
+by writing the path of the memory cgroup from the cgroups mount point to
+``memcg_path`` file.  You can write ``Y`` or ``N`` to ``matching`` file to
+filter out pages that does or does not match to the type, respectively.  Then,
+the scheme's action will not be applied to the pages that specified to be
+filtered out.
+
+For example, below restricts a DAMOS action to be applied to only non-anonymous
+pages of all memory cgroups except ``/having_care_already``.::
+
+    # echo 2 > nr_filters
+    # # filter out anonymous pages
+    echo anon > 0/type
+    echo Y > 0/matching
+    # # further filter out all cgroups except one at '/having_care_already'
+    echo memcg > 1/type
+    echo /having_care_already > 1/memcg_path
+    echo N > 1/matching
+
+Note that filters could be ignored depend on the running DAMON operations set
+`implementation <sysfs_contexts>`.
+
 .. _sysfs_schemes_stats:
 
 schemes/<N>/stats/
-- 
2.25.1

