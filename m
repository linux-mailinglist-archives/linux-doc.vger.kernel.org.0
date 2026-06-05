Return-Path: <linux-doc+bounces-91055-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WMvsJ+GQImoZaQEAu9opvQ
	(envelope-from <linux-doc+bounces-91055-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 11:03:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 87798646AAC
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 11:03:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=dhh7PXSj;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91055-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-91055-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 013F03014358
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 08:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF003D9695;
	Fri,  5 Jun 2026 08:59:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF924ADD84
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 08:59:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649980; cv=none; b=dGnK9E4DHmayvWgWck7BLxRk8kUE2caebFhumNmza7XSGTqbTV+fyTLi5BE8mGQJrk2+jCCv8ZVHpR+4Bnhr7bnx5bqhBrVXYTxZfPyyeykRQzzj8xhHJ70ecsDCrRSX3W7DS7ml7l70Pj4+wZd8TzxKuh8Gro/bMHp/g+djANw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649980; c=relaxed/simple;
	bh=0fl2zgVHbDzEtIsUlvXgrrdVHskXStrBxpd18D7t3AA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P6Mjjcy3OKmwao045kifBQk3IQxrj7WX25Ck3bEtCIN0CWiNSEK4eusvxnWOImz/Rx6PPTdD8JREqcBnRPMN/efMYFSgP+1uCCJKL5o/0b42Uujn82kGOmJpRUfr4AQWnE9bRdJEI571q9FG2cSjS+2LCXRa/8Av3+Bg+z3bjDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dhh7PXSj; arc=none smtp.client-ip=95.215.58.189
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780649974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aph3F0yH35JYxECybQiTrc4aeTySkKR0krHjxKePy6w=;
	b=dhh7PXSjnqOSGRZLH5vbiPzF+QSQXB5XerF/69shhrDMybXrN9ejD+mg7fsY598xDL7TOB
	PkwYWYJ4hhvFk7dgkSszqLeqJbpYkzbjuX6JInJZXdm5weNWfisyyy7lsvwt3SUOK5R4o8
	/vsuaca21affbDpb0uGv8xRTZRPq4Ck=
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org,
	david@kernel.org,
	npache@redhat.com
Cc: lance.yang@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	aarcange@redhat.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	byungchul@sk.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jack@suse.cz,
	jackmanb@google.com,
	jannh@google.com,
	jglisse@google.com,
	joshua.hahnjy@gmail.com,
	kas@kernel.org,
	liam@infradead.org,
	mathieu.desnoyers@efficios.com,
	matthew.brost@intel.com,
	mhiramat@kernel.org,
	mhocko@suse.com,
	peterx@redhat.com,
	pfalcato@suse.de,
	rakie.kim@sk.com,
	raquini@redhat.com,
	rdunlap@infradead.org,
	richard.weiyang@gmail.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shivankg@amd.com,
	sunnanyong@huawei.com,
	surenb@google.com,
	thomas.hellstrom@linux.intel.com,
	tiwai@suse.de,
	usamaarif642@gmail.com,
	vbabka@suse.cz,
	vishal.moola@gmail.com,
	wangkefeng.wang@huawei.com,
	will@kernel.org,
	willy@infradead.org,
	yang@os.amperecomputing.com,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	zokeefe@google.com,
	usama.arif@linux.dev
Subject: Re: [PATCH mm-unstable v18 06/14] mm/khugepaged: generalize collapse_huge_page for mTHP collapse
Date: Fri,  5 Jun 2026 16:59:03 +0800
Message-Id: <20260605085903.77186-1-lance.yang@linux.dev>
In-Reply-To: <aiJ90SWqXvwN9dNT@lucifer>
References: <aiJ90SWqXvwN9dNT@lucifer>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:david@kernel.org,m:npache@redhat.com,m:lance.yang@linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:aarcange@redhat.com,m:akpm@linux-foundation.org,m:anshuman.khandual@arm.com,m:apopple@nvidia.com,m:baohua@kernel.org,m:baolin.wang@linux.alibaba.com,m:byungchul@sk.com,m:catalin.marinas@arm.com,m:cl@gentwo.org,m:corbet@lwn.net,m:dave.hansen@linux.intel.com,m:dev.jain@arm.com,m:gourry@gourry.net,m:hannes@cmpxchg.org,m:hughd@google.com,m:jack@suse.cz,m:jackmanb@google.com,m:jannh@google.com,m:jglisse@google.com,m:joshua.hahnjy@gmail.com,m:kas@kernel.org,m:liam@infradead.org,m:mathieu.desnoyers@efficios.com,m:matthew.brost@intel.com,m:mhiramat@kernel.org,m:mhocko@suse.com,m:peterx@redhat.com,m:pfalcato@suse.de,m:rakie.kim@sk.com,m:raquini@redhat.com,m:rdunlap@infradead.org,m:richard.weiyang@gmail.com,m:rientjes@google.com,m:rostedt@goodmis.org,m:rppt@kernel.org,m:ryan
 .roberts@arm.com,m:shivankg@amd.com,m:sunnanyong@huawei.com,m:surenb@google.com,m:thomas.hellstrom@linux.intel.com,m:tiwai@suse.de,m:usamaarif642@gmail.com,m:vbabka@suse.cz,m:vishal.moola@gmail.com,m:wangkefeng.wang@huawei.com,m:will@kernel.org,m:willy@infradead.org,m:yang@os.amperecomputing.com,m:ying.huang@linux.alibaba.com,m:ziy@nvidia.com,m:zokeefe@google.com,m:usama.arif@linux.dev,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,vger.kernel.org,kvack.org,redhat.com,linux-foundation.org,arm.com,nvidia.com,kernel.org,linux.alibaba.com,sk.com,gentwo.org,lwn.net,linux.intel.com,gourry.net,cmpxchg.org,google.com,suse.cz,gmail.com,infradead.org,efficios.com,intel.com,suse.com,suse.de,goodmis.org,amd.com,huawei.com,os.amperecomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91055-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lance.yang@linux.dev,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lance.yang@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCPT_COUNT_GT_50(0.00)[60];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.dev:mid,linux.dev:from_mime,linux.dev:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87798646AAC


On Fri, Jun 05, 2026 at 09:07:23AM +0100, Lorenzo Stoakes wrote:
>On Fri, Jun 05, 2026 at 09:18:27AM +0200, David Hildenbrand (Arm) wrote:
>> On 6/4/26 19:04, Nico Pache wrote:
>> > On Mon, Jun 1, 2026 at 9:00 AM Nico Pache <npache@redhat.com> wrote:
>> >>
>> >> On Mon, Jun 1, 2026 at 5:14 AM David Hildenbrand (Arm) <david@kernel.org> wrote:
>> >>>
>> >>>
>> >>> Yeah. BTW, I think we'd need a spin_lock_nested(), so @Nico, treat my code as a
>> >>> draft.
>> >>
>> >> Okay, I read the above and did some investigating.
>> >>
>> >> I will try to implement and verify the changes you suggested :)
>> >
>> > I've implemented something slightly different actually and I *think* its better!
>> >
>> > } else {
>> >        /* this is map_anon_folio_pte_nopf with no mmu update */
>> >         __map_anon_folio_pte_nopf(folio, pte, vma, start_addr,
>> >                       /*uffd_wp=*/ false);
>> >        smp_wmb();
>> >         pmd_populate(mm, pmd, pmd_pgtable(_pmd));
>> >         /*
>> >          * Some architectures (e.g. MIPS) walk the live page table in
>> >          * their implementation. update_mmu_cache_range() must be called
>> >          * with a valid page table hierarchy and the PTE lock held.
>> >          * Acquire it nested inside pmd_ptl when they are distinct locks.
>> >          */
>> >         if (pte_ptl != pmd_ptl)
>> >             spin_lock_nested(pte_ptl, SINGLE_DEPTH_NESTING);
>> >         update_mmu_cache_range(NULL, vma, start_addr, pte, nr_pages);
>> >         if (pte_ptl != pmd_ptl)
>> >             spin_unlock(pte_ptl);
>> >     }
>> > spin_unlock(pmd_ptl);
>> >
>> > The logic here is that when the PMD becomes visible, PTEs are already
>> > populated (no possibility of spurious faults on local CPU)
>> >
>> > the SMP_WMB makes sure of the above
>
>THe locks prevent those 'spurious' (really: incorrect) faults anyway so I don't
>think this is necessary.
>
>> >
>> > And the pmd is installed with the pte and pmd lock both held through
>> > the mmu_cache update.
>> >
>> > This follows the conventions used in pmd_install() and clears the
>> > potential for local CPU faults hitting cleared PTE entries.
>>
>> After the pmdp_collapse_flush() we'd be getting CPU faults due to the cleared
>> PMD already? So the case here is rather different.

The issue I was worried about: update_mmu_cache_range() can re-walk
vma->vm_mm while the PTE page table is still not reachable through the
PMD. And, yeah, that assumption is ugly, but it is what it is, and there
maybe be similar code elsewhere ...

So the ordering we need is "the PMD points to the PTE page table from
_pmd before update_mmu_cache_range()", not "new PTEs before PMD".

Those PTEs are cleared, but we hold the PTL, so nobody else can install
anything there :)

So David's original suggestion looks enough to me:

if (pte_ptl != pmd_ptl)
        spin_lock_nested(pte_ptl, SINGLE_DEPTH_NESTING);

pmd_populate();
map_anon_folio_pte_nopf();

if (pte_ptl != pmd_ptl)
        spin_unlock(pte_ptl);

>Yeah conceptually the code above is problematic because you immediately make the
>PTE available right at the point you populate, so taking a PTE lock after that
>is rather shutting the stable door after the horse has bolted.
>
>Doing it this way is not a good idea in any case because we're adding
>complexity, an extra function and an open-coded cache maintenance call for
>really no benefit.
>
>I asked Nico to abstract the anon folio mapping stuff explicitly so we could
>avoid this sort of duplication so let's not roll that back :)
>
>So again, I think going with the original suggestion (with an updated comment)
>is the right thing to do.
>
>
>Anyway, an aside But in practice we can't have page faults here right? The VMA is:
>
>- Ensured to span at least the PMD range (this isn't immediately obvious in the
>  code)
>- VMA write locked (mmap write lock held)
>
>And we hold the anon_vma lock so no rmap walkers can walk the page tables here
>either.
>
>So I actually wonder, given that, whether we need the PTE PTL at all.

I'd keep it. Cheap, and lets us sleep better at night :P

>But.
>
>At this stage it'll almost certainly be an owned exclusive cache line so it's
>very low cost to do it, and it means we honour the update_mmu_cache_range()
>contract.
>
>And it also makes it clear that we're gating changes on the PTE being
>untouchable so any future stuff that maybe changes some of these rules doesn't
>get caught out.
>
>So probably worth keeping.

Yes!

Cheers, Lance

>>
>> --
>> Cheers,
>>
>> David
>
>Thanks, Lorenzo
>

