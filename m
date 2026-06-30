Return-Path: <linux-doc+bounces-94235-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4z2SEuUaRGpJogoAu9opvQ
	(envelope-from <linux-doc+bounces-94235-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:37:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AAF6E79D7
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:37:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=PBAK3++P;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94235-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94235-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02F66302B0BC
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 19:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760463CDBDD;
	Tue, 30 Jun 2026 19:37:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618203793DE
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 19:37:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782848226; cv=none; b=F8kBNsN1z5MbaGhV/xcb+SgK7Kjvu16qszs4OrTVK57rM/jaQWbeBoqP+eEaQfcEyaA5GH0q7/0QzkWU3MGjtj1iRnvYkqx2gxeOHwAD2Uf96AMfeOQ2fxAkqVkrpjKNS1rU894POiGfpMgY60qeQjKXjJ6GQcbheyMLqnh4TZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782848226; c=relaxed/simple;
	bh=Fe7IiDSdVzdQ+S86wA2h242xE2qW702JlNHBnT0ABfE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Oze23OVsm04ObXs/+DwcRJL3nk5zL0qpOjeGhPQW6eD6wTkAwhBZDLQHqe2EyEekRv015c6AjwAncerXGoDc3PnL3lOrN7f4wuaQvAd8hiv/F9+kNzY3LR7lHj9eDaNy7p7u/rc3n3porILWxotY+TN9cNBpgHWCRC/GwrE1NTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PBAK3++P; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A7CDF41596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782848224; bh=pEs+4XQ1Ba+IYSxgxY+euRNOFB0wGqJfBtAS9aNcbk8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PBAK3++Ps5wMCwgjHgtEVMpc4VjNo+qfzjum6+TO0cOmiBtfST8Io4Fd1GSERkP6b
	 AZgTOlMg9Dv6+oDTXmWIzKN5uQUKWsj5IS6C/Da24qB5uT5DgEG9OI1itO7i31kbKM
	 Qsh5lQe8UFbOLv8I3g9ezJnoT51/0luluXv7Gfu0xcgwhIb9u6Ju+6qhxiKxTwhIoo
	 PXXWbY1vXaLAHJAGC6WDdc+pMYv3CC1UWR/+OxvURlHjOPCvNQw5kJdXJBBV2tJQD5
	 5DbZI8DW9WEdZqvgWMjc8sbXzhUeXl4Hwn+iMlPlrUR39lG3F+JqLUW+ph6QyB8x2x
	 6OC/D2qslkhYw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A7CDF41596;
	Tue, 30 Jun 2026 19:37:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] Docs: conf.py: fix typos in comments
In-Reply-To: <20260626005248.1121464-1-rdunlap@infradead.org>
References: <20260626005248.1121464-1-rdunlap@infradead.org>
Date: Tue, 30 Jun 2026 13:37:03 -0600
Message-ID: <87wlvfrfa8.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94235-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:linux-doc@vger.kernel.org,m:skhan@linuxfoundation.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,lwn.net:dkim,lwn.net:email,lwn.net:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,trenco.lwn.net:mid,linuxfoundation.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38AAF6E79D7

Randy Dunlap <rdunlap@infradead.org> writes:

> Change "variabled" to "variables".
> Change "relative patch" to "relative path".
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>  Documentation/conf.py |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon

