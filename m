Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11DC07210DB
	for <lists+linux-doc@lfdr.de>; Sat,  3 Jun 2023 17:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjFCPfG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 3 Jun 2023 11:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjFCPfF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Jun 2023 11:35:05 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E410C132;
        Sat,  3 Jun 2023 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685806503; x=1717342503;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Rw+wxmjMySuTIW59NrPQ4xVEjyG0POQ4g40kzOQSZSk=;
  b=mZ6mAmTcn7JuhUEhOH5OSQ4u6BUmo0JLghhsZqb60KH6xkhMVTlcI9jk
   bn/A7c/mZG/rQLjnN8DX0s9acDkSBIb4JvdXoz59euMI5JwOkrhW4Wr+Y
   UHBcEWhiXMhzxZsEQ8bHdzKusJ9y3JZl0S53IYc2yPAp2NEUWk/BbfbSs
   kMo9AFtoI7TuTJO/51mZRdTuNJU39kOVmpUWsgQW5fhgnQ+w+Gnt5nyHP
   RNIp+xPLiQ/yiuNF6f/FZ1fABOOhOUaFhuGBQeqrjGecV2yHauQ+9G57s
   wmWa4VzxjkyyVR+pp57M608B9gSXUvirl1sg1Jrex4VqAIEWKte0w10aM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="356097300"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="356097300"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 08:35:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="702274230"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="702274230"
Received: from chang-linux-3.sc.intel.com ([172.25.66.173])
  by orsmga007.jf.intel.com with ESMTP; 03 Jun 2023 08:35:01 -0700
From:   "Chang S. Bae" <chang.seok.bae@intel.com>
To:     linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        dm-devel@redhat.com
Cc:     ebiggers@kernel.org, elliott@hpe.com, gmazyland@gmail.com,
        luto@kernel.org, dave.hansen@linux.intel.com, tglx@linutronix.de,
        bp@alien8.de, mingo@kernel.org, x86@kernel.org,
        herbert@gondor.apana.org.au, ardb@kernel.org,
        dan.j.williams@intel.com, bernie.keany@intel.com,
        charishma1.gairuboyina@intel.com,
        lalithambika.krishnakumar@intel.com, nhuck@google.com,
        chang.seok.bae@intel.com, Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH v8 01/12] Documentation/x86: Document Key Locker
Date:   Sat,  3 Jun 2023 08:22:16 -0700
Message-Id: <20230603152227.12335-2-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230603152227.12335-1-chang.seok.bae@intel.com>
References: <20230524165717.14062-1-chang.seok.bae@intel.com>
 <20230603152227.12335-1-chang.seok.bae@intel.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document the overview of the feature along with relevant consideration
when provisioning dm-crypt volumes with AES-KL instead of AES-NI.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: x86@kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
Changes from v6:
* Rebase on the upstream -- commit ff61f0791ce9 ("docs: move x86
  documentation into Documentation/arch/"). (Nathan Huckleberry)
* Remove a duplicated sentence -- 'But there is no AES-KL instruction
  to process a 192-bit key.'
* Update the text for clarity and readability:
  - Clarify the error code and exemplify the backup failure
  - Use 'wrapping key' instead of less readable 'IWKey'

Changes from v5:
* Fix a typo: 'feature feature' -> 'feature'

Changes from RFC v2:
* Add as a new patch.

The preview is available here:
  https://htmlpreview.github.io/?https://github.com/intel-staging/keylocker/kdoc/arch/x86/keylocker.html
---
 Documentation/arch/x86/index.rst     |  1 +
 Documentation/arch/x86/keylocker.rst | 97 ++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/arch/x86/keylocker.rst

diff --git a/Documentation/arch/x86/index.rst b/Documentation/arch/x86/index.rst
index c73d133fd37c..256359c24669 100644
--- a/Documentation/arch/x86/index.rst
+++ b/Documentation/arch/x86/index.rst
@@ -42,3 +42,4 @@ x86-specific Documentation
    features
    elf_auxvec
    xstate
+   keylocker
diff --git a/Documentation/arch/x86/keylocker.rst b/Documentation/arch/x86/keylocker.rst
new file mode 100644
index 000000000000..5557b8d0659a
--- /dev/null
+++ b/Documentation/arch/x86/keylocker.rst
@@ -0,0 +1,97 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============
+x86 Key Locker
+==============
+
+Introduction
+============
+
+Key Locker is a CPU feature to reduce key exfiltration opportunities
+while maintaining a programming interface similar to AES-NI. It
+converts the AES key into an encoded form, called the 'key handle'.
+The key handle is a wrapped version of the clear-text key where the
+wrapping key has limited exposure. Once converted, all subsequent data
+encryption using new AES instructions (AES-KL) uses this key handle,
+reducing the exposure of private key material in memory.
+
+CPU-internal Wrapping Key
+=========================
+
+The CPU-internal wrapping key is an entity in a software-invisible CPU
+state. On every system boot, a new key is loaded. So the key handle that
+was encoded by the old wrapping key is no longer usable on system shutdown
+or reboot.
+
+And the key may be lost on the following exceptional situation upon wakeup:
+
+Wrapping Key Restore Failure
+----------------------------
+
+The CPU state is volatile with the ACPI S3/4 sleep states. When the system
+supports those states, the key has to be backed up so that it is restored
+on wake up. The kernel saves the key in non-volatile media.
+
+The event of a wrapping key restore failure upon resume from suspend, all
+established key handles become invalid. In flight dm-crypt operations
+receive error results from pending operations. In the likely scenario that
+dm-crypt is hosting the root filesystem the recovery is identical to if a
+storage controller failed to resume from suspend, reboot. If the volume
+impacted by a wrapping key restore failure is a data-volume then it is
+possible that I/O errors on that volume do not bring down the rest of the
+system. However, a reboot is still required because the kernel will have
+soft-disabled Key Locker. Upon the failure, the crypto library code will
+return -ENODEV on every AES-KL function call. The Key Locker implementation
+only loads a new wrapping key at initial boot, not any time after like
+resume from suspend.
+
+Use Case and Non-use Cases
+==========================
+
+Bare metal disk encryption is the only intended use case.
+
+Userspace usage is not supported because there is no ABI provided to
+communicate and coordinate wrapping-key restore failure to userspace. For
+now, key restore failures are only coordinated with kernel users. But the
+kernel can not prevent userspace from using the feature's AES instructions
+('AES-KL') when the feature has been enabled. So, the lack of userspace
+support is only documented, not actively enforced.
+
+Key Locker is not expected to be advertised to guest VMs and the kernel
+implementation ignores it even if the VMM enumerates the capability. The
+expectation is that a guest VM wants private wrapping key state, but the
+architecture does not provide that. An emulation of that capability, by
+caching per-VM wrapping keys in memory, defeats the purpose of Key Locker.
+The backup / restore facility is also not performant enough to be suitable
+for guest VM context switches.
+
+AES Instruction Set
+===================
+
+The feature accompanies a new AES instruction set. This instruction set is
+analogous to AES-NI. A set of AES-NI instructions can be mapped to an
+AES-KL instruction. For example, AESENC128KL is responsible for ten rounds
+of transformation, which is equivalent to nine times AESENC and one
+AESENCLAST in AES-NI.
+
+But they have some notable differences:
+
+* AES-KL provides a secure data transformation using an encrypted key.
+
+* If an invalid key handle is provided, e.g. a corrupted one or a handle
+  restriction failure, the instruction fails with setting RFLAGS.ZF. The
+  crypto library implementation includes the flag check to return -EINVAL.
+  Note that this flag is also set if the wrapping key is changed, e.g.,
+  because of the backup error.
+
+* AES-KL implements support for 128-bit and 256-bit keys, but there is no
+  AES-KL instruction to process an 192-bit key. The AES-KL cipher
+  implementation logs a warning message with a 192-bit key and then falls
+  back to AES-NI. So, this 192-bit key-size limitation is only documented,
+  not enforced. It means the key will remain in clear-text in memory. This
+  is to meet Linux crypto-cipher expectation that each implementation must
+  support all the AES-compliant key sizes.
+
+* Some AES-KL hardware implementation may have noticeable performance
+  overhead when compared with AES-NI instructions.
+
-- 
2.17.1

