Return-Path: <linux-doc+bounces-87179-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGVwBd1cA2qf5QEAu9opvQ
	(envelope-from <linux-doc+bounces-87179-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 19:01:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9CA525526
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 19:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D3D5301BEC3
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 17:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7AA3D79E3;
	Tue, 12 May 2026 17:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sReN+8sz"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3666632BF52;
	Tue, 12 May 2026 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605271; cv=none; b=eB487ofyvtrWUdBcH6bFxv2lB61LVarKoZMm1/Lbh4KzXZdbZmED7RZfAuleyJ1iiz+/ebA3Zs5373ZElSNaAfcrE0wCDUVIryinMPhk9mjsvgVAcDClFMFHztmiL+pCLckWLTVxDCY697ATNyN5cyzMXipv1IE1f7bh7wpHp8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605271; c=relaxed/simple;
	bh=DtlyNiMrzWusjB1ZJ021vGTLZ2HqkR9/Z/A1b8oXmgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JS6IzDJ6YiwbmgReC9XhIUY9/88phHyrymkpWsHTECKWsHXfIsMvMsNyFQbQwbjlnHwHglZyVOKH3lZiQY9jxn2URGBK2sWeU19nc0d/BgwVXl5swdVUsMqvXAj2LHGOrYvQ6hLYqTayssjnc/VeeS7jfF49mMLJKvCEhW+9IPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sReN+8sz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D66C2BCB0;
	Tue, 12 May 2026 17:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778605270;
	bh=DtlyNiMrzWusjB1ZJ021vGTLZ2HqkR9/Z/A1b8oXmgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sReN+8szSUR0SdVUx+BPZZp6hbx/FJdb5E/n17whXNc8v21K2GEzYJYVCoMGNYXVM
	 Nf6C4YAOyhFhxHJaeem/Vja3XOhGyKm/p/U+iE6txnRmvOOcPtXVZhVeE2Z3RjJZAR
	 wDhqq5sqxAeVGNpdlYhGs9xR4iay1KE3bK8X2fKyT0zJZDLh3gcBiC8sEuN9xheKT1
	 zZaOU+Qo98ajxpv6pxDoXFtFQ/5vcUN/UDI1S7UpuB4jqx/+tFPzSBazqdAcLefJsG
	 lyvdB4elld7Y/3AQ+vlBxaFTNGGAaYEKzkTwvIpq18BQ401Sk4t0k/mWrSfVA4JGkv
	 4+He74wa4NfRg==
Date: Tue, 12 May 2026 20:00:59 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: akpm@linux-foundation.org, peterx@redhat.com, david@kernel.org,
	ljs@kernel.org, surenb@google.com, vbabka@kernel.org,
	Liam.Howlett@oracle.com, ziy@nvidia.com, corbet@lwn.net,
	skhan@linuxfoundation.org, seanjc@google.com, pbonzini@redhat.com,
	jthoughton@google.com, aarcange@redhat.com, sj@kernel.org,
	usama.arif@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2 07/14] mm: handle VM_UFFD_RWP in khugepaged, rmap, and
 GUP
Message-ID: <agNcywWC3bnZiSHX@kernel.org>
References: <cover.1778254670.git.kas@kernel.org>
 <c88e78ffb2cc5ca81f5a6319b7e3c4ffd8baefe1.1778254670.git.kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c88e78ffb2cc5ca81f5a6319b7e3c4ffd8baefe1.1778254670.git.kas@kernel.org>
X-Rspamd-Queue-Id: 7D9CA525526
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87179-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 04:55:19PM +0100, Kiryl Shutsemau (Meta) wrote:
> Three mm paths outside the fault handler gate on the uffd PTE bit
> today: khugepaged (skip collapse on ranges carrying markers), rmap
> (cap unmap batching), and GUP (force a fault through
> gup_can_follow_protnone). Extend each to treat VM_UFFD_RWP the same
> as VM_UFFD_WP; otherwise per-PTE RWP state is silently destroyed or
> bypassed.
> 
> khugepaged: try_collapse_pte_mapped_thp() and
> file_backed_vma_is_retractable() already refuse to collapse or
> retract page tables on ranges carrying the uffd PTE bit. Broaden the
> VMA predicate from userfaultfd_wp() to userfaultfd_protected() so
> VM_UFFD_RWP ranges get the same protection. hpage_collapse_scan_pmd()
> needs no change — its existing pte_uffd() check already catches an
> RWP PTE because it carries the uffd bit.
> 
> rmap: folio_unmap_pte_batch() caps batching at 1 for VM_UFFD_RWP so
> the restore path handles each PTE with its own marker.
> 
> GUP: gup_can_follow_protnone() forces a fault on VM_UFFD_RWP VMAs
> regardless of FOLL_HONOR_NUMA_FAULT. RWP uses protnone as an
> access-tracking marker, not for NUMA hinting, so any GUP — read or
> write — must go through the userfaultfd fault path.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Assisted-by: Claude:claude-opus-4-6

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 10 +++++++++-
>  mm/khugepaged.c    | 18 +++++++++++-------
>  mm/rmap.c          |  2 +-
>  3 files changed, 21 insertions(+), 9 deletions(-)

-- 
Sincerely yours,
Mike.

