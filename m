Return-Path: <linux-doc+bounces-92369-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8sQKHzm0L2pqEwUAu9opvQ
	(envelope-from <linux-doc+bounces-92369-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 10:13:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BE2684707
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 10:13:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=Q78gvIbh;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=L69U6WP9;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92369-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92369-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11937300F57C
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 08:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF4D3C1090;
	Mon, 15 Jun 2026 08:13:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96453C0A14;
	Mon, 15 Jun 2026 08:13:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781511223; cv=none; b=AhvmYfwq1nakoNn+Kgbfj5kDY226EVZA6kGI0QoMLmYlj+DXzVfUssIYXasmgBNo9EVhtf6eDbfD34UZ45BOL5BrRzVZ3+NFIlISdEUwqq7m1hwTudimzujc6Q27DBx9/PDBvo5GugeRPOJ8JmXMiHHWGr5x4P/Ms74eiYVmI4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781511223; c=relaxed/simple;
	bh=Qgdj0dkb+IjIDtWTuXh7o4a2XDBRKLhl6mKOKP5fDwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnpUVngkf+OgSf47dp9v/xYVML1peIK91sJRa6IAQR270lv0QhjOxxFUGrEzRDZVTjCcaMNYdCARVaAmG7Y1SskphJZPV0Ryp7Sb9YqBwbuQInN6bWM4yMgT3OIVn8NiswfRd05z0D/tjkgAcpYUDFSpWy+ORZycdn/4kUbbSoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q78gvIbh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L69U6WP9; arc=none smtp.client-ip=193.142.43.55
Date: Mon, 15 Jun 2026 10:13:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781511217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ERV8qo+XISRjEI2pq31fS3oFYd5RWtEhuYxOH/yw4VY=;
	b=Q78gvIbh+rrcUC//ANxWfGVmd9QA4AXz/tFfm/DgPkpQEc2E6KJCRZb7HXqLaqzdXWwwFZ
	Aa27m9M7S0/QXeeEALT0ZPhqvmcSG+ZOqNdk+8bwtb2BqmnX9Mg1pguKtKXMQNlCMGPbFk
	dG9S4Pgl1vo7CuzQx89iExDMWnjiD+FRP9tLcohogAuajhwgML93W6fv4+WbKKICBmU/5G
	igLCfRc0QGtpGa62St0rTpkkjIcrO0Ga5csnJOxkf5e4q/tz0jlPTY6YVE+3dm1IgS/xL0
	C4k68Xd4f9YbqYFLmLqNVxRGoB5QKUzRa5P0s6iRwyZ0MPfXCPoubcHMtbvGuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781511217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ERV8qo+XISRjEI2pq31fS3oFYd5RWtEhuYxOH/yw4VY=;
	b=L69U6WP9dZk5OvecztTDEHx/OL06WWQ2eZXzsoMdlT97QSFmCg56viWxDok95V0ypbjBQb
	WOpVETkzuh2Kb5Dw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:Real-time Linux (PREEMPT_RT)" <linux-rt-devel@lists.linux.dev>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: index.rst: add entry of other
 sub-directory
Message-ID: <20260615081336.9RXj7yGR@linutronix.de>
References: <20260603080430.344391-2-manuelebner@mailbox.org>
 <87pl1v5zga.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87pl1v5zga.fsf@trenco.lwn.net>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-92369-lists,linux-doc=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:manuelebner@mailbox.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:skhan@linuxfoundation.org,m:linux-rt-devel@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linutronix.de:dkim,linutronix.de:mid,linutronix.de:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09BE2684707

On 2026-06-12 13:30:13 [-0600], Jonathan Corbet wrote:
> Manuel Ebner <manuelebner@mailbox.org> writes:
> 
> > add reference to scheduler/sched-rt-group.rst
> >
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > ---
> >  Documentation/core-api/real-time/index.rst | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/core-api/real-time/index.rst b/Documentation/core-api/real-time/index.rst
> > index f08d2395a22c..661b419e7f8f 100644
> > --- a/Documentation/core-api/real-time/index.rst
> > +++ b/Documentation/core-api/real-time/index.rst
> > @@ -15,3 +15,4 @@ the required changes compared to a non-PREEMPT_RT configuration.
> >     differences
> >     hardware
> >     architecture-porting
> > +   Real-Time group scheduling <../../scheduler/sched-rt-group>
> 
> This file already appears in the toctree in
> Documentation/scheduler/index.rst; adding it elsewhere can create build
> problems.  If you really want a link here, the way to do it is to add a
> cross reference instead.

The long term goal is to remove sched-rt-group and replace it with
something else. Manuel stated that he just found it and was not/ is not
using it. Maybe just drop it entirely.

> jon

Sebastian

