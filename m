Return-Path: <linux-doc+bounces-85276-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOhVCQDO8mnOuQEAu9opvQ
	(envelope-from <linux-doc+bounces-85276-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 05:35:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC9E49CF9E
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 05:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B52B305CF73
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 03:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6ED39DBEA;
	Thu, 30 Apr 2026 03:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDZoBJBy"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B93739DBE1;
	Thu, 30 Apr 2026 03:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519610; cv=none; b=Z3N9jmioY1Z5LbwmJv2DR8GZ0NePFZjuMh5n+Rh42H4UgGrNfDjxg6Dx0tckYwxNQrNnO4AhzSsfNulA6Tv4NDG//RMXLKDiUHFykMQP7M/iFcfxWkbfxPqZ+z3jAzh51BbcMUMwBPOVqFIXrREBluDpO6bwt1So06KYkOJvYH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519610; c=relaxed/simple;
	bh=iFqroCI9QhrRjRPr6nqnuqqWoIPtsKBpJSs5D3LwRHU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XfhJqXTB95yudGqm1E8WlZvcuZLrTURhQ6vHbsW/qFMMe/yOtN1M2FuJHGkfgTaWDcDKb31iovvXJv/WHw/vvpDRHsnX7oTpW3w8LrJy5M7KMp+ZLWLAq/lMVRifnMz8WwI6DO572udPH3oo7oEgUoOgrh//dpCt7UTgxYYPTbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDZoBJBy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F82C2BCB8;
	Thu, 30 Apr 2026 03:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519609;
	bh=iFqroCI9QhrRjRPr6nqnuqqWoIPtsKBpJSs5D3LwRHU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qDZoBJByuNsp58dPyZrm1NWzEP6bDZxrt4juzc1Ayrev7wPMACk+uUM41eKdHbD5s
	 i6WA8mJHerklMdFyLbo0sLVn0Wn6JtNrrlu6qNz2XPV+xTwfEr2Ao33Ahz05lpp4G3
	 NHYs0GmngPzMGLvWDKQZbDWIYnpWyiSQgC7r0FnDEL/o/BYqTsd2fj/qa5a5riwjV/
	 qHReu8/iWe0Kzrh+UPBK8/K9grFHLk4eTC8pCN6N48Fw1G4diyvsMP/zpg6m8WwzEd
	 Wuvzr7EgyEvnskXgDxRM78pQgyr7y7kHNbprI6MzT+kmtUllYIlaB8//LC96wQV7Xf
	 WIQc8djoGzeYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FC563809A07;
	Thu, 30 Apr 2026 03:26:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 14/18] hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751956479.2274119.8317675820783174184.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:26:04 +0000
References: <20260227193030.272078-14-kas@kernel.org>
In-Reply-To: <20260227193030.272078-14-kas@kernel.org>
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
X-Rspamd-Queue-Id: BBC9E49CF9E
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
	TAGGED_FROM(0.00)[bounces-85276-lists,linux-doc=lfdr.de,linux-riscv];
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

On Fri, 27 Feb 2026 19:30:15 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> The VMEMMAP_SYNCHRONIZE_RCU flag triggered synchronize_rcu() calls to
> prevent a race between HVO remapping and page_ref_add_unless(). The
> race could occur when a speculative PFN walker tried to modify the
> refcount on a struct page that was in the process of being remapped
> to a fake head.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,14/18] hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
    https://git.kernel.org/riscv/c/01b1d0ffb6f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



