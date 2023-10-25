Return-Path: <linux-doc+bounces-1079-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8C97D61AA
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 08:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20D5A281824
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 06:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4AE14F9F;
	Wed, 25 Oct 2023 06:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgdNuZG1"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEABD111AB
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 06:28:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEEDA6;
	Tue, 24 Oct 2023 23:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698215309; x=1729751309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ol0KZSi6E4ERi8CEDy5vWciPU4wKT9ya2YUVp9DIyQs=;
  b=AgdNuZG1ZvugE4E+MKT2QaAr3g4xvRnRB6RRV8W+QuqDBa8Qt+Gkx/QR
   WCnrcdfA73gWkve/2kBtlOybhaFrHaEUPyVrVlyHezmOw4DsfdcPbTE4h
   qGYOr4PWylTcNYvPzglN620aP1nsL4mPxF+0KCngQ6do+2T6TWSRvzIW6
   USrPOrAWqlXvUN4icW73Jw0tSoID1N0ynqBsiHeDB/ADRlUJUeWg/zkcw
   avil9zJknnCFuPfrT8DMExbywFg9+s03TsTsYdY9AJ9Nylxt5kXsLa4Dg
   Ddq1TAw+s7r6kzMEzhoMx385P9DHMY7qyKoISoucOf7byRvlWgZwsP5l4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="418370679"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="418370679"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 23:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="735287170"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="735287170"
Received: from mhans-mobl3.amr.corp.intel.com (HELO desk) ([10.252.132.200])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 23:28:27 -0700
Date: Tue, 24 Oct 2023 23:28:18 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com,
	Alyssa Milburn <alyssa.milburn@intel.com>
Subject: Re: [RESEND][PATCH 1/6] x86/bugs: Add asm helpers for executing VERW
Message-ID: <20231025062818.7kaerqklaut7dg5r@desk>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-1-cff54096326d@linux.intel.com>
 <f620c7d4-6345-4ad0-8a45-c8089e3c34df@citrix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f620c7d4-6345-4ad0-8a45-c8089e3c34df@citrix.com>

On Sat, Oct 21, 2023 at 12:55:45AM +0100, Andrew Cooper wrote:
> On 20/10/2023 9:44 pm, Pawan Gupta wrote:
> > +#define EXEC_VERW				\
> > +	__EXEC_VERW(551f);			\
> > +	/* nopl __KERNEL_DS(%rax) */		\
> > +	.byte 0x0f, 0x1f, 0x80, 0x00, 0x00;	\
> > +551:	.word __KERNEL_DS;			\
> 
> Is this actually wise from a perf point of view?
> 
> You're causing a data access to the instruction stream, and not only
> that, the immediate next instruction.  Some parts don't take kindly to
> snoops hitting L1I.
> 
> A better option would be to simply have
> 
> .section .text.entry
> .align CACHELINE
> mds_verw_sel:
>     .word __KERNEL_DS
>     int3
> .align CACHELINE
> 
> 
> And then just have EXEC_VERW be
> 
>     verw mds_verw_sel(%rip)
> 
> in the fastpaths.  That keeps the memory operand in .text.entry it works
> on Meltdown-vulnerable CPUs, but creates effectively a data cacheline
> that isn't mixed into anywhere in the frontend, which also gets far
> better locality of reference.

With .text.entry section I am getting getting below warnings and an
error:

-----------------------------------------------------------------
    LD      vmlinux.o
  vmlinux.o: warning: objtool: .text.entry+0x0: unreachable instruction
  vmlinux.o: warning: objtool: .text.entry+0x40: unreachable instruction
  vmlinux.o: warning: objtool: .text.entry+0x80: unreachable instruction
  vmlinux.o: warning: objtool: .text.entry+0xc0: unreachable instruction
  vmlinux.o: warning: objtool: .text.entry+0x100: unreachable instruction
  vmlinux.o: warning: objtool: .text.entry+0x140: unreachable instruction
  vmlinux.o: warning: objtool: .text.entry+0x180: unreachable instruction
  vmlinux.o: warning: objtool: .text.entry+0x1c0: unreachable instruction
  vmlinux.o: warning: objtool: .text.entry+0x200: unreachable instruction
  vmlinux.o: warning: objtool: .text.entry+0x240: unreachable instruction
  vmlinux.o: warning: objtool: .text.entry+0x280: unreachable instruction
  vmlinux.o: warning: objtool: .text.entry+0x2c0: unreachable instruction
  vmlinux.o: warning: objtool: .text.entry+0x300: unreachable instruction
  vmlinux.o: warning: objtool: .altinstr_replacement+0x2c: relocation to !ENDBR: .text.entry+0x0
  vmlinux.o: warning: objtool: .altinstr_replacement+0x1c4: relocation to !ENDBR: .text.entry+0x0
  vmlinux.o: warning: objtool: .altinstr_replacement+0x1d0: relocation to !ENDBR: .text.entry+0x0
  vmlinux.o: warning: objtool: .altinstr_replacement+0x2d2: relocation to !ENDBR: .text.entry+0x80
  vmlinux.o: warning: objtool: .altinstr_replacement+0x5d5: relocation to !ENDBR: .text.entry+0xc0
    OBJCOPY modules.builtin.modinfo
    GEN     modules.builtin
    MODPOST vmlinux.symvers
    UPD     include/generated/utsversion.h
    CC      init/version-timestamp.o
    LD      .tmp_vmlinux.kallsyms1
  ld: error: unplaced orphan section `.text.entry' from `vmlinux.o'
  make[2]: *** [scripts/Makefile.vmlinux:36: vmlinux] Error 1
-----------------------------------------------------------------

... because my config has CONFIG_LD_ORPHAN_WARN_LEVEL="error" and
objtool needs to be told about this entry.

Do you think its worth fighting these warnings and error, or simply use
.rodata section for verw memory operand?

