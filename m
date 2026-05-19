Return-Path: <linux-doc+bounces-88490-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKaRO1yDDGrIigUAu9opvQ
	(envelope-from <linux-doc+bounces-88490-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 17:35:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 531AF5818E5
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 17:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADF6F326E03C
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 15:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A793E400E0C;
	Tue, 19 May 2026 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qyb/zaDk"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84908400E0B;
	Tue, 19 May 2026 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204221; cv=none; b=XAd/OXUMgmwsOQRwV5OM6IrSwVTemAuIcLKOd+9sWtFrhpaMInYr+arWUALQyu+IA0QnbNvWoKxYhAZmDbEJvsJYrw5yn1Eo1/ngNvwdggCJNFpkBa68BXUdERmCReNhbdQAILhFV7TXBARu7y/cNj8GY2iD9WK/PNVQYXKFs2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204221; c=relaxed/simple;
	bh=Yn9anD6S2sdeviR6DobfIVvn2ZavCIs6s3fiL/K+EFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CF2ceu5j+ajwUBbkI0GYSCwbCMaaIM6GYZOki9wGbkvLNw/FgNMZ2Jz9FFMLMJVOoIkEEpYG2quqGqTUaqRcm/VXGTr8yygk28S2nMtbAKMDqlFVglj0dD28O8RX7sGK4rMV1xjmJ8SJ1T0k7IcPOrVGcFxuBxQ/lW/Apf9bPcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qyb/zaDk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158B3C2BCB8;
	Tue, 19 May 2026 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204221;
	bh=Yn9anD6S2sdeviR6DobfIVvn2ZavCIs6s3fiL/K+EFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qyb/zaDkk0Kxc8Y+fiFGDHHWFnP4tzKZmSMEDXArE7dhcX8sAtLaT8yW9ehnS9ppJ
	 AC1keOftP127xOq9iN139McgXqqOTEx0e8Ey00jaBiCQ0+FyaCbliWv6WN8ewFEIux
	 WfwWP0M3ARPhI/z1SQt6RC+7WpIO2/WmsI5pTGmCKO3VWrGnh9J7jck6sk2U97MDmu
	 fXuAjdvZXhM0/ekE3DwDi+dyF/tPLLPgdg7AU8mH32oF0mku5GJ+MWos2zpJphD8FM
	 o1nuPu6Tza+gJnLxCDEmB8S2HPlv059UxhZ1hm+bdJ0i4yozSMCmB/0pwwA18Y1DD/
	 0lt2lWbaV0Zmg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: Implement support for 2025 dpISA extensions
Date: Tue, 19 May 2026 16:22:55 +0100
Message-ID: <177919551472.843780.18117053245871054269.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
References: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-88490-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm64.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 531AF5818E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026 16:07:28 +0100, Mark Brown wrote:
> The 2025 dpISA extensions introduce a number of architecture features
> all of which are fairly straightforward from a kernel point of view
> since they only introduce new instructions, not any architecture state.
> 
> 

Applied selftest update to arm64 (for-next/selftests), thanks!

[2/2] kselftest/arm64: Add 2025 dpISA coverage to hwcaps
      https://git.kernel.org/arm64/c/7da70f41da81

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

