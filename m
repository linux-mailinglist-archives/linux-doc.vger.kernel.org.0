Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5F272D633
	for <lists+linux-doc@lfdr.de>; Tue, 13 Jun 2023 02:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238500AbjFMAUm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 12 Jun 2023 20:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239426AbjFMAS3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Jun 2023 20:18:29 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3A53C15;
        Mon, 12 Jun 2023 17:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686615272; x=1718151272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hFHVnW9lxN9HUD3QIC9fY4x2IPOgeGJUGkzddQmtaZw=;
  b=MqwCNVj5T/NU7ZoDUQmmzV1sTTUzvs7OWVUAWXwB+/0uMoVL6Xyjoj/8
   u/vgj+yaLVKVIBWmIOeXda8u7r+GW1RDCCrouC0JN8b95OK7/xKlzQz6l
   gpWjxA/uSlMNLmJf42V4ehtdtwZRFLapnariIo3Nm/Velx9WLADXonBsh
   WfIN4reP9wjmitmF/RUCzkFceAZJd0i5YjBBnaDZLZMe22W3AB9P2tyUl
   mGbF5cnFuVUF1c0SVwP2LWySl6yiMM+Iu5CFpxFpxZKGoaUyrVXxDKMsS
   0+cMsfuA1Bh9wnPTbGkCmlpJGh0HhJvS9SSIZt3+CJcdIqdwpYczATJop
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="361557635"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="361557635"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 17:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="835671183"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="835671183"
Received: from almeisch-mobl1.amr.corp.intel.com (HELO rpedgeco-desk4.amr.corp.intel.com) ([10.209.42.242])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 17:12:43 -0700
From:   Rick Edgecombe <rick.p.edgecombe@intel.com>
To:     x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
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
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        John Allen <john.allen@amd.com>, kcc@google.com,
        eranian@google.com, rppt@kernel.org, jamorris@linux.microsoft.com,
        dethoma@microsoft.com, akpm@linux-foundation.org,
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
        david@redhat.com, debug@rivosinc.com, szabolcs.nagy@arm.com,
        torvalds@linux-foundation.org, broonie@kernel.org
Cc:     rick.p.edgecombe@intel.com, Mike Rapoport <rppt@linux.ibm.com>,
        Pengfei Xu <pengfei.xu@intel.com>
Subject: [PATCH v9 41/42] x86/shstk: Add ARCH_SHSTK_UNLOCK
Date:   Mon, 12 Jun 2023 17:11:07 -0700
Message-Id: <20230613001108.3040476-42-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

Userspace loaders may lock features before a CRIU restore operation has
the chance to set them to whatever state is required by the process
being restored. Allow a way for CRIU to unlock features. Add it as an
arch_prctl() like the other shadow stack operations, but restrict it being
called by the ptrace arch_pctl() interface.

[Merged into recent API changes, added commit log and docs]

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Pengfei Xu <pengfei.xu@intel.com>
Tested-by: John Allen <john.allen@amd.com>
Tested-by: Kees Cook <keescook@chromium.org>
---
 Documentation/arch/x86/shstk.rst  | 4 ++++
 arch/x86/include/uapi/asm/prctl.h | 1 +
 arch/x86/kernel/process_64.c      | 1 +
 arch/x86/kernel/shstk.c           | 9 +++++++--
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/shstk.rst b/Documentation/arch/x86/shstk.rst
index f09afa504ec0..f3553cc8c758 100644
--- a/Documentation/arch/x86/shstk.rst
+++ b/Documentation/arch/x86/shstk.rst
@@ -75,6 +75,10 @@ arch_prctl(ARCH_SHSTK_LOCK, unsigned long features)
     are ignored. The mask is ORed with the existing value. So any feature bits
     set here cannot be enabled or disabled afterwards.
 
+arch_prctl(ARCH_SHSTK_UNLOCK, unsigned long features)
+    Unlock features. 'features' is a mask of all features to unlock. All
+    bits set are processed, unset bits are ignored. Only works via ptrace.
+
 The return values are as follows. On success, return 0. On error, errno can
 be::
 
diff --git a/arch/x86/include/uapi/asm/prctl.h b/arch/x86/include/uapi/asm/prctl.h
index eedfde3b63be..3189c4a96468 100644
--- a/arch/x86/include/uapi/asm/prctl.h
+++ b/arch/x86/include/uapi/asm/prctl.h
@@ -33,6 +33,7 @@
 #define ARCH_SHSTK_ENABLE		0x5001
 #define ARCH_SHSTK_DISABLE		0x5002
 #define ARCH_SHSTK_LOCK			0x5003
+#define ARCH_SHSTK_UNLOCK		0x5004
 
 /* ARCH_SHSTK_ features bits */
 #define ARCH_SHSTK_SHSTK		(1ULL <<  0)
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 0f89aa0186d1..e6db21c470aa 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -899,6 +899,7 @@ long do_arch_prctl_64(struct task_struct *task, int option, unsigned long arg2)
 	case ARCH_SHSTK_ENABLE:
 	case ARCH_SHSTK_DISABLE:
 	case ARCH_SHSTK_LOCK:
+	case ARCH_SHSTK_UNLOCK:
 		return shstk_prctl(task, option, arg2);
 	default:
 		ret = -EINVAL;
diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
index d723cdc93474..d43b7a9c57ce 100644
--- a/arch/x86/kernel/shstk.c
+++ b/arch/x86/kernel/shstk.c
@@ -489,9 +489,14 @@ long shstk_prctl(struct task_struct *task, int option, unsigned long features)
 		return 0;
 	}
 
-	/* Don't allow via ptrace */
-	if (task != current)
+	/* Only allow via ptrace */
+	if (task != current) {
+		if (option == ARCH_SHSTK_UNLOCK && IS_ENABLED(CONFIG_CHECKPOINT_RESTORE)) {
+			task->thread.features_locked &= ~features;
+			return 0;
+		}
 		return -EINVAL;
+	}
 
 	/* Do not allow to change locked features */
 	if (features & task->thread.features_locked)
-- 
2.34.1

