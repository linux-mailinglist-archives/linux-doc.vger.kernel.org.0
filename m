Return-Path: <linux-doc+bounces-88492-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Kz2BM+FDGrIigUAu9opvQ
	(envelope-from <linux-doc+bounces-88492-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 17:46:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFD9581B12
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 17:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6278B3100B84
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 15:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A7F4028FE;
	Tue, 19 May 2026 15:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZU/9Nk1"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A5134E760;
	Tue, 19 May 2026 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204275; cv=none; b=b9+1uHpx/Na542kIPkRhyeKHSW+bOMiuFsFrV3f77FmjzpyYHlnGjvtz0QZSACZAVuWR7W0wCv34iogNLdFVxNcR/oVbJgVAX/PqrQC5R0D+mT9uZBoQvOeCmILA5g/8jx1QE/CYTdajhK7tOR9THNKy5Rx+3PwCPNHrzmum65I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204275; c=relaxed/simple;
	bh=nd/SFqFEnjKhIh8jdIA2Y3hV+o5FYf2nfi5Ar2FriVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LlRisk8H+ZhiDOueTtkMCEa7430viPcFGPiRhJmSwm28U3N/qLXk41KAoCRKhY+FuG4sEFtl/9tLp6zUD0XL4kY/tLtuX1E7MhK92NZUvUlWmp1Etk+EPP/UcCmwIqnZo30EoKF5Z7Dj0mQvOZKD7keJCG1fr8VgrN63UEjDnAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZU/9Nk1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C400C2BCB8;
	Tue, 19 May 2026 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204274;
	bh=nd/SFqFEnjKhIh8jdIA2Y3hV+o5FYf2nfi5Ar2FriVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SZU/9Nk1isibwbe/goA8rb23RTRh+TDHdGVHiJweVgoFLIlaLyRzOrwS1BowvouWW
	 XenrcwvtqzcvxlAqhITZdQf9hYUeMs+gI2MdgR92uUqwQP2LBIU7SPyp6qGx6gbBOP
	 qxVOY1l0Hhwe8JHeBzuxD0evaj0x7W+y+oLW5c93HbazWiqi0GAG4wuiOMzW6R2yeg
	 XIaC4t8teRvWrIo4Xqyc3S70Nmw+ZV4CAGKYlxRrWTX3qixRRusoMKSBvtbM/0FjOK
	 HSgKDcNXau/2MnWzfrD69KOkQ2gsuE0586E8+C/3t8eS87g67RVVwLnhTwzTobrB2m
	 fWdtpV9EPdYoQ==
From: Will Deacon <will@kernel.org>
To: maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	pbonzini@redhat.com,
	Tian Zheng <zhengtian10@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	liuyonglong@huawei.com,
	yezhenyu2@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	suzuki.poulose@arm.com,
	leo.bras@arm.com,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 0/5] Support the FEAT_HDBSS introduced in Armv9.5
Date: Tue, 19 May 2026 16:23:12 +0100
Message-ID: <177918656142.736362.17906576792384645789.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225040421.2683931-1-zhengtian10@huawei.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88492-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm64.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7EFD9581B12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Feb 2026 12:04:16 +0800, Tian Zheng wrote:
> This series of patches add support to the Hardware Dirty state tracking
> Structure(HDBSS) feature, which is introduced by the ARM architecture
> in the DDI0601(ID121123) version.
> 
> The HDBSS feature is an extension to the architecture that enhances
> tracking translation table descriptors' dirty state, identified as
> FEAT_HDBSS. This feature utilizes hardware assistance to achieve dirty
> page tracking, aiming to significantly reduce the overhead of scanning
> for dirty pages.
> 
> [...]

Applied sysreg definitions to arm64 (for-next/sysregs), thanks!

[1/5] arm64/sysreg: Add HDBSS related register information
      https://git.kernel.org/arm64/c/72f7be0c2e30

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

