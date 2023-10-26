Return-Path: <linux-doc+bounces-1228-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 622FF7D88EC
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 21:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16BB52820CA
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 19:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED033B2AB;
	Thu, 26 Oct 2023 19:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvB9t1jT"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936C03AC35
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 19:29:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFAE12A;
	Thu, 26 Oct 2023 12:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698348593; x=1729884593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UCuF++K/DRoYTSz+IUQsOAUxD4trrlqrqUJab+FeXUc=;
  b=lvB9t1jTzntGOLg5FsK4AcCwwoZKKAlW39xA6KwLArqpWxF0PAb8g9ky
   BMrU467sV+5dLK/5O2qhWDTaZZJevIXswOyvn5dpVQB9hs4RROPF+yWid
   Ug5cFjTOFhw9fLcdKvHZvHxcjPHRjvMTn3wJBIG2YPjEPxgEx2UKP5spq
   OQEA2V243vxWfV2tiBtMBnGG7oizYWFGuiqNtphH/pEICe/mkktRakZzV
   xVA20KsyE4dbJC5Yd3K1eW+Kg/ojxoOU4/Wo9NSJ7ooxgPn3wwldUmFvP
   HIfEYR2OcZ9p+YeDFICXsWQ2C2QCH1FNtZGNZfvCFTxuW6/Pxfm7S1xpw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="425274"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="425274"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 12:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="752860578"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="752860578"
Received: from paseron-mobl4.amr.corp.intel.com (HELO desk) ([10.209.17.113])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 12:29:51 -0700
Date: Thu, 26 Oct 2023 12:29:50 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>
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
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v3 2/6] x86/entry_64: Add VERW just before userspace
 transition
Message-ID: <20231026192950.ylzc66f3f5naqvjv@desk>
References: <20231025-delay-verw-v3-0-52663677ee35@linux.intel.com>
 <20231025-delay-verw-v3-2-52663677ee35@linux.intel.com>
 <2cda7e85-aa75-4257-864d-0092b3339e0e@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cda7e85-aa75-4257-864d-0092b3339e0e@suse.com>

On Thu, Oct 26, 2023 at 07:25:27PM +0300, Nikolay Borisov wrote:
> 
> 
> On 25.10.23 г. 23:52 ч., Pawan Gupta wrote:
> 
> <snip>
> 
> > @@ -1520,6 +1530,7 @@ SYM_CODE_START(ignore_sysret)
> >   	UNWIND_HINT_END_OF_STACK
> >   	ENDBR
> >   	mov	$-ENOSYS, %eax
> > +	CLEAR_CPU_BUFFERS
> 
> nit: Just out of curiosity is it really needed in this case or it's doesn
> for the sake of uniformity so that all ring3 transitions are indeed
> covered??

Interrupts returning to kernel don't clear the CPU buffers. I believe
interrupts will be enabled here, and getting an interrupt here could
leak the data that interrupt touched.

