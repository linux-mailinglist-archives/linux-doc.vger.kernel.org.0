Return-Path: <linux-doc+bounces-91205-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O1ovIkvLI2rSygEAu9opvQ
	(envelope-from <linux-doc+bounces-91205-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 09:24:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7D364CD81
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 09:24:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0pGy84Nb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="pMoZN/vj";
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0pGy84Nb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="pMoZN/vj";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91205-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91205-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D1763023E27
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jun 2026 07:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B337372622;
	Sat,  6 Jun 2026 07:24:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572F622F388
	for <linux-doc@vger.kernel.org>; Sat,  6 Jun 2026 07:24:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730692; cv=none; b=ByEZaYKaEyaj4DuN12h9sAPYmE4Hz5FieNVvTnEhKcd2pBdziW3AEITOqownVR7BjK9S13b+78ZEhP+SE1tWiboSQkXlQhkDFV21YW0qUha/SU9zsNA7BUGfttZOvB+UHMAzXW/5/hNjmT51DJU/wE0GT2poQg29FFr64EmxXlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730692; c=relaxed/simple;
	bh=2bbs28Pr3gpXiNQTJFIPOnL+UL/yhNQ2XVGbdRGuOaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFGthykCrhQfNsSXCaSbO2ARcvfQW9EDHg9ZiAM84MUqceOIZkWfPenlj6jY+HjnKsYdRJgZNbv5cQKchc5oK2bywp+5l/0iHn29BtdB1r7FjEs/sVxpzdjuNWWYPpi4TrkZWHCatpTtz5AADeez0UXiMjtIT24Hx1LoWWPYmA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0pGy84Nb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pMoZN/vj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0pGy84Nb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pMoZN/vj; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B83946B34B;
	Sat,  6 Jun 2026 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780730682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ifzahJ7Xg5c6d27lOYsWbT11uB3nSjqUzNFY/CJvKf8=;
	b=0pGy84NbUYBPm+D/BqXVO8PGFyJ79To6PAJGANaQY2c0riwurPrSXOCUuhDmFq8TbxU1Pz
	kSCZRmSB5WgszdCl523Y8O2/tGaqoJn8jE657C56RXpYQyNgr2vdf7eG0dgt91oqh9CVgY
	ddpoIQk1aqRm+IExeH8fIlL1UIlHinE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780730682;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ifzahJ7Xg5c6d27lOYsWbT11uB3nSjqUzNFY/CJvKf8=;
	b=pMoZN/vjAZSMxkjLUt54dkt2PlsLvGc4UTjYW118i1JLCFpgN7lRPNLLkbjc/ZjMnMQEXM
	RgifHouggWiet5CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780730682; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ifzahJ7Xg5c6d27lOYsWbT11uB3nSjqUzNFY/CJvKf8=;
	b=0pGy84NbUYBPm+D/BqXVO8PGFyJ79To6PAJGANaQY2c0riwurPrSXOCUuhDmFq8TbxU1Pz
	kSCZRmSB5WgszdCl523Y8O2/tGaqoJn8jE657C56RXpYQyNgr2vdf7eG0dgt91oqh9CVgY
	ddpoIQk1aqRm+IExeH8fIlL1UIlHinE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780730682;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ifzahJ7Xg5c6d27lOYsWbT11uB3nSjqUzNFY/CJvKf8=;
	b=pMoZN/vjAZSMxkjLUt54dkt2PlsLvGc4UTjYW118i1JLCFpgN7lRPNLLkbjc/ZjMnMQEXM
	RgifHouggWiet5CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F693779A7;
	Sat,  6 Jun 2026 07:24:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S5vJATfLI2rXCAAAD6G6ig
	(envelope-from <hare@suse.de>); Sat, 06 Jun 2026 07:24:39 +0000
Message-ID: <8d5d56c1-8514-4132-9618-544b1b106536@suse.de>
Date: Sat, 6 Jun 2026 09:24:34 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] block: add a macro to initialize the status table
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org,
 linux-doc@vger.kernel.org, Keith Busch <kbusch@kernel.org>
References: <20260605184441.590927-1-hch@lst.de>
 <20260605184441.590927-2-hch@lst.de>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260605184441.590927-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91205-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:corbet@lwn.net,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kbusch@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hare@suse.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hare@suse.de,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lst.de:email,suse.de:mid,suse.de:dkim,suse.de:from_mime,suse.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED7D364CD81

On 6/5/26 20:44, Christoph Hellwig wrote:
> Prepare for adding a new value to the error table by adding a macro
> to fill it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Keith Busch <kbusch@kernel.org>
> ---
>   block/blk-core.c | 45 +++++++++++++++++++++++++--------------------
>   1 file changed, 25 insertions(+), 20 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

