Return-Path: <linux-doc+bounces-90718-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id quFsKMcPIGouvQAAu9opvQ
	(envelope-from <linux-doc+bounces-90718-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 13:28:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA41D6370A3
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 13:28:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=lGbh7Gi2;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=Uwam2fAH;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90718-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90718-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABC4330B29D1
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 11:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D59C44DB9D;
	Wed,  3 Jun 2026 11:06:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F3D3C5855;
	Wed,  3 Jun 2026 11:06:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484803; cv=none; b=C/yjvPbX+VTiT56h1C/OSC0f/he5H9ZRzdM1nqVuHwhlQu5SibtK9Xs3q8HWS1uiTQGkpTCQFHlUw+YmyYB0fEQTULQlDfkvP1a/ZVuq4QpnGvJEwGWLuMh3G5FKDYgbw5xKJUr1lHQezfFSe5SMaelAisOyO3GnWXykGD39mb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484803; c=relaxed/simple;
	bh=R1CXJesFB5FOp36O1SCpL2ILpN7BMqECmtc3/EkYnRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYeEOdQ7axUGTXXD004td/4IdEvKRApDou8ai8DsPaqU+ZFKPbA8Fx/XxQleKEOHSegWAPTKYMX5WzeL3o6YWR417IeSa1cU8j/eseVF5c3mVJGzugIX0tUQvMNBFaaDI4y6FgPFiT7apJWW21JQ3Tn43wbnjbLh3gvCoX5USeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lGbh7Gi2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Uwam2fAH; arc=none smtp.client-ip=193.142.43.55
Date: Wed, 3 Jun 2026 13:06:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780484800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R1CXJesFB5FOp36O1SCpL2ILpN7BMqECmtc3/EkYnRA=;
	b=lGbh7Gi2Y8O4yHLzKxZJk0JArJ+InC+bpJUMs416bvvEWApqqgsHnloFnIrMKarQzOsAwJ
	jlxL9eT6ukgaS92yA5j3q8goATbilVPABIhpFwPdM6oNa2mcQduH7+L9QKlCePeLlHEiuu
	78PMFDYM5cUKbaRUTQwbobaGwi4P9x6Ui6Bz0JYyG3b1UsXyTksNMZNXCAkhjuhmbKOMBa
	4aEWK9wPqIJE1p7MWeEPJcutYTw6MDmQsmf1W1DD/MI6PDVeneCMu+yKDtYOVwy1sfnoE3
	arHF4QEuBVOg1BuBeFjjpa3YRfmxNscBEuUXxx0GyP236cagLsqfvwgKQfklfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780484800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R1CXJesFB5FOp36O1SCpL2ILpN7BMqECmtc3/EkYnRA=;
	b=Uwam2fAHkXFhdx1glIutphK3UhMmdPvPn/sRTnD2Hkq1ef3PTzPmHMiiDUVKpztn4bP/8l
	jm1++pHenPK59MBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: linux-rt-users <linux-rt-users@vger.kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:Real-time Linux (PREEMPT_RT)" <linux-rt-devel@lists.linux.dev>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: index.rst: add entry of other
 sub-directory
Message-ID: <20260603110639.orWE0pyG@linutronix.de>
References: <20260603080430.344391-2-manuelebner@mailbox.org>
 <20260603102020.ZsS16TaP@linutronix.de>
 <a553f123de4b4887e8e78e751ca727f9992d8b00.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a553f123de4b4887e8e78e751ca727f9992d8b00.camel@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-90718-lists,linux-doc=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:linux-rt-users@vger.kernel.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-rt-devel@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:from_mime,linutronix.de:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA41D6370A3

On 2026-06-03 12:55:57 [+0200], Manuel Ebner wrote:
> > People have been complaining about this=C2=A0
>=20
> Maybe with the help of them we can figure out what's happening.
> adding linux-rt-user@vger.kernel.org=20

good luck. What I managed to find out is that those, that did not copy
statements but run into trouble themself, were using in a multi-CPU
scenario. Based on other details I *think* it should not happen single
CPU usage but nobody confirmed.

But this HCBS thingy aims at replacing/ removing it entirely=E2=80=A6

Sebastian

