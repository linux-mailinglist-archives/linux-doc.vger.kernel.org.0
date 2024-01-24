Return-Path: <linux-doc+bounces-7439-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC1E83B193
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jan 2024 19:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 648ACB26863
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jan 2024 18:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB14B13174C;
	Wed, 24 Jan 2024 18:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1yoC7uC/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB7512BE98
	for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 18:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706122522; cv=none; b=FV+2PdcEDH6qIEo5BUrg1LEPU42kg4Qbsoj3i01Ja+wqnKwNVb5q9amMvP/uigJQzEB1UvC4PUk/uVJF3/KPms62hJDVkDzAp7Z5gyWJeCWvLtMD57sru1cF4fM0WHYte8TyC/mY6RnZnYIk/NpU/xbWH+R51R0ArprN5h9pdlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706122522; c=relaxed/simple;
	bh=oWD5VLSXRA+rwKDmOK0WcQfre24wTxNEWYYxv4RGXoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXbHsCts/n87AymryJksD4vryon1uv7LzqYUS1AyoSljbK9hxHu/B/D8Oy1VK3XkjzERb5ElnpbAGcPiQ23IKXK6Vo20hXPUaP4+5Fv7xeJagr6CAsGQKIcBG6fCOoAUjZXb6umkPI3VhRhAnmyOPU7bspS+BAlCa6Z1atvxlPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1yoC7uC/; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d71e1d7c78so35115895ad.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 10:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706122519; x=1706727319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jDj/r0j6wjrBeKVb5gL0FLzmDiXz6FHRYIwfCvn46Xc=;
        b=1yoC7uC/hCY8BTp//3vVQjs2fRNi6cyFkfIHtPN6N6jHHHktsbh7IlTpm6c5kf+Gws
         QQzmoGSw0qCswbL2GozTeiEoDhFcskhTFsHK3Jarwkk4id+wtSV5N5rg76d6X2FTPGMD
         q8MRneyYV4rGpab3Lq5qJsnUTNcmfdlyFXDXHs6KjT+19e9JRglz9l31kTsF3EkyurWI
         W3stkLM6awyOJBw/ko7XbHRMWrTb6lBDoj6R7EsDL2GkYBdKhVnEiTShZ35HOUQ+gv/t
         YXN0uGkVTsDnZYUSHSShiGP541XuSDHzJPH3Hm9XU55D9JkxmnLErCuZpmO9JnIj/uoc
         9k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706122519; x=1706727319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDj/r0j6wjrBeKVb5gL0FLzmDiXz6FHRYIwfCvn46Xc=;
        b=JtkpR8jvEEsU/jBKvcR8hve7IpX8IFwveidMbYdLsymI9bfBfUA5AkzFlykvKrrrx2
         RsZuML70CmUMxZqcROHfrYzZ09JzxQlyl/Rntj4gB4R5HbfsCBf2JrFR6hlDXQflWDA3
         FJgnxgv95JpiGblG0Fc+RXydATo2yDaXL6AYv5OodcYLaa+oNosGOov65m+cUCAHmf0j
         3+2mZXI2MdhBu09AidffF1n1fk4zY0ETjviUYPotvi99zdMMXxNHRKADhwv6unw1bNyQ
         k8Tvybh9rJzXMa48JBPMCPooaR/dvLsdCpnP1iL7o86xzG9reBnc3OuLEasJ2RQozDrz
         9WOQ==
X-Gm-Message-State: AOJu0Yz7Bu6EsbnRnhnsmKNK9UkAylkskx1k3ksfCdp+zzXlAgWtbmjC
	+0R7xrQLSrhMDpp+Ret2fHVn7BzjRoZJKM2tL0jJMocESPRXxy29mrksUW43fyQ=
X-Google-Smtp-Source: AGHT+IEIpZf36EhWLz+OQgHES8qLiyZ0UwP9vaFkyqYaaf3TE93IIKGP2XO1CzR3BfCEE2NcFO6xbw==
X-Received: by 2002:a17:902:d4ce:b0:1d7:8e11:14a0 with SMTP id o14-20020a170902d4ce00b001d78e1114a0mr887617plg.91.1706122518713;
        Wed, 24 Jan 2024 10:55:18 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709028f8700b001d71935e5c1sm9210654plo.195.2024.01.24.10.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 10:55:18 -0800 (PST)
Date: Wed, 24 Jan 2024 10:55:16 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v9 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Message-ID: <ZbFdFARPQzjRd2g8@ghost>
References: <20240123-fencei-v9-0-71411bfe8d71@rivosinc.com>
 <20240123-fencei-v9-2-71411bfe8d71@rivosinc.com>
 <26808f34-d9c4-404a-bf09-45c4aff139ad@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26808f34-d9c4-404a-bf09-45c4aff139ad@ghiti.fr>

On Wed, Jan 24, 2024 at 08:19:42AM +0100, Alexandre Ghiti wrote:
> On 24/01/2024 00:29, Charlie Jenkins wrote:
> > Provide documentation that explains how to properly do CMODX in riscv.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   Documentation/arch/riscv/cmodx.rst | 96 ++++++++++++++++++++++++++++++++++++++
> >   Documentation/arch/riscv/index.rst |  1 +
> >   2 files changed, 97 insertions(+)
> > 
> > diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
> > new file mode 100644
> > index 000000000000..2ad46129d812
> > --- /dev/null
> > +++ b/Documentation/arch/riscv/cmodx.rst
> > @@ -0,0 +1,96 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +==============================================================================
> > +Concurrent Modification and Execution of Instructions (CMODX) for RISC-V Linux
> > +==============================================================================
> > +
> > +CMODX is a programming technique where a program executes instructions that were
> > +modified by the program itself. Instruction storage and the instruction cache
> > +(icache) are not guaranteed to be synchronized on RISC-V hardware. Therefore, the
> > +program must enforce its own synchronization with the unprivileged fence.i
> > +instruction.
> > +
> > +However, the default Linux ABI prohibits the use of fence.i in userspace
> > +applications. At any point the scheduler may migrate a task onto a new hart. If
> > +migration occurs after the userspace synchronized the icache and instruction
> > +storage with fence.i, the icache will no longer be clean. This is due to the
> 
> 
> Nit: I think you mean "the icache on the new hart will no longer be clean".

Aw yes, that should be more explicit.

- Charlie

> 
> 
> > +behavior of fence.i only affecting the hart that it is called on. Thus, the hart
> > +that the task has been migrated to may not have synchronized instruction storage
> > +and icache.
> > +
> > +There are two ways to solve this problem: use the riscv_flush_icache() syscall,
> > +or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl() and emit fence.i in
> > +userspace. The syscall performs a one-off icache flushing operation. The prctl
> > +changes the Linux ABI to allow userspace to emit icache flushing operations.
> > +
> > +As an aside, "deferred" icache flushes can sometimes be triggered in the kernel.
> > +At the time of writing, this only occurs during the riscv_flush_icache() syscall
> > +and when the kernel uses copy_to_user_page(). These deferred flushes happen only
> > +when the memory map being used by a hart changes. If the prctl() context caused
> > +an icache flush, this deferred icache flush will be skipped as it is redundant.
> > +Therefore, there will be no additional flush when using the riscv_flush_icache()
> > +syscall inside of the prctl() context.
> > +
> > +prctl() Interface
> > +---------------------
> > +
> > +Call prctl() with ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` as the first argument. The
> > +remaining arguments will be delegated to the riscv_set_icache_flush_ctx
> > +function detailed below.
> > +
> > +.. kernel-doc:: arch/riscv/mm/cacheflush.c
> > +	:identifiers: riscv_set_icache_flush_ctx
> > +
> > +Example usage:
> > +
> > +The following files are meant to be compiled and linked with each other. The
> > +modify_instruction() function replaces an add with 0 with an add with one,
> > +causing the instruction sequence in get_value() to change from returning a zero
> > +to returning a one.
> > +
> > +cmodx.c::
> > +
> > +	#include <stdio.h>
> > +	#include <sys/prctl.h>
> > +
> > +	extern int get_value();
> > +	extern void modify_instruction();
> > +
> > +	int main()
> > +	{
> > +		int value = get_value();
> > +		printf("Value before cmodx: %d\n", value);
> > +
> > +		// Call prctl before first fence.i is called inside modify_instruction
> > +		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_ON, PR_RISCV_CTX_SW_FENCEI, PR_RISCV_SCOPE_PER_PROCESS);
> > +		modify_instruction();
> > +
> > +		value = get_value();
> > +		printf("Value after cmodx: %d\n", value);
> > +		return 0;
> > +	}
> > +
> > +cmodx.S::
> > +
> > +	.option norvc
> > +
> > +	.text
> > +	.global modify_instruction
> > +	modify_instruction:
> > +	lw a0, new_insn
> > +	lui a5,%hi(old_insn)
> > +	sw  a0,%lo(old_insn)(a5)
> > +	fence.i
> > +	ret
> > +
> > +	.section modifiable, "awx"
> > +	.global get_value
> > +	get_value:
> > +	li a0, 0
> > +	old_insn:
> > +	addi a0, a0, 0
> > +	ret
> > +
> > +	.data
> > +	new_insn:
> > +	addi a0, a0, 1
> > diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/riscv/index.rst
> > index 4dab0cb4b900..eecf347ce849 100644
> > --- a/Documentation/arch/riscv/index.rst
> > +++ b/Documentation/arch/riscv/index.rst
> > @@ -13,6 +13,7 @@ RISC-V architecture
> >       patch-acceptance
> >       uabi
> >       vector
> > +    cmodx
> >       features
> > 
> 
> I don't know how man pages are synchronized with new additions in the
> kernel, do you? It would be nice to have this new prctl documented for
> userspace.
> 
> Thanks,
> 
> Alex
> 

