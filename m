Return-Path: <linux-doc+bounces-92943-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S65qGttRNWp8swYAu9opvQ
	(envelope-from <linux-doc+bounces-92943-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 16:27:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7036A668A
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 16:27:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b="CRC/a97z";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92943-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92943-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AB523009B1B
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 14:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EBC381B0E;
	Fri, 19 Jun 2026 14:26:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB0A397AED;
	Fri, 19 Jun 2026 14:26:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781879199; cv=none; b=YNJGcKa1drBIvmYSe2H/598RCNIpFAcG4qzlX1CpptBGXoClPJAH5C94ZEwyJ/1/y02qzqAn9qYBbj2PkieUVIHITe9q1iSKyDptOEw3IwjLyOrh1gw7YsTOeNkGUUBA0diCdl4fbsG6b57sdoE83PmNIzeFPQgHw0CL0liUVbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781879199; c=relaxed/simple;
	bh=fBLhJpkMvPYceLBdrw2nFs0mjBOwpGJ++dPMSggs3Go=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=reBVqAgA4QoMUOOJZir2rG3JA8Tdq+rnYwCvQu8+tqxoNy3bzZjo7KdtvDSQzLm4BRqzL6Y0QugGtUqw5LaYQYlOSa7uOlVqpg0S5CIFmoBXDoP+miSE+yoKZfGqutsDpKgqQezzlkDeOyTQWM++xkwbHGlgzcOROfoGi2NJeeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CRC/a97z; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8D218410AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781879187; bh=RAAm6RTzdsBdwVdROy/Pzpvlzh6Mva8jXAr4ugrwWL8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CRC/a97zlhMn5fYgAqf6P4b7u9nAiXDccPT+iRwOXIlNjiMU3gnHu+44iG15pI+J0
	 XVcjELcDclUsJgM9RBdyawVJ5bpY/h1bnpgkuS0tB2TCKjdOxCcKB96wCfn36njVu3
	 qZSrl+TQb9pci7LO8Zkhy4H4xxXmRSM3lToBrM6kA9zt90Wp1R79X+CKDCHqutpYUS
	 S6B3Mx1g7QcFZr8U8YtYOv49EqBsjnPZc42LZWZahyAubfEg0dhUO4TD8sqCINYG5v
	 +vXEGSIg9jEHng/9CVoNBasyoTgt8MUJdRuE7RqVY6Z1tYl0pVptMQB5r4SqJ4M/Z/
	 8AAHlqUOJPx1Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8D218410AA;
	Fri, 19 Jun 2026 14:26:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jiandong Qiu <qiujiandong1998@gmail.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: Re: [PATCH 0/3] docs/zh_CN: update translation of doc-guide/sphinx.rst
In-Reply-To: <20260619140245.1982921-1-qiujiandong1998@gmail.com>
References: <20260619140245.1982921-1-qiujiandong1998@gmail.com>
Date: Fri, 19 Jun 2026 08:26:26 -0600
Message-ID: <87ldcatxm5.fsf@trenco.lwn.net>
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
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92943-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[hust.edu.cn,linuxfoundation.org,vger.kernel.org,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:qiujiandong1998@gmail.com,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux.dev];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,lwn.net:dkim,lwn.net:from_mime,trenco.lwn.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB7036A668A

Jiandong Qiu <qiujiandong1998@gmail.com> writes:

> Hi all,
>
> This is my first time sending patches to the Linux community. I have
> been reading the kernel documentation to learn more about Linux, and in
> the process I found a few places where I could help improve the zh_CN
> translations. Comments and suggestions are welcome.

Thank you for working to improve our documentation!

I've added a couple of comments, though I need to defer to others to
judge the translation work itself.  I do have one question, though: did
you do the translation yourself, or did you use some sort of tool?  In
the latter case, you need to document that usage with Assisted-by tags.

Thanks,

jon

