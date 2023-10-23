Return-Path: <linux-doc+bounces-858-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A5A7D3F81
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 20:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D507F281256
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 18:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4090B2135D;
	Mon, 23 Oct 2023 18:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKZotqrz"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C1120317
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 18:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9937C433C8;
	Mon, 23 Oct 2023 18:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698086926;
	bh=cvYxySdgl+SSffKthUQYcmnzcQEhBW8ys75F8wjA2xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VKZotqrzZy1mTRr7FWkB0d2qDIiiQGAJ9bDjq+VTRDfn+3mivoqDZayOVR4oTcnrN
	 EAYAlAlDg/m724zZLBIEUI4oV4lX77WZFtmmX2bgkv8j3NiArP49fyYjmGLhdxOGrW
	 YCSm13ZhYrH92UNA8Ws1R6a56mCdSOE9GcnaeSW1BCERRL8e+ONx5oGw3IBLQfwS9e
	 vIfG/yJSzcVitPHnM+h7avJB/PLEzShMotgN/aCtSj9cTxE0Hqr//UA4X4AuC9yUYd
	 j5NMZmYoJ52CPpQXFzEuCATDZnW72dFUjYgjNYixYXWYZ8qBBppAsbiLIRhNPrpkvh
	 aqVl+oe4EcOzw==
Date: Mon, 23 Oct 2023 11:48:44 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
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
Subject: Re: [PATCH  4/6] x86/bugs: Use ALTERNATIVE() instead of
 mds_user_clear static key
Message-ID: <20231023184844.e2loaxlldm4zbko2@treble>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-4-cff54096326d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231020-delay-verw-v1-4-cff54096326d@linux.intel.com>

On Fri, Oct 20, 2023 at 01:45:15PM -0700, Pawan Gupta wrote:
> @@ -484,11 +484,11 @@ static void __init md_clear_update_mitigation(void)
>  	if (cpu_mitigations_off())
>  		return;
>  
> -	if (!static_key_enabled(&mds_user_clear))
> +	if (!boot_cpu_has(X86_FEATURE_USER_CLEAR_CPU_BUF))
>  		goto out;
>  
>  	/*
> -	 * mds_user_clear is now enabled. Update MDS, TAA and MMIO Stale Data
> +	 * X86_FEATURE_USER_CLEAR_CPU_BUF is now enabled. Update MDS, TAA and MMIO Stale Data
>  	 * mitigation, if necessary.
>  	 */

This comment line got long, the paragraph can be reformatted.

-- 
Josh

