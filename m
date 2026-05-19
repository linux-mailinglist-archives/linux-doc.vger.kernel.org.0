Return-Path: <linux-doc+bounces-88454-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Cy2Lq5fDGpXggUAu9opvQ
	(envelope-from <linux-doc+bounces-88454-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 15:03:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8204157F3DE
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 15:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8385E30C7C77
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 12:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3854DD6FC;
	Tue, 19 May 2026 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onCKr4Fe"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398D44963B7;
	Tue, 19 May 2026 12:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195389; cv=none; b=jcQjqgYAJx26x/lmRwjGlvMAhjE4RC1pZ7Ch4Duro9WYeGyAQggviFrFaMwF0W2dTOE9DXDda+Y5GFh72Q11A0S6ZmhgIZPdCgKikvTZba2fFMXO5rksPEgWCTTy/Vxfz1JrrraXb8hiw3bnmig+efYdbdQ69fp65j0n5YOSe1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195389; c=relaxed/simple;
	bh=swiLRF5viUP9Bya8Dp7YZueJwlHQOjHir4JEE0vhuWA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/eYVtjiLgbMt6txJFVi8RPy5Wyas4AgD84f7v3LuvTzCueTvOLdpXyiregpIN+0iW4h8w0JC4BpNpnWgnMC8NNGhg48K9MrIuRvTulzlOLbcjwXZvMl0z1CW63MuGumrhYBKMojy6KP4Pd4uCr/22bXwby9PKQwQKQ7qCq97CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onCKr4Fe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78B7C2BCB3;
	Tue, 19 May 2026 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779195388;
	bh=swiLRF5viUP9Bya8Dp7YZueJwlHQOjHir4JEE0vhuWA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=onCKr4FekH7xM2LVd2O8ZpVN+C9BcX2DiYfqmoUuV4SMKcB+Q1w11YKXTHrUZzkIV
	 G3VAnCJ+nvfKPMdQGwyaV2ryg4bSurZAHT87CiQKtHPANc7qEm9IkWYNBWJMSQ7j3u
	 lM5FVi+MS0LYxjAE7hInPG7JUzwqRJIfiMEY/hsBxjEQD92QaoaVT6NZGzPpWCKcHJ
	 xOknyTHnF6tvmlPfhwPC0y1g4U8VyK7hbACcjCriLoJQRIY5AnY5XCdJ+QT3hPRJpV
	 Bg8PNLF7W7YiSYMqEbb0TrBTd7lX2t6p03dei5jlv/GTOY4cnif6wb/VbHFtMhgJRc
	 7mTGJdsH1PoOQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPJzm-00000003xSA-1yzQ;
	Tue, 19 May 2026 12:56:26 +0000
Date: Tue, 19 May 2026 13:56:26 +0100
Message-ID: <86pl2rwoat.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kvm <kvm@vger.kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Jim Mattson <jmattson@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	kvmarm@lists.linux.dev,
	linux-kselftest <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] Documentation: KVM: Document guest-visible compatibility expectations
In-Reply-To: <86qzn7wp3y.wl-maz@kernel.org>
References: <6856b269d2af706eae397e0cf9c1231f89d9a932.camel@infradead.org>
	<6afc4b95-3c15-4d71-877d-19b84e91ce05@redhat.com>
	<57bc082f4824d6114d3156744c25986effc29aca.camel@infradead.org>
	<baff82ca-6321-4b16-aa61-b2d6d60b6535@redhat.com>
	<86h5obya2r.wl-maz@kernel.org>
	<48b06e5655d56ff6eda30e563b34894fa0eb2f07.camel@infradead.org>
	<ba08dfe9-932b-40c3-9fdf-fc891d52e1d8@redhat.com>
	<d9d4471a7f5ec1e297b3ca07f42a59090aa91e15.camel@infradead.org>
	<CABgObfaM-JtNn2MuYXaiadQnLfAhTEaoHAcTG9=J6LkMcQCJ3A@mail.gmail.com>
	<3f9d731c3d26b0367600f1069e6425099bc34eac.camel@infradead.org>
	<agxFbniU_6eQ98t2@willie-the-truck>
	<cf429f2082e863571595f74d1d3dedc3e6a82964.camel@infradead.org>
	<CABgObfacAYexR25SMi1kSZMRnHx3EDGj8=E84V1DumER66ibnQ@mail.gmail.com>
	<86qzn7wp3y.wl-maz@kernel.org>
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
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, dwmw2@infradead.org, will@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, seanjc@google.com, jmattson@google.com, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, rananta@google.com, eric.auger@redhat.com, kees@kernel.org, arnd@arndb.de, nathan@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-88454-lists,linux-doc=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[maz.kernel.org:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8204157F3DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 13:38:57 +0100,
Marc Zyngier <maz@kernel.org> wrote:
> 
> As I said before, I'd be OK with something that would restore IIDR to
> REV1. But not something that actively breaks the GIC emulation by
> reintroducing a bug. That's, by construction, dead code that will only
> bitrot, because there is no SW that can make use of this nonsense.

I will also add that if we make it a policy to preserve buggy
behaviours that the guest cannot be relying on, then I question
whether we should be fixing anything at all.

For example, 6.19 fixed a totally buggy behaviour where a guest
couldn't not have more than (on most HW) 4 interrupts in flight at any
given time. This was obviously totally bogus, and this was fixed
unconditionally, as legitimate guests could experience gold-platted
lock-ups.

Should we revert to the previous behaviour? In the affirmative, I will
simply stop fixing things, and someone else can have fun retrofitting
buggy crap.

	M.

-- 
Without deviation from the norm, progress is not possible.

