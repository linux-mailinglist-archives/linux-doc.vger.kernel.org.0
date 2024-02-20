Return-Path: <linux-doc+bounces-10098-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A64D585B9CB
	for <lists+linux-doc@lfdr.de>; Tue, 20 Feb 2024 12:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 365E4285F74
	for <lists+linux-doc@lfdr.de>; Tue, 20 Feb 2024 11:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE85657DC;
	Tue, 20 Feb 2024 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wt3mXf1I"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8227065BCD;
	Tue, 20 Feb 2024 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708426827; cv=none; b=HYYyLzBS/uNLK2i0V35dVDIY/MI9ZXcsS3RPEywojDz/HP4RnF7beJgKaiNtm3Nz/f+Cfj6GAJot7nl6zluae1u2Q+06x38VyZpblKmgWHdeUp5mt9uIymfZvqUWCt2rskOpIB35ocQOmXsOokATiMHJ6zHKlz6ClGr6CZL9va0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708426827; c=relaxed/simple;
	bh=bgILqxP4ntwO1OngAu+cvlttV/KeKYAEDPGg12EbbUw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=psvGF7xEdd5EMj4MtJNqBhZG9htNT4TvX4NeHoZG29uX0iGGlRcZNMpPMkhmoDceanTRqMRNNmZAk+KNNxZfmShbNv+fyEdrYLs7N3+hk71/mj8TzI+yJVwwSaFloK4ksMclKZgZZCEsLVgzmuG+FcK1U4Q7X0lFVn8M+USA8MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wt3mXf1I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21379C43399;
	Tue, 20 Feb 2024 11:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708426827;
	bh=bgILqxP4ntwO1OngAu+cvlttV/KeKYAEDPGg12EbbUw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Wt3mXf1IbUJSUAkLXD5PyIXuTNGYLNl2KhWGkseHKAO384eKe3cqkiirLaM9ekZOx
	 8BpIolrcCGZdLCDF5x02vWyw8tFx0HMNJaN9uGfc7AG/KkykqlgDZdjPe4I5qO7jft
	 VUq0pbl/cFkDZYKP5Wm/c+ahTCBYqwVHQ69/84xK+jTd3SAls9WRMSYeiLXmm1ojqr
	 pVetB0zPDPHkWHYUnuxNkNCusb0BOfYE9C8xgq+3n7Q4uX61aYvzo0G7yvga8I3GZT
	 OKi7ZPWZX7nk+yVncPo1ofNYXpIwm22Y3y4D4UrQiKLAU3FPzr2g4G9/my4wX+bJaC
	 Yyl4JBUgeARMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0150CC04E32;
	Tue, 20 Feb 2024 11:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] docs: netdev: update the link to the CI repo
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170842682699.31830.17528906722029277540.git-patchwork-notify@kernel.org>
Date: Tue, 20 Feb 2024 11:00:26 +0000
References: <20240216161945.2208842-1-kuba@kernel.org>
In-Reply-To: <20240216161945.2208842-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, corbet@lwn.net, linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 16 Feb 2024 08:19:45 -0800 you wrote:
> Netronome graciously transferred the original NIPA repo
> to our new netdev umbrella org. Link to that instead of
> my private fork.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: linux-doc@vger.kernel.org
> 
> [...]

Here is the summary with links:
  - [net] docs: netdev: update the link to the CI repo
    https://git.kernel.org/netdev/net/c/23f9c2c066e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



