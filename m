Return-Path: <linux-doc+bounces-85269-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELtSCubO8mnOuQEAu9opvQ
	(envelope-from <linux-doc+bounces-85269-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 05:39:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE3A49D080
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 05:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50D4F306C525
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 03:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FB0387578;
	Thu, 30 Apr 2026 03:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDec7xN4"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C2638736E;
	Thu, 30 Apr 2026 03:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519590; cv=none; b=jVMiu2U8qZGdkwaq64EYVJbI2sxGZT50V+dGBUB2mXgEF6hI6XLVNUtViGMCCbOniWR6SM7RWiNYQ79S6ZGbmpgombUEdLuIDsBhwx2hu24QLdLRb/3CP5ol+0HADZT2lfSrPz1n6Q6vrToeYkG7X4QxbUXpI9HOMVy4MtM1G5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519590; c=relaxed/simple;
	bh=jzZuBjGs6d//AuDRvfXUPCJyxdAcdxXtpm8HzJf5lJU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TaIWiqZ0AsUS+IUYg/aAnqBV8RdXmpcBfVQVNrlcUnl2y9ABlFRKPBSV2yU4urXReLsuAZdUntmi+jHCULHs1j6PIrYqFTr6CZGoCUylGu6Ge+qz9R6w1vqtRdwGfHLde637yr1Tu3V3t85NTqRV/FUlBqdDOOYemkdHKygHsPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDec7xN4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BA1C2BCB9;
	Thu, 30 Apr 2026 03:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519590;
	bh=jzZuBjGs6d//AuDRvfXUPCJyxdAcdxXtpm8HzJf5lJU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YDec7xN4GgIHYxxQboOLUbUYbbvBYvnFwvFlnN4Pkvu/m8uiFtXXPmJQYboZEMuwM
	 4pxMYNokfOgCdNlI2KJ6ESz18qolGtTs7BwEGy+u3PBOUBdor0Hog62FPZKdlUichJ
	 tKFpwGoZJRw6d/pJa3z7TPuVtgIxOSxYtVgcgrI8I/PR1/sWZgK4JBRCqP4THb9aN3
	 hOp5H8D4lUYt7ZahrJKsA6nSwJ/0HxzbRn77Hcr02O2pIZJUfET8BQdXHW2xdKR6dm
	 f73ut3z3cqnO57mGnch0C4kBKpYioYz1mr5yhV+dc0QPZ6XkrJzTmQQ664unY5icPx
	 JD55dswsCR4/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E6B3809A07;
	Thu, 30 Apr 2026 03:25:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 05/18] riscv/mm: Align vmemmap to maximal folio size
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751954529.2274119.13385443972464181623.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:45 +0000
References: <20260227193030.272078-5-kas@kernel.org>
In-Reply-To: <20260227193030.272078-5-kas@kernel.org>
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
X-Rspamd-Queue-Id: 4CE3A49D080
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
	TAGGED_FROM(0.00)[bounces-85269-lists,linux-doc=lfdr.de,linux-riscv];
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

On Fri, 27 Feb 2026 19:30:06 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
> struct pages of the head page to be naturally aligned with regard to the
> folio size.
> 
> Align vmemmap to the newly introduced MAX_FOLIO_VMEMMAP_ALIGN.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,05/18] riscv/mm: Align vmemmap to maximal folio size
    https://git.kernel.org/riscv/c/476849b0fba4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



