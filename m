Return-Path: <linux-doc+bounces-15201-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6808B407E
	for <lists+linux-doc@lfdr.de>; Fri, 26 Apr 2024 21:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B07442888A0
	for <lists+linux-doc@lfdr.de>; Fri, 26 Apr 2024 19:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BAE2CCA3;
	Fri, 26 Apr 2024 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaY7xpWf"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF3F2C848;
	Fri, 26 Apr 2024 19:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714161184; cv=none; b=WYk33sXD5uhO1wnnxi3X7569bTZuivmGoyqYsR+ZYnmWJDGllXE5z9G6YXkUBzhyWLEnX9DvG2wLdbNNZzuVePUoQfHbevQ+lnN+ppdvIt5Ix2K8eE1Akw2Y0pmil4goUK6PZywCG3y93XbSIK5Lk+hy0+qoBC5MhIW/qH/dT8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714161184; c=relaxed/simple;
	bh=Dn52cDE5Pk1z+Ex2+NSRLPE8W1EnK4AAtmH09ziQ5Go=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qVD2SrJNY+RGJ7hABFpAixj9vrHClGpJCVthYwAediUUyGXAzirmvuSg3ho1V3ydim0CbMiw5L5d32aliNV9hJqb2VEfpWRD+DzxKYrCN04B+t6cI8W6q3GFSo+dNPYVB4sQWD1bxvNa9w6bedC8IziZ5tz5oVoDTf+inLXPWdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaY7xpWf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11159C113CD;
	Fri, 26 Apr 2024 19:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714161183;
	bh=Dn52cDE5Pk1z+Ex2+NSRLPE8W1EnK4AAtmH09ziQ5Go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FaY7xpWfrq2qjeYXOwwOAZVETK3xRZ4BxENUObbcz7u+jRxkYrBEvm858VQn6g3W7
	 Vekg9u8ya7fwc0J4yH0UOxjzG6Np4hOXm+/eQoHQTN+mVOAaxSNhpFobPivRMWZk+0
	 JuamddyfKk4YlShNuwYzemkcyyidfA0P/kdAWMRGBjCvHKAetm3nVO91ytlCvyPQFA
	 Ugrhr/lf5hM7Q5BInN/rFbGaTqlMOiNKhBOYrPamVy11SiKWIZr/aP//bGpfDO3Zmu
	 gQuVQ1NTskmEnwjxWxDMtkPsZOhqTng13jmR1COz8BfNuKdpCD8esBcuhvZ3RDnvOp
	 qf21CwHedF6lg==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] Docs/mm/damon/design: document 'young page' type DAMOS filter
Date: Fri, 26 Apr 2024 12:52:44 -0700
Message-Id: <20240426195247.100306-6-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426195247.100306-1-sj@kernel.org>
References: <20240426195247.100306-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update DAMON design document for the newly added DAMOS filter type,
'young page'.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/damon/design.rst | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 5620aab9b3850..f2baf617184d0 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -461,15 +461,17 @@ number of filters for each scheme.  Each filter specifies the type of target
 memory, and whether it should exclude the memory of the type (filter-out), or
 all except the memory of the type (filter-in).
 
-Currently, anonymous page, memory cgroup, address range, and DAMON monitoring
-target type filters are supported by the feature.  Some filter target types
-require additional arguments.  The memory cgroup filter type asks users to
-specify the file path of the memory cgroup for the filter.  The address range
-type asks the start and end addresses of the range.  The DAMON monitoring
-target type asks the index of the target from the context's monitoring targets
-list.  Hence, users can apply specific schemes to only anonymous pages,
-non-anonymous pages, pages of specific cgroups, all pages excluding those of
-specific cgroups, pages in specific address range, pages in specific DAMON
+Currently, anonymous page, memory cgroup, young page, address range, and DAMON
+monitoring target type filters are supported by the feature.  Some filter
+target types require additional arguments.  The memory cgroup filter type asks
+users to specify the file path of the memory cgroup for the filter.  The
+address range type asks the start and end addresses of the range.  The DAMON
+monitoring target type asks the index of the target from the context's
+monitoring targets list.  Hence, users can apply specific schemes to only
+anonymous pages, non-anonymous pages, pages of specific cgroups, all pages
+excluding those of specific cgroups, pages that not accessed after the last
+access check from the scheme, pages that accessed after the last access check
+from the scheme, pages in specific address range, pages in specific DAMON
 monitoring targets, and any combination of those.
 
 To handle filters efficiently, the address range and DAMON monitoring target
-- 
2.39.2


