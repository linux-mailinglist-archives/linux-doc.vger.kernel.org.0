Return-Path: <linux-doc+bounces-91050-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LEwCEQeHImroZgEAu9opvQ
	(envelope-from <linux-doc+bounces-91050-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 10:21:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 401DB646592
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 10:21:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jeQED94S;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91050-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91050-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C786F302EB44
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 08:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B6F49251F;
	Fri,  5 Jun 2026 08:07:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15F949250D;
	Fri,  5 Jun 2026 08:07:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646860; cv=none; b=jWmiWUsC42j1DyzwvJ0E9E9spDvIaLH1AIDSu9nMHXKwTYpw6BozJ3+ENr2hop2Ro+Oc+y2hQ18/W8/DcL3d/XIvvwYaGLFf9WzjinDoh2MLm1txHdvSATddkoMYm0aeeov1CoHn6Fr4sRajRVptuI+fCZhEv/W8ZCwhv1TuGlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646860; c=relaxed/simple;
	bh=W7Zo51xznY0+tYZ/itFryJZD+befatevIdxLYSbev3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9FvUoH6L6jYSyFf4NdnLVjfqLJ2Bx1L+pCRd75Ffk/zWZW0EZ0CeWbIfmNIvJX6A2LKQAJYCnisN3AK0SeVC7d5Jg/iSEbhgu/0xmysJuQfM2Yca7SUFczZo5f25UANJFlZbXONWT/zsCrTziRU1Vky0yCIBlXipg63PpmYW8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jeQED94S; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C0C1F00893;
	Fri,  5 Jun 2026 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780646859;
	bh=w8kRAMlknVLQLfZAIgetzKT8WiVn11imE2IVzaLKdwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jeQED94Sid+eP6XYPiyQtS/9tDsTpbhHbsga0f0MGCMFWycZ7TBodq4q+ofyjtNWt
	 H3No+jBLfDjAB5Ml2G70qjsUCV0W7udUJgt+kLD8snZc39i1tEwYd1B8iqJUcr6wjB
	 BFMKkt07IDVyDvfv1Fkh/f6vvFvgi7gIk45O9dpw2Xi02owgCzTGsTJAqT4AT/ACoh
	 VsiRS9K/NmtwqmtFMa9YXGBH/J51PYI1vDWWghVE+fUR6gp/ejP9sE1TGMA7cPggks
	 Zc897pF/K1divsMisGWoHQ0ECpuFZxiTed3uMJyY6bFT9WyPP3LGYuTmlG3uNnndVx
	 rruLEKYp4cQ7w==
Date: Fri, 5 Jun 2026 09:07:23 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Nico Pache <npache@redhat.com>, Lance Yang <lance.yang@linux.dev>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, akpm@linux-foundation.org, 
	anshuman.khandual@arm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, byungchul@sk.com, catalin.marinas@arm.com, cl@gentwo.org, 
	corbet@lwn.net, dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	liam@infradead.org, mathieu.desnoyers@efficios.com, matthew.brost@intel.com, 
	mhiramat@kernel.org, mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, 
	rakie.kim@sk.com, raquini@redhat.com, rdunlap@infradead.org, 
	richard.weiyang@gmail.com, rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, surenb@google.com, 
	thomas.hellstrom@linux.intel.com, tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, 
	vishal.moola@gmail.com, wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, zokeefe@google.com, 
	usama.arif@linux.dev
Subject: Re: [PATCH mm-unstable v18 06/14] mm/khugepaged: generalize
 collapse_huge_page for mTHP collapse
Message-ID: <aiJ90SWqXvwN9dNT@lucifer>
References: <2024af56-5e99-4799-a586-e9ba756cecb9@kernel.org>
 <20260601032804.96122-1-lance.yang@linux.dev>
 <f5d38f64-ab92-496d-afd3-29ccc17fec2b@kernel.org>
 <616de1a8-1cfd-40b8-b04f-7b324be40bfd@linux.dev>
 <6b11bf0a-769c-4ef2-ac6f-2af38200a6bc@kernel.org>
 <baa0a462-46e0-44ab-b583-c722ad253afe@linux.dev>
 <06d9b665-945f-4967-9ed9-b06514478996@kernel.org>
 <CAA1CXcAeEGOsqp-ywAQ7GMYQzXEeco-rUxUkk2hEF69HybC4=w@mail.gmail.com>
 <CAA1CXcBSPVG4CJFCBDvbuodcJ_7eXoDQTpK0ZN0HEhkDPi-DEw@mail.gmail.com>
 <0ef96c28-9e6c-4d04-90ae-ac43c81d465d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ef96c28-9e6c-4d04-90ae-ac43c81d465d@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91050-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:npache@redhat.com,m:lance.yang@linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:aarcange@redhat.com,m:akpm@linux-foundation.org,m:anshuman.khandual@arm.com,m:apopple@nvidia.com,m:baohua@kernel.org,m:baolin.wang@linux.alibaba.com,m:byungchul@sk.com,m:catalin.marinas@arm.com,m:cl@gentwo.org,m:corbet@lwn.net,m:dave.hansen@linux.intel.com,m:dev.jain@arm.com,m:gourry@gourry.net,m:hannes@cmpxchg.org,m:hughd@google.com,m:jack@suse.cz,m:jackmanb@google.com,m:jannh@google.com,m:jglisse@google.com,m:joshua.hahnjy@gmail.com,m:kas@kernel.org,m:liam@infradead.org,m:mathieu.desnoyers@efficios.com,m:matthew.brost@intel.com,m:mhiramat@kernel.org,m:mhocko@suse.com,m:peterx@redhat.com,m:pfalcato@suse.de,m:rakie.kim@sk.com,m:raquini@redhat.com,m:rdunlap@infradead.org,m:richard.weiyang@gmail.com,m:rientjes@google.com,m:rostedt@goodmis.org,m:rppt@kernel.org,m:ryan.roberts@arm.com,
 m:shivankg@amd.com,m:sunnanyong@huawei.com,m:surenb@google.com,m:thomas.hellstrom@linux.intel.com,m:tiwai@suse.de,m:usamaarif642@gmail.com,m:vbabka@suse.cz,m:vishal.moola@gmail.com,m:wangkefeng.wang@huawei.com,m:will@kernel.org,m:willy@infradead.org,m:yang@os.amperecomputing.com,m:ying.huang@linux.alibaba.com,m:ziy@nvidia.com,m:zokeefe@google.com,m:usama.arif@linux.dev,m:joshuahahnjy@gmail.com,m:richardweiyang@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,linux.dev,vger.kernel.org,kvack.org,linux-foundation.org,arm.com,nvidia.com,kernel.org,linux.alibaba.com,sk.com,gentwo.org,lwn.net,linux.intel.com,gourry.net,cmpxchg.org,google.com,suse.cz,gmail.com,infradead.org,efficios.com,intel.com,suse.com,suse.de,goodmis.org,amd.com,huawei.com,os.amperecomputing.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lucifer:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 401DB646592

On Fri, Jun 05, 2026 at 09:18:27AM +0200, David Hildenbrand (Arm) wrote:
> On 6/4/26 19:04, Nico Pache wrote:
> > On Mon, Jun 1, 2026 at 9:00 AM Nico Pache <npache@redhat.com> wrote:
> >>
> >> On Mon, Jun 1, 2026 at 5:14 AM David Hildenbrand (Arm) <david@kernel.org> wrote:
> >>>
> >>>
> >>> Yeah. BTW, I think we'd need a spin_lock_nested(), so @Nico, treat my code as a
> >>> draft.
> >>
> >> Okay, I read the above and did some investigating.
> >>
> >> I will try to implement and verify the changes you suggested :)
> >
> > I've implemented something slightly different actually and I *think* its better!
> >
> > } else {
> >        /* this is map_anon_folio_pte_nopf with no mmu update */
> >         __map_anon_folio_pte_nopf(folio, pte, vma, start_addr,
> >                       /*uffd_wp=*/ false);
> >        smp_wmb();
> >         pmd_populate(mm, pmd, pmd_pgtable(_pmd));
> >         /*
> >          * Some architectures (e.g. MIPS) walk the live page table in
> >          * their implementation. update_mmu_cache_range() must be called
> >          * with a valid page table hierarchy and the PTE lock held.
> >          * Acquire it nested inside pmd_ptl when they are distinct locks.
> >          */
> >         if (pte_ptl != pmd_ptl)
> >             spin_lock_nested(pte_ptl, SINGLE_DEPTH_NESTING);
> >         update_mmu_cache_range(NULL, vma, start_addr, pte, nr_pages);
> >         if (pte_ptl != pmd_ptl)
> >             spin_unlock(pte_ptl);
> >     }
> > spin_unlock(pmd_ptl);
> >
> > The logic here is that when the PMD becomes visible, PTEs are already
> > populated (no possibility of spurious faults on local CPU)
> >
> > the SMP_WMB makes sure of the above

THe locks prevent those 'spurious' (really: incorrect) faults anyway so I don't
think this is necessary.

> >
> > And the pmd is installed with the pte and pmd lock both held through
> > the mmu_cache update.
> >
> > This follows the conventions used in pmd_install() and clears the
> > potential for local CPU faults hitting cleared PTE entries.
>
> After the pmdp_collapse_flush() we'd be getting CPU faults due to the cleared
> PMD already? So the case here is rather different.

Yeah conceptually the code above is problematic because you immediately make the
PTE available right at the point you populate, so taking a PTE lock after that
is rather shutting the stable door after the horse has bolted.

Doing it this way is not a good idea in any case because we're adding
complexity, an extra function and an open-coded cache maintenance call for
really no benefit.

I asked Nico to abstract the anon folio mapping stuff explicitly so we could
avoid this sort of duplication so let's not roll that back :)

So again, I think going with the original suggestion (with an updated comment)
is the right thing to do.


Anyway, an aside But in practice we can't have page faults here right? The VMA is:

- Ensured to span at least the PMD range (this isn't immediately obvious in the
  code)
- VMA write locked (mmap write lock held)

And we hold the anon_vma lock so no rmap walkers can walk the page tables here
either.

So I actually wonder, given that, whether we need the PTE PTL at all.

But.

At this stage it'll almost certainly be an owned exclusive cache line so it's
very low cost to do it, and it means we honour the update_mmu_cache_range()
contract.

And it also makes it clear that we're gating changes on the PTE being
untouchable so any future stuff that maybe changes some of these rules doesn't
get caught out.

So probably worth keeping.

>
> --
> Cheers,
>
> David

Thanks, Lorenzo

