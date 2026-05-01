Return-Path: <linux-doc+bounces-85411-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCTRDFSF9GlmCAIAu9opvQ
	(envelope-from <linux-doc+bounces-85411-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 01 May 2026 12:49:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C984C4ABBEB
	for <lists+linux-doc@lfdr.de>; Fri, 01 May 2026 12:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4702300F9F7
	for <lists+linux-doc@lfdr.de>; Fri,  1 May 2026 10:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267DF392C57;
	Fri,  1 May 2026 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nldl3APj"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02957392C25;
	Fri,  1 May 2026 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777632588; cv=none; b=H531oOAmYT3Iokj3IOIUGt+8JFDC0Zhco3Bo256ftkcJTsUN0teaVvzrtBlr368+erH6qGZULIJKinpvhdEKsjnpThOTim+xdfmJR180kE8LZFAaTAwzGSC8lJvtPzHdfs67UpCT6uubNm/vsiqK5aFyj+A0b8FNmaCUPGxU6D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777632588; c=relaxed/simple;
	bh=HD0Tqz4C9rhRfdYYiP0rPWaWDc2g50e36CrYQM3nGxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnVxlQdUAq/zy+tnTuczMf9hNrdffwFyQm7kMEqLpjhv1ADQtiKs4ZBq+B9VdoEgLeL58RxBX70aODMnWEtXhaqcPNjDW8nhrbBErnUXnnab84GzQXgu/IMaIcgPYaY8KWrtoWkxp/i2TgIJ+b7U8eE6uSwdt9MNBTArBT1Go/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nldl3APj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40F8C4AF0B;
	Fri,  1 May 2026 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777632587;
	bh=HD0Tqz4C9rhRfdYYiP0rPWaWDc2g50e36CrYQM3nGxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nldl3APj4k5NmkwML5JQj613GISjS/YZoyiK+IuESCz8ABmPVGDtNq3wuNUYj02KJ
	 IcJbzrvrsx6qxhZrPFxlR4FWQuzxmsGdEPefDRL/XSvA+UcZRv2gQLen0spFkcVxnd
	 8N2zfkpiMz6pgRjPSgb08yQrAnRYyREBFGS/rOTVqxdRRcYUPWyQTtRRLz4PO+RaYZ
	 XqgOcnlcWFUcTghQP/m8hQMWTfoJvgKBq9zKvpgfijDhBdn3GF0tD7UiIetarf+hcZ
	 C6aruaZvFg8kcryazmZ1gekMVU0QVLLQjJa918n9QzNbQVPytOiu3BqfI7XL57UcIr
	 16FOkfcrHNAiQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 056D4F40074;
	Fri,  1 May 2026 06:49:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 01 May 2026 06:49:46 -0400
X-ME-Sender: <xms:SYX0aUN2D2see6JsS40UGsYzV-TdLmJIoE_g9iPSwiIE3WyqYRr9bA>
    <xme:SYX0aYkXT7bYzRnP9wS09HSapObfGL_RGLY6QOzBLfW05HJEdNDudYlQLyUcGAQz1
    AjY8_1BSXK6i507qIIh2nqPjNgcROTRh7iMAvsI0_3KDpTjNIqhdJY>
X-ME-Received: <xmr:SYX0aQ3hlIZPTTT8WiOajqFwDvjDTdhDdwMnTdI7Tk9pgZO7LBEizDalMACTSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeltddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttd
    dtvdenucfhrhhomhepmfhirhihlhcuufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgv
    lhdrohhrgheqnecuggftrfgrthhtvghrnhepgeetuedtjefhkeeuiefgudduvdfgvdeiue
    eigeehheehudetuedtkeelhfeihedunecuffhomhgrihhnpehsrghshhhikhhordguvghv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepgeeipdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    eprhhpphhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghrgiesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhjsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhurhgvnhgssehgohho
    ghhlvgdrtghomhdprhgtphhtthhopehvsggrsghkrgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhirghmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphhtthho
    peiiihihsehnvhhiughirgdrtghomh
X-ME-Proxy: <xmx:SYX0aQWUboTYJuenHlupRY5oXKxRFad0qCjOCqd2ipDOtnmc5LIeHw>
    <xmx:SYX0abjT-apuXfagsXlOx9iXJqsmYwZ40ES9M2rQVqCMkZpmWyNU_w>
    <xmx:SYX0aZiR_b-wOnqrSjoNscfFb0XJO1evInU80jKd-8PWJOZh6VlaKA>
    <xmx:SYX0aTsc_kzHhUuCTmvCfgop52vsjeFj8_2IqgueZQPHX08DrfQ7sQ>
    <xmx:SoX0aaQZTIsbv1sxChP51_hbWPQXxUuIv6vZ6urubn5rOiN5aUhVNIPR>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 May 2026 06:49:44 -0400 (EDT)
Date: Fri, 1 May 2026 11:49:38 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com, 
	david@kernel.org
Cc: ljs@kernel.org, surenb@google.com, vbabka@kernel.org, 
	Liam.Howlett@oracle.com, ziy@nvidia.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	seanjc@google.com, pbonzini@redhat.com, jthoughton@google.com, aarcange@redhat.com, 
	sj@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 11/14] userfaultfd: add UFFD_FEATURE_RWP_ASYNC for async
 fault resolution
Message-ID: <afSErJo82o1qUMqe@thinkstation>
References: <20260427114607.4068647-1-kas@kernel.org>
 <20260427114607.4068647-12-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427114607.4068647-12-kas@kernel.org>
X-Rspamd-Queue-Id: C984C4ABBEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85411-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_TWELVE(0.00)[23];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kas@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

sashiko.dev -- https://sashiko.dev/#/patchset/20260427114607.4068647-1-kas@kernel.org -- wrote:
> commit 069c98442d3532bbf015817229b8db505210e97d
> Author: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Subject: userfaultfd: add UFFD_FEATURE_RWP_ASYNC for async fault resolution
[ ... ]
> Does this sequence create a clean but writable PMD?
> [ ... ] Could this result in modified data being silently discarded
> instead of written back during page reclaim?
> Usually, code paths establishing writable entries set the dirty bit
> together with the write bit, for instance by using
> pmd_mkwrite(pmd_mkdirty(pmd)).

The pattern intentionally mirrors do_numa_page() / numa_rebuild_single_mapping()
which has been in the kernel for years using the same sequence:

  pte = pte_modify(old_pte, vma->vm_page_prot);
  pte = pte_mkyoung(pte);
  if (writable)
          pte = pte_mkwrite(pte, vma);

with no pte_mkdirty(). The "writable" decision is fenced by
can_change_pte_writable(), which keeps the result safe in both the
shared and private cases:

  - Private (can_change_private_pte_writable): only allows the upgrade
    for PageAnonExclusive pages.

  - Shared (can_change_shared_pte_writable): returns true only when
    pte_dirty(pte). The dirty bit lives in _PAGE_CHG_MASK, so the
    earlier pte_modify(pte, vma->vm_page_prot) preserves it; the final
    PTE is writable + dirty.

The same applies to the PMD path through can_change_pmd_writable().
There is no "clean + writable" PTE/PMD escaping either branch.

> Similarly, does this create a clean but writable PTE?
> If the PTE is made writable without calling pte_mkdirty(), it might
> violate the invariant that writable PTEs must be dirty, [ ... ]

The "writable PTEs must be dirty" invariant is not a kernel-wide rule;
it depends on the architecture and the code path. Where the kernel
relies on pte_mkdirty() being called explicitly, can_change_pte_writable()
returns false and this path is not taken. do_uffd_rwp() is the same
shape as do_numa_page() and inherits its correctness arguments.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

