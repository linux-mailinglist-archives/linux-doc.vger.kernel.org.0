Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89B52FCCA9
	for <lists+linux-doc@lfdr.de>; Thu, 14 Nov 2019 19:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbfKNSEZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 14 Nov 2019 13:04:25 -0500
Received: from mail-qv1-f73.google.com ([209.85.219.73]:52549 "EHLO
        mail-qv1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727533AbfKNSEZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Nov 2019 13:04:25 -0500
Received: by mail-qv1-f73.google.com with SMTP id k11so4647209qvw.19
        for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2019 10:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=xAkKRCl18dUtGLIegx101F8gMb+vbOn4Uh1MduUK+cA=;
        b=est4K7iOd0gOIKuOkCXvLNERZh7+r31y1Qmf5xQnTw+WC1oqD2fkb/hysmFkNNJTV9
         XcP8NBrVioPLhqU/SMDiMHzv24VIh6QINa6LSJqQEpDHwtScG5Cosfe2FUyPvqfyketk
         5STF1JwbYMW0H6F8PNVUduJm91s1u010in0bjfAZ8mc6SLODgVFTq5VeHi78xCHFOhR8
         6dPSjEquMLfmzBDWW6jvUC7IH6PDV5kc7VPru/pgfd7+lZlhwllMgfvH1vawR/K+iClH
         iBzC0QnthPmlz+kfXeP0IRKWwqbuUNt4106YDaX0PkaoLjvc7fzbUefvRheYICz5mhS7
         up2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=xAkKRCl18dUtGLIegx101F8gMb+vbOn4Uh1MduUK+cA=;
        b=dfG7xQ0e+9W9KnaMRLw+MFE+g8ySY3QVt9Hbx2lth2TE9EnlW/keJyATMkJlRNTpqK
         l0cjQt7nvOfwj+Q+GGFYz0aK05M3gdjjQdEjaWmJUL8YjdQ+QHs9NsN08w/DPdcWZ0pF
         /JhmliW1NRMF5+0rLnaeZKNce0hGpI59wKZxhoxuvtaLBlv/4D7uQGkNFDBzFZFRBCxj
         Tpea1lvwl1YqxuOz2kOT8eS1/e6Q6T+jsgky2Vb7wxcD1gmIWEVG1tXRMdeRquvBjmuZ
         OOfREoeZfkcvi3u/fq6RVPqxV9Rxt/fIYJgnESV6XXanSitMKQYbM9AtkbI0loFxwt6D
         BKcg==
X-Gm-Message-State: APjAAAXBw1psLPX94SLhDJtFjae0Rb2qmi+QketSLewHZ74N9jiipvGl
        RbE+GUB2iiFVPbjuoek22xF+NvzM5A==
X-Google-Smtp-Source: APXvYqyZvAFjJ52Elh+x7uRX03eTBfc27kTAy4TUhGXy/ssuUFCjjrF2hCR8ahAv/1ukRiD0LLjMFJzpcQ==
X-Received: by 2002:ac8:6697:: with SMTP id d23mr9028830qtp.32.1573754664102;
 Thu, 14 Nov 2019 10:04:24 -0800 (PST)
Date:   Thu, 14 Nov 2019 19:03:01 +0100
In-Reply-To: <20191114180303.66955-1-elver@google.com>
Message-Id: <20191114180303.66955-9-elver@google.com>
Mime-Version: 1.0
References: <20191114180303.66955-1-elver@google.com>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
Subject: [PATCH v4 08/10] asm-generic, kcsan: Add KCSAN instrumentation for bitops
From:   Marco Elver <elver@google.com>
To:     elver@google.com
Cc:     akiyks@gmail.com, stern@rowland.harvard.edu, glider@google.com,
        parri.andrea@gmail.com, andreyknvl@google.com, luto@kernel.org,
        ard.biesheuvel@linaro.org, arnd@arndb.de, boqun.feng@gmail.com,
        bp@alien8.de, dja@axtens.net, dlustig@nvidia.com,
        dave.hansen@linux.intel.com, dhowells@redhat.com,
        dvyukov@google.com, hpa@zytor.com, mingo@redhat.com,
        j.alglave@ucl.ac.uk, joel@joelfernandes.org, corbet@lwn.net,
        jpoimboe@redhat.com, luc.maranget@inria.fr, mark.rutland@arm.com,
        npiggin@gmail.com, paulmck@kernel.org, peterz@infradead.org,
        tglx@linutronix.de, will@kernel.org, edumazet@google.com,
        kasan-dev@googlegroups.com, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add explicit KCSAN checks for bitops.

Signed-off-by: Marco Elver <elver@google.com>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
---
v2:
* Use kcsan_check{,_atomic}_{read,write} instead of
  kcsan_check_{access,atomic}.
---
 include/asm-generic/bitops-instrumented.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/asm-generic/bitops-instrumented.h b/include/asm-generic/bitops-instrumented.h
index ddd1c6d9d8db..864d707cdb87 100644
--- a/include/asm-generic/bitops-instrumented.h
+++ b/include/asm-generic/bitops-instrumented.h
@@ -12,6 +12,7 @@
 #define _ASM_GENERIC_BITOPS_INSTRUMENTED_H
 
 #include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
 
 /**
  * set_bit - Atomically set a bit in memory
@@ -26,6 +27,7 @@
 static inline void set_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_atomic_write(addr + BIT_WORD(nr), sizeof(long));
 	arch_set_bit(nr, addr);
 }
 
@@ -41,6 +43,7 @@ static inline void set_bit(long nr, volatile unsigned long *addr)
 static inline void __set_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_write(addr + BIT_WORD(nr), sizeof(long));
 	arch___set_bit(nr, addr);
 }
 
@@ -54,6 +57,7 @@ static inline void __set_bit(long nr, volatile unsigned long *addr)
 static inline void clear_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_atomic_write(addr + BIT_WORD(nr), sizeof(long));
 	arch_clear_bit(nr, addr);
 }
 
@@ -69,6 +73,7 @@ static inline void clear_bit(long nr, volatile unsigned long *addr)
 static inline void __clear_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_write(addr + BIT_WORD(nr), sizeof(long));
 	arch___clear_bit(nr, addr);
 }
 
@@ -82,6 +87,7 @@ static inline void __clear_bit(long nr, volatile unsigned long *addr)
 static inline void clear_bit_unlock(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_atomic_write(addr + BIT_WORD(nr), sizeof(long));
 	arch_clear_bit_unlock(nr, addr);
 }
 
@@ -97,6 +103,7 @@ static inline void clear_bit_unlock(long nr, volatile unsigned long *addr)
 static inline void __clear_bit_unlock(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_write(addr + BIT_WORD(nr), sizeof(long));
 	arch___clear_bit_unlock(nr, addr);
 }
 
@@ -113,6 +120,7 @@ static inline void __clear_bit_unlock(long nr, volatile unsigned long *addr)
 static inline void change_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_atomic_write(addr + BIT_WORD(nr), sizeof(long));
 	arch_change_bit(nr, addr);
 }
 
@@ -128,6 +136,7 @@ static inline void change_bit(long nr, volatile unsigned long *addr)
 static inline void __change_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_write(addr + BIT_WORD(nr), sizeof(long));
 	arch___change_bit(nr, addr);
 }
 
@@ -141,6 +150,7 @@ static inline void __change_bit(long nr, volatile unsigned long *addr)
 static inline bool test_and_set_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_atomic_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch_test_and_set_bit(nr, addr);
 }
 
@@ -155,6 +165,7 @@ static inline bool test_and_set_bit(long nr, volatile unsigned long *addr)
 static inline bool __test_and_set_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch___test_and_set_bit(nr, addr);
 }
 
@@ -170,6 +181,7 @@ static inline bool __test_and_set_bit(long nr, volatile unsigned long *addr)
 static inline bool test_and_set_bit_lock(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_atomic_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch_test_and_set_bit_lock(nr, addr);
 }
 
@@ -183,6 +195,7 @@ static inline bool test_and_set_bit_lock(long nr, volatile unsigned long *addr)
 static inline bool test_and_clear_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_atomic_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch_test_and_clear_bit(nr, addr);
 }
 
@@ -197,6 +210,7 @@ static inline bool test_and_clear_bit(long nr, volatile unsigned long *addr)
 static inline bool __test_and_clear_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch___test_and_clear_bit(nr, addr);
 }
 
@@ -210,6 +224,7 @@ static inline bool __test_and_clear_bit(long nr, volatile unsigned long *addr)
 static inline bool test_and_change_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_atomic_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch_test_and_change_bit(nr, addr);
 }
 
@@ -224,6 +239,7 @@ static inline bool test_and_change_bit(long nr, volatile unsigned long *addr)
 static inline bool __test_and_change_bit(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch___test_and_change_bit(nr, addr);
 }
 
@@ -235,6 +251,7 @@ static inline bool __test_and_change_bit(long nr, volatile unsigned long *addr)
 static inline bool test_bit(long nr, const volatile unsigned long *addr)
 {
 	kasan_check_read(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_atomic_read(addr + BIT_WORD(nr), sizeof(long));
 	return arch_test_bit(nr, addr);
 }
 
@@ -254,6 +271,7 @@ static inline bool
 clear_bit_unlock_is_negative_byte(long nr, volatile unsigned long *addr)
 {
 	kasan_check_write(addr + BIT_WORD(nr), sizeof(long));
+	kcsan_check_atomic_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch_clear_bit_unlock_is_negative_byte(nr, addr);
 }
 /* Let everybody know we have it. */
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

