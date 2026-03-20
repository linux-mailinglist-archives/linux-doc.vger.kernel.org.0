Return-Path: <linux-doc+bounces-80289-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFvyDcK6vGnQ2QIAu9opvQ
	(envelope-from <linux-doc+bounces-80289-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 04:10:58 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3358F2D55C5
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 04:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30C51300981B
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 03:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977F12DB7B7;
	Fri, 20 Mar 2026 03:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2AgmzBgY"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E26B652
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 03:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773976251; cv=none; b=APkO68O7nQ9mrDZKVQZGpw/iZYzJSmKtusfB9TGtd9RixTlbeLGG0F8K9fYFyF2brX6oyiVIWBj26HwGLYoP1AfMHnQfcdX/xmgCyP91YhEXzHJZ7a00cCGcv+xZd5aoEZZT/wvHafF5ee27g9fRgngDohyYnuOlJKADXrK93HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773976251; c=relaxed/simple;
	bh=oBjrze3Po0ddY7TWE2U9+PKJsnCjOQ4SpKsef0R9NPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txKHuzDwtDSBqBMUUi54o9hdVeXpGPZIVloOU0w8oryPlSUno31ApX7pElJ4aXqyXK/Qz7k5MhmjZqMlpii/tktcZMtVCWCpwy69jq6bjZamSQEgsvP1E8IZEktDqj2PmqWCY73tt8IGMZAgGr5aKAqsRHR2L4UmV4tpeQJdBQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=2AgmzBgY; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JgnmdgHYRPB9X9WlKBqyfhLTiQ8T9jbKxeG1TNdGmQs=; b=2AgmzBgYH8YfaOxXcLitmJCH9p
	mi24j8laZEmnsDr61Lr9bIeZDU2PKGE/El8m1ZhmK7x19OMurk7jmaEvf1hfmHKrJD00i3jd+8bu2
	KoRdbjC1FDQE8zFUNYNKRIdE1AqQf8UEF59ri6DbtaCj/OCHZSPi+XXq99VXgPFv+iFPslTNQRenO
	SeF3lY19SI8Qh9FBGKL4TpSpIucwuSkSMdeyNe52IEEcT+mJXty1PXxbGxxJyOJA2dPwTQarA/aho
	F2e0Qxxgwgp0iX0zqc4ROZQKS/GrpMCiagNKBQlmelCuQHSI+ikeBEFa76aOK+DXbIpJUlJhcEsQ8
	m+lpRRVw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QG4-0000000By9X-2cK4;
	Fri, 20 Mar 2026 03:10:44 +0000
Message-ID: <07f4d4aa-aed1-451f-a129-d8112094a49a@infradead.org>
Date: Thu, 19 Mar 2026 20:10:42 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Invalid link generation for equations
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <9b320e77-9acf-4f0d-8c52-6e1fc3a8cf53@arm.com>
 <abyPiqMmw4BbB6eq@archie.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <abyPiqMmw4BbB6eq@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,arm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80289-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,infradead.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3358F2D55C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/26 5:06 PM, Bagas Sanjaya wrote:
> On Wed, Mar 18, 2026 at 01:56:24PM +0100, Kevin Brodsky wrote:
>> Hi,
>>
>> I have noticed that links to equation images are not generated correctly
>> on docs.kernel.org. For instance, Documentation/mm/memory-model.rst has:
>>
>>     .. math::
>>     
>>        NR\_MEM\_SECTIONS = 2 ^ {(MAX\_PHYSMEM\_BITS - SECTION\_SIZE\_BITS)}
> 
> I think we can just get rid of the math markup, no?
> 

Why get rid of it?
and does that assume that some specific package is installed?

Documentation/doc-guide/sphinx.rst says math expressions can be handled with
imgmath or with mathjax.
I don't either of them installed and this expression seems to render quite well
as a math expression:

<p>The maximal number of sections is denoted <cite>NR_MEM_SECTIONS</cite> and
defined as</p>
<div class="math notranslate nohighlight">
\[NR\_MEM\_SECTIONS = 2 ^ {(MAX\_PHYSMEM\_BITS - SECTION\_SIZE\_BITS)}\]</div>

The "(MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)" is presented as a superscript (power)
of 2.

OTOH, if you are saying that it's readable when just using ASCII text,
I'm OK with that also.

-- 
~Randy


