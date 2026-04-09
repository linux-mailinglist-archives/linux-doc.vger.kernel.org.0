Return-Path: <linux-doc+bounces-82955-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ1+E7bx12n6UwgAu9opvQ
	(envelope-from <linux-doc+bounces-82955-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 20:36:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 511D93CEBCC
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 20:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DF273008CBF
	for <lists+linux-doc@lfdr.de>; Thu,  9 Apr 2026 18:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B972F303C93;
	Thu,  9 Apr 2026 18:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gcOFdvwo"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172A39443;
	Thu,  9 Apr 2026 18:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775759792; cv=none; b=oABixeDRZJkpmbdmz6ZmVj/q3y6jE4EvV0lL7GE3s9TeVTZyStp8ymrq5sNl2GPIg8l1VPIQSR6cIJTQzBV9KWp806Eto0aIOkLKFjEI9SGzA1FwHm7xM2t/lxyOkEeRdWocHQ7VyDk2RyiavTF63lmBn77HAgcslQvh1w0elyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775759792; c=relaxed/simple;
	bh=vhaTaS+I0ispCPoVsE0c6h4Z/axqbsHv07VodjiFYds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKkGWfjck21BdMaOagtUUIPBqVQdXm0Zq7XHP6lx0hTRLtvfivY4Aj1iJ8LnV7gI7tXYBDKC7oe+JmukNcbVwaOy58QBTiforOP7D8XkbaBBrNPURgt25m7mx2CKHm+WRNlUZD1pYcl2mBBTU3DFw+Jil0cuMsTk6H8XrNCyr6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gcOFdvwo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E35416F3;
	Thu,  9 Apr 2026 11:36:24 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AFC83FAF5;
	Thu,  9 Apr 2026 11:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775759790; bh=vhaTaS+I0ispCPoVsE0c6h4Z/axqbsHv07VodjiFYds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gcOFdvwoN1UmteXI/cDb4y9h1sxDsg847QlQiRGkj1TNEMD9/efui7tbWdMR85Cmr
	 DKVohDJdtYaMCXoadaIehRHCSb+gm7nMxpJrf1t8jxDdiIBSnER4relRqJlsQcAVXW
	 hApYiqqUcuGPD76n18LGDZfRqKePYx7XTMi2WqKM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: (subset) [PATCH 0/8] arm64: Implement support for 2025 dpISA extensions
Date: Thu,  9 Apr 2026 19:35:02 +0100
Message-ID: <177575970227.3883927.939712260390088306.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82955-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 511D93CEBCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 02 Mar 2026 22:53:15 +0000, Mark Brown wrote:
> The 2025 dpISA extensions introduce a number of architecture features
> all of which are fairly straightforward from a kernel point of view
> since they only introduce new instructions, not any architecture state.
> 
> All the relevant newly added ID registers are already exported by KVM,
> all non-RES0 bits in ID_AA64ZFR0_EL1 and ID_AA64FPFR0_EL1 are writable
> and the updates to ID_AA64ISARx_EL1 are all additional values in already
> exported bitfields.
> 
> [...]

Applied to arm64 (for-next/sysreg), thanks! That's only the sysreg
definitions as these are stable. I also applied the KERNEL_HWCAP_*
generation on a different branch.

[2/8] arm64/sysreg: Update ID_AA64ISAR0_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/b964aa8d68f7
[3/8] arm64/sysreg: Update ID_AA64ISAR2_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/bb5e1e540501
[4/8] arm64/sysreg: Update ID_AA64FPFR0_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/d74576b51ba6
[5/8] arm64/sysreg: Update ID_AA64ZFR0_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/bf56250f34a4
[6/8] arm64/sysreg: Update ID_AA64SMFR0_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/306736fd5155

