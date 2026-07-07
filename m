Return-Path: <linux-doc+bounces-95319-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pJIKHnW0TGrLoQEAu9opvQ
	(envelope-from <linux-doc+bounces-95319-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 10:10:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F3F718ED9
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 10:10:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iz6ynNHy;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95319-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95319-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BB2630174FA
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 08:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535282FC898;
	Tue,  7 Jul 2026 08:10:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386912EA173;
	Tue,  7 Jul 2026 08:10:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411820; cv=none; b=ueSYMoBWvKd4YhTIv5SxieTBW5LGkAHkU8er7n4/Er2WoOE48gtwNflTOH6sh4iEzZAcB8imhVWONFKYN61ketwMvzfuNSFa2Js8DR4fjjyZF5bDwuWh5hM/mn7wU7EJFHW7VK1zdtahRE29coDEcc9MG0civz+K+awSw0QlM/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411820; c=relaxed/simple;
	bh=NkwDdByzymyR//Pg33kMhiOyL7XzQnbH/mjE+S40mis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jiy9/Aw7FsENRet/jtBHR8vKOs0Gy7ItpdXvbw2ZWOMzY2YiKlsjLZ5IkZRgYOKmGeFqN3w21smr0+roJuCIYIydbfXdertrYgpIv/NjHjQXaAmoGXzo+z7n3nGd69WO7ehCWJVkhvZCosXVtZmfidxBP/bSY/hOyFwXG/IujhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iz6ynNHy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DE31F00A3A;
	Tue,  7 Jul 2026 08:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411818;
	bh=lnlzL0KpJ9QqM6hC9iBx7qV7lok+T8DRt7jvPTT0Rec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iz6ynNHyejKVsbakGkrHkbKba2CbrnlOqJjuKQSYnFwqiYr/UzDW6vVpNFfQ3BuWU
	 6pNNZ7rFUfkZUkffMXJWIc2S658G8QwKxCH4HoN8hsaMOJFYfZs54ArAfDieA0TvYU
	 +qd/3m6a++PuRtOUrEELCHrY0RFP2cGf6hFxMVPGDaVlR6n8FMWJDTwdzsTq1SWPAh
	 U2EOmsq2JENnhHbBgGJlZAojIoR6RPLnl+cAVCIVnLqzAFdMA9Vg0rAEOYfk4zDpjJ
	 1AbKJGJ0FnNRDHVRW/GYsPhIW2ykD8JIGQE5/0aR1S9TeyFKRd8F+3lCxInOVa5Yi8
	 31Z4DGG69kdwA==
Date: Tue, 7 Jul 2026 01:10:17 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Joey Gouly <joey.gouly@arm.com>,
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
Message-ID: <aky0abet4NfzK4z8@kernel.org>
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <akvzxDwZbj_sZ4pI@kernel.org>
 <86bjcjp6x1.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjcjp6x1.wl-maz@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:joey.gouly@arm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devel@daynix.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oupton@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-95319-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1F3F718ED9

On Tue, Jul 07, 2026 at 08:58:50AM +0100, Marc Zyngier wrote:
> On Mon, 06 Jul 2026 19:28:20 +0100,
> Oliver Upton <oupton@kernel.org> wrote:
> > 
> > On Mon, Jul 06, 2026 at 07:03:23PM +0900, Akihiko Odaki wrote:
> > > Akihiko Odaki (7):
> > >       KVM: arm64: Disallow vPMU when pPMUs do not cover all CPUs
> > >       KVM: arm64: PMU: Protect the list of PMUs with RCU
> > >       KVM: arm64: PMU: Pass the pPMU to kvm_map_pmu_event()
> > >       KVM: arm64: PMU: Pass the target CPU to kvm_pmu_probe_armpmu()
> > >       KVM: arm64: PMU: Implement fixed-counters-only emulation
> > >       KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
> > >       KVM: arm64: selftests: Test PMU_V3_FIXED_COUNTERS_ONLY
> > 
> > Thanks for respinning the series, I left some comments. I'd really like
> > to get this feature picked up, hope you have cycles to work on it soon.
> > 
> > FWIW, we're considering adding a new vCPU feature flag to deprecate all
> > the ugliness of the old PMUv3 UAPI. I'm tempted to say that the
> > FIXED_COUNTERS_ONLY feature is conditioned on the new feature flag...
> 
> It'd be good to have a strawman proposal on the list if we are going
> to change add a new API, specially if this is likely to gate new code.
> 

Patch 1 [*] of the series I linked does exactly this, no? Needs some
attention like a KVM_CAP to make the bit discoverable by the VMM but
gets the general idea across.

[*]: https://lore.kernel.org/kvmarm/20260702190421.420992-2-congkai@amazon.com/

Thanks,
Oliver

