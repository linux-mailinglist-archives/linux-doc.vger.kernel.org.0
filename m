Return-Path: <linux-doc+bounces-81229-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LFcCv4yxGkAxQQAu9opvQ
	(envelope-from <linux-doc+bounces-81229-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:09:50 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA2932B097
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B3BA30B8CF8
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 19:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C413126D7;
	Wed, 25 Mar 2026 19:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="oj0WUIJ+"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EEB2459EA;
	Wed, 25 Mar 2026 19:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465465; cv=none; b=f6hpB1OlOBCTzBZlooX+79/nSCsIU5vnASe1Z+aX31FTtSTvEZpcxpJIWZl+f0ooGM7LUm7oBCh2SvGnhCiXHvJHN1qFFKi2U9EVsbQxNY8afO66nObUV9fdwqTrl3o93hrPnhM5VxnRBohk2Z+YePBfT+2lAkQsZv0/v+Q+ENM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465465; c=relaxed/simple;
	bh=KzFjKZL5Y/xjnPsqDiVITklRAUuBd1vwFEo1W4NVk4o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nfqMr3EL8nFWXYFRU6T/hVGoTMIMx3xYA9fYxmLGKQKS99Z1oNqZg6NR/mqlh8+f4bhaWuFdjNsaVix7a4J6zzh2R3Kj0F527DyzUDmbM7TlG0+6gR8NgpH5QmeE1o8WWdnaPDpax2r03bZErk6xCVrhdmyNvhCQlQUDDEah+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=oj0WUIJ+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0C7AB40C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774465464; bh=D4OaDQstftoam8u56Pjm1BcMbaptydxU9Nl59QxCmbw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oj0WUIJ+UC1BIlKc8vb+z0iUvEc88om89EBRjmfv7Rhe7TkNxhbeCaOHmfRZRpktp
	 Tdbn6JjjREcdKK9jSnCZ0KS353cGNUkMLFI7I8eohHdmzQ3+wVTD92IfwXuLceqsM5
	 mYv/968T+5BHvJr5bn9mFZnOyhlmJJGldh/JGiUuuAG2NnTK1fx6x7Exw9KoF+pXwf
	 XEma1U4yH0DlwwMW8NWKeK2XqNrEHs4WZeA3ozsm4hJS/pZiBaV54LlwnDGlO1F0Ni
	 0iO9sCmGNROR5tNlXdZJq+RWMJfzIDWzo1hicp2LZPR20+UO/qWnN/YYeY/J/cs41S
	 9Lbc8F3FM0Jmg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0C7AB40C6F;
	Wed, 25 Mar 2026 19:04:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, Rito Rhymes <rito@ritovision.com>
Subject: Re: [PATCH v3] docs: allow long unbroken headings to wrap and
 prevent overflow
In-Reply-To: <20260323153024.32317-1-rito@ritovision.com>
References: <20260321144855.30429-1-rito@ritovision.com>
 <20260323153024.32317-1-rito@ritovision.com>
Date: Wed, 25 Mar 2026 13:04:23 -0600
Message-ID: <87h5q3g288.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81229-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8FA2932B097
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rito Rhymes <rito@ritovision.com> writes:

> Some documentation pages contain long headings with unbroken strings
> that can exceed the content width and cause page-wide horizontal scroll
> overflow.
>
> Allow headings to wrap when needed so they stay within the content
> column and do not break page layout.
>
> Browsers do not treat underscores as natural wrap points, so some
> code-style headings may still wrap awkwardly. That trade-off is
> preferable to allowing horizontal scroll overflow, since headings
> should remain immediately visible rather than partly hidden behind
> horizontal scrolling.
>
> Examples:
>   https://docs.kernel.org/6.15/userspace-api/gpio/gpio-v2-line-get-values-ioctl.html
>   https://docs.kernel.org/6.15/userspace-api/sysfs-platform_profile.html
>
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> Assisted-by: Codex:GPT-5.4

I do not see the problem you are referring to here; headings wrap just
fine for me using both Firefox and Chrome.  (Firefox arguably does a
little better since it wraps at "/", but that is what also make it turn
"I/O into "I/
O."

In what environment are you seeing this problem?

Thanks,

jon

