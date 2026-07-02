Return-Path: <linux-doc+bounces-94685-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3pGNME22RmoPcAsAu9opvQ
	(envelope-from <linux-doc+bounces-94685-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 21:04:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 596396FC60E
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 21:04:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amazon.com header.s=amazoncorp2 header.b=M2CMAYer;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94685-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94685-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amazon.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1A8B3001331
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 19:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F54E381AE4;
	Thu,  2 Jul 2026 19:04:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DFB21146C;
	Thu,  2 Jul 2026 19:04:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019082; cv=none; b=bQIngk3t4LM2dAJS6Pw1f9Yx6Lhgr1RhwC/Z6s3r1dkpTfygLbDShmsTPO0r9x1wbcfxo5NKTu8X9Xib3BU9KUoigreU1ytSeB7W/sYKcI4s0sLqycPeK4aQscFCb5AuG8glxv9SieumHtAthHb7pXxXlOtzPUUafKkHbcuCWvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019082; c=relaxed/simple;
	bh=mRvOjmQ3RQRqQdoIlv4cZUG4hR3GzBK+2cXmNalcs5M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EMs3XbLfN+PU5ZOdY6JvqtA+4oRSiEELA1GTlHWdRUFJK6ZT8OzuKbrP8c2lZzFtBA5OUq9iTsUs+8xeUKSs8cg7qvE9Txdmy0JeBfk++leW3rOx0XfeqJiN6dsUN2kMmgjrwUXwHkWTsVO81yFp1/ZgHZ2jkpzvVHcZwMHtVLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=M2CMAYer; arc=none smtp.client-ip=44.245.243.92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1783019079; x=1814555079;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2F0L/XUiTLM3A8G0VJGA94FT1+KmNQOQgpGnjoI3Xec=;
  b=M2CMAYerud9xv9oPD0+0rYtUfvtHhdWjDoxxgNIJa4syR2uEPOYXc3gL
   CJbCI8EmfWGa6DToP2giBIcQUbBuhYavuxfGc5EYOieSg8D/WNFRaSBl3
   6Ui76QPpETExcGVl6Kuyit2YGH7c1vvYugodPN0S/m4YyNlydFLAiUgJt
   K8VlSU3MVO8fB0J6jeXBKekq66YeVV1AaBGfLlZ1HUzg52B9oYHOTYq0U
   nacytwfZb1G+mLmFg0gC/7VFdqmJhS23Avu0ee1YUHe+ySCWZtTlm7dLe
   TIRY4HN3XXTMfj7dConHtxEnMk+EjFIQzVpcXIGA/N2rQcKMZ5zBQynvc
   Q==;
X-CSE-ConnectionGUID: RUCOIRJSTHavSfOQXFTPmg==
X-CSE-MsgGUID: vAdo8kNJQSCmRTWkKIoTVw==
X-IronPort-AV: E=Sophos;i="6.25,144,1779148800"; 
   d="scan'208";a="22450114"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 19:04:39 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:3819]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.1.125:2525] with esmtp (Farcaster)
 id 76b56ee0-2128-4c30-8bc9-732e61c13d37; Thu, 2 Jul 2026 19:04:39 +0000 (UTC)
X-Farcaster-Flow-ID: 76b56ee0-2128-4c30-8bc9-732e61c13d37
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 2 Jul 2026 19:04:39 +0000
Received: from dev-dsk-congkai-2a-df9e8fab.us-west-2.amazon.com
 (172.23.251.204) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43; Thu, 2 Jul 2026
 19:04:38 +0000
From: Congkai Tan <congkai@amazon.com>
To: Oliver Upton <oupton@kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
CC: Congkai Tan <congkai@amazon.com>, Marc Zyngier <maz@kernel.org>, "Joey
 Gouly" <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Haris Okanovic <harisokn@amazon.com>, Geoff Blake
	<blakgeof@amazon.com>, Stanislav Spassov <stanspas@amazon.de>,
	<kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
Date: Thu, 2 Jul 2026 19:04:18 +0000
Message-ID: <20260702190421.420992-1-congkai@amazon.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D045UWC004.ant.amazon.com (10.13.139.203) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-10.66 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	WHITELIST_SPF_DKIM(-3.00)[amazon.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94685-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:oupton@kernel.org,m:kvmarm@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:congkai@amazon.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:harisokn@amazon.com,m:blakgeof@amazon.com,m:stanspas@amazon.de,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[congkai@amazon.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[congkai@amazon.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 596396FC60E

Today when the perf tool runs in a guest on cores with PMUv3p4, it fails
to parse the default metrics with "Failure to read '#slots'", since perf
can only read 0 from sysfs caps/slots, which is backed by PMMIR_EL1.SLOTS
that KVM traps as RAZ/WI.

Taking into account backward compatibility and heterogeneous systems, the
exposure of PMMIR_EL1.SLOTS is gated behind a new vCPU feature flag:

- Patch 1 adds the new flag KVM_ARM_VCPU_PMU_V3_STRICT. When set, KVM does
  not create a default PMU during vCPU init, and the VMM must select one
  explicitly via KVM_ARM_VCPU_PMU_V3_SET_PMU before the first KVM_RUN.
- Patch 2 exposes PMMIR_EL1.SLOTS of the selected PMU under the flag, and
  adds userspace get/set for PMMIR_EL1 so that SLOTS can be reset to 0
  for backward compatibility.
- Patch 3 stops masking STALL_SLOT* in PMCEID1 under the flag.

When the flag is not set, behaviors are unchanged.

v1: https://lore.kernel.org/r/20260601193954.2103455-1-congkai@amazon.com

v1 -> v2 changes:
 - Gate the whole feature behind a new KVM_ARM_VCPU_PMU_V3_STRICT vCPU
   feature flag, instead of unconditionally exposing PMMIR_EL1.SLOTS.
 - When the flag is set, skip creating a default PMU during vCPU init.
 - Split the PMCEID1 unmask into its own patch, also gated by the flag.
 - Snapshot SLOTS into a new field pmmir_slots in kvm_arch during the
   handling of KVM_ARM_VCPU_PMU_V3_SET_PMU when the flag is set;
   access_pmmir()/get_pmmir() return it and set_pmmir() only accepts the
   SLOTS field (rejecting other bits with -EINVAL).
 - Add get_user and set_user for PMMIR_EL1 to support setting the SLOTS
   back to 0, and add PMMIR_EL1 to the get-reg-list selftest.

Congkai Tan (3):
  KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature
  KVM: arm64: Expose PMMIR_EL1.SLOTS under strict PMUv3 UAPI
  KVM: arm64: Advertise STALL_SLOT* in PMCEID1 under strict PMUv3 UAPI

 Documentation/virt/kvm/api.rst                   |  5 ++
 arch/arm64/include/asm/kvm_host.h                |  5 +-
 arch/arm64/include/uapi/asm/kvm.h                |  1 +
 arch/arm64/kvm/arm.c                             | 18 +++++--
 arch/arm64/kvm/pmu-emul.c                        | 50 ++++++++++++++-----
 arch/arm64/kvm/sys_regs.c                        | 63 +++++++++++++++++++++++-
 include/kvm/arm_pmu.h                            |  4 ++
 tools/arch/arm64/include/uapi/asm/kvm.h          |  1 +
 tools/testing/selftests/kvm/arm64/get-reg-list.c |  1 +
 9 files changed, 128 insertions(+), 20 deletions(-)


base-commit: 1702da76e017ae0fbe1a92b07bc332972c293e89
--
2.50.1

