Return-Path: <linux-doc+bounces-94035-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qfCWGY+eQmoX+wkAu9opvQ
	(envelope-from <linux-doc+bounces-94035-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 18:34:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EECE76DD611
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 18:34:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=YLyOtJW+;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94035-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94035-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 656333016652
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 16:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC383F8899;
	Mon, 29 Jun 2026 16:34:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609F33F6C2E
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 16:34:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750857; cv=none; b=GzyReV8Fib/5JoBqRz/KpeN+1BsD1XdWyMl8kMJHG9sZ0sd/jYif0tCf39qPXulkhJyAMD6q7dA1aivP+kWldawq6XM5jR+mD2lslRLInA4TRAZ9MvZaoXvfBz/7HJp+TzZpjmx5cJCMdGFrkdueEYr7nDc/MhLLeNCgR1eG1y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750857; c=relaxed/simple;
	bh=SRMjKeSN1QJpLhFvhh32Y2xrzCjBBS1ee1IylEkB+q4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s12c+uF7DjwDpzh3W88xvfkcQFaskJe8+fthsd1RuHfUjpYzTf4jNpmTi6kNCXX2JsdAqlyZsZIljRfIWprs6hBWanurRAlS4njbelCiF72oNMlb/Ur3yUsL/H1UjoS2WgCY+5MjjjBudcAW4BWk9Gb/OL0RjdWyHDAUBFlUges=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=YLyOtJW+; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CE39840E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782750854; bh=SRMjKeSN1QJpLhFvhh32Y2xrzCjBBS1ee1IylEkB+q4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YLyOtJW+ICWS4uu5xEu9HvmplD5lVFlXft6GCVDO6N0JWbRsD1asa/KDnBr4BfZxm
	 c7Ziut0fv3MytRohldIDuz5syb06pVjc10vztnQvqQCMseXTdbA+3mXAMYAovWpG9k
	 vSszobwhr9/AFTw/PTy3mrSYDhum3XlLljWsWPuF1zDWYMvXOjckLsrZf4uaInsnIA
	 OsOM6NGjYiS2l349lEVJITtO/c+F7O06LUi1g0zbFWBsanVhb7WKsN7V07nCgMWMrp
	 zB115Ag1nDIycWBhylgDXs6IbgoqKCJGUA8qcWjpwW5BCKeEO4Iru2doKAGcENDGnH
	 qTbewEG4hCD+Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CE39840E27;
	Mon, 29 Jun 2026 16:34:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/2] docs: pt_BR: Translate coding and posting guidelines
In-Reply-To: <CAMAsx6fOBdRKzf8S7Wf3k5+y7K3jrP4-kszC35iuXX5L_FaUiQ@mail.gmail.com>
References: <20260614235044.42810-1-danielmaraboo@gmail.com>
 <CAMAsx6fOBdRKzf8S7Wf3k5+y7K3jrP4-kszC35iuXX5L_FaUiQ@mail.gmail.com>
Date: Mon, 29 Jun 2026 10:34:12 -0600
Message-ID: <87echpwbjv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:danielmaraboo@gmail.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94035-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lwn.net:dkim,lwn.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EECE76DD611

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Em dom., 14 de jun. de 2026 =C3=A0s 20:51, Daniel Pereira
> <danielmaraboo@gmail.com> escreveu:
>>
>> This patch series translates chapters 4 and 5 of the kernel development
>> process documentation ("4.Coding.rst" and "5.Posting.rst") into
>> Brazilian Portuguese (pt_BR).
>>
>
> Hi Jonathan,
>
> I hope you=E2=80=99re having a good week. I am just following up on the p=
t_BR
> translation patch series I sent a couple of weeks ago. Please let me
> know if you have any feedback or if there is anything I should adjust.

Merge window just ended a few hours ago; be patient, I'll get there.

jon

