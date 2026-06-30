Return-Path: <linux-doc+bounces-94218-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cvzLGJcPRGpnnwoAu9opvQ
	(envelope-from <linux-doc+bounces-94218-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 20:48:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B006E74F6
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 20:48:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=CEPvZMAE;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94218-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94218-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01BAA307ADCE
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 18:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3797B3E075C;
	Tue, 30 Jun 2026 18:45:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A4933E34B;
	Tue, 30 Jun 2026 18:45:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782845108; cv=none; b=GiFta5aOFXYCaKBF8OWdovIMa+39gcUVkw8UpnC7jn7CRviVpZxNRi67INBxPLDrWR8/rZGD1fTL68/edUbkmELQy75xQMrn4s9yIAF8cdwd1ybKo+fjymtWgXGpanjW54XdSR4Vz7s+HYmQUbtOZ107ibb4f44COKLiCcVtssM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782845108; c=relaxed/simple;
	bh=HWuef1dlSVTJu7gF5ZW1fEGsnqAMyGvK5B5poXvEiJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ft7bAWFtqhgOgbCt/EVpbnvz2Cd78yosbS57IQdTHnb+NvPu1m1QVL3NlMxbPEtjcN/+jdu+QHLH0C7WGFRWJb5pqLFMmEScTYVjMbdBfu5M+bt/wzvlNuk/k8rOicPpSDScxWRL/XYWO/chFWzCjC0QSgTFO+ejRvETj0b/GV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CEPvZMAE; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jReEXMEt9w7e8G03i0VZobwWvCQscFhS+MP89RBwgUY=; b=CEPvZMAEUl5oWd4tHF/wDMOX+Z
	V/7/eF8tTgTAjXDeLq16jkyOqccJFN7TCrkdiUJxXrOlZeSBmj4xmXWDSFgnPtjmwN6krQWCS9td9
	OCrBkvICmi8YoAsgTYlXO/0sivMgUtErAjsNqYqFC9JYj6+0w8j4su2Ftxd2n62XJPCAoVw84iJyl
	tBWqAFrGXnnvJy5G/vjIjZIiPVvlHcJ+DDopZDCd2UrYtJn/6N7GZYo+H24+5UdClwS0lvkSlZJLy
	c96SrpxUj7cVrPtSRerCMsGs5pdXR2S41++hC1UW0oYybqIk7b8bCXEdDpon4STiYT/Uabl9XA6Hn
	cpLP1XvA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wedRo-00000005O2g-2yzs;
	Tue, 30 Jun 2026 18:44:40 +0000
Date: Tue, 30 Jun 2026 19:44:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/3] mm: rename swap.c to folio.c
Message-ID: <akQOmJOy1TYrhlq5@casper.infradead.org>
References: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-0-d4f648963382@gmail.com>
 <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-2-d4f648963382@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-2-d4f648963382@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94218-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wujianyue000@gmail.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:hannes@cmpxchg.org,m:david@kernel.org,m:mhocko@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:baoquan.he@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,tencent.com,huaweicloud.com,gmail.com,lge.com,linux.dev,google.com,cmpxchg.org,infradead.org,suse.com,linux.alibaba.com,lwn.net,linuxfoundation.org,kvack.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,infradead.org:dkim,infradead.org:from_mime,casper.infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2B006E74F6

On Wed, Jul 01, 2026 at 12:27:33AM +0800, Jianyue Wu wrote:
> @@ -17057,7 +17057,6 @@ F:	include/linux/swap.h
>  F:	include/linux/swapfile.h
>  F:	include/linux/swapops.h
>  F:	mm/page_io.c
> -F:	mm/swap.c
>  F:	mm/swap.h
>  F:	mm/swap_table.h
>  F:	mm/swap_state.c

I would argue that folio.c is now not part of the "MEMORY MANAGEMENT -
SWAP" responsibility.  Agree that it's part of the LRU maintainership
still.


