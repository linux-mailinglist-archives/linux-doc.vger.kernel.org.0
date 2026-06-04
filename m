Return-Path: <linux-doc+bounces-90956-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u5stGpyRIWpFJAEAu9opvQ
	(envelope-from <linux-doc+bounces-90956-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 16:54:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C47641198
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 16:54:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ip7V26mZ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90956-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90956-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24465314D285
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 14:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B42F480961;
	Thu,  4 Jun 2026 14:41:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439EE480946;
	Thu,  4 Jun 2026 14:41:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584066; cv=none; b=a/hipq+mrY1aJxKDRN2+lU9us/nFVFB1aC0bUDJNWlISlgW1hgnu9DbWroo0r2SS4Q3DiSpkNF5QaYmbSE1j+5si7mrYzgNj0F0W14gaKIuGgWj/9r4eoVl9XMgpAaQ34tqgcaDGlUvR4HWSSqhNhCi0aRZ8PhCHmFWVwx4DZxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584066; c=relaxed/simple;
	bh=CtDt3lYeen32tJjPtVhK83NQYah0kpWdJdJve8FYL6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhKnAXNRv8Er5u9ezlucSDLZQ0Y9LAOnsJwXpFqqKjqKVnZdDU1jYTzdDcL7V50KjUge723O8ZGPIFhSkvWOtW7QL+bG7XkuY81rTECx4foKy0kg+bFv2ogFmmGYYonpg/xJmq0XD6xDd0gzujwy5KyU7m9JJG4FPYQ4EnHmW1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ip7V26mZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813361F00893;
	Thu,  4 Jun 2026 14:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780584064;
	bh=CtDt3lYeen32tJjPtVhK83NQYah0kpWdJdJve8FYL6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ip7V26mZ3lpilTPjqq54piAcvOldqnXrk4MptULiPvlt1TPj3O9KC/WGiBCpb6sS+
	 FE/PcYpQMfmHU4JeXTJyoK7qBUwLxMAT46k1dxOCBZ+IVZ/92S6R53dGbiuMpcfyZK
	 62TXYPA9ty+/tG9g1H445TrGZInqnRDINE0QCHnsRCJNisxk2ShRvoayrgTln0h3JT
	 Qh3k1N7Iic1u2ZWCI5CxGC92BdXhxeVP4kM4LU68/a0v9PaxSay2rbsuPPl8Q0du7s
	 QwF1SpaHIfafTST+QIOw9/ekg10tpWZbR3mnERIgDF6duw7/NNe4JE8yOrvpGwcnGK
	 FJin50Cz7XUIw==
Date: Thu, 4 Jun 2026 15:40:49 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, Nico Pache <npache@redhat.com>, 
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
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, zokeefe@google.com
Subject: Re: [PATCH mm-unstable v18 11/14] mm/khugepaged: Introduce mTHP
 collapse support
Message-ID: <aiGOZyvD6lHskQSH@lucifer>
References: <20260522150009.121603-12-npache@redhat.com>
 <20260531071845.10875-1-lance.yang@linux.dev>
 <CAA1CXcA+oZmp=cxiC2_EBDxqGX94gAd335d9eFPNv=j_0=og7Q@mail.gmail.com>
 <185f5699-3797-4300-8c54-bb99fc2a45e0@linux.dev>
 <46bb9d9e-03f0-4e26-9ac9-1cdc5ba9bf4d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46bb9d9e-03f0-4e26-9ac9-1cdc5ba9bf4d@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90956-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:lance.yang@linux.dev,m:npache@redhat.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:aarcange@redhat.com,m:akpm@linux-foundation.org,m:anshuman.khandual@arm.com,m:apopple@nvidia.com,m:baohua@kernel.org,m:baolin.wang@linux.alibaba.com,m:byungchul@sk.com,m:catalin.marinas@arm.com,m:cl@gentwo.org,m:corbet@lwn.net,m:dave.hansen@linux.intel.com,m:dev.jain@arm.com,m:gourry@gourry.net,m:hannes@cmpxchg.org,m:hughd@google.com,m:jack@suse.cz,m:jackmanb@google.com,m:jannh@google.com,m:jglisse@google.com,m:joshua.hahnjy@gmail.com,m:kas@kernel.org,m:liam@infradead.org,m:mathieu.desnoyers@efficios.com,m:matthew.brost@intel.com,m:mhiramat@kernel.org,m:mhocko@suse.com,m:peterx@redhat.com,m:pfalcato@suse.de,m:rakie.kim@sk.com,m:raquini@redhat.com,m:rdunlap@infradead.org,m:richard.weiyang@gmail.com,m:rientjes@google.com,m:rostedt@goodmis.org,m:rppt@kernel.org,m:ryan.roberts@arm.com,
 m:shivankg@amd.com,m:sunnanyong@huawei.com,m:surenb@google.com,m:thomas.hellstrom@linux.intel.com,m:tiwai@suse.de,m:usamaarif642@gmail.com,m:vbabka@suse.cz,m:vishal.moola@gmail.com,m:wangkefeng.wang@huawei.com,m:will@kernel.org,m:willy@infradead.org,m:yang@os.amperecomputing.com,m:ying.huang@linux.alibaba.com,m:ziy@nvidia.com,m:zokeefe@google.com,m:joshuahahnjy@gmail.com,m:richardweiyang@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,redhat.com,vger.kernel.org,kvack.org,linux-foundation.org,arm.com,nvidia.com,kernel.org,linux.alibaba.com,sk.com,gentwo.org,lwn.net,linux.intel.com,gourry.net,cmpxchg.org,google.com,suse.cz,gmail.com,infradead.org,efficios.com,intel.com,suse.com,suse.de,goodmis.org,amd.com,huawei.com,os.amperecomputing.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,lucifer:mid,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8C47641198

On Wed, Jun 03, 2026 at 10:05:08AM +0200, David Hildenbrand (Arm) wrote:
> On 6/2/26 17:44, Lance Yang wrote:
> >
> >
> > On 2026/6/2 18:58, Nico Pache wrote:
> >> On Sun, May 31, 2026 at 1:19 AM Lance Yang <lance.yang@linux.dev> wrote:
> >>>
> >>>
> >>> [...]
> >>>
> >>> Hmm ... don't we lose the allocation-failure result here?
> >>>
> >>> Previously collapse_scan_pmd() propagated SCAN_ALLOC_HUGE_PAGE_FAIL from
> >>> collapse_huge_page(), so khugepaged would call khugepaged_alloc_sleep()
> >>> in khugepaged_do_scan().
> >>>
> >>> Now if allocation fails and nr_collapsed stays 0, we just return
> >>> SCAN_FAIL. So we won't back off via khugepaged_alloc_sleep() anymore?
> >>
> >> Ok I did the error propagation! I think I handled both of these cases
> >> you brought up pretty easily.
> >
> > Thanks.
> >
> >> However I don't know what to do in the following case: We successfully
> >> collapsed some portion of the PMD, but during that process, we also
> >> hit an allocation failure. Is it best to back off entirely? or can we
> >> treat some forward progress as a sign we can continue trying collapses
> >> without sleeping.
> >>
> >> Basically, do we prioritize SCAN_ALLOC_HUGE_PAGE_FAIL or the
> >> successful collapses as the returned value?
> >
> > Thinking out loud, forward progress should win here, the allocation
> > failure only matter if we made no progress at all?
>
> Agreed, in the first approach, forward progress makes sense.

Sounds sensible to me.

>
> --
> Cheers,
>
> David

Thanks, Lorenzo

