Return-Path: <linux-doc+bounces-10361-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF7B85EE95
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 02:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FF782844E6
	for <lists+linux-doc@lfdr.de>; Thu, 22 Feb 2024 01:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBCB14287;
	Thu, 22 Feb 2024 01:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8GNNyVa"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE06D13AEA;
	Thu, 22 Feb 2024 01:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708564829; cv=none; b=I8oIyn2ZanZMcKYze3hR399O2x4duUFX4d0dlyLFAb4doKwNlMH66XKmUM8rOgmkHi8/E60JqbEEryqSGXHJ0MCUao8q46N87MEhnyqKjV2w4/+s9LQtQwqmyC9a1wgz6GD0/3YKiVVubVRY13xVtYCkPqnIHxqXvPgYXwxhE2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708564829; c=relaxed/simple;
	bh=gPAGvdSE+hYNwePaN82dBr0INLhODYunN6xVAC98HTg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sEwWY5AWBn9sfLdwuNSyOEAnIgaHNWSKGszJcLrh1bPhyWNuW1xrONUXS9pFutJxLZycBA8g7PIoLhMrW0z+xPQgamCFZWp+aMRwB2k7ZjU28f992wDVY/3tXzFtQDJwfco5bGBEfxXyHLlju+hRSHj4QvXV1CoORXpG9yO16cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8GNNyVa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B226C43601;
	Thu, 22 Feb 2024 01:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708564829;
	bh=gPAGvdSE+hYNwePaN82dBr0INLhODYunN6xVAC98HTg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V8GNNyVaLR9WuaaHZwccryq2aK6zxJUaOHIuE6BdkEIeO1Kyt5raFUfjqBGk7Xve1
	 6jdsbqqJnOttFjYNEQp36wH+z5MEr6pIwVedqUfsjnH4Sc/fGhZplHWVSl53oc1DAK
	 895Xn95axlvxcaWgu0iax/pW9ZzbJsXwNXir9L9aqPCrSkz2gtTvRvJqzGTvyyqzHp
	 OmLc2wTVJJWeFpttgrAoHH1WTDhVKcjQUgEcXGGyjJmgp4vM+FaJ50KUmU7hF++PDW
	 1IPmWHFFvI8WV+HEQ0NKgZElar+RzRBqLK2iJp/n8DUbOuqp/WG5Kw/K6PCvTU23mC
	 voyIoHd2aN0Vg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 434CFD84BCA;
	Thu, 22 Feb 2024 01:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv6] PPPoL2TP: Add more code snippets
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170856482927.21333.4465785323911752237.git-patchwork-notify@kernel.org>
Date: Thu, 22 Feb 2024 01:20:29 +0000
References: <20240217211425.qj576u3jmaa6yidf@begin>
In-Reply-To: <20240217211425.qj576u3jmaa6yidf@begin>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: jchapman@katalix.com, tparkin@katalix.com, edumazet@google.com,
 gnault@redhat.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 corbet@lwn.net, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 17 Feb 2024 22:14:25 +0100 you wrote:
> The existing documentation was not telling that one has to create a PPP
> channel and a PPP interface to get PPPoL2TP data offloading working.
> 
> Also, tunnel switching was not mentioned, so that people were thinking
> it was not supported, while it actually is.
> 
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Acked-by: Tom Parkin <tparkin@katalix.com>
> 
> [...]

Here is the summary with links:
  - [PATCHv6] PPPoL2TP: Add more code snippets
    https://git.kernel.org/netdev/net-next/c/6d5c36565c16

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



