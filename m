Return-Path: <linux-doc+bounces-1243-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0577D8B61
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 00:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EEEA1C20ED8
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 22:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C684D3E47C;
	Thu, 26 Oct 2023 22:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIz6Jzgo"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3EE34CDA
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 22:03:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D2F1B5;
	Thu, 26 Oct 2023 15:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698357821; x=1729893821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=936dDUYVrUWFK2FNzC6j5Oz8gqYA3XKPjUuL+QseAcs=;
  b=QIz6Jzgo/ibHN4NoTRTfMQYiEFTtmmvJeWfztJ0RcwLrSaAoiB2DCF54
   KX/FddQ++koLMe8q69rvS3NC4+3jFpb+HPHKTIWF6TgCzGqvYtcg0VRwP
   PJ8hmZuqEaYK7iepuRcwu80ieT7FgKJIitferZFdP2YZMqGtR2hF9e+iU
   OpPCxGUx36FYpwfNZQPiv2/eqR9fXxd1BqW1fcH5tksw5g+/rp98Rr/cS
   2MEXQDF0Kny1rZH32EBcJuyvv0vZqSJQoYLrUFpLdsea9l1CyDMqvA2C6
   3TUBLEKwksDclWqNgBYxC762y01H50+EwGhRJU4drd7XKZODa8VL2foAU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367873190"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="367873190"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 15:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="762998863"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="762998863"
Received: from paseron-mobl4.amr.corp.intel.com (HELO desk) ([10.209.17.113])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 15:03:31 -0700
Date: Thu, 26 Oct 2023 15:03:29 -0700
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
Subject: Re: [PATCH  v3 6/6] KVM: VMX: Move VERW closer to VMentry for MDS
 mitigation
Message-ID: <20231026220329.gejnqecu2sx5hxv5@desk>
References: <20231025-delay-verw-v3-0-52663677ee35@linux.intel.com>
 <20231025-delay-verw-v3-6-52663677ee35@linux.intel.com>
 <ZTq-b0uVyf6KLNV0@google.com>
 <20231026204810.chvljddk6noxsuqi@desk>
 <ZTrYsls7ya5yOdSV@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTrYsls7ya5yOdSV@google.com>

On Thu, Oct 26, 2023 at 02:22:58PM -0700, Sean Christopherson wrote:
> On Thu, Oct 26, 2023, Pawan Gupta wrote:
> > On Thu, Oct 26, 2023 at 12:30:55PM -0700, Sean Christopherson wrote:
> > > >  	if (static_branch_unlikely(&vmx_l1d_should_flush))
> > > >  		vmx_l1d_flush(vcpu);
> > > 
> > > There's an existing bug here.  vmx_1ld_flush() is not guaranteed to do a flush in
> > > "conditional mode", and is not guaranteed to do a ucode-based flush
> > 
> > AFAICT, it is based on the condition whether after a VMexit any
> > sensitive data could have been touched or not. If L1TF mitigation
> > doesn't consider certain data sensitive and skips L1D flush, executing
> > VERW isn't giving any protection, since that data can anyways be leaked
> > from L1D using L1TF.
> 
> That assumes vcpu->arch.l1tf_flush_l1d is 100% precise and accurate, which is most
> definitely not the case.  You're also preventing the admin from choosing between
> being super paranoind (always flush L1D) and mostly paranoid (conditionally flush
> L1D, always flush CPU buffers).
> AIUI, flushing the L1D is crazy expensive compared to flushing the CPU buffers,
> so it's entirely plausible for someone to want to choose the mostly paranoid
> option.

Sure, if it helps an admin. I was asking about the problematic scenario
out of curiosity. BTW, the changes you suggested are definitely worth
doing.

> Side topic, isn't the NMI path missing a call to kvm_set_cpu_l1tf_flush_l1d()?

Yes, it is missing. Not sure if it was omitted intentionally.

> > This is certainly better, but I don't know what scenario is this helping with.
> 
> Heh, that's host I feel about moving VERW to just before VM-Enter.  I have a hard
> time believing there's meaningful sensitive that's accessed in __vmx_vcpu_run().
> The closest thing is probably CR2, but that's a very dubious vector since CR2 will
> hold a guest value for most VM-Enters.

Yes, kernel->user case has a better chance of leaking anything.

> I'm not against moving VERW close to VM-Enter because it's relatively straightforward,
> but if we're going to be super paranoid, why not go all the way and not have to
> worry about what ifs?

Right. The VMenter changes are mostly done to be consistent with what is being
done for kernel->user.

