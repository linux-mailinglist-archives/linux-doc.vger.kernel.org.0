Return-Path: <linux-doc+bounces-87195-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJwJD25jA2oq5gEAu9opvQ
	(envelope-from <linux-doc+bounces-87195-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 19:29:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 270ED525D35
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 19:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 882A6302DCCE
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 17:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109493DB96B;
	Tue, 12 May 2026 17:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCP36D6h"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9792DE6E3;
	Tue, 12 May 2026 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606954; cv=none; b=AbEm/TpnG2pVKNm34LRkpZrYDZX1O96s6QKEQ5dDq5dQczYseOqoj2LKal/c9iOGBtiiZ3rGPu/BSPcXIApB8PbO/4e0TYR3gvnChLekxpaDsAVhxIq7yEvA2uNq+rVhteb7DtX3IVp7I1ZkEB8Oqm2Yy480MBgQQAn7dKNYLWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606954; c=relaxed/simple;
	bh=MSjMy5bmTzDizOb+S9K6KUopbtT/uS4r6RDPEY3RoL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iRBJgr9xL2Tj7FfyNM+q2/yJqkGCMH2fu9fv3vcMd+GgawlntNlgyv7tS/2zXWvi3wIqGacKhU4guxeE3vKnIVgST+BXKCc/jCn+0u6+0so9Llb5OAAlWRyY3JsVG07hvXmrVVBNyJOaVInopE7i2ahtUgRoZbqtRC+Aw5t5hOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCP36D6h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4FBC2BCB0;
	Tue, 12 May 2026 17:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778606953;
	bh=MSjMy5bmTzDizOb+S9K6KUopbtT/uS4r6RDPEY3RoL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCP36D6hGBoyDeRJn/Dc1qzoW9BtL6Ojle5dETY8KsAJvmYKrQYVDOd5WXHLNHV7C
	 4Eod8bk+3W+Q70RCUd3tzETjDsNitvvnW+5Cg82IhFOYpCmDxj7Rr7ccrmK2IRNc+t
	 5IaZS3UIEbEafkUCWfZptmDD3+FTDp2Nj/PCzybHGcZ3ebmTPI/Gs+09wqGexreFkL
	 7H0ReV35a+jcmVhvUl+jFMkBHS22NO/4vKhC+HT2hILD4350RqMyY7DlzrSbZZcsWu
	 O2wj3nQwjt3cD/hKEh5TONcnwywnwAtzzmadmQU44xkaxP3ex2wV94BnHwbjEm3iov
	 CFAEFin2mdUeA==
Date: Tue, 12 May 2026 20:29:02 +0300
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
Subject: Re: [PATCH v2 09/14] mm/userfaultfd: add RWP fault delivery and
 expose UFFDIO_REGISTER_MODE_RWP
Message-ID: <agNjXmuEHSaWKrv9@kernel.org>
References: <cover.1778254670.git.kas@kernel.org>
 <454b3381cb7ead65291b2d7e24c0bff62e55c41b.1778254670.git.kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <454b3381cb7ead65291b2d7e24c0bff62e55c41b.1778254670.git.kas@kernel.org>
X-Rspamd-Queue-Id: 270ED525D35
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87195-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 04:55:21PM +0100, Kiryl Shutsemau (Meta) wrote:
> Wire the fault side of read-write protection tracking and turn the
> userspace interface on.
> 
> An RWP-protected PTE is PAGE_NONE with the uffd bit set. The
> PROT_NONE triggers a fault on any access; the uffd bit distinguishes
> it from plain mprotect(PROT_NONE) or NUMA hinting.
> 
> Fault dispatch, per level:
> 
>   PTE     handle_pte_fault()    -> do_uffd_rwp()
>   PMD     __handle_mm_fault()   -> do_huge_pmd_uffd_rwp()
>   hugetlb hugetlb_fault()       -> hugetlb_handle_userfault()
> 
> The RWP branches gate on userfaultfd_pte_rwp() / userfaultfd_huge_pmd_rwp()
> (VM_UFFD_RWP plus the uffd bit) and fall through to do_numa_page() /
> do_huge_pmd_numa_page() otherwise. Each delivers a
> UFFD_PAGEFAULT_FLAG_RWP message through handle_userfault(); the handler
> resolves it with UFFDIO_RWPROTECT clearing MODE_RWP.
> 
> userfaultfd_must_wait() and userfaultfd_huge_must_wait() add matching
> protnone+uffd waiters so sync-mode fault handlers block correctly.
> 
> Expose the UAPI:
> 
>   UFFDIO_REGISTER_MODE_RWP   -> UFFD_API_REGISTER_MODES
>   UFFD_FEATURE_RWP           -> UFFD_API_FEATURES
>   _UFFDIO_RWPROTECT          -> UFFD_API_RANGE_IOCTLS
>                                 UFFD_API_RANGE_IOCTLS_BASIC
> 
> UFFD_FEATURE_RWP is masked out at UFFDIO_API time when PROT_NONE is
> not available or VM_UFFD_RWP aliases VM_NONE (32-bit), so userspace
> never sees an advertised-but-broken feature.
> 
> Works on anonymous, shmem, and hugetlb memory.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Assisted-by: Claude:claude-opus-4-6

A small nit below, other than that

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> @@ -347,6 +359,14 @@ static inline bool userfaultfd_must_wait(struct userfaultfd_ctx *ctx,
>  	 */
>  	if (!pte_write(ptent) && (reason & VM_UFFD_WP))
>  		goto out;
> +	/*
> +	 * PTE is still RW-protected (protnone with uffd bit), wait for
> +	 * userspace to resolve. Plain PROT_NONE without the marker is not
> +	 * an RWP fault.
> +	 */
> +	if (pte_protnone(ptent) && pte_uffd(ptent) &&
> +	    (reason & VM_UFFD_RWP))

Nit: this fits even in 80-chars line

> +		goto out;
>  
>  	ret = false;
>  out:

-- 
Sincerely yours,
Mike.

