Return-Path: <linux-doc+bounces-80506-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO+vCdMHv2nRqQMAu9opvQ
	(envelope-from <linux-doc+bounces-80506-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 22:04:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2642E7441
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 22:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73481300845B
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 21:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A054C24A076;
	Sat, 21 Mar 2026 21:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0liLQLtS"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8B6F9E8;
	Sat, 21 Mar 2026 21:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774127047; cv=none; b=iEKpyFta8mD9BPn12zKjrpJciCouu6sYFm6/68Nz9dIoh3sk0okQYDNmDEcehYU0H66jIBL2jsTQDT4WQFvbdTe/I4dqiPLrjgtlnw2a/hsyXK/+YO1/CpWp7SYGi7SRlGgKm6zVNmQKMiNCXHTZMaYBMvnkNGdbZqyb/qtyurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774127047; c=relaxed/simple;
	bh=lOKEeiaGW6FWprmDFkDgCjSotwpXD/uaFXrTBxOwnOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o70FXyxFgy6hXRueXa+0+5+IyeOKSuRYSzcH6aVB+pFmbvpcBYYoiw0Oml240Pjh9P6qerEeEHuCKWWSx6T9wBlluj3KiOyXBuMpiBuEA7WxOcboDCa/fATer6en37zoZYurFyVq0NlpJ4BjnuBeQxNdwDUHcQDC84wdaxa4nWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=0liLQLtS; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=3t1eNfobSL5U3sdDv4OJVMOW1jfFZoQILxdSJhDLRLA=; b=0liLQLtSgWeHDy+gRQA3J7Ah5W
	G/6TASeZQjegvUI429wUiftiIeayGS2P05BXHfQzDnar7H0hrz3GBADC9P0wSp0h1W9r2bUxdC/N8
	iQPyFflWhnlwUlLey5JdBjQqp1ITDichSyXVBKlyTR3lgocwqqk13wZw0nyKz4TWcZckmgR4bFFM9
	whBLNg+Ovo5fLPZgeK7FateHDpxrZGZFmxdpQdV6N5FLMhnTNKw54mXpuBxlWKFidStZszQqeyHtl
	8JTH8h3b1MbDZ9I+buFpSSU7INHswDlRJUdLqy3DtfuOUmGjQHTqr2V/ZIn+IRb8QI7xfwn68pOPI
	LjRLXF1w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43UH-0000000En6v-0nxi;
	Sat, 21 Mar 2026 21:04:01 +0000
Message-ID: <6d2f87da-9485-45a8-a322-6b1582c41ad8@infradead.org>
Date: Sat, 21 Mar 2026 14:03:59 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] docs: allow inline literals in paragraphs to wrap to
 prevent overflow
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20260321141118.23828-1-rito@ritovision.com>
 <20260321141118.23828-2-rito@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260321141118.23828-2-rito@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80506-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ritovision.com:email]
X-Rspamd-Queue-Id: 9E2642E7441
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/21/26 7:11 AM, Rito Rhymes wrote:
> Some documentation pages contain long inline literals in paragraph
> text that can force page-wide horizontal scroll overflow and break
> layout on smaller screens.
> 
> Override the default `span.pre` white-space behavior for inline
> literals and use `overflow-wrap: anywhere` so they can wrap when
> needed. For code used as part of a paragraph, wrapping is appropriate
> because it is stylistically part of the surrounding text. Code blocks,
> by contrast, are meant to preserve formatting fidelity and are better
> served by contained horizontal scrolling.
> 
> Signed-off-by: Rito Rhymes <rito@ritovision.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/sphinx-static/custom.css | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

-- 
~Randy

