Return-Path: <linux-doc+bounces-866-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9877D4155
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 23:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86DF4281692
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 21:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C338B21117;
	Mon, 23 Oct 2023 21:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSDs0Vg5"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C5A1848
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 21:05:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C577DBE;
	Mon, 23 Oct 2023 14:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698095146; x=1729631146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4M5y2i+2W2PLq06Wz4aCTn1NnMGfVddGl4aYzB45fmg=;
  b=VSDs0Vg5O8LqKxy9pptsjViY1IZ6S3ga/VCAlXva9lracVwOx+6wgqU9
   qsSgvHtkLwggH9hyu1RV4UeF2vUnAmKM6weG8er+LrcjL4WcaWjob94hd
   5GbStZAGuBj/No6SNbfrxf5gFLubMfQJvHOKDopIcFrp1pXo66BnuPdOf
   jYVQMm3GkBKSfEpEp0JY/C/myqZBSbUkQ2vjwetRL5Lq5GRT11SLYtzl5
   O/LKPLnxeWS+cEm9div8cbAgOiuHgAaYUMQk1Me8jX9nAyjb/P5NEJgtv
   HksYTXh9RglrQvFi1FFygEF5lYAiX7GYHjjy7FWX4Vgpm8uFexI8nHNAm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="473155797"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="473155797"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 14:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="761879358"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="761879358"
Received: from qwilliam-mobl.amr.corp.intel.com (HELO desk) ([10.212.150.186])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 14:05:45 -0700
Date: Mon, 23 Oct 2023 14:04:10 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
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
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH  2/6] x86/entry_64: Add VERW just before userspace
 transition
Message-ID: <20231023210410.6oj7ekelf5puoud6@desk>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-2-cff54096326d@linux.intel.com>
 <20231023183521.zdlrfxvsdxftpxly@treble>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023183521.zdlrfxvsdxftpxly@treble>

On Mon, Oct 23, 2023 at 11:35:21AM -0700, Josh Poimboeuf wrote:
> On Fri, Oct 20, 2023 at 01:45:03PM -0700, Pawan Gupta wrote:
> > @@ -663,6 +665,10 @@ SYM_INNER_LABEL(swapgs_restore_regs_and_return_to_usermode, SYM_L_GLOBAL)
> >  	/* Restore RDI. */
> >  	popq	%rdi
> >  	swapgs
> > +
> > +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> > +	USER_CLEAR_CPU_BUFFERS
> > +
> >  	jmp	.Lnative_iret
> >  
> >  
> > @@ -774,6 +780,9 @@ native_irq_return_ldt:
> >  	 */
> >  	popq	%rax				/* Restore user RAX */
> >  
> > +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> > +	USER_CLEAR_CPU_BUFFERS
> > +
> 
> Can the above two USER_CLEAR_CPU_BUFFERS be replaced with a single one
> just above native_irq_return_iret?  Otherwise the native_irq_return_ldt
> case ends up getting two VERWs.

Wouldn't that make interrupts returning to kernel also execute VERWs?

idtentry_body
  error_return
    restore_regs_and_return_to_kernel
      verw

native_irq_return_ldt doesn't look to be a common case. Anyways, I will
see how to remove the extra VERW.

> >  	/*
> >  	 * RSP now points to an ordinary IRET frame, except that the page
> >  	 * is read-only and RSP[31:16] are preloaded with the userspace
> > @@ -1502,6 +1511,9 @@ nmi_restore:
> >  	std
> >  	movq	$0, 5*8(%rsp)		/* clear "NMI executing" */
> >  
> > +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> > +	USER_CLEAR_CPU_BUFFERS
> > +
> >  	/*
> >  	 * iretq reads the "iret" frame and exits the NMI stack in a
> >  	 * single instruction.  We are returning to kernel mode, so this
> 
> This isn't needed here.  This is the NMI return-to-kernel path.

Yes, the VERW here can be omitted. But probably need to check if an NMI
occuring between VERW and ring transition will still execute VERW after
the NMI.

