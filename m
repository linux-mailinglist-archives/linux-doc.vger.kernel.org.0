Return-Path: <linux-doc+bounces-84430-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BKFN8rb6ml8EwAAu9opvQ
	(envelope-from <linux-doc+bounces-84430-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 04:56:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C386459305
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 04:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 870CB300A5B9
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 02:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A51305E28;
	Fri, 24 Apr 2026 02:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ls7kJpsX"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EA83093DF;
	Fri, 24 Apr 2026 02:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776999300; cv=none; b=IjRofr61dJUij2bZZNGCa44bK0CpbJt1qmPQ4hqca9vP426Av1E1ovYciqSn4L6euuwH9MeTLuvalZixTTs4VRlQHwmOxgnezapNlcxUh7+Q1ttNHSh6d0s5sZiHs0aCBZXvQGCI5V9jJqZJA4+Eu+oec0C2EPlELt75hquGgIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776999300; c=relaxed/simple;
	bh=OUO7d57LPf+ocH1/dR1ctrSwugmU1d8dUV54pTj7X3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mA5Z2BZGp5eBRTTzlt+ItqUvyx3qGGmmpy4wbe475JQDUwItuWNpX8VPURa+JBETluTBDO6Z8sI2IBc2Fu045tLaPIMWT5B5TreY53v0+1rDFamUtYAX9qSW75m3hMsOubjSsU1EHHwrqBqfA+ZaTxyGSOUf96F14nN8QxcPfUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ls7kJpsX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=g2FcG4fAPXgUXX/2Qa5p13a6LPLKWvMkTIjCnC6WuCE=; b=ls7kJpsXm3dZungX6WstDrkP3N
	jQtRQddraSIHIhsAC0n3Xkv2CH2DBhaSSD3qsVAZIaXZDYi0Xp+4QSzcdsi9Ud5PO+J7nTwLlhZOq
	pG7/xCExEVEbAB7BToptIxP8NfwsO847ci8APmceuP+zFyhu0t9eyqka8ACZx2fsk9h5IY5IEE9PI
	KmULj71JeBADHJt2aXOkYuD/uZQnKeo7QYPUNq6ICMCVktDK+wU1R2STPsH9a+evXbbnY1H0uUM55
	WaDnYZznvkK1ll9P/4G8tvBKigezI0GL3OTpZ/gOxg4CgEvZo7b/K57NGx/XgDdg+Qi1trymWISs1
	RLo8b20w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6gq-0000000CXlq-3dL0;
	Fri, 24 Apr 2026 02:54:48 +0000
Message-ID: <8668e0f3-49c1-4748-97ab-00ee2befde10@infradead.org>
Date: Thu, 23 Apr 2026 19:54:48 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 v1] Documentation: proc: fix ext4 section numbering in
 table of contents
To: liubaolin <liubaolin12138@163.com>, corbet@lwn.net,
 skhan@linuxfoundation.org, surenb@google.com, cyphar@cyphar.com,
 witcher@wiredspace.de
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, wangguanyu@vivo.com,
 Baolin Liu <liubaolin@kylinos.cn>
References: <20260423065642.11218-1-liubaolin12138@163.com>
 <e1a0e7ab-8cdb-4c60-abcd-82c4e0be6e97@infradead.org>
 <1c59927a-2768-472e-bf89-34133a03749e@163.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <1c59927a-2768-472e-bf89-34133a03749e@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7C386459305
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84430-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com,lwn.net,linuxfoundation.org,google.com,cyphar.com,wiredspace.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,seibold.net:email,infradead.org:dkim,infradead.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]



On 4/23/26 7:44 PM, liubaolin wrote:
> 
> 
> 在 2026/4/23 23:55, Randy Dunlap 写道:
>> Hi--
>>
>> Why is "ext4" in the Subject?
>> Probably just drop that word?
>>
>>
>> On 4/22/26 11:56 PM, Baolin Liu wrote:
>>> From: Baolin Liu <liubaolin@kylinos.cn>
>>>
>>> Commit e24ccaaf7ec4 ("block: remove last remaining traces of IDE
>>> documentation") removed the IDE section but left its table of
>>> contents entry behind.
>>> Fix the stale entry and renumber the following sections.
>>>
>>> Fixes: e24ccaaf7ec4 ("block: remove last remaining traces of IDE documentation")
>>> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
>>> ---
>>>   Documentation/filesystems/proc.rst | 14 +++++++-------
>>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
>>> index 7ce02573a3d9..70db35987ee1 100644
>>> --- a/Documentation/filesystems/proc.rst
>>> +++ b/Documentation/filesystems/proc.rst
>>> @@ -23,13 +23,13 @@ fixes/update part 1.1  Stefani Seibold <stefani@seibold.net>    June 9 2009
>>>     1    Collecting System Information
>>>     1.1    Process-Specific Subdirectories
>>>     1.2    Kernel data
>>> -  1.3    IDE devices in /proc/ide
>>> -  1.4    Networking info in /proc/net
>>> -  1.5    SCSI info
>>> -  1.6    Parallel port info in /proc/parport
>>> -  1.7    TTY info in /proc/tty
>>> -  1.8    Miscellaneous kernel statistics in /proc/stat
>>> -  1.9    Ext4 file system parameters
>>> +  1.3    Networking info in /proc/net
>>> +  1.4    SCSI info
>>> +  1.5    Parallel port info in /proc/parport
>>> +  1.6    TTY info in /proc/tty
>>> +  1.7    Miscellaneous kernel statistics in /proc/stat
>>> +  1.8    Ext4 file system parameters
>>> +  1.9    /proc/consoles - Shows registered system consoles
>>>       2    Modifying System Parameters
>>>   
>>
>> Where/how is this Table of Contents used?
>>
>> But yes, the intent of the patch is good.
>> Thanks.
>>
> Hello, this directory contains the subsequent content of the file proc.rst.
> 
> My modification is due to a previous commit e24ccaaf7ec4 ("block: remove last remaining traces of IDE documentation")
> which removed "1.3 IDE devices in /proc/ide" from the subsequent content and modified the labels of the various items.
> However, this previous commit forgot to remove "1.3 IDE devices in /proc/ide" from the directory itself.
> This caused a misalignment between the directory entry and the actual subsequent content items.
> 
> My modification is to remove the "1.3 IDE devices in /proc/ide" that was forgotten in the previous commit and correct the labels of the other subsequent items.

Yes, I understood all of that, but I had questions (which you ignored).

-- 
~Randy


