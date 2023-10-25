Return-Path: <linux-doc+bounces-1152-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965977D770E
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 23:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 500F7281D91
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 21:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77A4347DD;
	Wed, 25 Oct 2023 21:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlIKAJg5"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967D41401F
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 21:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3004DC433C8;
	Wed, 25 Oct 2023 21:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698270552;
	bh=UBlwui6JXaWM1dHC4n9599bjvvRTpUdWTM8kRxLfVA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DlIKAJg5/J0kp89aSFTWjntfSUCBR8JmJ/nwvzDR1KOa/xQXGRYf1n4+D1EmF5wZi
	 moo6yCTKlRUpYxfsrsJ7RnHmzq6MsQx+jIu91Ten/GYPUEiyh+OZ6jtBX3e7dSL6w1
	 NYth1Y8dP0HwwuUjYpStlSYygiCcvb3435jdcIYm4DrWN9UWdHZvpPlK82tDtzSS/d
	 LqkPaNJiIMqtJ4qwkj3TpsHq9FrLUb5FNZO1Uwytm00qeRftaeDX3BK61Snem/Z97/
	 vxfeLM0+EG9M5VV2nch8gdDO6532a2mPe31wDo2dSFZMovqRGuhHRUH8MQ2/ZHLhzE
	 KD+OpBf8Qg2dQ==
Date: Wed, 25 Oct 2023 14:49:09 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
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
Subject: Re: [PATCH v3 1/6] x86/bugs: Add asm helpers for executing VERW
Message-ID: <20231025214909.yxcldnporsnicrdi@treble>
References: <20231025-delay-verw-v3-0-52663677ee35@linux.intel.com>
 <20231025-delay-verw-v3-1-52663677ee35@linux.intel.com>
 <8b6d857f-cbf6-4969-8285-f90254bdafc0@citrix.com>
 <20231025212806.pgykrxzcmbhrhix5@treble>
 <da782a61-e7f6-45fa-88e9-9d974dcc1a87@citrix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da782a61-e7f6-45fa-88e9-9d974dcc1a87@citrix.com>

On Wed, Oct 25, 2023 at 10:30:52PM +0100, Andrew Cooper wrote:
> On 25/10/2023 10:28 pm, Josh Poimboeuf wrote:
> > On Wed, Oct 25, 2023 at 10:10:41PM +0100, Andrew Cooper wrote:
> >> On 25/10/2023 9:52 pm, Pawan Gupta wrote:
> >>> diff --git a/arch/x86/entry/entry.S b/arch/x86/entry/entry.S
> >>> index bfb7bcb362bc..f8ba0c0b6e60 100644
> >>> --- a/arch/x86/entry/entry.S
> >>> +++ b/arch/x86/entry/entry.S
> >>> @@ -20,3 +23,16 @@ SYM_FUNC_END(entry_ibpb)
> >>>  EXPORT_SYMBOL_GPL(entry_ibpb);
> >>>  
> >>>  .popsection
> >>> +
> >>> +.pushsection .entry.text, "ax"
> >>> +
> >>> +.align L1_CACHE_BYTES, 0xcc
> >>> +SYM_CODE_START_NOALIGN(mds_verw_sel)
> >>> +	UNWIND_HINT_UNDEFINED
> >>> +	ANNOTATE_NOENDBR
> >>> +	.word __KERNEL_DS
> >> You need another .align here.  Otherwise subsequent code will still
> >> start in this cacheline and defeat the purpose of trying to keep it
> >> separate.
> >>
> >>> +SYM_CODE_END(mds_verw_sel);
> >> Thinking about it, should this really be CODE and not a data entry?
> >>
> >> It lives in .entry.text but it really is data and objtool shouldn't be
> >> writing ORC data for it at all.
> >>
> >> (Not to mention that if it's marked as STT_OBJECT, objdump -d will do
> >> the sensible thing and not even try to disassemble it).
> >>
> >> ~Andrew
> >>
> >> P.S. Please CC on the full series.  Far less effort than fishing the
> >> rest off lore.
> > +1 to putting it in .rodata or so.
> 
> It's necessarily in .entry.text so it doesn't explode with KPTI active.

Ah, right.  In general tooling doesn't take too kindly to putting data
in a text section.  But it might be ok.

-- 
Josh

