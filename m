Return-Path: <linux-doc+bounces-33242-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 895409F7385
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 05:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 454D7188D42F
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 04:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B2386336;
	Thu, 19 Dec 2024 04:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLOgUS5M"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828B878F55;
	Thu, 19 Dec 2024 04:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734581019; cv=none; b=fJ88puuCdj1mw/yQY8ssD0VxZAFJE3pfXAv63uYKXGAq+ytNC6SWp+4TaVAtbFTISlA1llwWIz9GNtKn0oJTqAx6iU5gXQ/fYGEUs+H6PMwdQgoCiL/0VcDHBUcktZvFuT4aOwKbS5cXOSUdrCgNdSANJ/NTdXn9m1QiRo93IOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734581019; c=relaxed/simple;
	bh=yTFAxcbPoCTrpJqmhdVdqAR+kuxXaJ5DPD927bcaAic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eIvng/VrHu9rIid2sV25IujjPFzKzo1Tqpna3sXkXdXi/oBuhm9PdXPBVaRq+5Sed6w/d26qkHQ2+h/olDrPRfY9WAQCzRmj6v5SpPTJUnFQ1ScDDC0+EuvkpeurDlAYAIOKVlGHqMqi2RFawjhgUAlLAib7EHuyVjU0XJkxM6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLOgUS5M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF55BC4CED4;
	Thu, 19 Dec 2024 04:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734581019;
	bh=yTFAxcbPoCTrpJqmhdVdqAR+kuxXaJ5DPD927bcaAic=;
	h=From:To:Cc:Subject:Date:From;
	b=oLOgUS5MLJDjWezERfK3zz8SRJGJeVreDsOUGZIu8QcUqmHN1MZAH9XFVufoVBr6E
	 adcIthkyM3Ie7eHWFvmjln9GE+lRS2UreOPCWllHFTbqzWhvBbM2M3ARYlIY91f/kw
	 /51nGgOdFC7VE7Ll44co43jfji1A2zKiWWTkYjnJXNIZ2JNQ7WBWW+DPPq16tmRddr
	 lDSFsNAKsC6T6OaiZJErlvK609Xrdb8mK8C6VtnNJ0DNa9EudQ6MGy8RLs6qeqp8bH
	 YWfFMPy6q6d4Gon12yHDN9qNVaCb/zx9DXOMSytp3zdXI5guOv+M3ZV1FFPzPw14mG
	 cF1CVmZ153Tmg==
From: SeongJae Park <sj@kernel.org>
To: 
Cc: kernel-team@meta.com,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 00/18] mm/damon: enable page level properties based access pattern monitoring
Date: Wed, 18 Dec 2024 20:03:09 -0800
Message-Id: <20241219040327.61902-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TL; DR
======

This patch series eanble access monitoring based on page level
properties including their anonymousness, belonging cgroups and
pg-young-ness, by extending DAMOS stats and regions walk features with
region-internal DAMOS filters.

Background
==========

DAMON fundametally provides only access pattern information in region
granularity.  For some use cases, fixed and fine granularity information
based on non access pattern properties can be useful, though.  For
example, on systems having fast swap devices and slow storage devices,
DAMOS-based proactive reclaim need to be applied differently for
anonymous pages and file-backed pages.

DAMOS makes it possible via DAMOS filters that work in page level
properties including anonymousness, belonging cgroups, and
pg-young-ness.  Having only the fine-grained inforamtion without making
system operation behavior changes can be useful for tuning or monitoring
purposes.  But currently DAMON provides no way for that.

Idea
====

DAMOS has initially developed for only access-aware system operations.
But, efficient acces monitoring results querying is yet another major
usage of today's DAMOS.  DAMOS stats and regions walk, which exposes
accumulated counts and per-region monitoring results that filtered by
DAMOS parameters including target access pattern and quotas, are the key
features for that usage.  Special DAMOS action, DAMOS_STAT, was also
introduced to support doing only monitoring without making any system
operation behavioral changes.

Hence, the fine-grained information that already available for
access-aware system operation can be passed to users by connecting the
region-internal DAMOS filters with stats and regions walk features.

Design
======

Update the interface of DAMON operations set layer, which contains
region-internal DAMOS filters implementation, to report back the amount
of memory that passed the region-internal DAMOS filters to the core
layer.  On the core layer, account the operations set layer reported
stat with a per-scheme accumulated stat.  Also, pass the stat to regions
walk.  In this way, DAMON API users can efficiently get the fine-grained
information.

For the user-space, make DAMON sysfs interface collects the information
using DAMON core API, and expose those to new per-scheme stats file and
per-DAMOS-tried region properties file.

Practical Usages
================

With this patch series, DAMON users can query how many bytes of regions
of specific access temperature is backed by pages of specific type.  The
type can be any of DAMOS filter-supporting one, including anonymousness,
belonging cgroups, and pg-young-ness.  For example, users can visualize
access hotness-based page granulairty histogram for different cgroups,
backing content type, or youngness.  In future, it could be extended to
more types such as whether it is THP, position on LRU lists, etc.  This
can be useful for estimating benefits of a new or an existing
access-aware system optimizations without really committing the changes.

Patches Sequence
================

The patches are separated in four sequences.

First four patches add adding documentation of background knowledge.

Following three patches change the operations set layer interface to
report back the region-internal filter passed memory size, and make the
operations set implementations support the changed symantic.

Following five patches implement per-scheme accumulated stat for
region-internal filter-passed memory size on core API, DAMON sysfs
interface.  First two patches of those are for code change, and
following three patches are for documentation.

Finally, six patches implementing per-region region-internal
filter-passed memory size follows.  First three patches of these are for
code change of preparation, API, and DAMON sysfs interface parts.  The
final three patches are for documentation.

Misc Notes
==========

This patch series depend on another RFC patch series[1] that introduced
damos_call().  Some of patches here, particularly the one that adds
Documentation for damos_call() and changing
damos_call_control->walk_fn() invocation sequence, may be moved and
folded into the patch series when it drops RFC tag.

[1] https://lore.kernel.org/20241213215306.54778-1-sj@kernel.org


SeongJae Park (18):
  mm/damon: clarify trying vs applying on damos_stat kernel-doc comment
  Docs/mm/damon/design: document DAMOS regions walking
  Docs/mm/damon/design: add 'statistics' section
  Docs/admin-guide/mm/damon/usage: link damos stat design doc
  mm/damon: ask apply_scheme() to report filter-passed region-internal
    bytes
  mm/damon/paddr: report filter-passed bytes back for normal actions
  mm/damon/paddr: report filter-passed bytes back for DAMOS_STAT action
  mm/damon/core: implement per-scheme filter-passed bytes stat
  mm/damon/syfs-schemes: implement per-scheme filter-passed bytes stat
  Docs/mm/damon/design: document sz_ops_filter_passed
  Docs/admin-guide/mm/damon/usage: document sz_ops_filter_passed
  Docs/ABI/damon: document per-scheme filter-passed bytes stat file
  mm/damon/core: invoke damos_walk_control->walk_fn() after applying
    action
  mm/damon/core: pass per-region filter-passed bytes to
    damos_walk_control->walk_fn()
  mm/damon/sysfs-schemes: expose per-region filter-passed bytes
  Docs/mm/damon/design: document per-region sz_filter_passed stat
  Docs/admin-guide/mm/damon/usage: document sz_filtered_out of scheme
    tried region directories
  Docs/ABI/damon: document per-region DAMOS filter-passed bytes stat
    file

 .../ABI/testing/sysfs-kernel-mm-damon         | 13 ++++
 Documentation/admin-guide/mm/damon/usage.rst  | 29 ++++----
 Documentation/mm/damon/design.rst             | 53 ++++++++++++++
 include/linux/damon.h                         | 27 ++++++-
 mm/damon/core.c                               | 31 ++++----
 mm/damon/paddr.c                              | 70 +++++++++++++++----
 mm/damon/sysfs-common.h                       |  2 +-
 mm/damon/sysfs-schemes.c                      | 34 ++++++++-
 mm/damon/sysfs.c                              |  5 +-
 mm/damon/vaddr.c                              |  2 +-
 10 files changed, 216 insertions(+), 50 deletions(-)


base-commit: af113b0c56e321562fb85ef5da57f323c34b616b
-- 
2.39.5


