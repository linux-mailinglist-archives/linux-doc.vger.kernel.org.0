Return-Path: <linux-doc+bounces-861-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FFC7D3FDD
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 21:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBEF61C2085F
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 19:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C366721A1C;
	Mon, 23 Oct 2023 19:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAZcs097"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C29B125B0
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 19:10:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D708D94;
	Mon, 23 Oct 2023 12:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698088201; x=1729624201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6FMUuDYUTlK2LKUY1b0PZ+zy98w+sI48pzxcDNADCi0=;
  b=fAZcs097bdJYP5PZWkn4oYp5f3l4akvhyvN1Zhk4m/9/HQk4nebf7qQp
   fJSqnist22IDwDkKvrjIp/NI+4aSeQ+WP8LLdYdJAMSzqhALEi1UnGO10
   6r1Joxy90vrWpiqdtVYu13g+DDtVqvvEvXZ8wsvr+NPFlZtzmvn7Y5tSh
   nbM8giiUmBcS8x6A1G7i1INzF+QptL0v6hRA5O08slx5snFiTLLNyWc/O
   LZJaLQk+EF/VxNU/8U5Dl4QOeJo5TAXTTkJwl3xz/tlfwJQREpoZ6LAOr
   Pax4nXFY1xjfRR3DiKxYOGx9UGBJ8tY4/Naoc4c96XnkxjisDw/sTrwjG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="386718669"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="386718669"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 12:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="824055761"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="824055761"
Received: from qwilliam-mobl.amr.corp.intel.com (HELO desk) ([10.212.150.186])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 12:10:00 -0700
Date: Mon, 23 Oct 2023 12:09:49 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <20231023190949.2gdrqisype5metpj@desk>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-1-cff54096326d@linux.intel.com>
 <f620c7d4-6345-4ad0-8a45-c8089e3c34df@citrix.com>
 <20231021011859.c2rtc4vl7l2cl4q6@desk>
 <bdfefc38-c010-4423-b129-3f153078fd67@citrix.com>
 <20231021022134.kbey242xq7n754rg@desk>
 <20231023180806.udbnt4nx3r2bdyi3@treble>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231023180806.udbnt4nx3r2bdyi3@treble>

On Mon, Oct 23, 2023 at 11:08:06AM -0700, Josh Poimboeuf wrote:
> On Fri, Oct 20, 2023 at 07:21:34PM -0700, Pawan Gupta wrote:
> > On Sat, Oct 21, 2023 at 02:33:47AM +0100, Andrew Cooper wrote:
> > > On 21/10/2023 2:18 am, Pawan Gupta wrote:
> > > > On Sat, Oct 21, 2023 at 12:55:45AM +0100, Andrew Cooper wrote:
> > > >> Also it avoids playing games with hiding data inside an instruction.
> > > >> It's a neat trick, but the neater trick is avoid it whenever possible.
> > > > Thanks for the pointers. I think verw in 32-bit mode won't be able to
> > > > address the operand outside of 4GB range.
> > > 
> > > And?  In a 32bit kernel, what lives outside of a 4G range?
> > > 
> > > > Maybe this is fine or could it
> > > > be a problem addressing from e.g. KVM module?
> > > 
> > > RIP-relative addressing is disp32.  Which is the same as it is for
> > > direct calls.
> > > 
> > > So if your module is far enough away for VERW to have issues, you've got
> > > far more basic problems to solve first.
> > 
> > Sorry, I raised the wrong problem. In 64-bit mode, verww only has 32-bit
> > of relative addressing, so memory operand has to be within 4GB of
> > callsite. That could be a constraint.
> 
> Even on x86-64, modules are mapped within 4GB of the kernel, so I don't
> think that's a concern.

You are correct, modules are indeed mapped within 4GB of the kernel. So
what Andrew suggested is feasible. Is that your preference?

