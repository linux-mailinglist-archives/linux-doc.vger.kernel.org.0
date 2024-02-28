Return-Path: <linux-doc+bounces-10989-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 533F286AD9E
	for <lists+linux-doc@lfdr.de>; Wed, 28 Feb 2024 12:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07D8E1F2B9B6
	for <lists+linux-doc@lfdr.de>; Wed, 28 Feb 2024 11:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C38149E1E;
	Wed, 28 Feb 2024 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbi0VaVe"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C3149DFC;
	Wed, 28 Feb 2024 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709119832; cv=none; b=ESJB0xp4ZiGwK2AfDFwNry6eigfIKo7/1rv5ICMo02VIk6BgLuplJGad0xWVPFcSwbkIZaHRdzMG3n/ckk7efiHctS5lwGecOjJBsQQ14tnhoVTylOS9uff/gPMB9T3wiJNstJ8pNdsZSJF1w3Z8Faremz5aY8mhEICYioB/amc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709119832; c=relaxed/simple;
	bh=3dKq8DTrnn7LXnP+Vb/J3/P5tHZH+q5AeKLtMCW7rMU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rgI3wm2CAENl0ppRMB8jkKl8xcd7XbIqUWtWxbFr+T5A5exmG5gOCzHduplrud9HmhkUtLNVQE1YAvLwTXoPaT7qGCLg3O3vgNXIe/LsyLZDN2PtOOt/oKJSxwW+sLFvWJI+K5SmiQr0i7JRnqhXObcoargCZ90c/q8kwvoa6Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbi0VaVe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F154CC433C7;
	Wed, 28 Feb 2024 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709119832;
	bh=3dKq8DTrnn7LXnP+Vb/J3/P5tHZH+q5AeKLtMCW7rMU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dbi0VaVeoMJ3CXTek8Z16JlqEG3DkGPxMhPrxdttTa2uuJbJaiT7LYJPuNbIVRyHv
	 nbS23ao6FRb8W6tVgDT7xMto1+ShbS0atTMUBPh4fL261meYhqjw4ROYT7kmIEVMa/
	 xdDe8buQPNgVcAK/3a6aqgsz1VLkDMES5o5G/iiGgXFBBIkNg348mP5xJIZ/OjAehB
	 EeZQ4mpMqZMP5HSV6Mr9M8F5mtR7xh8qG6+NitjramPLqBlxVVeOHfRCSurA7c/8cJ
	 2TJT8PwCytJhdvoksoU4bFYQuWl/jcClEZWmxz+xZ1CVvvzIxNatXVImUAyW+kQWrx
	 BVpd837eQJrbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D67C7C595D2;
	Wed, 28 Feb 2024 11:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] Documentations: correct net_cachelines title for
 struct inet_sock
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170911983187.5841.9077912041625374191.git-patchwork-notify@kernel.org>
Date: Wed, 28 Feb 2024 11:30:31 +0000
References: <20240226171254.4066289-1-haiyue.wang@intel.com>
In-Reply-To: <20240226171254.4066289-1-haiyue.wang@intel.com>
To: Haiyue Wang <haiyue.wang@intel.com>
Cc: netdev@vger.kernel.org, lixiaoyan@google.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 27 Feb 2024 01:09:16 +0800 you wrote:
> The fast path usage breakdown describes the detail for 'inet_sock', fix
> the markup title.
> 
> Signed-off-by: Haiyue Wang <haiyue.wang@intel.com>
> ---
> v3:
>   - Update the git commit message.
>   - Stop using the git '--in-reply-to' to reply.
> 
> [...]

Here is the summary with links:
  - [net,v3] Documentations: correct net_cachelines title for struct inet_sock
    https://git.kernel.org/netdev/net/c/4adfc94d4aec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



