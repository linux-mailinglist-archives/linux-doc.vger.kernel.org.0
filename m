Return-Path: <linux-doc+bounces-95817-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8U7JDUrdTmrDVgIAu9opvQ
	(envelope-from <linux-doc+bounces-95817-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 01:29:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6D572B26D
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 01:29:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alien8.de header.s=alien8 header.b=Rs2lubOH;
	dmarc=pass (policy=none) header.from=alien8.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95817-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95817-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 324CD302800D
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 23:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7277E38AC68;
	Wed,  8 Jul 2026 23:29:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CCB14A60F;
	Wed,  8 Jul 2026 23:29:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783553351; cv=none; b=SSEgprN9D4Qif5irql5Og80DWBHiINDZSaStOnAdMl2/cL9civkoJdeoNlDdoPsZfc0U92IQkPoht2FqSW3hIXwMf/Dj233sEph8Mr05VL2w6MwBKwvye6A8xBmJ5myHzUbgVRVPMONX7s9Xmf3Ajlh0zZvg3o3T2epRWaThcyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783553351; c=relaxed/simple;
	bh=6tBLtbxX0ZUrMru/61OkIxUPlB5HCuiPwT61qEk3NFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=tjY1cUMMVCxUvR497s8ZXBx7mrfjf4VCYhLATjo0afVi09Wr8Sb2PE8vPjrjqDfElw7vcRt0gPxu0boi2eEAvnvnWZjGjjjS8wJC/SsA9OLny4dyu4MCu2ObCpDFaOQH0/FZPmjjqKd2bcXRd5SzrB0n3NQGtFdtUWbjr898KIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Rs2lubOH; arc=none smtp.client-ip=65.109.113.108
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5137140E02B1;
	Wed,  8 Jul 2026 23:29:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BpP5VtoT28aT; Wed,  8 Jul 2026 23:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783553334; bh=ewA6W4pws/kGsTaqarcyQHgxJcBc0o2FpyhZREKfla8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Rs2lubOH0j+n7l/EoPkXeXecTm3om7cJB7SllgLvMZI8HZInCtdQDBtvOCHlHvWfP
	 tRG/FPCxvtPMUTLG4eqL/5xOWnwMgGnV3p6KcUoMAQVdQCPI7aMR07xY/Y5b/BLCkn
	 fkNG5Q+QDQGOs4GcveXtOh4Vm7MFbtEIP7ii6NmFYw4Kq3bjtyfx6m9AZDsapVClKi
	 M6Fm+ofNDalmepZHtmbu3Tpke6QPmKBcUgfy4+UUL6bNbGZnwbXZ+oI+5tYLttqaDn
	 rUqaKJHwHYzqdvyieWLwpH32vrRU+KMmVNDxjYkXol9Z0KJDNqBtuLGFRXnKnFP/zy
	 6dixzaw9oqtTXSJdzpPKe2wPpJn1TImSWoB8mQAtHyN/Wn4+83uy3C31//ET4XWeWF
	 I2/rn8qZ0RQdaqGJdL7UTCzjkdXdVLaVSUT8KsfX/IjH8/W+n78xD80BOAYfmTL5eb
	 qadew4NG/OE5WG02U0dmKNoPPFfwH80pKJ6RrzEp2E+ZlYfL84F+LbuvlRE14hu1aX
	 nAYy310gpH1f4EqShpdZxjgAnSiJvKIeBbtdnD6XNZjnM+Kvj4SdZCXr5Q8KEZL6j8
	 8LkINha/GKtaLWb0UOylzz+eKvhXzFPNCHdbOyirHZh5X9fGrmL6VQcZumQ8ZGoP1U
	 4oJIdQV9LzoNIix0ZPFkgxi8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3AF4240E02B3;
	Wed,  8 Jul 2026 23:28:09 +0000 (UTC)
Date: Wed, 8 Jul 2026 16:28:06 -0700
From: Borislav Petkov <bp@alien8.de>
To: Babu Moger <babu.moger@amd.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com,
	Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org,
	ben.horgan@arm.com, fenghuay@nvidia.com, skhan@linuxfoundation.org,
	x86@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
	hpa@zytor.com, akpm@linux-foundation.org, rdunlap@infradead.org,
	peterz@infradead.org, feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com, elver@google.com,
	enelsonmoore@gmail.com, kuba@kernel.org, ebiggers@kernel.org,
	lirongqing@baidu.com, seanjc@google.com, nikunj@amd.com,
	xin@zytor.com, pawan.kumar.gupta@linux.intel.com,
	tiala@microsoft.com, chang.seok.bae@intel.com,
	kprateek.nayak@amd.com, prathyushi.nangia@amd.com,
	kim.phillips@amd.com, naveen@kernel.org, darwi@linutronix.de,
	elena.reshetova@intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com,
	eranian@google.com, peternewman@google.com,
	qinyuntan@linux.alibaba.com
Subject: Re: [RESEND PATCH v4 01/15] x86/resctrl: Support Privilege Level
 Zero Association (PLZA)
Message-ID: <20260708232806.GCak7dBi1loq3QLjg7@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0af5122c-20df-4aea-8ab4-cba63f71dc3b@amd.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95817-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:babu.moger@amd.com,m:acme@redhat.com,m:namhyung@kernel.org,m:corbet@lwn.net,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:tglx@kernel.org,m:ben.horgan@arm.com,m:fenghuay@nvidia.com,m:skhan@linuxfoundation.org,m:x86@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:seanjc@google.com,m:nikunj@amd.com,m:xin@zytor.com,m:pawan.kumar.gupta@linux.intel.com,m:tiala@microsoft.com,m:chang.seok.bae@intel.com,m:kprateek.nayak@amd.com,m:prathyushi.nangia@amd.com,m:kim.phillips@amd.com,m:naveen@kernel.org,m:darwi@linutronix.de,m:elena.reshetova@intel.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thomas.lendacky@amd.com,m:eranian@google.com
 ,m:peternewman@google.com,m:qinyuntan@linux.alibaba.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bp@alien8.de,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lwn.net,intel.com,arm.com,kernel.org,nvidia.com,linuxfoundation.org,redhat.com,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,linux.alibaba.com,google.com,gmail.com,baidu.com,amd.com,microsoft.com,linutronix.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[alien8.de:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,alien8.de:from_mime,alien8.de:dkim,check-headers.sh:url,fat_crate.local:mid,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E6D572B26D

On Wed, Jul 08, 2026 at 11:55:30AM -0500, Babu Moger wrote:
> > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> > index 1b4a48bff18f..bf6fc71f87fa 100644
> > --- a/arch/x86/include/asm/cpufeatures.h
> > +++ b/arch/x86/include/asm/cpufeatures.h
> > @@ -517,6 +517,7 @@
> >   						      * and purposes if CLEAR_CPU_BUF_VM is set).
> >   						      */
> >   #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support for 4k vCPUs */
> > +#define X86_FEATURE_PLZA		(21*32+21) /* Privilege Level Zero Association */
> >   /*
> >    * BUG word(s)
> > diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
> > index 937129ce6a96..1fa4d5aef17e 100644
> > --- a/arch/x86/kernel/cpu/scattered.c
> > +++ b/arch/x86/kernel/cpu/scattered.c
> > @@ -61,6 +61,7 @@ static const struct cpuid_bit cpuid_bits[] = {
> >   	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
> >   	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
> >   	{ X86_FEATURE_SDCIAE,			CPUID_EBX,  6, 0x80000020, 0 },
> > +	{ X86_FEATURE_PLZA,			CPUID_EBX,  9, 0x80000020, 0 },
> >   	{ X86_FEATURE_TSA_SQ_NO,		CPUID_ECX,  1, 0x80000021, 0 },
> >   	{ X86_FEATURE_TSA_L1_NO,		CPUID_ECX,  2, 0x80000021, 0 },
> >   	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
> 
> Sashiko reported:
> 
> --- Patch [1]: [RESEND PATCH v4 01/15] x86/resctrl: Support Privilege Level
> Zero Association (PLZA) ---
> commit 0f2aa093b81d7a2e0dc203ce3466562f708898df
> Author: Babu Moger <babu.moger@amd.com>
> x86/resctrl: Support Privilege Level Zero Association (PLZA)
> This commit adds support for AMD's Privilege Level Zero Association (PLZA)
> feature. It detects the feature via CPUID_Fn80000020_EBX_x00 [Bit 9] and
> adds the corresponding feature flag to the x86 cpufeatures array.
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
> > diff --git a/arch/x86/include/asm/cpufeatures.h
> b/arch/x86/include/asm/cpufeatures.h
> > index 1b4a48bff18f7..bf6fc71f87fab 100644
> > --- a/arch/x86/include/asm/cpufeatures.h
> > +++ b/arch/x86/include/asm/cpufeatures.h
> > @@ -517,6 +517,7 @@
> >  						      * and purposes if CLEAR_CPU_BUF_VM is set).
> >  						      */
> >  #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support for
> 4k vCPUs */
> > +#define X86_FEATURE_PLZA		(21*32+21) /* Privilege Level Zero Association
> */
> Should this addition also be mirrored in the tools directory copies of
> cpufeatures.h and kcpuid.csv?
> If tools/arch/x86/include/asm/cpufeatures.h is not updated to match, tools
> like
> perf can generate build warnings during check-headers.sh verification. Also,
> without updating tools/arch/x86/kcpuid/cpuid.csv, the kcpuid tool will be
> unaware of the new PLZA feature bit when users query CPU capabilities.
> 
> 
> I thought tools/arch/x86/include/asm/cpufeatures.h would be synced after the
> changes to arch/x86/include/asm/cpufeatures.h are merged. Has that process
> changed?

I guess that hasn't changed:

tools/include/uapi/README

Let's add those perf tools hackers to confirm.

> If the expectation is to update tools/arch/x86/include/asm/cpufeatures.h as
> part of this patch, I can add those changes as well.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

