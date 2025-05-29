Return-Path: <linux-doc+bounces-47751-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B037AC7D06
	for <lists+linux-doc@lfdr.de>; Thu, 29 May 2025 13:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E4027AF028
	for <lists+linux-doc@lfdr.de>; Thu, 29 May 2025 11:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475D028EA41;
	Thu, 29 May 2025 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dj0GVNNq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2257128E60A
	for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518392; cv=none; b=Dl5WpYv3X3wI1u7ljLgfh/pWi/jIO3lsKQQPCPRXECMN0O3XgSgccr9Uuzx0YFRnAOsmN2Zz5ogQeiWan/IK7EPLoVFaPug/HB0LYw2NgebZnXG6Ey9uwUAELp8iTI0UiamIdsW89nZzA+NBCUMIz3fc2jWHMX9ECuDl8GI85Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518392; c=relaxed/simple;
	bh=bh4MgnxAaRyek2UdQKghPpoTWMGgrTm8WvxljGcyuvo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UZO5y/jkbVs2tPN1MC4lMBDLJ1kidLuiTjI203AwPTwmwrOzic6L4cpoqzR/0mMqloU+67B+jx5PLiZkvjKZ3N13hawTLHToOcbLz0PNqHjQQY5CpluQVg+XhfsyAMbVnD33xaVJKY6Zvcm4rFza/ELutiAF4VrWtILsGFGIsL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dj0GVNNq; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-441ab63a415so9350165e9.3
        for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 04:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518388; x=1749123188; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9RGEjbS+3C/e9OMoWBvhsdf9eFJydSpRbxivnh7opTI=;
        b=Dj0GVNNqb0n/uYbHCxZzMflMzbgSmDwQKEnSNwcylR2BIkLiklb5NnsY3fN3SJ9WU7
         oSGdVxKXeWFluLY6dp7ClPcnnCVCp4LVp9nxSPxg5B+mylQ53ljWGrbJeos4CXrskB1L
         Mhe9AAXOIB4+gUzwNbhXmVTzNxt3ZqooTvEA15zpcHtKw7mz9iCIG/CpqWMVRDUcbOty
         7CkxJLqXaSF/XhdS3d94b+IOXbHIrLCbHIZBWDTbeYP5OMDMqo3lOCfj1dLh9Ix59HKF
         8T3swe8+DqB+dDwoSD01HmT/r/ynLG0zdPNulLNyqcyrESpsrG8NyOB6PsmwZfpakvPx
         Lleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518388; x=1749123188;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RGEjbS+3C/e9OMoWBvhsdf9eFJydSpRbxivnh7opTI=;
        b=aQrL1oq98qLBbYrznZ/oejpSvMBdxifHU6MGNlO56Q5BGnVWH+AaxZ/dfzrE7+NXvX
         o+mAdiM2pxOr/Kc42lUZjZoSalqK37Pl2f388naUzgQY5t39+l2GOtq6HNtQWjtifXH4
         itI2m44lTh/sObZEzgQ1vwle2Z0RQOkiuI5j9hjcfYp2uKuYbh7uK0cgnobXFj1Fu065
         YQ4tQt2I6/rHspEoOPOs2+GgERvFcP3YUGY2QjPoRJQ28lyYqeYW43JycIMjLuI64Hij
         Qi8PzHx0yZkaBFTsfLTGcz1lI2zjJYVvDE5b3bajPKtcfgggwGpluLI3wr7SbCG4ag6r
         56lg==
X-Forwarded-Encrypted: i=1; AJvYcCVoDRM6oftCXjJkEiKa+dplL4M05HPbFxoDlsrVv8GoIwWNWiskxUAXw4zaYXUKJ38Vgodp24DhHiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUsyAo8hjUdHWzRi7bq/ASGBlL3fPz/SMNXRLEA9s/2cc+PxCX
	lBZGmk1hyA+fDGFRQ1wFLS7EabWzyTo25WOa9VjTfXiuEIzKXgPIu+a8iH9z6bZ1QMI=
X-Gm-Gg: ASbGnctbZc5yEi7u5wfezD6Z7eHdLzCFW1ZcUm2pgZdBtGxWADHbLDEcsK8unKp4ND7
	foQrEcsEGKRgP6LumbXRjQNIlnTx5nZRJk2hop3A9LX+P+UskRCdQMSSfCSSEUdza16owCRApAD
	gpOLfYYZXDuBZ6aBa3dSOAljNnw/TzRc62XUsv6hFPxb45HPF6hP3xt14nxtwzII/8cYwrRQizq
	3al5bIqk1G/z7/qZpZyvcs/v7fn37EXdIeDemD2AyWF1q1plyhV0sznHBLhXT+QpzPDeuLEjovE
	H2Ra1w/5SxNfrdudCp12+h8TzcnTSjbVkpNrkvZnIty21n4SNh49c6ml5H96
X-Google-Smtp-Source: AGHT+IFDz2Nzk5rV8H17aE5jP5Yo1dXjiKY7Wt+ZcHiSvBCRbRuqUmfh+W28PJ1soWP3lufeYbHSmw==
X-Received: by 2002:a05:600c:3482:b0:441:b00d:e9d1 with SMTP id 5b1f17b1804b1-450d055ba9fmr18892675e9.2.1748518388273;
        Thu, 29 May 2025 04:33:08 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:07 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 00/11] perf: arm_spe: Armv8.8 SPE features
Date: Thu, 29 May 2025 12:30:21 +0100
Message-Id: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1FOGgC/33N0QqDIBTG8VcJr+c4mjXb1d5jRIgey7FpaMRG9
 O6zYLCb7fJ/4Py+hSSMDhM5FwuJOLvkgs/BDwXRg/I9UmdyEw68gpJxelMPTHTEaKlFNXVpxA7
 tROtaGyuMtNg0JH+PEa177vK1zT24NIX42odmtl0/ZvnTnBkFypXmYASctJaXu/MqhmOI/baxA
 xXU/wFjhASUKGTFvoF2Xdc3cIeZJgABAAA=
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
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>
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

---
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

Marc Zyngier (1):
      arm64: sysreg: Update PMSIDR_EL1 description

 Documentation/arch/arm64/booting.rst      |  11 ++++
 arch/arm64/include/asm/el2_setup.h        |  14 +++++
 arch/arm64/include/asm/sysreg.h           |   7 +++
 arch/arm64/kvm/emulate-nested.c           |   1 +
 arch/arm64/kvm/sys_regs.c                 |   1 +
 arch/arm64/tools/sysreg                   |  45 ++++++++++++--
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
 16 files changed, 301 insertions(+), 15 deletions(-)
---
base-commit: 90b83efa6701656e02c86e7df2cb1765ea602d07
change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99

Best regards,
-- 
James Clark <james.clark@linaro.org>


