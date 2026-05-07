Return-Path: <linux-doc+bounces-86215-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN0ZCf+t/GkNSgAAu9opvQ
	(envelope-from <linux-doc+bounces-86215-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 17:21:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F634EAED4
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 17:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 630183004DE8
	for <lists+linux-doc@lfdr.de>; Thu,  7 May 2026 15:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22842426690;
	Thu,  7 May 2026 15:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LYKwtqFg"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E839D6D4;
	Thu,  7 May 2026 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778167292; cv=none; b=iSWbQnX1hGj/u4L+GWXDhaYJBvDN3+V8HhahT+nj+GISYAS8bvfpb7H8CyyM7m68GO9KxRqUEbFM14qV4COUrBzJ8VL8Cqyutk2OJCisb22W73gs6p1Goae43h2k7V7H3iVAHkABgzdEsiBv1hg52Q45vW/o1bc0Q7naDITuLtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778167292; c=relaxed/simple;
	bh=tgQiX65MaDTd0e0pppV5eTZfP9m73Ez7zUWY/PyEnyQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=W6E/WIlBDj1IDnY8GFjWVJA5ky/UE42lD/opFCZasEDQLyeiPmkA3VwyZ74ZHQNY3DyTU9A3TtNKKGicNVClZ9AU9TAqXj4DbWSyKhmGhPjZlSus6CyDIy/nTYp3tmuF4LCnF89Z2AjTiD1vtl5nMg9lR8TX5hiAhBj+mtWfons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LYKwtqFg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 586124108F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778167284; bh=DEzm1tZe4DktoqZvyeXcW1Sgc7YEkjL6yYSQZXCykhg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LYKwtqFgf566PtxHtp2WVCo/srD52ANWYiOoQAh2eAnn+lLwAljR5LenO6ZNeUHPZ
	 U/OOspwmkY0mXc+9DPQ2Kikfn1fX9yyqidl5Q9y8CoCn7pi5UNvhLBaqhA4DYAI7oB
	 S7yCCO9CXGBnvGRVQ+bRl1+Vfl9Ic19ZS4/2UvvSvnAtpcNlTe1JJQHJxR0CHrtLFj
	 po/EQ8WnKz3Z2VuZayB4yFoRmisExpyrQJcExSuDgT6Fwas27YSSQDps6Ju3kYjV0m
	 YPoGwR1Crqz8fJsqQw46PmpwjA6lO45J5O+/NP0bcNFmAp5zePqAFSHY2v9UGzIyAU
	 qGR4ZOpMNc7aQ==
Received: from localhost (unknown [205.220.129.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 586124108F;
	Thu,  7 May 2026 15:21:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sasha Levin <sashal@kernel.org>, akpm@linux-foundation.org
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 gregkh@linuxfoundation.org, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
In-Reply-To: <20260507070547.2268452-1-sashal@kernel.org>
References: <20260507070547.2268452-1-sashal@kernel.org>
Date: Thu, 07 May 2026 09:21:15 -0600
Message-ID: <87v7cz8cus.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 68F634EAED4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86215-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Sasha Levin <sashal@kernel.org> writes:

> When a (security) issue goes public, fleets stay exposed until a patched kernel
> is built, distributed, and rebooted into.
>
> For many such issues the simplest mitigation is to stop calling the buggy
> function. Killswitch provides that. An admin writes:
>
>     echo "engage af_alg_sendmsg -1" \
>         > /sys/kernel/security/killswitch/control
>
> After this, af_alg_sendmsg() returns -EPERM on every call without
> running its body. The mitigation takes effect immediately, and is dropped on
> the next reboot.

A quick look suggests that you're not checking lockdown status.  I don't
doubt for a second that this thing could be used to bypass lockdown - by
shorting out security_locked_down() if nothing else.  I'm guessing that
might not prove entirely popular.

jon

