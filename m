Return-Path: <linux-doc+bounces-96149-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K0vxDFFPUGoHwgIAu9opvQ
	(envelope-from <linux-doc+bounces-96149-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 03:48:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9EF7368AA
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 03:48:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alien8.de header.s=alien8 header.b="IGVvre/j";
	dmarc=pass (policy=none) header.from=alien8.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96149-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96149-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37BB6301D680
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 01:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538A11FCFFC;
	Fri, 10 Jul 2026 01:47:57 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0EE381C4;
	Fri, 10 Jul 2026 01:47:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783648077; cv=none; b=tAaB3aDgcksXLjDYVLly4wvsbLsNCcLgnLtkIN2Nod+c97fTKuRmi6+YbSkkpPWo1iuRcO+YEO+mrGEauSltuG8zj3BpEZb+3zb7KQNs+HyEOd6pmQMsG0fNxjz0dwLnqZw1Boq7rpjNYcmUqAbBvZAM3LVnrAAOOX5p8xxtO7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783648077; c=relaxed/simple;
	bh=E3YtPlfuAZ4tQ4Mk/fRyeG24Is6TpevNJMxODfE9m3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXq6y8p2iNu2Vybpek4AF70plO845MrFetRXz3sYtnteyEWyXezMSwoXkPBxnMDFsBEfSFMLYStPuVtmEnEVSrVpmb5uT/O5G8F5HhA+Yzh4DoXtXHmLPI1RM4F0OHzz7Hu8j9ou1dqeYHwqsv4ysGMH2S7TCRhab0J2d7W3NaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IGVvre/j; arc=none smtp.client-ip=65.109.113.108
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D121940E0031;
	Fri, 10 Jul 2026 01:47:51 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hf8slUNXJT8R; Fri, 10 Jul 2026 01:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783648061; bh=8f4x+XzwHLASKFRDpcb7mw8JVWfNiwTGDazea1MJXI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IGVvre/jKW0tuL4GqtkrN5Oy/3ZcU+sO6C+wSP92+OpLWsW0o8EOT5tLt6AOj+Jtc
	 Tq7hdurBy1/wm6W8LEh1p1DUh5zmPi2gLDRqqck1owwRRk/J2WfkcCJYU9jTIOPJC7
	 NMXd5nC/t38a1c+GIIsNidYhXL8Okwjy3Wr2V+mMRBgs4nK+uqw3shTUIQBcRqtVV2
	 PUbgs3m1J649Y8SOD2oEoIcu4jswmmgug22pzXtIQCPj5xfg8m+z9CZRdNrNLG6eJ/
	 VnCHfhMrG3XsKM9nqcn/IoLomjwUuOPvqmS5lOC7LAqZpUXzemwFsGz0gPjZP/kN/B
	 M5HBNmNPNOa9GtzN3Zgs9HNz1HWWf8rDXskrSQFa7wZUMxh1L0bwbyMi5xaQWyYeSi
	 yVI0wU7g2RXl7KdzekKKde1WdVzIqVzZ8NYlFz2RWUgPb4p6LDeJqVbTb6rm/+CA//
	 xEGzxZ0K4I8JN/G2MycenSt69SkgMXSQmAw1cTzmQkhbO8kpfhByiVeJ6Ctb/bbb6o
	 4HKPGsw3MOMbCmNi7QyJXMpCr/jdw/VlnV+m/v+zBmjm9T3/6WJTP9QxFzotInNZyW
	 jOp7jxAxDOGsicyjnXkkEIJHM8A01JGO/vWGTWEz7DUNcHeLnXXGrf4WvMrLhQSuUv
	 P4Pc/IpUQ8NvwqWVbp5YYy8M=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E7ED840E00C0;
	Fri, 10 Jul 2026 01:46:56 +0000 (UTC)
Date: Thu, 9 Jul 2026 18:46:53 -0700
From: Borislav Petkov <bp@alien8.de>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Babu Moger <babu.moger@amd.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>, corbet@lwn.net,
	tony.luck@intel.com, reinette.chatre@intel.com, Dave.Martin@arm.com,
	james.morse@arm.com, tglx@kernel.org, ben.horgan@arm.com,
	fenghuay@nvidia.com, skhan@linuxfoundation.org, x86@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	akpm@linux-foundation.org, rdunlap@infradead.org,
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
Message-ID: <20260710014653.GEalBPDRbEUjbynkqd@fat_crate.local>
References: <0af5122c-20df-4aea-8ab4-cba63f71dc3b@amd.com>
 <20260708232806.GCak7dBi1loq3QLjg7@fat_crate.local>
 <ak7kgJZyKmEVUdMj@google.com>
 <20260709001242.GDak7nevAzb45IGkem@fat_crate.local>
 <alBC_4TcyduQo2zF@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alBC_4TcyduQo2zF@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96149-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,redhat.com,lwn.net,intel.com,arm.com,kernel.org,nvidia.com,linuxfoundation.org,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,linux.alibaba.com,google.com,gmail.com,baidu.com,microsoft.com,linutronix.de,vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bp@alien8.de,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:namhyung@kernel.org,m:babu.moger@amd.com,m:acme@redhat.com,m:corbet@lwn.net,m:tony.luck@intel.com,m:reinette.chatre@intel.com,m:Dave.Martin@arm.com,m:james.morse@arm.com,m:tglx@kernel.org,m:ben.horgan@arm.com,m:fenghuay@nvidia.com,m:skhan@linuxfoundation.org,m:x86@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:seanjc@google.com,m:nikunj@amd.com,m:xin@zytor.com,m:pawan.kumar.gupta@linux.intel.com,m:tiala@microsoft.com,m:chang.seok.bae@intel.com,m:kprateek.nayak@amd.com,m:prathyushi.nangia@amd.com,m:kim.phillips@amd.com,m:naveen@kernel.org,m:darwi@linutronix.de,m:elena.reshetova@intel.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thomas.lendacky@amd.com,m:eranian@google.com
 ,m:peternewman@google.com,m:qinyuntan@linux.alibaba.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[alien8.de:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A9EF7368AA

On Thu, Jul 09, 2026 at 05:55:27PM -0700, Namhyung Kim wrote:
> No, it's perfectly fine to update any tooling headers if you need it.
> It should be up to you whether you update the whole file or just needed
> bits.  Just expect us to do it less frequently. :)

Right, so my angle was to perhaps update it when we touch it anyway so that
you guys don't have to touch it. I don't see a need to update the tools/
cpufeatures.h header when we touch the main one, for example.

And since the goal is not to update the tools/ headers without a concrete
reason for tools/'s sake, we should simply leave them out and you guys can
pick whatever bits you need, when you need them.

Yeah, I think that makes sense.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

