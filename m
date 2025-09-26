Return-Path: <linux-doc+bounces-61918-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7E8BA3EBA
	for <lists+linux-doc@lfdr.de>; Fri, 26 Sep 2025 15:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 625131C02809
	for <lists+linux-doc@lfdr.de>; Fri, 26 Sep 2025 13:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C5E2F7445;
	Fri, 26 Sep 2025 13:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOxRdDAp"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D602F6581;
	Fri, 26 Sep 2025 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758893982; cv=none; b=YU+ZPBhnuzk1DFwvZxKDNmcU09csBfSWgN2EXpCwqaSWeWBr8DRPro8xd14VyQGeythyeEG4LQ+HhFMnqzRBWPnuUNdgZ02Am5wRsdbyfBXnQHkG/wFYlfnpLOzr0F7Lp2dgA9t97BVJoYgMA5WUv2c7yLD7tOS4cLOQxlRNFoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758893982; c=relaxed/simple;
	bh=i9qCBMiFERNjoe+SVXO8rGTbCrRuq0zLumNcT5U3KnA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TotI/mI0MU0ov/tPrMVpAQR4X5fSBIRnlTEcn3a96jbyqaxOlVFMtxdFd1Ktaghq1qZbcP4NtsvU/f9vyU98SoGBWPgQFJLurapZE/SNsqSPqt9VNS6Ej1R6VpXXAJr8gOrfod7PnyFJJRVq13MaKTPjB/vizFPDxr0nBgkA8R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOxRdDAp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F58EC4CEF4;
	Fri, 26 Sep 2025 13:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758893981;
	bh=i9qCBMiFERNjoe+SVXO8rGTbCrRuq0zLumNcT5U3KnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SOxRdDApee8VnmIIOODhGGnyykHpLbTPHSH6QdN682hdS97qhyTUq/htGHoazPPYo
	 lL9AtaVy0UkMfHbej6EvmOMH3LpNyL6Z2QaLWkbaxErAN7bj/7TIArpNqkKOSfJWou
	 ujPXVyRz43i3cah5/T1RCk5pyGkM5NKxHVAYYdJE49jr4jgtOYZQ6Vzdt1jM1G/LZk
	 skcYpott7DULFdoJipm/ZBhTYlmb9qGwP+WOxPiALPu35xTUjpF9kINp/wYejsjQ5K
	 Ob4MnWJALNPuWi23E7FTGQGWSuKnOcp7kpkfCqbLizPjAA4o2qEJ9ck2zQluYfJEd5
	 1qWHYVzIo8gGA==
From: Will Deacon <will@kernel.org>
To: corbet@lwn.net,
	yangyicong@hisilicon.com,
	fj2767dz@fujitsu.com,
	Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] docs: perf: Fujitsu: Fix htmldocs build warnings and errors
Date: Fri, 26 Sep 2025 14:39:33 +0100
Message-Id: <175889367771.1416260.12353687380491890594.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250926043748.3785-1-krishnagopi487@gmail.com>
References: <61aace07-890a-4b55-8e84-935ebc4a3be1@infradead.org> <20250926043748.3785-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 26 Sep 2025 10:06:12 +0530, Gopi Krishna Menon wrote:
> Running "make htmldocs" generates the following build errors and
> warnings for fujitsu_uncore_pmu.rst:
> 
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:20: ERROR: Unexpected indentation.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:23: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:28: ERROR: Unexpected indentation.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:81: ERROR: Unexpected indentation.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:82: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] docs: perf: Fujitsu: Fix htmldocs build warnings and errors
      https://git.kernel.org/arm64/c/cb0c5a60a6f7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

