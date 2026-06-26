Return-Path: <linux-doc+bounces-93731-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ThXcDVCdPmprJAkAu9opvQ
	(envelope-from <linux-doc+bounces-93731-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 17:40:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 227316CE944
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 17:39:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=idHputUK;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93731-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93731-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 123FC301CD1B
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 15:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6E339A7F2;
	Fri, 26 Jun 2026 15:29:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF8935BDA4;
	Fri, 26 Jun 2026 15:29:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782487745; cv=none; b=E6v1u60F8OIlQCBXpXacBjJVJcjpk6P5LXFOOvmpT62zpqPWwcYXaLXAdq2Nf3IR2lmZwCE9npr5vK0daKxW+klZqcnKSusLyxIcrcwLa/TG+obfsj2t8cQpIk3+RNp7uk18SlvpaiUpBDvuKICqzSD8z3TrF7GW0yAX5BwDha8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782487745; c=relaxed/simple;
	bh=64yOh2taiYLKYij2S6Vd69XCi3awSOUHYmH1X7uMpq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZ6K1IUsscDWXPygS35ynohMfwroQpdGe9qWy9RSyQtFypFOn4hh0IGx7lXevqZZvwi/AXxRmcvF4PP7UiUEY9aEBybziffvrB4T0z8Z4oWtNjrTpZqBSEZMNAAvggLc/NsZLA4R1KKiTudmbvNyNN+jLOiDfLakTP/uc8CTMAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idHputUK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1081F000E9;
	Fri, 26 Jun 2026 15:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782487743;
	bh=YSvnrDQeqiuou4mWYG8YFG85sz9T2AFOYdJJQqH5aKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=idHputUKAXQjKNiThw4I2jQol6Qci2xV0EurB5Pr1bNgQj+ucMHTasa7myaudlUf4
	 zeB0phEsOTef3/d8Io+sTnhlAhw4DJL/SNQHe5Bs3EuVep7xigU4jO464ACUXS14e5
	 JUKoc1t21hbjEgwwsWveOSF8TemVlod3dOSIsDW1z58x0hCYQDEiAmVaY+3OS3XFuO
	 Gdegn4G1m+r084YL3gAe04jFQyugVl6EE6Js2I5X1xWntH08RmiPoUEDZCiAOcetKS
	 y1mPxAubsgFYG1nr92yN69gLeRpLenjKfTN5T65Kah7gTu1XrHYLX+jEL3e278dnim
	 xW79xk2em+PlQ==
Date: Fri, 26 Jun 2026 18:28:34 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Brendan Jackman <brendan.jackman@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"kernel@xen0n.name" <kernel@xen0n.name>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"maz@kernel.org" <maz@kernel.org>,
	"oupton@kernel.org" <oupton@kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"luto@kernel.org" <luto@kernel.org>,
	"willy@infradead.org" <willy@infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"david@kernel.org" <david@kernel.org>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"vbabka@kernel.org" <vbabka@kernel.org>,
	"surenb@google.com" <surenb@google.com>,
	"mhocko@suse.com" <mhocko@suse.com>,
	"ast@kernel.org" <ast@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"andrii@kernel.org" <andrii@kernel.org>,
	"martin.lau@linux.dev" <martin.lau@linux.dev>,
	"eddyz87@gmail.com" <eddyz87@gmail.com>,
	"song@kernel.org" <song@kernel.org>,
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"kpsingh@kernel.org" <kpsingh@kernel.org>,
	"haoluo@google.com" <haoluo@google.com>,
	"jolsa@kernel.org" <jolsa@kernel.org>,
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>,
	"jannh@google.com" <jannh@google.com>,
	"pfalcato@suse.de" <pfalcato@suse.de>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"riel@surriel.com" <riel@surriel.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"jgross@suse.com" <jgross@suse.com>,
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"coxu@redhat.com" <coxu@redhat.com>,
	"ackerleytng@google.com" <ackerleytng@google.com>,
	"yosry@kernel.org" <yosry@kernel.org>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>,
	"prsampat@amd.com" <prsampat@amd.com>,
	"wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>,
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>,
	"jthoughton@google.com" <jthoughton@google.com>,
	"agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"dev.jain@arm.com" <dev.jain@arm.com>,
	"gor@linux.ibm.com" <gor@linux.ibm.com>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>,
	"svens@linux.ibm.com" <svens@linux.ibm.com>,
	"thuth@redhat.com" <thuth@redhat.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"urezki@gmail.com" <urezki@gmail.com>,
	"zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>,
	"pavel@kernel.org" <pavel@kernel.org>,
	"yangyicong@hisilicon.com" <yangyicong@hisilicon.com>,
	"vannapurve@google.com" <vannapurve@google.com>,
	"jackmanb@google.com" <jackmanb@google.com>,
	"patrick.roy@linux.dev" <patrick.roy@linux.dev>,
	"Thomson, Jack" <jackabt@amazon.co.uk>,
	"Itazuri, Takahiro" <itazur@amazon.co.uk>,
	"Manwaring, Derek" <derekmn@amazon.com>
Subject: Re: [PATCH v12 01/16] set_memory: set_direct_map_* to take address
Message-ID: <aj6aohb8Z4yR_Sh3@kernel.org>
References: <20260410151746.61150-1-kalyazin@amazon.com>
 <20260410151746.61150-2-kalyazin@amazon.com>
 <aeeDvpDnGnY5n69n@lucifer>
 <DJJ23EXF55VK.1EGQZS511HFB6@linux.dev>
 <DJJ2NKKPRANG.188CUADJO2CKK@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJJ2NKKPRANG.188CUADJO2CKK@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-93731-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:brendan.jackman@linux.dev,m:ljs@kernel.org,m:kalyazin@amazon.co.uk,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mm@kvack.org,m:bpf@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:kernel@xen0n.name,m:linux-riscv@lists.infradead.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:maz@kernel.org,m:oupton@kernel.org,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:will@kernel.org,m:seanjc@google.com,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:luto@kernel.org,m:willy@infradead.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:haoluo@google.com,m:jol
 sa@kernel.org,m:jhubbard@nvidia.com,m:jannh@google.com,m:pfalcato@suse.de,m:skhan@linuxfoundation.org,m:riel@surriel.com,m:ryan.roberts@arm.com,m:jgross@suse.com,m:yu-cheng.yu@intel.com,m:kas@kernel.org,m:coxu@redhat.com,m:ackerleytng@google.com,m:yosry@kernel.org,m:ajones@ventanamicro.com,m:maobibo@loongson.cn,m:prsampat@amd.com,m:wu.fei9@sanechips.com.cn,m:mlevitsk@redhat.com,m:jthoughton@google.com,m:agordeev@linux.ibm.com,m:alex@ghiti.fr,m:aou@eecs.berkeley.edu,m:borntraeger@linux.ibm.com,m:chenhuacai@kernel.org,m:baolu.lu@linux.intel.com,m:dev.jain@arm.com,m:gor@linux.ibm.com,m:hca@linux.ibm.com,m:palmer@dabbelt.com,m:pjw@kernel.org,m:shijie@os.amperecomputing.com,m:svens@linux.ibm.com,m:thuth@redhat.com,m:Liam.Howlett@oracle.com,m:urezki@gmail.com,m:zhengqi.arch@bytedance.com,m:pavel@kernel.org,m:yangyicong@hisilicon.com,m:vannapurve@google.com,m:jackmanb@google.com,m:patrick.roy@linux.dev,m:jackabt@amazon.co.uk,m:itazur@amazon.co.uk,m:derekmn@amazon.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,amazon.co.uk,vger.kernel.org,lists.infradead.org,kvack.org,xen0n.name,redhat.com,lwn.net,arm.com,huawei.com,google.com,alien8.de,linux.intel.com,zytor.com,infradead.org,linux-foundation.org,oracle.com,suse.com,iogearbox.net,linux.dev,gmail.com,nvidia.com,suse.de,linuxfoundation.org,surriel.com,intel.com,ventanamicro.com,loongson.cn,amd.com,sanechips.com.cn,linux.ibm.com,ghiti.fr,eecs.berkeley.edu,dabbelt.com,os.amperecomputing.com,bytedance.com,hisilicon.com,amazon.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[87];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,infradead.org:email,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 227316CE944

On Fri, Jun 26, 2026 at 03:04:48PM +0000, Brendan Jackman wrote:
> On Fri Jun 26, 2026 at 2:38 PM UTC, Brendan Jackman wrote:
> > On Tue Apr 21, 2026 at 2:43 PM UTC, Lorenzo Stoakes wrote:
> >> On Fri, Apr 10, 2026 at 03:17:58PM +0000, Kalyazin, Nikita wrote:
> >>> From: Nikita Kalyazin <nikita.kalyazin@linux.dev>
> >>>
> >>> Let's convert set_direct_map_*() to take an address instead of a page to
> >>> prepare for adding helpers that operate on folios; it will be more
> >>> efficient to convert from a folio directly to an address without going
> >>> through a page first.
> >
> > Why is this more efficient? Isn't it a purely compile-time conversion?
> >
> > Indeed in the current implementation folio_address() is
> > page_address(&folio->page) so it still goes through a page anyway, no?
> >
> > I might be missing context here about how this will look in the
> > memdesc future.
> 
> Sorry I failed to do the history search here, this was suggested by
> Willy during the review here:
> 
> https://lore.kernel.org/kvm/aWkN4yzwPtotaTeq@casper.infradead.org/
> 
> Matthew Wilcox <willy@infradead.org> wrote:
> > The implementation isn't the greatest.  None of the implementations
> > of set_direct_map_valid_noflush() actually do anything with the struct
> > page; they all call page_address() or page_to_virt() (fundamentally the
> > same thing).  
> 
> But IMO the struct page isn't there to carry runtime information, it's a
> type hint that this API operates on physical pages. Yes this is already
> implied by the name but it also gives us a certain amount of safety
> since it avoids unaligned or non-physmap addresses at compile time.

I think it's more historical thingy, the initial user was
vmalloc::set_area_direct_map() that passed each page from vm->pages[] to
set_direct_map functions.
 
And yes, having a page there let's the implementation to go directly from
the page to it's address in the direct map, even for highmem ...

> > So converting folio->page->address is a bit inefficient.
> 
> ... but yeah now I see this comes from Willy I definitely suspect I'm
> missing memdesc insight here. 
> 
> > It feels like we should change set_direct_map_valid_noflush() to take a
> > const void * and pass either page_address() or folio_address(), depending
> > whether the caller has a page or a folio.  What do you think?

... while with void * it's not necessarily one-to-one because void * can be
a vmalloc address. 

-- 
Sincerely yours,
Mike.

