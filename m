Return-Path: <linux-doc+bounces-81195-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH3xHzvpw2lvugQAu9opvQ
	(envelope-from <linux-doc+bounces-81195-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 14:55:07 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C52A8326335
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 14:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 738A7314FEDA
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 13:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0605E39B97E;
	Wed, 25 Mar 2026 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KH76JdWv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k9HGEBxl"
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B750819CD0A;
	Wed, 25 Mar 2026 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444867; cv=none; b=pdTTTeXGyLRlrEigusZLH0bx8cZnthzuPNv2+MIGfpBhHCJAUQ0zdOAv+wbJ2KrA2ZhsIP7FEVrtFKsMrDLB0fKr+Oza7uKUJTLQOjIaBQtvdrj8/9EIE7UFr5gpqAjznNOxKD0oS5qz1Yrw2v2SbC5cKfwOn4D52Vnb9NcaStQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444867; c=relaxed/simple;
	bh=3zf1bf9mIbHMTcVc/HHqf60OFkQdrUhHCVx6XZQLpeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1RU0spvGK9TVg/Tts7lVrMZJm/1dwEjMFvD8Eqphvn/1VrICQrvd4DwPKvQj7G4Mix54nj+NW1FkvoXsIbaLllueAywnhR3vV9p4gGrF9vbJlfjXJcr5+3MV10VDLG2KFfTLlKdeJopKZtdOHKBVp6QL+gn5bNSFMmD4If2z6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KH76JdWv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k9HGEBxl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 25 Mar 2026 14:21:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774444864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIrAl64UrQg+C0w/VEPHVniOPhHayN4roW8hMff5zH0=;
	b=KH76JdWv4Y/CkpUIsgEbcll6FQpSSJ6VyL0Ox4O9d5/ur34/FtHNMCGGHinMU0v+7viFPn
	jMDzaEv3Bop4jBrZRb6NjvNKn4C65bjbW4uXIQBDSifxEGIiPpNQgwR+bSLCglXjF6Oe3r
	icLBiEiugIh5VO6Q6kbSin9p5YYZej828+xep2nR/c+bUcyf9xbFrIiPB/wmoVBUYyqaEO
	lGmUqUQ+nBGUcDjJiKqk3yt4+HJCDS6EuZbRLxNGGRS3YRgw2PRBZbAVc0CY1JSRtNWOHm
	8RQ9+0TCYNTUA0gn33OoarrClwYqvQ8c+Ph5LyYSumFM2jMNSWpVH266keEPKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774444864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIrAl64UrQg+C0w/VEPHVniOPhHayN4roW8hMff5zH0=;
	b=k9HGEBxljZgcn8ha+JIgz21YNz7DpDlyzAnXube6UR5EOSlfZw3loRz3rzaOajd4e3HN+a
	rlYqotO7tjpZ2ZAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	linux-doc@vger.kernel.org, John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH] doc: Add CPU Isolation documentation
Message-ID: <20260325132103.nrQwDBzs@linutronix.de>
References: <20250809094247.8384-1-frederic@kernel.org>
 <20260320151036.v_Sn93P-@linutronix.de>
 <acPZBRThz7g_6EXe@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <acPZBRThz7g_6EXe@localhost.localdomain>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81195-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Queue-Id: C52A8326335
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-25 13:45:57 [+0100], Frederic Weisbecker wrote:
> > > +Interface
> > > +~~~~~~~~~
> > > +
> > > +- :ref:`Documentation/admin-guide/cgroup-v2.rst <Cpuset v2 "isolated"
> > > +  partitions>`
> >=20
> > I've been told by Jonathan once to just use the .rst file without
> > anything around it and the HTML render will make the link on its own.
> >=20
> > =E2=80=A6
>=20
> Hmm, how would that look like? Just this?
>=20
> +- Documentation/admin-guide/cgroup-v2.rst

Yes. If you look at
	Documentation/core-api/real-time/differences.rst

and look for "Sequence locks". If you compare this vs the render version
	https://docs.kernel.org/core-api/real-time/differences.html#sequence-locks

then you see it got resolved as html link including description.

> > > +Checklist
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D
=E2=80=A6
>=20
> We should probably have this to a seperate file that both isolation and r=
t could
> link to?

yeah. Either you look for a spot and start or keep it as-is and I rip it
out and a reference to a common document once we have on.

> Thanks.

Sebastian

