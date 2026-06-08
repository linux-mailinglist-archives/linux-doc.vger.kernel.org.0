Return-Path: <linux-doc+bounces-91344-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zaeXLIaDJmpLXwIAu9opvQ
	(envelope-from <linux-doc+bounces-91344-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 10:55:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E298654427
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 10:55:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=vejwWx6V;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91344-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-91344-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 599B3301106E
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 08:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2D63B2FD9;
	Mon,  8 Jun 2026 08:50:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D0E3B27E1;
	Mon,  8 Jun 2026 08:50:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908649; cv=none; b=Mf4vQ0u2ftIAzxc5YrFIF3/5LbT75u1dgBkxbJVu4PtjXcJKylTlPs7VuqlU5x5jk25O2dVp+r3SrSt3RJVB1jVJTvVLEIygUSU1iUHEiU327Xh3FSdUrlml+cKs5ltnQ6uC+lSTLGWKHx83pEwB51CsB1CaYJax+uI4xTxJMhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908649; c=relaxed/simple;
	bh=B/lsomBiRVL9mQdaJ38PILug80vLR9tO1ueasoxijW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbxQjXb1iDELoAWSj2kcYLgbRqEPbMXv+JlEROj7zpE/Qlveyn0YvzUV+zvDxGy7sQSsYMnRqBmIGURhl+8nLyhfEEVyOgo2yL7SBNamdklUX5nfXZWgDldkyhwNjwtxsQndXjYN3U1Qnq5LN0jGxDcIYTT5bkC3yuoQX7hbuRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=vejwWx6V; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dluz+I3N22ywYzoz/gAwyyxGhCLB7ATDVpgZxGTd1Hg=; b=vejwWx6VMa39pTZib49M1u2r0C
	Mrn0/A5J9513XAgHtk8Kc1CYh3TI47gau+fhR5slOP8jFMeLmvBEkCNn+19iNKIFPdFa6WE8c/gMz
	t99Ie63OWcvhMhtDDCnkve8QzJTAG4GOsX2xkBYXCKc6Q5v0qsFAbaF2hKBz8hrhVx12IhVGRRlWw
	/fSo+694x+90ee0pNT1hAtVxcLtMYrqb6l8/0GAl9mOeoYjSxWYQgsLPdtK3SnuYybkJanG8qaQaT
	ylzuIsGC80K9maerJAYZM7CdzO20xRUnZQqGLQPiWDxuQ1wpIcGbXE0U4+rbWltECyITWI9vcAHM2
	p5vwQpHQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wWVfH-007VKw-26;
	Mon, 08 Jun 2026 08:48:59 +0000
Date: Mon, 8 Jun 2026 01:48:47 -0700
From: Breno Leitao <leitao@debian.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ruirui.yang@linux.dev, rdunlap@infradead.org, peterz@infradead.org, 
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com, 
	kuba@kernel.org, lirongqing@baidu.com, ebiggers@kernel.org, paulmck@kernel.org, 
	coxu@redhat.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, osandov@fb.com, 
	jbohac@suse.cz, cfsworks@gmail.com, tangyouling@kylinos.cn, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, adityag@linux.ibm.com, 
	liaoyuanhong@vivo.com, seanjc@google.com, fuqiang.wang@easystack.cn, ardb@kernel.org, 
	chenjiahao16@huawei.com, guoren@kernel.org, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org
Subject: Re: [PATCH v16 08/10] powerpc/kexec_file: Use
 crash_exclude_core_ranges() helper
Message-ID: <aiaB45VXyCv4pUBW@gmail.com>
References: <20260608073459.3119290-1-ruanjinjie@huawei.com>
 <20260608073459.3119290-9-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608073459.3119290-9-ruanjinjie@huawei.com>
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91344-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:robh@kernel.org,m:saravanak@kernel.org,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:rppt@kernel.org,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:ruirui.yang@linux.dev,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:elver@google.com,m:kuba@kernel.org,m:lirongqing@baidu.com,m:ebiggers@kernel.org,m:paulmck@kernel.org,m:coxu@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:osandov@fb.com,m:jbohac@suse.cz,m:cfsworks@gmail.com,m:tangyouling@kylinos.cn,m:so
 urabhjain@linux.ibm.com,m:ritesh.list@gmail.com,m:adityag@linux.ibm.com,m:liaoyuanhong@vivo.com,m:seanjc@google.com,m:fuqiang.wang@easystack.cn,m:ardb@kernel.org,m:chenjiahao16@huawei.com,m:guoren@kernel.org,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:devicetree@vger.kernel.org,m:kexec@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,soleen.com,linux.dev,infradead.org,linux.alibaba.com,google.com,baidu.com,oracle.com,fb.com,suse.cz,kylinos.cn,vivo.com,easystack.cn,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ellerman.id.au:email,vger.kernel.org:from_smtp,huawei.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E298654427

On Mon, Jun 08, 2026 at 03:34:57PM +0800, Jinjie Ruan wrote:
> The crash memory exclude of crashk_res and crashk_cma memory on powerpc
> are almost identical to the generic crash_exclude_core_ranges().
> 
> By introducing the architecture-specific arch_crash_exclude_mem_range()
> function with a default implementation of crash_exclude_mem_range(),
> and using crash_exclude_mem_range_guarded as powerpc's separate
> implementation, the generic crash_exclude_core_ranges() helper function
> can be reused.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Acked-by: Baoquan He <bhe@redhat.com>
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Acked-by: Breno leitao <leitao@debian.org>

