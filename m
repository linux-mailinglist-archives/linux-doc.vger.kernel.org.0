Return-Path: <linux-doc+bounces-94770-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id acS4JOaIR2pFaQAAu9opvQ
	(envelope-from <linux-doc+bounces-94770-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 12:03:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E452700F07
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 12:03:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=VTHrluJO;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94770-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94770-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC6F83034228
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 10:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD783B5820;
	Fri,  3 Jul 2026 10:02:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B811358388;
	Fri,  3 Jul 2026 10:02:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072945; cv=none; b=naTVsvxQEOGWAPHSffmV7Lm7CPag5vecbPqv2jUFWPLpRA1005YFUrMmokDRpXq30EOtxrB1yahT17OY92x5qpGNGLGhZ8V5mqnSPbcjtR8BoAEB7tJr94L2u3LrCVHFy1WO4N3uY5GlRt3tOc9+ReXvX2HZYdK7XJX36i6Vfq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072945; c=relaxed/simple;
	bh=48mdkA37dTy8784W7L9yLGxdd9aNk5qQK+Ij+77ual4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D6JThRWZetUJr6C1zr9ywb/wog8mmp5Gi37dYOghSWzA2Eugq7GybbFNacpniEvfFrRP3AgPJVj7ntqJVSotjBGl6AuFravEZfHsG747cYjik0SCdtZEsbbwaQo1+2cI7ijRdyeT4VHrZv17gxkTxeg9rHmpZoT58BjJ3/iMsas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=VTHrluJO; arc=none smtp.client-ip=113.46.200.217
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+Be4tamqNPytL0DlmMhHstiAdEjMJ3KYct4tTEDAvpQ=;
	b=VTHrluJOOle+Ae3JMHD/J98W7USvFa5ZhBV07q33gTWT38NDnRoeqx/whESEPj+t9PtnB7Nk1
	LZTFTSeUF4sDuXS0W2YLq68pWgvr1SgBq7oCFHTMsFh8l7tsqguh4UaUVv5QnzofzdIxskFYf87
	bjQi0cY4kY+ISCFsNX0xwsQ=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gs8Fr4HkmzcZyF;
	Fri,  3 Jul 2026 17:53:20 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A78AA2012A;
	Fri,  3 Jul 2026 18:02:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 3 Jul
 2026 18:02:10 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <maz@kernel.org>, <ardb@kernel.org>,
	<ilias.apalodimas@linaro.org>, <oupton@kernel.org>, <joey.gouly@arm.com>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<oleg@redhat.com>, <mark.rutland@arm.com>, <lpieralisi@kernel.org>,
	<tglx@kernel.org>, <ada.coupriediaz@arm.com>, <anshuman.khandual@arm.com>,
	<ruanjinjie@huawei.com>, <ebiggers@kernel.org>, <broonie@kernel.org>,
	<mrigendra.chaubey@gmail.com>, <baohua@kernel.org>, <lucaswei@google.com>,
	<james.morse@arm.com>, <zengheng4@huawei.com>, <thuth@redhat.com>,
	<yang@os.amperecomputing.com>, <leo.bras@arm.com>, <Sascha.Bischoff@arm.com>,
	<james.clark@linaro.org>, <peterz@infradead.org>, <leitao@debian.org>,
	<ben.horgan@arm.com>, <punit.agrawal@oss.qualcomm.com>, <gshan@redhat.com>,
	<osama.abdelkader@gmail.com>, <fengchengwen@huawei.com>,
	<ryan.roberts@arm.com>, <yangyicong@hisilicon.com>, <kevin.brodsky@arm.com>,
	<kees@kernel.org>, <jeson.gao@unisoc.com>, <zhaoyang.huang@unisoc.com>,
	<ryotkkr98@gmail.com>, <wsw9603@163.com>, <pasha.tatashin@soleen.com>,
	<jeremy.linton@arm.com>, <schuster.simon@siemens-energy.com>,
	<osandov@fb.com>, <arnd@arndb.de>, <zhangpengjie2@huawei.com>,
	<smostafa@google.com>, <vladimir.murzin@arm.com>, <tabba@google.com>,
	<vdonnefort@google.com>, <kaleshsingh@google.com>, <jic23@kernel.org>,
	<timothy.hayes@arm.com>, <alexandru.elisei@arm.com>, <zenghui.yu@linux.dev>,
	<david@kernel.org>, <akpm@linux-foundation.org>, <ljs@kernel.org>,
	<memxor@gmail.com>, <qperret@google.com>, <chaitanyas.prakash@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-efi@vger.kernel.org>,
	<kvmarm@lists.linux.dev>
Subject: [PATCH 00/17] arm64: Support FEAT_NMI and Rework Exception Masking
Date: Fri, 3 Jul 2026 18:01:18 +0800
Message-ID: <20260703100135.2512312-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94770-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:maz@kernel.org,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:oupton@kernel.org,m:joey.gouly@arm.com,m:seiden@linux.ibm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:oleg@redhat.com,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:ada.coupriediaz@arm.com,m:anshuman.khandual@arm.com,m:ruanjinjie@huawei.com,m:ebiggers@kernel.org,m:broonie@kernel.org,m:mrigendra.chaubey@gmail.com,m:baohua@kernel.org,m:lucaswei@google.com,m:james.morse@arm.com,m:zengheng4@huawei.com,m:thuth@redhat.com,m:yang@os.amperecomputing.com,m:leo.bras@arm.com,m:Sascha.Bischoff@arm.com,m:james.clark@linaro.org,m:peterz@infradead.org,m:leitao@debian.org,m:ben.horgan@arm.com,m:punit.agrawal@oss.qualcomm.com,m:gshan@redhat.com,m:osama.abdelkader@gmail.com,m:fengchengwen@huawei.com,m:ryan.roberts@arm.com,m:yangyicong@hisilicon.com,m:kevin.brodsky@arm.com,m:kees@kernel.org,m:je
 son.gao@unisoc.com,m:zhaoyang.huang@unisoc.com,m:ryotkkr98@gmail.com,m:wsw9603@163.com,m:pasha.tatashin@soleen.com,m:jeremy.linton@arm.com,m:schuster.simon@siemens-energy.com,m:osandov@fb.com,m:arnd@arndb.de,m:zhangpengjie2@huawei.com,m:smostafa@google.com,m:vladimir.murzin@arm.com,m:tabba@google.com,m:vdonnefort@google.com,m:kaleshsingh@google.com,m:jic23@kernel.org,m:timothy.hayes@arm.com,m:alexandru.elisei@arm.com,m:zenghui.yu@linux.dev,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:memxor@gmail.com,m:qperret@google.com,m:chaitanyas.prakash@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-efi@vger.kernel.org,m:kvmarm@lists.linux.dev,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lwn.net,linuxfoundation.org,linaro.org,linux.ibm.com,huawei.com,redhat.com,gmail.com,google.com,os.amperecomputing.com,infradead.org,debian.org,oss.qualcomm.com,hisilicon.com,unisoc.com,163.com,soleen.com,siemens-energy.com,fb.com,arndb.de,linux.dev,linux-foundation.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[72];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,huawei.com:from_mime,huawei.com:dkim,huawei.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E452700F07

Hi all,

This patch series implements support for the ARMv8.8-A/v9.3-A
hardware NMI extension (FEAT_NMI), introducing the use of PSTATE.ALLINT
to manage superpriority interrupts on arm64.

Background and Current Status
-----------------------------

The hardware ecosystem is already mature and fully ready for FEAT_NMI:

- Production Hardware: Huawei's Kunpeng servers (such as the HIP12 based
  platforms) already feature native hardware support for FEAT_NMI.

- Emulation: QEMU has integrated robust FEAT_NMI emulation[1] support
  since 2024.

Despite the hardware readiness, upstream support for FEAT_NMI has been
delayed. Previous patch[2] attempts tried to bundle ALLINT management
directly into the existing DAIF abstraction layers. As Mark Rutland
pointed out[3], pretending ALLINT or pseudo-NMI (GIC PMR) is part of
DAIF creates convoluted, unmaintainable hacks that frequently fail to
handle complex edge cases correctly (such as state escape during
context switching).

Reworking Exception Masking (Mark's Feedback)
---------------------------------------------

Following Mark Rutland's strong recommendation ("We must clean up
the existing approach before we add the real NMI support"), this series
does not simply stack FEAT_NMI on top of the old framework. Instead, it
completely reworks how the arm64 kernel manages abstract and logical
exception masks.

Per Mark's guidelines, this series achieves the following architectural
improvements:

1. Entry/Exit Specific Helpers (a):

   Introduces abstract exception mask helpers specifically for exception
   boundaries. They handle unified unmask-at-entry and mask-at-exit
   behaviors. This decouples the entry/exit paths from raw DAIF
   manipulation. In this series, these helpers are first refactored to
   manage DAIF + PMR cleanly, preparing the ground before any FEAT_NMI
   code is introduced.

2. Logical Exception Mask Separation (b):

   Introduces a decoupled logical mask tracking mechanism that treats DAIF,
   PMR, and ALLINT as separate, distinct elements. This enables accurate
   irqflag tracking and debug assertions to save, restore, and validate all
   elements without forcing them to fake or pollute a traditional DAIF
   layout.

Production Bug Fixes & Integration
-----------------------------------

On top of this solid architectural foundation, this series adds the actual
support for FEAT_NMI (ALLINT management). Crucially, during baisc testing
and validation on production Kunpeng (HIP12) servers, we identified and
resolved several critical bugs.

The series is structured as follows:

- Patches 1-5: Clean up and rework the existing DAIF/PMR masking into
  separate logical exception helpers (Pre-requisite refactoring).

- Patches 6-17: Add FEAT_NMI support for ARM64, including specific
  stability fixes found on Kunpeng hardware and QEmu.

Any feedback, testing, or review, especially regarding the exception
masking refactoring, is highly appreciated.

[1]: https://lore.kernel.org/all/20240407081733.3231820-1-ruanjinjie@huawei.com/
[2]: https://lore.kernel.org/linux-arm-kernel/20221112151708.175147-1-broonie@kernel.org/
[3]: https://lore.kernel.org/linux-arm-kernel/Y5c9SLeJacLYHmP7@FVFF77S0Q05N/

Jinjie Ruan (5):
  arm64: Move DAIF macros to ptrace.h and use them centrally
  arm64: Rework exception masking into abstract logical mask
  arm64: entry: arm64: entry: Move DAIF masking for EL1 exit to C code
  arm64: entry: Add entry-specific helpers
  arm64: Introduce helpers for restoring standard exception masks

Lorenzo Pieralisi (1):
  irqchip/gic-v3: Implement FEAT_GICv3_NMI support

Mark Brown (11):
  arm64/booting: Document boot requirements for FEAT_NMI
  arm64/sysreg: Add definitions for immediate versions of MSR ALLINT
  arm64/hyp-stub: Enable access to ALLINT
  arm64/idreg: Add an override for FEAT_NMI
  arm64/cpufeature: Detect PE support for FEAT_NMI
  KVM: arm64: Hide FEAT_NMI from guests
  arm64/nmi: Manage masking for superpriority interrupts along with DAIF
  arm64/entry: Don't call preempt_schedule_irq() with NMIs masked
  arm64/irq: Document handling of FEAT_NMI in irqflags.h
  arm64/nmi: Add handling of superpriority interrupts as NMIs
  arm64/nmi: Add Kconfig for NMI

 Documentation/arch/arm64/booting.rst     |   6 +
 arch/arm64/Kconfig                       |  17 ++
 arch/arm64/include/asm/arch_gicv3.h      |   7 +-
 arch/arm64/include/asm/assembler.h       |  17 +-
 arch/arm64/include/asm/cpufeature.h      |   5 +
 arch/arm64/include/asm/cpuidle.h         |  30 ++-
 arch/arm64/include/asm/daifflags.h       | 144 --------------
 arch/arm64/include/asm/efi.h             |  22 ++-
 arch/arm64/include/asm/el2_setup.h       |  13 ++
 arch/arm64/include/asm/entry-common.h    |  11 +-
 arch/arm64/include/asm/exception_masks.h | 232 +++++++++++++++++++++++
 arch/arm64/include/asm/irq.h             |   2 +
 arch/arm64/include/asm/irqflags.h        |  10 +
 arch/arm64/include/asm/kvm_host.h        |   2 +-
 arch/arm64/include/asm/mmu_context.h     |   2 +-
 arch/arm64/include/asm/nmi.h             |  23 +++
 arch/arm64/include/asm/ptrace.h          |  11 +-
 arch/arm64/include/asm/sysreg.h          |   2 +
 arch/arm64/include/uapi/asm/ptrace.h     |   1 +
 arch/arm64/kernel/acpi.c                 |  14 +-
 arch/arm64/kernel/cpufeature.c           |  58 +++++-
 arch/arm64/kernel/debug-monitors.c       |   9 +-
 arch/arm64/kernel/entry-common.c         | 167 +++++++++++-----
 arch/arm64/kernel/entry.S                |   4 -
 arch/arm64/kernel/hibernate.c            |  10 +-
 arch/arm64/kernel/idle.c                 |   7 +-
 arch/arm64/kernel/irq.c                  |  36 +++-
 arch/arm64/kernel/machine_kexec.c        |   4 +-
 arch/arm64/kernel/pi/idreg-override.c    |   1 +
 arch/arm64/kernel/probes/kprobes.c       |   9 +-
 arch/arm64/kernel/process.c              |   7 +-
 arch/arm64/kernel/setup.c                |   4 +-
 arch/arm64/kernel/signal.c               |   2 +-
 arch/arm64/kernel/smp.c                  |  22 +--
 arch/arm64/kernel/suspend.c              |  15 +-
 arch/arm64/kernel/traps.c                |   2 +-
 arch/arm64/kvm/emulate-nested.c          |   6 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h  |   6 +
 arch/arm64/kvm/hyp/nvhe/host.S           |   4 +-
 arch/arm64/kvm/hyp/nvhe/hyp-init.S       |   3 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c       |   4 +-
 arch/arm64/kvm/hyp/vgic-v3-sr.c          |   6 +-
 arch/arm64/kvm/hyp/vhe/switch.c          |   6 +-
 arch/arm64/kvm/reset.c                   |   6 +-
 arch/arm64/mm/fault.c                    |   2 +-
 arch/arm64/mm/mmu.c                      |   6 +-
 arch/arm64/tools/cpucaps                 |   2 +
 drivers/firmware/psci/psci.c             |   7 +-
 drivers/irqchip/irq-gic-v3.c             | 152 +++++++++++++--
 include/linux/irqchip/arm-gic-v3.h       |   4 +
 50 files changed, 822 insertions(+), 320 deletions(-)
 delete mode 100644 arch/arm64/include/asm/daifflags.h
 create mode 100644 arch/arm64/include/asm/exception_masks.h
 create mode 100644 arch/arm64/include/asm/nmi.h

-- 
2.34.1


