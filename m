Return-Path: <linux-doc+bounces-96327-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 279vH2JJUWqeBwMAu9opvQ
	(envelope-from <linux-doc+bounces-96327-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:34:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D791D73DD4E
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:34:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=SPZgKOMF;
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96327-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96327-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 848FF303E9F4
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 19:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73593624D7;
	Fri, 10 Jul 2026 19:32:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3C2C11CA;
	Fri, 10 Jul 2026 19:32:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711946; cv=none; b=o0wfpiOec7dAD/nTEliHbhag8VmwFW0sfICtds5nRDjMp4THKi1fh/W/7seogSrmiuYHTcvlhZtWrGXDnjTsMHNNsmV2v+5jnHyKD+QG46i6aRa567z7zdgAbc9OwXNd+lAlA4VjelENh7JSPh4MZZvJCOJm6s/jrd1mzLuhbQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711946; c=relaxed/simple;
	bh=cy6eHoj6wMzqyhTHb9Z8wels1ROtg0e+qCaZxh/JSMc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=shiRy0HBi7TVl3LokkWu9VbYbD3maJiZ08Et/gXVHzn5+YhiU+tiLbMd7HRCluAx9liWkgihsJMRt/jl3+rsQ3SiehC/sm6NekIiL5sp/BiAG3T7vVIExclK3gvOQ9cWhfoCA3c4iMl5v9/cMPcLRyGWVyOQeCeqxtWWbD/0JIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SPZgKOMF; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EB2F0415A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783711945; bh=YFSaPKtkyrXVy6WhmJ7Z0X46tRlghCuSNTJf/sPiK+w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SPZgKOMFp/Mum2V4FeUkp7kI+ps3wWepnhZgZSf5fEOHsmSyJfXOwVn1JLrScew6y
	 kOizIjWD5aAdZ4YTf3Nbl+w6i+U/Jl5tMfIhj+eORJEZIo/pM0LIDIdSdRH3y4d2wf
	 mdDd24M98Zz4pLLwfHKk2xEsnzjiahK8QizC/qqbGP5/NGLmh11rH534wYVS4ysdMF
	 f8A466JvGqNcnrzpZRfMdbDMEKDX9XS8UitV8UFSx+Q4HxnvQiGMWC8nwWljBYiBjC
	 V462RTJN+nic2GlFIWYPE+i/4Z5dX/kFR6pJ0qxL761vpLLzc2qdER77Fyd6yO4W2a
	 wQiJAogP2hOiQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EB2F0415A7;
	Fri, 10 Jul 2026 19:32:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Kernel Janitors
 <kernel-janitors@vger.kernel.org>, Manuel Ebner <manuelebner@mailbox.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/kernel-parameters: fix brackets
In-Reply-To: <20260703080806.223782-2-manuelebner@mailbox.org>
References: <20260703080806.223782-2-manuelebner@mailbox.org>
Date: Fri, 10 Jul 2026 13:32:24 -0600
Message-ID: <87v7amk5dj.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96327-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:skhan@linuxfoundation.org,m:rdunlap@infradead.org,m:kernel-janitors@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D791D73DD4E

Manuel Ebner <manuelebner@mailbox.org> writes:

> Add a few missing ']'s and a ')'.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon

