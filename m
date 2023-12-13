Return-Path: <linux-doc+bounces-4992-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28960811DF1
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 20:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFCDE1C20BE7
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 19:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E33067B52;
	Wed, 13 Dec 2023 19:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6h4+M4V"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D765818;
	Wed, 13 Dec 2023 19:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CDFC433C8;
	Wed, 13 Dec 2023 19:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702494232;
	bh=pWtLPm1/J2Yj2cliVy3Ne0rBNlxUd7IWRzTe9t9tVB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e6h4+M4VC9qAjLnh23mRoTfYMBmcRe7YK9YydYIyZ09VAvI0u25sqAx5wFzEOvglJ
	 bms5Ts/CteG4vueQMg0M8R1KIdBc+qylann1icA1m6XQNV6UlClJgSixwym3Q+/OPS
	 7hrXEww0BdjszDcObO12DcG5bh8L4kZd9r28ZQfQTwR1RIQSZRhdG1VKUCz0W/Ys2g
	 nz+1I5d/UazRfTgZj0FBz50eg7TgQHkNSyjdp2e0MMuKAeTtxSJF2VfLkeNlzkwk3Y
	 xGJSvQHRdo8ZPUBWZUjiNk4KmGiBYRjv4fZLRTXiDdfShsfeDmQgOn0LCEktym8yFU
	 ZBkifW1LIrDiw==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] Docs/admin-guide/mm/damon/usage: update context directory section label
Date: Wed, 13 Dec 2023 19:03:36 +0000
Message-Id: <20231213190338.54146-5-sj@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231213190338.54146-1-sj@kernel.org>
References: <20231213190338.54146-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The label for context DAMON sysfs directory section is having name
sysfs_contexts.  The name would be better to be used for the contexts
directory.  Rename it to represent a single context.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/usage.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index ff9f62e65722..d3514367703b 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -164,7 +164,7 @@ number (``N``) to the file creates the number of child directories named as
 details).  At the moment, only one context per kdamond is supported, so only
 ``0`` or ``1`` can be written to the file.
 
-.. _sysfs_contexts:
+.. _sysfs_context:
 
 contexts/<N>/
 -------------
@@ -288,7 +288,7 @@ The ``action`` file is for setting and getting the scheme's :ref:`action
 from the file and their meaning are as below.
 
 Note that support of each action depends on the running DAMON operations set
-:ref:`implementation <sysfs_contexts>`.
+:ref:`implementation <sysfs_context>`.
 
  - ``willneed``: Call ``madvise()`` for the region with ``MADV_WILLNEED``.
    Supported by ``vaddr`` and ``fvaddr`` operations set.
@@ -428,7 +428,7 @@ pages of all memory cgroups except ``/having_care_already``.::
     echo N > 1/matching
 
 Note that ``anon`` and ``memcg`` filters are currently supported only when
-``paddr`` :ref:`implementation <sysfs_contexts>` is being used.
+``paddr`` :ref:`implementation <sysfs_context>` is being used.
 
 Also, memory regions that are filtered out by ``addr`` or ``target`` filters
 are not counted as the scheme has tried to those, while regions that filtered
-- 
2.34.1


