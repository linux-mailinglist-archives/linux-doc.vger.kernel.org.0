Return-Path: <linux-doc+bounces-1039-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4EA7D589B
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 18:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E140B21157
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 16:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899DA3AC32;
	Tue, 24 Oct 2023 16:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bvia4VeL"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1EE3AC0C
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 16:36:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1872C93;
	Tue, 24 Oct 2023 09:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FRhM1lkxrMQXB6nBknGKk7DxO1qxF/oGT3Z0ktDXX/c=; b=bvia4VeLbi96QgUtm2UwDli3dl
	sD5sTqhoOKDHRkgmNgdpLszg1kwxUjO9vfBlgEViuJReaFKzlGwpl+1r94ig5eFb5jAWpfAM05VcI
	l6ew3hQ2TkPFk+UwXNuNGFdFxLq/RLAfw1Lnb4PYf9wzRP6582UY7hEN7pjnUx2ytUfdj/kAUr0Dd
	nUse4Z5ibfKe2COkrTmzj3AIIh1WHXltbvk/jSmvgW4FcfrlE3t5JVymO94gQuDuTicL2Rd8n2H0P
	bkofqcMFA1Jd+X1LKHLHaLoL35pUo5YeI+woc+579kPk4t/GTz03Zs1UjA8Pfrbu8Fvl35vURJ96+
	u2prTGew==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qvKOE-00Fdzk-0V;
	Tue, 24 Oct 2023 16:36:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C9A5B300451; Tue, 24 Oct 2023 18:36:21 +0200 (CEST)
Date: Tue, 24 Oct 2023 18:36:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
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
Message-ID: <20231024163621.GD40044@noisy.programming.kicks-ass.net>
References: <20231024-delay-verw-v2-0-f1881340c807@linux.intel.com>
 <20231024-delay-verw-v2-1-f1881340c807@linux.intel.com>
 <20231024103601.GH31411@noisy.programming.kicks-ass.net>
 <20231024163515.aivo2xfmwmbmlm7z@desk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024163515.aivo2xfmwmbmlm7z@desk>

On Tue, Oct 24, 2023 at 09:35:15AM -0700, Pawan Gupta wrote:
> On Tue, Oct 24, 2023 at 12:36:01PM +0200, Peter Zijlstra wrote:
> > On Tue, Oct 24, 2023 at 01:08:21AM -0700, Pawan Gupta wrote:
> > 
> > > +.macro CLEAR_CPU_BUFFERS
> > > +	ALTERNATIVE "jmp .Lskip_verw_\@;", "jmp .Ldo_verw_\@", X86_FEATURE_CLEAR_CPU_BUF
> > > +		/* nopl __KERNEL_DS(%rax) */
> > > +		.byte 0x0f, 0x1f, 0x80, 0x00, 0x00;
> > > +.Lverw_arg_\@:	.word __KERNEL_DS;
> > > +.Ldo_verw_\@:	verw _ASM_RIP(.Lverw_arg_\@);
> > > +.Lskip_verw_\@:
> > > +.endm
> > 
> > Why can't this be:
> > 
> > 	ALTERNATIVE "". "verw _ASM_RIP(mds_verw_sel)", X86_FEATURE_CLEAR_CPU_BUF
> > 
> > And have that mds_verw_sel thing be out-of-line ?
> 
> I haven't done this way because its a tad bit fragile as it depends on
> modules being within 4GB of kernel.

We 100% rely on that *everywhere*, nothing fragile about it.

