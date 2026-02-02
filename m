Return-Path: <linux-doc+bounces-74899-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PGgOaTYgGnMBwMAu9opvQ
	(envelope-from <linux-doc+bounces-74899-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 18:02:28 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 854B1CF4FD
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 18:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61614304244A
	for <lists+linux-doc@lfdr.de>; Mon,  2 Feb 2026 16:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B535737A4BD;
	Mon,  2 Feb 2026 16:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SI92YW73"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA5642AB7;
	Mon,  2 Feb 2026 16:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051388; cv=none; b=cbVCLL3Hcp7WrmmxMyPcvVJvVjqFQRfNpR+R6biNXxX7El4vW+csh/N+CMTX0A2q5qY1EWVnx2C9wQsIp+1hENJlSYauraQrVsD6hSIE1jwb9VuIHFdPHdV3M8CCiTBz+mbKQeKgO/R1TbCCSh3dfpPf8U+FY+RWBmc+015VnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051388; c=relaxed/simple;
	bh=ONsmEDTlXR1r1GSlJbPNOFPjRmsPOavz5rrv4NA3CLY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D2mABcyBE2ttu1UkkoJcpGqRkR9d9Po671nMb1rq0mmvfnEBXIhaJs9A01pnhUhcnYaW4GcY6mqj9t6WNTOU3q68NzDVBiJ3vJoPnYjcXECJR1txrszf28rli5Z8cVMNPESfq0C1yAPJ/3ZEWM+nz8tJNnE0PUwLhL0Tz5Xls6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SI92YW73; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A2FC640422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770051386; bh=f77D+mT1UHdG8Nh0UfOPIhLht4Aanv96afuLFT9AZkw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SI92YW73nQoi2vk7wvdhlOQ/iOw+cTnnE3EAq7nVHn8q9Rf5sDzX4FND3zAvNK+Dj
	 KDbGrtkygzn1enIljHyU7L74Mj++7k+RPJTtU9vEqfvNkdhp8/ToZq90qkDFdUjKmC
	 fLmTofoON/ErCy9FIealPBadQwF3h45MT5kOvPPBoHxjHYGWgWkXK0QUr3EiiHa0nt
	 BazYVm/4+iNXIlkAKlUkuWf+8YnbnPZ4E1zswFnZ3zzL0BHXF6we3kpZ+WnvA/NMDB
	 eWzApUPm40yIAJTsDgQCAJizEbRBjh+Zab2dmbiSV2J5IpVjhBxxoenZOkyQmRBJk6
	 e1XuoL2OF1d3w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A2FC640422;
	Mon,  2 Feb 2026 16:56:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: akiyks@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akiyoshi Kurita <weibu@redadmin.org>
Subject: Re: [PATCH v3] docs: ja_JP: process: translate 'Obtain a current
 source tree'
In-Reply-To: <20260127130155.16935-1-weibu@redadmin.org>
References: <20260127130155.16935-1-weibu@redadmin.org>
Date: Mon, 02 Feb 2026 09:56:25 -0700
Message-ID: <87fr7jrsna.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,redadmin.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74899-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[redadmin.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 854B1CF4FD
X-Rspamd-Action: no action

Akiyoshi Kurita <weibu@redadmin.org> writes:

> Translate the "Obtain a current source tree" section in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
>
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  .../ja_JP/process/submitting-patches.rst       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Applied, thanks.

And Akira, thanks for reviewing these - I do appreciate it.

jon

