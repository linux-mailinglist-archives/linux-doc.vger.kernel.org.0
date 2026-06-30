Return-Path: <linux-doc+bounces-94242-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pXRoIpshRGp+pAoAu9opvQ
	(envelope-from <linux-doc+bounces-94242-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 22:05:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD276E7B8D
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 22:05:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=PU4U9dbf;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94242-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94242-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 012473061977
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 20:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89678364EB0;
	Tue, 30 Jun 2026 20:05:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7082532FA29;
	Tue, 30 Jun 2026 20:05:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849902; cv=none; b=s+lpz2VlGfg6liRtBCbIaKAIs6qTg/nxAfYNaYGCRgBLnaJcWRE6BR28J6K8CAZcgYB6hrxL//g6PCfLarGBU8qZBJI2cHhVYHGDVSQDp1asczDiopO1o+ydhF3vn/1gOgQ00HrpkF5x46jWKet6irPByEtSyj18q+68EowWLcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849902; c=relaxed/simple;
	bh=/t+ubOZUuusFckrpiVlyHMKu7qY8Yp4Rg6AJS/6E6CQ=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=um25soDWIonBoV0HYKDHcICgtHcDUSD5KQtwOM961XWjmRVmiBVCsFz0b0tZxIW13ASN2xBXcoxTdDEZBonV3yz/AXrMK9Bujd2jxrudfLYzt0a6q52AfaftrI1cxWrOToCkSnaGner74umnWqnJ7lDsbcMdd5/VJfwlVZ2YSyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PU4U9dbf; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7AEC440E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782849900; bh=YoQ3XVOFiMR/6BPoDiUIuxJ3jzCsoWLoA17li2QxRdA=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=PU4U9dbfwK8iGhVjv8+a8gfDq+G28Q6dyGbDuwv9w7Jt8Dkqd7htE32MYPjxNprxP
	 jicvdEbj68Wge6DkHIb/jXFhEIyNg8G534+sX/1/RSlWtCcIoQZm6tMQLETjVrULWL
	 OmWyMuEzi7AMb2vrEXcZmT2l6y//vfs3mgrq/458IqgQNNIIRoSNrtI/7t2/wz+tkZ
	 BdIehXMWUVBV9e/BZjKYAMylZG66Gn5M54QOuOT7+olMwMh4mC631C+FCt36+cfccW
	 PYR+Ad/hP6dTtCuaek0pOztCWU0yDsThoEUJTGdrVUfOWIDPSse6OQWnafvRkgg8ZU
	 u1apUDQSDbnZQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7AEC440E27;
	Tue, 30 Jun 2026 20:05:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Manuel Ebner <manuelebner@mailbox.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: locking.rst: update deprecated function
In-Reply-To: <20260531175452.272136-2-manuelebner@mailbox.org>
References: <20260531175452.272136-2-manuelebner@mailbox.org>
Date: Tue, 30 Jun 2026 14:04:59 -0600
Message-ID: <8733y3rdzo.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94242-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:email,trenco.lwn.net:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lwn.net:dkim,lwn.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBD276E7B8D

Manuel Ebner <manuelebner@mailbox.org> writes:

> replace strcpy() with strscpy() as suggested in deprecated.rst
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/kernel-hacking/locking.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I've applied this, but that stuff is so old I wonder how much value it
still has...

jon

