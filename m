Return-Path: <linux-doc+bounces-94239-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k+L4MocfRGpGowoAu9opvQ
	(envelope-from <linux-doc+bounces-94239-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:56:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 198F96E7AD1
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:56:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=ESWEvfAh;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94239-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94239-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C853F306365B
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 19:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B913DDDC4;
	Tue, 30 Jun 2026 19:56:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61161305E3B
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 19:56:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849412; cv=none; b=ilc6PwYP3q891axN8NcJEd9P1O7j0L6ofhlj1nT5u+2o/VNMOW9KaWH+44OtStL0+IYIx74u+eEfIbLlUp5ripku8F8ybGrYacAfWQt7cN8zUswCfp+NNsujwMdX93MT+rYHnqMClq/UXnMKt4G9NXPjtmNuA+GTX7Cd1XavXIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849412; c=relaxed/simple;
	bh=lebLNvhW1pxWKSPZOZrqgxFcwkIea7hwqvhJU9608+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sJ1SPlI7CmORUOMZDGLwMPcmAv1DrzE9TudP7+G5DIu0GfHeW6sUKH19tPnaNi82xaxJz8W8PDmxegWZxEQCZQFdCPN66q0Q+H6TZV2uOFQ6TM6C6+t81L4Dp4e9vRS1Y40t8bCWGdrE36ngHj9n9NFKqWTTxvDnz5a4c0aO6Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ESWEvfAh; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9A1D140E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782849410; bh=Y3r48aUv/QfLYpZPeEDqp5oypp167mGZmthXOtamkSg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ESWEvfAhLbCIbgd8r/ilwxhGNCP0XzLGTTBwGnjbX+nLrvm9UeSXY9i5P91qTAZpk
	 +KcMVzhgFp/Pddi0KJNvvrzdiWAHL5HUbM88OKwBesuykHSK9ULAkyEN09t774rxbL
	 rlwwKs4KzV0QzPAiczQdX9n9HBy8dQhazGhm496d+t9uQPIPHliDxlrtuEH5/dj7gA
	 ZyWPxM03dJgaMcrNug4WQ/3vAbfPXX+WBOrpSvJHrk5YcxqBnWJyXDCN6d9ahoYJzx
	 ntj1GZw6vxgm214SwFEj8mC/BegKdHnP9k1XYrRyZzkWOyXnTPojB4O9qtznJHyVL6
	 7JKmusA6/vlKA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9A1D140E27;
	Tue, 30 Jun 2026 19:56:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH 0/2] docs: pt_BR: Translate coding and posting guidelines
In-Reply-To: <20260614235044.42810-1-danielmaraboo@gmail.com>
References: <20260614235044.42810-1-danielmaraboo@gmail.com>
Date: Tue, 30 Jun 2026 13:56:49 -0600
Message-ID: <87fr23reda.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94239-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:danielmaraboo@gmail.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,trenco.lwn.net:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lwn.net:dkim,lwn.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 198F96E7AD1

Daniel Pereira <danielmaraboo@gmail.com> writes:

> This patch series translates chapters 4 and 5 of the kernel development
> process documentation ("4.Coding.rst" and "5.Posting.rst") into 
> Brazilian Portuguese (pt_BR).
>
> The goal is to expand the available documentation for Portuguese-speaking
> developers, making it easier to understand core coding standards and
> patch submission guidelines.
>
> Daniel Pereira (2):
>   docs: pt_BR: Translate 4.coding.rst into Portuguese
>   docs: pt_BR: Translate patch posting documentation
>
>  .../translations/pt_BR/process/4.Coding.rst   | 440 ++++++++++++++++++
>  .../translations/pt_BR/process/5.Posting.rst  | 376 +++++++++++++++
>  .../pt_BR/process/development-process.rst     |   2 +
>  3 files changed, 818 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/4.Coding.rst
>  create mode 100644 Documentation/translations/pt_BR/process/5.Posting.rst

Applied, thanks.

jon

