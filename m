Return-Path: <linux-doc+bounces-85267-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KII5IYPO8mnOuQEAu9opvQ
	(envelope-from <linux-doc+bounces-85267-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 05:37:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A41DE49D03E
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 05:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD13E302A60C
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 03:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DCE383C8C;
	Thu, 30 Apr 2026 03:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDggSUI/"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D36383C74;
	Thu, 30 Apr 2026 03:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519586; cv=none; b=sVdiSA5SMS15tpGEbvS3hTuMkwPYoOjaGZ2q74dCN0sD3sWkBJ12YgsMKaRX8WF42t58Sb67b9Q819eOO4XlkkPkcizE7JkftLVbTM7n+baRdPoZjM+jQ3FVDw9soF0rUXlQV3biGJcV2J5vEncMHY6lsgy19Yu/D2uO+/e9MZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519586; c=relaxed/simple;
	bh=7NsYW91aqne8euCtRV/Zaf8K1DQN8v/p5dHajdo+8yc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jIDMl5/j4uHgBWRaRZmVur8CZXX0WJtCCtSp5rB/AnaQty61hqRQjPnEoU/hkCNFxCHMnGpnYGcgE84G/H+A5zjugxHLls7erJPx02MdPe4wn3027TY7wvJ15f2rk2r+BdhR0WSZQL3nnbGhqgak1Wjj2ePkN/fLy0Gm9wna+Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDggSUI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9403C2BCB8;
	Thu, 30 Apr 2026 03:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519586;
	bh=7NsYW91aqne8euCtRV/Zaf8K1DQN8v/p5dHajdo+8yc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BDggSUI/DU00ul+f1gXDXnnF9GW7Ln4bEPIleiGatyjAcEDR3/0c3HZ45qeuP53O+
	 RHqUBUleYalpg/t7kM2RRrOc7opPlWUoW4RC7GR5y3Bs0jP+staKlwJZvt8AY4Vght
	 GW5FNvgEwFUCcJDe8gKUKchXT0d4R9CHF5faG0OmsqjTk7ZMlgaNiCobP6ZJa8bHjV
	 843djgTadQOXBoY1gLWaFLk3iH4N4aTsoXVrb85auq+UuOKSwFnXafOsRXr416j9cA
	 Mt9x87MJjmjRNDYbbOA3t6kXEA8gYvQZOIzytzDlqzDkDODp/PFewOmUK5nEEmUChG
	 6H7uKZd5Pu/eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD063809A07;
	Thu, 30 Apr 2026 03:25:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 11/18] x86/vdso: Undefine
 CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP for vdso32
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751954081.2274119.4093898849560517911.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:40 +0000
References: <20260227193030.272078-11-kas@kernel.org>
In-Reply-To: <20260227193030.272078-11-kas@kernel.org>
To: Kiryl Shutsemau (Meta) <kas@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 muchun.song@linux.dev, david@redhat.com, willy@infradead.org,
 usamaarif642@gmail.com, fvdl@google.com, osalvador@suse.de, rppt@kernel.org,
 vbabka@suse.cz, lorenzo.stoakes@oracle.com, ziy@nvidia.com, bhe@redhat.com,
 mhocko@suse.com, hannes@cmpxchg.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kernel-team@meta.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev
X-Rspamd-Queue-Id: A41DE49D03E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,linux-foundation.org,linux.dev,redhat.com,infradead.org,gmail.com,google.com,suse.de,kernel.org,suse.cz,oracle.com,nvidia.com,suse.com,cmpxchg.org,lwn.net,xen0n.name,dabbelt.com,sifive.com,eecs.berkeley.edu,ghiti.fr,meta.com,kvack.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-85267-lists,linux-doc=lfdr.de,linux-riscv];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[28];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 27 Feb 2026 19:30:12 +0000 you wrote:
> The 32-bit VDSO build on x86_64 uses fake_32bit_build.h to undefine
> various kernel configuration options that are not suitable for the
> VDSO context or may cause build issues when including kernel headers.
> 
> Undefine CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP in fake_32bit_build.h to
> prepare for change in  HugeTLB Vmemmap Optimization.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,11/18] x86/vdso: Undefine CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP for vdso32
    https://git.kernel.org/riscv/c/76351f2f0c27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



