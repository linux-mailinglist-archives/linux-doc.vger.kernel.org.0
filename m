Return-Path: <linux-doc+bounces-1043-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9513B7D592E
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 18:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FB50B20FBC
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 16:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547A92940C;
	Tue, 24 Oct 2023 16:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxxCOlrJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2B5241E1
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 16:51:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0D512B;
	Tue, 24 Oct 2023 09:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698166271; x=1729702271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LhfLeQjT1NBATI10s/IuG90Bv24jkdT/VZiPecD03ZY=;
  b=YxxCOlrJIAzJ97/926Qyv3/xpqc8+mRpb8jrQ7FKReUMFvVu/yW0i8DP
   nq5Hr75+/eljuZAZRgi0empLVpcJdzmnDK3wQUGbeB85wxiU7iSsG+HC5
   Myawh48UjqwT1pFlL/2Em/LEOOeHpBNq6atgnPS1zZA6Rihl+VxNgu/Au
   lvVBVoLWWN6YzjCDnrtX0nJ1t5xfQ4R1TsF4v+Fa6tAvkl1Vj+MohK17q
   NZZCPGryow67C5dDgU8fvqADgp+aWF9OeTjkz/qzeILkTn/+isL5wt+h/
   gSSF+n+J2y/hW0s4LcB7rxQf8B7+xaYJGzQqOg363G6M88E5ee9H6M41m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451339987"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="451339987"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 09:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="758530739"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="758530739"
Received: from zijianw1-mobl.amr.corp.intel.com (HELO desk) ([10.209.109.187])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 09:45:37 -0700
Date: Tue, 24 Oct 2023 09:45:20 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
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
Subject: Re: [PATCH  v2 1/6] x86/bugs: Add asm helpers for executing VERW
Message-ID: <20231024164520.osvqo2dja2xhb7kn@desk>
References: <20231024-delay-verw-v2-0-f1881340c807@linux.intel.com>
 <20231024-delay-verw-v2-1-f1881340c807@linux.intel.com>
 <20231024103601.GH31411@noisy.programming.kicks-ass.net>
 <20231024163515.aivo2xfmwmbmlm7z@desk>
 <20231024163621.GD40044@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024163621.GD40044@noisy.programming.kicks-ass.net>

On Tue, Oct 24, 2023 at 06:36:21PM +0200, Peter Zijlstra wrote:
> On Tue, Oct 24, 2023 at 09:35:15AM -0700, Pawan Gupta wrote:
> > On Tue, Oct 24, 2023 at 12:36:01PM +0200, Peter Zijlstra wrote:
> > > On Tue, Oct 24, 2023 at 01:08:21AM -0700, Pawan Gupta wrote:
> > > 
> > > > +.macro CLEAR_CPU_BUFFERS
> > > > +	ALTERNATIVE "jmp .Lskip_verw_\@;", "jmp .Ldo_verw_\@", X86_FEATURE_CLEAR_CPU_BUF
> > > > +		/* nopl __KERNEL_DS(%rax) */
> > > > +		.byte 0x0f, 0x1f, 0x80, 0x00, 0x00;
> > > > +.Lverw_arg_\@:	.word __KERNEL_DS;
> > > > +.Ldo_verw_\@:	verw _ASM_RIP(.Lverw_arg_\@);
> > > > +.Lskip_verw_\@:
> > > > +.endm
> > > 
> > > Why can't this be:
> > > 
> > > 	ALTERNATIVE "". "verw _ASM_RIP(mds_verw_sel)", X86_FEATURE_CLEAR_CPU_BUF
> > > 
> > > And have that mds_verw_sel thing be out-of-line ?
> > 
> > I haven't done this way because its a tad bit fragile as it depends on
> > modules being within 4GB of kernel.
> 
> We 100% rely on that *everywhere*, nothing fragile about it.

I didn't know that, doing it this way then. Thanks.

