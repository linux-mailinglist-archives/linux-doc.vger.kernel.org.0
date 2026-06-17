Return-Path: <linux-doc+bounces-92691-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gr2tBYwfM2oC9wUAu9opvQ
	(envelope-from <linux-doc+bounces-92691-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 00:28:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C7D69CAA6
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 00:28:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=hcURVoml;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92691-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92691-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F5643018636
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 22:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C195C3A59BA;
	Wed, 17 Jun 2026 22:28:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E667A3783B0;
	Wed, 17 Jun 2026 22:28:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781735302; cv=none; b=GvJDfX33jq3mmAfbvxdoY2Gks8vOkJkGorH2MXWehqOANx1scU1jOh12YXmu9LC+CaYptjGt/ZZz3xAXn51q5SEIFnzsBOKJ5F6Bfp+s7LKAfSsmSxthC/VjsJynYi4g/Yd4yF0kHkWQa4cgbHovpdvJoCla9i7MIKiW55U9jC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781735302; c=relaxed/simple;
	bh=tLbPu8C8b6r5OOHOvBiknQU5eGDzef/mN/LRiilAois=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhwrPUcs6dGjV6Z/Oy8FVbjXep2G2H3ZsYDOQHjM7x+3XvFJLkjFd/+C11ksKi7TWtd0wTt9hwiPeRTbh/uCwkXrTNHvhhDmwDWCA3J+CZDkn/qfQ74gJxz0XhGqHLPT9IhDlwfAuWPVqDJr047zt1vzSEAeWJvPdbmhW9O5Neo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hcURVoml; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KNYyO6SgPKl4C9MF3+RAjBkHpwVrxYNEfsKvOvBWLNg=; b=hcURVomlWT5nqRNu4mssXwPiRF
	7ktKlqqLah/ESrsnAO6TOGb+NLOJLeg9107bAxjEw9M9V3sAlzaUcCiLUt9apxycXIeiKiPih4gqR
	E2mufM5NaHDNLe8jEaU6Ts7ttO3cLylYfAZPi7Varz/WNutEv8s+8yBmeP0cPk0Kw4eYYvik0rd6Y
	RN9uSE61LUWHgRolMlUq/PO7+H4PurkY+ph7z/Xx842H8s48zJPs3mjU79lXW20E7Prs+cNTufO/w
	M4iDrprAndP9FvtTAFa9WZH9hBCX5oFdkS4wI1BDKX/NkpulEn0vhuVKEmqsmg7ftB/h8n3Cbc8Pl
	RmuqUqmA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZyju-0000000DNrv-0BST;
	Wed, 17 Jun 2026 22:28:06 +0000
Date: Wed, 17 Jun 2026 23:28:05 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jane Chu <jane.chu@oracle.com>
Cc: akpm@linux-foundation.org, jack@suse.cz, viro@zeniv.linux.org.uk,
	brauner@kernel.org, muchun.song@linux.dev, osalvador@suse.de,
	david@kernel.org, hughd@google.com, baolin.wang@linux.alibaba.com,
	linmiaohe@huawei.com, nao.horiguchi@gmail.com, lorenzo@kernel.org,
	rppt@kernel.org, peterx@redhat.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 05/11] hugetlb: Convert the vmf->pgoff to PAGE_SIZE
 granularity
Message-ID: <ajMfdQf-Fspwmstr@casper.infradead.org>
References: <20260617172534.1740152-1-jane.chu@oracle.com>
 <20260617172534.1740152-6-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617172534.1740152-6-jane.chu@oracle.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92691-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jane.chu@oracle.com,m:akpm@linux-foundation.org,m:jack@suse.cz,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:linmiaohe@huawei.com,m:nao.horiguchi@gmail.com,m:lorenzo@kernel.org,m:rppt@kernel.org,m:peterx@redhat.com,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:naohoriguchi@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.cz,zeniv.linux.org.uk,kernel.org,linux.dev,suse.de,google.com,linux.alibaba.com,huawei.com,gmail.com,redhat.com,lwn.net,vger.kernel.org,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,infradead.org:from_mime,vger.kernel.org:from_smtp,casper.infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3C7D69CAA6

On Wed, Jun 17, 2026 at 11:25:26AM -0600, Jane Chu wrote:
> +++ b/mm/hugetlb.c
> @@ -5654,6 +5654,8 @@ static inline vm_fault_t hugetlb_handle_userfault(struct vm_fault *vmf,
>  						  unsigned long reason)
>  {
>  	u32 hash;
> +	struct hstate *h = hstate_vma(vmf->vma);
> +	pgoff_t idx = vmf->pgoff >> huge_page_order(h);

If we do manage to make mapping_min_folio_nrpages() return the right
answer for hugetlbfs (see earlier comment), then we can avoid this by doing:

+++ b/mm/hugetlb.c
@@ -5936,7 +5936,7 @@ u32 hugetlb_fault_mutex_hash(struct address_space *mapping, pgoff_t idx)
        u32 hash;

        key[0] = (unsigned long) mapping;
-       key[1] = idx;
+       key[1] = idx >> mapping_min_folio_order(mapping);

        hash = jhash2((u32 *)&key, sizeof(key)/(sizeof(u32)), 0);

although I wonder if we still need the fault mutex array, given that we
now have mapping->invalidate_lock?


