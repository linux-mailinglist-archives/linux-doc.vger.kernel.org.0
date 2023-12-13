Return-Path: <linux-doc+bounces-4990-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6A0811DEC
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 20:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5798E1F21742
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 19:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CC259B71;
	Wed, 13 Dec 2023 19:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2fmWay4"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2147A818;
	Wed, 13 Dec 2023 19:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F30CC433CA;
	Wed, 13 Dec 2023 19:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702494224;
	bh=J/iaoXT0rpbsPwoHcTcG3htMVyXBLicckUfUlL8eBn4=;
	h=From:To:Cc:Subject:Date:From;
	b=A2fmWay4DvFOhNXj+ErJHs9KGh6CL0CiA9Rrig1Af/yTt6bVBxPQRh3WrazeExAdt
	 BwpZLqi4FvCUXp0UtWXdHGJQHwjisx9TLgsGXO3lmE3tVnO9XyJb6PNLXhkWjlcntK
	 bTFDo6HmybRrFTlD+9FPg12pm5Eit9PYTF8sTDMC05N2Ax+Vf4WhFZ2L8srfD6970U
	 pqKRiTHVjV2R41pjqYebWf3KTZ2vJTG4MJJ7+81YhRPoiaF6FfYzLDgUS1sUujPjnY
	 iCXltYXanMEKj86HlbuGUvlL4WEIMKIvbFgXeZlOM/VXOlxv2dUm4aZIYzjfUGFQzo
	 YqCgRsTuuTqrw==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] mm/damon: misc updates for 6.8
Date: Wed, 13 Dec 2023 19:03:32 +0000
Message-Id: <20231213190338.54146-1-sj@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update comments, tests, and documents for DAMON aiming to be merged in
the next merge window for Linux v6.8.

SeongJae Park (6):
  mm/damon: update email of SeongJae
  mm/damon/core-test: test max_nr_accesses overflow caused
    divide-by-zero
  Docs/mm/damon/design: place execution model and data structures at the
    beginning
  Docs/admin-guide/mm/damon/usage: update context directory section
    label
  Docs/admin-guide/mm/damon/usage: add links to sysfs files hierarchy
  Docs/admin-guide/mm/damon/usage: use a list for 'state' sysfs file
    input commands

 Documentation/admin-guide/mm/damon/usage.rst | 123 +++++++++++--------
 Documentation/mm/damon/design.rst            |  24 ++--
 include/linux/damon.h                        |   2 +-
 mm/damon/core-test.h                         |  13 +-
 mm/damon/core.c                              |   2 +-
 mm/damon/dbgfs-test.h                        |   2 +-
 mm/damon/dbgfs.c                             |   2 +-
 mm/damon/modules-common.c                    |   2 +-
 mm/damon/vaddr-test.h                        |   2 +-
 mm/damon/vaddr.c                             |   2 +-
 10 files changed, 106 insertions(+), 68 deletions(-)


base-commit: def619f2545d0286e6f4ed6c09fac8f863a70da1
-- 
2.34.1


