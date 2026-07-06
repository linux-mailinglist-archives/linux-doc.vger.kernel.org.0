Return-Path: <linux-doc+bounces-95256-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F9v+J5ksTGoOhQEAu9opvQ
	(envelope-from <linux-doc+bounces-95256-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 00:30:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 258F0715F5A
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 00:30:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=kernel.org header.s=k20260515 header.b=Cmm49OD2;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95256-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95256-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=reject ("signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BDB5303CEA9
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 22:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EAB435ABC;
	Mon,  6 Jul 2026 22:30:33 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E89D435A9D;
	Mon,  6 Jul 2026 22:30:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783377033; cv=none; b=H8tpqJxDzYig56G2hmqeZ/14FE13ftb0rAk8aO05593Raqiz7k7OioxYWFtaL7242ul04GMT0lX5xwX6rUUJnBw/A8BhYzzYmtJv2WZ8z3hhpZI2uHPUN2b7HZc3tiPA1ys3OKp8PeR+9hjyhpxlc6n1aXgunJ8xh1YdfCja0aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783377033; c=relaxed/simple;
	bh=pg1KdjC7KN8egiZ64ccRdme3lxbX53Hh0wpG6x1YP4A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=c96k0U9xgEg/tsmCNzPDkIAlsrhpprJlodVR+V9D6awb6ooQTcMJs397k2xCfk823De+E0evLuE0G8qIL/T7k1iOCM1RG1RQ8piRSD/iqAPnrRZANOmIB9NgP5H5oP5pp9pqw2f6Xk0hM0UffhsZt65oftf5QZOzxlhDKO7iLtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cmm49OD2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4EA1F00A3A;
	Mon,  6 Jul 2026 22:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783377031;
	bh=PHlbfT9SIM02HI3ZomSlPWh0SsR5wNbcsbXv7XHIqIc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Cmm49OD2TfRPGQWUG0uxjBBvWvd5pEwwC6iAKtTOXag7mFGpwqNPUucYi0xzL5KEk
	 UAjU/0JrLM/vlI7eckuWE6vfZ7CiMPPXM2jQOc/quK+LX3dVnQWRV+DCukUqah+fXt
	 mIhHdBIXE+jVpP2ABoJnZFfAArnoP1AsnXRGRoJBeVA9ZFiPjJlEqGACpn8pVffphD
	 G4wmrPhfHQz3Bym8Jxo05JXx+7uBdoWOt7t7brvBDoI29YxW3Z0bbIxdWFeD+TPfSO
	 Rkbi029kgfJB6xWZLsF7l8v0VziR0HOWUGnldcODI7ivF9OqQJHcSF8a08sDlnRzQN
	 u2Zmzjd80gvDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A0A3925F73;
	Mon,  6 Jul 2026 22:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] docs/bpf: Document BPF_STRICT_BUILD=0 to tolerate test
 build failures
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178337701189.1232545.1878877150316891466.git-patchwork-notify@kernel.org>
Date: Mon, 06 Jul 2026 22:30:11 +0000
References: <20260706-b4-bpf_strict_build_docs-v1-1-5324d605c7b0@suse.com>
In-Reply-To: <20260706-b4-bpf_strict_build_docs-v1-1-5324d605c7b0@suse.com>
To: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgPHJibUBzdXNlLmNvbT4=?=@codeaurora.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 corbet@lwn.net, skhan@linuxfoundation.org, bpf@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,linux.dev,etsalapatis.com,lwn.net,linuxfoundation.org,vger.kernel.org];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:=?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgPHJibUBzdXNlLmNvbT4=?=@codeaurora.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:eddyz87@gmail.com,m:memxor@gmail.com,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:emil@etsalapatis.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bpf@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95256-lists,linux-doc=lfdr.de,netdevbpf];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 258F0715F5A

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Kumar Kartikeya Dwivedi <memxor@gmail.com>:

On Mon, 06 Jul 2026 12:28:43 -0300 you wrote:
> When the kernel config does not fully match the BPF selftest config
> fragment, some tests may fail to compile. BPF_STRICT_BUILD (defaulting to
> 1) makes any such failure fatal. Mention the option so that developers are
> aware they can set it to 0 to skip broken tests and keep the build going,
> which is particularly useful during bringup or when testing on constrained
> (e.g. distribution) configurations.
> 
> [...]

Here is the summary with links:
  - docs/bpf: Document BPF_STRICT_BUILD=0 to tolerate test build failures
    https://git.kernel.org/bpf/bpf-next/c/575d4e50192d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



