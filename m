Return-Path: <linux-doc+bounces-25014-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1350975DAC
	for <lists+linux-doc@lfdr.de>; Thu, 12 Sep 2024 01:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 869BC1F23EC0
	for <lists+linux-doc@lfdr.de>; Wed, 11 Sep 2024 23:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D141BD4F4;
	Wed, 11 Sep 2024 23:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjuPVQZb"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC821BB6A0;
	Wed, 11 Sep 2024 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726096845; cv=none; b=GxVeXkjU+Fq/atxevTIpORdL5qYf1TC8R+rtMjEvcy9RAP6Xq5q5dt+CwnUMmflrevHp+uxfyWZjIY25d0V9SYSHP2zg50hqIBTYX4T6mYBlMIi7qlnHymAusqdZgTZ449e9hCVOrknB1+9xbXE2GzBBuUDU+Z6nAXId+JCoAVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726096845; c=relaxed/simple;
	bh=xoeaEsUH4Gbw86lnyllWO3ymn3uzNxvFhzCkvRXqd+U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=H3CRZCLXr5a6K71Khly5pi1FGOFP9PzyBkeTFE+QKbi31MBsIxsJyh9p2njVAS22clr7WndhJkyblcayAwGTd+lDXlUxC9dZyCiJEAfimnxSDvORhoniT+Ca84X8eV1NOH40qnAiPJsaX1+hPAyyqTKKXQqMW7X6u+M6w95zjO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjuPVQZb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C446C4CEC0;
	Wed, 11 Sep 2024 23:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726096844;
	bh=xoeaEsUH4Gbw86lnyllWO3ymn3uzNxvFhzCkvRXqd+U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZjuPVQZbgIymAz3FeMIpwl3wl8mEpI+zZdL8Pm/UTJEego+gEOXwcJ1xU9ewzE+yD
	 pZTM3HtdD7N7dBXe7LHPci0SgW0IaAzFjFJdtRP1n75l9Cu+DMEvVI9KuTdZipZoXd
	 XQNmsuqbtXnH9Aig/LvKJbpGVbqtxZshG97bJ89aPdUOgh8WKO4H0DOJ10PpRWPMqK
	 JE9PX2DgiJVtCru1RrwAaFjOo+IJpBmcUvkJKqoNleTbrRZbVX/WwqeaZCPx39N86y
	 xT0SIZsSFUx4WpGSRyH/T1ccrTPwYVwwqyfbCMR8HWNs/3x3KZ6GUsCwOS/QnTiNOW
	 XpJrjRYk3sPTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0263806656;
	Wed, 11 Sep 2024 23:20:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] mptcp: fallback to TCP after 3 MPC drop +
 cache
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172609684550.1105624.18253068127743198847.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 23:20:45 +0000
References: <20240909-net-next-mptcp-fallback-x-mpc-v1-0-da7ebb4cd2a3@kernel.org>
In-Reply-To: <20240909-net-next-mptcp-fallback-x-mpc-v1-0-da7ebb4cd2a3@kernel.org>
To: Matthieu Baerts (NGI0) <matttbe@kernel.org>
Cc: mptcp@lists.linux.dev, martineau@kernel.org, geliang@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 dsahern@kernel.org, corbet@lwn.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 09 Sep 2024 22:09:20 +0200 you wrote:
> The SYN + MPTCP_CAPABLE packets could be explicitly dropped by firewalls
> somewhere in the network, e.g. if they decide to drop packets based on
> the TCP options, instead of stripping them off.
> 
> The idea of this series is to fallback to TCP after 3 SYN+MPC drop
> (patch 2). If the connection succeeds after the fallback, it very likely
> means a blackhole has been detected. In this case (patch 3), MPTCP can
> be disabled for a certain period of time, 1h by default. If after this
> period, MPTCP is still blocked, the period is doubled. This technique is
> inspired by the one used by TCP FastOpen.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] mptcp: export mptcp_subflow_early_fallback()
    https://git.kernel.org/netdev/net-next/c/65b02260a0e0
  - [net-next,2/3] mptcp: fallback to TCP after SYN+MPC drops
    https://git.kernel.org/netdev/net-next/c/6982826fe5e5
  - [net-next,3/3] mptcp: disable active MPTCP in case of blackhole
    https://git.kernel.org/netdev/net-next/c/27069e7cb3d1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



