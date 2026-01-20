Return-Path: <linux-doc+bounces-73349-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCqfM2H6b2mUUgAAu9opvQ
	(envelope-from <linux-doc+bounces-73349-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 22:57:53 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 699244CA18
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 22:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 78081AECB69
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 21:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7493478E5C;
	Tue, 20 Jan 2026 20:53:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57413A7E02;
	Tue, 20 Jan 2026 20:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768942403; cv=none; b=Kfi5JqcUGOzRcsjR79uGzwrtwxTDIBQkWycFz4hIyhNHyz7iIQTbgKMAUPrEojT74qoTTDROpG7JdznD8Y+aVpqIDVxkUn7XUM87bbwUZ4Cx7Seb9AcNX35A1rfQxBpQ/nnrYhJZu72++Bgc1TBHwfkH+pFIEmHzswB9qFDJZmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768942403; c=relaxed/simple;
	bh=uP8d0d+fxd33Q3HUTjKUKiAlyIbc/ltGWmJgzKq6RWk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cw2JiJcIb3ubG1cIcvyW3nC3LXM0DZmuXAqN2+MCcxXVdbUoSBQ0ykPnV4AMfKkBwWtT4T0g2S14kwNNFutEATB+BHqMi6CdoBF5Y7rB83gN/VQqZJMDCHUlctnR68brQVLWYN/4ck7zpctL7w65YWPZJ3hu4yCnEjjPZU12B4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 9418B1A06CA;
	Tue, 20 Jan 2026 20:53:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 6B8532F;
	Tue, 20 Jan 2026 20:53:18 +0000 (UTC)
Date: Tue, 20 Jan 2026 15:53:40 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
Cc: mhiramat@kernel.org, corbet@lwn.net, shuah@kernel.org,
 mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 v5 1/3] docs: tracing/fprobe: Document list filters
 and :entry/:exit
Message-ID: <20260120155340.2dac7fab@gandalf.local.home>
In-Reply-To: <20260118011815.56516-2-seokwoo.chung130@gmail.com>
References: <20260118011815.56516-1-seokwoo.chung130@gmail.com>
	<20260118011815.56516-2-seokwoo.chung130@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ixutpamsajw7cik16ciuqack4n9p8ko8
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/zXRpA+Z28kL9/CYL7IFSM3d+dRjdipjE=
X-HE-Tag: 1768942398-432765
X-HE-Meta: U2FsdGVkX1/1f9BFMU+kqLTPKr+Vsbi2VrbCBjzDnI0kdvIzCeCDOeIwhuFkjKJSp9b1zw5jVL2xl5wRf3mP91O954f1s3uDPKe5qOpKzGK/vpmPkdJwtXX+4f0hLZfd+TuvF8NgoGCNUy8SqlRKPdkLvQOKYzRZy/DEwyyBRcrzqirq9sHZzd+fE63SXhT0D4GLwB4Nz+VQ8XdtuLrVz3vbgHumVc4LjftkVSWgPZD00BT1c8ddogXraPNXoi6W+O4Md9W/37OqXwuI5scfg9+fkSwmik2uMpTCGw3i2RY1saXiwIOwZzkZmaGk/CINiaMlZsKLUWQS13PlK2anc/4uL+UT+EOt
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : No valid SPF, No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-73349-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,gandalf.local.home:mid]
X-Rspamd-Queue-Id: 699244CA18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 17 Jan 2026 20:18:13 -0500
"Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com> wrote:

> Update fprobe event documentation to describe comma-separated symbol lists,
> exclusions, and explicit suffixes.

Usually, the documentation updates comes *after* the changes.

-- Steve

> 
> Signed-off-by: Seokwoo Chung (Ryan) <seokwoo.chung130@gmail.com>
> ---
>  Documentation/trace/fprobetrace.rst | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/trace/fprobetrace.rst b/Documentation/trace/fprobetrace.rst
> index b4c2ca3d02c1..bbcfd57f0005 100644
> --- a/Documentation/trace/fprobetrace.rst
> +++ b/Documentation/trace/fprobetrace.rst
> @@ -25,14 +25,18 @@ Synopsis of fprobe-events
>  -------------------------
>  ::
>  
> -  f[:[GRP1/][EVENT1]] SYM [FETCHARGS]                       : Probe on function entry
> -  f[MAXACTIVE][:[GRP1/][EVENT1]] SYM%return [FETCHARGS]     : Probe on function exit
> +  f[:[GRP1/][EVENT1]] SYM[%return] [FETCHARGS]		    : Single function
> +  f[:[GRP1/][EVENT1]] SYM[,[!]SYM[,...]][:entry|:exit] [FETCHARGS] :Multiple
> +  function
>    t[:[GRP2/][EVENT2]] TRACEPOINT [FETCHARGS]                : Probe on tracepoint
>  
>   GRP1           : Group name for fprobe. If omitted, use "fprobes" for it.
>   GRP2           : Group name for tprobe. If omitted, use "tracepoints" for it.
>   EVENT1         : Event name for fprobe. If omitted, the event name is
> -                  "SYM__entry" or "SYM__exit".
> +		  - For a single literal symbol, the event name is
> +		    "SYM__entry" or "SYM__exit".
> +		  - For a *list or any wildcard*, an explicit [GRP1/][EVENT1] is
> +		    required; otherwise the parser rejects it.
>   EVENT2         : Event name for tprobe. If omitted, the event name is
>                    the same as "TRACEPOINT", but if the "TRACEPOINT" starts
>                    with a digit character, "_TRACEPOINT" is used.
> @@ -40,6 +44,13 @@ Synopsis of fprobe-events
>                    can be probed simultaneously, or 0 for the default value
>                    as defined in Documentation/trace/fprobe.rst
>  
> + SYM		: Function name or comma-separated list of symbols.
> +		  - SYM prefixed with "!" are exclusions.
> +		  - ":entry" suffix means it probes entry of given symbols
> +		    (default)
> +		  - ":exit" suffix means it probes exit of given symbols.
> +		  - "%return" suffix means it probes exit of SYM (single
> +		    symbol).
>   FETCHARGS      : Arguments. Each probe can have up to 128 args.
>    ARG           : Fetch "ARG" function argument using BTF (only for function
>                    entry or tracepoint.) (\*1)


