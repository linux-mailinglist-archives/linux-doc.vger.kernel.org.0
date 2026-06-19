Return-Path: <linux-doc+bounces-92881-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GAE3AvTQNGqyhgYAu9opvQ
	(envelope-from <linux-doc+bounces-92881-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 07:17:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6069F6A3EE8
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 07:17:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=jbC5I6eQ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92881-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92881-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5ABAC30173A9
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 05:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A032EE262;
	Fri, 19 Jun 2026 05:17:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A362D40D598;
	Fri, 19 Jun 2026 05:17:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781846257; cv=none; b=uW2PibDWskfwmAYGafyfvAoKddrjYwd2gMs4wE6wzJZ3AQUbGmPkyXzQrFuSRIanS24iMIt2XjK1yDuZZTmsMK6wceOMkDfuKNUEatgsBIQBz8dtBCdWfllEpYgsSMEnbjd6I1vG1mL66e4Gx9Vb3Xh+H957IuPEaQa1ExE+wKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781846257; c=relaxed/simple;
	bh=UThYL4n3yi6FB/4PoyNwX/qX7QaXgn7Gb48t1iB6IKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ir8d8LtxoriAn9Jpmdt3jdq7QKGiz8csW+ZSWQgA9hN95YBYK+NYT+m/LtHCrNKelx/CUuvu8uhcoioUKXrlQcw/CdcfofKxfaZflM3GcEIwB5AIeglSM2NpxRoWJSfq4kFjERYSFnsADksMy0OHNVkgPMk6B62DJCZqJzJklow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jbC5I6eQ; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E76614AAB;
	Thu, 18 Jun 2026 22:17:28 -0700 (PDT)
Received: from [10.164.148.42] (D3H2TH2F54.blr.arm.com [10.164.148.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BD7B3F763;
	Thu, 18 Jun 2026 22:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781846253; bh=UThYL4n3yi6FB/4PoyNwX/qX7QaXgn7Gb48t1iB6IKM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jbC5I6eQoGomv8iGJRU8jQqKcwcUpT/e7lp0AiVrdoygvnUoDpQjvVmjGorL3UAXP
	 w1GwO3Kp0D5vrukU9KyYZFT9t245gW6WCyFF1N0+HiO3wjEiGOqU+ePMrs++JmKKeZ
	 W8b3YrHwfkgim0X3khHlwDzSR8867W8+SDC7NVR4=
Message-ID: <5173a464-5f2c-431c-a3e3-16356f8cb873@arm.com>
Date: Fri, 19 Jun 2026 10:47:24 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
To: Ryan Roberts <ryan.roberts@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net
Cc: glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, anshuman.khandual@arm.com,
 kaleshsingh@google.com, 21cnbao@gmail.com, david@kernel.org,
 will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
 <dbc2800f-7880-486f-831c-ec9b6cedc005@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <dbc2800f-7880-486f-831c-ec9b6cedc005@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92881-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ryan.roberts@arm.com,m:ryabinin.a.a@gmail.com,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:anshuman.khandual@arm.com,m:kaleshsingh@google.com,m:21cnbao@gmail.com,m:david@kernel.org,m:will@kernel.org,m:catalin.marinas@arm.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,gmail.com,linux-foundation.org,lwn.net];
	FORGED_SENDER(0.00)[dev.jain@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[google.com,gmail.com,arm.com,googlegroups.com,kvack.org,vger.kernel.org,linuxfoundation.org,lists.infradead.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev.jain@arm.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arm.com:dkim,arm.com:mid,arm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6069F6A3EE8



On 18/06/26 7:18 pm, Ryan Roberts wrote:
> On 12/06/2026 05:44, Dev Jain wrote:
>> Introduce a boot option to tag only at allocation time of the objects. This
>> reduces KASAN MTE overhead, the tradeoff being reduced ability of
>> catching bugs.
>>
>> Now, when a memory object will be freed, it will retain the random tag it
>> had at allocation time. This compromises on catching UAF bugs, till the
>> time the object is not reallocated, at which point it will have a new
>> random tag.
>>
>> Hence, not catching "use-after-free-before-reallocation" and not catching
>> "double-free" will be the compromise for reduced KASAN overhead.
> 
> Does standard KASAN with HW_TAGS really detect double-free? How does it do that?
> I could imagine it testing the tags of memory being freed to see if they are set
> to the poison tag, but that would lead to false positives for the GFP_SKIP_KASAN
> case, surely?

Should have mentioned, the double-free check is only for slab objects, see
__kasan_slab_pre_free. So we won't be able to catch double-free here.

> 
> If I'm right, then the only downgrade this new mode causes is that if
> freed-but-not-yet-reallocated memory is accessed via it's dangling pointer, then
> that bad access is not detected. I think that would be benign in all the cases I
> can think of, so while it would be a problem for a debugging use case, it would
> unlikely be a problem for security enforcement?

Okay so you are saying that we won't catch the bug, but there is no security problem
because the dangling pointer is accessing memory which isn't in use by anyone else.


> 
> Thanks,
> Ryan
> 
> 
>>
>> This is an RFC because we are not clear about the performance benefit.
>>
>> Android folks, please help with testing!
>>
>> ---
>> Applies on Linus master (9716c086c8e8).
>>
>> Dev Jain (2):
>>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>>   kasan: hw_tags: Add boot option to elide free time poisoning
>>
>>  Documentation/dev-tools/kasan.rst |  4 +++
>>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--
>>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>>  3 files changed, 69 insertions(+), 3 deletions(-)
>>
> 


