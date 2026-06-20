Return-Path: <linux-doc+bounces-92989-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i6iiM6/eNmoMFwcAu9opvQ
	(envelope-from <linux-doc+bounces-92989-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 20:40:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 265F46A97C0
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 20:40:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=temperror ("DNS error when getting key") header.d=infradead.org header.s=bombadil.20210309 header.b=yOYjAXtM;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92989-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92989-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=temperror reason="SPF/DKIM temp error" header.from=infradead.org (policy=temperror);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D79D3017248
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 18:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82F5356756;
	Sat, 20 Jun 2026 18:40:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4F4270EC1;
	Sat, 20 Jun 2026 18:40:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781980838; cv=none; b=eHCedIKnVR03gR6RONuSC/IBbQ2dH5hCm0dxWEmGyGgaF6yyMvjxJmv1JW3g0IG+rMrtSf8IhnpNH9eLk/eMl1TqgDPd6/gL+4N8YS9uB8XtT1jPbnM7J7Nz1O7mpV8XNnpo0/w+B3FTnjWrteVY7a1JZC4qY2W/Jci2zs4LktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781980838; c=relaxed/simple;
	bh=Q3Xiyt4t3Ff3Sfqm5NWLG7I25RL/Sxz6X59u3CHU7Qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQB8Uaue/peWl2CCAhoNjw96dv3J8AJhNF5Zgg4wG3A3L1tn2VQ73cZhWirktYMy8TaPZ+eADGzXDczhz6LNFydYb9x2846lZYjGfMRbm6rvvCewjJr/D6NwEre6B43EsQQ+m+/dVrNtGIitZ/Q/IFfigXHCiiQbcVLRrngH0D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=yOYjAXtM; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=lF91LOryZhh9Xbnlao0wR5FYAQfbHc7j4pr9N+nyMk8=; b=yOYjAXtMGYVQWk4we9CyvduKi2
	oed/dqL5xd+1AI/uU5hz6klED6dWMSLYh6AaKGeM25jLsMF7LtVD9PraB2Z6+xPdMTiGcrdms43I1
	1FJRh5s/Jov8kkAzdrD3FVLhTJmctvCbKDOMWZzoOPs8NPmbOMUEaHY/8MS6Lq1Fkwa1g8jU81ia5
	UY6YRIV5Z/w+TuUGocFORYNXc0YxWyeUeO6qRU2OkSvMhjYY3hKTz8l+dVuVYYF1M7FJ2F4tKQobY
	i0pUlVnywo+zG5x2CVrLs1aOjr9dv3Xda3ervxJpvKfTHAiPCnfgmndOx8F4gXwkDojfF8JUFmvCj
	O77u0nqA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb0cL-00000003VFx-3del;
	Sat, 20 Jun 2026 18:40:33 +0000
Message-ID: <626477f6-8bda-4cac-8341-c720fd279ba3@infradead.org>
Date: Sat, 20 Jun 2026 11:40:32 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ipmi: Fix path of the "hotmod" module parameter
To: Zenghui Yu <zenghui.yu@linux.dev>,
 openipmi-developer@lists.sourceforge.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: corey@minyard.net, corbet@lwn.net, skhan@linuxfoundation.org
References: <20260620122747.7902-1-zenghui.yu@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260620122747.7902-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:?];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92989-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zenghui.yu@linux.dev,m:openipmi-developer@lists.sourceforge.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:corey@minyard.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DMARC_DNSFAIL(0.00)[infradead.org : SPF/DKIM temp error,none];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_TEMPFAIL(0.00)[infradead.org:s=bombadil.20210309];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 265F46A97C0



On 6/20/26 5:27 AM, Zenghui Yu wrote:
> The correct path of the "hotmod" module parameter should be
> /sys/module/ipmi_si/parameters/hotmod. Fix it.
> 
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
>  Documentation/driver-api/ipmi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

There are several other places that use /sys/modules/ instead of
/sys/module/.

Would you care to fix those also?

thanks.
-- 
~Randy


