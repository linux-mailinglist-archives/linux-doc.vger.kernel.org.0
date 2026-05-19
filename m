Return-Path: <linux-doc+bounces-88491-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KtsEw6EDGrIigUAu9opvQ
	(envelope-from <linux-doc+bounces-88491-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 17:38:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D558196D
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 17:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 55B9B30AAAA5
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 15:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FBF4E3786;
	Tue, 19 May 2026 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuhVB9DO"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AEC400E1A
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204263; cv=none; b=sas4vXjH7LV72dq8IRT5wYrQx6JXq3cmEWalmJPtyLFT3xLB/3vxmxLaTDGbCVx0N+Z69rEnovWxQt+WbOlktlVHVmkGEtDQYFvdyIuPTeCl+3YIlSNTvNIpYw+VYwhjcLYkEKInfMMZOY6xpBAbZGqDdp2SuOaitdArBMkotss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204263; c=relaxed/simple;
	bh=yGclX00sEmvr2VHCUrzeE+m5yMZUCl/baz5r002iGfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aeBeo9yS3IuTc4iD4b2CCxHrdlwWZ5EfnC3owdT4rPcLpXKnHj2Xa88E2RrSwawyv/6aNqoqmejCKWxpVTBTLYBkY74oCAupv7xTLCJj25z8IulOUIhZfGQQ4BNK5B2Fmo8bkqzXRmD+5n6w4BHBD3EydItVBhZOl+oJeN8jyOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuhVB9DO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66F3C2BCB3;
	Tue, 19 May 2026 15:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204263;
	bh=yGclX00sEmvr2VHCUrzeE+m5yMZUCl/baz5r002iGfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AuhVB9DO3aQKgSyzzgiaQyUBKNX8tiLyVYh2LwfpxJo5jfSn7SvdF//NUd8ec5/X6
	 H5iw6qVBfvxfPa3WCPCgoq/jRlhG0Nmps5YeWqLT0cQdzEFtTIDBaF6Dk4yhEUUfmJ
	 wF5toKF9p0gGO3Cd5IJ52ug2WudLGT0rIUcUT+tNpelfXip53G9nA5g6Sv4SYZnLqR
	 CpLbHKr9t5Ylxfa5HMTWdXMg62nEVdezSbHysBevJ60Hwanx0DQPurSJuv9rQWA3fa
	 dljNqWcu7IGG/4IEOvBqIVE5H+KLhaJPNtH0lF9RKi4YgeJTktCXliqKXgCfSV5L3Z
	 o1RiSEby2rHzQ==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Robin Murphy <robin.murphy@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: errata: Reformat table for IDs
Date: Tue, 19 May 2026 16:23:09 +0100
Message-ID: <177918817933.747252.7403057722390578379.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0d4c8f3968e5c5c0a6f3dc295c3e9f696b9006f4.1777657487.git.robin.murphy@arm.com>
References: <0d4c8f3968e5c5c0a6f3dc295c3e9f696b9006f4.1777657487.git.robin.murphy@arm.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88491-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,arm64.dev:url]
X-Rspamd-Queue-Id: 670D558196D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 01 May 2026 18:52:28 +0100, Robin Murphy wrote:
> We have some inconsistency where multiple errata for the same component
> share the same Kconfig workaround; some are one ID per line, some are
> smooshed together, and some are entirely separate entries. Standardise
> on the single entry, one ID per line format so that things render nice
> and consistently in the HTML docs, and it's simple and clear to add new
> IDs to existing workarounds without churning the table too much.
> 
> [...]

I think I intended to send this upstream at -rc1, but it didn't happen.
However, we don't (yet) seem to have any new workarounds in linux-next
so I'll take it on its own branch for 7.2.

Applied to arm64 (for-next/errata), thanks!

[1/1] arm64: errata: Reformat table for IDs
      https://git.kernel.org/arm64/c/ede94377d855

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

