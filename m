Return-Path: <linux-doc+bounces-92356-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0Nw0MpNaL2qC+wQAu9opvQ
	(envelope-from <linux-doc+bounces-92356-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 03:51:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B42682CB2
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 03:51:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=lge.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92356-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92356-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00B20300DE0A
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 01:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1261FC7C5;
	Mon, 15 Jun 2026 01:50:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from lgeamrelo03.lge.com (lgeamrelo03.lge.com [156.147.51.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18481F1534
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 01:50:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781488245; cv=none; b=t/Vu5FvEHfpQ1hNRZbGOWtYyGepvxiZZrVmSFHKgqeZojhcNKLFeQNhTKsidS+bsVm3y2Md4ePEibpOQKK8iA3J14ix5urYmoYh/9/Z8O/HdwMFa4aprbh0YR56u4cKsuoHZ+R5pUyqP/sXAk1UKSaE44OCCmml5m7bYcquz2iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781488245; c=relaxed/simple;
	bh=iwPaf5O1p8Bozvyw6mAQYTVebmpFDgP8zVaHzs8U/ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4plPozHRaEEEp2uuZVrwrLZqAL//OhFoxAYP4QsaKAUKTTtfgqu/1NKYpdvD/WLRjyxuuWX3RPX95dUrkkQzd2d/IweGFK2fK8Q3n19xpY9+sTdHIYV1JqdaLUyJiOGW+CfnbOnVtLLBGJIgL/dqsJpoV0uonlIRsRSaoaWyHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.51.102
Received: from unknown (HELO yjaykim-PowerEdge-T330) (10.177.112.156)
	by 156.147.51.102 with ESMTP; 15 Jun 2026 10:50:38 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
Date: Mon, 15 Jun 2026 10:50:38 +0900
From: YoungJun Park <youngjun.park@lge.com>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Chris Li <chrisl@kernel.org>,
	Baoquan He <bhe@redhat.com>, Nhat Pham <nphamcs@gmail.com>,
	Barry Song <baohua@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] mm/page_io: let block drivers register custom swap
 I/O ops
Message-ID: <ai9abo7GwMl+g43G@yjaykim-PowerEdge-T330>
References: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
 <20260614-zram-swap-ops-block-register-v1-1-6c1a6639c222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614-zram-swap-ops-block-register-v1-1-6c1a6639c222@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lge.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wujianyue000@gmail.com,m:akpm@linux-foundation.org,m:hch@lst.de,m:chrisl@kernel.org,m:bhe@redhat.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:minchan@kernel.org,m:senozhatsky@chromium.org,m:axboe@kernel.dk,m:willy@infradead.org,m:jack@suse.cz,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[youngjun.park@lge.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92356-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[youngjun.park@lge.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,lst.de,kernel.org,redhat.com,gmail.com,tencent.com,huaweicloud.com,chromium.org,kernel.dk,infradead.org,suse.cz,kvack.org,vger.kernel.org];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,lge.com:from_mime,yjaykim-PowerEdge-T330:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1B42682CB2

On Sun, Jun 14, 2026 at 11:35:29PM +0800, Jianyue Wu wrote:

...

Hello Jianyue.

Currently, the patch commit log indicates only a single custom swap
registration is supported. Shouldn't we allow multiple block drivers to
register their custom ops simultaneously from the beginning?

>  int shmem_writeout(struct swap_io_ctx *ctx, struct folio *folio,
>  		struct list_head *folio_list);
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 284eebc40a70..ebdc96092961 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -2849,6 +2849,10 @@ static int setup_swap_extents(struct swap_info_struct *sis,
>  	sis->ops = &swap_bdev_ops;
>
>  	if (S_ISBLK(inode->i_mode)) {
> +		const struct swap_ops *block_ops = lookup_swap_block_ops(sis);

Also, just a personal thought on this part.

Instead of using `block_device_fops` as a lookup key, what if we handle
this similarly to how filesystems use the `a_ops->swap_activate` callback?

We could add a `swap_activate` callback directly into
struct block_device_operations (zram's zram_devops). This way, the
block device itself can set up and replace the swap `ops` directly without
needing a separate registration/lookup mechanism.

What are your thoughts on this approach?

Thanks,
Youngjun Park

