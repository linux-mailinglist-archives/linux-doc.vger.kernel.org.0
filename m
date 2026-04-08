Return-Path: <linux-doc+bounces-82859-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOBLOVu61mnLHggAu9opvQ
	(envelope-from <linux-doc+bounces-82859-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Apr 2026 22:28:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9221C3C3C8D
	for <lists+linux-doc@lfdr.de>; Wed, 08 Apr 2026 22:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82D0D3051A93
	for <lists+linux-doc@lfdr.de>; Wed,  8 Apr 2026 20:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A817390CB1;
	Wed,  8 Apr 2026 20:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ttbw98F6"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA03038F65F;
	Wed,  8 Apr 2026 20:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775679971; cv=none; b=be/XUXztRHflsHk7c3XQOLIGnSl/Q8rzuvhJk0b3Iwk/uRMoSmDlo1PEMCyiezCAVjztcoBq/l9Y+KwuJUkRbfQUh7aIyND7EoC7+tf9ARLx0wh1ItiOQOkE2LPYX4amyNzbWJsJ55deUOMxU2jXextdTqerXKZwqT/jEXzt250=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775679971; c=relaxed/simple;
	bh=YG7b7uRkIelbWrNbh5jkYLYCqzZYBXppAsMu13wuH/U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nAbAJ4lTjJwRMcx+5TPCNR1xlZiyimbMzylJ+ed0IuIm6H58opIze4526XMIqu6UgmFBw2me0k9CmkhS1GWdS71Jh6i1tZYgOMHExYuzwBD2zEUvvNwwAYyCZeQ8nO+DB0E+qYmUwFk/nC4R2EjIM8llx/wH0+C4a3DdyLtyYRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ttbw98F6; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=HmRWz/u6ADn48S6TayljG46hjii4LlrDfP5vjmIk5Cw=; b=Ttbw98F6v5eNunyR1xVasbT+Ad
	oyc1rBu3pzITbsyIbw937eUZBu6tMsZBUq+3rYCRRvvJtxJp1RvXrfqmVOorhHG+3DS4oIMflsTBn
	E8HaKNlWddK4iG8gX878bgjW8YimRXq4TBkV6EHDiyCW1L+7XygrMEb/muRLoTClNEraKy2GBytn0
	uf2128XnwIqNLTCiyhOG//wfRhlw+zwcHXGHXZuNpbrl/9kU7UwLGRQywzaLPlkB58AngMm7mQlrG
	mYRntpgkvvRfUyGNOv0f6oo2S4tbiNDGZ+w9U5TqRNz1eL7NHHeNAMt0URfVxFIrbSq/MrdTdsOTe
	ZMyzImzw==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTL-00000005uIP-1PsD;
	Wed, 08 Apr 2026 20:25:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTL-00000008oxL-0MDJ;
	Wed, 08 Apr 2026 21:25:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	Colton Lewis <coltonlewis@google.com>,
	Jing Zhang <jingzhangos@google.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 0/2] KVM: arm64: KVM: arm64: Add per-VM WFI/WFE exit disable capability
Date: Wed,  8 Apr 2026 21:23:46 +0100
Message-ID: <20260408202557.2102476-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-82859-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:dkim,infradead.org:mid]
X-Rspamd-Queue-Id: 9221C3C3C8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add KVM_CAP_ARM_DISABLE_EXITS, modelled after the existing x86
KVM_CAP_X86_DISABLE_EXITS, to allow userspace to disable WFI and/or
WFE trapping on a per-VM basis.

KVM already has system-wide kernel command line parameters
(kvm-arm.wfi_trap_policy and kvm-arm.wfe_trap_policy, added in
0b5afe05377d) to control WFx trapping. However, these are global and
set at boot time. A per-VM capability allows the VMM to make the
decision per guest — for example, disabling WFI trapping for
latency-sensitive VMs with pinned vCPUs while keeping it enabled for
overcommitted guests on the same host.

When a flag is set via KVM_ENABLE_CAP, the corresponding trap is
unconditionally cleared, overriding the system-wide policy. When the
flag is not set, the system policy (including the default
single-task heuristic) applies as before.

As with the x86 equivalent, disabling exits is a one-way operation
per VM.

Tested on Graviton 3 (Neoverse-V1) metal.

David Woodhouse (2):
  KVM: arm64: Add KVM_CAP_ARM_DISABLE_EXITS for WFI/WFE passthrough
  KVM: arm64: selftests: Add KVM_CAP_ARM_DISABLE_EXITS UAPI test

 Documentation/virt/kvm/api.rst                    | 28 +++++++++++++
 arch/arm64/include/asm/kvm_host.h                 |  4 ++
 arch/arm64/kvm/arm.c                              | 20 ++++++++++
 include/uapi/linux/kvm.h                          |  6 +++
 tools/testing/selftests/kvm/Makefile.kvm          |  1 +
 tools/testing/selftests/kvm/arm64/disable_exits.c | 48 +++++++++++++++++++++++
 6 files changed, 107 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/disable_exits.c


