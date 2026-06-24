Return-Path: <linux-doc+bounces-93336-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JlSjBVsiO2rBRQgAu9opvQ
	(envelope-from <linux-doc+bounces-93336-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 02:18:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9EF6BAB4E
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 02:18:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OozVl96Z;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93336-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93336-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75EFC301CA53
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 00:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260EB3093D8;
	Wed, 24 Jun 2026 00:18:30 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F601E4BE;
	Wed, 24 Jun 2026 00:18:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782260310; cv=none; b=thWeTR9yHwTMPHuhBOm5yLCtSA0Q99DS7V+0Yoi0ocFgZr+wVYgxj9KcxqWlH+FGiGCEyGGiNX+c5shomDRjHwEC19aV+7XGZZyWT+lG+T20VaaQG2JCyDj9+Ew/vBpWLMttMFEvwyf4guzeFOMCp0NoJo15mqoRNUgiLL5/Yo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782260310; c=relaxed/simple;
	bh=XzOxuRDnofjdrpT4K4fhZObNEk3P3gYfZ52SiFLtxnA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LFcw7ghXfmX/ZafGEPfNlPGC9By3/8B9k5CNC0m8jK0uTzTm/9x906ljkjF/h0D0q8+rWKluhHnB/X1zvA67bqw3vcfXK+4MTh13ZRQAAKMyZsqQVebWXJfakMaY0TxL7zCTms/8IYexGQhSd+srII5W3ZnAVuLoqBtovVe6nG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OozVl96Z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEAAA1F000E9;
	Wed, 24 Jun 2026 00:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782260308;
	bh=XrdhfGcYgMenD2jjtSGlsm428jv6nMXQm1sX0BzfxKw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OozVl96ZTJyZ68ickb8lSlOhTHybBuDoHD49NK8nbpQsVcT2qB8/UhoU8Hbw4kjlj
	 1/V6k6zWOZxt6R8HHLm+83bAQgCANxuhXqMDiSm7yTCS5YdurQXcNHrcPxHUMVTR5l
	 gYcDU+/CSAVvUbThXr0JygEOBufLrsWkQW+hr5YVUqlaT15ovhTS5dK58bE631UPMq
	 2ERNQ+QZzfaq6dJREhJu+6YUsgw9Poc4x6Ey0aPrU3Vr1VrbMabnqnbMT8lhUAKixz
	 qoNo39f62VBlsCZxuHiGslbZ5W94SBDxiBjqVFb3sWsAZqITOHZKKpgkFirkMq993Z
	 jVbpwdKVbUcUQ==
Date: Wed, 24 Jun 2026 09:18:24 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 03/10] tracing/probes: Support dumping fetcharg
 program for debugging dynamic events
Message-Id: <20260624091824.8208ab77482dd411ca9c7fcc@kernel.org>
In-Reply-To: <96b043ed-c527-4e5d-8eb7-631805da53fd@gmail.com>
References: <178217904992.643090.15726197350652241270.stgit@devnote2>
	<178217907822.643090.14693478306190628970.stgit@devnote2>
	<96b043ed-c527-4e5d-8eb7-631805da53fd@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-93336-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D9EF6BAB4E

On Tue, 23 Jun 2026 19:31:47 +0100
Julian Braha <julianbraha@gmail.com> wrote:

> Hi Masami,
> 
> On 6/23/26 02:44, Masami Hiramatsu (Google) wrote:
> 
> > +config PROBE_EVENTS_DUMP_FETCHARG
> > +	depends on PROBE_EVENTS
> > +	bool "Dump of dynamic probe event fetch-arguments"
> > +	default n
> 
> Sorry, kconfig nitpick: could you match the style used by the rest of
> the config options in this file? E.g. the type and prompt come first in
> the list of attributes?

Ah, good catch! Let me fix it.

Thanks,

> 
> - Julian Braha


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

