Return-Path: <linux-doc+bounces-41307-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D02A692F4
	for <lists+linux-doc@lfdr.de>; Wed, 19 Mar 2025 16:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 096EE1B82065
	for <lists+linux-doc@lfdr.de>; Wed, 19 Mar 2025 15:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EF31DE2B8;
	Wed, 19 Mar 2025 15:06:00 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A297C20C027;
	Wed, 19 Mar 2025 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396760; cv=none; b=gQ+VERZjOv/alvYJ0rBDlH4kDYnqPPYle7pEDgwEULyDawS4eI9smOsWD95nyvQgUKNDXeddgpV5VhH55MP+U+rWdrC7fkHT9PFeCC9ooNKml2ocxucL/MPAK1s94de+VciPkgJZxqh8yGi5mXOelRjQkXJBwmR2fQqfcws2fss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396760; c=relaxed/simple;
	bh=s5dOXpk0VFYDds64j2cyP6zAcA0wPsihQVX++7Zv22k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ucBk0FZt68AefGgqT3SLdNqJ+AOtnNZoEIpC0LHQctzpDR+N1zAwbkZTRlRpTQq7eEgaVLB2ckRYLSU8g8SVBH0MTD0Lij0Q79f264lh9Ro7p7RX0tpCxhsc7RpqmVYjE3AGf5I3Nnr8gKQJQ63e81TMyIvSNdlj0mvnbj0Jcys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21DE3106F;
	Wed, 19 Mar 2025 08:06:06 -0700 (PDT)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA8AC3F694;
	Wed, 19 Mar 2025 08:05:53 -0700 (PDT)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	suzuki.poulose@arm.com,
	yang@os.amperecomputing.com,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	jean-philippe@linaro.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	akpm@linux-foundation.org,
	ardb@kernel.org,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	james.morse@arm.com,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	baohua@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	mshavit@google.com,
	jsnitsel@redhat.com,
	smostafa@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
Subject: [PATCH v4 0/3] Initial BBML2 support for contpte_convert()
Date: Wed, 19 Mar 2025 15:05:31 +0000
Message-ID: <20250319150533.37440-2-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi All,

This patch series adds initial support for eliding break-before-make
requirements on systems that support BBML2 and additionally guarantee
to never raise a conflict abort.

This support elides a TLB invalidation in contpte_convert(). This
leads to a 12% improvement when executing a microbenchmark designed
to force the pathological path where contpte_convert() gets called.
This represents an 80% reduction in the cost of calling
contpte_convert().

This series is based on v6.14-rc5 (7eb172143d55).

Notes
======

Patch 1 implements an allow-list of cpus that support BBML2, but with
the additional constraint of never causing TLB conflict aborts. We
settled on this constraint because we will use the feature for kernel
mappings in the future, for which we cannot handle conflict aborts
safely.

Yang Shi has a series at [1] that aims to use BBML2 to enable splitting
the linear map at runtime. This series partially overlaps with it to add
the cpu feature. We believe this series is fully compatible with Yang's
requirements and could go first.

Due to constraints with the current design of the cpufeature framework
and the fact that our has_bbml2_noabort() check relies on both a MIDR
allowlist and the exposed mmfr2 register value, if an implementation
supports our desired bbml2+noabort semantics but fails to declare
support for base bbml2 via the id_aa64mmfr2.bbm field, the check will
fail.

Not declaring base support for bbml2 when supporting bbml2+noabort
should be considered an erratum [2], and a workaround can be applied in
__cpuinfo_store_cpu() to patch in support for bbml2 for the sanitised
register view used by SCOPE_SYSTEM. However, SCOPE_LOCAL_CPU bypasses
this sanitised view and reads the MSRs directly by design, and so an
additional workaround can be applied in __read_sysreg_by_encoding()
for the MMFR2 case.

[1]:
  https://lore.kernel.org/linux-arm-kernel/20250304222018.615808-1-yang@os.amperecomputing.com/

[2]:
  https://lore.kernel.org/linux-arm-kernel/3bba7adb-392b-4024-984f-b6f0f0f88629@arm.com/

Changelog
=========

v4:
  - rebase onto v6.14-rc5
  - switch from arm64 sw feature override to hw feature override
  - reintroduce has_cpuid_feature() check in addition to MIDR check

v3:
  - https://lore.kernel.org/all/20250313104111.24196-2-miko.lenczewski@arm.com/
  - rebase onto v6.14-rc4
  - add arm64.nobbml2 commandline override
  - squash "delay tlbi" and "elide tlbi" patches

v2:
  - https://lore.kernel.org/all/20250228182403.6269-2-miko.lenczewski@arm.com/
  - fix buggy MIDR check to properly account for all boot+late cpus
  - add smmu bbml2 feature check

v1:
  - https://lore.kernel.org/all/20250219143837.44277-3-miko.lenczewski@arm.com/
  - rebase onto v6.14-rc3
  - remove kvm bugfix patches from series
  - strip out conflict abort handler code
  - switch from blocklist to allowlist of bmml2+noabort implementations
  - remove has_cpuid_feature() in favour of MIDR check

rfc-v1:
  - https://lore.kernel.org/all/20241211154611.40395-1-miko.lenczewski@arm.com/
  - https://lore.kernel.org/all/20241211160218.41404-1-miko.lenczewski@arm.com/

Mikołaj Lenczewski (3):
  arm64: Add BBM Level 2 cpu feature
  iommu/arm: Add BBM Level 2 smmu feature
  arm64/mm: Elide tlbi in contpte_convert() under BBML2

 .../admin-guide/kernel-parameters.txt         |  3 +
 arch/arm64/Kconfig                            | 11 +++
 arch/arm64/include/asm/cpucaps.h              |  2 +
 arch/arm64/include/asm/cpufeature.h           |  5 ++
 arch/arm64/kernel/cpufeature.c                | 68 +++++++++++++++++++
 arch/arm64/kernel/pi/idreg-override.c         |  2 +
 arch/arm64/mm/contpte.c                       |  3 +-
 arch/arm64/tools/cpucaps                      |  1 +
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  3 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  3 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  4 ++
 11 files changed, 104 insertions(+), 1 deletion(-)

-- 
2.48.1


