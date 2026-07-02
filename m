Return-Path: <linux-doc+bounces-94575-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fTglH0FLRmrVNwsAu9opvQ
	(envelope-from <linux-doc+bounces-94575-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 13:28:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCC26F6AFF
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 13:28:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=MrufhUSr;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94575-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-94575-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 257AB300748B
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 11:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429C63F6C22;
	Thu,  2 Jul 2026 11:27:58 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248783CB2EF;
	Thu,  2 Jul 2026 11:27:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782991678; cv=none; b=k1nTH8IJeRLr6ReYn+MBQs6Ru366FN+6B6qcLC+MboQ7TSZiuOL3Yrc74S6HNCr8/lU8fw1mH1fsOa+QtMberYZ2gUdpKha/e5zHYWbslb8Lj9f+jxawMmVGo5CV7KKvcG65xVqbU8Wh0Gv1xUn+OLNVmhsMh10FuHLwrCnJqe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782991678; c=relaxed/simple;
	bh=fM1g4x2BNT0I+p2uEA6GyQp5uAqaZy5LUt3RSXD/WvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNpEyx/GDJt+gF0D8JzDwfiIl4jtJm9aT2Uk9Cf9QY6HGmIfh6CCRLjLgkCf1NlKcIwyjl6SiBpelALK7TE4URWeCsbnwrCyA7ziouf2i9kGiWzvOt8Gd1L3fel8rrT/i5MKX88SgPwPbGrdbxUX1HpHV0uIa91g/tqc9V93tIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MrufhUSr; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xZVlJRZf0uavPI96jC0PFQV0YrUSBkAByWeLeb7ZK8I=; b=MrufhUSrMzj4v8PiyeZwfWD2hs
	JWNM0PN+UZIKM+as+lGeV5dSDXsxWXYqnDug0ttQVDLtWFB1Vwa8GQ4NEx8VUvnJZ6VVrd7AkwKTF
	7j32uGIz6jQSJcsXGH6Jli4wCre2P29E2IHDCLFxd0Qi/XBXmyaKBGDVo8y4ZvwF5LC30TIzrizfD
	A4IA4P+qZ0wVutOHjiBQp5hp7ZLfWBAFLMrIDzVRCyPPrzuqLlQPHa+TpFepXrGQSjbTgBXcJAv30
	orQPb6u6rVidkRBtfS7WddlYmUQGijhEHc7YWvTv6hiz781DBpmDFQjVeUUOxqTGxg2mbf+FLY8ms
	AwRGYfkg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFaF-00000004Jhy-3Bjo;
	Thu, 02 Jul 2026 11:27:55 +0000
Date: Thu, 2 Jul 2026 04:27:55 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>,
	David Hildenbrand <david@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
Message-ID: <akZLO6KcGRW4BCW_@infradead.org>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94575-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:david@kernel.org,m:jlayton@kernel.org,m:vbabka@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,infradead.org:mid,infradead.org:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BCC26F6AFF

On Wed, Jul 01, 2026 at 05:54:48PM +0200, Christian Brauner wrote:
> Assisted-by: LLM
> 
> or
> 
> Assisted-by: Coding Assistant

I think what is more relevant is what assistance there was.  If the
code was generated by an LLM we should plain out reject it out of
copyright grounds.  If it was used for validation or ideas: who
care?

I.e. do we need this at all except as a guard against vibe code junk
that pull in other copyrighted material?  And do we really rely on
a tag instead of detecting it by the usual signs?


