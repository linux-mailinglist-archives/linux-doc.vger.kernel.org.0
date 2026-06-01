Return-Path: <linux-doc+bounces-90204-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ExkH5nmHGrKTwkAu9opvQ
	(envelope-from <linux-doc+bounces-90204-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 03:55:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 052CC618B35
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 03:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C4FC3003628
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 01:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855C7202997;
	Mon,  1 Jun 2026 01:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GnCTJd3B"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016C921257E
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 01:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780278932; cv=none; b=sRjfGCQJ+IJf0h+s69jgMoteNaLmWlg1odnccCuAmAfose7S/c9vQ/qME+E0uhTmeAbSc39fm5K6D3DhL2PoLbrDqp44TrkBfFHnZyioj9CcMNDLZWgV9fnAxunKpJeQGdA105G/gPl199wuN674uWVjr3oJXKSu/NtTvZ4EkeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780278932; c=relaxed/simple;
	bh=j4uRY4vfme7Hj8zI1X26nZmyC//UW5FolYkUWvVXqhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OAEXEyR8zeD7T0MfCGQzJwcuSYVl9BIGJkGsqzFVTTd1prnGjpsTMoi2P5PMkG+5RHY+qF123hlb7+NA7tlFwWq+HVL6V1LQl7Lvs+fjKKZCq89vCDsEfjAD0OMg1t+IxB5pZU7UnB51wxK6zWS8pslL/KbqFcJh5KfMslqo7rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GnCTJd3B; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <bb855309-422b-418d-ae34-54969e01375f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780278918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uQCbMRkdqdDT9GLUSMLXaeh0gg478vZBNxmXwoTOz6U=;
	b=GnCTJd3BSfUClP+EsrGgz2anJizI1lNps8XDR/4ezY3+8U5Tb14abeAfZv2bzXchAihLYN
	fo8bwJf0yz6X2MYCySFso5RSnCLFQzVrw/qGsL4jzIsdFzY9+5xj6RAlNCwd23SGSJ8xRa
	aMauQxDjTgID35xkiQSfsyXbn9R29L4=
Date: Mon, 1 Jun 2026 09:53:28 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH mm-unstable v18 12/14] mm/khugepaged: avoid unnecessary
 mTHP collapse attempts
Content-Language: en-US
To: "David Hildenbrand (Arm)" <david@kernel.org>, npache@redhat.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com,
 akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com,
 catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net,
 dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net,
 hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com,
 jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com,
 kas@kernel.org, liam@infradead.org, ljs@kernel.org,
 mathieu.desnoyers@efficios.com, matthew.brost@intel.com,
 mhiramat@kernel.org, mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de,
 rakie.kim@sk.com, raquini@redhat.com, rdunlap@infradead.org,
 richard.weiyang@gmail.com, rientjes@google.com, rostedt@goodmis.org,
 rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com,
 sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com,
 tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz,
 vishal.moola@gmail.com, wangkefeng.wang@huawei.com, will@kernel.org,
 willy@infradead.org, yang@os.amperecomputing.com,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, zokeefe@google.com,
 usama.arif@linux.dev
References: <20260522150009.121603-13-npache@redhat.com>
 <20260531073102.20318-1-lance.yang@linux.dev>
 <65e201dd-10d6-43f6-8758-0fc313158fe7@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <65e201dd-10d6-43f6-8758-0fc313158fe7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,redhat.com,linux-foundation.org,arm.com,nvidia.com,kernel.org,linux.alibaba.com,sk.com,gentwo.org,lwn.net,linux.intel.com,gourry.net,cmpxchg.org,google.com,suse.cz,gmail.com,infradead.org,efficios.com,intel.com,suse.com,suse.de,goodmis.org,amd.com,huawei.com,os.amperecomputing.com,linux.dev];
	TAGGED_FROM(0.00)[bounces-90204-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lance.yang@linux.dev,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:mid,linux.dev:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 052CC618B35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/6/1 04:02, David Hildenbrand (Arm) wrote:
> On 5/31/26 09:31, Lance Yang wrote:
>>
>> On Fri, May 22, 2026 at 09:00:07AM -0600, Nico Pache wrote:
>>> There are cases where, if an attempted collapse fails, all subsequent
>>> orders are guaranteed to also fail. Avoid these collapse attempts by
>>> bailing out early.
>>>
>>> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
>>> Acked-by: Usama Arif <usama.arif@linux.dev>
>>> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>>> Signed-off-by: Nico Pache <npache@redhat.com>
>>> ---
>>> mm/khugepaged.c | 24 +++++++++++++++++++++++-
>>> 1 file changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index d3d7db8be26c..15b7298bc225 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -1535,9 +1535,31 @@ static int mthp_collapse(struct mm_struct *mm, struct vm_area_struct *vma,
>>> 			collapse_address = address + offset * PAGE_SIZE;
>>> 			ret = collapse_huge_page(mm, collapse_address, referenced,
>>> 						 unmapped, cc, order);
>>> -			if (ret == SCAN_SUCCEED) {
>>> +
>>> +			switch (ret) {
>>> +			/* Cases where we continue to next collapse candidate */
>>> +			case SCAN_SUCCEED:
>>> 				collapsed += nr_ptes;
>>> +				fallthrough;
>>> +			case SCAN_PTE_MAPPED_HUGEPAGE:
>>> 				continue;
>>> +			/* Cases where lower orders might still succeed */
>>> +			case SCAN_LACK_REFERENCED_PAGE:
>>> +			case SCAN_EXCEED_NONE_PTE:
>>> +			case SCAN_EXCEED_SWAP_PTE:
>>> +			case SCAN_EXCEED_SHARED_PTE:
>>> +			case SCAN_PAGE_LOCK:
>>> +			case SCAN_PAGE_COUNT:
>>> +			case SCAN_PAGE_NULL:
>>> +			case SCAN_DEL_PAGE_LRU:
>>> +			case SCAN_PTE_NON_PRESENT:
>>> +			case SCAN_PTE_UFFD_WP:
>>> +			case SCAN_ALLOC_HUGE_PAGE_FAIL:
>>
>> Nit: shouldn't SCAN_CGROUP_CHARGE_FAIL go with SCAN_ALLOC_HUGE_PAGE_FAIL
>> here?
>>
>> If charging the current order fails, a smaller order might still fit :)
> 
> I think the reasoning was here, that if we are already that close to our mem
> limit, we should just give up instead of trying to squeeze it in .. :)

Fair point. Just a nit, nevermind :)

