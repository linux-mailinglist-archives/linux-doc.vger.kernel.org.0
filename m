Return-Path: <linux-doc+bounces-747-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E9B7D1A05
	for <lists+linux-doc@lfdr.de>; Sat, 21 Oct 2023 02:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20D07B2141C
	for <lists+linux-doc@lfdr.de>; Sat, 21 Oct 2023 00:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C9837B;
	Sat, 21 Oct 2023 00:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbsS6ABK"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FE5379
	for <linux-doc@vger.kernel.org>; Sat, 21 Oct 2023 00:46:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B5DD7;
	Fri, 20 Oct 2023 17:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697849205; x=1729385205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=63X4BWHvqfvxHGbMrOuUwwimh5i4L/jY9/rWTqH/Zkg=;
  b=IbsS6ABK4iiWRKYhZiKTcWCZp82vj3HVkHOMRQcQpWe3UUxcu2C+tQ8l
   Nx0DRpc9BumpcldaAOrtkmXwbmJHypSqHK5sVU5Hi+XXuoMinHpS/9IrF
   iE3mpuQi9hAH0ZIsdhVXaGopt80J1QuDHi/nizP5++hOCwaapwEX5LvPT
   m5sqf+W5UAfk7hZ7lLkkj13cbved+WnFOtntVOdK5A62fow/ueG/V7Dir
   XmFieWEuvKG3VykoFqSD9Ds2sQORpcPh9khF33dNjke9VJzvZPZufwBOB
   UX0lUT4vYAysB5wcyJwHWChgIxlGUN8+XsB/Xg5vB7ejKhnzazmlYnRah
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="371667259"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="371667259"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 17:46:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="827886437"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="827886437"
Received: from hkchanda-mobl.amr.corp.intel.com (HELO desk) ([10.209.90.113])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 17:46:43 -0700
Date: Fri, 20 Oct 2023 17:46:33 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com
Subject: Re: [PATCH  6/6] KVM: VMX: Move VERW closer to VMentry for MDS
 mitigation
Message-ID: <20231021004633.ymughma7zijosku5@desk>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-6-cff54096326d@linux.intel.com>
 <ZTMFS8I2s8EroSNe@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTMFS8I2s8EroSNe@google.com>

On Fri, Oct 20, 2023 at 03:55:07PM -0700, Sean Christopherson wrote:
> On Fri, Oct 20, 2023, Pawan Gupta wrote:
> > During VMentry VERW is executed to mitigate MDS. After VERW, any memory
> > access like register push onto stack may put host data in MDS affected
> > CPU buffers. A guest can then use MDS to sample host data.
> > 
> > Although likelihood of secrets surviving in registers at current VERW
> > callsite is less, but it can't be ruled out. Harden the MDS mitigation
> > by moving the VERW mitigation late in VMentry path.
> > 
> > Note that VERW for MMIO Stale Data mitigation is unchanged because of
> > the complexity of per-guest conditional VERW which is not easy to handle
> > that late in asm with no GPRs available. If the CPU is also affected by
> > MDS, VERW is unconditionally executed late in asm regardless of guest
> > having MMIO access.
> > 
> > Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> > ---
> >  arch/x86/kvm/vmx/vmenter.S |  9 +++++++++
> >  arch/x86/kvm/vmx/vmx.c     | 10 +++++++---
> >  2 files changed, 16 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/vmx/vmenter.S b/arch/x86/kvm/vmx/vmenter.S
> > index be275a0410a8..efa716cf4727 100644
> > --- a/arch/x86/kvm/vmx/vmenter.S
> > +++ b/arch/x86/kvm/vmx/vmenter.S
> > @@ -1,6 +1,7 @@
> >  /* SPDX-License-Identifier: GPL-2.0 */
> >  #include <linux/linkage.h>
> >  #include <asm/asm.h>
> > +#include <asm/segment.h>
> >  #include <asm/bitsperlong.h>
> >  #include <asm/kvm_vcpu_regs.h>
> >  #include <asm/nospec-branch.h>
> > @@ -31,6 +32,8 @@
> >  #define VCPU_R15	__VCPU_REGS_R15 * WORD_SIZE
> >  #endif
> >  
> > +#define GUEST_CLEAR_CPU_BUFFERS		USER_CLEAR_CPU_BUFFERS
> > +
> >  .macro VMX_DO_EVENT_IRQOFF call_insn call_target
> >  	/*
> >  	 * Unconditionally create a stack frame, getting the correct RSP on the
> > @@ -177,10 +180,16 @@ SYM_FUNC_START(__vmx_vcpu_run)
> >   * the 'vmx_vmexit' label below.
> >   */
> >  .Lvmresume:
> > +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> > +	GUEST_CLEAR_CPU_BUFFERS
> 
> I have a very hard time believing that it's worth duplicating the mitigation
> for VMRESUME vs. VMLAUNCH just to land it after a Jcc.

VERW modifies the flags, so it either needs to be after Jcc or we
push/pop flags that adds 2 extra memory operations. Please let me know
if there is a better option.

> Also, would it'd be better to put the NOP first?  Or even better, out of line?
> It'd be quite hilarious if the CPU pulled a stupid and speculated on the operand
> of the NOP, i.e. if the user/guest controlled RAX allowed for pulling in data
> after the VERW.

I did confirm with CPU architects that NOP operand won't be
dereferenced, even speculatively. But yes, even if it did, moving NOP
first does take care of it.

