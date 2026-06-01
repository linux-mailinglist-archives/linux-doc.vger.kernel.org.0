Return-Path: <linux-doc+bounces-90216-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGC2JCUuHWo4WAkAu9opvQ
	(envelope-from <linux-doc+bounces-90216-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 09:00:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 363FE61A8AC
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 09:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4727E3000B11
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 07:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734223806CD;
	Mon,  1 Jun 2026 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kbb3CgDm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7/9Tz9ud"
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9AD3612E9;
	Mon,  1 Jun 2026 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780297250; cv=none; b=RfC8rpRn8U8HsV7gO9eapHmhkVyZZnFy+m0MmHhon4z7Q+zoP3v7ixzUEF5e2cNs+IWD76anikvSh7NSFpV+MMaEMIQTfs2dVOHo/uKo8cs8aUm/Vzq2OPauf8DrVQfYQbhfpAEd/1FNIWl+QyY0HaYiIYk+OuUZf7c+wusRod8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780297250; c=relaxed/simple;
	bh=FtMgwKmV6UhO5gxjh1OgBDWGM6OkI5/cZHnoLiGRjj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2pnQU7xbNdJfZCgcikSd9prVL1ppUz21NBmNp6aic1O8ulP8hdnHwqDXOD/g+l2EbWg0vaePI8efWt6S6VneI2NJrnlQgKopWqK0MZmnoJOdWPfVzRkupROefHwYK9m39wQwtFbQwaWQZGILjo4b2E1re39j06+ia8Ba6zaZZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kbb3CgDm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7/9Tz9ud; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 1 Jun 2026 09:00:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780297247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZWbX6EVvXIYtfo1TGDGyyFNKCDwYGa82lcwcbE3N74=;
	b=kbb3CgDmRqSJCW1dQApXOh6gnZMQW0n1Dwsh0no7y3u/Sloh5MOI9gZr83q38n1gcTcAPA
	Q0i2KqigATolj7ecQgwN02hC9zuXapbZ2MeTXUjHCPh2IsAh+D02zOiISnXacANdmK9Epd
	TYs784tjnnxVBn5aC+NyQmzorUnTvvxbT0q7nmEL9soOAyqe5GpWI53WH3mZ7yKXz/DsEt
	l3zraltOzqTg8xBeRybh2f7+YILAWcDkKfz0PzWuiDzX1c2FN07eZtqloKVQA8xjXjMM46
	/3wRywIgeCpDmGNVjWqMmCi+N9CyBmCjyb61wenpLwYr7abBZcwpyY0CWkJKbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780297247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZWbX6EVvXIYtfo1TGDGyyFNKCDwYGa82lcwcbE3N74=;
	b=7/9Tz9udWlk+RRPHcp9IW7iMYwoleW4jdnUDfjBxnYBBFRPfJvYbPCUnJwa5g5q7BOL9BL
	5u5RDDeqfmgtWuAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Costa Shulyupin <costa.shul@redhat.com>
Cc: Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] docs: real-time: Fix duplicated sched(7) text
Message-ID: <20260601070046.l5gSZHm5@linutronix.de>
References: <20260531141823.4118954-1-costa.shul@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260531141823.4118954-1-costa.shul@redhat.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90216-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,linutronix.de:mid,linutronix.de:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 363FE61A8AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-31 17:18:22 [+0300], Costa Shulyupin wrote:
> The man page reference appeared twice - once as plain text and
> once as a hyperlink. Remove the plain text duplicate.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

