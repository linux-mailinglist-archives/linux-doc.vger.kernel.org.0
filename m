Return-Path: <linux-doc+bounces-80507-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LI/ELEJv2ljqwMAu9opvQ
	(envelope-from <linux-doc+bounces-80507-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 22:12:17 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7A2E74B1
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 22:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C90B3011C7A
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 21:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B3536AB7C;
	Sat, 21 Mar 2026 21:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OEmGYNpi"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF9A1A9FA4;
	Sat, 21 Mar 2026 21:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774127534; cv=none; b=Gc47r3D4A2/7yHfK6l8wDEd0JRCYZTCQq2bZUB0qR0a0Fq+nu4fmKUZP1WVPku1Nlz2XfHady8kMLPzSaLofbDkoInyxQb9Lu5zQQcqLAR9PEnZqLujXPoIfSPo3cQaMLalblApg50CmgblZXgkD4nqEehG0PATOVZCNMHXen0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774127534; c=relaxed/simple;
	bh=zcOUb0ESXd2A1IE5Fw2s6aaJev45EYtXAj5akscT4vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ED5IEXBn4OCyzzhrdcj9OCkYNn0M19URqkEzZbg6fJiK1B7tTYdqHZyzcLsC0k/jnBcn7w8q0q9MBPrHHxnxDdIgb9lF7CBxmSWYWAmTJ/NEHO0KJXyaix2yyCXa86AQwdbGzZ4StVLUHZtXjqOtxks98I7NKkT6FKF5emovKHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OEmGYNpi; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/nM2QDdP4NML7N2UUexpXMCZAld9y/dp2SVDm2lP6uQ=; b=OEmGYNpiuuOnG2YXYjWOJUaQLO
	AC/GK6T258C5cf91hcpx+OIqUiajVrUSkn5rIxUjKPkCHdEjmyXsOQlDQYtShu+ayMxa0o7CtYljC
	vwRkAme5rg7LJd7CgEzk0i4w0yf51BbW7HGJS6MSe/oWen/ExXTOqAS3hKInbqOJCpkQp/wwSeWIf
	1J8JogIDcYaO2fQsU6LNZaaIgiXeZMynQHqxFXF65Orve1ysQo6uEA/cJtsJh/a894QBtWJqkHefO
	tVr4AxDq7YHgBJWW5N3PPI86AVGpleBFkNJBrt8294rwr4HJml0rdRvJFgYU/4l2nm+Wme5u50bLL
	aCaBNRYQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43c8-0000000EnGz-0LZh;
	Sat, 21 Mar 2026 21:12:08 +0000
Message-ID: <51813f23-8b1d-4fc2-9b18-5b829e8c9253@infradead.org>
Date: Sat, 21 Mar 2026 14:12:07 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] docs: contain horizontal overflow in C API
 descriptions
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20260321142559.26005-1-rito@ritovision.com>
 <20260321142559.26005-2-rito@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260321142559.26005-2-rito@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80507-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ritovision.com:email,infradead.org:dkim,infradead.org:email,infradead.org:mid]
X-Rspamd-Queue-Id: 8CC7A2E74B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/21/26 7:25 AM, Rito Rhymes wrote:
> Some documentation pages contain long C API signatures that can exceed
> the content width and cause page-wide horizontal scroll overflow.
> 
> Apply contained horizontal scrolling to C API description blocks and
> keep their signature rows on one line. This preserves signature
> formatting while preventing them from breaking page layout.
> 
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> ---
>  Documentation/sphinx-static/custom.css | 7 +++++++
>  1 file changed, 7 insertions(+)

Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

