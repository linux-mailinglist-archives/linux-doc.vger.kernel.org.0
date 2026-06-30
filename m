Return-Path: <linux-doc+bounces-94233-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NaluH9MZRGonogoAu9opvQ
	(envelope-from <linux-doc+bounces-94233-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:32:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C27056E799C
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:32:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=HXZPoUR+;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94233-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94233-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F5E7302631D
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 19:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BAC357739;
	Tue, 30 Jun 2026 19:32:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C843438B8
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 19:32:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847952; cv=none; b=JVzc7BjqSlJTRV4dVjoqdiMEP97G/6q+CFIFA+OiNr78Ky5FQLktB+h8UskabKDTAtWHNijlc34t4JkYMuF0yb1n93tdyfVPC925mOOrHH3EWwFEMdiqRI7Xh561NxxaL1zKYSLE3ZqON5UB0vX4tQ2nAvEP2BpmrPcUP9IVJAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847952; c=relaxed/simple;
	bh=Ognpr9TbzlrUtIfo4aJ5W/QMZXL4fNS+2iXI/pXs8Ls=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jbnK//iEl61gPruvS6dzYvOIKwNo4aKIb72DR5gFCZ+61U/5ZdEigtzLW/jSuoDr+rf2FnENzLURAY6Bd6ODMNpS39OcJ4H9aaol8EYw6HWD7AQdlEYmbge1b0MSn2IHQRV4Z5eYfTJm2SYmBwItNVvp0IfhrzF46oQu0/h006s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=HXZPoUR+; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E63A940E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782847951; bh=Ognpr9TbzlrUtIfo4aJ5W/QMZXL4fNS+2iXI/pXs8Ls=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HXZPoUR+zWNhogMX4Z5i4x0j1IEkldT3EZibELjW/u45hEIDty5DfQDGttCGCxYgb
	 kXfvWZodlaJz6yWc/I0LTsADn+1JInckM7hXiK2KZdXcc4WbzlM/tr1+HSHWxYf8Vf
	 Ke6MFXteCiwCyKy4C+y2EV0Zv/JnxlIcSMpWOjTDOzUr0OF/X2ZDyLHKDs6Q+2al/+
	 JtPGDUxtUPx/vLNg31kNkLOGOXYsTlaWQ5aLjeEri9r9TOImyOyNpixYk+hssWJusQ
	 12dANR2dBW9VOU7PlOcdU57xZhmkRxiMFdCqoWQHDJCdIzjzGVMgcoRiZ+QsoO3O6p
	 RFY9iXf8A0jSA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E63A940E27;
	Tue, 30 Jun 2026 19:32:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [RFC] Doc: ABI: add files to MAINTAINERS
In-Reply-To: <3150bd373177ae566256d388ba86d810193f7f14.camel@mailbox.org>
References: <3150bd373177ae566256d388ba86d810193f7f14.camel@mailbox.org>
Date: Tue, 30 Jun 2026 13:32:30 -0600
Message-ID: <878q7vsu29.fsf@trenco.lwn.net>
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
	TAGGED_FROM(0.00)[bounces-94233-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:jic23@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,lwn.net:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,trenco.lwn.net:mid,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C27056E799C

Manuel Ebner <manuelebner@mailbox.org> writes:

> Due to my last couple patches to /ABI I bumped in the issue of orphaned files.
> This is my effort to improve this. My plan is to send the mail below per
> subsystem. Can I add the text as is below or should I add a git-patch?
>
> I will add more files but I wanted to clarify this before continuing.

I would just send the maintainer a patch fixing the situation.

jon

