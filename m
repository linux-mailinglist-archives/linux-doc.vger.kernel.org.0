Return-Path: <linux-doc+bounces-86817-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLKSE+7OAWryjwEAu9opvQ
	(envelope-from <linux-doc+bounces-86817-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 14:43:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA06450E174
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 14:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACB31305F55A
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 12:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F763A3821;
	Mon, 11 May 2026 12:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="XmiFKakl"
X-Original-To: linux-doc@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230336C0C3;
	Mon, 11 May 2026 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502763; cv=none; b=I+/9h330eSvvVDZFHJCXrferwJnd0bhlsBg1G6tlMo9DOoImmrug9sndJ2gh2wlEkCUk+f1s5qk+z7eE1dFheM4HopTjd4Jg+fM8UBlvIDHY4wSTHgShwzolpY026pINfEgkDh/jlel/5Rx0ATd7ICVF+ZhfWzk6LZQSVDosYZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502763; c=relaxed/simple;
	bh=D0bqzM0WGixnwP3PSygyYipjRd7+m1+aNPilBTviGDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUoNFxuODdggASoFa34gcxY5sUv24pw5w/JHyyDTQNUzy0rtCSjDchjMDkX9Qm1H2XANjyezjgqCx6qmVYOvixrNoPhQy6NShfsUNhCqXxr2PQsvgFGc/411HL9mzfFiKrBsmTXog+CXCNRnGqF+gQeAMpvw7M+W3n6PabP4CWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=XmiFKakl; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M8lmcQvjJ5LUpDA4EmGDDTnt8GNDhiFnrJNCJhkuZWM=; b=XmiFKaklZ3QQYtH8/ygJpRi6/c
	cJ9m6w27ps4ZkaQs+L3zmaULdxP92hxNU3mBsUHkvC5gV/Gr2OWyX7UNQwKGJQMGSIgDGnMR05nSr
	6Hz3vsI22lcNtQs/VMzI48fbeiQc3TW5qrsNxcffxftFa5xlDo5LQ3kJ7Q0m2F5+M5D8c3G+2BDUt
	Wr7OwYwQSZNfs/cIihoRG+30TDa9XqeX3dKysWM/Sidq9OVS27lVgnLamFYvGQfr7bsghipMWPyrI
	mYwBzzTjZXPAId0EF/iDyo+lUuvmMRF8iddzWl4iCApO3hINgAD4OJDf0mLBEMdj/gGrp5p3Xx6ka
	a7gITkwQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wMPmt-001bCJ-0c;
	Mon, 11 May 2026 12:31:07 +0000
Date: Mon, 11 May 2026 05:30:54 -0700
From: Breno Leitao <leitao@debian.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ruirui.yang@linux.dev, rdunlap@infradead.org, pmladek@suse.com, 
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com, kuba@kernel.org, 
	ebiggers@kernel.org, lirongqing@baidu.com, paulmck@kernel.org, 
	sourabhjain@linux.ibm.com, coxu@redhat.com, jbohac@suse.cz, ryan.roberts@arm.com, 
	osandov@fb.com, cfsworks@gmail.com, tangyouling@kylinos.cn, 
	ritesh.list@gmail.com, adityag@linux.ibm.com, guoren@kernel.org, 
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com, vishal.moola@gmail.com, 
	junhui.liu@pigmoral.tech, wangruikang@iscas.ac.cn, namcao@linutronix.de, 
	chao.gao@intel.com, seanjc@google.com, fuqiang.wang@easystack.cn, ardb@kernel.org, 
	chenjiahao16@huawei.com, hbathini@linux.ibm.com, takahiro.akashi@linaro.org, 
	james.morse@arm.com, lizhengyu3@huawei.com, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org
Subject: Re: [PATCH v13 04/15] arm64: kexec_file: Fix potential buffer
 overflow in prepare_elf_headers()
Message-ID: <agHL1zzC5bzgoCiJ@gmail.com>
References: <20260511030454.1730881-1-ruanjinjie@huawei.com>
 <20260511030454.1730881-5-ruanjinjie@huawei.com>
 <agGkvrg06KNDNfDi@gmail.com>
 <79c14bee-b1f5-4d70-8345-6582d6cf0128@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79c14bee-b1f5-4d70-8345-6582d6cf0128@huawei.com>
X-Debian-User: leitao
X-Rspamd-Queue-Id: EA06450E174
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,soleen.com,linux.dev,infradead.org,suse.com,google.com,baidu.com,suse.cz,fb.com,kylinos.cn,tinylab.org,pigmoral.tech,iscas.ac.cn,linutronix.de,intel.com,easystack.cn,huawei.com,linaro.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-86817-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[71];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 07:30:44PM +0800, Jinjie Ruan wrote:
> 
> 
> On 5/11/2026 5:46 PM, Breno Leitao wrote:
> > On Mon, May 11, 2026 at 11:04:43AM +0800, Jinjie Ruan wrote:
> >> There is a race condition between the kexec_load() system call
> >> (crash kernel loading path) and memory hotplug operations that can
> >> lead to buffer overflow and potential kernel crash.
> >>
> >> During prepare_elf_headers(), the following steps occur:
> >> 1. The first for_each_mem_range() queries current System RAM memory ranges
> >> 2. Allocates buffer based on queried count
> >> 3. The 2st for_each_mem_range() populates ranges from memblock
> >>
> >> If memory hotplug occurs between step 1 and step 3, the number of ranges
> >> can increase, causing out-of-bounds write when populating cmem->ranges[].
> >>
> >> This happens because kexec_load() uses kexec_trylock (atomic_t) while
> >> memory hotplug uses device_hotplug_lock (mutex), so they don't serialize
> >> with each other.
> >>
> >> Add the explicit bounds checking to prevent out-of-bounds access.
> > 
> > It seems you have a TOCTOU type of issue, and this seems to be shrinking
> > the window, but not fully solving it?
> 
> Hi Breno,
> 
> Thanks for your comments regarding the TOCTOU issue.
> 
> You are correct that the current bounds checking only "shrinks the
> window" and prevents a kernel crash, but doesn't fully guarantee header
> consistency if a race occurs.
> 
> In my local environment, this race is extremely difficult to reproduce,
> but it is theoretically possible.
> 
> To address this properly for arm64, I am considering two steps:
> 
> - For this patch: I will change the return value to -EAGAIN and keep the
> bounds check. This ensures that even if a race happens, the kernel
> remains safe (no OOB access), and user-space is notified to retry.
> 
> - Long-term solution: A better way to solve this is to implement ARM64
> CRASH_HOTPLUG support (similar to x86). With crash hotplug, the kernel
> will automatically re-generate the crash headers whenever a memory
> hotplug event occurs. This makes the TOCTOU during the initial
> kexec_load less critical, as any transient inconsistency will be
> immediately corrected by the subsequent hotplug handler.
> 
> Does it make sense to you to use this patch as a safety guard first, and
> then I (or someone else) follow up with the full CRASH_HOTPLUG support
> for arm64 as [1]?

It would be OK for me, but, make it explict that there is a TOCTOU
issue, that depends on CRASH_HOTPLUG.

