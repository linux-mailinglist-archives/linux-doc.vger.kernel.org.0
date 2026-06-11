Return-Path: <linux-doc+bounces-91953-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2PFoEmG5Kmo6vwMAu9opvQ
	(envelope-from <linux-doc+bounces-91953-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 15:34:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8356725D1
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 15:34:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FH9zIwOl;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91953-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91953-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67F6F3089E49
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 13:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED2D3101C8;
	Thu, 11 Jun 2026 13:34:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF2B29ACC5;
	Thu, 11 Jun 2026 13:34:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184860; cv=none; b=YvoZT9cgtVycD9tp0CvtO6ymH/0O6UG9ZVH9+CJVIUBvS6VEQFnyEzb5h6BFoRdwyCOqmaU5Hsvss6WjJOkdWaKt3VflK33qJefzeCExRZdIyv1L01IEFU8V3L9JpiaV3DcIY6V/qpo1fFWKCjNVS7UjhaGWt6dAKYf4cz5ZjW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184860; c=relaxed/simple;
	bh=AcSqleQy633KBDTvAUOaQgvWk/xdJs6YJaDp0kqw48I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usIJYUYzam4DJ9iBJsUFl8wLwyMcKmB9FqCOjoc9nOGf2fkdwnkUoSZ+sOBLFQ15QAaG/QFt6RDkxEjmlKr3vp75X/INRMpJ8a1ghJcPP1sUAvj9NTcZjv8CZKl4+yjLDOVoSqHftWUce9Q74nsDEU51QLVfewWJbcP7Lp/XyYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FH9zIwOl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941681F00893;
	Thu, 11 Jun 2026 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781184859;
	bh=6689/69B9guEnN6lKaNQc6LOcGsLEeqwwQs2y9xMkRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FH9zIwOlM3rulsEmtitgCVGpcJMCizKjJMC8SfwlTrf9z109JdVTcfGIx2pf5Uh5C
	 V75kWs4R9bwupjCBZtEWpjb7DUEtA0+feRGxWz5Oj+J657z2AqOjkMuGPitIwTYkoy
	 TgZItWRyW7UEHuitnoJTox+H8+jakS8lC8XZk2iAYI2KC5qGSq62ZQF6wKoNFSaLU7
	 d4SvkM4QL4oT9kJikdpnxXUbkmi0+H9bMKZY2BNI95X0ty957Cg6y2TDqOrdR9lUoP
	 /5SetZc4L3B1qaX5Y5xd7X6M+bS4ejZmH7kXgb+5A0S1xdjJIIELGq9nEMOpR8o5SU
	 yUUd9RqabIwJQ==
Date: Thu, 11 Jun 2026 14:34:14 +0100
From: Will Deacon <will@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v3] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
Message-ID: <aiq5VigmtZq9GlAm@willie-the-truck>
References: <20260610164822.4157248-1-sdonthineni@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610164822.4157248-1-sdonthineni@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sdonthineni@nvidia.com,m:catalin.marinas@arm.com,m:vladimir.murzin@arm.com,m:jgg@nvidia.com,m:linux-arm-kernel@lists.infradead.org,m:mark.rutland@arm.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:vsethi@nvidia.com,m:jsequeira@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91953-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC8356725D1

On Wed, Jun 10, 2026 at 11:48:22AM -0500, Shanker Donthineni wrote:
> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
> observed by a peripheral before an older, non-overlapping Device-nGnR*
> store to the same peripheral. This breaks the program-order guarantee
> that software expects for Device-nGnR* accesses and can leave a
> peripheral in an incorrect state, as a load is observed before an
> earlier store takes effect.
> 
> The erratum can occur only when all of the following apply:
> 
>   - A PE executes a Device-nGnR* store followed by a younger
>     Device-nGnR* load.
>   - The store is not a store-release.
>   - The accesses target the same peripheral and do not overlap in bytes.
>   - There is at most one intervening Device-nGnR* store in program
>     order, and there are no intervening Device-nGnR* loads.
>   - There is no DSB, and no DMB that orders loads, between the store and
>     the load.
>   - Specific micro-architectural and timing conditions occur.
> 
> Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain str*
> to stlr* (Store-Release), which removes the "store is not a
> store-release" condition for every device write the kernel issues.
> Because writel() and writel_relaxed() are both built on __raw_writel()
> in asm-generic/io.h, patching the raw variants covers both the
> non-relaxed and relaxed APIs without touching the higher layers. Note
> that writel()'s own barrier sits before the store, so it does not order
> the store against a subsequent readl(); the store-release promotion is
> what provides that ordering.
> 
> Like ARM64_ERRATUM_832075 on the load side, the change is gated on a new
> ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only activated on
> parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs continue to use
> the plain str* sequence.
> 
> Note: stlr* only supports base-register addressing, so affected CPUs use
> a base-register stlr* path. Unaffected CPUs keep the original
> offset-addressed str* sequence introduced by commit d044d6ba6f02
> ("arm64: io: permit offset addressing").
> 
> The __const_memcpy_toio_aligned32() and __const_memcpy_toio_aligned64()
> helpers are left unchanged. These helpers are intended for
> write-combining mappings, which are Normal-NC on arm64. Replacing their
> contiguous str* groups would defeat the write-combining behavior used to
> improve store performance.
> 
> Co-developed-by: Vikram Sethi <vsethi@nvidia.com>
> Signed-off-by: Vikram Sethi <vsethi@nvidia.com>
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> ---
> Changes since v2:
>   - Reworked the raw MMIO write helpers so unaffected CPUs keep the
>     existing offset-addressed STR sequence, while affected CPUs use the
>     base-register STLR path.
>   - Updated the commit message to match the code changes.
>   - Rebased on top of the arm64 for-next/errata branch:
>     https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/errata
> 
> Changes since v1:
>   - Updated the commit message based on feedback from Vladimir Murzin.
> 
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 23 ++++++++++++++++
>  arch/arm64/include/asm/io.h                 | 30 +++++++++++++++++++++
>  arch/arm64/kernel/cpu_errata.c              |  8 ++++++
>  arch/arm64/tools/cpucaps                    |  1 +
>  5 files changed, 64 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index ad09bbb10da80..fc45125dc2f80 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -298,6 +298,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| NVIDIA         | Olympus core    | T410-OLY-1027   | NVIDIA_OLYMPUS_1027_ERRATUM |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | Olympus core    | T410-OLY-1029   | ARM64_ERRATUM_4118414       |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index c65cef81be86a..d633eb70de1ac 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -564,6 +564,29 @@ config ARM64_ERRATUM_832075
>  
>  	  If unsure, say Y.
>  
> +config NVIDIA_OLYMPUS_1027_ERRATUM
> +	bool "NVIDIA Olympus: device store/load ordering erratum"
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around an
> +	  NVIDIA Olympus core erratum where a Device-nGnR* store can be
> +	  observed by a peripheral after a younger Device-nGnR* load to the
> +	  same peripheral. This breaks the program order that drivers rely
> +	  on for MMIO and can leave a device in an incorrect state.
> +
> +	  The workaround promotes the raw MMIO store helpers
> +	  (__raw_writeb/w/l/q) to Store-Release (STLR), which restores the
> +	  required ordering. Because writel() and writel_relaxed() are built
> +	  on __raw_writel(), both are covered without changes to the higher
> +	  layers.
> +
> +	  The fix is applied through the alternatives framework, so enabling
> +	  this option does not by itself activate the workaround: it is
> +	  patched in only when an affected CPU is detected, and is a no-op on
> +	  unaffected CPUs.
> +
> +	  If unsure, say Y.
> +
>  config ARM64_ERRATUM_834220
>  	bool "Cortex-A57: 834220: Stage 2 translation fault might be incorrectly reported in presence of a Stage 1 fault (rare)"
>  	depends on KVM
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 8cbd1e96fd50b..801223e754c90 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -22,10 +22,22 @@
>  /*
>   * Generic IO read/write.  These perform native-endian accesses.
>   */
> +static __always_inline bool arm64_needs_device_store_release(void)
> +{
> +	return alternative_has_cap_unlikely(
> +				ARM64_WORKAROUND_DEVICE_STORE_RELEASE);
> +}
> +
>  #define __raw_writeb __raw_writeb
>  static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
>  {
>  	volatile u8 __iomem *ptr = addr;
> +
> +	if (arm64_needs_device_store_release()) {
> +		asm volatile("stlrb %w0, [%1]" : : "rZ" (val), "r" (addr));
> +		return;
> +	}
> +
>  	asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
>  }

Use an 'else' clause instead of the early return? (similarly for the other
changes).

I still reckon you should do something with the memcpy-to-io routines.
A simple option could be to make dgh() a dmb on parts with the erratum?
That at least moves the barrier out of the loop.

Will

