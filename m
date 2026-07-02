Return-Path: <linux-doc+bounces-94564-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z3HeK0c9RmpSMgsAu9opvQ
	(envelope-from <linux-doc+bounces-94564-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 12:28:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5176F5E87
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 12:28:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=suse.de (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94564-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94564-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9D4E32CADF3
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 10:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B821A4E3762;
	Thu,  2 Jul 2026 09:51:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5684DD6FF
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 09:51:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985905; cv=none; b=SClbKkkYdzsfPdI7qeX11xZtRuKVZ9Kv+YlBjOhtVxGYF0CQR8IBamlFPC8If1TtbixMdTr21XKiY4Vk3P2c2xq2RMHgGJsy3I90i7jYq89KcEhdMANN2rQM3M3KdSoiUPcGfCfhIddI7I8E9V4hQeww2iPpc3I6hZV6trLfdfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985905; c=relaxed/simple;
	bh=/tsZLXAY/qwFyLxHrELB4IEfpzk+fsxBNjJEEz2oFZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eNDjQYmsfKXb9UlNHdxRbfDAnin57dyV4DoQKpzN4ig4QgiCj5c6VuReqJDPw2L5/VWrqWl4FOTcikMg2SQ35SlxHZ/UlfxB8luR5EYzHjxtTMhseyGAfWJ50tOYL2TFI50dhPUZ65jkiQ5ILnWtVcUTUiJnLSqTlM+lgP0rqEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7DED874108;
	Thu,  2 Jul 2026 09:51:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 294AF779AA;
	Thu,  2 Jul 2026 09:51:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ov+uCKk0RmrIEwAAD6G6ig
	(envelope-from <ddiss@suse.de>); Thu, 02 Jul 2026 09:51:37 +0000
Date: Thu, 2 Jul 2026 19:51:34 +1000
From: David Disseldorp <ddiss@suse.de>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Christian Brauner <brauner@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, David
 Hildenbrand <david@kernel.org>, Jeff Layton <jlayton@kernel.org>, Vlastimil
 Babka <vbabka@kernel.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
Message-ID: <20260702195134.02077576.ddiss@suse.de>
In-Reply-To: <87jyreofpw.fsf@trenco.lwn.net>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
	<87jyreofpw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ddiss@suse.de,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94564-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:axboe@kernel.dk,m:david@kernel.org,m:jlayton@kernel.org,m:vbabka@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ddiss@suse.de,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lwn.net:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD5176F5E87

On Wed, 01 Jul 2026 10:08:11 -0600, Jonathan Corbet wrote:

> > Why precisely do we require all this detailed information about what
> > specific coding assistant was used?  
> 
> From my memory of the discussions:
> 
> - If a specific LLM turns out to be in a bad position with regard to
>   some copyright ruling, we can identify the commits that might have
>   been tainted by it.
> 
> - Similarly should an LLM prove to have an inclination toward specific
>   types of security issues.
> 
> Whether either of these would ever actually prove useful is not
> something I can hazard a guess for.

In https://lwn.net/Articles/854645/ (An update on the UMN affair) you
documented a case where an organization acted maliciously, resulting in
the need to audit (and revert) numerous commits based on git authorship
metadata. IMO the existing Assisted-by tags, although far from perfect,
will be useful for audits when a specific LLM coding assistant is
similarly found to be generating malicious output.

Thanks, David

