Return-Path: <linux-doc+bounces-48189-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6C0ACEE00
	for <lists+linux-doc@lfdr.de>; Thu,  5 Jun 2025 12:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51E461891A13
	for <lists+linux-doc@lfdr.de>; Thu,  5 Jun 2025 10:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E9121C177;
	Thu,  5 Jun 2025 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y5V1T2Hw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076EC218AC1
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120606; cv=none; b=quJnPnxHnc3Y5X8a5b8n21923ly1WB3/GlEdJ1kyp3VhZ+s5UY55lM3ZamuNeNleD7d224I8qMvcvwEakwW3zq8IRQYsAOBtfj9S/4/iN6DVlbcbzGFGEw5fEW0GnKZQWwbjROlTG1cnkmCSRhs5b1RiXiOnPnxRCif9VU85lnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120606; c=relaxed/simple;
	bh=NVy82iJ/QLGDAl8W6Sh4eSwnTCJwtHJ0GXadcsGR9Xc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d2zYD2/Q0uYdGG+qQNu5BhWMtfmsXasRdtPGL+Shq47/+goTJZr3F7QrAVraNJBQOxwALnC3xCy3YGcHN5qcC0baA40epH63dlswUcC3QxN5Knq3oZXSeFDiPzdHtj+RAWQ37Vlw+7x4Iw/s7ia0T6yzEuBk7iJwraWswyYrk2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y5V1T2Hw; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-3a5257748e1so610767f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Jun 2025 03:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120602; x=1749725402; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MOtEpU/QTXhqeOr4QGO8o+Hgp7yMZJ+Usq43ricq8a4=;
        b=Y5V1T2HwTJEyGCj9ynJ8XzWp2wHgSCHvu766vq+NlfQlOTT1Pue9mizb222k41BZmo
         fHdsW6/ljMMbnoUFOOk+KLe8xT8FQuO5JUmIz3B1zTbyZhuE9mKQUX0eJFM7XXpL+Siv
         0INx8ahm9bEkKxXP29kzQcvc9z0+jp14uWPf4fiNWS4h6ahWVTdLEojdwVUVrlre/UPR
         YaqynaNItOlxVPaLJzjUELrKRbWjbsflwQ/g2vWhK3GVNyl3aG+Oz3B3Jf2HMCCKZU0C
         Sjo1Qy/o+1ifQydAEfZBJH0E5DZfeVKHpsvzWm+4ZU6ViGIiVdwtr6xQNdsyecjiGLUR
         f3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120602; x=1749725402;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOtEpU/QTXhqeOr4QGO8o+Hgp7yMZJ+Usq43ricq8a4=;
        b=CW46mLiC7lkTttIZz6y2wNVv3ECClFz7WEeZWwk/J/CRhxVYBJvsMzm2IDXFSRrvqs
         VSIegJJmbpU5aRxocLNQXuRsvpUpZ+99hnKBtcoyP2BgG9zAE3D54/KFvAzWvy9pGB4S
         qjZwJrIhn2fBGU4yUNDHuKBxtS7cGvKxa9O9r/wRSHaYHX/g5vgNlhN6AMtXTAkZpoCv
         U46QViH4wvuNU+WgYoqYLfSBZ4dnttXuWajtO+mI05LOabFRwt9vzF4VNvPN5fmeRraH
         f2SjsLN0eiCtN7kHVRZA9cVYQ1531JIl9v+4uIUU3bD+fn8OXgL3NnVUM7hbzIoPsQC+
         iF0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfpxwdlrPI8zINBfIutG9CYy8uQYbpdL7wZm7x1eixn5aTiJIXRd8ZBDNVf6gStT3VunAiav5KgZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNsV20PsLmyOsqTQIlEtE9XKX7UZUMm9ImOydErglrMLLSRzCb
	SLcDAxDu0S5sMkymXHkSn6ObxPO+mFjUyPqFkZhBbMX+1GzS2pGH1jgcc1Ah3Pu15ZI=
X-Gm-Gg: ASbGnctsr6OpVjj8ioBDaqw8sCqUY9POji5ro5LysMx8zLm9YHdWlMmt3lr8FHfH42+
	7pbegh7Ul0aZtgaUQtbi7XmdrscZUsd5htu42IFhaVj09USeyARKVeGV0uI9Rd8JwHQ4IKmaOpu
	ttGXtLhkpyWuHaofKRVvMA8HOSfiC0HsNGy1YrRI5gFdfNZuhxUJ8dKzq3InWwFYW/iyjBMXYQs
	YpbGiZokVGOwmz6FlMGif7f4cgMTvnZRVMUsrFCfjytU5wKlJtOMfzkwboBHZZZiOu78bQhdUu/
	HWtanY1wQPis/MPiP26FKIFleHmt66xof81x9tHJVItp8Bdsx3S5EuVEJkyp
X-Google-Smtp-Source: AGHT+IFIuwqPu0X5eoCscdhdRejVlPb11XtHePijaNQ8MuQwLUyBUWJS/pTWuyRwgt/m/n/fycau1w==
X-Received: by 2002:a05:6000:4009:b0:3a4:febd:39f2 with SMTP id ffacd0b85a97d-3a51d9661b7mr4769796f8f.37.1749120602299;
        Thu, 05 Jun 2025 03:50:02 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:00 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 00/10] perf: arm_spe: Armv8.8 SPE features
Date: Thu, 05 Jun 2025 11:48:58 +0100
Message-Id: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABp2QWgC/33OTQrCMBAF4KtI1kYm6Y+pK+8hUsZk0ka0LUkpS
 undTQuiLuryDcz33sgCeUeBHTYj8zS44NomhmS7YbrGpiLuTMxMgswgEZJf8U6Bd+Qtt4R9GTo
 qyfY8z7WxqVGWioLF786TdY9FPp1jrl3oW/9cigYxX99msmoOggOXqCWYFPZaq+PNNejbXeuru
 WMBMsj/A8akCkhRqjLxDcyrBvlZksliHZIRQhBYXBAN5PgDTdP0AtFtJ35JAQAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Support 3 new SPE features: FEAT_SPEv1p4 filters, FEAT_SPE_EFT extended
filtering, and SPE_FEAT_FDS data source filtering. The features are
independent can be applied separately:

  * Prerequisite sysreg changes - patches 1 - 2
  * FEAT_SPEv1p4 - patch 3
  * FEAT_SPE_EFT - patch 4
  * FEAT_SPE_FDS - patches 5 - 8
  * FEAT_SPE_FDS Perf tool changes - patches 9 - 11

The first two features will work with old Perfs but a Perf change to
parse the new config4 is required for the last feature.

To: 

---
Changes in v3:
- Use PMSIDR_EL1_FDS instead of 1 << PMSIDR_EL1_FDS_SHIFT
- Add VNCR offsets
- Link to v2: https://lore.kernel.org/r/20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org

Changes in v2:
- Fix detection of FEAT_SPE_FDS in el2_setup.h
- Pickup Marc Z's sysreg change instead which matches the json
- Restructure and expand docs changes
- Link to v1: https://lore.kernel.org/r/20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org

---
James Clark (10):
      arm64: sysreg: Add new PMSFCR_EL1 fields and PMSDSFR_EL1 register
      perf: arm_spe: Support FEAT_SPEv1p4 filters
      perf: arm_spe: Add support for FEAT_SPE_EFT extended filtering
      arm64/boot: Enable EL2 requirements for SPE_FEAT_FDS
      KVM: arm64: Add trap configs for PMSDSFR_EL1
      perf: Add perf_event_attr::config4
      perf: arm_spe: Add support for filtering on data source
      tools headers UAPI: Sync linux/perf_event.h with the kernel sources
      perf tools: Add support for perf_event_attr::config4
      perf docs: arm-spe: Document new SPE filtering features

 Documentation/arch/arm64/booting.rst      |  11 ++++
 arch/arm64/include/asm/el2_setup.h        |  14 +++++
 arch/arm64/include/asm/sysreg.h           |   7 +++
 arch/arm64/include/asm/vncr_mapping.h     |   2 +
 arch/arm64/kvm/emulate-nested.c           |   1 +
 arch/arm64/kvm/sys_regs.c                 |   1 +
 arch/arm64/tools/sysreg                   |  13 +++-
 drivers/perf/arm_spe_pmu.c                | 100 +++++++++++++++++++++++++++++-
 include/uapi/linux/perf_event.h           |   2 +
 tools/include/uapi/linux/perf_event.h     |   2 +
 tools/perf/Documentation/perf-arm-spe.txt |  97 ++++++++++++++++++++++++++---
 tools/perf/tests/parse-events.c           |  14 ++++-
 tools/perf/util/parse-events.c            |  11 ++++
 tools/perf/util/parse-events.h            |   1 +
 tools/perf/util/parse-events.l            |   1 +
 tools/perf/util/pmu.c                     |   8 +++
 tools/perf/util/pmu.h                     |   1 +
 17 files changed, 273 insertions(+), 13 deletions(-)
---
base-commit: ec7714e4947909190ffb3041a03311a975350fe0
change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99

Best regards,
-- 
James Clark <james.clark@linaro.org>


