Return-Path: <linux-doc+bounces-90359-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBOYHqOvHWpfdAkAu9opvQ
	(envelope-from <linux-doc+bounces-90359-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 18:13:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD3C622636
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 18:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 516D6302A42A
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 16:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BF22E173B;
	Mon,  1 Jun 2026 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YqWRvpfA"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F742DA76C
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330101; cv=none; b=HBeddtGcIKhG7UczMnm65sbsU0hoSxTb4iVGeXhPAA85weI9Ybnx4kb3cI+G+/dBnR8M20wJZMDG46DEjhCGy92V2T7a+SNQaeZROrSQeCm5lzESAXzP3aQ39LLrKC62Y9eX7wNZrCEm4F3YpVIPtpwoqlkGWbke9DIrhTpb4D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330101; c=relaxed/simple;
	bh=2Yekb9uLI7AP2TYXVKk8XIvri4BESEZ3tRy6fbBZKOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ErE13rkn1Ue0n7xkb9R8SBi5XE2N5tCAkkoPhuU3MTaPLMqKcIMGBUoi6tjbbIuhwr7LQsBC8vVLgiRkGDjZCnonnSV3MbA3VeSCIBToVqnp306fbYbkMeOmwDR+zgwe6tI6rYokZSb/oDSLkLzII0a8op8vyidL+08qVls11Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YqWRvpfA; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <76ff7922-bf54-472c-a628-ee191aeaf149@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780330094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hE1QzaSPeeuEtKpkpB1CtsBNbDEAW/Bexb+NhfT6llo=;
	b=YqWRvpfAdwXbefovQ0O62XdJwQX8LFrg0/Hbwn0Ad6X8u9tjBbXyyjT6U3njZ6qNiRyyr2
	KLEf2hOg1aLB/Q9NfBld4gDYUzT1d2AE5+l2FSyu7/Z7nQ5wx7p3ut3J2a0TbCXeJSJFCh
	zR7P6S0aifO3EZK1awre2/FIp97secg=
Date: Tue, 2 Jun 2026 00:07:24 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH mm-unstable v18 06/14] mm/khugepaged: generalize
 collapse_huge_page for mTHP collapse
Content-Language: en-US
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Nico Pache <npache@redhat.com>
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
References: <2024af56-5e99-4799-a586-e9ba756cecb9@kernel.org>
 <20260601032804.96122-1-lance.yang@linux.dev>
 <f5d38f64-ab92-496d-afd3-29ccc17fec2b@kernel.org>
 <616de1a8-1cfd-40b8-b04f-7b324be40bfd@linux.dev>
 <6b11bf0a-769c-4ef2-ac6f-2af38200a6bc@kernel.org>
 <baa0a462-46e0-44ab-b583-c722ad253afe@linux.dev>
 <06d9b665-945f-4967-9ed9-b06514478996@kernel.org>
 <CAA1CXcAeEGOsqp-ywAQ7GMYQzXEeco-rUxUkk2hEF69HybC4=w@mail.gmail.com>
 <0bb49c47-8c41-478c-847e-b9154c75e59c@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <0bb49c47-8c41-478c-847e-b9154c75e59c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-90359-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1DD3C622636
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/6/1 23:05, David Hildenbrand (Arm) wrote:
> On 6/1/26 17:00, Nico Pache wrote:
>> On Mon, Jun 1, 2026 at 5:14 AM David Hildenbrand (Arm) <david@kernel.org> wrote:
>>>
>>> On 6/1/26 12:47, Lance Yang wrote:
>>>>
>>>>
>>>>
>>>> Ah, cool! __folio_mark_uptodate() already does the job :P
>>>>
>>>> So yeah, no extra smp_wmb() needed here!
>>>
>>> Yeah. BTW, I think we'd need a spin_lock_nested(), so @Nico, treat my code as a
>>> draft.
>>
>> Okay, I read the above and did some investigating.
>>
>> I will try to implement and verify the changes you suggested :)
>>
>> Or an even crazier idea... what if we ensure MIPS checks for PMD_none
>> before walking a PTE table?
> 
> But how would they update the cache then correctly?
> 
> I'm too non-MIPS to know the answer :)

Right, that's my concern as well ...

If MIPS sees pmd_none(), it has no PTE table to walk, so it also has
no way to do the cache update it wanted to do, I guess :)

But, the PTE table is not really gone there. khugepaged only cleared
the PMD temporarily while still using the old PTE table through _pmd.

So I'd go with David's suggestion:

"
Best to make sure the page table is already installed when updating
the entries.
"

Cheers, Lance

