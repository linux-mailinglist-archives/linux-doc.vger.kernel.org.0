Return-Path: <linux-doc+bounces-86483-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QjTZAzMK/mm1mQAAu9opvQ
	(envelope-from <linux-doc+bounces-86483-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 18:07:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 567BE4F9317
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 18:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FADB30C17AD
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 16:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B540A376BD9;
	Fri,  8 May 2026 15:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="R1Dwp/mG"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564A13D3D16;
	Fri,  8 May 2026 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778255906; cv=none; b=LaFUOR66UQjfmRfKW9Z3G81pTfpicWBDMa2LSeGuclVFyyJketKlfT6dorNVpzQCVDD6/MOIlb0Dt53cdGVGsmasFAlj3TSXnvcC9PX8MfoxbiDYOHE7MKcau6Y5sZC6VP4zTQ3mXp9LC0vXxQtbDnS4fALptdn/qucSxqQzj3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778255906; c=relaxed/simple;
	bh=nyCUjOYqPTh9KITmYgP05IsbiD6gk6fZn8WAO9Rfr/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8qkmapsXrkh2RaaWvRLac2ZGR8InUEBrgp1GViqQBcEJSEkDDOr+S6y0L41+HVjey+ouxt5vnxOjRbrsq3W8d1KOwXWCf2sRXI1vts+g/F53bP+nFvau+RwL0EsA/JOIb9LeD+7B2OemsWQ5adBIO6B5JKbO9QFBZYpcIBo7l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=R1Dwp/mG; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1778255300;
	bh=W678Qa/H8vJfMe39MVrcLpV6doreu41bREVmv4one20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1Dwp/mGNrf59CjxoooJ2ZKh3ijYDeEG2dmoumfQ544up8p9IZEbSwx1JtnKUNUVh
	 xAV7Deo+fyENZ0vb+QXDrmGQfrTv4lUrBCogqnwZ1oD6rH5wsAMQ1U50OVG7+zhpYA
	 o/fmUMcEu8LhpNyVOQNyAj9h2Ysk44/1oTP07XA3snjmPhsD2QFQnE8hwPwo9drZFZ
	 GZzcgp9YjkXS32j4zDzprFI/9HPAW5U4ShBzkQCKiX4ziyjLyVjYQkmypEe8hdeNRL
	 FIyDDmszuCUZAGEeseVZjvbPg8YZqLMYRPBR+ji3e/Z5y78zYM48828CnFUmWtWDao
	 JtP47zfJi2muw==
Received: from localhost.localdomain (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4gBtnJ5T0qz1T4;
	Fri, 08 May 2026 11:48:20 -0400 (EDT)
Date: Fri, 8 May 2026 11:48:19 -0400
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <af4Fwxndqv2knLov@localhost.localdomain>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <DIDEQIFQF1EW.11CESAK4JL4PR@ubuntu.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIDEQIFQF1EW.11CESAK4JL4PR@ubuntu.com>
X-Rspamd-Queue-Id: 567BE4F9317
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[efficios.com,none];
	R_DKIM_ALLOW(-0.20)[efficios.com:s=smtpout1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86483-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[efficios.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.desnoyers@efficios.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,efficios.com:url,efficios.com:dkim,localhost.localdomain:mid]
X-Rspamd-Action: no action

On 08-May-2026 11:40:54 AM, Joshua Peisach wrote:
> On Thu May 7, 2026 at 3:05 AM EDT, Sasha Levin wrote:
> > 
> > For many such issues the simplest mitigation is to stop calling the buggy
> > function. Killswitch provides that. An admin writes:
> > 
> >     echo "engage af_alg_sendmsg -1" \
> >         > /sys/kernel/security/killswitch/control
> > 
> > After this, af_alg_sendmsg() returns -EPERM on every call without
> > running its body. The mitigation takes effect immediately, and is dropped on
> > the next reboot.
> > 
> > A lot of recent kernel issues sit in code paths most installs only have enabled
> > to support a relative minority of users: AF_ALG, ksmbd, nf_tables, vsock, ax25,
> > and friends.
> > 
> > For most users, the cost of "this socket family stops working for the day" is
> > much smaller than the cost of running a known vulnerable kernel until the fix
> > land.
> 
> I like the concept - but is there any way to ensure that important functions
> like malloc aren't being patched? Or some way to make sure that what is being
> patched will not kill the entire kernel?
> 
> I know this probably boils down to "operator has to use it correctly", but just
> wondering if this was considered.

I like the idea too, it should help prevent a few devops burnouts in the
coming weeks.

One possible approach to prevent "footgun" type of killswitch use would
be to first apply a statistics collection killswitch handler that does
not change the behavior: it checks whether the target function is
invoked at all on the system for a given period of time. Then it applies
the killswitch if it was not invoked during that period. Overall
sequence:

- pre-soak killswitch for e.g. 30s, checking whether the function is
  invoked at all. (period would be user-configurable)
- if no calls were detected, engage killswitch, else report failure to
  the user.

This should prevent footguns such as trying to killswitch fork, malloc
or other core functions which are inherently required.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

