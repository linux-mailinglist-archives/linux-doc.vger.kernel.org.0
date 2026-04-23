Return-Path: <linux-doc+bounces-84257-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCwDLoB+6WlhbQIAu9opvQ
	(envelope-from <linux-doc+bounces-84257-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2026 04:05:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6C044C365
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2026 04:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 116943016935
	for <lists+linux-doc@lfdr.de>; Thu, 23 Apr 2026 02:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F67221D00A;
	Thu, 23 Apr 2026 02:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Vv/FDFU1"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BF01E89C;
	Thu, 23 Apr 2026 02:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776909949; cv=none; b=hNigWBNR+TI6Y1CfUX6fMkQZfzQBVIvyuIykWuUDAUsgFhln7xqEJ0kiADjvoiOtoOCf7RPPui++jVRwNLCcq2lWDwKW3gk4ZOAnTTy9DvZ1EgfnlGIm1stetwCUSiGiWeL68N6p+doiFTzMLdpfu/Uhy1JcxJXwYtTbaprrr0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776909949; c=relaxed/simple;
	bh=T6bLXk43eUeyWzPWwibRN2p18/vBew15Yzh5hqfUYp0=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=OxAYDVDhVSnonIgsEGVZdpveX/TAFr0gNWetqTDbLyWPgybJEybRchVp5+8IbYSTUunRpBLZOiF7lRo/3g0idehRU9a5kaN/i0DDU37bFmdHNxSrU6wW83uhU9vi+ISV8cd3YrTzWFTaAN0MTdZ/DHn423MyN7X1kMn51tjRO18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Vv/FDFU1; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Jnsom+L1FSLBtHHuwYUTLSZW44zxnrid8A0mijOuEuE=;
	b=Vv/FDFU1jBbJtskweEPXJ9jFdZNcPdD7wqEUubS4Zt54nkD5PEkJ3la3xRd7OlbPri+x6JKmv
	XbyQGZ85+ZsYteZFIqSCEqlgyBPNGejvN4JlwPnC/jHpwQAmhdw6foil6zf7ShelexpN7HCENnn
	YmJ4/6CAs47XIXHV1bZKglw=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4g1K5d5pD6zpStt;
	Thu, 23 Apr 2026 09:59:17 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id A947640571;
	Thu, 23 Apr 2026 10:05:43 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Apr 2026 10:05:43 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Apr 2026 10:05:42 +0800
Subject: Re: [PATCH v4 3/3] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
To: Breno Leitao <leitao@debian.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <kernel-team@meta.com>, Naoya Horiguchi
	<nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam
 R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
 <20260415-ecc_panic-v4-3-2d0277f8f601@debian.org>
 <7b4a6659-e2e5-5e63-2952-c7a840ffcdec@huawei.com>
 <aejnmh3xlHsuKfP3@gmail.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <4cca0bb0-8b7e-cd87-4f3b-627e6fd3f549@huawei.com>
Date: Thu, 23 Apr 2026 10:05:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aejnmh3xlHsuKfP3@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq500010.china.huawei.com (7.202.194.235)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84257-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[kvack.org,vger.kernel.org,meta.com,gmail.com,linux-foundation.org,lwn.net,linuxfoundation.org,kernel.org,oracle.com,google.com,suse.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:dkim,huawei.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmiaohe@huawei.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC6C044C365
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/4/22 23:23, Breno Leitao wrote:
> On Wed, Apr 22, 2026 at 11:43:16AM +0800, Miaohe Lin wrote:
>> On 2026/4/15 20:55, Breno Leitao wrote:
>>> Add documentation for the new vm.panic_on_unrecoverable_memory_failure
>>> sysctl, describing the three categories of failures that trigger a
>>> panic and noting which kernel page types are not yet covered.
>>>
>>> Signed-off-by: Breno Leitao <leitao@debian.org>
>>> ---
>>>  Documentation/admin-guide/sysctl/vm.rst | 37 +++++++++++++++++++++++++++++++++
>>>  1 file changed, 37 insertions(+)
>>>
>>> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
>>> index 97e12359775c9..592ce9ec38c4b 100644
>>> --- a/Documentation/admin-guide/sysctl/vm.rst
>>> +++ b/Documentation/admin-guide/sysctl/vm.rst
>>> @@ -67,6 +67,7 @@ Currently, these files are in /proc/sys/vm:
>>>  - page-cluster
>>>  - page_lock_unfairness
>>>  - panic_on_oom
>>> +- panic_on_unrecoverable_memory_failure
>>>  - percpu_pagelist_high_fraction
>>>  - stat_interval
>>>  - stat_refresh
>>> @@ -925,6 +926,42 @@ panic_on_oom=2+kdump gives you very strong tool to investigate
>>>  why oom happens. You can get snapshot.
>>>  
>>>  
>>> +panic_on_unrecoverable_memory_failure
>>> +======================================
>>> +
>>> +When a hardware memory error (e.g. multi-bit ECC) hits a kernel page
>>> +that cannot be recovered by the memory failure handler, the default
>>> +behaviour is to ignore the error and continue operation.  This is
>>> +dangerous because the corrupted data remains accessible to the kernel,
>>> +risking silent data corruption or a delayed crash when the poisoned
>>> +memory is next accessed.
>>> +
>>> +When enabled, this sysctl triggers a panic on three categories of
>>> +unrecoverable failures: reserved kernel pages, non-buddy kernel pages
>>> +with zero refcount (e.g. tail pages of high-order allocations), and
>>> +pages whose state cannot be classified as recoverable.
>>> +
>>> +Note that some kernel page types — such as slab objects, vmalloc
>>> +allocations, kernel stacks, and page tables — share a failure path
>>> +with transient refcount races and are not currently covered by this
>>> +option. I.e, do not panic when not confident of the page status.
>>> +
>>> +For many environments it is preferable to panic immediately with a clean
>>> +crash dump that captures the original error context, rather than to
>>> +continue and face a random crash later whose cause is difficult to
>>> +diagnose.
>>
>> Should we add some userful cases to show the real-world application scenarios?
> 
> Yes, good idea. What about something like:
> 
> Use cases
> ---------
> 
> This option is most useful in environments where unattributed crashes
> are expensive to debug or where data integrity must take precedence
> over availability:
> 
> * Large fleets, where multi-bit ECC errors on kernel pages are observed
>   regularly and post-mortem analysis of an unrelated downstream crash
>   (often seconds to minutes after the original error) consumes
>   significant engineering effort.
> 
> * Systems configured with kdump, where panicking at the moment of the
>   hardware error produces a vmcore that still contains the faulting
>   address, the affected page state, and the originating MCE/GHES
>   record — context that is typically lost by the time a delayed crash
>   occurs.
> 
> * High-availability clusters that rely on fast, deterministic node
>   failure for failover, and prefer an immediate panic over silent data
>   corruption propagating to replicas or persistent storage.

This would be really helpful. Thanks!


