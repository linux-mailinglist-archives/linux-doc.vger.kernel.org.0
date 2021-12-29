Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E47D48132E
	for <lists+linux-doc@lfdr.de>; Wed, 29 Dec 2021 14:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239690AbhL2NN5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Dec 2021 08:13:57 -0500
Received: from mga07.intel.com ([134.134.136.100]:28049 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239986AbhL2NNh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 29 Dec 2021 08:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640783617; x=1672319617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O5TGC76TAbgxoUuG0/foUUuSs7ddkayI6wfKFDoELAg=;
  b=R5LG7ga8cIIGUy0iR6fH6ojyaFzhWh0YJwwkrAme48WdRYBB7ex6vY+F
   MmUHhkco1ZcnMZkdVtYNtZfxTuQnIhmXKW+wZRo1tB61hCG+ZRClWZD/q
   ucD152zELUeQmz7mooE0GLsMNlxhqbAUmxPyfiNJcwBJpVLuS6w2Jwt4D
   q9r7alobWH6a/Qjh0GfUx3cJgFpLEoBk2j9o4aaJ5t9OzRARxuBCERH0b
   M+VSb1bSNnlmNatNn1EKfB3JhGva7qnwm93FNbMtk+zcxeR8FIXTnOQh1
   BBnUMk+GcuspfQGh5yvLrKAy3RGhk5dOoVZ6AdGXBZkRbh5hTvN9brTEe
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="304876121"
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; 
   d="scan'208";a="304876121"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2021 05:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; 
   d="scan'208";a="666281168"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
  by fmsmga001.fm.intel.com with ESMTP; 29 Dec 2021 05:13:34 -0800
From:   Yang Zhong <yang.zhong@intel.com>
To:     x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, pbonzini@redhat.com, corbet@lwn.net,
        shuah@kernel.org
Cc:     seanjc@google.com, jun.nakajima@intel.com, kevin.tian@intel.com,
        jing2.liu@linux.intel.com, jing2.liu@intel.com,
        guang.zeng@intel.com, wei.w.wang@intel.com, yang.zhong@intel.com
Subject: [PATCH v4 07/21] x86/fpu: Provide fpu_update_guest_perm_features() for guest
Date:   Wed, 29 Dec 2021 05:13:14 -0800
Message-Id: <20211229131328.12283-8-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229131328.12283-1-yang.zhong@intel.com>
References: <20211229131328.12283-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Kevin Tian <kevin.tian@intel.com>

KVM can require fpstate expansion in two approaches:

  1) Dynamic expansion when intercepting guest updates to XCR0 and
     XFD MSR;

  2) Static expansion e.g. at KVM_SET_CPUID2;

The first option doesn't waste memory for legacy guest if it doesn't
support XFD. However doing so introduces more complexity and also
imposes an order requirement in the restoring path, i.e. XCR0/XFD
must be restored before XSTATE.

Given that the agreement is to do the static approach. This is
considered a better tradeoff though it does waste 8K memory for
legacy guest if its CPUID includes XFD features.

Provide a wrapper to allow expanding the fpstate buffer to what
guest perm allows. Once completed, both emulation and restore path
don't need to worry about the buffer size.

Signed-off-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/include/asm/fpu/api.h |  1 +
 arch/x86/kernel/fpu/core.c     | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/x86/include/asm/fpu/api.h b/arch/x86/include/asm/fpu/api.h
index d8c222290e68..8e934e571273 100644
--- a/arch/x86/include/asm/fpu/api.h
+++ b/arch/x86/include/asm/fpu/api.h
@@ -138,6 +138,7 @@ extern inline u64 xstate_get_guest_group_perm(void);
 extern bool fpu_alloc_guest_fpstate(struct fpu_guest *gfpu);
 extern void fpu_free_guest_fpstate(struct fpu_guest *gfpu);
 extern int fpu_swap_kvm_fpstate(struct fpu_guest *gfpu, bool enter_guest);
+extern int fpu_update_guest_perm_features(struct fpu_guest *guest_fpu);
 
 extern void fpu_copy_guest_fpstate_to_uabi(struct fpu_guest *gfpu, void *buf, unsigned int size, u32 pkru);
 extern int fpu_copy_uabi_to_guest_fpstate(struct fpu_guest *gfpu, const void *buf, u64 xcr0, u32 *vpkru);
diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index a78bc547fc03..2560a95980aa 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -261,6 +261,33 @@ void fpu_free_guest_fpstate(struct fpu_guest *gfpu)
 }
 EXPORT_SYMBOL_GPL(fpu_free_guest_fpstate);
 
+/*
+ * fpu_update_guest_perm_features - Enable xfeatures according to guest perm
+ * @guest_fpu:		Pointer to the guest FPU container
+ *
+ * Enable all dynamic xfeatures according to guest perm. Invoked if the
+ * caller wants to conservatively expand fpstate buffer instead of waiting
+ * until XCR0 or XFD MSR is written.
+ *
+ * Return: 0 on success, error code otherwise
+ */
+int fpu_update_guest_perm_features(struct fpu_guest *guest_fpu)
+{
+	u64 expand;
+
+	lockdep_assert_preemption_enabled();
+
+	if (!IS_ENABLED(CONFIG_X86_64))
+		return 0;
+
+	expand = guest_fpu->perm & ~guest_fpu->xfeatures;
+	if (!expand)
+		return 0;
+
+	return __xfd_enable_feature(expand, guest_fpu);
+}
+EXPORT_SYMBOL_GPL(fpu_update_guest_perm_features);
+
 int fpu_swap_kvm_fpstate(struct fpu_guest *guest_fpu, bool enter_guest)
 {
 	struct fpstate *guest_fps = guest_fpu->fpstate;
