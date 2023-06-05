Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0AB721EC9
	for <lists+linux-doc@lfdr.de>; Mon,  5 Jun 2023 09:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbjFEHCt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 5 Jun 2023 03:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbjFEHC2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 03:02:28 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CE245E7E;
        Mon,  5 Jun 2023 00:02:01 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A584215A1;
        Mon,  5 Jun 2023 00:02:46 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 609543F793;
        Mon,  5 Jun 2023 00:01:59 -0700 (PDT)
From:   Mark Rutland <mark.rutland@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     akiyks@gmail.com, boqun.feng@gmail.com, corbet@lwn.net,
        keescook@chromium.org, linux@armlinux.org.uk,
        linux-doc@vger.kernel.org, mark.rutland@arm.com,
        mchehab@kernel.org, paulmck@kernel.org, peterz@infradead.org,
        rdunlap@infradead.org, sstabellini@kernel.org, will@kernel.org
Subject: [PATCH v2 11/27] locking/atomic: sparc: add preprocessor symbols
Date:   Mon,  5 Jun 2023 08:01:08 +0100
Message-Id: <20230605070124.3741859-12-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230605070124.3741859-1-mark.rutland@arm.com>
References: <20230605070124.3741859-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some atomics can be implemented in several different ways, e.g.
FULL/ACQUIRE/RELEASE ordered atomics can be implemented in terms of
RELAXED atomics, and ACQUIRE/RELEASE/RELAXED can be implemented in terms
of FULL ordered atomics. Other atomics are optional, and don't exist in
some configurations (e.g. not all architectures implement the 128-bit
cmpxchg ops).

Subsequent patches will require that architectures define a preprocessor
symbol for any atomic (or ordering variant) which is optional. This will
make the fallback ifdeffery more robust, and simplify future changes.

Add the required definitions to arch/sparc.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Paul E. McKenney <paulmck@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/sparc/include/asm/atomic_32.h | 16 ++++++++++++++--
 arch/sparc/include/asm/atomic_64.h | 18 ++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/atomic_32.h b/arch/sparc/include/asm/atomic_32.h
index 1c9e6c7366e41..60ce2fe57fcd7 100644
--- a/arch/sparc/include/asm/atomic_32.h
+++ b/arch/sparc/include/asm/atomic_32.h
@@ -19,19 +19,31 @@
 #include <asm-generic/atomic64.h>
 
 int arch_atomic_add_return(int, atomic_t *);
+#define arch_atomic_add_return arch_atomic_add_return
+
 int arch_atomic_fetch_add(int, atomic_t *);
+#define arch_atomic_fetch_add arch_atomic_fetch_add
+
 int arch_atomic_fetch_and(int, atomic_t *);
+#define arch_atomic_fetch_and arch_atomic_fetch_and
+
 int arch_atomic_fetch_or(int, atomic_t *);
+#define arch_atomic_fetch_or arch_atomic_fetch_or
+
 int arch_atomic_fetch_xor(int, atomic_t *);
+#define arch_atomic_fetch_xor arch_atomic_fetch_xor
+
 int arch_atomic_cmpxchg(atomic_t *, int, int);
 #define arch_atomic_cmpxchg arch_atomic_cmpxchg
+
 int arch_atomic_xchg(atomic_t *, int);
 #define arch_atomic_xchg arch_atomic_xchg
-int arch_atomic_fetch_add_unless(atomic_t *, int, int);
-void arch_atomic_set(atomic_t *, int);
 
+int arch_atomic_fetch_add_unless(atomic_t *, int, int);
 #define arch_atomic_fetch_add_unless arch_atomic_fetch_add_unless
 
+void arch_atomic_set(atomic_t *, int);
+
 #define arch_atomic_set_release(v, i)	arch_atomic_set((v), (i))
 
 #define arch_atomic_read(v)		READ_ONCE((v)->counter)
diff --git a/arch/sparc/include/asm/atomic_64.h b/arch/sparc/include/asm/atomic_64.h
index df6a8b07d7e63..a5e9c37605a70 100644
--- a/arch/sparc/include/asm/atomic_64.h
+++ b/arch/sparc/include/asm/atomic_64.h
@@ -37,6 +37,16 @@ s64 arch_atomic64_fetch_##op(s64, atomic64_t *);
 ATOMIC_OPS(add)
 ATOMIC_OPS(sub)
 
+#define arch_atomic_add_return			arch_atomic_add_return
+#define arch_atomic_sub_return			arch_atomic_sub_return
+#define arch_atomic_fetch_add			arch_atomic_fetch_add
+#define arch_atomic_fetch_sub			arch_atomic_fetch_sub
+
+#define arch_atomic64_add_return		arch_atomic64_add_return
+#define arch_atomic64_sub_return		arch_atomic64_sub_return
+#define arch_atomic64_fetch_add			arch_atomic64_fetch_add
+#define arch_atomic64_fetch_sub			arch_atomic64_fetch_sub
+
 #undef ATOMIC_OPS
 #define ATOMIC_OPS(op) ATOMIC_OP(op) ATOMIC_FETCH_OP(op)
 
@@ -44,6 +54,14 @@ ATOMIC_OPS(and)
 ATOMIC_OPS(or)
 ATOMIC_OPS(xor)
 
+#define arch_atomic_fetch_and			arch_atomic_fetch_and
+#define arch_atomic_fetch_or			arch_atomic_fetch_or
+#define arch_atomic_fetch_xor			arch_atomic_fetch_xor
+
+#define arch_atomic64_fetch_and			arch_atomic64_fetch_and
+#define arch_atomic64_fetch_or			arch_atomic64_fetch_or
+#define arch_atomic64_fetch_xor			arch_atomic64_fetch_xor
+
 #undef ATOMIC_OPS
 #undef ATOMIC_FETCH_OP
 #undef ATOMIC_OP_RETURN
-- 
2.30.2

