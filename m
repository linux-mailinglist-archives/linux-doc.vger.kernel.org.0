Return-Path: <linux-doc+bounces-95002-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V20lEMauSmo5GAEAu9opvQ
	(envelope-from <linux-doc+bounces-95002-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 05 Jul 2026 21:21:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F0970AF83
	for <lists+linux-doc@lfdr.de>; Sun, 05 Jul 2026 21:21:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=korg header.b=IlLB9aXa;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95002-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95002-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40764300916A
	for <lists+linux-doc@lfdr.de>; Sun,  5 Jul 2026 19:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7D627CCE0;
	Sun,  5 Jul 2026 19:21:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8641A3EA66;
	Sun,  5 Jul 2026 19:21:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783279299; cv=none; b=tnSxxsVNEiH6iXHvHQLolkRXgXusWiGGqIrJiSYzsCZxzuRq+Pa1OSNgOtRjaI803jYwcHzW5EaZkb1F9IKBAn/ljuyyqLXwjgAQ7ev+37W9e/Qa4UJEtLFo0yeOjZ7fEgdTEBuGWTXwLlSXfvm0Q+75jh5/2ihN25M74IUS5C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783279299; c=relaxed/simple;
	bh=Kml7mHsYbdr3P0g5en8ZNYZH4PW8h0ezUF5Ver21dk0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=L4KGKtRt9AxcLYPEZOsOKoAcGjDnWrKRROAn/W5M+V4d8BifTXrMQuq8RlZew88QSA0wZpaM0wL0NffZnngGiTMwzK5F8ifG4uUX86AkSysFFsdKpwJFEjPRjyJG+kP1jvm3JjCUgT+10b2rz7uZnqT+dK5raZ/unE2zpQxS+OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IlLB9aXa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DAC41F000E9;
	Sun,  5 Jul 2026 19:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783279298;
	bh=dA58sFWd3zYRKQmQfWY0b2tw8eB6raZO+QUDUb8S1aM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IlLB9aXaB+hSdrkbY80lXftCXWZyiM8Ry4Yrllf8b0wCWHHGc66eum6PCQd8ZYFas
	 R9jFwzOGfriy8BkzvNpVZoi/WlrwNqmma7EK1NmHD7RQekLw0TQmKJda2GY56Q8ABb
	 CZrhY8S15nBugF9wZI1aPXITrRrRNTpRy8I0tYGU=
Date: Sun, 5 Jul 2026 12:21:36 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng
 Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Barry Song
 <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, Qi Zheng
 <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen
 <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu
 <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, David
 Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Hugh
 Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Matthew Wilcox
 <willy@infradead.org>
Subject: Re: [PATCH v7 0/3] mm: clean up folio LRU and swap declarations
Message-Id: <20260705122136.0ad3b1f7132610134786afbf@linux-foundation.org>
In-Reply-To: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-0-a028e8b5fc3d@gmail.com>
References: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-0-a028e8b5fc3d@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:wujianyue000@gmail.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:hannes@cmpxchg.org,m:david@kernel.org,m:mhocko@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:baoquan.he@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:willy@infradead.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95002-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,tencent.com,huaweicloud.com,gmail.com,lge.com,linux.dev,google.com,cmpxchg.org,infradead.org,suse.com,linux.alibaba.com,lwn.net,linuxfoundation.org,kvack.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux-foundation.org:from_mime,linux-foundation.org:dkim,linux-foundation.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74F0970AF83

On Sun, 05 Jul 2026 22:12:30 +0800 Jianyue Wu <wujianyue000@gmail.com> wrote:

> This series splits folio LRU and swap cleanup into three steps:
> 
>   - move the page-cluster sysctl next to swap readahead in mm/swap_state.c
>   - rename mm/swap.c to mm/folio.c after the swap-specific bits move out
>   - move MM-internal reclaim declarations out of include/linux/swap.h
> 
> After this series, swap cache and swap-in readahead stay in mm/swap_state.c,
> folio LRU helpers live in mm/folio.c, and MM-internal reclaim/workingset
> declarations move from include/linux/swap.h to mm/internal.h (public LRU
> helpers used outside mm/ remain in swap.h).

Thanks, I've added this to mm.git's mm-new branch - in a few days I'll
move it into mm-unstable for linux-next inclusion.  After -rc4 (approx)
I'll move it into mm.git's non-rebasing mm-stable branch for
upstreaming during the 7.3-rc1 merge window.


