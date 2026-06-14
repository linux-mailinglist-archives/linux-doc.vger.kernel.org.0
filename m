Return-Path: <linux-doc+bounces-92284-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gTSgKwZxLmr5vwQAu9opvQ
	(envelope-from <linux-doc+bounces-92284-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 11:14:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F4163680BAA
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 11:14:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="UMx8Eb/8";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92284-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92284-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EFB9300F500
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 09:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA0B390C9E;
	Sun, 14 Jun 2026 09:14:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C4D31714B
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 09:14:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781428484; cv=none; b=Fg3IJooa2H4sXc8+3r3j++d/Vx+XsTD7pk06jlOVp/iFkWAVFQO9oxcfOGQIHZofSFUJc0fN/ABXzrxDGGVChWdQssPNZdgyOnBdwR9sYfHcMjB5A02RBTqtgX4HVPLglOGz7E1CfcyxrpGisboOBtYEE7AH8TgCQ7ADdM8pLDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781428484; c=relaxed/simple;
	bh=pMDQCbEdAremaxVE4eNOWM6qSqcfZc6GO4d6bu0Q+C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0uvg3yT8FRcB3bz4kdqoSvgAPlDhIY/l5PW1a2DFOUc9ejPN8Li6oxQGdJVRXz0dAEiTLwbYEDjgmBsJPpCXpTf9GG/Gor3itfGSqP8l1trBPIo6ZxGtqgRjyHQ3nsrVxsQIgcQZwHgFBjY5FZ16QtEcMl1/hSRff1BDn6DJEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMx8Eb/8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BD81F000E9;
	Sun, 14 Jun 2026 09:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781428482;
	bh=PTdII44FGFmJdbMtCPKaS2eB6vk6Xg9WicWBVorhrQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UMx8Eb/8JnZEGxjCkj5fbSZIF8ouy/FZaJqolliub6IojIr7yzYw9OXytXU+YyLzG
	 1sfXtl3YbiZTHx4pobKS44wrOe/9MYhm2tWwd31Ert3JNdVaXqg114iI+UWTuy4OjW
	 eEq7hlRisAo9IafOG18VOinIoj/K4b0RqrIZFDM1y5lIoa8PmtHJeKDDrIZSW/aEVw
	 WaSKWCYHK5mZ04tE5rKZ8HuRwYBK/0w2yG1YGIlxnc5hKe4rk9Nn3wgPZK3PHPflvl
	 Us+XMr6qFdCT9iRh/a2jnmp39Sb0AR4c4PW9TiXmXDwBbHO7SOyAGNjWnkqwUDaRak
	 h+seQ0Hl9eOnw==
Date: Sun, 14 Jun 2026 12:14:35 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] docs/mm: describe current criteria for enabling split
 page table lock for PTE tables
Message-ID: <ai5w--zzNaUHuQ6S@kernel.org>
References: <20260613221448.98657-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613221448.98657-1-enelsonmoore@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:skhan@linuxfoundation.org,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:corbet@lwn.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-92284-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F4163680BAA

On Sat, Jun 13, 2026 at 03:14:47PM -0700, Ethan Nelson-Moore wrote:
> The mm documentation regarding split page table lock for PTE tables
> refers to the CONFIG_SPLIT_PTLOCK_CPUS config option, which was
> superseded by CONFIG_SPLIT_PTE_PTLOCKS in commit 394290cba966 ("mm:
> turn USE_SPLIT_PTE_PTLOCKS / USE_SPLIT_PTE_PTLOCKS into Kconfig
> options"). Update the documentation to refer to the current option and
> document the situations in which this feature is not supported.
> 
> Discovered while searching for CONFIG_* symbols referenced in the
> kernel but not defined in any Kconfig file.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  Documentation/mm/split_page_table_lock.rst | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
> index cc3cd46abd1b..c9d16024543b 100644
> --- a/Documentation/mm/split_page_table_lock.rst
> +++ b/Documentation/mm/split_page_table_lock.rst
> @@ -37,9 +37,12 @@ There are helpers to lock/unlock a table and other accessor functions:
>   - pmd_lockptr()
>  	returns pointer to PMD table lock;
>  
> -Split page table lock for PTE tables is enabled compile-time if
> -CONFIG_SPLIT_PTLOCK_CPUS (usually 4) is less or equal to NR_CPUS.
> -If split lock is disabled, all tables are guarded by mm->page_table_lock.
> +Split page table lock for PTE tables is enabled compile-time (via
> +CONFIG_SPLIT_PTE_PTLOCKS) if NR_CPUS is greater than or equal to 4 and an
> +MMU is being used. However, it is not supported on ARM processors with
> +virtually indexed, physically tagged caches, PA-RISC processors older than
> +the PA-8000, or 32-bit SPARC processors. If split lock is disabled, all

"it is not supported on some architectures" would be enough IMO.

> +tables are guarded by mm->page_table_lock.
>  
>  Split page table lock for PMD tables is enabled, if it's enabled for PTE
>  tables and the architecture supports it (see below).
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.

