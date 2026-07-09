Return-Path: <linux-doc+bounces-96035-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IdLVEKXmT2rUpwIAu9opvQ
	(envelope-from <linux-doc+bounces-96035-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 20:21:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A17E673433B
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 20:21:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=HhtK6KDQ;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96035-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96035-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3CCA300C9A7
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 18:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975563A1A58;
	Thu,  9 Jul 2026 18:21:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014A84DBD67;
	Thu,  9 Jul 2026 18:21:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621282; cv=none; b=tflc0DwnQnOpibGgM+lUNKnUAeThrppFmxnsHYleDATiNEAw39BkTJYP5KJkjFx2QQJgmdUKCWlbhWRKnwSl9lW3Sl8GO8BrQ1CDfFOiwmD4dn9Vf4EyhQ3iRpaCrh5QYWlJX6h1I8K3Sb+5ZXqWFNjndbF0Y9YbonOSffZR3M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621282; c=relaxed/simple;
	bh=NWLzN0L6JnVtaAHoRdWDrk9jAo5aqZcmY3Cuw0fJefg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WaQJ1PobtCOazEf9vMrHQ7cxIK+DQLafblHC+o6BNRH3B2t0OA7l6X6MDSuLXWtyVnpsSsXHdr9bwsFaKyLOgYcRVyxPU3g2RtRyKXvz/PKfVgduMUw6bWyi8yXTZPl5qMSyEPy5ZyrHdQbsoxyxsdhjbJVPzYpuXa1xoOa6ZTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HhtK6KDQ; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=NfpvX3DHzjHi/7lUBn+WxEvgBeBWTYdWn7wUOIuHJ6g=; b=HhtK6KDQaYwll8lQUpUk6xypTK
	0v144RF2IL+QGWrcS9cgmmVvj10yLoWvlIx/jRcFc8BQ8sIrXMs9xl304LMEKdH0YOb0bO3DsGQ3b
	yNH9TxjUARiMh2cf4IpZRghNXQ5QAJ4Z9blIIruBXOWIsIGd3aB8vO/7SadOlMwegJNC4r+zTaBvs
	EU6fJpY3lWqAnL+ZpyPJCXwj+AzOSRU5Sr4swe8DKTaMxtqojGWlrl52QwZvXJ6wHG8b2atE/3tFV
	G+6ZisMn14PoALzzOTHUNLwvFxBPY1JLvXvRZKuTCnvAFLRk+JYW+S2wSOxfp/6kWjG4+2Kle32oE
	Wate0Mdw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtN7-00000003DUy-3dwQ;
	Thu, 09 Jul 2026 18:21:17 +0000
Message-ID: <052a5cc4-8e2d-4a66-a242-27eae1498116@infradead.org>
Date: Thu, 9 Jul 2026 11:21:17 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: workqueue: Fix bracket
To: Manuel Ebner <manuelebner@mailbox.org>, Tejun Heo <tj@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Silvio Fricke <silvio.fricke@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260709142939.404290-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260709142939.404290-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96035-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[mailbox.org,kernel.org,gmail.com,lwn.net,linuxfoundation.org];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:silvio.fricke@gmail.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:silviofricke@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:email,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A17E673433B



On 7/9/26 7:29 AM, Manuel Ebner wrote:
> Add missing ')'.
> 
> Fixes: e7f08ffb1855 ("Documentation/workqueue.txt: convert to ReST markup")
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/core-api/workqueue.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
> index 411e1b28b8de..bb770f556568 100644
> --- a/Documentation/core-api/workqueue.rst
> +++ b/Documentation/core-api/workqueue.rst
> @@ -356,7 +356,7 @@ Guidelines
>    well under the default limit.
>  
>  * A wq serves as a domain for forward progress guarantee
> -  (``WQ_MEM_RECLAIM``, flush and work item attributes.  Work items
> +  (``WQ_MEM_RECLAIM``), flush and work item attributes.  Work items
>    which are not involved in memory reclaim and don't need to be
>    flushed as a part of a group of work items, and don't require any
>    special attribute, can use one of the system wq.  There is no

-- 
~Randy

