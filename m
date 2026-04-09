Return-Path: <linux-doc+bounces-82942-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLt9LlLQ12mrTAgAu9opvQ
	(envelope-from <linux-doc+bounces-82942-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 18:14:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAD73CD7E0
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 18:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E7D630DF230
	for <lists+linux-doc@lfdr.de>; Thu,  9 Apr 2026 15:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2240E3242A4;
	Thu,  9 Apr 2026 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mc1EB6Dt"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B822BEC43;
	Thu,  9 Apr 2026 15:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750361; cv=none; b=uWSx7rG54ftNAcKqsdw4zzE9sYvdRIr+gEBfOTaQWVA3tATQNfaA5toay9IJi8o8UWCIuUvoaJ+DpDsjbNlcE28wuHlLrWJcJop7eucVNVIK0Du9qIrIBTYKV/ii/9RMRIVhmdmRH44ncSVQ4RWdlRNr3mCFA4rK6wMjQW/6z+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750361; c=relaxed/simple;
	bh=U9CKN3OU7mysW9YtNEoWjz0fVYEYdpdZw3L+IKx437A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qwqnPC3HYpurNlp18uLEkKv09/FPJLUHCmcyAzdVViqnF1ATryDmnoLHv09FDNHEn9ismxciM5wdrKloxon2DWab199yBwdBtNbkSj4kt/Rb2m88CLsMWPPXaFGPvp2XEjdpmeNTfH7SV+xTXEQetpo50gKDWAdAvaN/5rGg1xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mc1EB6Dt; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C365140B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775750358; bh=oqUXX3RHjScrdzQ2jd+6JPTj/DA3k6L/Y3rrpbUINI0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mc1EB6DtAbrOH0+GWdNAOYljJfIF0YPUAfCz9HJ6WqTLtQFclqe9I4W1JssD23rwv
	 AnQ/JMjX/L6keH1Me9hSTlsP99em8P/xhSG9T/SamoLteLcTbvc1fDnwq11uWG0GoK
	 ic95hUYwF/0645Mmif4lug4JxgbhDo/lixqE0YsoYlwLkOzK9ff0hIEfKPV2f+8FFg
	 bdiEm4F8nPBNQC9tpTZpfobEhtJb9GQaG2TxQbFp2Qp/5xElUpW1QYy68/39VeeFNd
	 yzv2tRDwh2kHtIOEhBaE2l+XBqEnJ+NFU4UPzl9OSPedUEril5Xl1W6M71OpE09FDd
	 QQ4rNHRXfVRDw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C365140B2D;
	Thu,  9 Apr 2026 15:59:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux
 Trace Kernel <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Tom Zanussi <zanussi@kernel.org>
Subject: Re: [PATCH] tracing: Documentation: Update histogram-design.rst for
 fn() handling
In-Reply-To: <20260409115200.45883a07@gandalf.local.home>
References: <20260126181742.03e8f0d5@gandalf.local.home>
 <20260305110347.31d6bae5@gandalf.local.home>
 <87bjfsb37x.fsf@trenco.lwn.net>
 <20260409115200.45883a07@gandalf.local.home>
Date: Thu, 09 Apr 2026 09:59:17 -0600
Message-ID: <87tstk9lbe.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82942-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,goodmis.org:email,lwn.net:dkim,lwn.net:email]
X-Rspamd-Queue-Id: 0DAD73CD7E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Steven Rostedt <rostedt@goodmis.org> writes:

> On Thu, 09 Apr 2026 08:47:14 -0600
> Jonathan Corbet <corbet@lwn.net> wrote:
>
>> Steven Rostedt <rostedt@goodmis.org> writes:
>> 
>> > Hi Jon,
>> >
>> > Can you take this through your tree?  
>> 
>> Somehow it fell through a crack in my inbox, but I have, finally, done
>> that.  Sorry for the delay.
>
> Thanks, it has happened to me too often but not as much when I started
> using patchwork. Is there a patchwork monitoring linux-doc? If not, I
> highly recommend it. I stopped missing almost all patches when I started
> managing patches with patchwork. The few times I missed patches was when I
> accidentally incorrectly changed the status of a patch. But that's usually
> due to my own negligence and not simply because it was lost in my INBOX.

No patchwork ... but there is a *massive* pile of stuff that lands on
linux-doc that I'm not meant to touch.  I think that "b4 review" might
be my way forward here.

Thanks,

jon

