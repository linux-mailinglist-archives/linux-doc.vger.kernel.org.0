Return-Path: <linux-doc+bounces-91843-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AoU6EVhXKWovVQMAu9opvQ
	(envelope-from <linux-doc+bounces-91843-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 14:23:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 312796693BB
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 14:23:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nyy5nAeb;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91843-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91843-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 04ACF302C276
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 12:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F83B403B1D;
	Wed, 10 Jun 2026 12:14:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E32D3FD96F;
	Wed, 10 Jun 2026 12:14:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093675; cv=none; b=CN/jM16AvNOLX83Q5NcXNmZbde/sSKufFHijEb+Rz2A0tb+T4D5kHXnEG3ifp8YcMegrqK1ALMDJkenRCsE8a/l/JId8n9XUsim/ehntAEMJ524Gfc1fl+SLMi7p6Pno2ix/tUpAC0qmav/epFxO8b8HDFXNHvCiYmPSX1y5bSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093675; c=relaxed/simple;
	bh=HGZbs++XH+qS2mF8eeV3ScNYI2q71rrcjJdcsfuEkDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VDM0+f2cfz7NBRzyIn0NxGFfL99OiENHpzCy9m22gp1Ofyja+J7SDapNYRROScOXFsWJrYeZ2G7Q5e63xG7ddTCao70m6CnGHFbIdIXj+mrGtqpdG9ItP5WT6i6ArIWsJPxVElIhdd9wfkV45q0qRIif0MW4OxgVpyfWQpsnetI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyy5nAeb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D761F00893;
	Wed, 10 Jun 2026 12:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781093674;
	bh=eJXDwlYRBGiQauYvcS/uQg8N6b5KdvjxW0OG+TvEDNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nyy5nAebPLlB9fvkqgGoe62Li7gXnOplK/IvuacbIqI3FfXAYwj/wIuRgD00dNH8E
	 BU8KukPyd3tLHQyflqJkm/COgTosBE7xr2RrxwfJqe0RPR8Rw3c97bkUA2KM4iqQhF
	 7gts8EiDEJutNN+ZGgfkUnTwUvlJcdVTutxNqUgE+YquPWplsS9SViYhBOMkakV8OS
	 BC/A6g7pWqo+oHJn0tPhPxcGaiwU5JHf5kdn7u+XbLpTFoSenj0XAgKYR94cB2UgA8
	 4q1H4JXpO+LUt2USfCklvB69gFc88BhBC6oOk7SScemty8sx1dkC33y2AljbsXUFb7
	 0QFCZXsNEv9eQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>,
	Alok Mooley <amooley@nvidia.com>,
	Rich Wiley <rwiley@nvidia.com>
Subject: Re: [PATCH v1] arm64: errata: Mitigate TLBI errata on NVIDIA Olympus CPU
Date: Wed, 10 Jun 2026 13:14:25 +0100
Message-ID: <178108882631.788926.2947350412570700520.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609234044.3945938-1-sdonthineni@nvidia.com>
References: <20260609234044.3945938-1-sdonthineni@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:linux-arm-kernel@lists.infradead.org,m:mark.rutland@arm.com,m:sdonthineni@nvidia.com,m:kernel-team@android.com,m:will@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:vsethi@nvidia.com,m:jsequeira@nvidia.com,m:amooley@nvidia.com,m:rwiley@nvidia.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91843-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm64.dev:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 312796693BB

On Tue, 09 Jun 2026 18:40:44 -0500, Shanker Donthineni wrote:
> NVIDIA Olympus cores are affected by the TLBI completion issue tracked as
> CVE-2025-10263. The existing ARM64_ERRATUM_4118414 handling already uses
> ARM64_WORKAROUND_REPEAT_TLBI to issue an additional broadcast TLBI;DSB
> sequence and ensure affected memory write effects are globally observed.
> 
> Add MIDR_NVIDIA_OLYMPUS to the repeat-TLBI match list so the same
> mitigation is enabled on affected Olympus systems. Also document the
> NVIDIA Olympus erratum in the arm64 silicon errata table and list it in
> the Kconfig help text.
> 
> [...]

Applied to arm64 (for-next/errata), thanks!

[1/1] arm64: errata: Mitigate TLBI errata on NVIDIA Olympus CPU
      https://git.kernel.org/arm64/c/ec7216f92e4e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

