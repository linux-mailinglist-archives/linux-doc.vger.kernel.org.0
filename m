Return-Path: <linux-doc+bounces-82353-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM8dOe+pz2noywYAu9opvQ
	(envelope-from <linux-doc+bounces-82353-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 13:52:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55822393D18
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 13:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DC123033D14
	for <lists+linux-doc@lfdr.de>; Fri,  3 Apr 2026 11:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6260E3B2FCE;
	Fri,  3 Apr 2026 11:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="Kb2HwSre"
X-Original-To: linux-doc@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509AD377EA9;
	Fri,  3 Apr 2026 11:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217074; cv=none; b=YWexhc3pRkm6VLxfUy2CSQDYlNmnck0EdrQ/LSo72DLtbriMXPmCvDaynvd1bbt41fCxdsAGr/6pbhz2NpwnrER/3rupbZ9nXyA5HopaHw/ho2D08mewkmyFWkKL1EOGE9J3/yU7xue3nRmjzywKf/0rW9qXWPQYPx0wGQYsm0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217074; c=relaxed/simple;
	bh=m5oYYxfegYrbip1+kwznsffOseaKS1U9+M5gGsEPeh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kmo86lub3MqbXuQUb/KBL/uxpLKJYXaiVXTHU53vOBqscEX1TPPnym9I5mhL5EoaOlDq2xRFDRo2hLLI6oSFUAfFlSbD/Sbd4I4Q8H0R3NldeQzMxYDNDO749HNNPhkK2viOUuVV3g3tLKXQ5ildSQPHuU67oXOMS34TFpf+C8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=Kb2HwSre; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775217068; bh=/GMT2pew5uzETaGffA8RC320jiwmkcJaccfuTeMtXWY=;
	h=From:Message-ID:From;
	b=Kb2HwSre+1ivwT5H4Em2I379VJJmd6svWAj8f7lhxjkTtJhk1OYaFIqCFSgy48ZD9
	 n/N3NxTvMLCu5JuxZOBGRkiwvbJICz2cLp8BGBIJlLflugxwxK2wSC4ZIvUu9AYb8/
	 NE6idnfH4ZtEc/+ySU6WkFvzWQpHfV3uN3giHJ+g=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 4AB2DC0AC9;
	Fri, 03 Apr 2026 13:51:08 +0200 (CEST)
Date: Fri, 3 Apr 2026 13:51:07 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: edumazet@google.com, rdunlap@infradead.org,
        Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Documentation: clarify required info in security
 reports
Message-ID: <ac-pq44YBI5AIdQ7@1wt.eu>
References: <20260403062018.31080-1-w@1wt.eu>
 <2026040324-coping-vacation-7d64@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026040324-coping-vacation-7d64@gregkh>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[1wt.eu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[1wt.eu:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-82353-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[1wt.eu:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w@1wt.eu,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 55822393D18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 01:11:47PM +0200, Greg KH wrote:
> On Fri, Apr 03, 2026 at 08:20:15AM +0200, Willy Tarreau wrote:
> > Hi Greg,
> > 
> > I'm sending you the doc clarifications we discussed for the process of
> > reporting security issues. It's cut into the 3 patches I shared this
> > morning on the security list (plus two typos fixed and a paragraph
> > asking for one single issue per report):
> > 
> >   - one patch that reminds our need for a valid e-mail address
> >   - one that explains to reporters how to proceed to find maintainers
> >     addresses, hoping we won't have to do it for 90% of reports anymore
> >   - one that enumerates basic requirements for every report
> > 
> > I think it covers the difficulties we've faced this week. As always,
> > we might possibly find tiny adjustments to add, but my goal would be
> > for such updates to be merged in time to update the public page ASAP
> > so that we can redirect incomplete reports in an attempt to lower the
> > team's current load.
> 
> Looks great, thanks.  I've applied these to one of my trees and will get
> them to Linus in time for 7.0-final.

Thank you!
Willy

