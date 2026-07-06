Return-Path: <linux-doc+bounces-95227-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ys+EOjMHTGobfAEAu9opvQ
	(envelope-from <linux-doc+bounces-95227-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 21:51:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A5171526C
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 21:51:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OtEwGHPJ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95227-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95227-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 379E93510207
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 18:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E902433BAE;
	Mon,  6 Jul 2026 18:28:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C4D3DC4A8;
	Mon,  6 Jul 2026 18:28:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362503; cv=none; b=sHOJNz1iL69KoGAqvquR6quXdtat5NxYn/Kl+8vSnAhz8jEfI96Mtae+wgXzXClxvZoeRhnUjFAqd9NSntyrcVRZAAr1q7tdbBSGinjG3NJAtTa11BZLcgtHMD7mTIbFL8Fq38hsI3c6m7gbAcepNl7z2a/w8L9S1phlB00nyLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362503; c=relaxed/simple;
	bh=p+sl2mcxLvLGIayzJN8kQT/LVY5dLfuU6k33HZgg0d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObUOmoGEKYGPxk45MrQzMskuzMDRrixDoGKKTb9zTvtAdJ4L04Q0BQ38Bmg7oESFHLmEOUAxp3oU76PEUykEvF2/1TRL1SeBY4mHjTze6fgkhS860j0aS/1RQN5Wax6gVk5NWlWCruRWzYa7d1wTfsUlAGcFBXiN6yxo9lJzWjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtEwGHPJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1851F000E9;
	Mon,  6 Jul 2026 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783362502;
	bh=+aIUat1jATCZ6Y0HWmZRfqf3fPfOHunP2DqpN7t2mWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OtEwGHPJb9dNat2pDDCdWaRNwPuhB79FT/k4d7QeHvuOpngT7uk2YJXIpwxRU7dSg
	 hL7ucRIloAeRfJyWtxjsIMObTY7Ur5FgnUBD0MNnBdPcrrvqwf/CuQk7iTWvgdUEkl
	 if+rWtqzNlxH/rQ6PYRip0/b/3RlnA/B/z4ZhPV50WrvewSrTwxscvXYFeOR2orJau
	 ssmhBD5FkRnAut7zPu6ciMjVNxD2mTeRWqXc/iuPleBVPDsuP1NjkDLSmFK+9ehpuj
	 H3zvnlwueIcKxIbpoT0tdcA+Wu9pae7LIKouhwFaHjOuLzd9eh939HFMuTvUivL2VU
	 jp6qcVhrimzdA==
Date: Mon, 6 Jul 2026 11:28:20 -0700
From: Oliver Upton <oupton@kernel.org>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 0/7] KVM: arm64: PMU: Use multiple host PMUs
Message-ID: <akvzxDwZbj_sZ4pI@kernel.org>
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:maz@kernel.org,m:joey.gouly@arm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devel@daynix.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[oupton@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-95227-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oupton@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42A5171526C

On Mon, Jul 06, 2026 at 07:03:23PM +0900, Akihiko Odaki wrote:
> Akihiko Odaki (7):
>       KVM: arm64: Disallow vPMU when pPMUs do not cover all CPUs
>       KVM: arm64: PMU: Protect the list of PMUs with RCU
>       KVM: arm64: PMU: Pass the pPMU to kvm_map_pmu_event()
>       KVM: arm64: PMU: Pass the target CPU to kvm_pmu_probe_armpmu()
>       KVM: arm64: PMU: Implement fixed-counters-only emulation
>       KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
>       KVM: arm64: selftests: Test PMU_V3_FIXED_COUNTERS_ONLY

Thanks for respinning the series, I left some comments. I'd really like
to get this feature picked up, hope you have cycles to work on it soon.

FWIW, we're considering adding a new vCPU feature flag to deprecate all
the ugliness of the old PMUv3 UAPI. I'm tempted to say that the
FIXED_COUNTERS_ONLY feature is conditioned on the new feature flag...

https://lore.kernel.org/kvmarm/20260702190421.420992-1-congkai@amazon.com/

Thanks,
Oliver

