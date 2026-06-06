Return-Path: <linux-doc+bounces-91207-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N8FRJdDLI2oVywEAu9opvQ
	(envelope-from <linux-doc+bounces-91207-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 09:27:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3D64CD93
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 09:27:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TMb3Dz9w;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=P1vlZfrp;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TMb3Dz9w;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=P1vlZfrp;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91207-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91207-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3023301DB92
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jun 2026 07:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B69526159E;
	Sat,  6 Jun 2026 07:27:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1818A22F388
	for <linux-doc@vger.kernel.org>; Sat,  6 Jun 2026 07:27:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730830; cv=none; b=iBvYLbKqE/UrWuUOjp1fEXHOYZ8gA9DGTiJgdTd/FydVQHRmMosR+DA5zmqxqYJUhcdLScAMSOHGjvrJnuPD9O+pYr9/Jn3PIjXlF7eNdf28wMDc6aqL4eEhzKyWFpijL1Yk+zdRwMq8ZVMPZ13A77CBD7PHE2ZzSFdb93x/was=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730830; c=relaxed/simple;
	bh=H9BvqPMhGTwjUGqQ/nhPPQ1S9rSVcigvJrteydMUf18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LzIWL0l6Mjo2fgaXqnI2CyHRQcgTC3StiXTYfnSXCbQEj/CoRin2TUeSMJ50kg2BtiG4Xqr27xZJHI+gusZE4iiQCjj0VBI23BliLt9iiDrhsadNixJfFRVJi91TJsZMfl8dgTIMoUcCgtFGh0eSPq16W7lEsJMs9oatjxJrQOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TMb3Dz9w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P1vlZfrp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TMb3Dz9w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P1vlZfrp; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4CDC2758CA;
	Sat,  6 Jun 2026 07:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780730827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UKQv9nUSGn/OFq7QahY19As0nQO6eXc8oWwO0yTC6ic=;
	b=TMb3Dz9wVjORx9tEkkT3xopFPDlMp4Cdp+4PDkVHbF05XYP/hHoOd6jr3PuABizxX4SRng
	Ezh70cEY8ba/EZM83MwVM/sMxxoh9FwBIC4kxkZBSLg2D2bKRh8JBDZ6qxb2L+RLwtTNGv
	5p9PXFWv5SqN09nFSdOnm5QNh0/9gGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780730827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UKQv9nUSGn/OFq7QahY19As0nQO6eXc8oWwO0yTC6ic=;
	b=P1vlZfrpI+GfkpYPmtxJffanfV2fMAXaSUoBTzmheY6pTHqLQ+1hex5NEM8MTM+brf3RWX
	Zn/0CR6BVX+QRiCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780730827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UKQv9nUSGn/OFq7QahY19As0nQO6eXc8oWwO0yTC6ic=;
	b=TMb3Dz9wVjORx9tEkkT3xopFPDlMp4Cdp+4PDkVHbF05XYP/hHoOd6jr3PuABizxX4SRng
	Ezh70cEY8ba/EZM83MwVM/sMxxoh9FwBIC4kxkZBSLg2D2bKRh8JBDZ6qxb2L+RLwtTNGv
	5p9PXFWv5SqN09nFSdOnm5QNh0/9gGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780730827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UKQv9nUSGn/OFq7QahY19As0nQO6eXc8oWwO0yTC6ic=;
	b=P1vlZfrpI+GfkpYPmtxJffanfV2fMAXaSUoBTzmheY6pTHqLQ+1hex5NEM8MTM+brf3RWX
	Zn/0CR6BVX+QRiCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 682B1779A7;
	Sat,  6 Jun 2026 07:27:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id t3t7OcfLI2oRCwAAD6G6ig
	(envelope-from <hare@suse.de>); Sat, 06 Jun 2026 07:27:03 +0000
Message-ID: <e41e442c-3191-424b-aa83-fc63b10b47ba@suse.de>
Date: Sat, 6 Jun 2026 09:27:00 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] block: add a str_to_blk_op helper
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org,
 linux-doc@vger.kernel.org, Keith Busch <kbusch@kernel.org>
References: <20260605184441.590927-1-hch@lst.de>
 <20260605184441.590927-4-hch@lst.de>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260605184441.590927-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91207-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:mid,suse.de:dkim,suse.de:from_mime,suse.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28B3D64CD93

On 6/5/26 20:44, Christoph Hellwig wrote:
> Add a helper to find the REQ_OP_XYZ constant from the "XYZ" string.
> This will be used for the error injection debugfs interface.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Keith Busch <kbusch@kernel.org>
> ---
>   block/blk-core.c | 10 ++++++++++
>   block/blk.h      |  1 +
>   2 files changed, 11 insertions(+)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

