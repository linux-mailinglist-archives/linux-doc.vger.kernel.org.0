Return-Path: <linux-doc+bounces-869-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3FB7D418D
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 23:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEA881C204F8
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 21:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A672F10A3A;
	Mon, 23 Oct 2023 21:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Acqh5PuR"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3397D5680
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 21:17:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B476DD;
	Mon, 23 Oct 2023 14:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698095857; x=1729631857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Nldbc9tzSnQAq+doK1Q2lJrQIRVG5t3dRjDQwEw19w=;
  b=Acqh5PuRU0JDvWDni5flFQCW3LAvHuch3d9KBbiq3EdiAn5vDPwvlVRO
   P/1tFU9WikGrU3L4mdhq9su+Nz52MkfOENkA1RQLMhrDyWcnNYbmpcCyb
   2drp7Nkn1kdKesl927JCLoertOFrGzpn7JHDAUA2KCjquY2KemXyp6tGd
   hktTy2V5EvShHokwel8tHJfad1YsoWedkUq9K9FbqFyqPoiACXy720JQv
   9E2vHem9E0J8qmOu0maNfQGFLUoCC58xRooqdVsIKw0VuiYNTNkIJW7gC
   xaeWYyYq1IamMPF0q1QW1KIl4JR2Sav/3N70Ytbk4Q9TImHWl9GVV+uq/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="377307911"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="377307911"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 14:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="824084736"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="824084736"
Received: from qwilliam-mobl.amr.corp.intel.com (HELO desk) ([10.212.150.186])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 14:17:34 -0700
Date: Mon, 23 Oct 2023 14:17:25 -0700
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
	antonio.gomez.iglesias@linux.intel.com
Subject: Re: [PATCH  6/6] KVM: VMX: Move VERW closer to VMentry for MDS
 mitigation
Message-ID: <20231023211647.lgebgvt622zemg6y@desk>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-6-cff54096326d@linux.intel.com>
 <20231023185643.oyd4irw43ztdqtps@treble>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023185643.oyd4irw43ztdqtps@treble>

On Mon, Oct 23, 2023 at 11:56:43AM -0700, Josh Poimboeuf wrote:
> On Fri, Oct 20, 2023 at 01:45:29PM -0700, Pawan Gupta wrote:
> > @@ -31,6 +32,8 @@
> >  #define VCPU_R15	__VCPU_REGS_R15 * WORD_SIZE
> >  #endif
> >  
> > +#define GUEST_CLEAR_CPU_BUFFERS		USER_CLEAR_CPU_BUFFERS
> 
> I don't think the extra macro buys anything here.

Using USER_CLEAR_CPU_BUFFERS in the VMentry path didn't feel right. But,
after "USER_" is gone as per your comment on 2/6 patch,
GUEST_CLEAR_CPU_BUFFERS can also go away.

