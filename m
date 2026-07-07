Return-Path: <linux-doc+bounces-95335-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zaY/OPbJTGo2pwEAu9opvQ
	(envelope-from <linux-doc+bounces-95335-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 11:42:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8473A719E8C
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 11:42:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QfUUXnPj;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95335-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-95335-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 938EE3020E22
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 09:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949DF3B8959;
	Tue,  7 Jul 2026 09:41:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1E33BB135;
	Tue,  7 Jul 2026 09:41:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417298; cv=none; b=JnLcDyxJ2ms8aZ9Tp89uSvEmUajhEp+upwqEp8paFwUnXQugAY3kG2HLjsgK5t9ZWtDjBYR8INPCKPPXBbR5VeIDYVEAdRF9bUYDhUKcr8cGU1IFmFU3W9Yu03NIk+QGACnpMZB87MtQTwHTzAH18PQW0CIXHNNDqnHGIM+iLp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417298; c=relaxed/simple;
	bh=C2QbuCacjTPszwp8554QdsIjQ5yl4pwtYb4k2JRAQzY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W/TyKib9JT32zF+c7lr+Hb4NyHcwXKpCc7sqlKUcl32LnMxmACn0he2Sx81nC8autuQzjh2ADqu9iT1xuAPlEqid1tuQW/yA+7f9m3yig51+4Vrt7wNQA7fP8iFldmveLowgGKdA41zgddjyvOTI65lsvEANWMHMSwV2WTbgxas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfUUXnPj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0054E1F000E9;
	Tue,  7 Jul 2026 09:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783417297;
	bh=edq9/jN03tElaw6k+IpT0Yftpb/niEsz9qEsQVfwHiM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QfUUXnPj15wViNjXPs9pgLJxKLcvzihhyeuHVy4vGQCrz2E0tXuQaFrhHxHojpPnY
	 VochgGMZmL24b+nFmBaH7AlT+eqcZc67eWDCE/mWMI8b9o75cyUarVZeOGsGq9Wx32
	 SA5MXJYpcaHdep/0UVXHAU/YkGhArhBHAuCLWGEMO82dfHUmOdTzfUIvsr+vlE/lKj
	 bsBgRetjbjUFLoO9wW1SouScNkN4w53t+4BicQvI2GUe/YQfmmpXLOPjQEGRhVYZFf
	 wSCeq0FZFUQiX32OXwx2OnBXymuO8MVhf0yM8is5OEnM6Gw5jwX4q0cA/82XZKZdfw
	 eCC5ZlDxjZcEw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wh2J4-00000002KzE-30Of;
	Tue, 07 Jul 2026 09:41:34 +0000
Date: Tue, 07 Jul 2026 10:41:34 +0100
Message-ID: <868q7np25t.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	devel@daynix.com,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 0/7] KVM: arm64: PMU: Use multiple host PMUs
In-Reply-To: <aky0abet4NfzK4z8@kernel.org>
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
	<akvzxDwZbj_sZ4pI@kernel.org>
	<86bjcjp6x1.wl-maz@kernel.org>
	<aky0abet4NfzK4z8@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, odaki@rsg.ci.i.u-tokyo.ac.jp, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, kees@kernel.org, gustavoars@kernel.org, pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, skhan@linuxfoundation.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95335-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[maz@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oupton@kernel.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:joey.gouly@arm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devel@daynix.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8473A719E8C

On Tue, 07 Jul 2026 09:10:17 +0100,
Oliver Upton <oupton@kernel.org> wrote:
> 
> On Tue, Jul 07, 2026 at 08:58:50AM +0100, Marc Zyngier wrote:
> > On Mon, 06 Jul 2026 19:28:20 +0100,
> > Oliver Upton <oupton@kernel.org> wrote:
> > > 
> > > On Mon, Jul 06, 2026 at 07:03:23PM +0900, Akihiko Odaki wrote:
> > > > Akihiko Odaki (7):
> > > >       KVM: arm64: Disallow vPMU when pPMUs do not cover all CPUs
> > > >       KVM: arm64: PMU: Protect the list of PMUs with RCU
> > > >       KVM: arm64: PMU: Pass the pPMU to kvm_map_pmu_event()
> > > >       KVM: arm64: PMU: Pass the target CPU to kvm_pmu_probe_armpmu()
> > > >       KVM: arm64: PMU: Implement fixed-counters-only emulation
> > > >       KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
> > > >       KVM: arm64: selftests: Test PMU_V3_FIXED_COUNTERS_ONLY
> > > 
> > > Thanks for respinning the series, I left some comments. I'd really like
> > > to get this feature picked up, hope you have cycles to work on it soon.
> > > 
> > > FWIW, we're considering adding a new vCPU feature flag to deprecate all
> > > the ugliness of the old PMUv3 UAPI. I'm tempted to say that the
> > > FIXED_COUNTERS_ONLY feature is conditioned on the new feature flag...
> > 
> > It'd be good to have a strawman proposal on the list if we are going
> > to change add a new API, specially if this is likely to gate new code.
> > 
> 
> Patch 1 [*] of the series I linked does exactly this, no? Needs some

Ah, I overlooked that, apologies.

> attention like a KVM_CAP to make the bit discoverable by the VMM but
> gets the general idea across.

Not sure that's the ideal approach, specially in the light of this
"multiple PMU" series. This "strict" API mandates the selection of a
PMU (singular), while this stuff is the exact opposite (grab all the
possible PMUs).

	M.

-- 
Without deviation from the norm, progress is not possible.

