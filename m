Return-Path: <linux-doc+bounces-7611-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC8F83DE47
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jan 2024 17:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D20D71F21482
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jan 2024 16:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED611D55F;
	Fri, 26 Jan 2024 16:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XVpH5ftF"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3801D527;
	Fri, 26 Jan 2024 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706285102; cv=none; b=o6Oe3u0jMywtzcuM1C/TgfWtcS8yBR2baiaiNyOaNMZLvEeoucKCZxOUXhj/WXWvmG23OfA9gyKE/42eZUNcVoy40VvL39KGZUL2LvoMZh6/KdEk86ciMJh3FU4BMOhzjXI1P7wUmSquL7gNqe1GYyiQIyf+RK3vGFWhZVsveqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706285102; c=relaxed/simple;
	bh=mzwLTXPC+XnWcOOz0ICjS7dJ9arog1CAeKbjzGezlHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TgE0mnhH02K4S14+cAZDwrvsrgEtuvafXu0gpYN7zao9zDyjswe0/R7YMBTKsi+V6TRPudiJmELQEvrEJtv3MQfU9aspwRCqbe/n+mjVPYeVn8gzaYnyWcu24CSz8k59gp4LoeD25Uz7lYid/bQRVylTToMUUXHTeBVOvCq6CUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XVpH5ftF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B7E877AF0;
	Fri, 26 Jan 2024 16:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B7E877AF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1706285091; bh=LcvQz/rxCpKFicMcti8kDW+mUgniCAm7HJg7VKFKMMo=;
	h=From:To:Cc:Subject:Date:From;
	b=XVpH5ftFAzIpoksSQdF+JQxD/Xid5Ngn935ALrIOS1gXObRcJHDgHI8oo24D9ScZl
	 efoNua84NiMZ2HjiYqCFI1pgBmsjzAguSL6r3ywD96mdFxR1beZ6iaB6lbxi6XEa4X
	 BRognYUidWVUMGOWFxXsf3yWQuQGwV/jFbXVzQy5XTNuSbG99m4Pz/0UjVbx82K3d1
	 OZwePsu+DsdRcBL3z2ebWqbZMUMeTcC2TzNgEdXsJ2/h5iT8tksJDFtYa8nGFloH6J
	 T+E+L/RyDDoHdQXrzSGxVfpvm+UvJuxKBYt021PH/TCMhwIqr6am8Ci4r6CzZa359a
	 Kn/hpG+n+betg==
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Documentation fixes
Date: Fri, 26 Jan 2024 09:04:51 -0700
Message-ID: <87il3g6py4.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.lwn.net/linux.git tags/docs-6.8-fixes

for you to fetch changes up to d546978e0c07b6333fdbcbd81b2f2e058d4560b5:

  docs: admin-guide: remove obsolete advice related to SLAB allocator (2024-01-23 14:52:37 -0700)

----------------------------------------------------------------
A handful of relatively boring documentation fixes.

----------------------------------------------------------------
Gustavo Sousa (1):
      docs/sphinx: Fix TOC scroll hack for the home page

Hu Haowen (1):
      docs/accel: correct links to mailing list archives

Lukas Bulwahn (1):
      docs: admin-guide: remove obsolete advice related to SLAB allocator

Vegard Nossum (1):
      doc: admin-guide/kernel-parameters: remove useless comment

 Documentation/accel/introduction.rst                  |  4 ++--
 Documentation/admin-guide/kernel-parameters.rst       |  5 -----
 Documentation/admin-guide/kernel-per-CPU-kthreads.rst | 16 ++++++----------
 Documentation/sphinx/templates/kernel-toc.html        |  4 +++-
 4 files changed, 11 insertions(+), 18 deletions(-)

