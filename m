Return-Path: <linux-doc+bounces-32484-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B239ED0AF
	for <lists+linux-doc@lfdr.de>; Wed, 11 Dec 2024 17:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 063DE28D26C
	for <lists+linux-doc@lfdr.de>; Wed, 11 Dec 2024 16:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA3A1D9320;
	Wed, 11 Dec 2024 16:03:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638C21D63FA;
	Wed, 11 Dec 2024 16:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733932981; cv=none; b=DiAySV2AJtLDuf8wtvih1B8XZegpslihmotg5b7M7dqpdpkEZH6hLJ7IzG2PSZhQM3G9uKXiZ5sWThONNd1xRMEqmMZDlEsPrDaW43+3Rqik3H3t4K4MAIv0Xz0fkwm9DDfBdVOV6R2Ju8PQnm9t5IM5Wd1A9Sqi7rsVhVPA8e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733932981; c=relaxed/simple;
	bh=j5cRxslKRVzKYbY/rD7eInMUBBXSi81btqYbZV2gLTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FaYG6xKz9Ywkx7Jr75eVl5sFyc1pCW8WD/3qFpeK1mTmcG24HOlQhVjkUAQ9n30e1Nf1PpR9gNsIOHmC7jzyQMpFdMqIVxNhaYvW6p+DohjSMy6uoBu0B/aBrOdFJ/L1V8pgDGe2UNsNqGFdt+SGcEJ41AuCFuyMLb9Y//J3m2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3B4F1063;
	Wed, 11 Dec 2024 08:03:25 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.1.196.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D7383F5A1;
	Wed, 11 Dec 2024 08:02:55 -0800 (PST)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: [RESEND RFC PATCH v1 0/5] Initial BBML2 support for contpte_convert()
Date: Wed, 11 Dec 2024 16:01:36 +0000
Message-ID: <20241211160218.41404-1-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Resending as had wrong address for linux-doc and kvmarm. Apologies for
spam.

Hi All,

This patch series seeks to gather feedback on adding initial support
for level 2 of the Break-Before-Make arm64 architectural feature,
specifically to contpte_convert().

This support reorders a TLB invalidation in contpte_convert(), and
optionally elides said invalidation completely which leads to a 12%
improvement when executing a microbenchmark designed to force the
pathological path where contpte_convert() gets called. This
represents an 80% reduction in the cost of calling contpte_convert().

However, the elision of the invalidation is still pending review to
ensure it is architecturally valid. Without it, the reodering also
represents a performance improvement due to reducing thread contention,
as there is a smaller time window for racing threads to see an invalid
pagetable entry (especially if they already have a cached entry in their
TLB that they are working off of).

This series is based on v6.13-rc2 (fac04efc5c79).

Break-Before-Make Level 2
=========================

Break-Before-Make (BBM) sequences ensure a consistent view of the
page tables. They avoid TLB multi-hits and ensure atomicity and
ordering guarantees. BBM level 0 simply defines the current use
of page tables. When you want to change certain bits in a pte,
you need to:

- clear the pte
- dsb()
- issue a tlbi for the pte
- dsb()
- repaint the pte
- dsb()

When changing block size, or toggling the contiguous bit, we
currently use this BBM level 0 sequence. With BBM level 2 support,
however, we can relax the BBM sequence and benefit from a performance
improvement. The hardware would then either automatically handle the
TLB invalidations, or would take a TLB Conflict Abort Exception.

This exception can either be a stage 1 or stage 2 exception, depending
on whether stage 1 or stage 2 translations are in use. The architecture
currently mandates a worst-case invalidation of vmalle1 or vmalls12e1,
when stage 2 translation is not in-use and in-use respectively.

Outstanding Questions and Remaining TODOs
=========================================

Patch 4 moves the tlbi so that the window where the pte is invalid is
significantly smaller. This reduces the chances of racing threads
accessing the memory during the window and taking a fault. This is
confirmed to be architecturally sound.

Patch 5 removes the tlbi entirely. This has the benefit of
significantly reducing the cost of contpte_convert(). While testing
has demonstrated that this works as expected on Arm-designed CPUs, we
are still in the process of confirming whether it is architecturally
correct. I am requesting review while that process is on-going. Patch 5
would be dropped if it turns out to be architecturally unsound.

Another note is that the stage 2 TLB conflict handling is included as
patch 1 of this series. This patch could (and probably should) be sent
separately as it may be useful outside this series, but is included for
reference.

Thanks,
Miko

Mikołaj Lenczewski (5):
  arm64: Add TLB Conflict Abort Exception handler to KVM
  arm64: Add BBM Level 2 cpu feature
  arm64: Add errata and workarounds for systems with broken BBML2
  arm64/mm: Delay tlbi in contpte_convert() under BBML2
  arm64/mm: Elide tlbi in contpte_convert() under BBML2

 Documentation/arch/arm64/silicon-errata.rst |  32 ++++
 arch/arm64/Kconfig                          | 164 ++++++++++++++++++++
 arch/arm64/include/asm/cpufeature.h         |  14 ++
 arch/arm64/include/asm/esr.h                |   8 +
 arch/arm64/kernel/cpufeature.c              |  37 +++++
 arch/arm64/kvm/mmu.c                        |   6 +
 arch/arm64/mm/contpte.c                     |   3 +-
 arch/arm64/mm/fault.c                       |  27 +++-
 arch/arm64/tools/cpucaps                    |   1 +
 9 files changed, 290 insertions(+), 2 deletions(-)

-- 
2.45.2


