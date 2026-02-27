Return-Path: <linux-doc+bounces-77284-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC8lE876oGlXogQAu9opvQ
	(envelope-from <linux-doc+bounces-77284-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 03:00:46 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BC11B1BA3
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 03:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B8B3300D90C
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 02:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6BF2C15B8;
	Fri, 27 Feb 2026 02:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3Ezg4v4"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458252BE7A7;
	Fri, 27 Feb 2026 02:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772157604; cv=none; b=tsWEdjwILGitE9/3xusF+G+pYMGkVpt6wQKHOev8cljXgEkK/tkIYXHJ69q6T4741YARQSyHG5UnVZEapl1qCsdoxBs406O6yqtZ1WQMuGZw6qU7vS4TKhA1f7+WgdyfN4oInz0QvcjWrpdU8lIN+Ho8kgSGNIVqkKj2zJcUpbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772157604; c=relaxed/simple;
	bh=WxRly+usZrgw7xbIxqEsBiHQt2eGiy4PINnOr3cASIs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=e9ibebP2EAS4Nw+cf3NsklrGcyFQYRj/RRPNFc8XLfpr8NCp8seia8lM2oOf5FBzUSQZDGMk/yvv+BEe4GUgiO7cQ0V2hjIQ1wr6SPRcy0DUZC3R6MGjXOMSfj7gnIjtdzABTT/EYhbmSzbeZmvC2wSUy8qKUn2VXve5XAcRoWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3Ezg4v4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F66EC2BC86;
	Fri, 27 Feb 2026 02:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772157604;
	bh=WxRly+usZrgw7xbIxqEsBiHQt2eGiy4PINnOr3cASIs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Y3Ezg4v43CGpy1TmLpzTUv0kmHHaCi0gL7y8LcqGmJN/yM3G0AM7WFyxZaPEJaMoP
	 HFXWfGBWDlKl0iTE3pdVr5eP2L596mu/4SB20n5U/t2oLgea8BpVgcqBToM2LbcYg9
	 f9mDtwHeQanWYjdf1syGZCJSi2EZnS9zSfbyJE4z4fZLe7f/gZhc7Ej5MaWZ2NWl6N
	 9uMMgO5b/hnuO8Vz31v2U65jlXnL9noHKTURgngb+lt60CjeIYFDHxcBzxJ80zgv9N
	 +nWOzos3bw2aSgiOpd160xritW3dN+z+xmvxJ7UKWoSgwHcRM/Ek3vpBhl7weyEMJI
	 C7pcBrTYkgbzw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D01C393109E;
	Fri, 27 Feb 2026 02:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] docs: ethtool: clarify the bit-by-bit bitset
 format description
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177215760804.1939634.7190902746570621905.git-patchwork-notify@kernel.org>
Date: Fri, 27 Feb 2026 02:00:08 +0000
References: 
 <ef90a56965ca66e57aa177929ce3e10c5ca815fa.1772031974.git.yk@y-koj.net>
In-Reply-To: 
 <ef90a56965ca66e57aa177929ce3e10c5ca815fa.1772031974.git.yk@y-koj.net>
To: Yohei Kojima <yk@y-koj.net>
Cc: andrew@lunn.ch, kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77284-lists,linux-doc=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B4BC11B1BA3
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 26 Feb 2026 00:12:09 +0900 you wrote:
> Clarify the bit-by-bit bitset format's behavior around mandatory
> attributes and bit identification. More specifically, the following
> changes are made:
> 
> * Rephrase a misleading sentence which implies name and index are
>   mutually exclusive
> * Describe that ETHTOOL_A_BITSET_BITS nest is mandatory
> * Describe that a request fails if inconsistent identifiers are given
> 
> [...]

Here is the summary with links:
  - [net-next,v3] docs: ethtool: clarify the bit-by-bit bitset format description
    https://git.kernel.org/netdev/net-next/c/5cf47393d96f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



