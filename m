Return-Path: <linux-doc+bounces-89108-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAsQFdzIEGpIdgYAu9opvQ
	(envelope-from <linux-doc+bounces-89108-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 23:21:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A72F75BA57D
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 23:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D58143012265
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 21:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2B6332615;
	Fri, 22 May 2026 21:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Zlx7eHQf"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2E137104D;
	Fri, 22 May 2026 21:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484844; cv=none; b=PvFYEWO57Fxa4pZdgHJCo2rFjHbRuDaVIEe0a7kQ8J2bttzHlfKQDKdi7izKAHGwia9/77d5uT11jzJwI8IBbjRcf1WAs3+aT1SeevnObz8DPlLjOpUGovcg197RKz+p7zuHUeV8hR1KukYim4qqBazQJJAj7XtQNCg8oSlxxjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484844; c=relaxed/simple;
	bh=M1uqHe0XUv7mn4egVQgZA2MMa7SoXOGZEPn0oi5IY0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kzv2aztEowRWIgip5wso4Ir3Q/KA8s7Gf7WU7HW25WkALz0rMDXpjgrXQD+ZZNYC7FYxCvrq3Yc1r5ilahWoGyfnKh8dvRjwKnIqZ9idemaJpqVia1Lbykh5DrnU4XTLV+bjAs8wEvX3BCwFWXsmdDdO1aLRygnlFFDE7fwAUZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Zlx7eHQf; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=tXVYxOlGxnFpjtqebPHdxb2rapBSyMJrkchK/E0p6rQ=; b=Zlx7eHQfwGmr7azsxuCjRkxl/b
	R16hXbcMqJiWKhbN694CwINy5ic4hFPy9LXPIemXrl8CwZG8a8u87pfN1tJrdYHH0g7mwXGTMKyi5
	HF3Y04BLJMvZL6TbIkbm1n/tz7/ujqjU88zPJ9DPJ8E/hMD1sIzgnm4ns3G5vvKOrBaPb8EsM6N6t
	r1xxGbAbEbQIFWjt0NK6ZDetWtMW0hJcSR3vipCiG0JYKtT9D86YJ5TYWEfQkHogdyOKCojpbH0DX
	bNQHf6iwQBB6fikDEKV4UPghtxtyIOgDGInYdcM1QlVXmSsp2POV3rmRCfYSXM2VmKiEUS5CLnV2r
	AsPRCnPQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXIK-0000000Bwfe-0DD6;
	Fri, 22 May 2026 21:20:36 +0000
Message-ID: <ca29c0fe-8725-4cc2-8f4f-db3f80ccafed@infradead.org>
Date: Fri, 22 May 2026 14:20:35 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260521191458.177046-1-rdunlap@infradead.org>
 <13240501.O9o76ZdvQC@strix>
 <503916c8-da3b-42dd-812e-356f519be47f@infradead.org>
 <6270885.lOV4Wx5bFT@strix>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <6270885.lOV4Wx5bFT@strix>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89108-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Queue-Id: A72F75BA57D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/26 12:31 PM, Stefan Dösinger wrote:
> Hi Randy,
> 
> Am Freitag, 22. Mai 2026, 20:44:24 Ostafrikanische Zeit schrieben Sie:
>> Does this mean that you will be merging this patch since you merged the
>> original patch?
> 
> I am new to the kernel development process, so I don't know what's the 
> preferred way. I guess for me it is easier if your patch gets merged as-is.
> 
> I can certainly submit a pull request myself though since I made myself the 
> maintainer for this thing. Does that go to linux-doc@vger.kernel.org or the 
> soc list?

The same way that this commit was merged:
commit 220ae5d36dba
Author: Stefan Dösinger <stefandoesinger@gmail.com>
Date:   Tue Jan 27 20:52:08 2026 +0300
    ARM: zte: Add zx297520v3 platform support

I guess to the soc list.

-- 
~Randy


