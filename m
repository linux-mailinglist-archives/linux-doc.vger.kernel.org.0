Return-Path: <linux-doc+bounces-92371-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S2EoCHLCL2oqGAUAu9opvQ
	(envelope-from <linux-doc+bounces-92371-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 11:14:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CDF684F40
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 11:14:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="azP4Du+/";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92371-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92371-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 889853011A6B
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 09:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421DB3D5646;
	Mon, 15 Jun 2026 09:14:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A63D523E
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 09:14:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514860; cv=none; b=AHI+vf2bfIZ/eBSuZ9/sDIAzTWyT8aJHj/uUvSdbApM28LsjE7WyNd634whqEeu1uH5E/0Tl+o1tnuPec6O2oLCt50dkrSa8RFKtz+8TpY0ilTdw3kUsJ9UDCLW371D77k8tGRIoldNDTHaAORkQlRg4mXfLQvBlsaiaMtf/d2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514860; c=relaxed/simple;
	bh=rx5i3VPx+4mSWrjeoJRSdziRvTWx22OnIiPlAdlXaJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=igKMtGM3dOrMYzeEnPE3icscqsllNIKlwIUrrs30s6kwIp+0Y3EkTe1dCXLChUS4JjqOhmsB7w9msZ+CIcmPhVj1bTcE+QlCSRLJGtRpac+BbFBVCu6kVtZmQESaUAABozPj6548oq9vTshUwS0RVBLB/vmUD62YlfTwVIAsvvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azP4Du+/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756731F0155A
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 09:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781514855;
	bh=uUJeAFXXt09c94jeT887u1t44BQncrNmZQ1/OxLwVUA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=azP4Du+/WiFT2KFEJjOrb5bzQ7OtlZDZoUD3/x/vY1dO97ql6KH1AGH5GnUfgnLYf
	 UzC8zmGIJguNr2TysIs/I5wsGBxtVoY6YtwPCrmanZPmNEckaBzL5S6ebR5xXGifs/
	 7Du7ddXDj1jqRtsEOW99zvWz/qC9gxhj2+8nHvCX2wx7fPiVQDe3ZQki19GfzuMvy/
	 DbRCHas1IeMPV7SOBjp/jOxhXBxwzKObbA1so6xSlyBZRGvdBIiud5+kxoZZEIS7WR
	 eKUtRy6tLlsw66ok534YGQNNARna6sZRB/RnjMhtmMB0m94GlERUsyJJpsbcWQyk7c
	 yIvCenSjn5/5w==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-915d64fead9so422332885a.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 02:14:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ97xbj4ek4tWmPBDS5jEeFNVD0ByByc6EL6QserqIMjZ3/QsdnZmVFjE+kWlyt3CVnpa0LMYUXMX8A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxno96ntnCitPLUJoEf4QgN582L58Zkt/6IZ0bGpdbrCicisNkJ
	Ni0Rp2BpE+M+TAGoHW+f6FBE8AfN0ssI2A197gwTmSJd0iXYLw+iT20E+p3fTFLTkL2D2RBq4re
	YFLshJbst7U9XX/nMSR0dB2Mel+rqUqk=
X-Received: by 2002:a05:620a:171f:b0:915:e8fc:1396 with SMTP id
 af79cd13be357-9161c03e623mr1645007385a.13.1781514854834; Mon, 15 Jun 2026
 02:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
In-Reply-To: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 15 Jun 2026 17:14:03 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yqy3ZnXirSZD0X_1b5qDnyoMLuuSS4mHRcip+CPpvQdg@mail.gmail.com>
X-Gm-Features: AVVi8Cddn7j6HKvYvm1_sm083n__hkLYQ5ZvaULuaYEU5HZ_XQXMl2mMQbb7DQs
Message-ID: <CAGsJ_4yqy3ZnXirSZD0X_1b5qDnyoMLuuSS4mHRcip+CPpvQdg@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/zram: route block swap I/O through swap_ops
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <bhe@redhat.com>, Nhat Pham <nphamcs@gmail.com>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Youngjun Park <youngjun.park@lge.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92371-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wujianyue000@gmail.com,m:akpm@linux-foundation.org,m:hch@lst.de,m:chrisl@kernel.org,m:bhe@redhat.com,m:nphamcs@gmail.com,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:youngjun.park@lge.com,m:minchan@kernel.org,m:senozhatsky@chromium.org,m:axboe@kernel.dk,m:willy@infradead.org,m:jack@suse.cz,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux-foundation.org,lst.de,kernel.org,redhat.com,gmail.com,tencent.com,huaweicloud.com,lge.com,chromium.org,kernel.dk,infradead.org,suse.cz,kvack.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[baohua@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baohua@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80CDF684F40

On Sun, Jun 14, 2026 at 11:35=E2=80=AFPM Jianyue Wu <wujianyue000@gmail.com=
> wrote:
>
> This series builds on Christoph Hellwig's swap batching rework that
> moves block swap onto struct swap_iocb and per-backend struct
> swap_ops handlers [1].  Christoph's patches unify batching for
> ordinary block devices and swap files.  zram still needs a custom
> path because swap slots map to compressed pages, not disk sectors.
>
> The first patch adds swap_register_block_ops() so a block driver can
> install custom submit_read/submit_write handlers when swapon targets
> its block device.  The default swap_bdev_ops path is unchanged for
> devices that do not register.
>
> The second patch registers zram_swap_ops at module init.  On write,
> the swap core still batches folios into a swap_iocb.  zram maps each
> folio to a slot index and stores it through zram_write_page() instead
> of building one bio per page.  Read handling keeps slot_lock and
> mark_slot_accessed() in one critical section.  Writeback-enabled zram
> falls back to swap_bdev_submit_read() for ZRAM_WB slots.
>
> The third patch moves slot_free_notify into swap_ops next to the
> other zram swap callbacks, and documents the locking contract for
> that hook.
>
> Applied on top of Christoph Hellwig's "better block swap batching and
> a different take on swap_ops" series [1].

Nice. I think it's better to mark it as RFC at this stage.

By the way, besides the architectural refinements, have
you also observed any noticeable performance improvements?

>
> [1] https://lore.kernel.org/linux-mm/?q=3Dbetter+block+swap+batching

Best Regards
Barry

