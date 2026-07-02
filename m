Return-Path: <linux-doc+bounces-94629-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XK77Ni2CRmomXgsAu9opvQ
	(envelope-from <linux-doc+bounces-94629-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:22:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5134D6F955F
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:22:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=YbDuVKBG;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94629-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94629-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5ED4B30045BC
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 15:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4A9353A6E;
	Thu,  2 Jul 2026 15:22:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E2530D412;
	Thu,  2 Jul 2026 15:22:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005739; cv=none; b=FVZy2K1cngEh1vlUQtlDUIiMbApQiDp0OSpzkuevy+NG8LKrzlykGq5kRfMZh12ywk/uan2QzvZxVNziGosYAMdeKVTcgrJWAuodTOUHdTruQy1K2b8D4f+qC10LZsRTd5vad7/3srvNtUMaWAQiWb4M3UShk4ACngrW0KiZcP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005739; c=relaxed/simple;
	bh=NYbihWDKKCohPY024cQbgeKXDce8LgNjGLJ4aJLae8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nY0Ae+LwahKfOeQexkhq9O//WYk9agotrahyNFQ7XNh8Ihm+T/ErlUPPaCThBzwDF6EFORwdzs+cc8wmMbkhkxaKxc2n9OOypUZ6sxJJbLrF56be7Z/e00C6iKU1hA4Uwl3OqnGJfVLv/4XasTP0lOyrLlwgbxCRAA52Q9ildYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YbDuVKBG; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78EFA359D;
	Thu,  2 Jul 2026 08:22:13 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66F2D3F85F;
	Thu,  2 Jul 2026 08:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783005737; bh=NYbihWDKKCohPY024cQbgeKXDce8LgNjGLJ4aJLae8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YbDuVKBGeHbMYVv/naEwChcn29xRiX4Ol2tUMeWWRuVidfjuFnHRmJ8A14eAsKqod
	 85tmCaQazRpD1pTrok5FpIvxeEfAsd0N+yoOBrkx2kr0qqO2rfAlVk4FR7jyopAzPg
	 9BMVr+ziBNmk20z0jzsrXt9dD7HrqAqOJtynnNRc=
Date: Thu, 2 Jul 2026 16:22:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: Sort registers in cpu-feature-registers.rst
Message-ID: <akaCJvZkdqigcQUZ@arm.com>
References: <20260522-arm64-cpu-ftr-regs-v1-0-19775b40faf0@kernel.org>
 <20260522-arm64-cpu-ftr-regs-v1-3-19775b40faf0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-arm64-cpu-ftr-regs-v1-3-19775b40faf0@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[arm.com:+];
	TAGGED_FROM(0.00)[bounces-94629-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:will@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peter.maydell@linaro.org,m:joey.gouly@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,arm.com:dkim,arm.com:mid,arm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5134D6F955F

On Fri, May 22, 2026 at 06:58:39PM +0100, Mark Brown wrote:
> -  ID_AA64PFR0_EL1 - Processor Feature Register 0
> +  ID_AA64ISAR1_EL1 - Instruction set attribute register 1
>  
>       +------------------------------+---------+---------+
>       | Name                         |  bits   | visible |
>       +------------------------------+---------+---------+
> -     | DIT                          | [51-48] |    y    |
> +     | LS64                         | [63-60] |    y    |
>       +------------------------------+---------+---------+
> -     | MPAM                         | [43-40] |    n    |
> +     | I8MM                         | [55-52] |    y    |
>       +------------------------------+---------+---------+
> -     | SVE                          | [35-32] |    y    |
> +     | DGH                          | [51-48] |    y    |
>       +------------------------------+---------+---------+
> -     | GIC                          | [27-24] |    n    |
> +     | BF16                         | [47-44] |    y    |
>       +------------------------------+---------+---------+
> -     | AdvSIMD                      | [23-20] |    y    |
> +     | SB                           | [39-36] |    y    |
>       +------------------------------+---------+---------+
> -     | FP                           | [19-16] |    y    |
> +     | FRINTTS                      | [35-32] |    y    |
>       +------------------------------+---------+---------+
> -     | EL3                          | [15-12] |    n    |
> +     | GPI                          | [31-28] |    y    |
>       +------------------------------+---------+---------+
> -     | EL2                          | [11-8]  |    n    |
> +     | GPA                          | [27-24] |    y    |
>       +------------------------------+---------+---------+
> -     | EL1                          | [7-4]   |    n    |
> +     | LRCPC                        | [23-20] |    y    |
>       +------------------------------+---------+---------+
> -     | EL0                          | [3-0]   |    n    |
> +     | FCMA                         | [19-16] |    y    |
> +     +------------------------------+---------+---------+
> +     | JSCVT                        | [15-12] |    y    |
> +     +------------------------------+---------+---------+
> +     | API                          | [11-8]  |    y    |
> +     +------------------------------+---------+---------+
> +     | APA                          | [7-4]   |    y    |
> +     +------------------------------+---------+---------+
> +     | DPB                          | [3-0]   |    y    |
>       +------------------------------+---------+---------+

The patch is fine but I just realised that we are really inconsistent
with the non-visible things. We exposed a few hear, I guess in the early
days, and then we stopped, just adding the occasional visible fields.

Shall we drop the 'visible' column altogether and only document the
visible fields here?

-- 
Catalin

