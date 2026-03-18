Return-Path: <linux-doc+bounces-80092-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANZeG5Aqu2kcfwIAu9opvQ
	(envelope-from <linux-doc+bounces-80092-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 23:43:28 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 009622C39AD
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 23:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3C06302DE13
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 22:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB85262FC0;
	Wed, 18 Mar 2026 22:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="tPsADPai"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECCF481DD
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 22:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773873804; cv=none; b=prfYmL2hQuhg+3J3d2pfpJ9KYAA0i794ANNIVkDMrE3cx9KiCWDXwLq1XHEWofxEAvnHog0o6tWroP5QuchDkjfDZRr6+RaRYfd0E3QQs2MHZhxSgmGF6eWUFr9i6dKeTDUtUh4NGrkjB1/+59v0ABuHwj5DbsQKsf9dgJQZy88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773873804; c=relaxed/simple;
	bh=2VYzXFXE8af2TLD2NxHCNEigyb40b4Wht7f7+D1RCvg=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aWoDkRoMqRlQ1rbPKbuIt5JCQLt2/lYFZGDA/afEFiYUUqcfSjGjxOcrfF/olk6ks6KpfVZuMd7lcoTppUb6LUnuIJao+sQhIawmXKIlVqRMZ4eZQMeyhUA7ABNWH9W8J2XasWVlcyjNfvgQYApTs4P986GdvIe105z/Lcw/EEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=tPsADPai; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C15A640C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773873802; bh=FFU1dECy4cNrZFaXxc8xJYuSwM98l2oO2VM5XVeTZXM=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=tPsADPai/+mfvJ2WUr49Fl+oU0/7RWun3mkxPZ0DcMkHZRlG6XE5S8F/2e1j8NfdH
	 Q2ZcpIb758weTv1IHLoJcM/WNlxE5qlCOBFRwyhgl9vhuvWFywh2EMFZzrN/jfLRBv
	 1UT4NZ2jlkBShW9HJZRsibjeirm27uNxwETTSTT7JRVRrksfQrL32uH6OPol6l426b
	 crnajcZHMvtXn2XXfpyZbDVWPmQ21j1e2L38BPgCdoL4c+DtbQbafqOXBeGrAfFEbl
	 B7k+96ZrocIY3YJyy8oBb1CmYiNvL+TFRRAUvzKDgezqfRKKRYfRx7SgNJno8c/UDx
	 gUI1fiJOvhhSQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C15A640C7C;
	Wed, 18 Mar 2026 22:43:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: docs build version warnings
In-Reply-To: <c7f45144-7068-414f-86dc-3c9971cf6eec@infradead.org>
References: <c7f45144-7068-414f-86dc-3c9971cf6eec@infradead.org>
Date: Wed, 18 Mar 2026 16:43:21 -0600
Message-ID: <87bjgk69o6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80092-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim]
X-Rspamd-Queue-Id: 009622C39AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Randy Dunlap <rdunlap@infradead.org> writes:

> Hi,
>
> As of linux-next-20260318, I am getting these version warnings:
>
> /usr/lib/python3.13/site-packages/requests/__init__.py:113: RequestsDependencyWarning: urllib3 (2.6.3) or chardet (6.0.0dev0)/charset_normalizer (3.4.4) doesn't match a supported version!
>   warnings.warn(
>
>
> I have (from OpenSUSE Tumbleweed, rolling updates, updated earlier today):
>
> urllib3			2.6.3-1.2
> chardet			6.0.0-1.1
> charset_normailzer	3.4.4-1.2
>
> Is this related to docs or just a not-so-good software update?

It won't be anything we did.  I hope you haven't been hit by the
weirdness around chardet...

jon

