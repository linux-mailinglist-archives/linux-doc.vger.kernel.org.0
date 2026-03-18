Return-Path: <linux-doc+bounces-80052-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O9nGesPu2kSegIAu9opvQ
	(envelope-from <linux-doc+bounces-80052-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 21:49:47 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CB92C2A2B
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 21:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C139431088BE
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 20:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D34D306D2A;
	Wed, 18 Mar 2026 20:49:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A881D15B998;
	Wed, 18 Mar 2026 20:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773866954; cv=none; b=M3rvWCyfmSoWAQlB76xlwo4cjMq+RcZSNjAPQ68dvYyyrbpcwcoohpKDFufhCtVoYZdOYMz0P7872hgay/Oklp1SY4jtKTwabbpuroVbKWN3jQVdr11IyZCDJNoeHSuIX2dezpox2wm/LkUudFNt7+Oyrac2oClOl6w5E9RGYpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773866954; c=relaxed/simple;
	bh=8H96j8MpMDHKAiWBBFwEZfm8yfzmLh+gZJABXNxhdnE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZzG/ymYNODi8jwrtDLlA29FzcB5mf2dS+8yc5+pxIPjkoKRAruI5tmalKxKD5GlukUA6/90R1MfL+y06SV1e0Pajo8kPjP0f1TAnJdTrTdw8nPGuyl4X65ObasQpeWBYQoH4CQaTZrgyQPzOh95myHyxBg10YyGS5wUuOEOlmt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 982BE1BF7;
	Wed, 18 Mar 2026 13:49:04 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB1413F7BD;
	Wed, 18 Mar 2026 13:49:08 -0700 (PDT)
From: Ahmed Tiba <ahmed.tiba@arm.com>
Subject: [PATCH v3 00/10] cover: ACPI: APEI: share GHES CPER helpers and
 add DT FFH provider
Date: Wed, 18 Mar 2026 20:47:57 +0000
Message-Id: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-0-48e6a1c249ef@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH4Pu2kC/5WOywrCMBBFf6VkbUpm2prqyv8QKWkedsA+SEpVS
 v/dpCCuXZ4Lc86sLFhPNrBztjJvFwo0DhGKQ8Z0p4a75WQiMxR4FIiCz+NEOnDV9TO1ArhXoXG
 ua5TvGxpm6wf1aJLJPnnrjNHSaalVy6Jx8tbRa69db5E7CvPo33t8gbSmTgUIEgDrssqhhhLgx
 CEFrcljU11iKtdjz5Jiwe/Z/+8tyAUvSukUGllU0P7M27Z9AHYh56MbAQAA
To: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-cxl@vger.kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, Michael.Zhao2@arm.com, robh@kernel.org, 
 linux-arm-kernel@lists.infradead.org, Dmitry.Lamerov@arm.com, 
 rafael@kernel.org, conor@kernel.org, will@kernel.org, bp@alien8.de, 
 catalin.marinas@arm.com, krzk+dt@kernel.org, linux-doc@vger.kernel.org, 
 mchehab+huawei@kernel.org, tony.luck@intel.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773866948; l=3635;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=8H96j8MpMDHKAiWBBFwEZfm8yfzmLh+gZJABXNxhdnE=;
 b=JTCNw0u4VK3lWeh3j7wcnlPeknCrSNSYJngPUYMeCsJEGtFYOHF/AarjvAxbMEKDU/3mBtRbo
 RbZ0vaNAnciCABFEvLigpypWIk7EeOiJNW/mqZw9zNvhejqZi1HLOmm
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80052-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt,huawei];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmed.tiba@arm.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.396];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: D3CB92C2A2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is v3 of the GHES refactor series. The goal is to split the GHES
CPER handling into shared helpers so the same firmware-first CPER flow
can be reused by a DT-based provider, while keeping the early patches as
mechanical moves and addressing the review comments on naming, driver
integration, and build coverage.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
Changes in v3:
- Fixed the new ghes_cper.h header comment and kept the original
  copyrights.
- Added <linux/bitfield.h> to fix the kernel test robot build failure.
- Renamed the binding/compatible and DT-side naming to ras-cper.
- Switched the DT provider to generic firmware property accessors.
- Replaced atomic source IDs with IDA.
- Updated IRQ/error/resource handling as suggested in review
  (platform_get_irq(), dev_err_probe(), devm platform ioremap
  helpers).
- Removed the ARM64 dependency and fixed Kconfig/build coverage.
- Clarified comments and kept the early move patches mechanical.
- Link to v2: https://lore.kernel.org/r/20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com

Changes in v2:
- Dropped the proposed "estatus core" and kept GHES naming/flow intact
  (per Borislav Petkov).
- Re-sliced the series into smaller mechanical steps (per Mauro Carvalho Chehab).
- Minor DT binding fixes based on Krzysztof Kozlowski's feedback.
- Removed fixmap slot usage from the DT FFH driver (per Will Deacon).

Series structure:
- Patches 1-8 are mechanical moves only and do not change behavior.
- Patch 9 wires the shared helpers back into GHES.
- The DT firmware-first CPER buffer provider is added in the final patches.
- "ACPI: APEI: introduce GHES helper" is internal build glue only
  and does not introduce a new user-visible configuration option.

- Link to v1: https://lore.kernel.org/r/20251217112845.1814119-1-ahmed.tiba@arm.com

---
Ahmed Tiba (10):
      ACPI: APEI: GHES: share macros via a private header
      ACPI: APEI: GHES: move CPER read helpers
      ACPI: APEI: GHES: move GHESv2 ack and alloc helpers
      ACPI: APEI: GHES: move estatus cache helpers
      ACPI: APEI: GHES: move vendor record helpers
      ACPI: APEI: GHES: move CXL CPER helpers
      ACPI: APEI: introduce GHES helper
      ACPI: APEI: share GHES CPER helpers
      dt-bindings: firmware: add arm,ras-cper
      RAS: add firmware-first CPER provider

 Documentation/admin-guide/RAS/main.rst             |   18 +
 .../devicetree/bindings/firmware/arm,ras-cper.yaml |   71 ++
 MAINTAINERS                                        |    6 +
 drivers/Makefile                                   |    1 +
 drivers/acpi/Kconfig                               |    4 +
 drivers/acpi/apei/Kconfig                          |    1 +
 drivers/acpi/apei/apei-internal.h                  |   10 +-
 drivers/acpi/apei/ghes.c                           | 1024 +------------------
 drivers/acpi/apei/ghes_cper.c                      | 1027 ++++++++++++++++++++
 drivers/ras/Kconfig                                |   11 +
 drivers/ras/Makefile                               |    1 +
 drivers/ras/cper-esource.c                         |  257 +++++
 include/acpi/ghes.h                                |   10 +-
 include/acpi/ghes_cper.h                           |  152 +++
 include/cxl/event.h                                |    2 +-
 15 files changed, 1560 insertions(+), 1035 deletions(-)
---
base-commit: 2d1373e4246da3b58e1df058374ed6b101804e07
change-id: 20260220-topics-ahmtib01-ras_ffh_arm_internal_review-bfddc7fc7cab

Best regards,
-- 
Ahmed Tiba <ahmed.tiba@arm.com>


