Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F130172CC7
	for <lists+linux-doc@lfdr.de>; Fri, 28 Feb 2020 01:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730012AbgB1AHN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Feb 2020 19:07:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:60258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729987AbgB1AHM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Feb 2020 19:07:12 -0500
Received: from kicinski-fedora-PC1C0HJN.thefacebook.com (unknown [163.114.132.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DE551246AE;
        Fri, 28 Feb 2020 00:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582848432;
        bh=OYnrAl/nr/jtmAa7nPlUgYHEVyQ2+HtRA/xEe/Wc/a0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NkzuJaGyuq04u9QOT5oIYsYixwl+PKktW7kMGR8K3UpXjyRORbL+VVh6DCaL7X0MN
         ZZcpvtJ7vejzxr89DPxI1Tgwx3gJwP2p0bE1SBqL5tia+AABHXPKT48DPXERZkOvVt
         EIZgBljpE0ASfTR2NVu2wkM1bOrIInrGZmTYORYM=
From:   Jakub Kicinski <kuba@kernel.org>
To:     corbet@lwn.net
Cc:     clm@fb.com, hannes@cmpxchg.org, tj@kernel.org, lizefan@huawei.com,
        linux-doc@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH doc 2/5] doc: cgroup: improve formatting of mem stats
Date:   Thu, 27 Feb 2020 16:06:50 -0800
Message-Id: <20200228000653.1572553-3-kuba@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200228000653.1572553-1-kuba@kernel.org>
References: <20200228000653.1572553-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If there is an empty line between item and description
Sphinx does not emphasize the item. First half of the
list does not have the empty line and is emphasized
correctly.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
---
 Documentation/admin-guide/cgroup-v2.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 723c8bd422cc..ab8b91014afb 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1313,53 +1313,41 @@ PAGE_SIZE multiple when read back.
 		Number of major page faults incurred
 
 	  workingset_refault
-
 		Number of refaults of previously evicted pages
 
 	  workingset_activate
-
 		Number of refaulted pages that were immediately activated
 
 	  workingset_nodereclaim
-
 		Number of times a shadow node has been reclaimed
 
 	  pgrefill
-
 		Amount of scanned pages (in an active LRU list)
 
 	  pgscan
-
 		Amount of scanned pages (in an inactive LRU list)
 
 	  pgsteal
-
 		Amount of reclaimed pages
 
 	  pgactivate
-
 		Amount of pages moved to the active LRU list
 
 	  pgdeactivate
-
 		Amount of pages moved to the inactive LRU list
 
 	  pglazyfree
-
 		Amount of pages postponed to be freed under memory pressure
 
 	  pglazyfreed
-
 		Amount of reclaimed lazyfree pages
 
 	  thp_fault_alloc
-
 		Number of transparent hugepages which were allocated to satisfy
 		a page fault, including COW faults. This counter is not present
 		when CONFIG_TRANSPARENT_HUGEPAGE is not set.
 
 	  thp_collapse_alloc
-
 		Number of transparent hugepages which were allocated to allow
 		collapsing an existing range of pages. This counter is not
 		present when CONFIG_TRANSPARENT_HUGEPAGE is not set.
-- 
2.24.1

