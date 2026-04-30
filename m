Return-Path: <linux-doc+bounces-85274-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGWKDoPO8mnOuQEAu9opvQ
	(envelope-from <linux-doc+bounces-85274-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 05:37:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BCD49D03F
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 05:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48ADF303649D
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 03:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDA239769F;
	Thu, 30 Apr 2026 03:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EeR+2fmK"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284EB396B79;
	Thu, 30 Apr 2026 03:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519602; cv=none; b=mUh/Rixl8ARBMRLx1sUw+PvH4NgNv3io8KXWJScg0jgMPScPyZU6qxPo9CkLVPgt0625TTjlrEpmfLbVHMAcNyfoFGeYTWQQ7+gkXxV6C+9GSf7YmRNT57OVZZvBGrPY58Q1eiW4VS/HdeIxLNVKVDPjZKKAdL4m1we6s3hJYa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519602; c=relaxed/simple;
	bh=jOQ6F/qbqPQvr86AWUfO60sG0ahit7mDPYuhhIPcxY8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fO96PuIrPmCyqHV/RKl/7F91K88YTtSu8m1kCiaj6QFIbjwNzSan2RKGNwKmu4vU3ilNAi/cJzCdiOu/+u2v+uaUbEtTqvXzTaYbVq0ushLoLmMFLOXoTh9uZe6/2lUZY6p836aX49satWx2EiJshjakAdQwQB+X6DSsNPgJ0AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EeR+2fmK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0920CC2BCC4;
	Thu, 30 Apr 2026 03:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519602;
	bh=jOQ6F/qbqPQvr86AWUfO60sG0ahit7mDPYuhhIPcxY8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EeR+2fmKlkkC3zXJwh38hlAoE2ur0kbazDdCl1B0MzT/OzLC7NC+ZFsu3TPGh+796
	 1/Fwn9HhrPzwpstx5GId8w3mBHNX+inZaFjWNZCcKAt3Hx5c7c9X6uhDHJ7nHFEuTH
	 Mr3HXQraGn7ohoz860VHeqXMnOfcBHYMb4T4DMOb4BFIN5FcUNgi39M2UCuTGwL7hT
	 In6FDxyUbEFipwzNGL+OYqMERE9GjsYnTUp2l1+SjCm14W/kgT4XbCAnl39BDschFA
	 SmzEX01qhFEt2udL9WTiIjiVW38Jch76j0dr7SJpWdZA6RjuNd5fQQuQw3af4SB2gc
	 gWvic7yeoMu2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CD553809A07;
	Thu, 30 Apr 2026 03:25:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 08/18] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751955604.2274119.1021480725497900179.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:56 +0000
References: <20260227193030.272078-8-kas@kernel.org>
In-Reply-To: <20260227193030.272078-8-kas@kernel.org>
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
X-Rspamd-Queue-Id: A5BCD49D03F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,linux-foundation.org,linux.dev,redhat.com,infradead.org,gmail.com,google.com,suse.de,kernel.org,suse.cz,oracle.com,nvidia.com,suse.com,cmpxchg.org,lwn.net,xen0n.name,dabbelt.com,sifive.com,eecs.berkeley.edu,ghiti.fr,meta.com,kvack.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-85274-lists,linux-doc=lfdr.de,linux-riscv];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 27 Feb 2026 19:30:09 +0000 you wrote:
> From: Kiryl Shutsemau <kas@kernel.org>
> 
> If page->compound_info encodes a mask, it is expected that vmemmap to be
> naturally aligned to the maximum folio size.
> 
> Add a VM_WARN_ON_ONCE() to check the alignment.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,08/18] mm/sparse: Check memmap alignment for compound_info_has_mask()
    https://git.kernel.org/riscv/c/9f94db4c7eaa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



