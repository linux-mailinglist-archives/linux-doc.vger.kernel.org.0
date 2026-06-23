Return-Path: <linux-doc+bounces-93226-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tf4hGwFzOmof9QcAu9opvQ
	(envelope-from <linux-doc+bounces-93226-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 13:50:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 622BB6B6E05
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 13:50:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aoytTKJp;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93226-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93226-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BED4301982F
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 11:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CFB3D45FE;
	Tue, 23 Jun 2026 11:50:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8839374E6C;
	Tue, 23 Jun 2026 11:50:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215417; cv=none; b=otBXoznA3idB3/laO0oWTtHo3F46+gJZTgmSIc3if/6R/X7xRyhhG5t3/O6pNVd6ptkJO57tYUgoqRaEdO6cRro4MkktLWJwrBsNJGkVn3JULyW7fzOz8PjjSmtVg6hM1GuLA6MOURG7THrNsFtcNJTrC7ZK3wZ/uGkcJy2CzuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215417; c=relaxed/simple;
	bh=n9OhQRcivBTU+0Hw5QfVQWAdoHhSvvpTs4h0+H96Yv8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=g5XgzlJhsavMn/2uj17D0VKUIx4KkP9PzdFPiQcnpYeIw6OSsuZ7kcfk1jbvhmtCrdlhlTXis0zDRlqGgrMTOmJN8rmXjnJj96nsDYlbSOReXNOf8/13IbiOUAmbJulBmlz1oJmirsV/n0hwjTU/zMtRTZY7ySMgKg0W1rrwE0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoytTKJp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554ED1F000E9;
	Tue, 23 Jun 2026 11:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782215416;
	bh=d62k19kj1SfRjgL7jcO1Hvgy3SxR7Y2lcNyjJKm9tsY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aoytTKJpKqwrv0PxU7BckYroUsYWDez6dmQNqqy/xFmhsf4WiIX2f0iDLTacI7n/0
	 prIGaAvGrMEq29qEsx89JxkRvNnp3w8vIiHPSGQsmTxO4RhTSFeMFP7C6cU0Uvq3nA
	 P0qfK+RBTWf2NHRbIF0RK1rOKsqV4rqIYP7SyrWRbBELcnEDwXfiZzPYzHIow/dfmb
	 R8XbxHZYzpEmLI0OeHqnWtA0Hu4jv5g/T7xNgcifsXb8h1H+lm/hYohWfPQ/H9pYrc
	 IkPWQ7w+AqL6qzcP2WGTmDJzKdiuH/09lYcsVRcXTskKy3tCkjlngeYp1pl4xCaF4R
	 C7NlqrVd62+0A==
Date: Tue, 23 Jun 2026 20:50:11 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 06/10] tracing/probes: Type casting always involves
 nested calls
Message-Id: <20260623205011.6f295bbf425412435f25b72f@kernel.org>
In-Reply-To: <178217910709.643090.6379198143797177881.stgit@devnote2>
References: <178217904992.643090.15726197350652241270.stgit@devnote2>
	<178217910709.643090.6379198143797177881.stgit@devnote2>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93226-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 622BB6B6E05


Sashiko commented:

> > +	}
> > +	*close = '\0';
> >  
> > -		ctx->offset += 1;	/* for the '(' */
> > -		/* We need to parse the nested one */
> > -		ret = parse_probe_arg(tmp + 1, find_fetch_type(NULL, ctx->flags),
> > -				pcode, end, ctx);
> > -		if (ret < 0)
> > -			return ret;
> > -		ctx->nested_level--;
> > -		clear_struct_btf(ctx);
> > +	/* We need to parse the nested one */
> > +	ret = parse_probe_arg(tmp, find_fetch_type(NULL, ctx->flags),
> > +			      pcode, end, ctx);
> 
> Does routing the nested argument through parse_probe_arg() instead of 
> parse_btf_arg() break the documented eprobe syntax (STRUCT)FIELD->MEMBER?
> Since this patch removes the TPARG_FL_TEVENT handling block from
> parse_btf_arg(), and handle_typecast() now recursively invokes 
> parse_probe_arg() on the extracted FIELD name, a bare eprobe FIELD name 
> that does not start with a '$' prefix will hit the default case in 
> parse_probe_arg().
> This causes it to be unconditionally rejected with -EINVAL (NOSUP_BTFARG) 
> because eprobe flags (TPARG_FL_TEVENT) do not satisfy 
> tparg_is_function_entry() or tparg_is_function_return(). This acts as an 
> ABI breakage for existing user-space scripts relying on this eprobe syntax.

Wait... Did the type-casting support patch accidentally allow access to
event fields without the "$"?

Hmm, if so, it should be documented, and need to support correctly
with/without typecast.

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

