Return-Path: <linux-doc+bounces-92682-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T867HQbsMmrn7gUAu9opvQ
	(envelope-from <linux-doc+bounces-92682-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 20:48:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FE169BFFD
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 20:48:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=S0jjWACc;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92682-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-92682-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 666583018621
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 18:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C34365A14;
	Wed, 17 Jun 2026 18:48:30 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E7A25B663;
	Wed, 17 Jun 2026 18:48:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781722110; cv=none; b=JpIwoZy1moMTaEOdpmJS8MI9LyHvPq3VHW3bWtbp9IEflXuK5nF8ZZvHdZ05Fm2J2xG4mr/UGAo0PbPHTvmyWXm1Bdfn6bZZ2pxbCFWyqR27VuNBWZ2mUxBi9hiPn6DuxN3T87XqDEg6VdCh4h/7+ZbomzDK5FoMM93XViFHrTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781722110; c=relaxed/simple;
	bh=mLFLeNpmjzgehFww9fNDVoyDeR9A/LMo8QS8CQ7CBIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mar7I9LqH4uMyoVA77b+8X6Q4K1yi4/EKhDZf+EDBYQcK29qv5K699H7wd+WRER+ldXLkca/5JKAxngkt2lDoReBFJd1q6FEI/r/QP5lN7Ss7HbNZLN3Xlbzc/6tJOObub31SLUb/CZiTTUnC6P33LIEf0hig9JvBmdpqmYDiRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0jjWACc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB851F000E9;
	Wed, 17 Jun 2026 18:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781722108;
	bh=wAJ/16SDwjLEOofHEjGBdhyMJ22bR01mfpkTmi9LqFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S0jjWACcAyI73k4vozNk2hdrYq1Z/OE/QQr/fRC/3Fl/wMR6SalSveexvcnvhtP8P
	 sq0k5gKrOkUnhySqDsFacXi4LLQFsE4ZV+6S6Ub2Ztim/SxxqlIirTQTZyDMRypJg5
	 kTkhhdh10kVYN7b1AVsMojdJHHdWirds7fJByCy/bVzEjtn4hCnNqlP4c2Q76E07+J
	 eG9/Y/c55qkexQaoCzKYrj0bGXa4hlplXuQ+cWnkw9qoLKXnMxH0IxuDBclIZDg6JE
	 0jZ9y0rnn+J0b0RDlvVliyoQmsfZfKdlnUO5gBx+frcYJ50r+myYpGn0tA3W9QyChl
	 toG4cYtw/dfLQ==
Date: Wed, 17 Jun 2026 21:48:07 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, robh@kernel.org, saravanak@kernel.org,
	akpm@linux-foundation.org, bhe@redhat.com,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	ruirui.yang@linux.dev, rdunlap@infradead.org, peterz@infradead.org,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	kees@kernel.org, elver@google.com, kuba@kernel.org,
	lirongqing@baidu.com, ebiggers@kernel.org, paulmck@kernel.org,
	leitao@debian.org, coxu@redhat.com, Liam.Howlett@oracle.com,
	ryan.roberts@arm.com, osandov@fb.com, jbohac@suse.cz,
	cfsworks@gmail.com, tangyouling@kylinos.cn,
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com,
	adityag@linux.ibm.com, liaoyuanhong@vivo.com, seanjc@google.com,
	fuqiang.wang@easystack.cn, ardb@kernel.org, chenjiahao16@huawei.com,
	guoren@kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v16 00/10] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-ID: <ajLr53EK6mJbng-7@kernel.org>
References: <20260608073459.3119290-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608073459.3119290-1-ruanjinjie@huawei.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92682-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:robh@kernel.org,m:saravanak@kernel.org,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:ruirui.yang@linux.dev,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:elver@google.com,m:kuba@kernel.org,m:lirongqing@baidu.com,m:ebiggers@kernel.org,m:paulmck@kernel.org,m:leitao@debian.org,m:coxu@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:osandov@fb.com,m:jbohac@suse.cz,m:cfsworks@gmail.com,m:tangyouling@kylinos.cn,m:
 sourabhjain@linux.ibm.com,m:ritesh.list@gmail.com,m:adityag@linux.ibm.com,m:liaoyuanhong@vivo.com,m:seanjc@google.com,m:fuqiang.wang@easystack.cn,m:ardb@kernel.org,m:chenjiahao16@huawei.com,m:guoren@kernel.org,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:devicetree@vger.kernel.org,m:kexec@lists.infradead.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,soleen.com,linux.dev,infradead.org,linux.alibaba.com,google.com,baidu.com,debian.org,oracle.com,fb.com,suse.cz,kylinos.cn,vivo.com,easystack.cn,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68FE169BFFD

Hi Jinjie,

On Mon, Jun 08, 2026 at 03:34:49PM +0800, Jinjie Ruan wrote:
> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
> and crashk_cma memory are almost identical across different architectures,
> This patch set handle them in crash core in a general way, which eliminate
> a lot of duplication code.
> 
> And add support for crashkernel CMA reservation for arm64 and riscv.
> 
> This patch set is rebased on v7.1-rc1.

Please rebase this set on v7.2-rc1 once that's out.

I'm going to queue it in the liveupdate tree then to expose to the wider
testing.

Meanwhile it would be great to chase riscv and x86 maintainers for acks :)

-- 
Sincerely yours,
Mike.

