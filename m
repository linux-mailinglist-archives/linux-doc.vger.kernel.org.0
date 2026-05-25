Return-Path: <linux-doc+bounces-89339-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG8FCHc0FGpaKwcAu9opvQ
	(envelope-from <linux-doc+bounces-89339-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 13:37:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B23CA5C9FBE
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 13:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 160B530066A2
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 11:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7373937F72B;
	Mon, 25 May 2026 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9sT/QL/"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568B71E3DDE;
	Mon, 25 May 2026 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779709044; cv=none; b=T8JupniVCD1SIH4x4+L61uzowUz/DQ46J4lCgqDEU7LTjFNMFD47EXivYU/qynjwpthAwXl8Fle8X8D1EnfqXbPZH4T5Spc75hQCEpLhgsDMMlxjlrsG+MeFJRTvGh4D1Zzf7uGvnBn5eAq+2ytp0nCRpGKUdnVLz4FlmPQOL1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779709044; c=relaxed/simple;
	bh=smbfgPlCYiq0oxIfwbTZ6QHrcnegZjptbxn2JVpzSUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVlcDR6eVOB+tMUph9a7+zlzyOmZyrnlOZ20wOqWHDglztWCBAr7F/5idi3xzjZD/bJGfUC3ogkbdLEJpD3pJQcHaTP0trkpMv/7Fs3u4Jl317n6F/dycL/Je1wAu8XaOPaICHpONwEI7ikgo9PJ1VJjGTr4ZPEIR06jL8a1jIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9sT/QL/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BBD1F000E9;
	Mon, 25 May 2026 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779709043;
	bh=kPbn/f1fuyb07lSfD/0s4GT4WdFio8z3401p2vvqFyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W9sT/QL/8R3LJxQuJnqULPdrM1nsn4daH1Hjg/KpYXguHjTqD086qv20sIL6mYl7R
	 XvOBmsbGn+aUBuuD7YmCOeIBLyz0kPBoaqx8/W3s5VRN8Uno0zD9eWzhOy98TVtqHK
	 uA5YsM6E1BhscTKFZqCHI7pnI0htTV0tK3UF7zLRCukCjMI3DNJkV8VmQGJ6ffOdN0
	 iYCyXUqWwY3mrHjVk0kX4Rj4QjgL5c4kWpv5gUyVC+8qN/Ciuck/k/UyX3sdsCSWpw
	 EdG7Pg1gWabsDFCJzyUMK6eYBu2NWAC8UFjZF4q/8uJvLDBi9zqnwL/M3hikizHgFZ
	 G0HKwZWWlmGyg==
Date: Mon, 25 May 2026 14:36:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
	skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	ruirui.yang@linux.dev, rdunlap@infradead.org, pmladek@suse.com,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	kees@kernel.org, elver@google.com, kuba@kernel.org,
	lirongqing@baidu.com, ebiggers@kernel.org, paulmck@kernel.org,
	thuth@redhat.com, ardb@kernel.org, masahiroy@kernel.org,
	mark.rutland@arm.com, maz@kernel.org, james.morse@arm.com,
	leitao@debian.org, sourabhjain@linux.ibm.com, yeoreum.yun@arm.com,
	coxu@redhat.com, jbohac@suse.cz, ryan.roberts@arm.com,
	cfsworks@gmail.com, tangyouling@kylinos.cn, ritesh.list@gmail.com,
	songshuaishuai@tinylab.org, junhui.liu@pigmoral.tech,
	vishal.moola@gmail.com, kas@kernel.org, debug@rivosinc.com,
	namcao@linutronix.de, liaoyuanhong@vivo.com,
	fuqiang.wang@easystack.cn, seanjc@google.com, guoren@kernel.org,
	chenjiahao16@huawei.com, hbathini@linux.ibm.com, bgwin@google.com,
	takahiro.akashi@linaro.org, lizhengyu3@huawei.com, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCH v14 00/17] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-ID: <ahQ0WRiMsB011tym@kernel.org>
References: <20260525084932.934910-1-ruanjinjie@huawei.com>
 <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[huawei.com,lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,soleen.com,linux.dev,infradead.org,suse.com,linux.alibaba.com,google.com,baidu.com,debian.org,suse.cz,kylinos.cn,tinylab.org,pigmoral.tech,rivosinc.com,linutronix.de,vivo.com,easystack.cn,linaro.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-89339-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[76];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,huawei.com:email]
X-Rspamd-Queue-Id: B23CA5C9FBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Huacai,

On Mon, May 25, 2026 at 06:14:52PM +0800, Huacai Chen wrote:
> On Mon, May 25, 2026 at 4:50 PM Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> >
> > Jinjie Ruan (16):
> >   riscv: kexec_file: Fix crashk_low_res not exclude bug
> >   powerpc/crash: Fix possible memory leak in update_crash_elfcorehdr()
> >   arm64: kexec: Fix image->elf_headers memory leak during retry loop
> >   x86/kexec: Fix potential buffer overflow in prepare_elf_headers()
> >   arm64: kexec_file: Fix potential buffer overflow in
> >     prepare_elf_headers()
> >   riscv: kexec_file: Fix potential buffer overflow in
> >     prepare_elf_headers()
> >   LoongArch: kexec: Fix potential buffer overflow in
> >     prepare_elf_headers()
> >   crash: Add crash_prepare_headers() to exclude crash kernel memory
> >   arm64: kexec_file: Use crash_prepare_headers() helper to simplify code
> >   x86/kexec: Use crash_prepare_headers() helper to simplify code
> >   riscv: kexec_file: Use crash_prepare_headers() helper to simplify code
> >   LoongArch: kexec: Use crash_prepare_headers() helper to simplify code
> >   crash: Use crash_exclude_core_ranges() on powerpc
> >   arm64: kexec: Add support for crashkernel CMA reservation
> >   riscv: kexec: Add support for crashkernel CMA reservation
> >   arm64/crash: Add crash hotplug support
> I have some bikesheedings about the subjects. Can we unify the prefix formats?
> x86/kexec, arm64: kexec_file, riscv: kexec_file, LoongArch: kexec .....

It might look weird in the series, but powerpc and x86 use '/' and arm64 and
riscv use ':' so in the logs in arch/ this would be actually fine.

With the only exception of arm64/crash that should have been arm64: crash:
 
> Huacai

-- 
Sincerely yours,
Mike.

