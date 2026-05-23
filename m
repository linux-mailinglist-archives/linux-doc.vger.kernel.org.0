Return-Path: <linux-doc+bounces-89195-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Jr71DuyBEWpvmwYAu9opvQ
	(envelope-from <linux-doc+bounces-89195-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 23 May 2026 12:31:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8317B5BE829
	for <lists+linux-doc@lfdr.de>; Sat, 23 May 2026 12:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7446300DE08
	for <lists+linux-doc@lfdr.de>; Sat, 23 May 2026 10:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B45A32860F;
	Sat, 23 May 2026 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFDM7ade"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D359029B77C;
	Sat, 23 May 2026 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779532265; cv=none; b=OyLez0vtbbhPasrSWpJpih8olorl9Us+YAYRDgV2ap3KZeGB+MhQt7anX9kX+EL+eugY0zXWsHUxMzIo6BrjPSi5q/lQQrYa4YNH5Wm9bVcemAwJPQr8niWYYomXhOZY/rXoU9IdLZeF29zpFeBjGQIp0viWQc7vv2hbkqD1McI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779532265; c=relaxed/simple;
	bh=arbMLnszhPRTp7FTZdYvejGv6GONUKk0Y5Oa/IRQaps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lb4jk/3FkzVrFFCQLX3w6YypjwDygVHpXgXv/8qLHCHKovO4CNnS+s7QRHw1zO7t/4WQTEXctnt/hSey1UmpxKtWGxUgErV9hGKO1C15/T4GpW9WfGj0p1vvIwqKEDyFd64oY2j1EZYfDJcgAfOCQdBL6oltX8ZKb9HfVZWX4Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFDM7ade; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40931F000E9;
	Sat, 23 May 2026 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779532263;
	bh=32zkblvEReRXKUqpzQ/oX4QqJ1BPdQrr6JwVi3qqyLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OFDM7ade+kWvBD8c820tptMVqfza8ug42HGmqHNNFQr967U9YDve3fEBj0Xa3o9AA
	 Q5lQLs3LC5cmyq9wb/f4TakGS2jVBLROdrqspiV7AQYVCgHjfNvl2ynDrPxatzFrhT
	 Gph4q9Uxg5SUFllxRpiENqTPg1t1PbsCf7XRsuvuPxbuy3+mahWZtysxhMZ/DQ+ASI
	 VbmSq6qU5AcvbtbI4Ebryzfw1clWVvvYpNvVzzo07bLdFutZ3gfqN2wCJteQxHbKFP
	 I6WNkn3q+jtPgbHX62z7ejMEQl4WZkt/pCmo8j1vgH3X5bSFtTeEkws6K/+8GOlGIu
	 /DnmZqUpv0ZtA==
Date: Sat, 23 May 2026 13:30:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, peterx@redhat.com, david@kernel.org,
	ljs@kernel.org, surenb@google.com, vbabka@kernel.org,
	Liam.Howlett@oracle.com, ziy@nvidia.com, corbet@lwn.net,
	skhan@linuxfoundation.org, seanjc@google.com, pbonzini@redhat.com,
	jthoughton@google.com, aarcange@redhat.com, sj@kernel.org,
	usama.arif@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
	kernel-team@meta.com, linux-man@vger.kernel.org, alx@kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: Re: [PATCH v3 14/16] Documentation/userfaultfd: document RWP working
 set tracking
Message-ID: <ahGB2yVi_fmtNuAd@kernel.org>
References: <20260522133857.552279-1-kirill@shutemov.name>
 <20260522133857.552279-15-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522133857.552279-15-kirill@shutemov.name>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89195-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8317B5BE829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 02:38:55PM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> Add an admin-guide section covering UFFDIO_REGISTER_MODE_RWP:
> 
>   - sync and async fault models;
>   - UFFDIO_RWPROTECT semantics;
>   - UFFD_FEATURE_RWP_ASYNC;
>   - UFFDIO_SET_MODE runtime mode flips.
> 
> It also covers typical VMM working-set-tracking workflow from detection
> loop through sync-mode eviction and back to async.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Assisted-by: Claude:claude-opus-4-6

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

with some nits below

> ---
>  Documentation/admin-guide/mm/userfaultfd.rst | 226 ++++++++++++++++++-
>  1 file changed, 220 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/userfaultfd.rst b/Documentation/admin-guide/mm/userfaultfd.rst
> index 1e533639fd50..cb5d0e0c9fff 100644
> --- a/Documentation/admin-guide/mm/userfaultfd.rst
> +++ b/Documentation/admin-guide/mm/userfaultfd.rst

...

>  The user app can collect the "written/dirty" status by looking up the
> -uffd-wp bit for the pages being interested in /proc/pagemap.
> +uffd bit for the pages being interested in /proc/pagemap.

It's pre-existing, but "being interested" sounds weird to me
Maybe let's change "being interested" to "of interest" or "the app is
interested in".

> -The page will not be under track of uffd-wp async mode until the page is
> +The page will not be under track of userfaultfd-wp async mode until the page is

Here as well I'd s/will not be under track of/will not be tracked by/

>  explicitly write-protected by ``ioctl(UFFDIO_WRITEPROTECT)`` with the mode
>  flag ``UFFDIO_WRITEPROTECT_MODE_WP`` set.  Trying to resolve a page fault
>  that was tracked by async mode userfaultfd-wp is invalid.
> @@ -307,6 +307,220 @@ transparent to the guest, we want that same address range to act as if it was
>  still poisoned, even though it's on a new physical host which ostensibly
>  doesn't have a memory error in the exact same spot.
>  
> +Read-Write Protection
> +---------------------

...

> +**Setup:**
> +
> +1. Open a userfaultfd and enable ``UFFD_FEATURE_RWP`` via ``UFFDIO_API``.
> +   Optionally request ``UFFD_FEATURE_RWP_ASYNC`` as well — it requires
> +   ``UFFD_FEATURE_RWP`` to be set in the same ``UFFDIO_API`` call.
> +
> +2. Register the guest memory range with ``UFFDIO_REGISTER_MODE_RWP``
> +   (and ``UFFDIO_REGISTER_MODE_MISSING`` if evicted pages will need to be
> +   fetched back from storage).

I'd make it

  2. Register the guest memory range with ``UFFDIO_REGISTER_MODE_RWP``.
     Add ``UFFDIO_REGISTER_MODE_MISSING`` if evicted pages will need to be
     fetched back from storage.


-- 
Sincerely yours,
Mike.

