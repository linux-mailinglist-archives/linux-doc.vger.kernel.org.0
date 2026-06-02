Return-Path: <linux-doc+bounces-90542-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y84qOmr7HmqEbgAAu9opvQ
	(envelope-from <linux-doc+bounces-90542-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 17:48:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C72662FF1F
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 17:48:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=dUPN8UjC;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90542-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-90542-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C02BE303CD13
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 15:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230393F1651;
	Tue,  2 Jun 2026 15:45:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D033EFD34
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 15:45:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780415103; cv=none; b=m5Qj32kvV9YfoyPYD6fd3FUmU1QGbBD3/lGkLE1c4ip5IsrS84fJ57G6TQe/wg3bgdD7j4ChoojJUrrpunbL/+A6SMBQ3xgSlYMSk8TxOPsgh2PIQSFBjQQx7ieseFqjFkiHPfmXfHVCwrQHuiKTJRT6Sp/7n/yYm5ZsOhwugBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780415103; c=relaxed/simple;
	bh=jZS53jNYRwftHvcSkUKQ42Zn65dp7rnKvchXLtDd1S0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ociOXZMqT9knd99tpYJWY+9Pytjfm5rpRwRrNUJstWR2YeTDxu/+FxyqUfyY2pc05RcPiDbldDlOJEjQETlALIps1G65aPJ+ZBMStxhXghtRQ3fIuMUV519W1EKX7jFDb5aTXU/4et6ZeyA1aM1LEo8w1vk6JeppW3/C2Mes4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dUPN8UjC; arc=none smtp.client-ip=95.215.58.178
Message-ID: <185f5699-3797-4300-8c54-bb99fc2a45e0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780415088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f8W9tKC2C6NAekt7xw/i353pEy5xESfITkwO5U4ZKyM=;
	b=dUPN8UjCk9D//WfVj3ZIPIfxri7y0+DyfDfey/e1A6zAzAK6UEAwk60rmDdQMBMczBTVfQ
	eYmfVDCyFQ4DgX5Zvih0NOTAT5JeaRkrMW9fNX91jRnKuwjIyKGOWl6TgNiUuKF1OUIs5y
	itnu61NoSa2Vsg4tbFTDOK/aUcpzzfM=
Date: Tue, 2 Jun 2026 23:44:17 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH mm-unstable v18 11/14] mm/khugepaged: Introduce mTHP
 collapse support
Content-Language: en-US
To: Nico Pache <npache@redhat.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com,
 akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com,
 catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net,
 dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com,
 gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz,
 jackmanb@google.com, jannh@google.com, jglisse@google.com,
 joshua.hahnjy@gmail.com, kas@kernel.org, liam@infradead.org, ljs@kernel.org,
 mathieu.desnoyers@efficios.com, matthew.brost@intel.com,
 mhiramat@kernel.org, mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de,
 rakie.kim@sk.com, raquini@redhat.com, rdunlap@infradead.org,
 richard.weiyang@gmail.com, rientjes@google.com, rostedt@goodmis.org,
 rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com,
 sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com,
 tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz,
 vishal.moola@gmail.com, wangkefeng.wang@huawei.com, will@kernel.org,
 willy@infradead.org, yang@os.amperecomputing.com,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, zokeefe@google.com
References: <20260522150009.121603-12-npache@redhat.com>
 <20260531071845.10875-1-lance.yang@linux.dev>
 <CAA1CXcA+oZmp=cxiC2_EBDxqGX94gAd335d9eFPNv=j_0=og7Q@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <CAA1CXcA+oZmp=cxiC2_EBDxqGX94gAd335d9eFPNv=j_0=og7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-90542-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:npache@redhat.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:aarcange@redhat.com,m:akpm@linux-foundation.org,m:anshuman.khandual@arm.com,m:apopple@nvidia.com,m:baohua@kernel.org,m:baolin.wang@linux.alibaba.com,m:byungchul@sk.com,m:catalin.marinas@arm.com,m:cl@gentwo.org,m:corbet@lwn.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dev.jain@arm.com,m:gourry@gourry.net,m:hannes@cmpxchg.org,m:hughd@google.com,m:jack@suse.cz,m:jackmanb@google.com,m:jannh@google.com,m:jglisse@google.com,m:joshua.hahnjy@gmail.com,m:kas@kernel.org,m:liam@infradead.org,m:ljs@kernel.org,m:mathieu.desnoyers@efficios.com,m:matthew.brost@intel.com,m:mhiramat@kernel.org,m:mhocko@suse.com,m:peterx@redhat.com,m:pfalcato@suse.de,m:rakie.kim@sk.com,m:raquini@redhat.com,m:rdunlap@infradead.org,m:richard.weiyang@gmail.com,m:rientjes@google.com,m:rostedt@goodmis.org,m:rppt@kernel.org,m:ryan.roberts@arm.com,m:shiv
 ankg@amd.com,m:sunnanyong@huawei.com,m:surenb@google.com,m:thomas.hellstrom@linux.intel.com,m:tiwai@suse.de,m:usamaarif642@gmail.com,m:vbabka@suse.cz,m:vishal.moola@gmail.com,m:wangkefeng.wang@huawei.com,m:will@kernel.org,m:willy@infradead.org,m:yang@os.amperecomputing.com,m:ying.huang@linux.alibaba.com,m:ziy@nvidia.com,m:zokeefe@google.com,m:joshuahahnjy@gmail.com,m:richardweiyang@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lance.yang@linux.dev,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,redhat.com,linux-foundation.org,arm.com,nvidia.com,kernel.org,linux.alibaba.com,sk.com,gentwo.org,lwn.net,linux.intel.com,gourry.net,cmpxchg.org,google.com,suse.cz,gmail.com,infradead.org,efficios.com,intel.com,suse.com,suse.de,goodmis.org,amd.com,huawei.com,os.amperecomputing.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lance.yang@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.dev:mid,linux.dev:dkim,linux.dev:from_mime,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C72662FF1F



On 2026/6/2 18:58, Nico Pache wrote:
> On Sun, May 31, 2026 at 1:19 AM Lance Yang <lance.yang@linux.dev> wrote:
>>
>>
>> On Fri, May 22, 2026 at 09:00:06AM -0600, Nico Pache wrote:
>> [...]
>>> @@ -1587,10 +1749,11 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>>>        if (result == SCAN_SUCCEED) {
>>>                /* collapse_huge_page expects the lock to be dropped before calling */
>>>                mmap_read_unlock(mm);
>>> -              result = collapse_huge_page(mm, start_addr, referenced,
>>> -                                          unmapped, cc, HPAGE_PMD_ORDER);
>>> -              /* collapse_huge_page will return with the mmap_lock released */
>>> +              nr_collapsed = mthp_collapse(mm, vma, start_addr, referenced,
>>> +                                           unmapped, cc, enabled_orders);
>>> +              /* mmap_lock was released above, set lock_dropped */
>>>                *lock_dropped = true;
>>> +              result = nr_collapsed ? SCAN_SUCCEED : SCAN_FAIL;
>>
>> Hmm ... don't we lose the allocation-failure result here?
>>
>> Previously collapse_scan_pmd() propagated SCAN_ALLOC_HUGE_PAGE_FAIL from
>> collapse_huge_page(), so khugepaged would call khugepaged_alloc_sleep()
>> in khugepaged_do_scan().
>>
>> Now if allocation fails and nr_collapsed stays 0, we just return
>> SCAN_FAIL. So we won't back off via khugepaged_alloc_sleep() anymore?
> 
> Ok I did the error propagation! I think I handled both of these cases
> you brought up pretty easily.

Thanks.

> However I don't know what to do in the following case: We successfully
> collapsed some portion of the PMD, but during that process, we also
> hit an allocation failure. Is it best to back off entirely? or can we
> treat some forward progress as a sign we can continue trying collapses
> without sleeping.
> 
> Basically, do we prioritize SCAN_ALLOC_HUGE_PAGE_FAIL or the
> successful collapses as the returned value?

Thinking out loud, forward progress should win here, the allocation
failure only matter if we made no progress at all?

> This is what I currently have:
> done:
>      if (collapsed)
>          return SCAN_SUCCEED;
>      if (alloc_failed)
>          return SCAN_ALLOC_HUGE_PAGE_FAIL;

I'd go with this ordering :)

Cheers, Lance

