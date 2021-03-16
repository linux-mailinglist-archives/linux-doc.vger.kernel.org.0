Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF6C33DD5D
	for <lists+linux-doc@lfdr.de>; Tue, 16 Mar 2021 20:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240363AbhCPTXX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 16 Mar 2021 15:23:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:60188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240364AbhCPTXM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Mar 2021 15:23:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A8146505E;
        Tue, 16 Mar 2021 19:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615922591;
        bh=sWtZmKfMXGF5SI475qI69+xO3GMtSBC6a8W35/layQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rFWewSgAfHeRhxbl6tLAZ+SmyfaPJv6fHztLMoMKe/3REKkyu/EzU3gxj7gTQyz4+
         zFYssQKI7x1yKN+UQlVF5n2OIAaOVNqkctIoyYLcV2NZpuHcGu0nn11MN/6Loca+8K
         +omIRhM+uvATCZauV2ta+4+NH9hy7rewWPrud9nuG7TgFqKpIJCyttIGHO1e0ntePD
         y9FVEWng7pDIw9Vk2Bj1YVJmGEhaJgNrLaTtEcQ0tFS9p3CPOfQ6jnXH/04f2hYVRT
         yow0OhI6XTkpQ1cpaKVryptk+7DUMwPmqx+e30iNUdCAQ/r8Y6WA5zUSr9L3/uGdpM
         3Z8emdSM2pqFg==
Date:   Tue, 16 Mar 2021 21:22:46 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>
Subject: Re: [PATCH v23 9/9] x86/vdso: Add ENDBR to __vdso_sgx_enter_enclave
Message-ID: <YFEFhoi/SB12HUrg@kernel.org>
References: <20210316151320.6123-1-yu-cheng.yu@intel.com>
 <20210316151320.6123-10-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316151320.6123-10-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 16, 2021 at 08:13:19AM -0700, Yu-cheng Yu wrote:
> ENDBR is a special new instruction for the Indirect Branch Tracking (IBT)
> component of CET.  IBT prevents attacks by ensuring that (most) indirect
> branches and function calls may only land at ENDBR instructions.  Branches
> that don't follow the rules will result in control flow (#CF) exceptions.
> 
> ENDBR is a noop when IBT is unsupported or disabled.  Most ENDBR
> instructions are inserted automatically by the compiler, but branch
> targets written in assembly must have ENDBR added manually.
> 
> Add ENDBR to __vdso_sgx_enter_enclave() branch targets.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Jarkko Sakkinen <jarkko@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> ---
>  arch/x86/entry/vdso/vsgx.S | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/x86/entry/vdso/vsgx.S b/arch/x86/entry/vdso/vsgx.S
> index 86a0e94f68df..1baa9b49053e 100644
> --- a/arch/x86/entry/vdso/vsgx.S
> +++ b/arch/x86/entry/vdso/vsgx.S
> @@ -6,6 +6,7 @@
>  #include <asm/enclu.h>
>  
>  #include "extable.h"
> +#include "../calling.h"
>  
>  /* Relative to %rbp. */
>  #define SGX_ENCLAVE_OFFSET_OF_RUN		16
> @@ -27,6 +28,7 @@
>  SYM_FUNC_START(__vdso_sgx_enter_enclave)
>  	/* Prolog */
>  	.cfi_startproc
> +	ENDBR
>  	push	%rbp
>  	.cfi_adjust_cfa_offset	8
>  	.cfi_rel_offset		%rbp, 0
> @@ -62,6 +64,7 @@ SYM_FUNC_START(__vdso_sgx_enter_enclave)
>  .Lasync_exit_pointer:
>  .Lenclu_eenter_eresume:
>  	enclu
> +	ENDBR
>  
>  	/* EEXIT jumps here unless the enclave is doing something fancy. */
>  	mov	SGX_ENCLAVE_OFFSET_OF_RUN(%rbp), %rbx
> @@ -91,6 +94,7 @@ SYM_FUNC_START(__vdso_sgx_enter_enclave)
>  	jmp	.Lout
>  
>  .Lhandle_exception:
> +	ENDBR
>  	mov	SGX_ENCLAVE_OFFSET_OF_RUN(%rbp), %rbx
>  
>  	/* Set the exception info. */
> -- 
> 2.21.0
> 
> 

Looks good to me.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko
