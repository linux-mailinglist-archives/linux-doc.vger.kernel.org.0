Return-Path: <linux-doc+bounces-1229-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A157D88F0
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 21:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 808811C20F26
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 19:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E553B2B7;
	Thu, 26 Oct 2023 19:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R8Dvk+JU"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64723AC35
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 19:30:58 +0000 (UTC)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A551AC
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 12:30:57 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c9d140fcddso13422835ad.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 12:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698348656; x=1698953456; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O5l+1D3sMytKg497+LD3ZhVhuDQvT+m5NPnG8xfpJ8c=;
        b=R8Dvk+JU2d5bBxse0HIEZrXlqO+fbya9HcK9Xs6+MGNsyYwhcdV9mBT3f9MAqNdeE5
         qsHmU4j1EmU4gnH2hr+U3ET3DQG/43L2UrOsly8ZwPegiSYdFxH8kajpqRSpr4Q+J1Pv
         j2fHryybNGuBMOzCg+IyY+pUlH6NYQw2k0whOs6LwRA3+cFZZ6R1hRyHScv3OZ47dTxj
         QSOl8EF9VpbDGJOO/QfSWQ/6LPmvCuok1kpuptWmy4euzFj5UP/M41CST1LuRYwx95tm
         IZLiIHs3SKdruuYR07wO/G0lv9ik/uxcnLCekfTdvuwNGALx8o6NM8NVddMYGpIKWSkC
         Tbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698348656; x=1698953456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O5l+1D3sMytKg497+LD3ZhVhuDQvT+m5NPnG8xfpJ8c=;
        b=EZblQPOf5/tep3e4b0bi6U59eg7dtQpUjOY9cm6unCUj5sWjJdQQbsj+5df6XWvYYp
         rWOUA9weSh0ZqVSyKm6dPBahuuKhrEAXccKjtTLvK10K8bfIwICZk8mwhYl9YsmXz3zp
         uLrkvQ1O7Zr67U7WZTyjRrhowBp0rIfgRGLezkUhGb3UqE1lx+PoC1wt6VE25zn5x8S3
         uZzUwVoGfS7YrG9ndBF3qe0KUUz8Zz7LMIzMwX5eZ+EJS3MFnv0A/IZEQvXP/E7xzUjo
         IMfdVGu+mC/vHKNfm2h/Av7mm8+A5Lo5YQ8hZnA9n4i1zT/jHibAsALQ4XsuBkw2hnGP
         SGgQ==
X-Gm-Message-State: AOJu0Yz7r9B2gt00EgMTSTNKIeA/ountXzBy+fZtJXBJ6X5YF8Mj3VbY
	GiWAzVwmjpVolfqpisB7/ZxwpxQwP1s=
X-Google-Smtp-Source: AGHT+IFn+fOXPmaZJeCK7AjG545QxMmcDvsis9yxD2lpW2WV10OCOWev5iRJZ98QgCF83lJBglZbCv5AGwE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ed41:b0:1cc:1813:3023 with SMTP id
 y1-20020a170902ed4100b001cc18133023mr7873plb.2.1698348656581; Thu, 26 Oct
 2023 12:30:56 -0700 (PDT)
Date: Thu, 26 Oct 2023 12:30:55 -0700
In-Reply-To: <20231025-delay-verw-v3-6-52663677ee35@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231025-delay-verw-v3-0-52663677ee35@linux.intel.com> <20231025-delay-verw-v3-6-52663677ee35@linux.intel.com>
Message-ID: <ZTq-b0uVyf6KLNV0@google.com>
Subject: Re: [PATCH  v3 6/6] KVM: VMX: Move VERW closer to VMentry for MDS mitigation
From: Sean Christopherson <seanjc@google.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com, ak@linux.intel.com, 
	tim.c.chen@linux.intel.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	Alyssa Milburn <alyssa.milburn@linux.intel.com>, 
	Daniel Sneddon <daniel.sneddon@linux.intel.com>, antonio.gomez.iglesias@linux.intel.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Oct 25, 2023, Pawan Gupta wrote:
> During VMentry VERW is executed to mitigate MDS. After VERW, any memory
> access like register push onto stack may put host data in MDS affected
> CPU buffers. A guest can then use MDS to sample host data.
> 
> Although likelihood of secrets surviving in registers at current VERW
> callsite is less, but it can't be ruled out. Harden the MDS mitigation
> by moving the VERW mitigation late in VMentry path.
> 
> Note that VERW for MMIO Stale Data mitigation is unchanged because of
> the complexity of per-guest conditional VERW which is not easy to handle
> that late in asm with no GPRs available. If the CPU is also affected by
> MDS, VERW is unconditionally executed late in asm regardless of guest
> having MMIO access.
> 
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
>  arch/x86/kvm/vmx/vmenter.S |  3 +++
>  arch/x86/kvm/vmx/vmx.c     | 10 +++++++---
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmenter.S b/arch/x86/kvm/vmx/vmenter.S
> index b3b13ec04bac..139960deb736 100644
> --- a/arch/x86/kvm/vmx/vmenter.S
> +++ b/arch/x86/kvm/vmx/vmenter.S
> @@ -161,6 +161,9 @@ SYM_FUNC_START(__vmx_vcpu_run)
>  	/* Load guest RAX.  This kills the @regs pointer! */
>  	mov VCPU_RAX(%_ASM_AX), %_ASM_AX
>  
> +	/* Clobbers EFLAGS.ZF */
> +	CLEAR_CPU_BUFFERS
> +
>  	/* Check EFLAGS.CF from the VMX_RUN_VMRESUME bit test above. */
>  	jnc .Lvmlaunch
>  
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 24e8694b83fc..2d149589cf5b 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -7226,13 +7226,17 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
>  
>  	guest_state_enter_irqoff();
>  
> -	/* L1D Flush includes CPU buffer clear to mitigate MDS */
> +	/*
> +	 * L1D Flush includes CPU buffer clear to mitigate MDS, but VERW
> +	 * mitigation for MDS is done late in VMentry and is still
> +	 * executed inspite of L1D Flush. This is because an extra VERW

in spite

> +	 * should not matter much after the big hammer L1D Flush.
> +	 */
>  	if (static_branch_unlikely(&vmx_l1d_should_flush))
>  		vmx_l1d_flush(vcpu);

There's an existing bug here.  vmx_1ld_flush() is not guaranteed to do a flush in
"conditional mode", and is not guaranteed to do a ucode-based flush (though I can't
tell if it's possible for the VERW magic to exist without X86_FEATURE_FLUSH_L1D).

If we care, something like the diff at the bottom is probably needed.

> -	else if (cpu_feature_enabled(X86_FEATURE_CLEAR_CPU_BUF))
> -		mds_clear_cpu_buffers();
>  	else if (static_branch_unlikely(&mmio_stale_data_clear) &&
>  		 kvm_arch_has_assigned_device(vcpu->kvm))
> +		/* MMIO mitigation is mutually exclusive with MDS mitigation later in asm */

Please don't put comments inside an if/elif without curly braces (and I don't
want to add curly braces).  Though I think that's a moot point if we first fix
the conditional L1D flush issue.  E.g. when the dust settles we can end up with:

	/*
	 * Note, a ucode-based L1D flush also flushes CPU buffers, i.e. the
	 * manual VERW in __vmx_vcpu_run() to mitigate MDS *may* be redundant.
	 * But an L1D Flush is not guaranteed for "conditional mode", and the
	 * cost of an extra VERW after a full L1D flush is negligible.
	 */
	if (static_branch_unlikely(&vmx_l1d_should_flush))
		cpu_buffers_flushed = vmx_l1d_flush(vcpu);

	/*
	 * The MMIO stale data vulnerability is a subset of the general MDS
	 * vulnerability, i.e. this is mutually exclusive with the VERW that's
	 * done just before VM-Enter.  The vulnerability requires the attacker,
	 * i.e. the guest, to do MMIO, so this "clear" can be done earlier.
	 */
	if (static_branch_unlikely(&mmio_stale_data_clear) &&
	    !cpu_buffers_flushed && kvm_arch_has_assigned_device(vcpu->kvm))
		mds_clear_cpu_buffers();

>  		mds_clear_cpu_buffers();
>  
>  	vmx_disable_fb_clear(vmx);

LOL, nice.  IIUC, setting FB_CLEAR_DIS is mutually exclusive with doing a late
VERW, as KVM will never set FB_CLEAR_DIS if the CPU is susceptible to X86_BUG_MDS.
But the checks aren't identical, which makes this _look_ sketchy.

Can you do something like this to ensure we don't accidentally neuter the late VERW?

static void vmx_update_fb_clear_dis(struct kvm_vcpu *vcpu, struct vcpu_vmx *vmx)
{
	vmx->disable_fb_clear = (host_arch_capabilities & ARCH_CAP_FB_CLEAR_CTRL) &&
				!boot_cpu_has_bug(X86_BUG_MDS) &&
				!boot_cpu_has_bug(X86_BUG_TAA);

	if (vmx->disable_fb_clear &&
	    WARN_ON_ONCE(cpu_feature_enabled(X86_FEATURE_CLEAR_CPU_BUF)))
	    	vmx->disable_fb_clear = false;

	...
}

--
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 6e502ba93141..cf6e06bb8310 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6606,8 +6606,11 @@ static int vmx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t exit_fastpath)
  * is not exactly LRU. This could be sized at runtime via topology
  * information but as all relevant affected CPUs have 32KiB L1D cache size
  * there is no point in doing so.
+ *
+ * Returns %true if CPU buffers were cleared, i.e. if a microcode-based L1D
+ * flush was executed (which also clears CPU buffers).
  */
-static noinstr void vmx_l1d_flush(struct kvm_vcpu *vcpu)
+static noinstr bool vmx_l1d_flush(struct kvm_vcpu *vcpu)
 {
        int size = PAGE_SIZE << L1D_CACHE_ORDER;
 
@@ -6634,14 +6637,14 @@ static noinstr void vmx_l1d_flush(struct kvm_vcpu *vcpu)
                kvm_clear_cpu_l1tf_flush_l1d();
 
                if (!flush_l1d)
-                       return;
+                       return false;
        }
 
        vcpu->stat.l1d_flush++;
 
        if (static_cpu_has(X86_FEATURE_FLUSH_L1D)) {
                native_wrmsrl(MSR_IA32_FLUSH_CMD, L1D_FLUSH);
-               return;
+               return true;
        }
 
        asm volatile(
@@ -6665,6 +6668,8 @@ static noinstr void vmx_l1d_flush(struct kvm_vcpu *vcpu)
                :: [flush_pages] "r" (vmx_l1d_flush_pages),
                    [size] "r" (size)
                : "eax", "ebx", "ecx", "edx");
+
+       return false;
 }
 
 static void vmx_update_cr8_intercept(struct kvm_vcpu *vcpu, int tpr, int irr)
@@ -7222,16 +7227,17 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
                                        unsigned int flags)
 {
        struct vcpu_vmx *vmx = to_vmx(vcpu);
+       bool cpu_buffers_flushed = false;
 
        guest_state_enter_irqoff();
 
-       /* L1D Flush includes CPU buffer clear to mitigate MDS */
        if (static_branch_unlikely(&vmx_l1d_should_flush))
-               vmx_l1d_flush(vcpu);
-       else if (static_branch_unlikely(&mds_user_clear))
-               mds_clear_cpu_buffers();
-       else if (static_branch_unlikely(&mmio_stale_data_clear) &&
-                kvm_arch_has_assigned_device(vcpu->kvm))
+               cpu_buffers_flushed = vmx_l1d_flush(vcpu);
+
+       if ((static_branch_unlikely(&mds_user_clear) ||
+            (static_branch_unlikely(&mmio_stale_data_clear) &&
+             kvm_arch_has_assigned_device(vcpu->kvm))) &&
+           !cpu_buffers_flushed)
                mds_clear_cpu_buffers();
 
        vmx_disable_fb_clear(vmx);


