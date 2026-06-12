Return-Path: <linux-doc+bounces-92111-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5PwLLhz/K2rvJAQAu9opvQ
	(envelope-from <linux-doc+bounces-92111-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 14:44:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D14B6796F7
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 14:44:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=PX6Q2X7F;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92111-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92111-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 925B730EEDD6
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 12:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0382E3DD85E;
	Fri, 12 Jun 2026 12:41:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C3D3D6CD8;
	Fri, 12 Jun 2026 12:41:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268075; cv=none; b=OclEBV56SdyDdA/3Ipm6ITmsBsXjEBiYq1mr4qoGEfB+ktn9KId2gcWOhOUg8zsyVMIpyUUCBbx9YgPk9UGWk1xAAPrnr3PnX7MuJjQucWAJu4nolhyw/W8xLWwVWH9XOhBCas9kQmYoZgCoLDQjaLk+IBzC7x0Lloqf4NkEPdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268075; c=relaxed/simple;
	bh=6MlhDlUha3VJTuIZyXJwcWGd/xAPiFoKeqFo2YN2I9g=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ee6NIlHAiPQFHDVU0v5eU2w0ydVZ9T1jAeBRkeVIMIzU8QOTAguK62bvOSe6kBJjNfg+CxNAZOR9PkQzfx6gfZmEPXbD+/1ChpUJXgRD5qgw5PKvlCaq0zf275xyDSdInHU4gIoYT8l+lmkmxlOOJNFgw25theUQ75q2djBGjFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PX6Q2X7F; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F0B6B41591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781268068; bh=6MlhDlUha3VJTuIZyXJwcWGd/xAPiFoKeqFo2YN2I9g=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=PX6Q2X7F+km+v0jdqXYUoBzXvuUPwJrmaNIGT9fpaIkuky0xRuXY65jX8wjM8Cm7q
	 jWQmQ+MuggXIPWY0rJnmOAGMLdjdksX69KTCf6d5NPrca+bzMjt7sEVNLMX+jPJqrl
	 yrKXWvKAjV5+UKxfyhxUyWkQ18p6Exph6i5/ffMDD5DdAIwg+5IL+8dEtct1Q+GCaa
	 awPoqYWToHb+46xCkDiLIrkANPeRppes65CHX1uORddnKXZ/p5OrSKZIynKsEX4fBK
	 GnF/UgHS3WFZ+q4Yhs9qEzwRjCJGjXbvamPM/pSxyp235NMLwnEGhBhccES9MOBlY+
	 lIMKgfQZiq64A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F0B6B41591;
	Fri, 12 Jun 2026 12:41:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, "open list:DOCUMENTATION PROCESS"
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [Question] 5.posting.rst use To: or Cc:
In-Reply-To: <f55eb34b92a01159e0224611296fc51fcfb5ec5d.camel@mailbox.org>
References: <f55eb34b92a01159e0224611296fc51fcfb5ec5d.camel@mailbox.org>
Date: Fri, 12 Jun 2026 06:41:07 -0600
Message-ID: <87ik7o9bj0.fsf@trenco.lwn.net>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-92111-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:skhan@linuxfoundation.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D14B6796F7

Manuel Ebner <manuelebner@mailbox.org> writes:

> so every time I send a mail to lists or maintainers I have to choose: To:
> or Cc:. I did look for an answer in the Documentation but couldn't find
> one.
> I think if there is an answer then it could be added to 5.posting.rst .

Normally you would To: the maintainers, CC: the rest, but the end result
is the same either way - it really doesn't matter.

jon

