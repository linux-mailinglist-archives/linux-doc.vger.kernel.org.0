Return-Path: <linux-doc+bounces-76458-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBb0B94JmWn1PAMAu9opvQ
	(envelope-from <linux-doc+bounces-76458-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 21 Feb 2026 02:26:54 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D4E16BBF5
	for <lists+linux-doc@lfdr.de>; Sat, 21 Feb 2026 02:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5664301CFA6
	for <lists+linux-doc@lfdr.de>; Sat, 21 Feb 2026 01:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3C930DD3B;
	Sat, 21 Feb 2026 01:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fZHqx5/j"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C331A05E
	for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 01:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771636957; cv=none; b=cvMjU+5bEe4OxpXAaAq60scbVeCXfhuriduPHTdEkkeICFXDYSwyAr26iobZSapXocKQMDhg5F9no+mu0hnEnQKL5jpwGoPhIB/gDtg8vdIFPZSHPjsCzDuI3KA7TQuw4tUpmSGxq+emXsRZR1u0IsxmdMogPD4G4Dz/mXV76TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771636957; c=relaxed/simple;
	bh=gs4Ibhwf4Po0cueDmnPxHa6HbMt8Ob3VZuj08NHDi1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCmxbr+InHqahmfboaAit9Xf9B4knlyj5bTlZWYC6IaRgF8fi2fVmG34mKMM6Bd3qki9GKBsx4+JutOF1j4PT59Uz4uvNlytV1ZcM+8PI25z7Ja9CTdxXk13zsmI9Rd5K4X2NSCMcdxueI2jMFQ1GV2tpYzVNiB/qZYsCA6IYM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fZHqx5/j; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=nQtRkTogv9yXd8D0q+mL9Yo4gvrXfHinHp/uOCKP3ls=; b=fZHqx5/j/FAcPu1AeMZPGYTvRK
	u7FhwPkQb5PQ82gjWeTlrpbLQ4ek8mPZiPrc5S4KHaOMn0KrNKdNmAh5FjcSYtCvB8ce/9GZRFQl0
	RbBaRwsVH40VSmjywcbgU5t9dMhWGbbrFds+HSpyv5lmdQx/92AABg2GQfMlB4fX8KPJ8D+WUh+Jq
	3QfR0Ki1pw7tstTqaJ8b/wg68JoB6JLzY7brnKe5720B77g5uwTZ0g6D25mj2sfXS7Xzq3kdjTmCU
	gYnG7L9T1SK9b+6L2zvsBhEmE9nGjzLktN8CqNjYcJ306pbTgmhiF1PeWS8loiHcPAXUhnaBvwQJi
	TzY2/BkQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtbhY-0000000FkFu-1Vgw;
	Sat, 21 Feb 2026 01:22:32 +0000
Message-ID: <58f25f78-0e4e-4025-84a2-9408b7209867@infradead.org>
Date: Fri, 20 Feb 2026 17:22:30 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel-doc for nested structs/unions
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>
References: <1c1eb223-8fb6-464e-9d32-4abfd15afec3@infradead.org>
 <20260218080437.4a86cb7d@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260218080437.4a86cb7d@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76458-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:mid,infradead.org:dkim,infradead.org:email]
X-Rspamd-Queue-Id: 72D4E16BBF5
X-Rspamd-Action: no action

Hi Mauro,

On 2/17/26 11:04 PM, Mauro Carvalho Chehab wrote:
> On Sun, 15 Feb 2026 17:47:07 -0800
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> Hi,
>>
>> I have run into some confusing discrepancies (differences) in how
>> kernel-doc handles some nested unions and structs.

> 
>> ~~~~~
>> Now if we look at include/linux/soc/ti/knav_dma.h, there is a struct:
>>
>> struct knav_dma_cfg {
>> 	enum dma_transfer_direction direction;
>> 	union {
>> 		struct knav_dma_tx_cfg	tx;
>> 		struct knav_dma_rx_cfg	rx;
>> 	} u;
>> };
>>
>> Running kernel-doc -none reports:
>> Warning: include/linux/soc/ti/knav_dma.h:127 struct member 'direction' not described in 'knav_dma_cfg'
>> Warning: include/linux/soc/ti/knav_dma.h:127 struct member 'u' not described in 'knav_dma_cfg'
>>
>> After adding comments for @direction and @u, kernel-doc -none reports:
>> no problems with this struct, where the struct kernel-doc looks like:
>>
>> /**
>>  * struct knav_dma_cfg:	Pktdma channel configuration
>>  * @direction:		DMA transfer information
>>  * @u:			@tx or @rx configuration
>>  * @tx:			Tx channel configuration
>>  * @rx:			Rx flow configuration
>>  */
>>
>> so kernel-doc is happy with @tx and @rx without having the union name prepended.
>> Well, this is again: Don't use the nested member union name.
>> OTOH, if I do add the "u." to the @tx and @rx members,
>> kernel-doc is still happy (no warnings here).
> 
> This is a bug, due to the lack of proper support for nested structs/unions.
> If you add an extra print to members at the end of the rewrite function,
> it handles the struct as if it were defined as:
> 

[snip]

> However, while looking into it, I guess it is time for us to part
> away from the current approach, replacing it by a logic that works
> better with nested structs, in a similar way to NestedMatch 
> implementation.

Yes, I agree, time to move forward.

[snip]

> 
> I have already a code to produce it, but I still need to bind it
> to the dump struct logic. Once I have it there, I'll submit a patch
> series.

I'll look at that 38-series this weekend.


>> (1b) Should they be @scratchpad.ul and @scratchpad.ptr?
> 
> Yes, but once we implement a list like the one I proposed,
> kernel-doc could support both ways.

That sounds nice.

> (*) There is currently a bug handling private - I have already a
>     patch series addressing it.

Will look at that also.


Thanks!

-- 
~Randy


