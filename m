Return-Path: <linux-doc+bounces-95127-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QjI4K7qkS2qXXgEAu9opvQ
	(envelope-from <linux-doc+bounces-95127-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 14:51:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA40710C8C
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 14:51:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=V8agmxFZ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95127-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95127-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D123F31566BF
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 10:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F2F3DFC6D;
	Mon,  6 Jul 2026 10:57:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B3F3033D8;
	Mon,  6 Jul 2026 10:57:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783335424; cv=none; b=u/Gm5nNZj0ocWWy70iehJFbo54I7baH/01Z76wgi+2gn7GMl4aJdeSPv7PPssWWdoVrDqPFJ/xs1mxubAsEogvDZTynQdwoAD+iv8pt8PJUIaHqD+sMKW5ZvhYJ8/N8nQ84v6TIsOuvJH38+CoAKVqrQVg6X5VbbgZ7MsEnYoIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783335424; c=relaxed/simple;
	bh=6tBHEmJXAzoJA1Iz9f5VO5wwZ++xTCYJmA5d/rIlLqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6ZZgcS0ISz+H55bbjkhX8JNIbED6GXam7cpcgSGfRpPLseCd1109jnarwsBq49tBRc+kvxLU6xBOxeu93qtBuuxJAfi0Jn1CmDvp1GldhZt1Nazih6ptJj0nJnwurd5/m/Sf9UG6oxPeQoyX+W7DbTeZ1vWuZQ0xTy1UXSppjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8agmxFZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A411F00A3A;
	Mon,  6 Jul 2026 10:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783335420;
	bh=9TtrHnv/qi4lGfcA8XXpkBAbAwnFcDJBMSEy+F8GNE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V8agmxFZj4+EhkprkJmhAyZXVvYWq4x2s9TtPvI+aPJ8hGRyPxKHBvIoSKehw29Da
	 1ANy+GCrq2yTMvNHJ0c4MOFTIAChl8fN7PvEpo9iUlCNqtmwUvdSFRSwMB1ubc/nQj
	 7Kl5KyOlqrk9FTmRVfFFJN1F29moAA+DqFyI0hUZHBtIE1Sqm7pIXa3aju8hzvzEzN
	 yz3HU/aqF5kI22n3IWq4tF5c80AmHLNdEy4keV+b962CnuvzXWIYldJkYxyFdhkEZI
	 SPNGHbDXhKh0KHIRsX8Q90irOU45Ew10VuKnzCwgDhU1gvkCqY79zdIrqvMz9lqWfG
	 nl7hGW6N+VV5A==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id B08FEF40068;
	Mon,  6 Jul 2026 06:56:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 06 Jul 2026 06:56:58 -0400
X-ME-Sender: <xms:-olLat-EzM_LJwbXNIQ8m56H0bVx9T6l27AEua0Yr2b4oHBccVmH5g>
    <xme:-olLavV3vjXB-MrU1kPh94pWGUZC8oDxWnWecG0IDU6ewpN5OCz3lisE7yWX6X69I
    B8gNQwswO-9iSguLvYfUnSD4wMqTuQ3gjH6G7-pzTVOj996tqTjpGQ0>
X-ME-Received: <xmr:-olLagn3MWU5IvT919tfLF_S7hWKq6sYItMIdnVuDOnEgecUgbBYerrQTpAMLA>
X-ME-Proxy-Cause: dmFkZTG3EYxLj0L6vaHvG/JQokkQgmlapkgHi3g9IW9kfpTZuouF9wXLqvehvlO32VWfHa
    duqkk97Xe0HKhXsKxrdHqqNxki8kTptiLONgzXROpKLThcjWTWcvktV3WT6NtElSrQ5L7P
    JC+8p1nEl3HCpzViXlrhmV7vSWrcMtCeweeEKVIc0uVTWaL3+3LvWgTvlFqEkSG644EqaC
    oqD3l16HhA91FHOyL7u55F+RtRGyI/+KZDctCzRTvb3v0JOvk8HJd7JFhUMAqaGDdiiTjG
    VJjpfx1J1Owby6wkIkTfqdvO8SvfXk1POhBv4co9Qvufd9gwLSR2FgcbkoO8MgsA+1wnBo
    tz1w0KLGYpnTvNPu2XdlVEYx5zQx2A5k+0L9Vu5OB7grOD46Efooqb9DRDr5hGTPgX7rqR
    9a/DHNcPYA9z16Dok0ztAUvgOMFTW1aqy4hiJ440P6na09coYDUsMlVHK58n8lwLiIrFms
    03p/Vv56bjGS9mOT9oO5JqsJBQ1HDQqo7av2kSyyD+W52JyHMwVlTNRuzzaPHBRR4Izdfb
    C1bOzI0y5MFPEfrRJO0l/gMpuuAAjgxbxNJcFyv/wUIaY/JXRGzw91DPBuh2Q+GlDKB45h
    hznAG9RxPe5JbMCwi9l3NRVHBeAdUiLbY8Hxn33k9Z4QOJeGslOFTfzTA5wg
X-ME-Proxy: <xmx:-olLalFYYTvofYxEUV4s9LShIBvRseh4RZY3l3XwbNim4X8QP7C_-g>
    <xmx:-olLahSww4oFsZkGr0J7Efk-r06k42NJ3jQWsjf9L9DHyvqQtMfM2Q>
    <xmx:-olLasQMu1HWGipJb8c6Gu-6oG-UxEDrU3Z9jjsolCTTatjkCCsuJA>
    <xmx:-olLavcV5UuOm9YI0rEV1Yr6GswCbsa_IihLc5PiVHsX102z7qRLDA>
    <xmx:-olLarBWU9ljjQU2yd1LTse5SOgGNCYTBY51sYKZ4RD3uRE-duKlpfv_>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jul 2026 06:56:58 -0400 (EDT)
Date: Mon, 6 Jul 2026 11:56:57 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com, 
	david@kernel.org
Cc: ljs@kernel.org, surenb@google.com, vbabka@kernel.org, 
	Liam.Howlett@oracle.com, ziy@nvidia.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	seanjc@google.com, pbonzini@redhat.com, jthoughton@google.com, aarcange@redhat.com, 
	sj@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, kernel-team@meta.com
Subject: Addressing Sashiko AI review
Message-ID: <akuJmbUgGRtjksPr@thinkstation>
References: <20260706084805.8400-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706084805.8400-1-kirill@shutemov.name>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95127-lists,linux-doc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:rppt@kernel.org,m:peterx@redhat.com,m:david@kernel.org,m:ljs@kernel.org,m:surenb@google.com,m:vbabka@kernel.org,m:Liam.Howlett@oracle.com,m:ziy@nvidia.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:pbonzini@redhat.com,m:jthoughton@google.com,m:aarcange@redhat.com,m:sj@kernel.org,m:usama.arif@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kvm@vger.kernel.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kas@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kas@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAA40710C8C

Hi,

I went through the Sashiko review of v9. Only one (test-only) patch
needed changes; sent as v9.1 of 14/15 in this thread:

  https://lore.kernel.org/all/20260706104906.36084-1-kirill@shutemov.name/

  - Tolerate EINVAL from madvise(MADV_NOHUGEPAGE) so the suite does not
    abort on CONFIG_TRANSPARENT_HUGEPAGE=n.
  - rwp-mprotect and rwp-fork-pin now assert the marker survived
    (PM_UFFD_WP) before the access that auto-resolves it, so a kernel
    that dropped the marker fails instead of passing vacuously.

The finding against 11/15 is a pre-existing PAGEMAP_SCAN inconsistency,
unrelated to RWP: an unpopulated pte is reported written by the
PAGE_IS_WRITTEN fast path but not by the generic path. Confirmed
reproducible; fixed separately with Fixes:/stable:

  https://lore.kernel.org/all/20260706104308.34741-1-kirill@shutemov.name/

The rest I assessed as false positives:

  - 07/15, move_pages_huge_pmd() corrupting a non-present PMD: a
    non-present source bails (-EAGAIN/-ENOENT) before the RWP re-arm,
    and the post-lock pmd_same() recheck rejects races -- the re-arm
    only runs on a present PMD.
  - 07/15, UFFDIO_MOVE re-arming RWP "destroys resolved state": this is
    intended. A MOVE-installed page starts tracked; the next guest
    access is the working-set event we want (async auto-resolves it).
  - 10/15, hugetlb stale-marker livelock after UFFDIO_UNREGISTER:
    markers are cleared on unregister and on release via
    change_protection(MM_CP_UFFD_RWP_RESOLVE); the rwp-close tests
    exercise this on hugetlb.
  - 13/15, check_stable_address_space() before the VMA walk in
    UFFDIO_SET_MODE: the ioctl holds mmget_not_zero() + mmap_write_lock
    and only takes per-VMA locks, and a ctx on a failed-fork mm is
    never published to userspace.

The 09/15 findings (userfaultfd_clear_vma() touching ptes before
vma_start_write(), the partial-unregister OOM rollback, and UFFDIO_MOVE
dropping uffd-wp markers) are pre-existing and left as-is; pte-level
access there is serialised by the pte lock.

Ping me if any of these assessments seems off.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

