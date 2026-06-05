Return-Path: <linux-doc+bounces-91168-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7utaHaodI2pziwEAu9opvQ
	(envelope-from <linux-doc+bounces-91168-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 21:04:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E429764AD31
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 21:04:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=eteaKFxG;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91168-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91168-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 813DE304F2DC
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 18:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA4329B77E;
	Fri,  5 Jun 2026 18:48:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A5D38F636;
	Fri,  5 Jun 2026 18:48:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685311; cv=none; b=a3qFWyei2wZZugMD1T43ORA8SU+PoKCHP0M/YXVY+bfCdurY0QdGAxPgE9jLYY48+QJINRrtUniraDtjqKvcDIzI/ZjgvdygBZmVgQtQgZmr9JncjLOTER/1q8raJ6RUk6IGIR3V4IIafO7ORII5vNsaUhM8woBgZIO4h/9fKT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685311; c=relaxed/simple;
	bh=EwstB6fEiMNm5N2jhLKJux441kRPYpME/39jhJsFhY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtoU2y+O9fEJz40qMz+TkdgniegkL3a7npaGOFucBBiY/+HNrNaImTVA0fiUg/Ms7ZzryiL2w2k3cevDYse0uh1BKzQ+EH0G7HbPpufsAdptwVM1R3S/zw2LzRh1S5e2Zuc1/cE9J1uK2JBfhczx1a9TzivU0iL96C/btTuPR0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eteaKFxG; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vR1FqDhqdj3MS9qr/U+iGRh4CdfRxSN7XXykcu5T2lo=; b=eteaKFxG5ZqdX0SlFd3GGbSLFx
	/eVqvCsSrSzDsaTOaGLBJ7651rDhlVovOUgI+n0QEARrR0kqZVq694p1Sl+unTvjusDFyDMD/88qX
	UYUQ0iqCcq/kQfcw3rpwcRn3LSlsMs9gfXxQDKCbTKdwpgBrohiA+V1KJg9jPSHPzh83PoCX9Uiij
	HrPfQrFSb16q0nNt5Oba3zSnJj1asYdGJdNIvBxpk9qJjQ2GVZODptxq1oBnueCg/HZwIyQtpZboI
	BsMg8fpdPVo7KXoFzwDFBkaCi7isjKYHghdOV6LDvse4cMdTRj+hQ7Fix+MF5xg/OhuL9e+R1V3t6
	Q4Z+Rz+g==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZai-00000008Pzt-2BhO;
	Fri, 05 Jun 2026 18:48:24 +0000
Date: Fri, 5 Jun 2026 19:48:24 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 1/4] block: add a macro to initialize the status table
Message-ID: <aiMZ-PXXQ-NxOHT4@casper.infradead.org>
References: <20260605184441.590927-1-hch@lst.de>
 <20260605184441.590927-2-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605184441.590927-2-hch@lst.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:corbet@lwn.net,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kbusch@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-91168-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[casper.infradead.org:mid,infradead.org:from_mime,infradead.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E429764AD31

On Fri, Jun 05, 2026 at 08:44:27PM +0200, Christoph Hellwig wrote:
> Prepare for adding a new value to the error table by adding a macro
> to fill it.

> +#define ENT(_tag, _errno, _desc)	\
> +[BLK_STS_##_tag] = {				\
> +	.errno		= _errno,		\
> +	.name		= _desc,		\

Bleh.  I hate this.  Before, I can grep for BLK_STS_NOSPC and find it.
After, I can't.  Yes, I know we have a lot of such things already, but
I don't like adding more.

