Return-Path: <linux-doc+bounces-33428-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 908D39F8D26
	for <lists+linux-doc@lfdr.de>; Fri, 20 Dec 2024 08:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE3A3162D12
	for <lists+linux-doc@lfdr.de>; Fri, 20 Dec 2024 07:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6E51953A2;
	Fri, 20 Dec 2024 07:22:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9612B198A38;
	Fri, 20 Dec 2024 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734679375; cv=none; b=Zc1s8QgdKZqexmqeSOAR0iWC3J2zNZeqNdLj4UiIq05mwwCMrlRQCkhGeSpWXrxS2Yg82yHMXSDJBL0QqqCxmpuMzi3tJIGC9v+ZBkdDO5MkW9BQwlZAjryiwHcC0HS6mhpZVGr4wl2jVoHGMFbE5eTxi99vdpjPcE3IGfyseJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734679375; c=relaxed/simple;
	bh=Gn2WWXmUG7Ie70Wti1VNTfaIdCDmjzO3Km8MsTmV/uo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=raCLjkHIGv9yE/e1MEyrMnF5bk+EITTwTBdtP63cuhN0ac6SyteqWtdfVhKjJabeQ7VzDgd3IIhR/DJfqOoiHIJh5D/OWekDVcao4pHkfY9DJSMGsL1wr8uiRs1XEYbN8PNz6XJb12b+olejBjKPWnWOWffGaDp2bP3tiV5DfaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 000ED1480;
	Thu, 19 Dec 2024 23:23:21 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.51.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 941143F58B;
	Thu, 19 Dec 2024 23:22:47 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <robh@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Auger <eric.auger@redhat.com>,
	kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
Date: Fri, 20 Dec 2024 12:52:33 +0530
Message-Id: <20241220072240.1003352-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds fine grained trap control in EL2 required for FEAT_PMUv3p9
registers like PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 which are already
being used in the kernel. This is required to prevent their EL1 access trap
into EL2.

PMZR_EL0 register trap control i.e HDFGWTR2_EL2.nPMZR_EL0 remains unchanged
for now as it does not get accessed in the kernel, and there is no plan for
its access from user space.

I have taken the liberty to pick up all the review tags for patches related
to tools sysreg update from the KVM FGT2 V2 patch series posted earlier.

https://lore.kernel.org/all/20241210055311.780688-1-anshuman.khandual@arm.com/

Rob had earler mentioned about FEAT_FGT2 based trap control requirement for
FEAT_PMUv3p9 registers that are currently being used in kernel. The context
can be found here.

https://lore.kernel.org/all/20241216234251.GA629562-robh@kernel.org/

This series is based on v6.13-rc3

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mark Brown <robh@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: kvmarm@lists.linux.dev
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Anshuman Khandual (7):
  arm64/sysreg: Update register fields for ID_AA64MMFR0_EL1
  arm64/sysreg: Add register fields for HDFGRTR2_EL2
  arm64/sysreg: Add register fields for HDFGWTR2_EL2
  arm64/sysreg: Add register fields for HFGITR2_EL2
  arm64/sysreg: Add register fields for HFGRTR2_EL2
  arm64/sysreg: Add register fields for HFGWTR2_EL2
  arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9

 Documentation/arch/arm64/booting.rst |  18 +++++
 arch/arm64/include/asm/el2_setup.h   |  25 +++++++
 arch/arm64/tools/sysreg              | 103 +++++++++++++++++++++++++++
 3 files changed, 146 insertions(+)

-- 
2.25.1


