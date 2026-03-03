Return-Path: <linux-doc+bounces-77715-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD+tBV0Tp2mfdQAAu9opvQ
	(envelope-from <linux-doc+bounces-77715-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 17:59:09 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD081F43B9
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 17:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE658301FE7C
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2026 16:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C6D4CA29A;
	Tue,  3 Mar 2026 16:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cN1h2g4s"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B8A34F46E;
	Tue,  3 Mar 2026 16:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557140; cv=none; b=J8bJwlrgqjz/QHO5qbK3zqXjlskrZ8s0XNT4q3xyv+MiS4IZaKBglD+KsPMSKIomHkJtkurukQtm4iOOI5siX1YI2uPWFJ9+fFfQNRz9bKoDAroDWrn2RUQwEOW1qCQrkxIJ0uhht3vsscww6zfLeM1f1gM0jayZemOZ47WjYJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557140; c=relaxed/simple;
	bh=t7sEvrVCRvm7rlTi9LhJrSIhxg8Y24IMzEA4vLiwIu8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mmCwSQgKnbNpoWTvDz91HzJ2KfCyAGTaJjUy0uzq0pylJRTWahlLR22KkUABRNRknW8YYgWWqS37FBySsYhAkaO/lV0SG2CyNvytPdQ+SEfmHGG39zsdVGt8hZvhSxJxIidAbkgUVONbj5OfGrza4JHKqZvcdsrjCiMTQEwcd3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cN1h2g4s; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 22F4B40429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772557132; bh=JTvGUlMSqf8Cr2gZi6zkQR0lXH6KUsrr8KiGxrNGvJY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cN1h2g4sLUSblftBaDiyMyOBT5Yii8ekBQWFI+8eLHjRl1kyL2sue+WIYYFHtJn69
	 pIM+W2wT2FRnSTMjbEADAyqr3L5Xlh0RwcLqgMQtjcKAv+PdF1at76WLsJxutXwH/A
	 TC/xHYRGb5gQ9puSJ7xCbojhc+RL31ogIPceO+8ghpaMv6v6717rp+asuH7Rg6B93g
	 lBRWGG/XjvkgDhtqnN/ZDxDx40ZcjumFWiQpDoUt0C53yEHQu2z5BH+QGX8U/ik+YR
	 l9E132+SGVKWoAZ4xMDCpZTPvoDvtFKOyd3CgltnfH298ZQ8bq5igOjdVsmlf4hnzV
	 NAz2Bir9bgJNg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 22F4B40429;
	Tue,  3 Mar 2026 16:58:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@airmail.cc>, Collin Funk
 <collin.funk1@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Manuel Ebner <manuelebner@airmail.cc>
Subject: Re: [PATCH v3 0/2] workflow, scripts: sort changes.rst and ver_linux
In-Reply-To: <20260302182405.86829-2-manuelebner@airmail.cc>
References: <20260302182405.86829-2-manuelebner@airmail.cc>
Date: Tue, 03 Mar 2026 09:58:51 -0700
Message-ID: <87wlzsdf3o.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 0AD081F43B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77715-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[airmail.cc,gmail.com,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DM_SURBL(0.00)[airmail.cc:email];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[airmail.cc:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Manuel Ebner <manuelebner@airmail.cc> writes:

> It is a pain in the ass to compare the software versions on the running
> system (scripts/ver_linux) with the minimal required versions (changes.rst).
> Sorting both lists the same way makes side-by-side comparisons a simple task.
>
>  [v2] -> [v3]:
> fix changelog
> changes.rst:
>  needn't -> do not need to
>  add gdb 7.2
> ver_linux:
>  /Changes.rst -> /changes.rst
>  add gdb

Please explain to me:

- Why I am getting multiple copies of the same patches

- Why I'm getting the same series from a completely different identity;
  the first set came from "Hans Anda"

- Why my request to separate out the logically different changes were
  ignored.

Thanks,

jon

