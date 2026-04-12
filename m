Return-Path: <linux-doc+bounces-83164-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGNXM4nu22kmJAkAu9opvQ
	(envelope-from <linux-doc+bounces-83164-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Apr 2026 21:12:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BEA3E5AA2
	for <lists+linux-doc@lfdr.de>; Sun, 12 Apr 2026 21:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C07EF300B983
	for <lists+linux-doc@lfdr.de>; Sun, 12 Apr 2026 19:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE5C3793CC;
	Sun, 12 Apr 2026 19:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FioJIBUW"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539222BEC5E;
	Sun, 12 Apr 2026 19:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776021127; cv=none; b=Aw7qm3GIdz0sk6yYC3Dwsbr5HhGp0/SZLv67Anx+JDjnRy1XVSJ7CBw7Tkh+lQVDCXBqS1WwfwO4HjX3dl6m5skGfqjvDdilPhm0xFIhUUswWdefVzHYGAra4j1IhrRPq5zdF3Ebp+V7XtTMufPNUxG7FziVVZO1q9AYiTL6Muw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776021127; c=relaxed/simple;
	bh=Rjy0bYx/aiKu7BrMVP+P24OWfYKEbSst93ot4M9v5u8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tF2lszCBdUlCFawPV9Yi0wsnZD9BrWmar9FEvZNSy89vjZfW7o1w6NoodbkrYyeM34gvKPFvCcN5YOis+wWCMFtXndc1tjgLLuVewFSvrQWoZWbNivTxYzXmqMUd8z9xhKJapITzFb20YftLlH6LZRZndSWr74PTqMnOM2o2Mv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FioJIBUW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B8CDA42A44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1776021124; bh=CXG8SaYjHg40te0VXu4OrzULroPQFyJmZbW36fv7HJw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FioJIBUWd/94cB9f2fxbp23onHdKhG1SIJ+JVvkm0y+hTbyuupxgSC5PkSEVq+xWq
	 MrpWp+EO2ArUM9t39S/4ZypX654m2GK0V/ReTwkFZtzJcbKwM9phOhja9B137Nio8V
	 jWrZk9aDy1MFcK4NjQDnm+nX0S9MR4QUpKf/pVuMwjnz5qkcBLlxQrpNw2573oQCoP
	 Gvc4st9JkmRpJGcfhhgz1koe/WDePb/Npzt3FrLUkL2W1HHRitAzleB3a/trxngns+
	 nui8BnApnl3/Dv2fynyIX14c7KAGVVHOLASm8EsnvfnGcrvlwZfvIqZ8nHazUBJB4p
	 lZB8LrL3DQ6mw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B8CDA42A44;
	Sun, 12 Apr 2026 19:12:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sukrut Heroorkar <hsukrut3@gmail.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Shuah Khan <skhan@linuxfoundation.org>,
 "open list:Real-time Linux (PREEMPT_RT)" <linux-rt-devel@lists.linux.dev>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Cc: Sukrut Heroorkar <hsukrut3@gmail.com>
Subject: Re: [PATCH] Documentation: core-api: real-time: correct spelling
In-Reply-To: <20260411155120.233357-1-hsukrut3@gmail.com>
References: <20260411155120.233357-1-hsukrut3@gmail.com>
Date: Sun, 12 Apr 2026 13:12:03 -0600
Message-ID: <87jyucyovw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-83164-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,linutronix.de,kernel.org,goodmis.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 39BEA3E5AA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sukrut Heroorkar <hsukrut3@gmail.com> writes:

> Fix typo "excpetion" with "exception".
>
> Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
> ---
>  Documentation/core-api/real-time/architecture-porting.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/real-time/architecture-porting.rst b/Documentation/core-api/real-time/architecture-porting.rst
> index c90a426d8062..c9a39d708866 100644
> --- a/Documentation/core-api/real-time/architecture-porting.rst
> +++ b/Documentation/core-api/real-time/architecture-porting.rst
> @@ -74,7 +74,7 @@ Exception handlers
>    Enabling interrupts is especially important on PREEMPT_RT, where certain
>    locks, such as spinlock_t, become sleepable. For example, handling an
>    invalid opcode may result in sending a SIGILL signal to the user task. A
> -  debug excpetion will send a SIGTRAP signal.
> +  debug exception will send a SIGTRAP signal.
>    In both cases, if the exception occurred in user space, it is safe to enable

Applied, thanks.

jon

