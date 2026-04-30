Return-Path: <linux-doc+bounces-85275-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFhxDc7N8mnOuQEAu9opvQ
	(envelope-from <linux-doc+bounces-85275-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 05:34:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CD55C49CF88
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 05:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10A113056E24
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 03:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FE239936B;
	Thu, 30 Apr 2026 03:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NG/keSn0"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A46347FC4;
	Thu, 30 Apr 2026 03:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519605; cv=none; b=fnXtGg0bhUEJzEomS7OUQqwNgZw9zw6l87dbsfEqqyH8EeeLhc2FrAujIPb+GbVqUBQbR9Qz8ytWPcLUokst/BT4gv5C9N7S2QC5QogL5tDTtwYIKH2e9fF7tlcb9SB/UkPhH7nL15Kt8zAC1isxN91qTQo9jWpJSFW4J8sb8/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519605; c=relaxed/simple;
	bh=fhSNmqrG5HsEC/X36MILLZcbTZ/au30iHuph+y5PVBY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=byFSM5PZpk54D3smUGF8/qWJ1MvEiPOTU/ko6WkxBkh6ETeQYW6onmuUwXZZMsMRD8bMYH6Z7S9oj+QRKm4isjBOnCFzqbmmHhLsWvoc1OGG/Ldp+RbMTjkRRqpToEnIf1dVWwFaWJ3feNp8eL7q8kCggXT6tcfoAIigvCXIkEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NG/keSn0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BC9C2BCC9;
	Thu, 30 Apr 2026 03:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519605;
	bh=fhSNmqrG5HsEC/X36MILLZcbTZ/au30iHuph+y5PVBY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NG/keSn0FdCovg8MaqpF8Evbj/6L9DumthcIlwwxhgqo4krFVNquz8+s6I6cAbdTk
	 F7gB7AFBovML2uNA08fug18O6ouheKOBf7t2Cnd7nzLWNimtDo+aiOW2df5uW2tRMT
	 rjTagxlakUXzJK5UOaOgiNsPLEmBzI0SrCWLU0VLJ0JlqZw+7s1UFWYN+UsHMoS2Qd
	 iECXbmORVBx8yix7TpNhGpQ4YIOkqqw/43+B09zOhAKOAI6t3lqj+2vCV+m4mWAT9q
	 7VgoHD8YmgUg9LVrLh8uiVHBbs9Yxff6nj7MkquNCz6a+id9IgGedB0JwH8SAImjFL
	 engiwcFkxaZoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E0C3809A07;
	Thu, 30 Apr 2026 03:26:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 02/18] mm: Change the interface of prep_compound_tail()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751956029.2274119.5996274092422873804.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:26:00 +0000
References: <20260227193030.272078-2-kas@kernel.org>
In-Reply-To: <20260227193030.272078-2-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 muchun.song@linux.dev, david@redhat.com, willy@infradead.org,
 usamaarif642@gmail.com, fvdl@google.com, osalvador@suse.de, rppt@kernel.org,
 vbabka@suse.cz, lorenzo.stoakes@oracle.com, ziy@nvidia.com, bhe@redhat.com,
 mhocko@suse.com, hannes@cmpxchg.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, david@kernel.org
X-Rspamd-Queue-Id: CD55C49CF88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,linux-foundation.org,linux.dev,redhat.com,infradead.org,gmail.com,google.com,suse.de,kernel.org,suse.cz,oracle.com,nvidia.com,suse.com,cmpxchg.org,lwn.net,xen0n.name,dabbelt.com,sifive.com,eecs.berkeley.edu,ghiti.fr,meta.com,kvack.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-85275-lists,linux-doc=lfdr.de,linux-riscv];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-foundation.org:email]

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 27 Feb 2026 19:30:03 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> Instead of passing down the head page and tail page index, pass the tail
> and head pages directly, as well as the order of the compound page.
> 
> This is a preparation for changing how the head position is encoded in
> the tail page.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,02/18] mm: Change the interface of prep_compound_tail()
    https://git.kernel.org/riscv/c/f0369fb13619

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



