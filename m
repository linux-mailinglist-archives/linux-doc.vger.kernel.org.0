Return-Path: <linux-doc+bounces-92603-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9N0RLBI8MmrQxAUAu9opvQ
	(envelope-from <linux-doc+bounces-92603-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 08:17:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02547696CCF
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 08:17:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=lst.de (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92603-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92603-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 438F93040F8F
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 06:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CFC3B388C;
	Wed, 17 Jun 2026 06:17:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33C8394EBD;
	Wed, 17 Jun 2026 06:17:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781677069; cv=none; b=BVzSXNAzyq6OkZNkpciyDppnwc7zKBEmSy6ya8eKwfsIkMuelKw/aQRkNQDtO6wgWiMZmdWnnliic6CNeT7UL2SQ2a6odpI6hQ11lixYutY6BKnp6KYdycw1oDT5Yirak7C7Xj832EJfJKdbYSMpb3L4xjsMhYkO2EEKbYkiRtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781677069; c=relaxed/simple;
	bh=poDADrzoQbzctHuaCBF182lqKge2c3dwNUl4QnA52sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2Cy1OgAOvyLszJMXu1LgrPW6hBouy1gPrtAHRKPVNCCUFCChfgrVWvS0ygtUbuIHdgEWbybzuwElLrY6ByFhNK/v9iY8hFiXUZmB/PnOgtrOxjcAVYQRMmGje9JD1xEAqwgsAuUyWutcoCECeAe7zYkg/npwrr7iiLccb3XOck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4450A68AFE; Wed, 17 Jun 2026 08:17:43 +0200 (CEST)
Date: Wed, 17 Jun 2026 08:17:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>, Baoquan He <bhe@redhat.com>,
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Youngjun Park <youngjun.park@lge.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/3] mm/zram: route block swap I/O through swap_ops
Message-ID: <20260617061743.GA19844@lst.de>
References: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com> <20260616123646.GB21024@lst.de> <CAJxJ_jhK+zkpjhs3YsQ9RoasKYh+E0NweQci0sPAEY1ne5LmBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJxJ_jhK+zkpjhs3YsQ9RoasKYh+E0NweQci0sPAEY1ne5LmBA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wujianyue000@gmail.com,m:hch@lst.de,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:bhe@redhat.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:youngjun.park@lge.com,m:minchan@kernel.org,m:senozhatsky@chromium.org,m:axboe@kernel.dk,m:willy@infradead.org,m:jack@suse.cz,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92603-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lst.de,linux-foundation.org,kernel.org,redhat.com,gmail.com,tencent.com,huaweicloud.com,lge.com,chromium.org,kernel.dk,infradead.org,suse.cz,kvack.org,vger.kernel.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lst.de:mid,lst.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02547696CCF

On Wed, Jun 17, 2026 at 11:38:02AM +0800, Jianyue Wu wrote:
> Before I rework or drop the RFC, could you outline how you see that
> core-side model working? In particular:
>   - How should a compressed backend like zram or future block device
>     plug into swap_iocb / swap_ops?

I don't think that is the right layer.  The virtual swap layer that is
currently in the process of being upstreamed is the right level, and
the actual swap devices or swap files are just a dumb backend for what
they higher level code does.

>   - What role do you expect zram to keep while the legacy block interface
>     remains: current block swap only, or something else?

For now we'll need to keep it working as-is.  It is heavily used in
android and potentially elsewhere.  Once we have zswap fully working
in the virtual swap layer world it might make sense to say never
compress again in zram when REQ_SWAP is set (or maybe a new
REQ_COPRESSED) so that we can use the core compression code without
breaking existing setups.


