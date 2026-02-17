Return-Path: <linux-doc+bounces-76144-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P7PJGuGlGl9FQIAu9opvQ
	(envelope-from <linux-doc+bounces-76144-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Feb 2026 16:16:59 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2F214D830
	for <lists+linux-doc@lfdr.de>; Tue, 17 Feb 2026 16:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFF2C30263C7
	for <lists+linux-doc@lfdr.de>; Tue, 17 Feb 2026 15:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A16023BCED;
	Tue, 17 Feb 2026 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAPjneMR"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077734A32;
	Tue, 17 Feb 2026 15:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771341417; cv=none; b=I7t5+HYPE2R11Obv7ucOs/yVT6oU1cyOth0MfzhGCD2v9/Q+eAXwAs7TPDTLeK1JKa3FFN1utZ8OQ6/m9s4RXr3WtxKbRpcEyw+Pw0+P7uo4i+90bZT0aopoyBf+o4shawZaPs6R+WNthSflFYCjFSkm4kseAa7dnuaaBUVCNeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771341417; c=relaxed/simple;
	bh=PQS9MrJH71dUd00Df5gWcVQOg7DLwo2jFHIJ+AkIGv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F98/CrvubEVKnvp9IVD5ERDusif0Xnvf5O5cXulL+g+NzEYSURtUBWRKkUV3G9jaksUDp3pu8Sh8tR8QXwrpz06WBqWhLO7yaxYCttVikgnAEl6VIv/zdks38SDG3j9S0lR0Sc64HuicpCZ0KH1e5qz/Bu3rzBy8GlWMiQ1L6eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAPjneMR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5950C4CEF7;
	Tue, 17 Feb 2026 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771341416;
	bh=PQS9MrJH71dUd00Df5gWcVQOg7DLwo2jFHIJ+AkIGv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hAPjneMROTU4OT7z0D+nLcriH2LhEVLvcEgtEx+eiFvVC7zqc6kyx2oAcj9sPd7Rt
	 aNPZcVn7bXBsuuyfmByENnRHJinNEUAuwmcsk82qbiGrF8r8SZ5LdgFzfjb7Wv8YWJ
	 C4KjPGoLMLe2UpozsT3P262ulzou8bkR0X7HbYLgqxjGoOku+tNTMxLEDC+j4JQ6C3
	 2PcQQRLU+Sz48OnGoFwYHv2rN4vMHSshDUKo7EFlTemP87gcQsNYBWgoOdZjs0Y8Sb
	 /0QbHwytK0uCChT1bxfbHitM1u0zJpyFv+cebPvcGu7U9avwDep5BsvD8bz4g1LWNm
	 ttfZwgF+DLstg==
Date: Tue, 17 Feb 2026 15:16:51 +0000
From: Will Deacon <will@kernel.org>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, suzuki.poulose@arm.com,
	maz@kernel.org, corbet@lwn.net, yee.lee@mediatek.com,
	ascull@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] arm64: Optionally disable EL0 MTE via command-line
Message-ID: <aZSGY_yeNEeEr4U_@willie-the-truck>
References: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
 <aZRIHZ2Wq81S-FZY@arm.com>
 <p7wloz3ospiwaytzzns43hbyfrxfjoca6ljols3dq4hpha5y2v@weadvhpdng7a>
 <aZRY9UTSgw0Zf2Y-@willie-the-truck>
 <2evhrm4tg52nxru7xeegs5ut7alnnczv5w2xsgkvhgbdlxdrht@shdj2wb4wcql>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2evhrm4tg52nxru7xeegs5ut7alnnczv5w2xsgkvhgbdlxdrht@shdj2wb4wcql>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76144-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2E2F214D830
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 01:31:49PM +0100, Pierre-Clément Tosi wrote:
> On Tue, Feb 17, 2026 at 12:03:01PM +0000, Will Deacon wrote:
> > On Tue, Feb 17, 2026 at 12:20:02PM +0100, Pierre-Clément Tosi wrote:
> > > Hi Catalin,
> > > 
> > > On Tue, Feb 17, 2026 at 10:51:24AM +0000, Catalin Marinas wrote:
> > > > On Fri, Feb 13, 2026 at 12:51:07PM +0100, Pierre-Clément Tosi wrote:
> > > > > Although it is currently possible to fully disable MTE on MTE-capable
> > > > > CPUs (with arm64.nomte or id_aa64pfr1.mte=0) and to only use MTE in
> > > > > userspace (with kasan=off), there is no way to limit the use of MTE to
> > > > > the kernel because CPU capabilities are traditionally exposed directly
> > > > > to userspace.
> > > > > 
> > > > > To address this, introduce a new cmdline argument (inspired by the
> > > > > existing arm64.nomte) to only expose the MTE capability of the CPU to
> > > > > the kernel. Combined with KASAN, this results in only the kernel using
> > > > > the feature, while HWCAP2_MTE and the corresponding MSR ID_AA64PFR1_EL1
> > > > > field are hidden from userspace.
> > > > [...]
> > > > > +	arm64.nomte_el0	[ARM64] Unconditionally disable Memory Tagging Extension
> > > > > +			support for userspace
> > > > 
> > > > Why would we need this? It's a user-space choice whether it uses MTE or
> > > > not. It's not like the kernel is forcing it onto the user processes.
> > > 
> > > Correct. This patch is useful when working with a pre-compiled distribution to
> > > ensure that a MTE-enabled userspace falls back to untagged allocations, without
> > > the need to introduce system-wide policies (and ABIs) for said distribution,
> > > which would also be inherently less robust than this kernel-level gating.
> > > 
> > > In Android, we can simply append the flag to the kernel cmdline instead of
> > > relying on sysprops (or similar early userspace concepts) and hoping that all
> > > users are properly gated on that sysprop, etc. This can be used for A/B testing
> > > of the feature or as a highly-reliable "remote kill switch", for example.
> > 
> > Why isn't arm64.nomte sufficient for that? It seems weird to insist on
> > tag-based KASAN support for the purposes of userspace A/B testing...
> 
> For a given architecture (and product goals), profiling of MTE might lead to the
> performance overhead being acceptable in the kernel - where security concerns
> are more prominent - but not in userspace, resulting in tag-based KASAN being
> required while a robust switch is needed to disable MTE in userspace but
> arm64.nomte is too coarse for that.

Then tell userspace not to use it? As Catalin pointed out, the kernel
doesn't force MTE on for userspace.

So the existing kernel cmdline option solve your A/B testing scenario
and I would've thought you could use SECCOMP to block the relevant
prctl()s if userspace isn't doing what you want.

Also, using MTE as a security feature is a joke.

Will

