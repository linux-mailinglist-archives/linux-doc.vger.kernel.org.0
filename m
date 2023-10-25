Return-Path: <linux-doc+bounces-1113-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D65D7D70BF
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 17:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40FDA1C20CE2
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 15:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005DF2AB4F;
	Wed, 25 Oct 2023 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArxU3xFQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822592D62F
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 15:28:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360C41731;
	Wed, 25 Oct 2023 08:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698247694; x=1729783694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6AqSNlNER78vW5+ip/iGIURRm9qeolLQ3W+U9IMny9U=;
  b=ArxU3xFQTTfr9BefBS4+xsnPg2YWoECzOBd1N3Bl4FIr98PsUfT6z1e3
   vrlJKuZIWTOOCC+bO9mVff3ebkxIJ5ClMpWXLrNCaTH3Iz/lZfPFVfw7j
   JG5MD21JGQPUR7sRTshN2ckdewCW8tpNbb6g9k8cGVEE/IJWs1sbjTr/r
   8SuUi4fIN4ueAi7sGcEEQIVzUVXPc28rpu0GUrtLZ/qtwyMlnJwfH5pFn
   PLGXXexrJGaDnT3vR5sWcMB61jD0fS52s5dg7usPOYHOOgOiqQqmRFykU
   RsNL+MWQfen48plSKkKuA9VsWSUUKUrWQ2zo4Kr8MssH/BCLhF2MfOKXk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="390184736"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="390184736"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 08:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="824682530"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="824682530"
Received: from kkomeyli-mobl.amr.corp.intel.com (HELO desk) ([10.251.29.139])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 08:28:08 -0700
Date: Wed, 25 Oct 2023 08:27:54 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
Subject: Re: [RESEND][PATCH 1/6] x86/bugs: Add asm helpers for executing VERW
Message-ID: <20231025152449.w6xre33cs7tkex7k@desk>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-1-cff54096326d@linux.intel.com>
 <f620c7d4-6345-4ad0-8a45-c8089e3c34df@citrix.com>
 <20231025062818.7kaerqklaut7dg5r@desk>
 <20231025072255.GA37471@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025072255.GA37471@noisy.programming.kicks-ass.net>

On Wed, Oct 25, 2023 at 09:22:55AM +0200, Peter Zijlstra wrote:
 
> I'm thinking you need to at the very least stay in a section that's
> actually still mapped with PTI :-)
> 
> .entry.text is the only thing that is reliably mapped with PTI (IIRC),
> some configs also get a chunk of the kernel image, but not all.
> 
> Something like the below should do I suppose.

Thanks, will do this with Andrew's improvements.

> ---
>  arch/x86/entry/entry.S | 15 +++++++++++++++

