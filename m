Return-Path: <linux-doc+bounces-24553-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E3296D2D4
	for <lists+linux-doc@lfdr.de>; Thu,  5 Sep 2024 11:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53F69B2146B
	for <lists+linux-doc@lfdr.de>; Thu,  5 Sep 2024 09:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FFF197A76;
	Thu,  5 Sep 2024 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7TzbLVb"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14B6197A67;
	Thu,  5 Sep 2024 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725527429; cv=none; b=ByOcTAjGdjEWpWG8h5kFuboD0N9EUKUSCvoz2w3rxFMhvA9MqQJSW3v6e9s6E6ZJr/vVulwa3K0AcHYYEfV2Os/bnuxuA3jpHkU1MJtvsxjXUqIP4MAz8lU2ZK6bcenOENfTS9nbrOp88WmmD4He9zxRWNa2rvxlUOp+PymnVA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725527429; c=relaxed/simple;
	bh=Xee3nsY79Rf3hHidgMXZUQ6PEEuOs/0czRo7ulVTYik=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TkJhPbdismkO0w3ZwzRV+qSnq/xWGTLTGkGFo260sJfDfs1QLqyX1WGM1GcJg6Mv/hBTV/Hxws0FvEhatCoJFyFfQ493b0xuPTAheqGhEHrXV8bCKQwC6kFTSwkXFp0MwbtB1BJi4AVe7WyMCuUKTbjBPE46MPYfkHM2Cr7tgLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7TzbLVb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703FAC4CEC3;
	Thu,  5 Sep 2024 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725527428;
	bh=Xee3nsY79Rf3hHidgMXZUQ6PEEuOs/0czRo7ulVTYik=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=R7TzbLVbnxn24OzJ4vXjs3Bn2xzs0uokFOWEWmh1hQN9/+71uDFEgMPKd8N/e4j5g
	 agBjMG5mt5wnEpSGQiX7uLGDlZGiGCffQPxu6UKJY5hGmG0DXbzWmBVMfPM1F4WBC4
	 JXnQab6/iK63Jo3TyGrX+B6h6tFEgI9siqvXWNVmrQxGnLMivzyepmk4h/rl1suf5Z
	 smXxXp8Mp3VvwK9M2ZGAgFEAcZYAomd7/Wcs/+5zpCDS2IZA1TgAyiMOTozqXM/5DD
	 kCt/vGjZ1quOhPPJAn+PiqlyJOsVjq6kF1C/huKW9X2dlHDW8a210cD1Epvgv0NPED
	 6wywULdQuRYUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C143822D30;
	Thu,  5 Sep 2024 09:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] docs: netdev: document guidance on cleanup.h
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172552742926.1321506.4717187721784351680.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 09:10:29 +0000
References: <20240830171443.3532077-1-kuba@kernel.org>
In-Reply-To: <20240830171443.3532077-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, razor@blackwall.org, andrew@lunn.ch, horms@kernel.org,
 corbet@lwn.net, linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 30 Aug 2024 10:14:42 -0700 you wrote:
> Document what was discussed multiple times on list and various
> virtual / in-person conversations. guard() being okay in functions
> <= 20 LoC is a bit of my own invention. If the function is trivial
> it should be fine, but feel free to disagree :)
> 
> We'll obviously revisit this guidance as time passes and we and other
> subsystems get more experience.
> 
> [...]

Here is the summary with links:
  - [net,v2] docs: netdev: document guidance on cleanup.h
    https://git.kernel.org/netdev/net/c/c82299fbbcce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



