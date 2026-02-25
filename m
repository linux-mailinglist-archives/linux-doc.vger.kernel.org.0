Return-Path: <linux-doc+bounces-76959-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL40FHlbnmlrUwQAu9opvQ
	(envelope-from <linux-doc+bounces-76959-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 03:16:25 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 69425190C93
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 03:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6786C308070E
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 01:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246F028C871;
	Wed, 25 Feb 2026 01:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiQmGY6c"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005D1256C6C;
	Wed, 25 Feb 2026 01:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771984231; cv=none; b=NJ80tsYwWM6+pq2FRuEDnHVUAX+vSu8eB7+Qzonua2TaX1ttL6IUWWqUrVNuIXXIxqhZlJ1gJ2mEekjil1njW7Y2Evqp/YDyraFEHSLe75z1y7NdyZpNOXzH8Ziah+AD7AIRYM2XQrSEQM5ezEphC4Yglzs7NTBlrIzldH+TcNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771984231; c=relaxed/simple;
	bh=ydW/R9nMe7Z3plvXt/PQOL6RZakAoSHEBA32j8646bM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=M476yz/EGg7VOauwUMp74gbp/uPR1skm6Bm/xY2WhTyrM+hlzY8cM2yp/OR8kFkMw8H6fsidXyoCtm/rZmdCt+PqASqANH1P4T9HVTuTuyI3u51Pr4L3nGYc0bMCHxm4gl/9D1aGJsL4xCgfPHz+v6p3FVp0xt5jDeV5mQlsgfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiQmGY6c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73B2C2BCB0;
	Wed, 25 Feb 2026 01:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771984230;
	bh=ydW/R9nMe7Z3plvXt/PQOL6RZakAoSHEBA32j8646bM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jiQmGY6cn57d6BOaEFwBAFstfP7KNZ5HBf1KO3S9Qvgt8izec5aaC6A2/b47NYpSc
	 tBjhhuOdJPU8foz8w4VhZ5yiEpQ7ZfPdcP0hRhnrw/VH353SkMnBWG9DEPysqGuonr
	 ZJXtY3ASIBfHQGBI2e1huSXJ/7jy0HLK/E+TjjRAAgDdkKWV3diBFLVynFReOHedcp
	 sqdfb1qtt0sNxqwQXRglULvHKvrSqv2SGTEx+ovGPXkSUD0uMN+KVVtL8ucJ8yj2LQ
	 lIT6AEsNaTv17qRqVWB6wa1gcf9EpQAYc5+68WtGJxIfrN9sDz7+QdvWpId6hnrizb
	 qfCaWKAJ4ummQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FEA63808203;
	Wed, 25 Feb 2026 01:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] docs: net: document neigh gc_stale_time
 sysctl
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177198423578.31093.15379027390417770777.git-patchwork-notify@kernel.org>
Date: Wed, 25 Feb 2026 01:50:35 +0000
References: <20260223101257.47563-1-g.goller@proxmox.com>
In-Reply-To: <20260223101257.47563-1-g.goller@proxmox.com>
To: Gabriel Goller <g.goller@proxmox.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-76959-lists,linux-doc=lfdr.de,netdevbpf];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 69425190C93
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 23 Feb 2026 11:12:54 +0100 you wrote:
> Add missing documentation for a neighbor table garbage collector sysctl
> parameter in ip-sysctl.rst:
> 
> neigh/default/gc_stale_time: controls how long an unused neighbor entry
> is kept before becoming eligible for garbage collection (default: 60
> seconds)
> 
> [...]

Here is the summary with links:
  - [net-next,v2] docs: net: document neigh gc_stale_time sysctl
    https://git.kernel.org/netdev/net-next/c/3197cce4d48c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



