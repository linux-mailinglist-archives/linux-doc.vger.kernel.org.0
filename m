Return-Path: <linux-doc+bounces-91848-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VyG5LJVjKWptWAMAu9opvQ
	(envelope-from <linux-doc+bounces-91848-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 15:16:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC9669A29
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 15:16:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=lst.de (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91848-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91848-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C5FD300FEF7
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 13:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A863C553B;
	Wed, 10 Jun 2026 13:11:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22200402BB7;
	Wed, 10 Jun 2026 13:11:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097112; cv=none; b=rhs82qQY7D3HlzDn87pZ6NSw3WsLh2s9OlpzlC7xS3mkhWu2HXfm69XTkOxhMlg181Jt4RAAy00on1Q/mRDKYje9owJ4tbs+iQTehHI0hydAmCNp9IYmk9YXKSmQETkqpa7y3Qssh1Vb7WeVb5dDbG36PWzfjfxTwG41d7BhTUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097112; c=relaxed/simple;
	bh=XYzzPXhDCp4hVVC1ev8esCe/MKln5TczSNtEOjOVxEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzUWMJ1sYpayH85+jQnSM7WnR/0NS68XKkuOrJGtbgp0B/QM3Y66ReS0kPVXg9tOociKxUEopmrbnDfXc//8nHJHs7qk4I0Y72Sa/IBbqIholoalFKWg72Z6XO0T2WDFJuVhks6592LqqVMPMnTiD+c1+JOOHzIDtU0hqrn2jhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8720068AFE; Wed, 10 Jun 2026 15:11:47 +0200 (CEST)
Date: Wed, 10 Jun 2026 15:11:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: configurable block error injection v4
Message-ID: <20260610131147.GA25086@lst.de>
References: <20260610051015.1906799-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610051015.1906799-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91848-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:corbet@lwn.net,m:dlemoal@kernel.org,m:hare@suse.de,m:kbusch@kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,lst.de:mid,lst.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6DC9669A29

Sashiko had two comments on this:

 - the one about the race of removal vs. addition is spot on, and
   trivially fixed by actually removing the code (unlock/lock cycle).
 - the other about zero-sized commands is valid, but more of an
   enhancement.  And one that if implemented right now actually
   make things worse, as flushed actually show up as empty writes
   with the preflush bit and not as REQ_OP_FLUSH.  So if we'd special
   case zero-sized bios, we'd make a flush hit all write rules,
   which would defeat the point.  We really need to do flushes as
   REQ_OP_FLUSH at the bio level :(

Below is what I plan to fold in, and I'm thinking of the empty bio
issue above can be caught in a comment or the documentation nicely.

diff --git a/block/error-injection.c b/block/error-injection.c
index 7f7f0d3327bc..3bc91f199dc7 100644
--- a/block/error-injection.c
+++ b/block/error-injection.c
@@ -119,11 +119,7 @@ static void error_inject_removeall(struct gendisk *disk)
 	while ((inj = list_first_entry_or_null(&disk->error_injection_list,
 			struct blk_error_inject, entry))) {
 		list_del_rcu(&inj->entry);
-		mutex_unlock(&disk->error_injection_lock);
-
 		kfree_rcu_mightsleep(inj);
-
-		mutex_lock(&disk->error_injection_lock);
 	}
 	static_branch_dec(&blk_error_injection_enabled);
 	mutex_unlock(&disk->error_injection_lock);

