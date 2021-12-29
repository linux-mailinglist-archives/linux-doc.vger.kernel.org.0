Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC480481316
	for <lists+linux-doc@lfdr.de>; Wed, 29 Dec 2021 14:13:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239727AbhL2NNb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Dec 2021 08:13:31 -0500
Received: from mga07.intel.com ([134.134.136.100]:28042 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239681AbhL2NNb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 29 Dec 2021 08:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640783610; x=1672319610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=06UZPspZMjpZ2LW6CbS3zV2Qj9jO0N3Dh9+Q4r5Uso4=;
  b=Z+lBx+K4kAaf2D4Bn1+mqEk7kCf/1Z/S35Shd8cN0SG9Rm75fga4Vi9m
   e5PMgvTPMzgjX/wPcXwLvSvqhgPh1JP/rawfbu8va0IzfdAV7nR6vfRXL
   txKQYdqJANw5xRdscd5P6P7CBrk5aeSlNaP2lEp83JJX69GPQ8yYp22IF
   Jm3lUvFsAKG+RkcIYEfOKKxHPQTkfRUzj+7LPgcryDTe2cyGoFk8W8Yl4
   QbvR5dD2uOiCro8y5kUvByQ2A5KiKxokwjksEo7a6axq4Gn2nlKI3/YMI
   HMgnvP2zwNFe2rKvVwyOroSZk2mDhn8EM1bsSAH3+PN6gk9z1XSv2DtEs
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="304876113"
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; 
   d="scan'208";a="304876113"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2021 05:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; 
   d="scan'208";a="666281149"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
  by fmsmga001.fm.intel.com with ESMTP; 29 Dec 2021 05:13:29 -0800
From:   Yang Zhong <yang.zhong@intel.com>
To:     x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, pbonzini@redhat.com, corbet@lwn.net,
        shuah@kernel.org
Cc:     seanjc@google.com, jun.nakajima@intel.com, kevin.tian@intel.com,
        jing2.liu@linux.intel.com, jing2.liu@intel.com,
        guang.zeng@intel.com, wei.w.wang@intel.com, yang.zhong@intel.com
Subject: [PATCH v4 02/21] x86/fpu: Prepare guest FPU for dynamically enabled FPU features
Date:   Wed, 29 Dec 2021 05:13:09 -0800
Message-Id: <20211229131328.12283-3-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229131328.12283-1-yang.zhong@intel.com>
References: <20211229131328.12283-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Thomas Gleixner <tglx@linutronix.de>

To support dynamically enabled FPU features for guests prepare the guest
pseudo FPU container to keep track of the currently enabled xfeatures and
the guest permissions.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 arch/x86/include/asm/fpu/types.h | 13 +++++++++++++
 arch/x86/kernel/fpu/core.c       | 26 +++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/fpu/types.h b/arch/x86/include/asm/fpu/types.h
index 6ddf80637697..c752d0aa23a4 100644
--- a/arch/x86/include/asm/fpu/types.h
+++ b/arch/x86/include/asm/fpu/types.h
@@ -504,6 +504,19 @@ struct fpu {
  * Guest pseudo FPU container
  */
 struct fpu_guest {
+	/*
+	 * @xfeatures:			xfeature bitmap of features which are
+	 *				currently enabled for the guest vCPU.
+	 */
+	u64				xfeatures;
+
+	/*
+	 * @perm:			xfeature bitmap of features which are
+	 *				permitted to be enabled for the guest
+	 *				vCPU.
+	 */
+	u64				perm;
+
 	/*
 	 * @fpstate:			Pointer to the allocated guest fpstate
 	 */
diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index ab19b3d8b2f7..eddeeb4ed2f5 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -201,6 +201,26 @@ void fpu_reset_from_exception_fixup(void)
 #if IS_ENABLED(CONFIG_KVM)
 static void __fpstate_reset(struct fpstate *fpstate);
 
+static void fpu_init_guest_permissions(struct fpu_guest *gfpu)
+{
+	struct fpu_state_perm *fpuperm;
+	u64 perm;
+
+	if (!IS_ENABLED(CONFIG_X86_64))
+		return;
+
+	spin_lock_irq(&current->sighand->siglock);
+	fpuperm = &current->group_leader->thread.fpu.guest_perm;
+	perm = fpuperm->__state_perm;
+
+	/* First fpstate allocation locks down permissions. */
+	WRITE_ONCE(fpuperm->__state_perm, perm | FPU_GUEST_PERM_LOCKED);
+
+	spin_unlock_irq(&current->sighand->siglock);
+
+	gfpu->perm = perm & ~FPU_GUEST_PERM_LOCKED;
+}
+
 bool fpu_alloc_guest_fpstate(struct fpu_guest *gfpu)
 {
 	struct fpstate *fpstate;
@@ -216,7 +236,11 @@ bool fpu_alloc_guest_fpstate(struct fpu_guest *gfpu)
 	fpstate->is_valloc	= true;
 	fpstate->is_guest	= true;
 
-	gfpu->fpstate = fpstate;
+	gfpu->fpstate		= fpstate;
+	gfpu->xfeatures		= fpu_user_cfg.default_features;
+	gfpu->perm		= fpu_user_cfg.default_features;
+	fpu_init_guest_permissions(gfpu);
+
 	return true;
 }
 EXPORT_SYMBOL_GPL(fpu_alloc_guest_fpstate);
