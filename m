Return-Path: <linux-doc+bounces-1319-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D0A7D9D08
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 17:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DCC91C20F80
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 15:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBDE374F5;
	Fri, 27 Oct 2023 15:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoKjxhWa"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AD11F5E7
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 15:32:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9CACAC;
	Fri, 27 Oct 2023 08:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698420769; x=1729956769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DjuX/wAHbc+xCWejQxL14B3DRyOZ9EdymSlvm/og6O4=;
  b=LoKjxhWauxx39vnxRa7y0tWQ9oAkY+lfxxfbK1/YvbUDDx+uUkQLyRkB
   PVTxUeMD6t3bq9yPodmd4cEfllnrtLCGc1Q7MdpulsaJgrrU2fulW6mAp
   rWY/PH/6FXp8JqhYsHhHUjkDtnTx1Ce7AW3WN74+9jNRPcJeBdKH4uEJP
   cE6XgI07G2N7aQMPlL2PBQ14bEvWqS3Kpf1CKZ8KXjJqJkesE4kqgxfQI
   6Wws0uWLN+YKirieli7LwLOQW7lwZVAQQWC95umudHQO2MDvSjjrrN+P3
   C97TXaF/r0h9HbnJ1b7GHrF9lco6veuHgps4OzQsgq4U7ongrsFdBG5gL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="474035579"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="474035579"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 08:32:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="753150122"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="753150122"
Received: from dmnassar-mobl.amr.corp.intel.com (HELO desk) ([10.212.203.39])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 08:32:44 -0700
Date: Fri, 27 Oct 2023 08:32:42 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alyssa Milburn <alyssa.milburn@intel.com>,
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v4 0/6] Delay VERW
Message-ID: <20231027153242.ruabpxxywhq5upc7@desk>
References: <20231027-delay-verw-v4-0-9a3622d4bcf7@linux.intel.com>
 <20231027144848.GGZTvN0AtGIQ9kBtkA@fat_crate.local>
 <20231027150535.s4nlkppsvzeahm7t@desk>
 <20231027151226.GIZTvTWuQUXdsmt6v3@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027151226.GIZTvTWuQUXdsmt6v3@fat_crate.local>

On Fri, Oct 27, 2023 at 05:12:26PM +0200, Borislav Petkov wrote:
> On Fri, Oct 27, 2023 at 08:05:35AM -0700, Pawan Gupta wrote:
> > I am going on a long vacation next week, I won't be working for the rest
> > of the year. So I wanted to get this in a good shape quickly. This
> > patchset addresses some security issues (although theoretical). So there
> > is some sense of urgency. Sorry for spamming, I'll take you off the To:
> > list.
> 
> Even if you're leaving for vacation, I'm sure some colleague of yours or
> dhansen will take over this for you. So there's no need to keep sending
> this every day. Imagine everyone who leaves for vacation would start
> doing that...

I can imagine the amount emails maintainers get. I'll take care of this
in future. But, its good to get some idea on how much is too much,
specially for a security issue?

