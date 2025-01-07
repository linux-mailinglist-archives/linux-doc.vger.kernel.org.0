Return-Path: <linux-doc+bounces-34242-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D466A04ACF
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jan 2025 21:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D00273A5D2F
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jan 2025 20:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA79A1F2C22;
	Tue,  7 Jan 2025 20:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XlUvFqc5"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE8812B93;
	Tue,  7 Jan 2025 20:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736281088; cv=none; b=A/QK6OVT8GDoe8wpNAA/X+69VFGmMT9AcjRsWQZUF5l4rIcH1niAPXWPYNxENMQ6hqtQrvhGQwBVYpNHmNprJDAOd+a4jPiyp4A2zTxXmXg3VgQtBvnNuzTFIll+PuUhes9331CwK5KkXVvDXYze6kiQroTe5RZ04fq/Ppc8fxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736281088; c=relaxed/simple;
	bh=tFMvsVxldJqs/FhiBDYeI89MsENyQmeQg8HlKr0w7OU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jMJa2hulbseHkFBQn7IKmmW5uctL5cvtW0sbTRITZ+YzSQGHy7pmI8929qVbc8ZKTJxIrQyOkIKESM0SYdITYTpu+L9JwYeBmVHejKPmp61Wke0adITKUr52fNZIo6wvWsGIdQs8Omybmv3aY3862zAyF2u8/ZdhC3+WAyqmaOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XlUvFqc5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25536C4CED6;
	Tue,  7 Jan 2025 20:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736281088;
	bh=tFMvsVxldJqs/FhiBDYeI89MsENyQmeQg8HlKr0w7OU=;
	h=From:To:Cc:Subject:Date:From;
	b=XlUvFqc5pBW0+QEdTp4QRp+e9wwaKSpsKK3cj1agLG8vnBJyzfanmEebanVmAPU63
	 Zb39hcdPVBcYIDOcOsYjD68MIdfrKG5KzblJzknBVQeCjHVdrbejzfwqIV1ETpym1o
	 aHTPLLySkLoknQmYjY90REY24mpTUZhbdFgueDwHJHVnx7AhvPXNwKZFQIoi/S4xfr
	 Rcs6piQCczInJlnlVbzLm83MQf/NzJOArd6PmUZKu8lDN9SrRDqWGaOr9wQnkl0Aao
	 i2o5WK0cWo6fQU5fl7USY7LUutFOsNQeLFS9GNFSOci/92QCsAy232plARIVNlN8Tf
	 Z5txm0NCDZQ3g==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 00/10] mm/damon: extend DAMOS filters for inclusion
Date: Tue,  7 Jan 2025 12:17:29 -0800
Message-Id: <20250107201739.79484-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DAMOS fitlers are exclusive filters.  It only excludes memory of given
criterias from the DAMOS action targets.  This has below limitations.

First, the name is not explicitly explaining the behavior.  This
actually resulted in users' confusions[1].  Secondly, combined uses of
multiple filters provide restriced coverages.  For example, building a
DAMOS scheme that applies the action to memory that belongs to cgroup A
"or" cgroup B is impossible.  A workaround would be using two schemes
that fitlers out memory that not belong to cgroup A and cgroup B,
respectively.  It is cumbersome, and difficult to control quota-like
per-scheme features in orchastration.  Monitoring of filter-passed
memory statistic will also be complicated.

Extend DAMOS filters to support not only exclusion (blocking), but also
inclusion (pass-through) behavior.  For this, add a new damos_filter
struct field called 'pass' for DAMON kernel API users.  The filter works
as an inclusion filter or an exclusion filter when it is set or unset,
respectively.  For DAMON user-space ABI users, add a DAMON sysfs file of
same name under DAMOS filter sysfs directory.  To prevent exposing a
behavioral change to old users, set the blocking as the default
behavior.

Note that pass filters work for only inclusion, not exclusion of memory
that not satisfying the criteria.  And the default behavior of DAMOS for
memory that no filter has involved is that the action can be applied to
those.  This means that installing pass filters without block filters
after them is not useful for some usecases.  Read the design document
update part of this patch series for more details.

[1] https://lore.kernel.org/20240320165619.71478-1-sj@kernel.org

Changes from RFC v2
(https://lore.kernel.org/20241227210819.63776-1-sj@kernel.org)
- Wordsmith messages
- Wordsmith design documentation about monitoring-purpose usage
- Rebase on latest mm-unstable

Changes from RFC v1
(https://lore.kernel.org/20241226221445.78433-1-sj@kernel.org)
- Fix encoding issue on the last patch

SeongJae Park (10):
  mm/damon: fixup damos_filter kernel-doc
  mm/damon/core: add damos_filter->pass field
  mm/damon/core: support damos_filter->pass
  mm/damon/paddr: support damos_filter->pass
  mm/damon: add pass argument to damos_new_filter()
  mm/damon/sysfs-schemes: add a file for setting damos_filter->pass
  Docs/mm/damon/design: document pass/block filters behaviors
  Docs/ABI/damon: document DAMOS filter pass sysfs file
  Docs/admin-guide/mm/damon/usage: omit DAMOS filter details in favor of
    design doc
  Docs/admin-guide/mm/damon/usage: document DAMOS filter 'pass' sysfs
    file

 .../ABI/testing/sysfs-kernel-mm-damon         | 14 +++--
 Documentation/admin-guide/mm/damon/usage.rst  | 55 ++++++++++---------
 Documentation/mm/damon/design.rst             | 34 ++++++++++--
 include/linux/damon.h                         | 15 +++--
 mm/damon/core.c                               | 12 ++--
 mm/damon/paddr.c                              |  9 +--
 mm/damon/reclaim.c                            |  2 +-
 mm/damon/sysfs-schemes.c                      | 32 ++++++++++-
 mm/damon/tests/core-kunit.h                   | 14 ++---
 9 files changed, 130 insertions(+), 57 deletions(-)

-- 
2.39.5

