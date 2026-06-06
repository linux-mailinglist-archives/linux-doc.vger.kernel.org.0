Return-Path: <linux-doc+bounces-91208-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZR+ODkXMI2pNywEAu9opvQ
	(envelope-from <linux-doc+bounces-91208-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 09:29:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9B64CD9B
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 09:29:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0lJ7y8fi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3+0Dm5Gp;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=h3PmZ5H+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DJ9Krip7;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91208-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91208-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D17C63029715
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jun 2026 07:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B7A257855;
	Sat,  6 Jun 2026 07:29:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBEE20E702
	for <linux-doc@vger.kernel.org>; Sat,  6 Jun 2026 07:29:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730944; cv=none; b=BGgsZsvwpWn4QMr59AcFYG124zBIyp3hnqBWsqdWBIF61LwXHIVm+w38aCQg7M6paVFsWRiysEo3zGqte2vPQMAqugqO8ahAoprPygXPlVt340Zi2AAhBa2S8gvx1rY+hhwAysg+a3pnySJb6g5Zy/Dx/pS0VcTC+YdmnINcuAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730944; c=relaxed/simple;
	bh=VeQgtyLZwex4j46Tp5dNTbznfW6J5BAR+X6/hFqYOj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ye/DI8qMrf/xTYwp2Ou7QUhkqVgnf3oO7RqKJ9XmlI0V7inowSHF8p0T17Dcrc5q2ic20gLxK14l/LO53JWctceQ+Q8EC7nLXjyvLufDU6wzwEtq/djPH837Y5IyHF/wyBLdCx3z/bi/57/UCUU2XiZn2yUN8Y5YOshTZ80REtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0lJ7y8fi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3+0Dm5Gp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h3PmZ5H+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DJ9Krip7; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BF2116B387;
	Sat,  6 Jun 2026 07:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780730942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqcAqiWpbibPNyAu/PW5PUvHHK4psakmpEjn7UuFGlk=;
	b=0lJ7y8fiEvrZuTZ0X6SqWI0aRu2wHKQD1eMnSYFFVGZnGhAT1h2l0awfjWbJZeczjRIP8n
	xInbXO16GTNv5N5Et61yP2d3T/oSi8Vv+GslY36ADjJ4vtZY+q9dYIAzrM/C9sMtNnhwSx
	Cx+S0nijmZLZSSrVP0ljBYt4VUztJp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780730942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqcAqiWpbibPNyAu/PW5PUvHHK4psakmpEjn7UuFGlk=;
	b=3+0Dm5GpJtjfjP/ELNfrDF9CXK09VIAQ38j5dl/LinavtW8KkZE1du1iWByBsPm0NPvdYR
	EeFqIHnlBlfwMMAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780730940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqcAqiWpbibPNyAu/PW5PUvHHK4psakmpEjn7UuFGlk=;
	b=h3PmZ5H+X9TrKhKkyRm0y5eRSexwyhyXgNcroCw/6bAE5fRvD34t/2aGvIuG80yudVV/TH
	0iTOQEp08Qym8Bcp30vT31t5jZleLOo8QS+Mt5bIFRPsgXmOIKcy8Gn9mYEDRnsXPGXMWu
	f7QG+0BfbFBHVHXrN+Y6S6zqBJgGWXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780730940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqcAqiWpbibPNyAu/PW5PUvHHK4psakmpEjn7UuFGlk=;
	b=DJ9Krip7s3AYNVLLLl/OSWyFaZmQ2SDOfboJbT/mIXVwRVnUcq14uthKlCh/rYXWJkuniI
	W0W0vHR6zGphWhCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 481CD779A7;
	Sat,  6 Jun 2026 07:28:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j0SrNDnMI2r6DAAAD6G6ig
	(envelope-from <hare@suse.de>); Sat, 06 Jun 2026 07:28:57 +0000
Message-ID: <4fc4ce6d-47a1-46c4-8c05-d35887e5fcd6@suse.de>
Date: Sat, 6 Jun 2026 09:28:53 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] block: add configurable error injection
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260605184441.590927-1-hch@lst.de>
 <20260605184441.590927-5-hch@lst.de>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260605184441.590927-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.30
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91208-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:corbet@lwn.net,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hare@suse.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hare@suse.de,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lst.de:email,suse.de:mid,suse.de:dkim,suse.de:from_mime,suse.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1C9B64CD9B

On 6/5/26 20:44, Christoph Hellwig wrote:
> Add a new block error injection interface that allows to inject specific
> status code for specific ranges.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   Documentation/block/error-injection.rst |  59 +++++
>   Documentation/block/index.rst           |   1 +
>   block/Kconfig                           |   7 +
>   block/Makefile                          |   1 +
>   block/blk-core.c                        |   3 +
>   block/blk-sysfs.c                       |   4 +
>   block/blk.h                             |  12 +
>   block/error-injection.c                 | 308 ++++++++++++++++++++++++
>   block/genhd.c                           |   4 +
>   include/linux/blkdev.h                  |   6 +
>   10 files changed, 405 insertions(+)
>   create mode 100644 Documentation/block/error-injection.rst
>   create mode 100644 block/error-injection.c
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

