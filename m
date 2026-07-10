Return-Path: <linux-doc+bounces-96318-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9SnzA0dGUWrkBgMAu9opvQ
	(envelope-from <linux-doc+bounces-96318-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:21:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F225573DB47
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:21:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=KHYw0w66;
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96318-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-96318-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F1C430093B6
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 19:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741B0343881;
	Fri, 10 Jul 2026 19:21:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4756A2367DF
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 19:21:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711296; cv=none; b=TlNJcMLtCp7T5JebQ+RGOh5ggve5NIxNRAG/og9NYRblhKgbWOBjDsJcvwz3cMkq4Y+6Io4TDm+Le0DlCpxv5yOdDh2g4+oRWftIGd9x0H/BjnsLQDwtYyMIznbhMKiPZCwIKSv7EvHiF37UXgavAZqWy3Te9D7Hw834eVqFRpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711296; c=relaxed/simple;
	bh=7E5WD+zVTl37AL4SlMGtY6HC6iHeLpVknqlRrVOPp/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YMjJf80nP36dcbpVds0nctV9ELibDMw/QSA76H3XkBC8I6cUKVevrErfa5Ar5fqthvN41Hd5PMOB4MjGzLLWRYtCpl8ssY44ebdNCmO8hcjDNU/dT466gykPi5ALehsi6GqMBbZlRd/LTaP2U0x1Sug13Qrj2l36geSbV+caR5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KHYw0w66; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7AF5F4108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783711294; bh=FUKWhrGAsZnLJyaQ4CDccxzHqtNVsmT3KGRtBadwwXQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KHYw0w66WXNoMsptTrXoEGWfXU7BzJMu7zuKYuc9OE0uSys5/7vT5yjZFWui1TncC
	 heQon3xav+eXGjfEOaM3OY3VDcThm48l1l/kSow73vYpWcqe5DZAs+cEaxnb7NY9YR
	 ixrTgADcYKcIho8KxpBaWpRQj+xjz8N6Q0KrpcTT/g+TlVS8WIonJ+lI9iE3fAbPzW
	 FWhzNvDFGTEywHymRUlBrp/udzYgo+YF3O9RtYgdWg1Zlmx/SoPYuSz/SCIpAUkzgb
	 0zbao3uKdci55iH5kxarLnsvk4Du2aROYJV10anyqnMy0uzVRTa7UBh4UaLbr9Euwf
	 CXdUNhQTFaYRQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7AF5F4108A;
	Fri, 10 Jul 2026 19:21:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, Amanda =?utf-8?Q?Corr=C3=AAa?=
 <amandacorreasilvax@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: pt_BR: translate the management-style.rst to
 Brazilian Portuguese
In-Reply-To: <CAMAsx6ewmXd205h37LDTzj9FgFasgodNzS51KzSEH8M_guNJGQ@mail.gmail.com>
References: <20260703181326.47524-1-amandacorreasilvax@gmail.com>
 <CAMAsx6ewmXd205h37LDTzj9FgFasgodNzS51KzSEH8M_guNJGQ@mail.gmail.com>
Date: Fri, 10 Jul 2026 13:21:33 -0600
Message-ID: <878q7ilkg2.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96318-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:danielmaraboo@gmail.com,m:amandacorreasilvax@gmail.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F225573DB47

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Em sex., 3 de jul. de 2026 =C3=A0s 15:13, Amanda Corr=C3=AAa
> <amandacorreasilvax@gmail.com> escreveu:
>>
>> Key changes include:
>> - Translated management-style.rst into and adapted idiomatic expressions
>>   and humor to sound natural in Brazilian Portuguese while maintaining
>>   the original tone.
>>
>> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>
>
> Amanda, for organization purposes, please resubmit the patch using the
> email address that will be used.

I don't understand what you are asking for here?  There is one email
address used consistently in this patch, is there something wrong with
it?

Thanks,

jon

