Return-Path: <linux-doc+bounces-94647-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UdITM52gRmoAagsAu9opvQ
	(envelope-from <linux-doc+bounces-94647-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 19:32:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2D76FB6B7
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 19:32:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=GsG4M3zR;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94647-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94647-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82BA93021E4E
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 16:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66682348465;
	Thu,  2 Jul 2026 16:36:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966AB381E96;
	Thu,  2 Jul 2026 16:36:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783010194; cv=none; b=qUrWYWCc+FrCxJ2mwKUgn/fZS6tNNv0NFk2aPQ4MaNqPLW4RW+lyw3PmsQuWXQDm/YblkLz1j3xkofW+NdUELGMxabLRcPjsZS4FF0wFoeGLSIvGS33bMZnyG2nujYfq8HEzmFes+4T126JbujifL4L9dfiCeBSvlAVcWr7+/jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783010194; c=relaxed/simple;
	bh=78NieMts7dNfZ0Fpn7sdTLpybzQQCzx3zTLO2Xi93mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlO4fOOkkSP91qq3QLMfwGmyFlDpmqyCQqiM0eiMIg+/xgdSf3idT6qG8ray4nDOOB0DuREeRt2oancl9/OjuRAv55yWb4lMxUab/LS0bVE4BI2NuX82Yt/3Ij32J6nzx+IvZrgDPetQTzKGsbzKEYU7hCnDQWF7zhF9aX1B1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GsG4M3zR; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4384359D;
	Thu,  2 Jul 2026 09:36:25 -0700 (PDT)
Received: from e140010.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22C503F673;
	Thu,  2 Jul 2026 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783010190; bh=78NieMts7dNfZ0Fpn7sdTLpybzQQCzx3zTLO2Xi93mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsG4M3zRo/pRDPVrznxhOeGH7mnfay08nXoqAV9EAACSLkAt/mwAdMCg/XxSWuyKO
	 Mvwkp4z0ddTz9gfGJ9Fx2/4Q3hbumtjlKl0epHHgpJ8Mju/rbIFQrxrt32nRVuun/P
	 FWRkY9Z1PxE/DYSLdZ3rJNyzxeTBrXK2TF4YUKTg=
Date: Thu, 2 Jul 2026 17:36:24 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Jack Thomson <jackabt.amazon@gmail.com>
Cc: maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	shuah@kernel.org, corbet@lwn.net, vladimir.murzin@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
Subject: Re: [PATCH v5 0/5] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
Message-ID: <akaTiGMBM2Ega_Sm@e140010.arm.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com_quarantine>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612162354.73378-1-jackabt.amazon@gmail.com_quarantine>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94647-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexandru.elisei@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:jackabt.amazon@gmail.com,m:maz@kernel.org,m:oupton@kernel.org,m:pbonzini@redhat.com,m:joey.gouly@arm.com,m:seiden@linux.ibm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:shuah@kernel.org,m:corbet@lwn.net,m:vladimir.murzin@arm.com,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-doc@vger.kernel.org,m:isaku.yamahata@intel.com,m:jackabt@amazon.com,m:jackabtamazon@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandru.elisei@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:dkim,arm.com:from_mime,vger.kernel.org:from_smtp,e140010.arm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B2D76FB6B7

Hi,

On Fri, Jun 12, 2026 at 05:23:48PM +0100, Jack Thomson wrote:
> From: Jack Thomson <jackabt@amazon.com>
> 
> Hi,
> 
> This series adds arm64 support for KVM_PRE_FAULT_MEMORY, which was added
> for x86 in [1]. The ioctl allows userspace to populate stage-2 mappings
> before running a vCPU, reducing the number of stage-2 faults taken in
> the run path. This is useful for post-copy migration, where stage-2
> fault latency shows up directly in memory-intensive workloads.
>
> ..
> 
> base-commit: 98f826f3c500fda08d51fca434b7aefa6a2f7076

I want to review and test the series, but I cannot seem to find the base
commit in the master branch:

$ git show --oneline
87320be9f0d2 (HEAD -> master, origin/master, origin/HEAD) Merge tag 'net-7.2-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net

$ git show 98f826f3c500fda08d51fca434b7aefa6a2
fatal: ambiguous argument '98f826f3c500fda08d51fca434b7aefa6a2': unknown revision or path not in the working tree.

Thanks,
Alex

