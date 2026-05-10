Return-Path: <linux-doc+bounces-86712-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIyXDh/BAGppMQEAu9opvQ
	(envelope-from <linux-doc+bounces-86712-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 19:32:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 886695056C6
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 19:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8920300AB16
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 17:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFC83B0AE9;
	Sun, 10 May 2026 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nh9nVJb6"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE03639F19C;
	Sun, 10 May 2026 17:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778434332; cv=none; b=RsdDL82fXeBlQefnoDokoejY6m6jue9bmpjaArrSMq6KT8WyIFggl2B/48IbKcexe37nq7FHYjeiOdo/Ivbn02oQh++4b+JiVL+/y4q9WjcsdoKBpuLwh9YhYYmT+b8OMeowQPQT7TH9rb9TLnRDlk/mcQsfTpb1pzAdrY3G4P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778434332; c=relaxed/simple;
	bh=yOEDC0JZyDkOtCwx1VKEJNyj5Py+wvvxIb+q06m+EbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2FPeWowDyEmmd/x0buQHFVHss4jTKvbVLKvRGkug1I8xMG+qHNVBDsnWz112lXqzWFp+9k15Kft9bLBNfmnFfP06gpfcLYoj/M7CEU935NEyc44Nd2MZjlEg4y+I5aEDhFT3caVnRk7TyUcGV0jYyU67vabsxkPib4DnC6MUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nh9nVJb6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=mXjKWdpcfqBdM0FeKX/+fa8JFwqbjSL0tYWQHl8rxMU=; b=nh9nVJb6548/pOqbdHTV0IsdS+
	fNDevawcRF31eQNNSRt6JptGnqePhMUty/MJW+NmZMruRlobS/NUz6o5exUaXDZSGT96C4LL1Pqz3
	AvVWZgDN2ePeO8ReyiFrvDkcSOamE7jLYpLCMrH1+yt7SzmBolFoKh+NFXnfaY97GK1N/ivF1RQIu
	B8885VE8L/O5H0kRpSTD1EJH0ora7JXPeT9PtX2/ryNHbxxcW4q+jKKSANzB1Cju/nsVDxZDutcjJ
	i0gMPokaPW2aRrLmnECofsFhGCGGTXZf05g2UfFeukw6qO/ApUdBbHVb+RiikHjVbGktHjUGc/xCN
	sBIgyJ+w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM80d-0000000BGcH-3fuz;
	Sun, 10 May 2026 17:32:07 +0000
Message-ID: <6c753b0e-fa95-4479-a2e5-d8376239a4d8@infradead.org>
Date: Sun, 10 May 2026 10:32:07 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Doc: deprecated.rst: add strlcat()
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: andy.shevchenko@gmail.com, apw@canonical.com, corbet@lwn.net,
 dwaipayanray1@gmail.com, joe@perches.com, kees@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 lukas.bulwahn@gmail.com, skhan@linuxfoundation.org, workflows@vger.kernel.org
References: <20260510164907.57176-2-manuelebner@mailbox.org>
 <20260510165451.57674-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260510165451.57674-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 886695056C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86712-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,canonical.com,lwn.net,perches.com,kernel.org,vger.kernel.org,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Action: no action



On 5/10/26 9:54 AM, Manuel Ebner wrote:
> add strlcat and alternatives
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/process/deprecated.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index fed56864d036..b8a65c19796c 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -162,6 +162,12 @@ if a source string is not NUL-terminated. The safe replacement is strscpy(),
>  though care must be given to any cases where the return value of strlcpy()
>  is used, since strscpy() will return negative errno values when it truncates.
>  
> +strlcat()
> +---------
> +strlcat() must re-scan the destination string from the beginning on each
> +call (O(n^2) behavior). Alternatives are seq_buf_puts(), seq_buf_printf(),
> +snprintf() and scnprintf()

Add an ending period.

> +
>  %p format specifier
>  -------------------
>  Traditionally, using "%p" in format strings would lead to regular address

-- 
~Randy


