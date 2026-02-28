Return-Path: <linux-doc+bounces-77442-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDmLDdNzo2n+DQUAu9opvQ
	(envelope-from <linux-doc+bounces-77442-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 00:01:39 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8112E1C996D
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 00:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33D7B301544E
	for <lists+linux-doc@lfdr.de>; Sat, 28 Feb 2026 23:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E09C355F36;
	Sat, 28 Feb 2026 23:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y9QqY/Um"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF152430B9A;
	Sat, 28 Feb 2026 23:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772319694; cv=none; b=nOHJt8Z8DmeLF6jHpgwdwwU9CMYOfCanMM5i8ZavyfHEAhZfsazGsgOHdIa+O9eTn7fec/suWTH5E5ftlAtesUKpFaJiE4Z7pLLBQpP7wmPAkcCVjINABT56ejBVSHHoxN42wVel1/WuZho6tf5cxvA61ICW1CozQMG4tEJL70o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772319694; c=relaxed/simple;
	bh=O9uOBnZ/lKOtmWpG8ozM2E0DAaC9mNV1xzrSoLZmrkY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=aKI9VGd5x7MQJEsKFH14Jqz0N6Ps9PZXqHNrUdt+mWEpNb3kS2uXbqhcCr4eolhJUMatfbKfI3X+Yf+rdn6YfmuQNXlvYcedPJfEIT9e3pJstcPHfYfNEAtFThOUxLUrvlLK6BX/N5cO0nGs4UIssarae3ol4iXK7i381/wOuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Y9QqY/Um; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AF2C116D0;
	Sat, 28 Feb 2026 23:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1772319694;
	bh=O9uOBnZ/lKOtmWpG8ozM2E0DAaC9mNV1xzrSoLZmrkY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y9QqY/Umx9XtOjZ16O164ix2TSzEP3hGmrykgRAgox/0ibPBIvA9ydXrC9Yy2qv4z
	 fKFd8R6RWFSRWyHuDm3dSHPW9dpgJWbVvCl1frTIjiVjTxSPr+Bzy1R5C17i0zZJOw
	 iv1lhi9GBCZuxsNYUaFFulSdDc+61t9gjdWA+NuA=
Date: Sat, 28 Feb 2026 15:01:33 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Gladyshev Ilya
 <gladyshev.ilya1@h-partners.com>
Cc: Muchun Song <muchun.song@linux.dev>, David Hildenbrand
 <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, Usama Arif
 <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>, Oscar
 Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, Vlastimil
 Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi
 Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko
 <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet
 <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv7 RESEND 00/17] mm: Eliminate fake head pages from
 vmemmap optimization
Message-Id: <20260228150133.67fd58ef1ae9e50ea3f32476@linux-foundation.org>
In-Reply-To: <20260227194302.274384-1-kas@kernel.org>
References: <20260227194302.274384-1-kas@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77442-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,infradead.org,gmail.com,google.com,suse.de,suse.cz,oracle.com,nvidia.com,redhat.com,suse.com,cmpxchg.org,lwn.net,xen0n.name,dabbelt.com,sifive.com,eecs.berkeley.edu,ghiti.fr,meta.com,kvack.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:mid,linux-foundation.org:dkim]
X-Rspamd-Queue-Id: 8112E1C996D
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 19:42:38 +0000 "Kiryl Shutsemau (Meta)" <kas@kernel.org> wrote:

> This series removes "fake head pages" from the HugeTLB vmemmap
> optimization (HVO) by changing how tail pages encode their relationship
> to the head page.
> 
> It simplifies compound_head() and page_ref_add_unless(). Both are in the
> hot path.

This series is unaware of (and incompatible with) Gladyshev's "mm: make
ref_unless functions unless_zero only" cleanup
(https://lkml.kernel.org/r/20260206133328.426921-1-gladyshev.ilya1@h-partners.com).

Gladyshev, I'll drop that patch.  If you believe that similar changes
after Kiryl's series are desirable, please send them along, thanks.


