Return-Path: <linux-doc+bounces-84791-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8POSBtB+72lKBwEAu9opvQ
	(envelope-from <linux-doc+bounces-84791-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 17:20:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC8F4750F4
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 17:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6129D30231F9
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 15:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9ED73375AE;
	Mon, 27 Apr 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lOr3L0Tr"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5E6335571
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302877; cv=none; b=acJmjDgx+WMlSGw3MzdqpsT6WXSClpdGRXGSH7gakCRy3mwbGqwb+dtyUwlhSya8bTLHAa4nkhmj6lkm080XAxHDz3newdXT46yP5wt43kqZewS3qn5NdykVmVVk4DeQpKllYjqfHrFYmWNBpE0WnwXAIk8q1wbOJvdkqcmQaQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302877; c=relaxed/simple;
	bh=NVDk0P+CGmZ2vwxtn0eqjXzzPrGTerfSTxm0fU1Ip0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9hQK70nh7fd+UB7ZPMYoWwiY5eulYdbaY++3eYB/dGUOYvH/S/sA3A4IPVbcqosLp83fG+RS4u6hSXnqRNoWFmHIzyGfAH165nKYygaOa0vxH+/2gIANojvsCmKLdiYyybdsl59USUuxqELnrJhwUpgoAV3uM0vI6FObNtOjvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lOr3L0Tr; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <b2c0fedc-0641-4c51-9426-879c6878a2e5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777302864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UgDbcmIJGZlRjzn8XIrNR1a7hkzoZAPPy0uySZ/X8o=;
	b=lOr3L0TrmrYswkMnhmVGOjNxRAxxODxJ+wIm/s2Pa5435yehAW/WXL7l7sreR9iNnPs28P
	xtQ8QSqfCzL3to5dmce73+RBVowv255ePLqtsPGWDWy9Ome+rt/c7JeckpVBkXQ6ZNcjW9
	vxZ4jiONxJWFr2Up/G+bVKbnvQlvAVI=
Date: Mon, 27 Apr 2026 23:14:11 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/4] mm/memory-failure: report MF_MSG_KERNEL for
 reserved pages
Content-Language: en-US
To: Breno Leitao <leitao@debian.org>
Cc: linmiaohe@huawei.com, nao.horiguchi@gmail.com, akpm@linux-foundation.org,
 corbet@lwn.net, skhan@linuxfoundation.org, david@kernel.org, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@meta.com
References: <20260424-ecc_panic-v5-1-a35f4b50425c@debian.org>
 <20260427123330.92847-1-lance.yang@linux.dev> <ae92WpsjxQ71BE9Q@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <ae92WpsjxQ71BE9Q@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: BCC8F4750F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84791-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[huawei.com,gmail.com,linux-foundation.org,lwn.net,linuxfoundation.org,kernel.org,oracle.com,google.com,suse.com,kvack.org,vger.kernel.org,meta.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lance.yang@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,huawei.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]



On 2026/4/27 22:45, Breno Leitao wrote:
> On Mon, Apr 27, 2026 at 08:33:30PM +0800, Lance Yang wrote:
>>
>> On Fri, Apr 24, 2026 at 05:23:59AM -0700, Breno Leitao wrote:
>>> When get_hwpoison_page() returns a negative value, distinguish
>>> reserved pages from other failure cases by reporting MF_MSG_KERNEL
>>> instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
>>> and should be classified accordingly for proper handling.
>>>
>>> Acked-by: Miaohe Lin <linmiaohe@huawei.com>
>>> Signed-off-by: Breno Leitao <leitao@debian.org>
>>> ---
>>> mm/memory-failure.c | 11 ++++++++++-
>>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
>>> index ee42d43613097..7b67e43dafbd1 100644
>>> --- a/mm/memory-failure.c
>>> +++ b/mm/memory-failure.c
>>> @@ -2432,7 +2432,16 @@ int memory_failure(unsigned long pfn, int flags)
>>> 		}
>>> 		goto unlock_mutex;
>>> 	} else if (res < 0) {
>>> -		res = action_result(pfn, MF_MSG_GET_HWPOISON, MF_IGNORED);
>>> +		/*
>>> +		 * PageReserved is stable here: reserved pages have
>>> +		 * PG_reserved set at boot or by drivers and are never
>>> +		 * freed through the page allocator.
>>> +		 */
>>
>> Not necessarily. PG_reserved is not a permanent lifetime property for
>> every page that has carried it.
>>
>> page-flags.h says early reserved pages may later have PG_reserved
>> cleared and then be given to the page allocator :)
>>
>> At least some drivers also clear PG_reserved when releasing pages they
>> marked reserved.
>>
>> Would it be clearer to say that pages with PG_reserved set are not
>> currently managed by the page allocator, rather than saying reserved
>> pages are never freed through the page allocator?
> 
> Would a comment like the following look better?
> 
>    /*
>     * Pages with PG_reserved set are not currently managed by the
>     * page allocator (memblock-reserved memory, driver reservations,
>     * etc.), so classify them as kernel-owned for reporting.
>     */
>    if (PageReserved(p))
>        res = action_result(pfn, MF_MSG_KERNEL, MF_IGNORED);

Works for me, thanks.

