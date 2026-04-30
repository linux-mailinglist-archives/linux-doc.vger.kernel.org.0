Return-Path: <linux-doc+bounces-85277-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A1RM4TP8mnOuQEAu9opvQ
	(envelope-from <linux-doc+bounces-85277-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 05:41:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A06AE49D0CF
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 05:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF2C43084A38
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 03:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8EA39EF10;
	Thu, 30 Apr 2026 03:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uv2UWaUz"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8725939E6E4;
	Thu, 30 Apr 2026 03:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519611; cv=none; b=BbFq5iqEGSHqvtXLahN0RtJmDM7M7vCPAVPyvaJucOitOHV2sKISWpbQswh51ogQRDsiQYlFU7W2QZWz41cauRcvHfKmja9QyNwG1ynxO7xefq2HqOtxQYGaMj96qa4HTZTznttNsrOqqKi5Mqw1ZmdvDL+ktCzkMneqqPrqMLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519611; c=relaxed/simple;
	bh=VshiWipAYtRyMnsD8HAzk//9Evvgk9O0E2BL+Z2O4pk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YwJRtAl9X1rXdED46SwEaNixCymRKBULCS9P5Ii115qgGRLALUPa/12n581VJ79P6suYcSMcffZVcwIt3AcGi+XBHEGMMkGX9WRq5EAY6yitqGNU9HpT6vqO0LKbOe7HC7im3RE9Zsweo3CS5vohP+tV/Ymm7yumjHDQqKrIFHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uv2UWaUz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B9FC2BCB8;
	Thu, 30 Apr 2026 03:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519611;
	bh=VshiWipAYtRyMnsD8HAzk//9Evvgk9O0E2BL+Z2O4pk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Uv2UWaUzVbUyIkgswzPmfhdYjkOpDsLPU3O/WJGYuLPii0uH5tUW/52XxirKakoWd
	 UOuM2PUB7KOW1bgwglcr822uaES5i7LcF+WBOwNRSEheCp/iesotg9S5Mycm4t3zIa
	 4fGTEdM9Oszy1Jxg1CtvOsaJoKHw4RHWDdT87crP/eIybS4+63vm+Q+Yf5sPhl9mCM
	 Z1wnh6X3nJ8a4pe5efyJsskj4Qt+XmWPzBgBT+u1lUkn4POaCvOvYYiHycXgoFQrX0
	 qfjM3O2/8DQFXcpbsAs+5P0iEHUHGEOU+izl980r9KdymeYwT/hPa2KwEk5f9WaTSj
	 GXa9J+FBhfGjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9DD43809A07;
	Thu, 30 Apr 2026 03:26:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv7 09/18] mm/hugetlb: Defer vmemmap population for bootmem
 hugepages
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751956630.2274119.12592851885920371218.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:26:06 +0000
References: <20260227193030.272078-9-kas@kernel.org>
In-Reply-To: <20260227193030.272078-9-kas@kernel.org>
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
X-Rspamd-Queue-Id: A06AE49D0CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,linux-foundation.org,linux.dev,redhat.com,infradead.org,gmail.com,google.com,suse.de,kernel.org,suse.cz,oracle.com,nvidia.com,suse.com,cmpxchg.org,lwn.net,xen0n.name,dabbelt.com,sifive.com,eecs.berkeley.edu,ghiti.fr,meta.com,kvack.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-85277-lists,linux-doc=lfdr.de,linux-riscv];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-foundation.org:email]

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 27 Feb 2026 19:30:10 +0000 you wrote:
> Currently, the vmemmap for bootmem-allocated gigantic pages is populated
> early in hugetlb_vmemmap_init_early(). However, the zone information is
> only available after zones are initialized. If it is later discovered
> that a page spans multiple zones, the HVO mapping must be undone and
> replaced with a normal mapping using vmemmap_undo_hvo().
> 
> Defer the actual vmemmap population to hugetlb_vmemmap_init_late(). At
> this stage, zones are already initialized, so it can be checked if the
> page is valid for HVO before deciding how to populate the vmemmap.
> 
> [...]

Here is the summary with links:
  - [PATCHv7,09/18] mm/hugetlb: Defer vmemmap population for bootmem hugepages
    https://git.kernel.org/riscv/c/209e6d9eb13a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



