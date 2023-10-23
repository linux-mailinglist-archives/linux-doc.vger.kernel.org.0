Return-Path: <linux-doc+bounces-857-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6227D3F50
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 20:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CB7128162F
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 18:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79D7219E2;
	Mon, 23 Oct 2023 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4ShAgpx"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AEA21A05
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 18:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465DCC433C7;
	Mon, 23 Oct 2023 18:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698086124;
	bh=ZsGdHEJshdR0ozQSfQrtf6wqTgfeXHC3XAo8ZSd8pBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R4ShAgpxrBRydKmuUVFVNqKZZf2P1pZNI3c3pn71hOqSL3rMDVW4qYqLdeox0rkgY
	 EWMFK7pUlfLLfzyOzNY/m9LKCct1tP33FcbmOx3d8WckKt1fTqo1/coGrwZNetYfIM
	 D7XIDHR4ByBwehxXpJ7yjsFWpTUgQ7YOyKxKrTQ9XUyzr+zks1VB6cP2XisGX7e2Cq
	 wtyN3iJ3u+b7JPef/WPICWcVC5p/7ts0sS9cRTeXod1fItZRVeijhR+QtPHaHcGQNS
	 5BNO+lnuP/igOYZjK/2PuobSAs+SO+PpgVsOmoNm3oLlcsF+lnfWeAdDQd2giW7sCT
	 UE4WGukub5n2A==
Date: Mon, 23 Oct 2023 11:35:21 -0700
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
	antonio.gomez.iglesias@linux.intel.com,
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH  2/6] x86/entry_64: Add VERW just before userspace
 transition
Message-ID: <20231023183521.zdlrfxvsdxftpxly@treble>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-2-cff54096326d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231020-delay-verw-v1-2-cff54096326d@linux.intel.com>

On Fri, Oct 20, 2023 at 01:45:03PM -0700, Pawan Gupta wrote:
> @@ -663,6 +665,10 @@ SYM_INNER_LABEL(swapgs_restore_regs_and_return_to_usermode, SYM_L_GLOBAL)
>  	/* Restore RDI. */
>  	popq	%rdi
>  	swapgs
> +
> +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> +	USER_CLEAR_CPU_BUFFERS
> +
>  	jmp	.Lnative_iret
>  
>  
> @@ -774,6 +780,9 @@ native_irq_return_ldt:
>  	 */
>  	popq	%rax				/* Restore user RAX */
>  
> +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> +	USER_CLEAR_CPU_BUFFERS
> +

Can the above two USER_CLEAR_CPU_BUFFERS be replaced with a single one
just above native_irq_return_iret?  Otherwise the native_irq_return_ldt
case ends up getting two VERWs.

>  	/*
>  	 * RSP now points to an ordinary IRET frame, except that the page
>  	 * is read-only and RSP[31:16] are preloaded with the userspace
> @@ -1502,6 +1511,9 @@ nmi_restore:
>  	std
>  	movq	$0, 5*8(%rsp)		/* clear "NMI executing" */
>  
> +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> +	USER_CLEAR_CPU_BUFFERS
> +
>  	/*
>  	 * iretq reads the "iret" frame and exits the NMI stack in a
>  	 * single instruction.  We are returning to kernel mode, so this

This isn't needed here.  This is the NMI return-to-kernel path.

The NMI return-to-user path is already mitigated as it goes through
swapgs_restore_regs_and_return_to_usermode.

-- 
Josh

