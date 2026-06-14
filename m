Return-Path: <linux-doc+bounces-92327-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id icIWH/vhLmrr5gQAu9opvQ
	(envelope-from <linux-doc+bounces-92327-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 19:16:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB13C681C23
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 19:16:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=asGBXsvL;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92327-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92327-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2A28300AB20
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 17:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EB429BD8C;
	Sun, 14 Jun 2026 17:16:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42071FC7FB;
	Sun, 14 Jun 2026 17:16:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781457397; cv=none; b=tXQJysm2QsgK2V03ogKk1xpUk2dXl2l/emgF7aueF9g//1WehraExIyt9ohJW7EaWrRt1qJRZIxwekeX5qwjF7JZb1AkgRceyNaJJdppsLAZioxfyVUExJE4VWPyXDSmc3PwZIug5I+9V+LK81R7HfH2ElrzuP1Yyl7QEcgDm4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781457397; c=relaxed/simple;
	bh=qJou47e8RoHk5DXCRunJj/2PLa6xz8dYt6uW5R0RDD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2+DBQQPYfdeOx7FQkDwXCXI8dbBeyXXB21s+zDjuc+GWGh9BX+d6Txnrv1+too/+rPD8a5R444RoP3vlLlQqyMswJOvBJpyT6mvGeJptFSoYUw1z4g1q8hNc30mB5T5Tr2rx8zL5evi5c+zFaD/A0mDfJlK8I2TdmmJfh/bihM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=asGBXsvL; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=WmRDzJATWWXg/Un37W4yII5HPqB6i8FZk/7SmL2nMHU=; b=asGBXsvLJmylJCEcCmNqOgP3YE
	ovB0pcgjuUWQ4v2/u2ZeSSxHqt8o6uGO2pFs7JBQ95Ru9nGrsaehad8fU5+zSryiRxPb4v34l+KK2
	lMooCGdp2LH7nG/aUDovtyrGOQManmXTDgWcmicMsv5owtAtYal0cNzhcb44GndYtX2qRyGSPt8+y
	8e5KcbSEAfO02rHlY7THkH7SD/VJvVySs9QUhs6E1Q+mQ45VzR9X5lODhlYVXhnd9ekdN/C9vEIKA
	D9/xLJtxK4Edj5rvn2bzj3uMAzRfCW/2i7Dsy5kFiNy0vEFSYelV1vBLVtlTIOiMqUywpoUFIMfSi
	7STZoUog==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYoRk-0000000DD0a-0fyR;
	Sun, 14 Jun 2026 17:16:32 +0000
Message-ID: <b303fc4c-c765-47fd-8c8a-e8c211d48bc3@infradead.org>
Date: Sun, 14 Jun 2026 10:16:29 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cxl: docs/linux/dax-driver - fix typos
To: Zenghui Yu <zenghui.yu@linux.dev>, linux-cxl@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dave@stgolabs.net, jic23@kernel.org, dave.jiang@intel.com,
 alison.schofield@intel.com, vishal.l.verma@intel.com, ira.weiny@intel.com,
 djbw@kernel.org, gourry@gourry.net, corbet@lwn.net, skhan@linuxfoundation.org
References: <20260614161458.88942-1-zenghui.yu@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260614161458.88942-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zenghui.yu@linux.dev,m:linux-cxl@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dave@stgolabs.net,m:jic23@kernel.org,m:dave.jiang@intel.com,m:alison.schofield@intel.com,m:vishal.l.verma@intel.com,m:ira.weiny@intel.com,m:djbw@kernel.org,m:gourry@gourry.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-92327-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:dkim,infradead.org:email,infradead.org:mid,infradead.org:from_mime,linux.dev:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB13C681C23



On 6/14/26 9:14 AM, Zenghui Yu wrote:
> Fix two obvious typos in the "kmem conversion" section.
> 
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/driver-api/cxl/linux/dax-driver.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/cxl/linux/dax-driver.rst b/Documentation/driver-api/cxl/linux/dax-driver.rst
> index 10d953a2167b..72c85a0f8606 100644
> --- a/Documentation/driver-api/cxl/linux/dax-driver.rst
> +++ b/Documentation/driver-api/cxl/linux/dax-driver.rst
> @@ -35,9 +35,9 @@ will be exposed to the kernel page allocator in the user-selected memory
>  zone.
>  
>  The :code:`memmap_on_memory` setting (both global and DAX device local)
> -dictates where the kernell will allocate the :code:`struct folio` descriptors
> +dictates where the kernel will allocate the :code:`struct folio` descriptors
>  for this memory will come from.  If :code:`memmap_on_memory` is set, memory
>  hotplug will set aside a portion of the memory block capacity to allocate
>  folios. If unset, the memory is allocated via a normal :code:`GFP_KERNEL`
> -allocation - and as a result will most likely land on the local NUM node of the
> +allocation - and as a result will most likely land on the local NUMA node of the
>  CPU executing the hotplug operation.

-- 
~Randy

