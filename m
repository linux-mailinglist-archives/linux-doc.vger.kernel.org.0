Return-Path: <linux-doc+bounces-93954-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1E7tOY5DQmoq3AkAu9opvQ
	(envelope-from <linux-doc+bounces-93954-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 12:06:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7426D8A5A
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 12:06:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lxBdgJLs;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93954-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93954-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD937304423E
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 09:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE203B71DE;
	Mon, 29 Jun 2026 09:58:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62AA6FC5;
	Mon, 29 Jun 2026 09:58:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727132; cv=none; b=KBXfIjb0XjHohVT1ywWY8G/2/roFRR3x9teC76cHwQaSWNgrFSTQ9MLeT5f9s1fMavIr6a/+Ol1u/D4RpyW6EYjecuXu3QAvt5gPkMZQG3Mv4tHG54+1bBw7ZsOuuXwxSUN2q96Hnc56In/wfLJqFPDqsJ3xIPj5vp1IZPopR/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727132; c=relaxed/simple;
	bh=lnandbyvD5gXZLp0WMKqf2DWbVVhmkSsIuwjLNKIQNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAhLVq/jbabb4v0oSE6uxL785Jmt+XuHJZomBHhYCRo2dpHvbSSru6tiQSYWi3AcJiNK0C8v2eFs7wQzhJ7O6h6sKSCsh+4EKDqVUFA5JhcVppjZyb/yc59Q8XPUs/qXGR3ka3LleayTsshNeUeZtlgU/6ZKrX6VQ8/PldHLy1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxBdgJLs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9441F000E9;
	Mon, 29 Jun 2026 09:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727131;
	bh=opowCa2ZvIDE9fF6/MgL802+A6a0EGc5rtw+OZ6dgaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lxBdgJLs0kGs9j01dlQJ60KK/e8g5xMS8KKXGGi0H9F/bdVZdb2FdYlqn715ZRY88
	 SquVXra9Xgh9/dIiWwEMLlpemoZuZPw5lnSkPlaUS7F3o2k1mqdapRCy0LCXl0095Z
	 L6P3Cc6K0ADLqpYZ2X2i4yYYrjdCNwmIr+V9NEXbwiZYEx041eXfkFPr4mvBGyGhkB
	 89owQTyLFU21r4/x2PP/yGZpjA4ru8qkfuWIbUhY6IHEBUbdAER69uJ8d67ZvLqjud
	 S7Ui3Xdj7RmjUJOGVkewC6G6yq39R7f2q84w+3vhJyhAFvfEUb/0b2zG9RSPnjgHfp
	 B7W+Ra4pS4rrA==
Date: Mon, 29 Jun 2026 10:58:42 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, sj@kernel.org
Subject: Re: [PATCH v2] docs: pagemap: fix flags location, member name and
 sample code
Message-ID: <akJBvKcTU1dw8M9I@lucifer>
References: <20260626162710.25844-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626162710.25844-1-zenghui.yu@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zenghui.yu@linux.dev,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:sj@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-93954-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer:mid,linux.dev:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C7426D8A5A

On Sat, Jun 27, 2026 at 12:27:10AM +0800, Zenghui Yu wrote:
> The userland visible page flags (KPF_*) were initially moved to
> include/linux/kernel-page-flags.h in commit 1a9b5b7fe0c5 ("mm: export
> stable page flags"), and later moved to
> include/uapi/linux/kernel-page-flags.h in commit 607ca46e97a1 ("UAPI:
> (Scripted) Disintegrate include/linux").  Update the doc to reflect the
> current location of these flags.
>
> The member @walk_end of struct pm_scan_arg {} was wrongly written as
> "end_walk".
>
> The first sample code of the PAGEMAP_SCAN ioctl wrongly used the
> PM_SCAN_CHECK_WPASYNC flag twice, instead of the PM_SCAN_WP_MATCHING flag.
> The second one included the wrong category in the required mask -
> PAGE_IS_FILE should be used instead of PAGE_IS_SWAPPED as per the
> intention.
>
> Fix them all together.
>
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

> ---
>
> * From v1 [1]:
>   - drop PAGE_IS_SWAPPED in .category_mask (David)
>   - fix typo in commit message (David)
>   - didn't collect SeongJae's R-b (as the content has changed anyway) but
>     thank you for that!
>
> [1] https://lore.kernel.org/20260625174447.24292-1-zenghui.yu@linux.dev
>
>  Documentation/admin-guide/mm/pagemap.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
> index c57e61b5d8aa..20e3fe76f099 100644
> --- a/Documentation/admin-guide/mm/pagemap.rst
> +++ b/Documentation/admin-guide/mm/pagemap.rst
> @@ -67,7 +67,7 @@ number of times a page is mapped.
>   * ``/proc/kpageflags``.  This file contains a 64-bit set of flags for each
>     page, indexed by PFN.
>
> -   The flags are (from ``fs/proc/page.c``, above kpageflags_read):
> +   The flags are (from ``include/uapi/linux/kernel-page-flags.h``):
>
>      0. LOCKED
>      1. ERROR
> @@ -264,7 +264,7 @@ The ``struct pm_scan_arg`` is used as the argument of the IOCTL.
>      provided or not.
>   3. The range is specified through ``start`` and ``end``.
>   4. The walk can abort before visiting the complete range such as the user buffer
> -    can get full etc. The walk ending address is specified in``end_walk``.
> +    can get full etc. The walk ending address is specified in ``walk_end``.
>   5. The output buffer of ``struct page_region`` array and size is specified in
>      ``vec`` and ``vec_len``.
>   6. The optional maximum requested pages are specified in the ``max_pages``.
> @@ -275,7 +275,7 @@ Find pages which have been written and WP them as well::
>
>     struct pm_scan_arg arg = {
>     .size = sizeof(arg),
> -   .flags = PM_SCAN_CHECK_WPASYNC | PM_SCAN_CHECK_WPASYNC,
> +   .flags = PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC,
>     ..
>     .category_mask = PAGE_IS_WRITTEN,
>     .return_mask = PAGE_IS_WRITTEN,
> @@ -288,7 +288,7 @@ present or huge::
>     .size = sizeof(arg),
>     .flags = 0,
>     ..
> -   .category_mask = PAGE_IS_WRITTEN | PAGE_IS_SWAPPED,
> +   .category_mask = PAGE_IS_WRITTEN | PAGE_IS_FILE,
>     .category_inverted = PAGE_IS_SWAPPED,
>     .category_anyof_mask = PAGE_IS_PRESENT | PAGE_IS_HUGE,
>     .return_mask = PAGE_IS_WRITTEN | PAGE_IS_SWAPPED |
> --
> 2.53.0
>

