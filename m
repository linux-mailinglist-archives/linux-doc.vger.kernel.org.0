Return-Path: <linux-doc+bounces-95194-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o047K4P4S2ptdwEAu9opvQ
	(envelope-from <linux-doc+bounces-95194-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 20:48:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1D714A92
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 20:48:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gyaaNu0D;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95194-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95194-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 173CA33D6956
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 17:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2CC2F1FD7;
	Mon,  6 Jul 2026 17:04:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5122E975E;
	Mon,  6 Jul 2026 17:04:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357476; cv=none; b=VWj4IBXUHrPgWPbXCCF7A+Q4qrbEa8hkA9Y9KBb7tn7LxB3reMH0EeXuxugRptPgNDIzGMOPOhw3pYwEQktxHRFSbZjj5stihoD5w+pgG9t8c7V9YJdwmVXRRjuk/riO2FKLLYVSyxTMgkAN+y3CR5rgZcaXvvXE+SOKoBBqPW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357476; c=relaxed/simple;
	bh=q2bf0hck/kteT/8BiENk5zi92hNnZDmATG4EbRm5dQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNG6Wlnl/KXobjTggWRV5JUz3YGbP2nulao76WITmzSY3BJWSXxd9UJYonTEQfwuPS2YGN/GMjnIt+oWzED2Gq4316OckfLNjzsB8hvA/b9vYiVHpXcy7wiaC10OU4901D70RSRJ2TCabvcYjx3E4cqNGs4TZ3WoDsiwRZFgRV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyaaNu0D; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FE31F000E9;
	Mon,  6 Jul 2026 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357475;
	bh=REmuzwIaNWYa8LGBVvGUzNpeujzoKq+eMU1Gq13kbjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gyaaNu0DZ3lY+wpZZZxQ/iX7UMQqh0yyWYHoi78HU774kBB/02mxwoerTE+/DOWYp
	 ftBdYzRQvBWyb/29euRzLW3wmTKXWID7tadSd+Nb97HQ7Lw24Q07dQc6tis00rC92/
	 8xZPYUxbdNceoDK6j/iBacm63/gI7YctudjwjYi4ceHK5RpWkagVWH7umCwngTYW8+
	 jtsPBAUVsgiN2pTUkDm/0+7BMFzZCznXpYKvpmV6GwD+WlIHud9o4aaWD5Cu3YNgOe
	 hDWiQNhcSgbvwgEyZXnd/V4YDoYbh9ZojTux/OFUUB/09bWTQe07B9eRAbrcWc2BXO
	 kT/8DfH8xtg5w==
Date: Mon, 6 Jul 2026 10:04:33 -0700
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
Subject: Re: [PATCH v8 1/7] KVM: arm64: Disallow vPMU when pPMUs do not cover
 all CPUs
Message-ID: <akvgIWqBjAp_VA_A@kernel.org>
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <20260706-hybrid-v8-1-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-hybrid-v8-1-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
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
	TAGGED_FROM(0.00)[bounces-95194-lists,linux-doc=lfdr.de];
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
X-Rspamd-Queue-Id: 39C1D714A92

Hi,

On Mon, Jul 06, 2026 at 07:03:24PM +0900, Akihiko Odaki wrote:
> Commit ec3eb9ed6081 ("KVM: arm64: PMU: Disallow vPMU on non-uniform
> PMUVer") made KVM reject vPMU unless the system-wide PMUVer is usable.
> That covers systems where PMUv3 is absent or non-uniform, as well as
> systems where IMPDEF PMUv3 sysreg traps are unavailable.
> 
> However, KVM can still accept vPMU when all CPUs uniformly trap PMUv3
> sysregs, but the pPMUs registered with KVM only cover a subset of
> possible CPUs.
> 
> Reject vPMU unless the registered pPMUs cover every possible CPU.
> This avoids carrying support for partial pPMU coverage into the
> fixed-counters-only UAPI introduced later in the series.

Doesn't CPU hotplug screw this up? I could online a CPU that doesn't
have a PMU after creating the VM.

I'd rather just change ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS to become a
system feature. That way any CPU which breaks the system-wide assumption
cannot be onlined.

Thanks,
Oliver

