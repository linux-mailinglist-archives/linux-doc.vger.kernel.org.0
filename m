Return-Path: <linux-doc+bounces-92366-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NfdKDSSeL2qHDQUAu9opvQ
	(envelope-from <linux-doc+bounces-92366-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 08:39:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B15B4683E14
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 08:39:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=lge.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92366-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92366-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9E0D30048FE
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 06:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55233B2D0D;
	Mon, 15 Jun 2026 06:39:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from lgeamrelo03.lge.com (lgeamrelo03.lge.com [156.147.51.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F462D97AA
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 06:39:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505568; cv=none; b=B1yP/sePwwdan+VOOHkCIFITDrzVbGJaXE0Lidu4KU73YUmS3B5CuQLc3PVleHzvf7IP5DJot0wALEXPRTxsws00fskqhYd80URuZiEQf/R/RqiS1QotekKabcSPFbeKU6e2tdudpABpqQo0LrU+IbMoq6AVTeLRmNTFvwLOLa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505568; c=relaxed/simple;
	bh=LxPFNCHfXwAyBZs9+Q8B4D1xKb66x+Qf+/FIPyumV8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOtHPF7S1JGXcX5JjSGBaShpmp8db2V+RnPjL57LbK2P047ji1ZIovIhI8PrX01EEfzUZ3C32sWFB+DpxiAwGGTWxDMX0CJesb6KnMJ2F+JgL/WUiVvN1qKMmw6BVRO2wzdSdwLNKMi8B2eXkgnBzOwEwplnozvpZcs90Dgqay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.51.102
Received: from unknown (HELO yjaykim-PowerEdge-T330) (10.177.112.156)
	by 156.147.51.102 with ESMTP; 15 Jun 2026 15:39:24 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
Date: Mon, 15 Jun 2026 15:39:23 +0900
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
Subject: Re: [PATCH 2/3] mm/zram: handle swap read/write via swap_ops
Message-ID: <ai+eG9sFYTn/vTq5@yjaykim-PowerEdge-T330>
References: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
 <20260614-zram-swap-ops-block-register-v1-2-6c1a6639c222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614-zram-swap-ops-block-register-v1-2-6c1a6639c222@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lge.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wujianyue000@gmail.com,m:akpm@linux-foundation.org,m:hch@lst.de,m:chrisl@kernel.org,m:bhe@redhat.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:minchan@kernel.org,m:senozhatsky@chromium.org,m:axboe@kernel.dk,m:willy@infradead.org,m:jack@suse.cz,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[youngjun.park@lge.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92366-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[youngjun.park@lge.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,lst.de,kernel.org,redhat.com,gmail.com,tencent.com,huaweicloud.com,chromium.org,kernel.dk,infradead.org,suse.cz,kvack.org,vger.kernel.org];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_TWELVE(0.00)[18];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B15B4683E14

On Sun, Jun 14, 2026 at 11:35:30PM +0800, Jianyue Wu wrote:

Hello!

> +static void zram_swap_submit_read(struct swap_io_ctx *ctx)
> +{
> +	struct zram *zram = ctx->sis->bdev->bd_disk->private_data;

A passing thought. accessing `zram` here is too indirect. We might
need a `private_data` in the swap device struct someday?

(And If there is a real value like some swap-side only private data really needed.)

> +	struct swap_iocb *sio = ctx->sio;
> +	int nr = swap_iocb_nr_folios(sio);
> +	bool failed = false;
> +	int i, j;
> +			/*
> +			 * read_from_zspool() and mark_slot_accessed() must run
> +			 * under the same slot_lock.  zram_read_page() unlocks
> +			 * before returning, which leaves a window where
> +			 * writeback can pick an idle slot we just read.
> +			 */

Regarding the comment about the "window" where writeback can pick an
idle slot. I think this reasoning is a bit of a gray area. Writeback
could just as easily pick the slot right before entering this routine,
so the race condition seems fundamentally the same.

Isn't the actual justification here to separate the non-backend logic
and ensure mark_slot_accessed() is called under the lock, given that
zram_read_page() can call the backend device?

If the "window" mentioned in the comment is indeed a valid issue, then
zram_read_page() has the exact same problem and needs to be fixed as
well?

If not, IMHO I suggest revising or removing this comment to clarify
the true(?) intention. :)

> +			slot_lock(zram, idx);
> +			ret = read_from_zspool(zram, page, idx);
> +			if (!ret)
> +				mark_slot_accessed(zram, idx);
> +			slot_unlock(zram, idx);

