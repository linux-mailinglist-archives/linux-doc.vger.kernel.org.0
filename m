Return-Path: <linux-doc+bounces-90990-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0hSSO7TBIWptNAEAu9opvQ
	(envelope-from <linux-doc+bounces-90990-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 20:19:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5903D6428CE
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 20:19:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="V/XV3iVQ";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90990-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90990-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07A1C304C2EA
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 18:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B603C0A1A;
	Thu,  4 Jun 2026 18:13:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075873BFE5C;
	Thu,  4 Jun 2026 18:13:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780596793; cv=none; b=lkHwoEpkXcDDAuEuGdDKqzTdy+s8jqAaFmEo6TPdO/RMuh8qds+f6/a4zuBgX3v47cRmykUkQpDA5zuLoU1gW2N3YrItjZRv+E2yuRHMYum0ihG8ke/W7NyMM7zdbwyMb3+AIvWofHJ4I8uuokmk7+W/kDLFz9NdYZ6AjzWu35A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780596793; c=relaxed/simple;
	bh=r0wjT9nlr3/7ANv0YhS8eiFusH1oMPnAKEwu64ciUjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8RMEEIWACPAYXiPHGSkZqj47Xt1PkNB7tZm4xGwMIJHWjTbw30I7jdPYdnjMIiKA8osaFKAAI1DK6266OP+X40bI6CW8EKDZPbnCNKOL4LUee/q5IlePeR+smT1bHaRggbB8OtEzvx2ucgtaA6hAA/EhAgG3IxkZk1WCtaIXRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/XV3iVQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AA21F00893;
	Thu,  4 Jun 2026 18:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780596791;
	bh=h9siRJLal0UIGuKxUNFIYMAX2s/cZPxHkMdng7Hug/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V/XV3iVQ4PRKNVCvTu15YxKWSS8z2rg9Z5nKNSe0DJ+dG1R0b21v8OhFQ4xjYmiv5
	 WoLCGhlsrNR38uXgEgJvbBjPqBWzfmmFlsf/sdlzB1Ofqr5TAsYQwvF3CDdBLgoakl
	 aOe9tkeCuQRFp1PjFSSIuqO/tybLyiWr2qyQMufO+BTAwWqzMb6nGcNHiaeEPBnRvn
	 rgf8y0PSub1b3PAkTQEjcsGxF5s6Z/W+/p7EOceykOuqrmXTRI+Kz9LIInpTzzKysG
	 chLeb1cJbQD6EMoAlGWIOEqSOuUodSfhLmmXLR1XUTUezVeiZ+Ze23Sp4berUW2oCt
	 0eR/Zhg2EC1UA==
Date: Thu, 4 Jun 2026 19:12:56 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Nico Pache <npache@redhat.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, baohua@kernel.org, 
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
Message-ID: <aiG_-lP_HfxWXB4G@lucifer>
References: <2024af56-5e99-4799-a586-e9ba756cecb9@kernel.org>
 <20260601032804.96122-1-lance.yang@linux.dev>
 <f5d38f64-ab92-496d-afd3-29ccc17fec2b@kernel.org>
 <616de1a8-1cfd-40b8-b04f-7b324be40bfd@linux.dev>
 <6b11bf0a-769c-4ef2-ac6f-2af38200a6bc@kernel.org>
 <baa0a462-46e0-44ab-b583-c722ad253afe@linux.dev>
 <06d9b665-945f-4967-9ed9-b06514478996@kernel.org>
 <CAA1CXcAeEGOsqp-ywAQ7GMYQzXEeco-rUxUkk2hEF69HybC4=w@mail.gmail.com>
 <CAA1CXcBSPVG4CJFCBDvbuodcJ_7eXoDQTpK0ZN0HEhkDPi-DEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA1CXcBSPVG4CJFCBDvbuodcJ_7eXoDQTpK0ZN0HEhkDPi-DEw@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90990-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:npache@redhat.com,m:david@kernel.org,m:lance.yang@linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:aarcange@redhat.com,m:akpm@linux-foundation.org,m:anshuman.khandual@arm.com,m:apopple@nvidia.com,m:baohua@kernel.org,m:baolin.wang@linux.alibaba.com,m:byungchul@sk.com,m:catalin.marinas@arm.com,m:cl@gentwo.org,m:corbet@lwn.net,m:dave.hansen@linux.intel.com,m:dev.jain@arm.com,m:gourry@gourry.net,m:hannes@cmpxchg.org,m:hughd@google.com,m:jack@suse.cz,m:jackmanb@google.com,m:jannh@google.com,m:jglisse@google.com,m:joshua.hahnjy@gmail.com,m:kas@kernel.org,m:liam@infradead.org,m:mathieu.desnoyers@efficios.com,m:matthew.brost@intel.com,m:mhiramat@kernel.org,m:mhocko@suse.com,m:peterx@redhat.com,m:pfalcato@suse.de,m:rakie.kim@sk.com,m:raquini@redhat.com,m:rdunlap@infradead.org,m:richard.weiyang@gmail.com,m:rientjes@google.com,m:rostedt@goodmis.org,m:rppt@kernel.org,m:ryan.roberts@arm.com,
 m:shivankg@amd.com,m:sunnanyong@huawei.com,m:surenb@google.com,m:thomas.hellstrom@linux.intel.com,m:tiwai@suse.de,m:usamaarif642@gmail.com,m:vbabka@suse.cz,m:vishal.moola@gmail.com,m:wangkefeng.wang@huawei.com,m:will@kernel.org,m:willy@infradead.org,m:yang@os.amperecomputing.com,m:ying.huang@linux.alibaba.com,m:ziy@nvidia.com,m:zokeefe@google.com,m:usama.arif@linux.dev,m:joshuahahnjy@gmail.com,m:richardweiyang@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,vger.kernel.org,kvack.org,redhat.com,linux-foundation.org,arm.com,nvidia.com,linux.alibaba.com,sk.com,gentwo.org,lwn.net,linux.intel.com,gourry.net,cmpxchg.org,google.com,suse.cz,gmail.com,infradead.org,efficios.com,intel.com,suse.com,suse.de,goodmis.org,amd.com,huawei.com,os.amperecomputing.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lucifer:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5903D6428CE

On Thu, Jun 04, 2026 at 11:04:35AM -0600, Nico Pache wrote:
> On Mon, Jun 1, 2026 at 9:00 AM Nico Pache <npache@redhat.com> wrote:
> >
> > On Mon, Jun 1, 2026 at 5:14 AM David Hildenbrand (Arm) <david@kernel.org> wrote:
> > >
> > > On 6/1/26 12:47, Lance Yang wrote:
> > > >
> > > >
> > > > On 2026/6/1 18:23, David Hildenbrand (Arm) wrote:
> > > >> On 6/1/26 11:08, Lance Yang wrote:
> > > >>>
> > > >>>
> > > >>>
> > > >>> One small thing, I think we should probably keep the smp_wmb(), and just
> > > >>> move it before the earlier pmd_populate().
> > > >>>
> > > >>> IIUC, the ordering we want is still:
> > > >>>
> > > >>>    clear old PTEs
> > > >>>    smp_wmb()
> > > >>>    pmd_populate()
> > > >>>
> > > >>> so another CPU cannot walk through the re-installed PMD and still observe
> > > >>> the old PTEs, right?
> > > >>
> > > >> There is a smp_wmb() in __folio_mark_uptodate(), that should be sufficient?
> > > >
> > > > Ah, cool! __folio_mark_uptodate() already does the job :P
> > > >
> > > > So yeah, no extra smp_wmb() needed here!
> > >
> > > Yeah. BTW, I think we'd need a spin_lock_nested(), so @Nico, treat my code as a
> > > draft.
> >
> > Okay, I read the above and did some investigating.
> >
> > I will try to implement and verify the changes you suggested :)
>
> I've implemented something slightly different actually and I *think* its better!
>
> } else {
>        /* this is map_anon_folio_pte_nopf with no mmu update */
>         __map_anon_folio_pte_nopf(folio, pte, vma, start_addr,
>                       /*uffd_wp=*/ false);
>        smp_wmb();
>         pmd_populate(mm, pmd, pmd_pgtable(_pmd));
>         /*
>          * Some architectures (e.g. MIPS) walk the live page table in
>          * their implementation. update_mmu_cache_range() must be called
>          * with a valid page table hierarchy and the PTE lock held.
>          * Acquire it nested inside pmd_ptl when they are distinct locks.
>          */
>         if (pte_ptl != pmd_ptl)
>             spin_lock_nested(pte_ptl, SINGLE_DEPTH_NESTING);
>         update_mmu_cache_range(NULL, vma, start_addr, pte, nr_pages);
>         if (pte_ptl != pmd_ptl)
>             spin_unlock(pte_ptl);
>     }
> spin_unlock(pmd_ptl);
>
> The logic here is that when the PMD becomes visible, PTEs are already
> populated (no possibility of spurious faults on local CPU)
>
> the SMP_WMB makes sure of the above
>
> And the pmd is installed with the pte and pmd lock both held through
> the mmu_cache update.
>
> This follows the conventions used in pmd_install() and clears the
> potential for local CPU faults hitting cleared PTE entries.
>
> I think both approaches are correct but this prevents any possibility
> of my first point. although mmap_write_lock prevents this too.
>
> Let me know what you think. I can revert to your implementation but
> this is what I tested.

Yeah let's go with the original implementation please :)

Thanks!

>
> Cheers,
> -- Nico
>
> >
> > Or an even crazier idea... what if we ensure MIPS checks for PMD_none
> > before walking a PTE table?
> >
> > -- Nico
> >
> > >
> > > --
> > > Cheers,
> > >
> > > David
> > >
>

Cheers, Lorenzo

