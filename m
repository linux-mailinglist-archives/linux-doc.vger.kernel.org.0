Return-Path: <linux-doc+bounces-92358-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hgp9FRtkL2qF/gQAu9opvQ
	(envelope-from <linux-doc+bounces-92358-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 04:31:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DE06E682E11
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 04:31:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=IO841vT1;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92358-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-92358-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44024300232F
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 02:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004CE23BD02;
	Mon, 15 Jun 2026 02:31:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046C4405F7;
	Mon, 15 Jun 2026 02:31:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490710; cv=none; b=Std3Mkw/oNo6OIHielkcLtEkRrDUajwuzto6SYcypvLVcFEPM7Xzg0XmTjxMKFUEylVYva7foN7LR0+8XO3qy4RVc8t0x0I3srVBvJEeRgZtM/qbJ4tWTNruJtYX6S86FiuqXLN72w3m15kz+nF5ITIzIR9Sjyae5tVuaIkKuY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490710; c=relaxed/simple;
	bh=kygChXw1kAs5DVAzAaZ8fZtvD82Q9dUcTk91GV2dzGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hk2eEWRVSsZnloRV9jVBAexD+gKgIXVUfmy9J58e1FSyx4bfVhEcCPGvlR5HIZrhtUTug7Qq3lJpH/PGGDyZALYopIcJRjT0SmjT1v6/R7KEshyVfF1veWJ90OHmceYrAgOreFzeE7T6Ee+ExYk3BTPO8vJmu3Jb3ukOldwAv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IO841vT1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E911F000E9;
	Mon, 15 Jun 2026 02:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781490709;
	bh=VXntCnozaVeoW3kK7/h+yvhpwz5a/x4a26EoPHDzrvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IO841vT1nMwNAPmzU1OF/0XlEAWlcX3/FNLkhjLpLr91PEOoZRxn2IIBaEfXfEcIl
	 oCFexOqKbPHG95ujWh2sYsEY3ukg7dK5Auh8eTrPH2UjSibQRb6GEODYXW5KH+Qj9c
	 q2fAjOM201qznkoEQ+YsgIs3ookeHThTpgd90O7Q=
Date: Mon, 15 Jun 2026 04:30:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Neill Kapron <nkapron@google.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org,
	Paul Cercueil <paul@crapouillou.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Simona Vetter <simona.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH 1/3] usb: gadget: f_fs: Initialize epfile->in early to
 fix endpoint direction checks
Message-ID: <2026061533-oval-buckle-b90e@gregkh>
References: <20260614181006.3648010-1-nkapron@google.com>
 <20260614181006.3648010-2-nkapron@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614181006.3648010-2-nkapron@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92358-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nkapron@google.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:paul@crapouillou.net,m:christian.koenig@amd.com,m:simona.vetter@ffwll.ch,m:linux-usb@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-team@android.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linuxfoundation.org:dkim,linuxfoundation.org:from_mime,gregkh:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE06E682E11

On Sun, Jun 14, 2026 at 06:10:00PM +0000, Neill Kapron wrote:
> When parsing endpoint descriptors, ffs_data_got_descs() generates the
> eps_addrmap which contains the endpoint direction. However, epfile->in
> was previously only populated in ffs_func_eps_enable() which executes
> upon USB host connection. As a result, early userspace ioctls like
> FUNCTIONFS_DMABUF_ATTACH that run before the host connects would see
> epfile->in as 0, leading to incorrect DMA directions.
> 
> By moving the initialization to ffs_epfiles_create(), epfile->in is
> accurate before userspace opens the endpoint files.
> 
> Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
> Assisted-by: Antigravity:gemini-3.1-pro
> Signed-off-by: Neill Kapron <nkapron@google.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This should also go to stable, right?

thanks,

greg k-h

